Received: from [209.85.222.193] (helo=mail-pz0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1MNtME-0007qQ-GV
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jul 2009 20:56:06 +0200
Received: by pzk31 with SMTP id 31so2330610pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jul 2009 11:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=C2KoCK6agyRXIAcV3/5d3paub/2Wp6Zd+Y/eyDTlaNs=;
	b=kPjrfcO+hEk6YdO1ajUnwFi+u8PxPU1LenJweY1fMCFc/raJFfIcqolf2iytWzpchr
	ofd16Ktl2NhIvgSfyfCuJzSg7xbPF3uEC7ukGGj9wPtFsPZzRTxmXTREDf/lsFokicqy
	zTFJuezL5Mozf5VN+hndGlcCtgQEGuC33dEAI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=fDAtQe1jy8ynpOhS0RXmWJkEIVv3IB+kSaThc/Yc4QyS7Ujx9EXvKRlKnp1PPsgu7+
	WmuAw6FDDLf358ZYwYdIAUTfoymMCvfmQsMfc2LwvKy1c1GX2s8C4oqBhX6NuA6CjRQ7
	fmkR+oAzLufUd8xQ/UOBb8TovCmMEdUmUQyVo=
MIME-Version: 1.0
Received: by 10.141.22.1 with SMTP id z1mr1647286rvi.230.1246905815949; Mon, 
	06 Jul 2009 11:43:35 -0700 (PDT)
Date: Mon, 6 Jul 2009 14:43:35 -0400
Message-ID: <f96d234e0907061143o6f42c088g3061f27bc2f92970@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: OE weekly changelog 2009-06-29 to 2009-07-06
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
X-List-Received-Date: Mon, 06 Jul 2009 18:56:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OE weekly changelog 2009-06-29 to 2009-07-06

Andrea Adami (1):
  zaurusd: rework patches

Brian Bloniarz (1):
  initscripts: correct checkroot rootfs read-write check

David Batzle (1):
  irrlicht: add recipe to build irrlicht demos against a GLES1.1 lib

Denys Dmytriyenko (5):
  linux-davinci: update to the latest staging/vpfe branch
  linux-davinci: add formal 2.6.30 version
  MAINTAINERS: add my entry
  alsa-utils: add 1.0.20 version
  gdbserver: add 6.6 version - old, but GPLv2

Elena Grandi (15):
  sugar: updated recipe for version 0.84.6
  sugar-artwork: updated recipe for version 0.84.1
  sugar-base: updated recipe for version 0.84.1
  sugar-datastore: updated recipe for version 0.84.0
  sugar-presence-service: updated recipe for version 0.84.0
  sugar-toolkit: updated recipe for version 0.84.4
  etoys: updated recipe for version 4.0.2212
  task-sugar-sucrose: new recipe for a complete sugar environment
  sugar-image: updated to use the task-sugar-sucrose recipe
  xapian-core, xapian-core-native: updated recipes for version 1.0.13
  python-cjson 1.0.5: new recipe
  python-pygtksourceview 2.6.0: new recipe

Florian Boor (7):
  tx25.conf: Use correct kernel
  linux: Remove broken tx25 support from 2.6.30
  linux: Add 2.6.30-rc4 and necessary patches for tx25
  linux: Merge tx25 support into the correct recipe.
  tx25.conf: Prefer a usable kernel
  linux: Delete misnamed recipe
  checksums.init: add checksum for linux kernel patch-2.6.30-rc4.bz2

Holger Hans Peter Freyther (3):
  util-linux-ng: Fix compile of 2.15 for uclibc
  uclibc: Add x86/uClibc.machine for x86 uClibc config
  minimal-uclibc: Upgrade uclibc to 0.9.30.1

Jeremy Lain=E9 (1):
  linux-2.6.29: remove SQN11xx hack for boc01

Koen Kooi (15):
  lirc: update to 0.8.5
  myththv: bump SRCREV
  sugarbase: inherit gnome for gconf and icon helpers
  u-boot git: update beagleboard pinmux
  linux-omap 2.6.29: add support for mmc1 on expansion connector
  php-native: add 5.3.0
  linux-omap 2..29: add mising patch
  linux 2.6.30-rc4: stop violation the versioning policy.
  cwiid: add svn version
  icon-slicer-native: switch to pixbux-native
  loudmouth: add 1.4.3
  python-pygtksourceview: catch up with sourceview renaming

Marcin Juszkiewicz (1):
  classpath: depend on gmp (for libjavamath) and do not use system one

Ottavio Campana (1):
  live555: update to 2009.06

Stanislav Brabec (5):
  libgmime: Packaged versions 2.2.23 (as libgmime) and 2.4.7 (as libgmime-2=
.4)
  balsa: Updated to version 2.4.0.
  epiphany: iso-codes is a runtime dependency.
  pidgin: Updated to version 2.5.8.
  glib-2.0, pango, gtk+: Updated to the latest .4 stable versions.

Bugs fixed:

bug_id resolution        short_desc
5156 WONTFIX     meta-toolchain doesn't produce any *.pc files in deployed =
file

Bugs opened:

bug_id resolution        short_desc


