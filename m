Received: from [209.85.222.187] (helo=mail-pz0-f187.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MlBLB-0000Hh-Ms
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Sep 2009 02:47:20 +0200
Received: by pzk17 with SMTP id 17so3802996pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2009 17:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=3o13y9WqdoKc8NcFHa3zYqwRzd2eh4RIUI4xBzokVKA=;
	b=nUUQgulFqKEj0MHzik7wxwu6B5g6QJUc24lfe/xgj/DU8yBRe4/nfwv7ZpLwKF088T
	HRLcM3EH4qRllbASwcnBwlL8WgfN+CpMPApQ4tyZuWEtMD0QdNJ+3iLJKPbflB79tWIZ
	fWeM2oCjzcJQMy5z8c6v68phBYQyKYIVyicxI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=BwbzjQjH0c1rGTp3h5c6hsGGr/N1sfWPRcZAfO1w5aklaoMKT9rfCvrfrX5M0W3qEF
	Fw+1DrKqJ7ODZdpL41hvcYhOeSPyv7axDGD2jIrOhXp5jyoKpXx3aZ10QpCb9eXe3+s0
	1KSfKIOOrurTK0BCz+NpVtC5vn9EJydTrTZo0=
MIME-Version: 1.0
Received: by 10.141.44.3 with SMTP id w3mr3433333rvj.151.1252417232070; Tue, 
	08 Sep 2009 06:40:32 -0700 (PDT)
Date: Tue, 8 Sep 2009 09:40:32 -0400
Message-ID: <f96d234e0909080640w4972afbm372f6dab49a1957d@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.187
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2009-08-31 to 2009-09-07
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
X-List-Received-Date: Wed, 09 Sep 2009 00:47:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-08-31 to 2009-09-07

Brijesh Singh (1):
  gstreamer-ti: merge updated patch from tracker and export CODEC_SERVER di=
r f

Christopher Friedt (1):
  cups.inc: export DSOFLAGS

Cliff Brake (1):
  micro-uclibc.conf: move OVERRIDES to bottom of file

Evan Doiron (3):
  net-snmp: add v5.4.2.1
  add sscep: v0.0.2008.1211
  usb-modeswitch: add v1.0.2

Florian Boor (3):
  xserver-common: add 1.31
  gtkhtml-3.8: Fix staging of 3.18.0
  task-sdk-base: Use virtual libc development package to use the selected l=
ibc

Graham Gower (1):
  netsurf: fixes for GCC-4.4, from netsurf svn.

Henning Heinold (4):
  libx11-native: provide native recipe for versiob 1.2
  libxext-native: provide native recipe for libxext
  evas-native: add libxext-native as dependency
  gst-plugins-good: add esound to DEPENDS line

Khem Raj (12):
  micro-uclibc, minimal-uclibc: Reorder including the base distro config.
  uclibc: Pass ARCH=3D<TARGET_ARCH>" on make commandline.
  OpenEmbedded: Switch to using linux-uclibceabi and linux-gnu for TARGET_O=
S
  libidl_0.8.13.bb: Add new recipe
  dropbear: Enable allow empty password patch.
  angstrom: Use linux-uclibceabi instead of linux-uclibcgnueabi
  ortp: Add glib-2.0 dependency for 0.7.1
  libpam_1.0.2.bb: Fix compilation for uclibc systems.
  procps_3.2.7.bb: Fix compilation when usr/bin is same as /bin
  perl_5.8.8.bb: Fix compilation when bindir is not /usr/bin
  gcc-4.4.1: Fix canadian cross compilation.
  perl_5.8.8.bb: Use exec_prefix instead of layout_exec_prefix

Koen Kooi (20):
  poppler: add 0.11.3 (0.12rc)
  evince: add 2.26.2
  epdfview: update to 0.1.7
  python: fix -netserver and -devel packaging, convert 2.6.1 to inc_pr
  xscreensaver: fix packaging and QA
  fennec: update to latest tip
  linux-omap-* 2.6.29: add l1 cache performance tweak from l-a-k ml
  gnome bbclass: remove to more auto generated cruft that breaks package ma=
nag
  gnome-keyring: fix merge error
  libxext-native: stop providing 'xext'
  gst-ffmpeg: bump PR on 0.10.7, add 0.10.8 and cleanup EXTRA_OECONF
  linux-omap: move ppoll patch to files/ and exchange it with the queued ve=
rsi
  pixman git: add some more NEON and fastpath patches
  linux-omap git: update to rc8, start adding patches from the overo tree
  linux-omap git: add dss2 and cache patches
  Revert "dropbear: Enable allow empty password patch."
  linux-omap git: another checkpoint

Marcin Juszkiewicz (2):
  xf86-video-vesa: fixed RDEPENDS
  xserver-common 1.30: another set of updates

Michael 'Mickey' Lauer (4):
  mickeydbus: add more RDEPENDES
  libpersistence: new recipe; gobject serialization library
  task-cli-tools[-python]: factor python-based cli tools out of common reci=
pe
  mickeydbus: fix name of python-pygobject

Michael Smith (2):
  package_deb: create md5sums control files
  openssl.inc: fix packaging on x86_64; use INC_PR

Ming Chow =E5=91=A8=E6=98=8E (2):
  compcache: Add version 0.5+0.6pre3 and version 0.6
  linux-nokia800-2.6.21-osso71.bb: Fixed undefined reference to __aeabi_uld=
ivm

Philip Balister (2):
  asterisk-1.4.23.1 : Checksum changed on source package.

Stanislav Brabec (3):
  xf86-input-evdev: Update to version 2.2.5.
  xf86-video-fbdev: Updated to version 0.4.1.
  xinput: Updated to version 1.4.2.

Steffen Sledz (1):
  checksums.ini: some missing checksums added

Steve Sakoman (9):
  wpa-supplicant: updated scripts
  libunique: add 1.1.2
  orbit2: restructure recipes to use orbit2.inc, add 2.14.17
  swfdec-gnome: add 2.26.0
  system-tools-backends: add 2.8.1
  inotify-tools: add 3.13
  libglade: add 2.6.4
  libnotify: add 0.4.5
  libgles-omap3: detect cpu type and don't load modules if no SGX hardware

Bugs fixed:

bug_id resolution        short_desc
3321 FIXED       Both libxine-fb and libxine-x11 get built as both
have same PACKAGES-DYNAMIC
3076 FIXED       opie-mediaplayer2 doesn't build on fresh OE/angstrom
4488 FIXED       libxine-x11 and libxine-fb fail do_configure
5304 FIXED       cups-1.2.12 fails

Bugs opened:

bug_id resolution        short_desc


