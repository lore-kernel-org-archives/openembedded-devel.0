Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthieu.poullet@gmail.com>) id 1Lc5Xe-0003Si-L5
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Feb 2009 23:14:18 +0100
Received: by fxm11 with SMTP id 11so3016695fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2009 14:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=5tIH2GgJoDNzVCFk7XU/1IsVw8dOQ564rUBNp164Co8=;
	b=TWX0GGcXTcsz/tPGvCDlei3U+RQawnmdqnoowiBilMjF8X3/5U8ABRNaO+7lYHNLQs
	rLt2TgGyWmsOnUXl5Svr6/Gp9oUVIWRfP1Zy+wzlZ9fttrFnRAituL8w87TpOZRQ7HE6
	x+8J8Wd0EzEDuIketNpos+JhnmgCg58BsCHGc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=d3hTK3qMzL5fUNrrG1WIjzpQ2Xlogxe+U9WD5m07xov88JKmtJaZTRyHxq513qxHot
	oRbWrfK3F+06NiBnwsgLD7CAGNa66B+FgDotnjgMddIFUByyxXGcEg1EPimy9+puIDjp
	Lgkq5KO2gmCiKUK1LjNIbq08yPtLM6aupDhPE=
MIME-Version: 1.0
Received: by 10.223.111.19 with SMTP id q19mr160993fap.58.1235513472480; Tue, 
	24 Feb 2009 14:11:12 -0800 (PST)
Date: Tue, 24 Feb 2009 23:11:12 +0100
Message-ID: <80a0c20d0902241411y7add7339h1ad12dd9e9a11ce1@mail.gmail.com>
From: Matthieu Poullet <matthieu.poullet@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: linux-omap-pm recipe doesn't fetch
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
X-List-Received-Date: Tue, 24 Feb 2009 22:14:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

I can't have the linux-omap-pm recipe to be fetched/built. Can anybody help=
 me?
1 - I can clone the repo outside OE
2 - I've tried to clean up my DLDIR/*hil* and my DLDIR/git/*hil* as
suggested by Koen on irc, without luck
3 - so far I can build everything else I need

mpoullet@LU84-mpoullet:~/oe$ ./build.sh linux-omap-pm -c clean &&
./build.sh linux-omap-pm
###################################
Start building linux-omap-pm ...
###################################
NOTE: Handling BitBake files: | (6580/6580) [100 %]
NOTE: Parsing finished. 6306 cached, 0 parsed, 274 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: build 200902242307: started

OE Build Configuration:
BB_VERSION=A0=A0=A0=A0=A0=A0=A0 =3D "1.8.13"
METADATA_BRANCH=A0=A0 =3D "org.openembedded.dev"
METADATA_REVISION =3D "df719e864b5afd983e2ecb76b89502c6f5fd8e63"
TARGET_ARCH=A0=A0=A0=A0=A0=A0 =3D "arm"
TARGET_OS=A0=A0=A0=A0=A0=A0=A0=A0 =3D "linux-gnueabi"
MACHINE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D "beagleboard"
DISTRO=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D "angstrom"
DISTRO_VERSION=A0=A0=A0 =3D "2009.X-test-20090224"
TARGET_FPU=A0=A0=A0=A0=A0=A0=A0 =3D "hard"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1 of 1 (ID: 0,
/home/mpoullet/oe/openembedded/packages/linux/linux-omap-pm_git.bb,
do_clean)
NOTE: package linux-omap-pm-2.6.28-pm1+gitr65d02c2c7fe676369b7162459feec602=
68c7f4ba:
started
NOTE: package linux-omap-pm-2.6.28-pm1+gitr65d02c2c7fe676369b7162459feec602=
68c7f4ba-r2:
task do_clean: started
NOTE: Checking if staging package installed
NOTE: No. Manually removing any installed files
NOTE: Removing staging package
/home/mpoullet/oe/tmp/deploy/glibc/pstage/angstromglibc/staging-linux-omap-=
pm-beagleboard-angstrom-linux-gnueabi_2.6.28-pm1+gitr65d02c2c7fe676369b7162=
459feec60268c7f4ba-r2_i686-linux.ipk
NOTE: removing /home/mpoullet/oe/tmp/work/beagleboard-angstrom-linux-gnueab=
i/linux-omap-pm-2.6.28-pm1+gitr65d02c2c7fe676369b7162459feec60268c7f4ba-r2
NOTE: removing /home/mpoullet/oe/tmp/stamps/beagleboard-angstrom-linux-gnue=
abi/linux-omap-pm-2.6.28-pm1+gitr65d02c2c7fe676369b7162459feec60268c7f4ba-r=
2.*
NOTE: package linux-omap-pm-2.6.28-pm1+gitr65d02c2c7fe676369b7162459feec602=
68c7f4ba-r2:
task do_clean: completed
NOTE: package linux-omap-pm-2.6.28-pm1+gitr65d02c2c7fe676369b7162459feec602=
68c7f4ba:
completed
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be
rerun and 0 failed.
NOTE: build 200902242307: completed

real=A0=A0=A0 0m5.055s
user=A0=A0=A0 0m4.168s
sys=A0=A0=A0 0m0.396s
###################################
###################################
Start building linux-omap-pm ...
###################################
NOTE: Handling BitBake files: | (6580/6580) [100 %]
NOTE: Parsing finished. 6306 cached, 0 parsed, 274 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: build 200902242307: started

OE Build Configuration:
BB_VERSION=A0=A0=A0=A0=A0=A0=A0 =3D "1.8.13"
METADATA_BRANCH=A0=A0 =3D "org.openembedded.dev"
METADATA_REVISION =3D "df719e864b5afd983e2ecb76b89502c6f5fd8e63"
TARGET_ARCH=A0=A0=A0=A0=A0=A0 =3D "arm"
TARGET_OS=A0=A0=A0=A0=A0=A0=A0=A0 =3D "linux-gnueabi"
MACHINE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D "beagleboard"
DISTRO=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D "angstrom"
DISTRO_VERSION=A0=A0=A0 =3D "2009.X-test-20090224"
TARGET_FPU=A0=A0=A0=A0=A0=A0=A0 =3D "hard"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
ERROR: Multiple .bb files are due to be built which each provide
virtual/kernel (/home/mpoullet/oe/openembedded/packages/linux/linux-omap-pm=
_git.bb
/home/mpoullet/oe/openembedded/packages/linux/linux-omap_2.6.28.bb).
=A0This usually means one provides something the other doesn't and should.
NOTE: Executing runqueue
NOTE: Running task 296 of 548 (ID: 1,
/home/mpoullet/oe/openembedded/packages/linux/linux-omap-pm_git.bb,
do_setscene)
NOTE: Running task 353 of 548 (ID: 128,
/home/mpoullet/oe/openembedded/packages/fakeroot/fakeroot-native_1.12.1.bb,
do_configure)
NOTE: package linux-omap-pm-2.6.28-pm1+gitr65d02c2c7fe676369b7162459feec602=
68c7f4ba:
started
NOTE: package linux-omap-pm-2.6.28-pm1+gitr65d02c2c7fe676369b7162459feec602=
68c7f4ba-r2:
task do_setscene: started
NOTE: package fakeroot-native-1.12.1: started
NOTE: package fakeroot-native-1.12.1-r0: task do_configure: started
NOTE: Checking if staging package installed
NOTE: No. Manually removing any installed files
NOTE: package linux-omap-pm-2.6.28-pm1+gitr65d02c2c7fe676369b7162459feec602=
68c7f4ba-r2:
task do_setscene: completed
NOTE: package linux-omap-pm-2.6.28-pm1+gitr65d02c2c7fe676369b7162459feec602=
68c7f4ba:
completed
NOTE: Running task 501 of 548 (ID: 2,
/home/mpoullet/oe/openembedded/packages/linux/linux-omap-pm_git.bb,
do_fetch)
NOTE: package linux-omap-pm-2.6.28-pm1+gitr65d02c2c7fe676369b7162459feec602=
68c7f4ba:
started
NOTE: package linux-omap-pm-2.6.28-pm1+gitr65d02c2c7fe676369b7162459feec602=
68c7f4ba-r2:
task do_fetch: started
fatal: Not a git repository
NOTE: Task failed: Fetch failed: Fetch command export
SSH_AUTH_SOCK=3D/tmp/keyring-6hBicL/ssh; export
PATH=3D/home/mpoullet/oe/tmp/staging/i686-linux/usr/bin/beagleboard-angstro=
m-linux-gnueabi:/home/mpoullet/oe/tmp/staging/i686-linux/usr/bin/armv7a-ang=
strom-linux-gnueabi:/home/mpoullet/oe/tmp/staging/i686-linux/usr/sbin:/home=
/mpoullet/oe/tmp/staging/i686-linux/usr/bin:/home/mpoullet/oe/tmp/cross/arm=
v7a/bin:/home/mpoullet/oe/tmp/staging/i686-linux/sbin:/home/mpoullet/oe/tmp=
/staging/i686-linux/bin:/home/mpoullet/oe/opt/bitbake/bin:/opt/omap3evm/too=
lchain/arm-2007q3/bin:/home/mpoullet/src/u-boot-ti-omap3evm/tools:/home/mpo=
ullet/bin:/opt/jdk1.5.0_16/bin:/home/mpoullet/bin:/usr/local/sbin:/usr/loca=
l/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games;
git fetch git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap-=
pm.git
pm failed with signal 128, output:
fatal: Not a git repository

NOTE: package linux-omap-pm-2.6.28-pm1+gitr65d02c2c7fe676369b7162459feec602=
68c7f4ba-r2:
task do_fetch: failed
ERROR: TaskFailed event exception, aborting
NOTE: package linux-omap-pm-2.6.28-pm1+gitr65d02c2c7fe676369b7162459feec602=
68c7f4ba:
failed
ERROR: Build of
/home/mpoullet/oe/openembedded/packages/linux/linux-omap-pm_git.bb
do_fetch failed
ERROR: Task 2 (/home/mpoullet/oe/openembedded/packages/linux/linux-omap-pm_=
git.bb,
do_fetch) failed
NOTE: Waiting for 1 active tasks to finish
NOTE: 1: /home/mpoullet/oe/openembedded/packages/fakeroot/fakeroot-native_1=
.12.1.bb,
do_configure (9030)
NOTE: package fakeroot-native-1.12.1-r0: task do_configure: completed
NOTE: package fakeroot-native-1.12.1: completed
NOTE: Tasks Summary: Attempted 499 tasks of which 498 didn't need to
be rerun and 1 failed.
ERROR: '/home/mpoullet/oe/openembedded/packages/linux/linux-omap-pm_git.bb'
failed
NOTE: build 200902242307: completed

real=A0=A0=A0 0m32.318s
user=A0=A0=A0 0m21.309s
sys=A0=A0=A0 0m5.392s
###################################

Regards,
Matthieu.


