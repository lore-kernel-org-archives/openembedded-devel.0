Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PmUnp-00024k-Hz
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 18:23:08 +0100
Received: by pxi17 with SMTP id 17so919130pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Feb 2011 09:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=cJnR4k8lsZuNogWqiAFB8H7gKv1CnWW6YHZAOqoqWFM=;
	b=h9k8RU3AbMLWgy2thd49atYoAnM590tPOy42z7B5AmWsVQzE4ibf/ZAuY0RVxzXcP9
	E5KDZVV1/cmrVMUoIzAN3tqy6gaD1sVRxfmZ6eBWOgbWO1NREMXtylz7psrn9oYn4Z1w
	vwaHIanpHv2/abHy2Hff62A8m0HRuBSnfLIR8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=lhJpJ9EZc8h2VF8Kllo7rbC/HMNmY/xff3QlNbcFItaSj3WSGX0Hd1ElUIz7MrYztV
	ZsU08NBw1b5aIixhdugVCr+rT3CrHp/sylF+IGtX6g4KK7LuWJahceVx62CimG2Re3l9
	5oswjy5DUkmj4j7Kq2sfjuJ4eFLdO1ThgQlQ4=
MIME-Version: 1.0
Received: by 10.142.125.4 with SMTP id x4mr6169336wfc.88.1297099311063; Mon,
	07 Feb 2011 09:21:51 -0800 (PST)
Received: by 10.142.155.8 with HTTP; Mon, 7 Feb 2011 09:21:51 -0800 (PST)
Date: Mon, 7 Feb 2011 12:21:51 -0500
Message-ID: <AANLkTi=p3LAQsZ_F3hMqd27tDSYjv24Pz=UNeFgBH_0W@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: OE weekly changelog for org.openembedded.dev, 2011-01-31 to 2011-02-07
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
X-List-Received-Date: Mon, 07 Feb 2011 17:23:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
OE weekly changelog for org.openembedded.dev, 2011-01-31 to 2011-02-07

Andrea Adami (3):
  linux-kexecboot: move SRCREV of git recipe to 2.6.38-rc3
  linux-kexecboot: refresh Zaurus defconfigs for new SRCREV (2.6.38-rc3)
  kexecboot: add --enable-delay=3D2 for collie too.

Bernhard Guillon (1):
  libglademm_2.4.1.bb: remove legacy staging, bump PR

Chris Larson (1):
  autotools: use oe.utils.inherits

Cliff Brake (2):
  update-testing-branch.sh: script to do the weekly testing branch update
  weekly-changelog-report.sh: remove Holger's branch

Denis 'GNUtoo' Carikli (1):
  nokia900.conf: added ubifs arguments

Eric B=E9nard (2):
  busybox-1.18.2: add latest fixes
  busybox-1.18.2: add latest fixes

Fabian Ruff (1):
  totem-pl-parser_2.30.0: fix configure without gobject introspection

Frans Meulenbroeks (1):
  minimal.conf: removed pinning of perl 5.10.1 now it has become the defaul=
t

Graham Gower (1):
  opkg.inc: bump SRCREV to pull in a couple of important fixes.

Henning Heinold (12):
  help2man: fix drag in of target perl for the native package
  jikes: fix RDEPENDS, so the native package don't drag in classpath from t=
arg
  openjdk-6: remove one patch which is not needed anymore
  openjdk-6: add version 1.8.5 with security fixes AND libtool2.4 support f=
or
  cacao-native: update to the latest hg version
  libecj-bootstrap: delete versions that are not pinned
  libecj-bootstrap: add version 3.6.1
  jamvm-initial: fix legacy staging
  jamvm-initial: remove version 1.5.0, version 1.4.5 is good enough for our=
 ne
  update-rc.d.bbclass: set RDEPENDS_${PN} to nothing for virtclass-native
  pango: set RRECOMMENDS_${PN} to nothing for virtclass-native
  python-pygobject-native: set RDEPENDS to nothing

Koen Kooi (9):
  angstrom: point ANGSTROM_URI to feeds.a-d.org
  angstrom-feed-configs: bump PR
  clutter: add 1.4.2
  contrib: point feed uploader to feed.a-d.org
  angstrom-uboot-scripts: add some more scripts
  libgles-omap3: catch up with devmem2 changes
  angstrom source mirror: blacklist git2/ dir as well
  libgles-omap3: fix other devmem2 references and remove stale comment abou=
t n
  angstrom source mirror: blacklist *.done as well

Marek Sujak (2):
  kernel: added support for vmx25 into recipe 2.6.35 kernel
  barebox: add patch for vmx25

Martin Jansa (9):
  gnu-config: use /usr/bin/env perl instead of /usr/bin/perl in gnu-configi=
ze.
  gnu-config: update also bindir change to replace /usr/bin/env instead of =
/us
  xrdb: upgrade from 1.0.7 to 1.0.8
  libpciaccess: upgrade from 0.12.0 to 0.12.1
  navit: use .desktop and .png files from sources and remove those from OE =
rep
  efl-from-svn.inc: add include to use EFL from svn instead of released tar=
bal
  efreet: newer revisions have icon cache enabled by default and dropped ol=
d c
  efl-from-svn: make it more usefull
  task-shr-feed: add samba

Mike Westerhof (3):
  SlugOS: slugos-pacakges.bb - change kexec back to kexec-tools     (DEPEND=
S r
  SlugOS: initscripts - simplify kexec handling in reboot, fix option order=
ing
  SlugOS: kernel -- make 2.6.37 the preferred kernel for SlugOS     and int=
rod

Norman Schleicher (1):
  navit: fix QA issues in .desktop files

Paul Menzel (1):
  xbmc: add `gperf-native` to `DEPENDS`

Stefan Schmidt (19):
  connman: Add recipe for 0.68 release
  wpa-supplicant_0.7.3: Enable the new DBUS API and bump PR.
  connman_0.68: Update configure options and enable ofono plugin
  angstrom-2008-preferred-versions: Bump wpa-supplicant version to 0.7.3
  wpa-supplicant_0.7: Package dbus system-service activation files an bump =
PR.
  ofono: Add recipes from poky.
  buglabs-apps: BugLabs java applications.
  task-bug.bb: Add bug core tasks used in our images
  task-bug-apps.bb: Add tasks for BugLabs applications
  task-bug-feed-extra.bb: Add tasks for our feed
  task-poky.bb: Add poky and sato tasks we are using in our images
  bug-ramdisk: Add ramdisk image for QA testing
  bug-image-production.bb: Add BugLabs production image shipped on our devi=
ces
  linux-bug20-linaro_2.6.35: Add experimental recipe
  buglabs-autorev.inc: Add include file for BugLabs AUTOREV builds
  com.buglabs.app.bugdash2: Bump for newer version
  bug2v4l2: Add recipe bug20 v4l2 interface
  connman: Don't prefer connman git version over the latest release in angs=
tro
  xserver-nodm-init: switch to ndm-init 2.0 to get a working matchbox sessi=
on

Steffen Sledz (2):
  linux-2.6.24: enable oprofile support/modules for hipox machine
  testscript.sh: update to bitbake 1.10.2

Tom Rini (16):
  qmake_base.bbclass: Add cases for linux-gnuspe/linux-uclibcspe
  sh-common: Add postgresql info
  site infos: Move ac_cv_sys_restartable_syscalls to common-linux
  site info: Move ac_cv_conv_longlong_to_float to common-linux
  perl: Drop 5.8.8, bump PR in all perl recipes
  perl-native: Switch to userelocatableinc and not shared libperl
  automake: Add perl-native as a dep rather than perl-runtime-native
  autoconf: Add perl-native as a dep
  bitbake.conf: Drop unused perl-native-runtime ASSUME_PROVIDED
  postgresql: Pass --disable-spinlocks on SH4, use INC_PR
  autoconf: Clean up slightly our mangle for /usr/bin/env
  automake: Updates for taking advantage of our own perl
  help2man: Update for using our perl-native
  perl-rdepends_5.8.8.inc: Remove orphaned file
  perl: Make this not be MACHINE-specific in pstaging+signatures
  perl-native: Switch to using create_wrapper to make perl relocatable.

Yuri Bushmelev (1):
  oestats-client.bbclass: Fix oestats-client

chase maupin (1):
  sourceipk: fix race condition with compileconfigs/multi-kernel

sujak.marek (3):
  barebox: added recipe for barebox v 2010.10
  VMX25: Add machine support for vmx25
  barebox: update barebox 2010.10 to support vmx25


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Bugs fixed:
bug_id resolution        short_desc

Bugs opened:
bug_id resolution        short_desc


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


