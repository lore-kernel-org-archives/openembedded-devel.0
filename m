Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdObH-0005KC-64
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 18:05:39 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so4828389eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 08:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=JK72Fzh02GkVF9g4Xl2V5C7L1kGBD5T7CPkS8r1nAWk=;
	b=hgaJ468wwvKk27oVy6snqSC//xY62LwyIlNAhfpdYUzatbBaJ2AE7tofZwd5Rxd9WN
	mpe7PHY1Elmd0SRgxewAfw1HDmngKoNTX0Impln+ASp3/IOIkazV5g13mO3Ke8fJ8QzB
	hd5QnI+oOIxNM1GX9lK+GonmF+aMNEqSSS+zY4WEIRokUNRDh0jInko01udQ0JcGmd7j
	IQt3lYfS+KjB074PYeIU4NAXhE4ogKmM0i2wdnlkrKRirQooegOFzC81VMDGrUFjkFx9
	NBEDNtiHyuCwmycUTQ1ZmjfAK3l6il9q8CfS9m72Kob+f/9KBbaQt735ZEW3mB5HNcvj
	Fbzg==
Received: by 10.14.209.193 with SMTP id s41mr22457572eeo.9.1354035082055;
	Tue, 27 Nov 2012 08:51:22 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w3sm20852806eel.17.2012.11.27.08.51.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 08:51:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 17:51:10 +0100
Message-Id: <cover.1354034673.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH 0/5] [meta-oe] Pending patches
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
X-List-Received-Date: Tue, 27 Nov 2012 17:05:39 -0000

Collection of patches I have for a while..

samba patch was unfortunatelly sent without meta-oe prefix
dhcp patch was ignored by patchwork

The following changes since commit eb63724f431a0fb6b2fec1bd84ae7f04cb8744df:

  python-cheetah : Drop RDEPENDS from native build. (2012-11-27 12:48:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/pending
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pending

Andrei Dinu (1):
  gypsy: added to meta-oe/recipes-navigation

Martin Jansa (4):
  dhcp: rename bbappend to match new version from oe-core and move to
    oe-core prefix
  samba: update waf-as-source.patch to apply
  xserver-nodm-init: replace 'WantedBy=graphical.target' by
    'Alias=display-manager.service'
  xf86-video-glamo: adapt to xserver-0.12 video API

 .../samba/samba-3.6.8/waf-as-source.patch          |   4 -
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb  |   2 +-
 ...mo-driver-adapt-to-xserver-0.13-video-API.patch | 279 +++++++++++++++++++++
 .../xorg-driver/xf86-video-glamo_git.bb            |   3 +-
 .../recipes-navigation/gypsy/files/fixups.patch    |  21 ++
 meta-oe/recipes-navigation/gypsy/gypsy.inc         |  15 ++
 meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb      |  24 ++
 meta-oe/recipes-navigation/gypsy/gypsy_git.bb      |  18 ++
 .../xserver-nodm-init/xserver-nodm.service         |   2 +-
 .../xserver-nodm-init_2.0.bbappend                 |   2 +-
 .../recipes-connectivity/dhcp/dhcp/dhcpd.service   |   0
 .../dhcp/dhcp/dhcrelay.service                     |   0
 .../dhcp/dhcp_4.2.4-P2.bbappend}                   |   0
 13 files changed, 362 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0003-glamo-driver-adapt-to-xserver-0.13-video-API.patch
 create mode 100644 meta-oe/recipes-navigation/gypsy/files/fixups.patch
 create mode 100644 meta-oe/recipes-navigation/gypsy/gypsy.inc
 create mode 100644 meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb
 create mode 100644 meta-oe/recipes-navigation/gypsy/gypsy_git.bb
 rename meta-systemd/{meta-oe => oe-core}/recipes-connectivity/dhcp/dhcp/dhcpd.service (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-connectivity/dhcp/dhcp/dhcrelay.service (100%)
 rename meta-systemd/{meta-oe/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bbappend => oe-core/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend} (100%)

-- 
1.8.0



