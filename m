Return-Path: <ben.shelton@ni.com>
X-Greylist: delayed 726 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 May 2014 17:44:12 UTC
Received: from ni.com (unknown [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id B84FA60167
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 17:44:12 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s4CHW7IE017594 for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 12:32:07 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP5)
	with ESMTP id 2014051212320777-1004972 ;
	Mon, 12 May 2014 12:32:07 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 May 2014 12:31:47 -0500
Message-Id: <cover.1399914295.git.ben.shelton@ni.com>
X-Mailer: git-send-email 1.9.3
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP5|July 31, 2013) at 05/12/2014 12:32:07 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP5|July
	31, 2013) at 05/12/2014 12:32:07 PM,
	Serialize complete at 05/12/2014 12:32:07 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.11.96, 1.0.14,
	0.0.0000
	definitions=2014-05-12_03:2014-05-12, 2014-05-12,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH 0/7] Add core 100 DPI X.org fonts
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 May 2014 17:44:17 -0000

Adding back a fixed-up version of the bdftopcf tool, and adding recipes for the 
core X.org 100 DPI fonts, along with a packagegroup recipe to build them all.

The following changes since commit 55b09e522ca88c0c0b2dd7a36e4861a1cf6ca9c6:

  klcc_cross: move in target sysroot as crossscript (2014-05-04 11:41:12 +0100)

are available in the git repository at:

  git://github.com/ni/meta-oe dev/bshelton/fonts
  https://github.com/ni/meta-oe/tree/dev/bshelton/fonts

Ben Shelton (7):
  bdftopcf: add recipe
  font-adobe-100dpi: add recipe
  font-adobe-utopia: add recipe
  font-bh-100dpi: add recipe
  font-bh-lucidatypewriter: add recipe
  font-bitstream-100dpi: add recipe
  xorg-fonts-100dpi: add recipe

 meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb       | 13 +++++++++++++
 .../recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb | 14 ++++++++++++++
 .../xorg-font/font-adobe-utopia-100dpi_1.0.4.bb           | 15 +++++++++++++++
 .../recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb    | 14 ++++++++++++++
 .../xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb    | 14 ++++++++++++++
 .../xorg-font/font-bitstream-100dpi_1.0.3.bb              | 14 ++++++++++++++
 meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb   | 14 ++++++++++++++
 7 files changed, 98 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
 create mode 100644 meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb

-- 
1.9.3


