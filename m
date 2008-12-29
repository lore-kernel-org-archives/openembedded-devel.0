Received: from [209.85.198.246] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LHLnW-0008Ey-87
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Dec 2008 18:21:06 +0100
Received: by rv-out-0708.google.com with SMTP id f25so5367585rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2008 09:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=WPkFSpav5niLbxRdX61PA9ylIXxBn8JXTalqkJvIGc0=;
	b=FPcz/Ay2zJ5i+xzCaAMp1Lr9TH6yPZx5DC1h6WnzljbO0E1Gtla1jfSX205qXNBDxw
	fs6STSvs+k202q2obW1+/XKBEgqIy7dYJmG+ZFzdhI5wSBvRh41gxqOwgd00G7MJts59
	1puN0H7u8ibGNGvwqVDS8rB3MpBwjcJhxQ+a8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=ORwp2Ym2FTXWJgQEutZD1hYUZfLaagCfOT2PzbrKNLZOy8Ul5v4VWQZEH5O0Wf2Rp/
	pVmD7iHj+eT8/ZGHC+8+RWoD92AbjcXLKE+Pw/PBVOmhKc4qIOjwzzVCWsFbhvT0evRU
	vNt/2QvJ1uHCt1u0tzgEaQ99qVTVuN8UpmiA8=
Received: by 10.141.69.1 with SMTP id w1mr6838320rvk.119.1230570901085;
	Mon, 29 Dec 2008 09:15:01 -0800 (PST)
Received: by 10.141.142.17 with HTTP; Mon, 29 Dec 2008 09:15:00 -0800 (PST)
Message-ID: <f96d234e0812290915s572f1bb8wf8c33a5892c79051@mail.gmail.com>
Date: Mon, 29 Dec 2008 12:15:00 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: OE weekly changelog 2008-12-22 to 2008-12-29
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
X-List-Received-Date: Mon, 29 Dec 2008 17:21:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

OE weekly changelog 2008-12-22 to 2008-12-29

Gregoire Gentil (2):
      samba: stage more libs
      gegl: fix ffmpeg API usage

Jeremy Lain=E9 (11):
      linux-2.6.26: fix boc01 keyboard driver's repeat rate
      linux-2.6.26: cleanup boc01 keyboard driver
      librfid: add symlink to /dev/spidev for SPI backend
      udev: add boc01-specific mount.sh script
      linux-2.6.27: add support for boc01
      librfid: cherrypick patches from http://www.nixda.biz/librfid/
      psplash: add 1bpp support for boc01
      vsftpd: improve default configuration
      lftp: switch to main mirror
      psplash: add config file to pass parameters to psplash

John Lee (4):
      update-rc.d.bbclass: honor $D as well in updatercd_postrm
      udev_*.bb: honer $D in postinst scripts.
      avahi: fix postinst script error
      initscripts: remove om-gta01/inittab.  It's not used.

Julian_chu (1):
      task-openmoko-toolchain-*.bb: clean up and move some libraries.

Koen Kooi (14):
      vlc: add ARM_INSTRUCTION_SET =3D "arm", it doesn't build otherwise
for armv5te
      pidgin: update to 2.5.3
      powervr-drivers: add recipe that turns an omap35x SDK into
installable packages
      checksums.ini: add pidgin 2.5.3
      pico-dlpcontrol: swith to msp430 address instead of fpga address
      e.bbclass: run make distclean in ${S}, not after to fetch where
it will invoke a makefile in $PWD
      angstrom feed builder: add palmt650
      angstrom feed sorter: att palmt650 and palmt680
      firefox.inc: forcefeed mozilla our LDFLAGS to get gnu hash working
      fennec: update to 1.0alpha2
      gimp: add gdk-pixbuf-csource-native to DEPENDS
      linux-omap git: update evm defconfig

Marcin Juszkiewicz (1):
      alix: set PACKAGE_EXTRA_ARCHS only in tune-geodelx.inc - closes #4943

Michael 'Mickey' Lauer (1):
      usb-gadget-mode: remove excessive whitespace and fix PACKAGE_ARCH set=
ting

Mike Westerhof (9):
      SlugOS: meta/slugos-packages - demote pvrusb2-mci (needs update
for new kernel)
      madwifi: undefine LDFLAGS env var before we do oemake
      checksums.ini: add latest version of madwifi-ng
      madwifi-ng: significant update to latest upstream; default only for S=
lugOS
      linux-ixp4xx: 2.6.27.8 kernel, Machine=3Dnslu2 defconfig changes
      linux-ixp4xx: 2.6.27.8 kernel, Machine=3Dnslu2 defconfig - remove ar5=
k
      wpa-supplicant: minor edits to helper scripts for busybox compatibili=
ty.
      ftpd-topfield: add patch for 2.6.23 kernel headers
      opkg_wget_nogpg: dramatically reduce memory footprint, too dodge
OOM killer.

Robert Schuster (4):
      libice-native 1.0.4: Add proper PROVIDES.
      libxt-native 1.0.5: New recipe.
      llvm-native 2.4: New recipe.
      vlc 0.9.8a: New recipe.

Shane Volpe (2):
      MAINTAINERS:
      checksums.ini:

 Bugs fixed:

bug_id resolution        short_desc
4943 FIXED       Your PACKAGE_ARCHS field contains duplicates:
alix.conf and tune-geodelx.inc

Bugs opened:

bug_id resolution        short_desc
4950     base.bbclass allways overrides FILESPATH


--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Cliff Brake
http://bec-systems.com


