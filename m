Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 041F5718E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 05:54:06 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id k48so12921157wev.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 21:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=htIZFB7lBW8IDXWuKLaND9u8h1P9YWDCQ+FI6LX6ZBM=;
	b=nRq4CNaIRMDhsSW0NAYih6jU4Un70rC0UA1PogMxSZsHdcKJH3tsN+XsCZeXyRl9AZ
	SuOs2CFv5LZ5CD7xtIMXeWhygrzELBEmILPSVOAan2fjGO8k+J3n1DGWw4br/htv4phV
	ZdJoCsJRIb+NT90tI8e9Gwpg09vB9NSb77yyQgumfj3/mRXZTxTsxvdYx7LxHiVjq+I7
	cYSZPugC6s499Z9vE7Vm1jPlc873xHQo3SkR8w1JDPKPnVU1Oj30zKO698U1+asHL9gG
	iddiGjiYTDFHVfbJechg/2ivpRrEUIOL1Suh7p3Mg8CuAGhrawWjWubm5gLm6VoEdNkn
	4wLA==
X-Received: by 10.194.184.140 with SMTP id eu12mr50841937wjc.25.1422338046298; 
	Mon, 26 Jan 2015 21:54:06 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-254-85.hsi05.unitymediagroup.de. [176.198.254.85])
	by mx.google.com with ESMTPSA id
	gm10sm16610857wib.19.2015.01.26.21.54.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jan 2015 21:54:05 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jan 2015 06:53:48 +0100
Message-Id: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 0/5] qt-creator for target machine
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
X-List-Received-Date: Tue, 27 Jan 2015 05:54:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These patches were build tested for 5.4.0 with all qt5 recipes I am working on
currently (kf5/hawaii/mauii). Git versions were not yet tested.
On target:

* toolchain was set
* QT5 c++ project was build and debugged

We shall see what Martin's world says - maybe we need a EXCLUDE_FROM_WORLD for
meta-oe's qt-creator (conditional on meta-qt5 included in layer).

Andreas Müller (5):
  qtbase: remove patches required for native(-sdk) only
  qtbase/EXTERNAL_HOST_BINS: split out code only required for
    native-(sdk)
  qtbase: build qmake for target with paths aligned
  qt5-creator: add 3.3.0 of qt-creator
  add gdb append to enable python packageconfig

 recipes-devtools/gdb/gdb_%.bbappend                |   1 +
 recipes-qt/qt5/nativesdk-qtbase.inc                |   1 +
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |   1 +
 ...t-creator-to-build-on-arm-aarch32-and-aar.patch |  94 ++++++++++++++++++
 recipes-qt/qt5/qt5-creator/qtcreator.desktop.in    |  10 ++
 recipes-qt/qt5/qt5-creator_3.3.0.bb                |  87 +++++++++++++++++
 recipes-qt/qt5/qtbase-native.inc                   |   1 +
 recipes-qt/qt5/qtbase.inc                          |  27 +++---
 .../0003-Add-external-hostbindir-option.patch      |  75 ---------------
 ...-build-it-in-configure-but-allow-to-build.patch |  27 ++++--
 ...014-Add-external-hostbindir-option-native.patch | 106 +++++++++++++++++++++
 .../0015-Set-paths-for-target-properly.patch       |  72 ++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |   3 +-
 13 files changed, 407 insertions(+), 98 deletions(-)
 create mode 100644 recipes-devtools/gdb/gdb_%.bbappend
 create mode 100644 recipes-qt/qt5/qt5-creator/0001-Fix-Allow-qt-creator-to-build-on-arm-aarch32-and-aar.patch
 create mode 100644 recipes-qt/qt5/qt5-creator/qtcreator.desktop.in
 create mode 100644 recipes-qt/qt5/qt5-creator_3.3.0.bb
 create mode 100644 recipes-qt/qt5/qtbase/0014-Add-external-hostbindir-option-native.patch
 create mode 100644 recipes-qt/qt5/qtbase/0015-Set-paths-for-target-properly.patch

-- 
1.8.3.1


