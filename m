Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QRRFe-0001gM-32
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 May 2011 17:53:03 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3662569fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 08:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=UvgwTTzBFTWBZ6STfTbkX8YRZdB9JTaBK9A3DVIaK2w=;
	b=M+U6p1FZ6mOBRdtmKub32ymKeRJV18zrunqDwe4HdJyy1KJSCmqmIhWE/1lvKSV6bP
	bw8pjhTbCbmdxiRLYhaWB5LKQyUHA7ycVpYmg4zDV3vbjwsfg2IKWXIb/+XsCgWHBZKr
	9JxNm5xeT2oW2Hnxv/iHR4rDuGoUeMy9mfePU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=D4HCPAH0om8JzRnf9D3Drxa2hSG75n2Id00LrXuhIRuD5BEBqryeTZ9XcI/cf6Tnu+
	nbT21X4shhtV/xYw4oAtPI1eyL1tCn2w09fyhrwXw3zd1NvteWvq4QImyRhXCuHDWKxe
	eNeZL8DDVyufvFBJrUBoWrfF6pQv6nMiab4fE=
Received: by 10.223.44.86 with SMTP id z22mr7156774fae.3.1306856993179;
	Tue, 31 May 2011 08:49:53 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id b26sm91864fak.0.2011.05.31.08.49.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 08:49:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 May 2011 17:49:45 +0200
Message-Id: <cover.1306856963.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
Subject: [meta-oe][PATCH 0/3] Pull request #14
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
X-List-Received-Date: Tue, 31 May 2011 15:53:03 -0000

The following changes since commit 658bd7ef32390e5d364fb41ba93363b5ee8eeb3b:

  systemd-compat-units: package to fixup the rootfs, shouldn't be needed in the future (2011-05-31 14:50:38 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/meta-oe
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-oe

Martin Jansa (3):
  xserver-xorg: upgrade from 1.10.1.902 to 1.10.2 and replace part of
    randr-support.patch with upstream patch
  librsvg: replace .bb with smaller .bbappend
  gpsd,tangogps,foxtrotgps,navit: move to new recipes-navigation

 .../recipes-gnome/librsvg/librsvg_2.32.1.bbappend  |    2 +
 .../50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd.patch |   61 ++++++++++++++++++++
 ...ack-assume-pixman-supports-overlapped-blt.patch |    0
 .../hack-fbdev-ignore-return-mode.patch            |    0
 .../randr-support.patch                            |   41 ++-----------
 .../replace-pkgconfig-sdkdir-poking.patch          |    0
 ...r-xorg_1.10.1.901.bb => xserver-xorg_1.10.2.bb} |    9 ++-
 .../foxtrotgps/foxtrotgps_1.0.1.bb                 |    0
 .../gpsd/gpsd-2.95/60-gpsd.rules                   |    0
 .../gpsd/gpsd-2.95/gpsd                            |    0
 .../gpsd/gpsd-2.95/gpsd-default                    |    0
 .../gpsd/gpsd-2.95/libtool.patch                   |    0
 .../gpsd/gpsd_2.95.bb                              |    0
 .../navit/navit-fpu.inc                            |    0
 .../navit/navit-icons/GPL-2                        |    0
 .../navit/navit-icons/configure.in                 |    0
 .../navit/navit-icons_svn.bb                       |    0
 .../navit/navit.inc                                |    0
 .../navit/navit/maps.xml                           |    0
 .../navit/navit/navit.xml                          |    0
 .../navit/navit/osd.xml                            |    0
 .../navit/navit/plugins.xml                        |    0
 .../navit/navit/speech.xml                         |    0
 .../navit/navit_svn.bb                             |    0
 .../tangogps/tangogps_0.99.4.bb                    |    0
 meta-oe/recipes-support/librsvg/librsvg_2.26.2.bb  |   42 -------------
 26 files changed, 74 insertions(+), 81 deletions(-)
 create mode 100644 meta-oe/recipes-gnome/librsvg/librsvg_2.32.1.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-xserver/xserver-xorg-1.10.2/50b9d3142ff90af2f7fa35b7b1bf9e5a07723dbd.patch
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.1.901 => xserver-xorg-1.10.2}/hack-assume-pixman-supports-overlapped-blt.patch (100%)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.1.901 => xserver-xorg-1.10.2}/hack-fbdev-ignore-return-mode.patch (100%)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.1.901 => xserver-xorg-1.10.2}/randr-support.patch (75%)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg-1.10.1.901 => xserver-xorg-1.10.2}/replace-pkgconfig-sdkdir-poking.patch (100%)
 rename meta-oe/recipes-graphics/xorg-xserver/{xserver-xorg_1.10.1.901.bb => xserver-xorg_1.10.2.bb} (79%)
 rename meta-oe/{recipes-support => recipes-navigation}/foxtrotgps/foxtrotgps_1.0.1.bb (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/gpsd/gpsd-2.95/60-gpsd.rules (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/gpsd/gpsd-2.95/gpsd (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/gpsd/gpsd-2.95/gpsd-default (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/gpsd/gpsd-2.95/libtool.patch (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/gpsd/gpsd_2.95.bb (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit-fpu.inc (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit-icons/GPL-2 (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit-icons/configure.in (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit-icons_svn.bb (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit.inc (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit/maps.xml (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit/navit.xml (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit/osd.xml (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit/plugins.xml (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit/speech.xml (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/navit/navit_svn.bb (100%)
 rename meta-oe/{recipes-support => recipes-navigation}/tangogps/tangogps_0.99.4.bb (100%)
 delete mode 100644 meta-oe/recipes-support/librsvg/librsvg_2.26.2.bb

-- 
1.7.5.3



