Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1QBvM6-0001pl-9u
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 22:47:34 +0200
Received: by pwj9 with SMTP id 9so2538490pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 13:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=ZICcHdg4S7pN9S8cbJ5M23S3afQVfH/QWEdHWfnF9UE=;
	b=Hd1FEVVR3Uw8WQX7Tza+UhChvTX8iJ7R9/bl3TkQhzBPYFmd1wx+dldVc4NbOljGaf
	WNoxz5qhEe+8No/DPp9mch4ACzHpqRsGX2JUAZV/mc6E5xA3bNLBYK6HpYTiIdbhKmcW
	+UZ4CdUl5+l1rsNTBSAZrKetbGQBYQ0q1LSc4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=oQ/Ox7n5bg7KijUvnzIZTLinTndhAEkqYg5YfcJVhl34XXFsL8tn+sW0UH2FLlMvaG
	IiwJB3weaLkeefW+O2cjSHzeYCKHpT74tnEb3eXIVfGxqSCzhdRHMvUIaojspUQIPiL6
	5E0+dtTM1gTKx4BlwdxdeYygeg06H1tUJby0A=
MIME-Version: 1.0
Received: by 10.68.65.200 with SMTP id z8mr7832714pbs.219.1303159511973; Mon,
	18 Apr 2011 13:45:11 -0700 (PDT)
Received: by 10.68.42.5 with HTTP; Mon, 18 Apr 2011 13:45:11 -0700 (PDT)
Date: Mon, 18 Apr 2011 16:45:11 -0400
Message-ID: <BANLkTing0Am9kEGQ1r15rxGw-XoO_NoDMw@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: OE weekly changelog for org.openembedded.dev, 2011-04-11 to 2011-04-18
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
X-List-Received-Date: Mon, 18 Apr 2011 20:47:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

OE weekly changelog for org.openembedded.dev, 2011-04-11 to 2011-04-18

Anders Darander (1):
  lowpan-tools_0.2.2;: fix build with static libnl1

Andrea Adami (4):
  initscripts: remove obsolete Zaurus overrides
  mtd-utils: upgrade to latest 1.4.4 release (bugfix)
  mtd-utils: remove broken 1.4.1 version
  mtd-utils: archive obsolete old versions

Andreas Oberritter (1):
  streamripper: fix depends and license

Antonio Ospite (7):
  fsodeviced: add motorola_ezx conf
  files/device_table-ezx.txt: Add /dev/snd and /dev/ttyS1
  files/device_table-ezx.txt: change some indentation
  linux/openezx-kernel_git.bb: update recipe to build 2.6.38
  ezx/moto-boot-usb-native_git.bb: update SRCREV
  ezx/ezx-gpiotool_svn.bb: make the recipe build again
  ezx/ezx-gen-blob_git.bb: update SRCREV

Denis 'GNUtoo' Carikli (1):
  smpeg svn: fix compilation

Denys Dmytriyenko (1):
  Revert "libgles-omap3: Remove SGX Fixup for TI816x."

Henning Heinold (4):
  tune-atom.inc: add i686 to PACKAGE_EXTRA_ARCH
  mercurial-native: fix legacy staging
  icedtea6-native: add libxext-native to the dependencies
  cacao-native: add fix for vm-shutdown and multiple threads are involved

Jeff Lance (1):
  matrix-gui: Bump up SRCREV

Jose Luis Perez Diez (1):
  connman: update shr config, don't enable DNS Proxy on connmand start

Koen Kooi (3):
  ncurses 5.7: put patch in OE
  angstrom feed sorter: catch up with latest oe-core changes
  libgles-omap3: fix 81xx initscript ES detection

Martin Jansa (2):
  phonet-utils: sync with meta-oe
  gst-plugins-package: add ${PN}-meta to PACKAGES directly instead from popula

Michael 'Mickey' Lauer (1):
  openezx-kernel: fix typo in COMPATIBLE_MACHINE directive

Neil MacMunn (1):
  networkmanager-openvpn: added version 0.8.3.995

Pau Espin Pedrol (1):
  elfe: bump SRCREV

Paul Menzel (5):
  starling: change `gst-plugin-ivorbis` to `gst-plugin-ivorbisdec` in `RRECOMM
  orc: add version 0.4.12
  viking: Fix dependencies - build requires intltoolize (intltool-native).
  viking: Add curl to DEPENDS to fix potential build failure.     * See http:/
  schroedinger.inc: remove version dependent checksums

Siddharth Heroor (4):
  ti-ipc: Add version 1.22.05.27
  omap3-sgx-modules: Update TI816x Module Location and Platform variables.
  libgles-omap3: Correct libraries for TI816x.
  libgles-omap3: Remove SGX Fixup for TI816x.

Stanislav Brabec (8):
  zaurusd: Convert Makefile.am spaces to tabs to be compatible with the new GN
  matchbox-wm-2: Convert Makefile.am spaces to tabs to be compatible with the
  irdadump: Use standard installation.     * Fixes installation failure with n
  guile: Build requires libltdl (libtool) and gettext to complete.
  kismet: Updated to version 2010-07-R1.
  viking: Disable realtime gps tracking.     * The code is not compatible with
  viking: Potential fix of curl crashes.
  tangogps: Potential fix of curl crashes.

Tom Rini (5):
  xkeyboard-config: Add glib-2.0-native to DEPENDS
  libedit: Add 20100424 (3.0)
  dtc_git: Merge .inc into .bb, update
  Revert "dtc_git: Merge .inc into .bb, update"
  dtc: Switch to BBCLASSEXTEND and INC_PR


-- 
=================
http://bec-systems.com


