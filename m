Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
	[209.85.166.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7B37F605F2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Feb 2020 23:54:38 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id l4so3500859ilj.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Feb 2020 15:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sntMicRM7tZkOvI3OWV+JPNIZom0cZloFjPX6D9Fk88=;
	b=n+i9fN9njAhVEX4iqWwt8FXhxHn3ur2l0VeAl1zYfDcLdTS+lkmxt4y80HsoLNCPf3
	iw8McEfm6Yvq4IitzZU4E6a/oOLMwJD4K8QqlyLBPc5TdbasGleVDEL+Y7O44eTAYPJm
	zv3/O9MbkKEQKErfvMPFOFxBmofuZq6kQ+kYgSdjVtWx3vRIxKigDgYih5oEy27YgwIp
	BlIlhtLjUvnXxQRdAF5dfP0B2tfXnZSFnsjXhq60oD5sN283Znkoc0BYyp7b/ypGNs8S
	FK5cvyMqAClTpYm4cVZ7uUop9Pqjjf6a2LpaAF0u922LkALHgBo6i91ce1EWWG7aNuUQ
	EtCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sntMicRM7tZkOvI3OWV+JPNIZom0cZloFjPX6D9Fk88=;
	b=Vytb18dWm3KP4c6oKb903YdAX4KGm/J6HWNEcG6rXNK6imMknnCZV7lkYeFpHmx5zc
	7pvS0IkWjtbGXV//O7pkBLdV4XbN0zgVupDfADNb9L2KauXnV8YIgjT2CV8v5lLbAn+V
	idSjWbs+OEXJOZD6zjuCyz2sLHUxhODz2B6Oo1ZoWl+MhxQmH27sKf+ec6w/Hs1dmLI6
	Q/iODDBvJ7HoD65v3ePnSfN2h+8I0HVI0SbJL2NeOPKg+fx1niL+0Z+goYDDDz2bu6Ev
	O3r215Tk0xs14yDqgWMHtF5gwNZuYXytPtRkrtvvC5GCRcvni0dBs2v/i/0rDa99A4ge
	Udtw==
X-Gm-Message-State: APjAAAWa8HULE55xIEwuor/EbmkQIUfxKEHAfpnkdwnqpi7YelGRkbVG
	dTgU19x771TSabENHH1nwpu2xtniDjMncqBFkeA=
X-Google-Smtp-Source: APXvYqwep0crj3hgqSOdV40DKB7pqqEllQKVDq5zkIOclpbzS/ppCbq6oEEyhTl8g7smIzLU8dtEw03E73gNJ9AFEDE=
X-Received: by 2002:a92:290a:: with SMTP id l10mr767956ilg.151.1580946879217; 
	Wed, 05 Feb 2020 15:54:39 -0800 (PST)
MIME-Version: 1.0
References: <20200125082548.12976-1-ticotimo@gmail.com>
	<513f7afe-1f2a-a8f2-70d1-63db5ddfcfde@windriver.com>
In-Reply-To: <513f7afe-1f2a-a8f2-70d1-63db5ddfcfde@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 5 Feb 2020 15:54:28 -0800
Message-ID: <CANx9H-A-31+cASuXcNuZ_jyk58+NLk46JXFXGVz1Lhup09BbRA@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "Orling, Timothy T" <timothy.t.orling@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 05 Feb 2020 23:54:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 5, 2020 at 3:18 PM Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 1/25/20 3:25 AM, Tim Orling wrote:
> > This test case is intentionally limited to only tesing one
> > python package/recipe at a time, because the use case is to
> > determine whether dependencies have been met for a minimal
> > image with 'only' the package under test installed. This
> > dependency checking must include the packages-split python
> > standard library modules that OE/YP creates from the python
> > manifest.
> >
> > TODO: Be smarter about PYTHON_IMPORTS_UNDER_TEST, as this
> >        should be discoverable from /usr/lib/python2.7/site-packages
> >        or from the rpm/deb/ipk of the python package itself.
> >        What we do NOT want to do is use pkgdata or some other
> >        magical Python script that will add dependencies to the
> >        test image. We need as pristine and minimalist a test
> >        environment as we can get.
> >
> > TODO: Use a minimal master test image and install the package under
> >        test from a package feed using a package manager in the master
> >        test image. This would allow for much shorter developement
> >        cycles.
> >
> > TODO: Parse the ImportError and give hints about what dependencies
> >        are missing.
>
> This looks useful. Do you have the python3 version done but not sent
> or should Trevor see if he can get that to work?
>
> >
> > Example configuration in local.conf:
> >
> > IMAGE_CLASSES += " testimage"
> > DISTRO_FEAURES_append = " ptest"
> > EXTRA_IMAGE_FEATURES = "debug-tweaks"
> > TESTIMAGE_AUTO = "1"
> > TEST_SUITES = " ping ssh python2 ptest python2_module"
> > TEST_QEMUPARAMS += "-smp 4 -m 8192"
> > TEST_RUNQEMUPARAMS += "kvm gl"
> > IMAGE_ROOTFS_SIZE ?= "8192"
> > IMAGE_ROOTFS_EXTRA_SPACE_append =
> "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
> > IMAGE_INSTALL_append = " ptest-runner dropbear procps coreutils iproute2
> sysstat"
> Is this really a minimal set of dependencies and if so, why do you need:
>     procps coreutils iproute2 sysstat
> ?
>
>
Those are required to make the QEMU runner dump any missing things, like
TUN/TAP. So no, not required. The
host_dump stuff isn't really all that helpful anyway. If you can run
"testimage" with KVM, TUN/TAP and virgl/gl then
you have all the speed ups that I was trying to make sure were working on
the platform running these tests (with gitlab ci runner)

The fact that the docker-executor in gitlab does not allow the --add-groups
option to the docker command line gets in the way
anyway... so you would have to run the container privileged and I'm not
going to do that ;)

The user in the docker container does not have permissions on  /dev/kvm,
etc. But that has nothing to do with this code :)


> I should probably try it before replying but
> it's already been a long day!
>
> ../Randy
>
> > PYTHON_PACKAGE_UNDER_TEST = "python-pymongo"
> > IMAGE_INSTALL_append = " ${PYTHON_PACKAGE_UNDER_TEST}"
> > PYTHON_IMPORTS_UNDER_TEST = "bson gridfs pymongo"
> >
> > Signed-off-by: Tim Orling <ticotimo@gmail.com>
> > ---
> >   lib/oeqa/runtime/cases/python2_module.py | 97 ++++++++++++++++++++++++
> >   1 file changed, 97 insertions(+)
> >   create mode 100644 lib/oeqa/runtime/cases/python2_module.py
> >
> > diff --git a/lib/oeqa/runtime/cases/python2_module.py
> b/lib/oeqa/runtime/cases/python2_module.py
> > new file mode 100644
> > index 00000000..59ae00fb
> > --- /dev/null
> > +++ b/lib/oeqa/runtime/cases/python2_module.py
> > @@ -0,0 +1,97 @@
> > +#
> > +# SPDX-License-Identifier: MIT
> > +#
> > +
> > +import os
> > +
> > +from oeqa.runtime.case import OERuntimeTestCase
> > +from oeqa.core.decorator.depends import OETestDepends
> > +from oeqa.core.decorator.data import OETestDataDepends
> > +from oeqa.runtime.decorator.package import OEHasPackage
> > +
> > +
> > +class PythonModuleTest(OERuntimeTestCase):
> > +    """This test case is intentionally limited to only tesing one
> > +       python package/recipe at a time, because the use case is to
> > +       determine whether dependencies have been met for a minimal
> > +       image with 'only' the package under test installed. This
> > +       dependency checking must include the packages-split python
> > +       standard library modules that OE/YP creates from the python
> > +       manifest.
> > +
> > +       TODO: Be smarter about PYTHON_IMPORTS_UNDER_TEST, as this
> > +             should be discoverable from
> /usr/lib/python2.7/site-packages
> > +             or from the rpm/deb/ipk of the python package itself.
> > +             What we do NOT want to do is use pkgdata or some other
> > +             magical Python script that will add dependencies to the
> > +             test image. We need as pristine and minimalist a test
> > +             environment as we can get.
> > +
> > +       TODO: Use a minimal master test image and install the package
> under
> > +             test from a package feed using a package manager in the
> master
> > +             test image. This would allow for much shorter developement
> > +             cycles.
> > +
> > +       TODO: Parse the ImportError and give hints about what
> dependencies
> > +             are missing.
> > +
> > +
> > +       Example configuration in local.conf:
> > +
> > +       IMAGE_CLASSES += " testimage"
> > +       DISTRO_FEAURES_append = " ptest"
> > +       EXTRA_IMAGE_FEATURES = "debug-tweaks"
> > +       TESTIMAGE_AUTO = "1"
> > +       TEST_SUITES = " ping ssh python2 ptest python2_module"
> > +       TEST_QEMUPARAMS += "-smp 4 -m 8192"
> > +       TEST_RUNQEMUPARAMS += "kvm gl"
> > +       IMAGE_ROOTFS_SIZE ?= "8192"
> > +       IMAGE_ROOTFS_EXTRA_SPACE_append =
> "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "", d)}"
> > +       IMAGE_INSTALL_append = " ptest-runner dropbear procps coreutils
> iproute2 sysstat"
> > +       PYTHON_PACKAGE_UNDER_TEST = "python-engineio"
> > +       IMAGE_INSTALL_append = " ${PYTHON_PACKAGE_UNDER_TEST}"
> > +       PYTHON_IMPORTS_UNDER_TEST = "engineio"
> > +    """
> > +
> > +    package = ""
> > +    imports = []
> > +
> > +    @classmethod
> > +    def setUp(cls):
> > +        if 'PYTHON_PACKAGE_UNDER_TEST' in cls.tc.td:
> > +            cls.package = cls.tc.td.get('PYTHON_PACKAGE_UNDER_TEST')
> > +            cls.logger.debug('Running import test on "%s" recipe' %
> cls.package)
> > +        else:
> > +            cls.logger.error('No recipe to test found in
> configuration.\n'
> > +                             'Please set in PYTHON_PACKAGE_UNDER_TEST')
> > +        if 'PYTHON_IMPORTS_UNDER_TEST' in cls.tc.td:
> > +            cls.imports =
> cls.tc.td.get('PYTHON_IMPORTS_UNDER_TEST').split()
> > +            if isinstance(cls.imports, list) and len(cls.imports) > 0:
> > +                cls.logger.info('Importing from %s' % cls.imports)
> > +            else:
> > +                cls.logger.error("PYTHON_IMPORTS_UNDER_TEST should be a
> space delimited list")
> > +                cls.logger.error("typeof(PYTHON_IMPORTS_UNDER_TEST) is
> %s" % type(cls.imports))
> > +        else:
> > +            cls.logger.error("No modules to import found in
> configuration.\n"
> > +                             "Please set in variable
> PYTHON_IMPORTS_UNDER_TEST")
> > +
> > +
> > +class PythonModuleImportTest(PythonModuleTest):
> > +    @OETestDepends(['ssh.SSHTest.test_ssh'])
> > +    @OETestDepends(['python2.PythonTest.test_python'])
> > +    @OETestDataDepends(['PYTHON_PACKAGE_UNDER_TEST'])
> > +    @OETestDataDepends(['PYTHON_IMPORTS_UNDER_TEST'])
> > +    def test_python_module(self):
> > +        # We can't use the OEHasPackage decorator, because 'package'
> isn't defined
> > +        # until the class has already been instantiated
> > +        msg = 'Checking if "%s" is installed' % self.package
> > +        self.logger.debug(msg)
> > +        if not self.package in self.tc.image_packages:
> > +            msg = 'Test requires "%s" to be installed' % self.package
> > +            self.skipTest(msg)
> > +
> > +        for python_import in self.imports:
> > +            cmd = 'python -c "import %s"' % python_import
> > +            status, output = self.target.run(cmd)
> > +            msg = 'Exit status was not 0. Output: %s' % output
> > +            self.assertEqual(status, 0, msg=msg)
> >
>
>
> --
> # Randy MacLeod
> # Wind River Linux
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

