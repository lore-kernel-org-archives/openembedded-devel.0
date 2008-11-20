Received: from [128.178.224.219] (helo=smtp0.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1L37aH-0007vI-NM
	for openembedded-devel@openembedded.org; Thu, 20 Nov 2008 12:20:29 +0100
Received: (qmail 9024 invoked by uid 107); 20 Nov 2008 11:17:54 -0000
Received: from mailav3.epfl.ch (128.178.50.11)
	by smtp0.epfl.ch with SMTP; 20 Nov 2008 11:17:54 -0000
Received: from (unknown [128.178.224.219]) by mailav3.epfl.ch with smtp
	id 5442_e08261ec_b6f4_11dd_838b_0014221528b0;
	Thu, 20 Nov 2008 12:17:54 +0100
Received: from lsa1pc7.epfl.ch (128.178.145.53) (authenticated)
	by smtp0.epfl.ch (AngelmatoPhylax SMTP proxy);
	Thu, 20 Nov 2008 12:17:54 +0100
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Nov 2008 12:17:53 +0100
User-Agent: KMail/1.10.3 (Linux/2.6.27-7-generic; KDE/4.1.3; i686; ; )
MIME-Version: 1.0
Message-Id: <200811201217.53635.valentin.longchamp@epfl.ch>
Subject: sanity test failure at the end of build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Nov 2008 11:20:30 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I have seen various people that have experienced the same problem during the 
last months, but I have never read a clear answer or fix to what is wrong with 
this issue.

OE builds just fine all the needed packages for my system, but in the I get a 
failed sanity check for various libraries. Here is the log for a console-image 
for instance:

> NOTE: Running task 1589 of 1960 (ID: 217,
> /usr/local/OE/openembedded/packages/angstrom/angstrom-version.bb,
> do_populate_staging) NOTE: package angstrom-version-2008.1-test-20081120:
> started
> NOTE: package angstrom-version-1_2008.1-test-20081120-r1: task
> do_populate_staging: started NOTE: package
> angstrom-version-1_2008.1-test-20081120-r1: task do_populate_staging:
> completed NOTE: package angstrom-version-2008.1-test-20081120: completed
> NOTE: Running task 1861 of 1960 (ID: 216,
> /usr/local/OE/openembedded/packages/angstrom/angstrom-version.bb,
> do_package_write) NOTE: package angstrom-version-2008.1-test-20081120:
> started
> NOTE: package angstrom-version-1_2008.1-test-20081120-r1: task
> do_package_write: started NOTE: package
> angstrom-version-1_2008.1-test-20081120-r1: task do_package_write:
> completed NOTE: package angstrom-version-2008.1-test-20081120: completed
> NOTE: Running task 1862 of 1960 (ID: 215,
> /usr/local/OE/openembedded/packages/angstrom/angstrom-version.bb,
> do_package_stage) NOTE: package angstrom-version-2008.1-test-20081120:
> started
> NOTE: package angstrom-version-1_2008.1-test-20081120-r1: task
> do_package_stage: started NOTE: package
> angstrom-version-1_2008.1-test-20081120-r1: task do_package_stage:
> completed NOTE: package angstrom-version-2008.1-test-20081120: completed
> NOTE: Running task 1892 of 1960 (ID: 5,
> /usr/local/OE/openembedded/packages/images/console-image.bb, do_qa_staging)
> NOTE: package console-image-1.0: started
> NOTE: package console-image-1.0-r0: task do_qa_staging: started
> NOTE: QA checking staging
> ERROR: QA Issue: libpanel.la failed sanity test (workdir) in path
> /usr/local/OE/angstrom//staging/armv6-angstrom-linux-gnueabi/usr/lib ERROR:
> QA Issue: libncurses.la failed sanity test (workdir) in path
> /usr/local/OE/angstrom//staging/armv6-angstrom-linux-gnueabi/usr/lib ERROR:
> QA Issue: libmenu.la failed sanity test (workdir) in path
> /usr/local/OE/angstrom//staging/armv6-angstrom-linux-gnueabi/usr/lib ERROR:
> QA Issue: libform.la failed sanity test (workdir) in path
> /usr/local/OE/angstrom//staging/armv6-angstrom-linux-gnueabi/usr/lib ERROR:
> QA staging was broken by the package built above
> ERROR: Error in executing:
> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
> ERROR: Printing the environment of the function
> ERROR: Build of /usr/local/OE/openembedded/packages/images/console-image.bb
> do_qa_staging failed ERROR: Task 5
> (/usr/local/OE/openembedded/packages/images/console-image.bb,
> do_qa_staging) failed NOTE: Waiting for 1 active tasks to finish
> NOTE: 1: /usr/local/OE/openembedded/packages/gnutls/gnutls_2.4.2.bb,
> do_configure (13056) NOTE: package gnutls-2.4.2-r3: task do_configure:
> completed
> NOTE: package gnutls-2.4.2: completed
> NOTE: Tasks Summary: Attempted 1890 tasks of which 1873 didn't need to be
> rerun and 1 failed. ERROR:
> '/usr/local/OE/openembedded/packages/images/console-image.bb' failed

I had read that this could have something to do with the fact that -tmp was in 
the name of the tmp build dir. However it is not the case for me and the 
problem is still here. Here is my local.conf file:

> # Where to store sources
> DL_DIR = "/usr/local/OE/downloads"
>
> # Which files do we want to parse:
> BBFILES := "/usr/local/OE/openembedded/packages/*/*.bb"
> BBMASK = ""
>
> # qemu has a few problems with our architecture
> #ENABLE_BINARY_LOCALE_GENERATION = "0"
> # We only need a few locales
> # does not work with ENABLE_BINARY_LOCALE_GENERATION = "0"
> GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 fr_CH.UTF-8"
>
> # ccache always overfill $HOME....
> CCACHE=""
>
> # What kind of images do we want?
> IMAGE_FSTYPES = "jffs2 tar.gz"
>
> # Set TMPDIR instead of defaulting it to $pwd/tmp
> TMPDIR = "/usr/local/OE/${DISTRO}/"
>
> # Make use of my SMP box
> PARALLEL_MAKE="-j4"
> BB_NUMBER_THREADS = "2"
>
> # Set the Distro
> DISTRO = "angstrom-2008.1"
>
> # 'uclibc' or 'glibc' or 'eglibc'
> #ANGSTROM_MODE = "glibc"
>
> MACHINE = "mx31moboard"

Thank you for your help, that would be really nice to fix this, because I am 
not able to build rootfs images at this point because of this problem.

Regards

Valentin


