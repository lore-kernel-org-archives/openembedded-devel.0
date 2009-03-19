Received: from [209.85.128.186] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthieu.poullet@gmail.com>) id 1LkQGb-0008OU-1x
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 22:59:09 +0100
Received: by fk-out-0910.google.com with SMTP id z22so282501fkz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2009 14:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=48R3yJrBSQ3WGU2+V51UPy7V2lDR5qbg53biQrD+KBc=;
	b=XdQng1F69BrJGG9MNbBLf601kwQOyRIY2INLKPiWk0UwBSD5XEv3UUWAfagXCCjDYw
	vEphWsYCYARof8cVjpbY4wEBVGoupKseyp5H7t1igeXDA+JrDjEnZh1l84X/32dx0M0U
	IG6rXq+qLijFUku44fM+3x0xmZgxIBBqT/o5Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=w4jMyKRZseG7rv9PJSm1lZ6kWJoXtfAfzQNVVb/IqHz0mEaF+9X9M4hZ/PTAVecNAe
	YUMzps3uq6F/JF3YI/Qpu63ov/0Jp6ggcl3Ez7tk6RXqGjOTq6nviFRui4rEWzCjoIeF
	4a6K2tmxu7gbgXo+C/5YHcadbo3aGBdp1/Bdc=
MIME-Version: 1.0
Received: by 10.223.113.68 with SMTP id z4mr2548604fap.72.1237499890074; Thu, 
	19 Mar 2009 14:58:10 -0700 (PDT)
Date: Thu, 19 Mar 2009 22:58:10 +0100
Message-ID: <80a0c20d0903191458m2c450cb3se2ed0c2ef2680c78@mail.gmail.com>
From: Matthieu Poullet <matthieu.poullet@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: packaged-staging not working properly
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
X-List-Received-Date: Thu, 19 Mar 2009 21:59:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I'd like to use the packaged-staging capability of OE.
I'm building the console-image for the BB using the dev branch.

My local.conf is as follow:
DISTRO = "angstrom-2008.1"
TMPDIR = "${OE_HOME}/tmp"
MACHINE = "beagleboard"
ENABLE_BINARY_LOCALE_GENERATION = "1"
BB_NUMBER_THREADS = "4"
PARALLEL_MAKE = "-j 4"
# TI Tools
TITOOLSDIR = "${OE_HOME}/opt/ti-tools"
TIBIOSDIR = "bios_5_33_02"
TIXDCTOOLSDIR = "xdctools_3_10_03"
TICGTOOLSDIR = "cg6x_6_0_21"
# packaged-staging
INHERIT += "packaged-staging"
DEPLOY_DIR_PSTAGE = "${OE_HOME}/archives"
DL_DIR = "${OE_HOME}/sources"

The first build works 100% resulting in a "archives" dir in "~oe" with
the following structure in it:
mpoullet@LU84-mpoullet:~/oe/archives$ find . -type d
.
./angstromglibc-home-mpoullet-oe-tmp-home-mpoullet-oe-tmp
./angstromglibc
./pstaging_lists

and in there there are a lot of ipks all beginning with staging-*.ipk

So far I need to remove the opkg-native package from the
DEPLOY_DIR_PSTAGE first to avoid issues during the second build
(thanks to kergoth on #oe).
The problem is that it tries to use the staging package of opkg-cl,
but opkg-cl wasn't installed yet, so it couldn't be used to install
himself?!

Then I remove my tmp dir and start the second build which seems as
fast as light until the last steps:
NOTE: Running task 2247 of 2249 (ID: 10,
/home/mpoullet/oe/openembedded/packages/images/console-image.bb,
do_rootfs)
NOTE: package opkg-native-0.1.6+svnr204: started
NOTE: package opkg-native-0.1.6+svnr204-r3: task do_package_stage: started
NOTE: package console-image-1.0: started
NOTE: package console-image-1.0-r0: task do_rootfs: started
ERROR: function do_rootfs failed
ERROR: see log in
/home/mpoullet/oe/tmp/work/beagleboard-angstrom-linux-gnueabi/console-image-1.0-r0/temp/log.do_rootfs.29204
NOTE: Task failed:
/home/mpoullet/oe/tmp/work/beagleboard-angstrom-linux-gnueabi/console-image-1.0-r0/temp/log.do_rootfs.29204
NOTE: package console-image-1.0-r0: task do_rootfs: failed
ERROR: TaskFailed event exception, aborting
NOTE: package console-image-1.0: failed
ERROR: Build of
/home/mpoullet/oe/openembedded/packages/images/console-image.bb
do_rootfs failed
NOTE: package opkg-native-0.1.6+svnr204-r3: task do_package_stage: completed
NOTE: package opkg-native-0.1.6+svnr204: completed
ERROR: Task 10 (/home/mpoullet/oe/openembedded/packages/images/console-image.bb,
do_rootfs) failed
NOTE: Waiting for 1 active tasks to finish
NOTE: 1: /home/mpoullet/oe/openembedded/packages/opkg/opkg-native_svn.bb,
do_package_stage (29203)
NOTE: Tasks Summary: Attempted 2245 tasks of which 2024 didn't need to
be rerun and 1 failed.
ERROR: '/home/mpoullet/oe/openembedded/packages/images/console-image.bb' failed
NOTE: build 200903192216: completed


mpoullet@LU84-mpoullet:~/oe$ tail
/home/mpoullet/oe/tmp/work/beagleboard-angstrom-linux-gnueabi/console-image-1.0-r0/temp/log.do_rootfs.29204
+ for devtable in /home/mpoullet/oe/openembedded/files/device_table-minimal.txt
+ makedevs -r /home/mpoullet/oe/tmp/rootfs -D
/home/mpoullet/oe/openembedded/files/device_table-minimal.txt
+ rootfs_ipk_do_rootfs
+ set -x
+ package_update_index_ipk
+ set -x
+ ipkgarchs='all any noarch arm  armv4 armv4t armv5te armv6 armv7
armv7a beagleboard'
+ '[' '!' -z '' ']'
+ touch /home/mpoullet/oe/tmp/deploy/glibc/ipk/Packages
touch: cannot touch `/home/mpoullet/oe/tmp/deploy/glibc/ipk/Packages':
No such file or directory

At this point there's indeed no ipk dir there... but why the hell is
he looking for them here?!

So I've tried to help him:
mkdir -p /home/mpoullet/oe/tmp/deploy/glibc/ipk/

And then the next issue is:
NOTE: package console-image-1.0: completed
ERROR: function do_rootfs failed
ERROR: see log in
/home/mpoullet/oe/tmp/work/beagleboard-angstrom-linux-gnueabi/console-image-1.0-r0/temp/log.do_rootfs.29603
NOTE: Task failed:
/home/mpoullet/oe/tmp/work/beagleboard-angstrom-linux-gnueabi/console-image-1.0-r0/temp/log.do_rootfs.29603
NOTE: package console-image-1.0-r0: task do_rootfs: failed
ERROR: TaskFailed event exception, aborting
NOTE: package console-image-1.0: failed
ERROR: Build of
/home/mpoullet/oe/openembedded/packages/images/console-image.bb
do_rootfs failed
ERROR: Task 10 (/home/mpoullet/oe/openembedded/packages/images/console-image.bb,
do_rootfs) failed
NOTE: Tasks Summary: Attempted 2247 tasks of which 2246 didn't need to
be rerun and 1 failed.
ERROR: '/home/mpoullet/oe/openembedded/packages/images/console-image.bb' failed
NOTE: build 200903192246: completed


mpoullet@LU84-mpoullet:~/oe$ tail
/home/mpoullet/oe/tmp/work/beagleboard-angstrom-linux-gnueabi/console-image-1.0-r0/temp/log.do_rootfs.29603
 * Cannot find package psplash-zap.
 * Cannot find package initscripts.
 * Cannot find package udev.
 * Cannot find package sysvinit.
 * Cannot find package sysvinit-pidof.
 * Cannot find package tinylogin.
 * Cannot find package opkg-nogpg.
 * Cannot find package angstrom-version.
 * Cannot find package angstrom-feed-configs.
 * Cannot find package opkg-collateral.

and indeed:
mpoullet@LU84-mpoullet:~/oe$ ./tmp/staging/i686-linux/usr/bin/opkg-cl
-f /home/mpoullet/oe/tmp/staging/i686-linux/etc/opkg.conf -o
/home/mpoullet/oe/tmp/rootfs install task-base-extended psplash-zap
initscripts udev sysvinit sysvinit-pidof tinylogin opkg-nogpg
angstrom-version angstrom-feed-configs opkg-collateral
Collected errors:
 * Cannot find package task-base-extended.
 * Cannot find package psplash-zap.
 * Cannot find package initscripts.
 * Cannot find package udev.
 * Cannot find package sysvinit.
 * Cannot find package sysvinit-pidof.
 * Cannot find package tinylogin.
 * Cannot find package opkg-nogpg.
 * Cannot find package angstrom-version.
 * Cannot find package angstrom-feed-configs.
 * Cannot find package opkg-collateral.

mpoullet@LU84-mpoullet:~/oe$ cat
/home/mpoullet/oe/tmp/staging/i686-linux/etc/opkg.conf
src oe file:/home/mpoullet/oe/tmp/deploy/glibc/ipk
arch all 1
arch any 6
arch noarch 11
arch arm 16
arch armv4 21
arch armv4t 26
arch armv5te 31
arch armv6 36
arch armv7 41
arch armv7a 46
arch beagleboard 51

But the path here is wrong afaiui?! because:

mpoullet@LU84-mpoullet:~/oe$ ls -l /home/mpoullet/oe/tmp/deploy/glibc/ipk/
insgesamt 4
-rw-r--r-- 1 mpoullet mpoullet  0 2009-03-19 22:47 Packages
-rw-r--r-- 1 mpoullet mpoullet  0 2009-03-19 22:47 Packages.filelist
-rw-r--r-- 1 mpoullet mpoullet 20 2009-03-19 22:47 Packages.gz
-rw-r--r-- 1 mpoullet mpoullet  0 2009-03-19 22:47 Packages.stamps

If I do a complete rebuild without packaged-staging, that's true that
there are all there:
mpoullet@LU84-mpoullet:~/oe/_tmp0/deploy/glibc/ipk$ ll
insgesamt 396K
drwxr-xr-x 3 mpoullet mpoullet 4,0K 2009-02-22 00:13 all
drwxr-xr-x 3 mpoullet mpoullet 260K 2009-03-16 23:00 armv7a
drwxr-xr-x 3 mpoullet mpoullet 116K 2009-03-19 21:35 beagleboard
drwxr-xr-x 2 mpoullet mpoullet 4,0K 2009-01-14 02:56 i686
-rw-r--r-- 1 mpoullet mpoullet    0 2009-02-22 00:13 Packages
-rw-r--r-- 1 mpoullet mpoullet    0 2009-02-22 00:13 Packages.filelist
-rw-r--r-- 1 mpoullet mpoullet   20 2009-02-22 00:13 Packages.gz
-rw-r--r-- 1 mpoullet mpoullet    0 2009-02-22 00:13 Packages.stamps

I hope someone could/would help.

Regards,
Matthieu.


