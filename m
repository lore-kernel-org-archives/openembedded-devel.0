Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <top.grzechu@gmail.com>) id 1OG8JY-0004wW-G2
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 12:21:50 +0200
Received: by bwz1 with SMTP id 1so512738bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 May 2010 03:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=jkHV2GwCln9GhiXty5cDXU+MpE6vvqx7XA1rnSC6sD8=;
	b=uN2rfr9gixBnC7KvheCwt1+ZK/f+hMxELIOguUHtBP0PiQKUUXQhWONAmiyDxl/gSi
	L4C5MZprbJalpACBk6pnu5ixPUWpmw6bR1jvrOvyIkgaHrPR3cEMy5o5t6O6bZnhF5kA
	L17AGZJomTPVou1h2fdKN7EQDI/5ZPvd/a98o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=oCpZs1uvSOi1xpNPLuWTJSILmxW0z9GMHwrUbrfmBulVOHQ9j/YyMjKgkirIRhXJX/
	LWR9dSeQFkhrNWe1PubEmoMlfPVWyOJPmMyXUCsJ+0viM5SclLaF0CrS2nnrubQAapEZ
	e+gWN8ZrKkkOJWUfBhBfkMVvmMZR9g+ur9PI8=
MIME-Version: 1.0
Received: by 10.204.34.206 with SMTP id m14mr1553677bkd.14.1274609863871; Sun, 
	23 May 2010 03:17:43 -0700 (PDT)
Received: by 10.204.76.131 with HTTP; Sun, 23 May 2010 03:17:43 -0700 (PDT)
Date: Sun, 23 May 2010 12:17:43 +0200
Message-ID: <AANLkTimqsLv69OOmckplXCqoIZbybtIwjTVBAC-Uax4Q@mail.gmail.com>
From: Grzegorz Toporek <top.grzechu@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: top.grzechu@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Angstrom distro, qemu: uncaught target signal 4 (Illegal instruction) - core dumped on glibc package
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
X-List-Received-Date: Sun, 23 May 2010 10:21:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all,

thank you for all your suggestions and help. I started to build angstrom
distro as you recommended.

Unfortunately, I got this error while building glibc package:
qemu: uncaught target signal 4 (Illegal instruction) - core dumped

I found this tread which says that gemu doesn't support iwmmxt...but how to
deal with this? Is there a patch needed? Where to find it?
http://ibot.rikers.org/%23oe/20060827.html.gz

I use tune-iwmmxt.inc file with my machine.

Please help me with it.


Kind Regards,
Grzegorz

######## log file ############

grzesiek@grzesiek:~/tele$ bitbake busybox
NOTE: Handling BitBake files: \ (8373/8373) [100 %]
NOTE: Parsing finished. 7581 cached, 458 parsed, 334 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 355 of 526 (ID: 145,
/home/grzesiek/tele/openembedded/recipes/glibc/glibc_2.6.1.bb, do_package)
NOTE: preparing tree for binary locale generation
NOTE: generating locale es_NI (UTF-8)
qemu: uncaught target signal 4 (Illegal instruction) - core dumped
NOTE: Task failed: localedef returned an error (command was
PATH=3D"/home/grzesiek/tele/tmp/sysroots/i686-linux/usr/bin/iwmmxt-angstrom=
-linux-gnueabi:/home/grzesiek/tele/tmp/sysroots/i686-linux/usr/bin/iwmmxt-a=
ngstrom-linux-gnueabi:/home/grzesiek/tele/tmp/sysroots/i686-linux/usr/sbin:=
/home/grzesiek/tele/tmp/sysroots/i686-linux/usr/bin:/home/grzesiek/tele/tmp=
/cross/iwmmxt//bin:/home/grzesiek/tele/tmp/sysroots/i686-linux/sbin:/home/g=
rzesiek/tele/tmp/sysroots/i686-linux/bin:/home/grzesiek/tele/bitbake/bin:/u=
sr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
I18NPATH=3D"/home/grzesiek/tele/tmp/work/iwmmxt-angstrom-linux-gnueabi/glib=
c-2.6.1-r36.0/locale-tree/usr/share/i18n"
qemu-arm -s 1048576 -r 2.6.24 -L
/home/grzesiek/tele/tmp/work/iwmmxt-angstrom-linux-gnueabi/glibc-2.6.1-r36.=
0/locale-tree
-E
LD_LIBRARY_PATH=3D/home/grzesiek/tele/tmp/work/iwmmxt-angstrom-linux-gnueab=
i/glibc-2.6.1-r36.0/locale-tree/lib
-cpu pxa270-c5
/home/grzesiek/tele/tmp/work/iwmmxt-angstrom-linux-gnueabi/glibc-2.6.1-r36.=
0/locale-tree/bin/localedef
--force --old-style --no-archive
--prefix=3D/home/grzesiek/tele/tmp/work/iwmmxt-angstrom-linux-gnueabi/glibc=
-2.6.1-r36.0/locale-tree
--inputfile=3D/usr/share/i18n/locales/es_NI --charmap=3DUTF-8 es_NI).
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/grzesiek/tele/openembedded/recipes/glibc/
glibc_2.6.1.bb do_package failed
ERROR: Task 145 (/home/grzesiek/tele/openembedded/recipes/glibc/
glibc_2.6.1.bb, do_package) failed
NOTE: Tasks Summary: Attempted 354 tasks of which 354 didn't need to be
rerun and 1 failed.
ERROR: '/home/grzesiek/tele/openembedded/recipes/glibc/glibc_2.6.1.bb'
failed
grzesiek@grzesiek:~/tele$ ^C
grzesiek@grzesiek:~/tele$ bitbake busybox
NOTE: Handling BitBake files: \ (8373/8373) [100 %]
NOTE: Parsing finished. 7581 cached, 458 parsed, 334 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 355 of 526 (ID: 145,
/home/grzesiek/tele/openembedded/recipes/glibc/glibc_2.6.1.bb, do_package)
NOTE: preparing tree for binary locale generation
NOTE: generating locale es_NI (UTF-8)
qemu: uncaught target signal 4 (Illegal instruction) - core dumped
NOTE: Task failed: localedef returned an error (command was
PATH=3D"/home/grzesiek/tele/tmp/sysroots/i686-linux/usr/bin/iwmmxt-angstrom=
-linux-gnueabi:/home/grzesiek/tele/tmp/sysroots/i686-linux/usr/bin/iwmmxt-a=
ngstrom-linux-gnueabi:/home/grzesiek/tele/tmp/sysroots/i686-linux/usr/sbin:=
/home/grzesiek/tele/tmp/sysroots/i686-linux/usr/bin:/home/grzesiek/tele/tmp=
/cross/iwmmxt//bin:/home/grzesiek/tele/tmp/sysroots/i686-linux/sbin:/home/g=
rzesiek/tele/tmp/sysroots/i686-linux/bin:/home/grzesiek/tele/bitbake/bin:/u=
sr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
I18NPATH=3D"/home/grzesiek/tele/tmp/work/iwmmxt-angstrom-linux-gnueabi/glib=
c-2.6.1-r36.0/locale-tree/usr/share/i18n"
qemu-arm -s 1048576 -r 2.6.24 -L
/home/grzesiek/tele/tmp/work/iwmmxt-angstrom-linux-gnueabi/glibc-2.6.1-r36.=
0/locale-tree
-E
LD_LIBRARY_PATH=3D/home/grzesiek/tele/tmp/work/iwmmxt-angstrom-linux-gnueab=
i/glibc-2.6.1-r36.0/locale-tree/lib
-cpu pxa270-c5
/home/grzesiek/tele/tmp/work/iwmmxt-angstrom-linux-gnueabi/glibc-2.6.1-r36.=
0/locale-tree/bin/localedef
--force --old-style --no-archive
--prefix=3D/home/grzesiek/tele/tmp/work/iwmmxt-angstrom-linux-gnueabi/glibc=
-2.6.1-r36.0/locale-tree
--inputfile=3D/usr/share/i18n/locales/es_NI --charmap=3DUTF-8 es_NI).
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/grzesiek/tele/openembedded/recipes/glibc/
glibc_2.6.1.bb do_package failed
ERROR: Task 145 (/home/grzesiek/tele/openembedded/recipes/glibc/
glibc_2.6.1.bb, do_package) failed
NOTE: Tasks Summary: Attempted 354 tasks of which 354 didn't need to be
rerun and 1 failed.
ERROR: '/home/grzesiek/tele/openembedded/recipes/glibc/glibc_2.6.1.bb'
failed

######## machine/colibri.conf ############

TARGET_ARCH        =3D "arm"
TARGET_FPU        =3D "soft"
PACKAGE_EXTRA_ARCHS    =3D "armv4t armv5te"
require conf/machine/include/tune-iwmmxt.inc
GUI_MACHINE_CLASS    =3D "bigscreen"
MACHINE_FEATURES    =3D "kernel26 apm alsa ext2 uboot irda usbgadget usbhos=
t
keyboard touchscreen screen bluetooth pcmcia"
MACHINE_FEATURES    +=3D "ethernet"
MACHINE_TASK_PROVIDER    =3D "task-boot dropbear"
PREFERRED_PROVIDER_virtual/kernel    =3D "linux-colibri"

####### machine/include/tune-iwmmxt.inc #############

# Configurations for the Intel PXA27x Appications Processor Family.
# Please use tune-xscale for PXA255/PXA26x based processors.
TARGET_CC_ARCH =3D "-march=3Diwmmxt -mcpu=3Diwmmxt -mtune=3Diwmmxt"
BASE_PACKAGE_ARCH =3D "iwmmxt"
#PACKAGE_EXTRA_ARCHS +=3D "armv4 armv4t armv5te iwmmxt"
PACKAGE_EXTRA_ARCHS +=3D "armv4 iwmmxt"
FEED_ARCH =3D "iwmmxt"

