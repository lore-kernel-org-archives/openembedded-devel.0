Return-Path: <ticotimo@gmail.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6347D6AC93
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 04:07:53 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id im17so9858030vcb.31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jul 2014 21:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=3RPXIefgG9mt8FT2Ye2onV98vzKttZvgfe5us2jsMxw=;
	b=GqlzB0I6ekFvwuNnqMyBJXIDEeh6d7x3a0uphkXYOPVaQwOPdVHayf9PyS7j0KC/OO
	KXgp04UUwLIDaeJamNBoxx76OAulneQItl8PitDSE/C+eqwggOCCAvQQK0xVEtk20aIA
	Bw465m+tbEGswPVZ61c2b+40T92VCBY/hOFaLRvY4OY+ORmp7W2BjbffkQGCjKhDs6pM
	uy8AxavEHet3Ni/Dzgj47+uMYII17gWRErMC02uK2jITe2ARpG5/2SVh5IveKrc366v8
	QK9eY2xFEPzhHDtkM7pX0fj1i/krgMvdIIox1k/tjp6XGAmbGnUpsq7dzueeWeRVX+Uu
	XomQ==
X-Received: by 10.52.138.7 with SMTP id qm7mr15694612vdb.7.1405829274831;
	Sat, 19 Jul 2014 21:07:54 -0700 (PDT)
Received: from localhost.localdomain.com ([196.40.10.133])
	by mx.google.com with ESMTPSA id n7sm2868785ven.1.2014.07.19.21.07.52
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Jul 2014 21:07:53 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Jul 2014 21:07:36 -0700
Message-Id: <1405829260-13293-1-git-send-email-TicoTimo@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [meta-multimedia][PATCH 0/4] vlc: B!=S and pkg-config friendly
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
X-List-Received-Date: Sun, 20 Jul 2014 04:07:56 -0000

* Cleanup do_configure, upstream is more autoreconf friendly
* Inherit pkgconfig, upstream is more pkg-config friendly
* Remove EXTRA_OECONF --enable-live555, add PACKAGE_CONFIGURE ?= "live555"

Tim Orling (4):
  vlc.inc: cleanup configure, inherit pkgconfig
  vlc: use AM_PATH_LIBGCRYPT instead of libgcrypt-config
  vlc: modules/gui/qt4/Modules.am not B!=S friendly
  vlc: add patches to fix B!=S and pkg-config

 meta-multimedia/recipes-multimedia/vlc/vlc.inc     | 33 +++++++---------
 .../vlc/vlc/0003-use-am-path-libgcrypt.patch       | 46 ++++++++++++++++++++++
 .../0004-modules-gui-qt4-out-of-tree-build.patch   | 17 ++++++++
 .../recipes-multimedia/vlc/vlc_2.1.4.bb            |  2 +
 4 files changed, 80 insertions(+), 18 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0003-use-am-path-libgcrypt.patch
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0004-modules-gui-qt4-out-of-tree-build.patch

-- 
1.9.3


