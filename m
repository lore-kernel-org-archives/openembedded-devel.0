Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F63D60572
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 23:18:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 015NHkf7031548
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 5 Feb 2020 15:17:56 -0800
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 5 Feb 2020 15:17:35 -0800
To: <openembedded-devel@lists.openembedded.org>, "Orling, Timothy T"
	<timothy.t.orling@intel.com>
References: <20200125082548.12976-1-ticotimo@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <513f7afe-1f2a-a8f2-70d1-63db5ddfcfde@windriver.com>
Date: Wed, 5 Feb 2020 18:17:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200125082548.12976-1-ticotimo@gmail.com>
X-Originating-IP: [172.25.44.8]
Subject: Re: [meta-python2][RFC] lib/oeqa/runtime/cases/python2_module.py: add test
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Feb 2020 23:18:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 1/25/20 3:25 AM, Tim Orling wrote:
> This test case is intentionally limited to only tesing one
> python package/recipe at a time, because the use case is to
> determine whether dependencies have been met for a minimal
> image with 'only' the package under test installed. This
> dependency checking must include the packages-split python
> standard library modules that OE/YP creates from the python
> manifest.
> 
> TODO: Be smarter about PYTHON_IMPORTS_UNDER_TEST, as this
>        should be discoverable from /usr/lib/python2.7/site-packages
>        or from the rpm/deb/ipk of the python package itself.
>        What we do NOT want to do is use pkgdata or some other
>        magical Python script that will add dependencies to the
>        test image. We need as pristine and minimalist a test
>        environment as we can get.
> 
> TODO: Use a minimal master test image and install the package under
>        test from a package feed using a package manager in the master
>        test image. This would allow for much shorter developement
>        cycles.
> 
> TODO: Parse the ImportError and give hints about what dependencies
>        are missing.

This looks useful. Do you have the python3 version done but not sent
or should Trevor see if he can get that to work?

> 
> Example configuration in local.conf:
> 
> IMAGE_CLASSES += " testimage"
> DISTRO_FEAURES_append = " ptest"
> EXTRA_IMAGE_FEATURES = "debug-tweaks"
> TESTIMAGE_AUTO = "1"
> TEST_SUITES = " ping ssh python2 ptest python2_module"
> TEST_QEMUPARAMS += "-smp 4 -m 8192"
> TEST_RUNQEMUPARAMS += "kvm gl"
> IMAGE_ROOTFS_SIZE ?= "8192"
> IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
> IMAGE_INSTALL_append = " ptest-runner dropbear procps coreutils iproute2 sysstat"
Is this really a minimal set of dependencies and if so, why do you need:
    procps coreutils iproute2 sysstat
?

I should probably try it before replying but
it's already been a long day!

../Randy

> PYTHON_PACKAGE_UNDER_TEST = "python-pymongo"
> IMAGE_INSTALL_append = " ${PYTHON_PACKAGE_UNDER_TEST}"
> PYTHON_IMPORTS_UNDER_TEST = "bson gridfs pymongo"
> 
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
> ---
>   lib/oeqa/runtime/cases/python2_module.py | 97 ++++++++++++++++++++++++
>   1 file changed, 97 insertions(+)
>   create mode 100644 lib/oeqa/runtime/cases/python2_module.py
> 
> diff --git a/lib/oeqa/runtime/cases/python2_module.py b/lib/oeqa/runtime/cases/python2_module.py
> new file mode 100644
> index 00000000..59ae00fb
> --- /dev/null
> +++ b/lib/oeqa/runtime/cases/python2_module.py
> @@ -0,0 +1,97 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +import os
> +
> +from oeqa.runtime.case import OERuntimeTestCase
> +from oeqa.core.decorator.depends import OETestDepends
> +from oeqa.core.decorator.data import OETestDataDepends
> +from oeqa.runtime.decorator.package import OEHasPackage
> +
> +
> +class PythonModuleTest(OERuntimeTestCase):
> +    """This test case is intentionally limited to only tesing one
> +       python package/recipe at a time, because the use case is to
> +       determine whether dependencies have been met for a minimal
> +       image with 'only' the package under test installed. This
> +       dependency checking must include the packages-split python
> +       standard library modules that OE/YP creates from the python
> +       manifest.
> +
> +       TODO: Be smarter about PYTHON_IMPORTS_UNDER_TEST, as this
> +             should be discoverable from /usr/lib/python2.7/site-packages
> +             or from the rpm/deb/ipk of the python package itself.
> +             What we do NOT want to do is use pkgdata or some other
> +             magical Python script that will add dependencies to the
> +             test image. We need as pristine and minimalist a test
> +             environment as we can get.
> +
> +       TODO: Use a minimal master test image and install the package under
> +             test from a package feed using a package manager in the master
> +             test image. This would allow for much shorter developement
> +             cycles.
> +
> +       TODO: Parse the ImportError and give hints about what dependencies
> +             are missing.
> +
> +
> +       Example configuration in local.conf:
> +
> +       IMAGE_CLASSES += " testimage"
> +       DISTRO_FEAURES_append = " ptest"
> +       EXTRA_IMAGE_FEATURES = "debug-tweaks"
> +       TESTIMAGE_AUTO = "1"
> +       TEST_SUITES = " ping ssh python2 ptest python2_module"
> +       TEST_QEMUPARAMS += "-smp 4 -m 8192"
> +       TEST_RUNQEMUPARAMS += "kvm gl"
> +       IMAGE_ROOTFS_SIZE ?= "8192"
> +       IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
> +       IMAGE_INSTALL_append = " ptest-runner dropbear procps coreutils iproute2 sysstat"
> +       PYTHON_PACKAGE_UNDER_TEST = "python-engineio"
> +       IMAGE_INSTALL_append = " ${PYTHON_PACKAGE_UNDER_TEST}"
> +       PYTHON_IMPORTS_UNDER_TEST = "engineio"
> +    """
> +
> +    package = ""
> +    imports = []
> +
> +    @classmethod
> +    def setUp(cls):
> +        if 'PYTHON_PACKAGE_UNDER_TEST' in cls.tc.td:
> +            cls.package = cls.tc.td.get('PYTHON_PACKAGE_UNDER_TEST')
> +            cls.logger.debug('Running import test on "%s" recipe' % cls.package)
> +        else:
> +            cls.logger.error('No recipe to test found in configuration.\n'
> +                             'Please set in PYTHON_PACKAGE_UNDER_TEST')
> +        if 'PYTHON_IMPORTS_UNDER_TEST' in cls.tc.td:
> +            cls.imports = cls.tc.td.get('PYTHON_IMPORTS_UNDER_TEST').split()
> +            if isinstance(cls.imports, list) and len(cls.imports) > 0:
> +                cls.logger.info('Importing from %s' % cls.imports)
> +            else:
> +                cls.logger.error("PYTHON_IMPORTS_UNDER_TEST should be a space delimited list")
> +                cls.logger.error("typeof(PYTHON_IMPORTS_UNDER_TEST) is %s" % type(cls.imports))
> +        else:
> +            cls.logger.error("No modules to import found in configuration.\n"
> +                             "Please set in variable PYTHON_IMPORTS_UNDER_TEST")
> +
> +
> +class PythonModuleImportTest(PythonModuleTest):
> +    @OETestDepends(['ssh.SSHTest.test_ssh'])
> +    @OETestDepends(['python2.PythonTest.test_python'])
> +    @OETestDataDepends(['PYTHON_PACKAGE_UNDER_TEST'])
> +    @OETestDataDepends(['PYTHON_IMPORTS_UNDER_TEST'])
> +    def test_python_module(self):
> +        # We can't use the OEHasPackage decorator, because 'package' isn't defined
> +        # until the class has already been instantiated
> +        msg = 'Checking if "%s" is installed' % self.package
> +        self.logger.debug(msg)
> +        if not self.package in self.tc.image_packages:
> +            msg = 'Test requires "%s" to be installed' % self.package
> +            self.skipTest(msg)
> +
> +        for python_import in self.imports:
> +            cmd = 'python -c "import %s"' % python_import
> +            status, output = self.target.run(cmd)
> +            msg = 'Exit status was not 0. Output: %s' % output
> +            self.assertEqual(status, 0, msg=msg)
> 


-- 
# Randy MacLeod
# Wind River Linux

