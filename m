Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthieu.poullet@gmail.com>) id 1LlPVR-0005oY-5g
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Mar 2009 16:22:33 +0100
Received: by bwz19 with SMTP id 19so1356922bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Mar 2009 08:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:received:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=VcQsoaRL4/duAV8D4h4hsIQq6u1Bt574lHd6EC+WuX4=;
	b=OpK7XgkNpQA68DdF5SwuFUvy2p76rAioRpq+b1yirF97G7nHV8pGzgAUvqUoi9auLO
	TcHbmE0sSm0jDzf44/AyZDRkVKcRadDBMwSvaSFodSGFeC9zSvHtbvR/QyLOI9mId5V9
	ykVnQv/rhjNBO2ucake4NwF9nasV8pJNplFG8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=WIRoSYdf/jAlDKNu3lSPPT2GSq8IZtOopl/nzJ/pQlXN4Ail/MJs5U6ovAI+qtUTPN
	QxWfEwDofDLNE0HrHAxSZz8x3UHjh9VQrYudDJaC+BIW2hZU8d7A8Zzxju47UJSiHhsu
	apJplMDczrZk21oEwgMM9uWyXsSOkD2/i8lR0=
MIME-Version: 1.0
Date: Sun, 22 Mar 2009 16:20:59 +0100
Received: by 10.223.108.75 with SMTP id e11mr5122480fap.51.1237735274672; Sun, 
	22 Mar 2009 08:21:14 -0700 (PDT)
Message-ID: <80a0c20d0903220820q5b763250y46f12b95f46ec280@mail.gmail.com>
From: Matthieu Poullet <matthieu.poullet@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: opkg-native breaks when using packaged-staging
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
X-List-Received-Date: Sun, 22 Mar 2009 15:22:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I'm still struggling with the packaged-staging method.
I've redone a console-image for BB from scratch.

Here is my local.conf:
# Distribution & Machine
DISTRO = "angstrom-2008.1"
MACHINE = "beagleboard"
# Locale
ENABLE_BINARY_LOCALE_GENERATION = "0"
# SMP Support
BB_NUMBER_THREADS = "4"
PARALLEL_MAKE = "-j 4"
# TI Tools
TITOOLSDIR = "${OE_HOME}/opt/ti-tools"
TIBIOSDIR = "bios_5_33_02"
TIXDCTOOLSDIR = "xdctools_3_10_03"
TICGTOOLSDIR = "cg6x_6_0_21"
# packaged-staging
INHERIT += "packaged-staging"
# Directories structure
TMPDIR = "${OE_HOME}/tmp"
DL_DIR = "${OE_HOME}/sources"
DEPLOY_DIR = "${OE_HOME}/archives"
DEPLOY_DIR_PSTAGE = "${DEPLOY_DIR}/pstage"

and I've modified angstrom.inc so that it uses my DEPLOY_DIR:
DEPLOY_DIR ?= "${TMPDIR}/deploy/${ANGSTROMLIBC}"

The first pass works 100% well, I've got the following structure under
~/oe/archives:
archives/
archives/pstage
archives/pstage/angstromglibc-home-mpoullet-oe-tmp-home-mpoullet-oe-tmp
archives/pstage/angstromglibc
archives/pstage/pstaging_lists
archives/images
archives/images/beagleboard
archives/images/beagleboard/Angstrom-console-image-glibc-ipk-2009.X-test-20090322-beagleboard-testlab
archives/ipk
archives/ipk/beagleboard
archives/ipk/armv7a
archives/ipk/armv7a/morgue
archives/ipk/all

Then I delete the ~/oe/tmp dir and restart a clean new console-image build.
It still breaks near the end because of an opkg-native issue:

NOTE: package stagemanager-native-0.0.1-r11: task do_package_stage: started
NOTE: package stagemanager-native-0.0.1-r11: task do_package_stage: completed
staging-opkg-native-i686-linux - 0.1.6+svnr204-r3 -
 * Package staging-opkg-native-i686-linux version 0.1.6+svnr204-r3 has
no architecture specified, defaulting to i686-linux.
NOTE: Yes. Uninstalling package from staging...
Installing staging-makedevs-native-i686-linux (1.0.0-r6) to root...
Configuring staging-makedevs-native-i686-linux
sh: rm: command not found
Removing package staging-opkg-native-i686-linux from root...
Collected errors:
 * Package staging-m4-native-i686-linux version 1.4.12-r0 has no
architecture specified, defaulting to i686-linux.
 * Package staging-quilt-native-i686-linux version 0.46-r2 has no
architecture specified, defaulting to i686-linux.
 * Package staging-autoconf-native-i686-linux version 2.61-r1 has no
architecture specified, defaulting to i686-linux.
 * Package staging-gnu-config-native-i686-linux version
0.1+cvs20050701-r5 has no architecture specified, defaulting to
i686-linux.
 * Package staging-automake-native-i686-linux version 1.10.2-r0 has no
architecture specified, defaulting to i686-linux.
<...>
 * Package staging-mtd-utils-native-i686-linux version 1.0.0+git-r8
has no architecture specified, defaulting to i686-linux.
 * Package staging-opkg-native-i686-linux version 0.1.6+svnr204-r3 has
no architecture specified, defaulting to i686-linux.
NOTE: package console-image-1.0-r0: task do_package: started
NOTE: package console-image-1.0-r0: task do_package: completed
sh: /home/mpoullet/oe/tmp/staging/i686-linux/usr/bin/opkg-cl: No such
file or directory
sh: /home/mpoullet/oe/tmp/staging/i686-linux/usr/bin/opkg-cl: No such
file or directory
ERROR: Couldn't install the staging package to a temp directory
ERROR: Error in executing:
/home/mpoullet/oe/openembedded/recipes/opkg/opkg-native_svn.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Error in executing:
/home/mpoullet/oe/openembedded/recipes/opkg/opkg-native_svn.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Error in executing:
/home/mpoullet/oe/openembedded/recipes/opkg/opkg-native_svn.bb
ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
ERROR: Printing the environment of the function
ERROR: Build of
/home/mpoullet/oe/openembedded/recipes/opkg/opkg-native_svn.bb
do_setscene failed
NOTE: Failure installing prestage package
NOTE: package makedevs-native-1.0.0-r6: task do_setscene: completed
NOTE: Running task 2128 of 2249 (ID: 9,
/home/mpoullet/oe/openembedded/recipes/images/console-image.bb,
do_populate_staging)
NOTE: package console-image-1.0-r0: task do_populate_staging: started
NOTE: package console-image-1.0-r0: task do_populate_staging: completed
NOTE: Running task 2129 of 2249 (ID: 17,
/home/mpoullet/oe/openembedded/recipes/images/console-image.bb,
do_package_write_ipk)
ERROR: Task 44 (/home/mpoullet/oe/openembedded/recipes/opkg/opkg-native_svn.bb,
do_setscene) failed
NOTE: Waiting for 3 active tasks to finish
NOTE: 1: /home/mpoullet/oe/openembedded/recipes/images/console-image.bb,
do_populate_staging (12266)
NOTE: 2: /home/mpoullet/oe/openembedded/recipes/makedevs/makedevs-native_1.0.0.bb,
do_setscene (6119)
NOTE: 3: /home/mpoullet/oe/openembedded/recipes/images/console-image.bb,
do_package_write_ipk (12272)
NOTE: package console-image-1.0-r0: task do_package_write_ipk: started
NOTE: package console-image-1.0-r0: task do_package_write_ipk: completed
NOTE: Waiting for 2 active tasks to finish
NOTE: 1: /home/mpoullet/oe/openembedded/recipes/images/console-image.bb,
do_populate_staging (12266)
NOTE: 2: /home/mpoullet/oe/openembedded/recipes/images/console-image.bb,
do_package_write_ipk (12272)
NOTE: Waiting for 1 active tasks to finish
NOTE: 1: /home/mpoullet/oe/openembedded/recipes/images/console-image.bb,
do_package_write_ipk (12272)
NOTE: Tasks Summary: Attempted 2125 tasks of which 1922 didn't need to
be rerun and 1 failed.
ERROR: '/home/mpoullet/oe/openembedded/recipes/opkg/opkg-native_svn.bb' failed
NOTE: build 200903221549: completed

If I remove the
archives/pstage/angstromglibc-home-mpoullet-oe-tmp-home-mpoullet-oe-tmp/staging-opkg-native-i686-linux_0.1.6+svnr204-r3_i686-linux.ipk
package, and restart (letting the new temp untouched), then it
rebuilds opkg-native and it works!

Has someone an idea on how to fix this behaviour?

Regards,
Matthieu.


