Received: from [209.85.210.171] (helo=mail-yx0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Murr4-0007Ss-Fb
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Oct 2009 20:00:17 +0200
Received: by yxe1 with SMTP id 1so3387818yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Oct 2009 10:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=JbuoaxL7pLWmFp1onWLr/IJbO4M/WQ076LWvwwcaLjk=;
	b=GFvJHhvvQpMoC2BmcPOCDf/qiqkSbtTYpNNQ+9gtklf3COtGmreou4/npUH6AaDbJ9
	tSnZ90ovmHEgkslghnvHCZaAw7Hkfqk/HVcEfGPnJwtKcpE/dHVFfp7u8LZdCUmYOSPh
	uesfKNzHrh7DY0yMfjreTo6KR0FZHn0/9/aOg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Fe/SD0TH9Mifw/kGdtDU7mD7XNSz0D8x4vVQEMUNjMkSXvi2wDwyRKSYqqz1sdQlHC
	AGaqAhA25EDpC00J9d+glJH1z0oI8CoT0ky0cwbTh4EcWRqlXhCBRmOu4jxm6L1apUvj
	zoqzA+44/Q5StiY5gLQkKy/iik3OVJSpCEwfI=
MIME-Version: 1.0
Received: by 10.150.130.36 with SMTP id c36mr494547ybd.180.1254765565827; Mon, 
	05 Oct 2009 10:59:25 -0700 (PDT)
Date: Mon, 5 Oct 2009 13:59:25 -0400
Message-ID: <f96d234e0910051059g41f251c5oc4eac6fad735fc31@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OE weekly changelog 2009-09-28 to 2009-10-05
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
X-List-Received-Date: Mon, 05 Oct 2009 18:00:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-09-28 to 2009-10-05

Andrea Adami (6):
  kexec-tools_2.0.1: fix compiler warnings (and literal comparison too...)
  kexec-tools-2-klibc.patch: header was commented out during test, fix
  kexec-tools-klibc-static_2.0.1: set LD options for static. Fix
  kexec-tools-klibc-static_2.0.1: rework patches. Still won't build. WIP
  mini-init: delete suspicious 755 file (asus wl-500g deluxe ?)
  kexec-tools_2.0.1: clean arm detection patch before sending it upstream

Cliff Brake (1):
  hplip: add recipe

Dirk Opfer (2):
  lua5.1: Don't delete ${STAGING_LIBDIR}/*.so*
  fastcgi: Add patch to compile with gcc4.4

Eric B=E9nard (1):
  tslib_1.0: Apply patch from r56 to link plugins to libts

Florian Boor (3):
  xserver-common: Add 1.32 - still with DEFAULT_PREFERENCE -1 but expexted =
to
  linux-mini2440: Update to 2.6.31 and follow some more standards.
  linux-mini2440: Get rid of floating revision.

Frans Meulenbroeks (2):
  proftpd: fix strip issue

Graeme Gregory (7):
  transmission_1.75.bb : new version of transmission torrent client
  strace_4.5.18.bb : newer strace for avr32, 4.5.15 wasnt building here
  tzcode-native_2009k.bb : 2009m is no longer available
  glibc_2.9.bb : add already existing OE patch arm-lowlevellock-include-tls=
.pa

Graham Gower (3):
  libsoup: add gnome-keyring dependency.
  Fix lesstif compilation.
  Fix t1lib dependency.

Henning Heinold (7):
  xorg-proto: let native packages depend on util-macros-native
  fastjar: update to 0.98
  dietlibc: update to version 0.32
  opie-image-16mb: remove broken irda-task for now
  dietlibc: rework getrlimit function for eabi
  dietlibc.class: disable rewriting of configure stuff for now
  kexec: add recipe for dietlibc

Howard Chu (1):
  python-wpactrl: add 1.0.1

Jeremy Lain=E9 (8):
  apt-0.7.20: copy over missing patches
  apt-0.7.20.2: disabled only doxygen instead of docs
  apt-0.7.20.2: re-add nodoc.patch, needed by apt-native
  apt: add volatiles support for /var/cache/apt
  apt: add /var/log/apt to volatiles
  dpkg: fix package configuration on first boot

Khem Raj (6):
  eglibc: Dont package timezone data
  strace: Fix compilation for 4.5.14 and 4.5.18
  uclibc-nptl: Move to latest revision.
  proxy-libintl_20080418.bb: include libintl.h in -dev package.
  eglibc-svn: Bump the SRCREV to latest.
  geda-gattrib_1.4.3.bb: Fix bitbake parsing error

Koen Kooi (32):
  ptlib: update to 2.6.5
  opal: add 3.6.6
  linux-omap git: add support for omap4430-sdp
  omap4430-sdp: add machine file for omap4430-sdp, based on beagleboard mac=
hin
  glibmm: add 2.22.1, fix packaging
  gnome-mplayer: add 0.9.8
  x264: update to a more recent snapshot
  opencv: update to latest svn, tweak buildsystem a bit
  angstrom: switch to a more recent gtkmm
  vlc: update to 1.0.2
  gst-plugin-gles: gles2 fix from Pratheesh
  package bbclass: strip static libs as well
  firefox 3.5.2: sync with AlwaysInnovating overlay
  gecko-mplayer: import from AlwaysInnovating overlay and clean it up a bit
  gecko-mediaplayer: fix copy/paste in packaging
  mplayer: redraw XV colourkey on every expose
  gnome-mplayer: add fixes for gtk 2.18 from svn, update svn recipe, clean =
up
  task beagleboard demo: add mplayer hack
  connman: update git version
  angstrom feed builder: also build xf86-input-evtouch
  xf86-input-evtouch: make it build again, add HAL support
  gnome-desktop: tweak packaging
  libcanberra: tweak packaging
  gnome bbclass: tweak mime packaging
  package bbclass: fix static libs logic
  network manager: massive update
  nautilus: update to 2.28
  network manager: work around some dbus at_console problems
  glib-2.0: update to 2.22.1
  angstrom: move to a more recent glib-2.0
  networkmanager: add git bits for nm and nm-applet
  nm-applet: fix some buildproblems

Marcin Juszkiewicz (5):
  netbase: on BUG eth0 is always built-in Ethernet not wifi
  checksums.ini: some new entries
  gcc: update Maverick Crunch support to 20090908 version
  linux: added 2.6.31
  linux 2.6.31: added at91sam9263ek and ep93xx support

Petri Lehtinen (2):
  python-flup: Bump to version 1.0.2
  python-django: Update to work with Python 2.6

Robert Schuster (5):
  jamvm-native 1.5.3: Prevent evil jni.h from being installed.
  classpath-native: Use --enable-tool-wrapper (increased PRs in respective =
BB
  jamvm-initial 1.x.y: Use 512MB for Xmx by default, install libjvm in priv=
ate
  checksums.ini: Added hotspot express and icedtea 1.6.1 sources.
  ecj-initial: Increased maximum heap space to 1 GiB.

SUBHASHINI V (1):
  bb_bash_completions: New utility for bitbake recipe autocompletions

Stanislav Brabec (5):
  geda-gattrib: Fixed build failure with the latest gtk+.
  geda: Fixed virtual package.
  geda (all recipes): New home page URL.
  gnome-doc-utils: Fixed invalid reference to host python in xml2po. Introd=
uce
  gnome-desktop: Disabled doc build to not depend on host system xml2po.

Steve Sakoman (17):
  webkit: bump SRCREV
  gnome-power-manager: update DEPENDS
  epiphany: add 2.28.0
  epiphany-extensions: add 2.28.0
  evince: add 2.28.0
  file-roller: add 2.28.0
  at-spi: add 1.28.0
  cheese: add 2.28.0.1
  gdm: add 2.28.0
  gnome-applets: add 2.28.0
  gnome-control-center: add 2.28.0
  libgnome: add 2.28.0
  libgnomekb: add 2.28.0
  gnome-settings-daemon: add 2.28.0
  gnome-desktop: add 2.28.0
  libxrandr: add 1.3.0
  gnome-common: add 2.28.0

TK, Pratheesh Gangadhar (1):
  gst-plugin-gles: add git version

Thomas Kunze (1):
  kexecboot-cfg: mount root rw on collie

frans (1):
  proftpd: fixed makefile issue (replaced CC by BUILD_CC)

Bugs fixed:

bug_id resolution        short_desc
2221 FIXED       Patch to build strace 4.5.14 for mips target
1739 FIXED       strace does not build for mipsel
4302 FIXED       php build error
4557 FIXED       Clutter do_configure error due to missing dependency
5324 INVALID     cannot build package m4-native
5326 FIXED       Bash autocompletion for OE recipes

Bugs opened:

bug_id resolution        short_desc


