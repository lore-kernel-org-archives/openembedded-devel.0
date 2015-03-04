Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id F2D547376C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2015 09:02:43 +0000 (UTC)
Received: by wevl61 with SMTP id l61so44936187wev.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2015 01:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=l0m/F5ilOH2UiUNhh2xXGxFque3viI6jJfdr2Hh5FIw=;
	b=SxQzWoYG64eOm27gYvIjE4HjUv0/omRXxeSpAP/Sj2xg6X8CrRrLHASffUE5ZJXFsJ
	wGirdbPr2jiNqoK04xc2sEcgwpJiAzOh8JMxdfhZep6CeXZiS2BKcdkV01HDy6s0i6CX
	afD2/lM7apbvgZ46dxnJR5U0RUvLEYtq5QUGr0E4tzAZh29pz7Lk7IZNRqJ/gWc4+19b
	q4bOY0atYZhFuvBEybmalaOMePL3NDL03TwRocbsZJbPW2TAwBpxDNahLplmOhvAXa3q
	1ZiUNZFCJrEXLNkL8qf7EUuA560+EiLldUmrjG72IIAuzRFgZbLHORi1g3CcSwzP7kNK
	l35Q==
X-Received: by 10.194.24.103 with SMTP id t7mr5613033wjf.15.1425459762984;
	Wed, 04 Mar 2015 01:02:42 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-254-85.hsi05.unitymediagroup.de. [176.198.254.85])
	by mx.google.com with ESMTPSA id lj13sm6128171wic.9.2015.03.04.01.02.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Mar 2015 01:02:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2015 10:02:10 +0100
Message-Id: <1425459730-7272-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1425459730-7272-1-git-send-email-schnitzeltony@googlemail.com>
References: <1425459730-7272-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 2/2] qt5-creator: update to 3.3.1
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
X-List-Received-Date: Wed, 04 Mar 2015 09:02:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* LGPL_EXCEPTION.TXT: 'Digia' -> 'The Qt Company'
* LICENSE.LGPLv3: Preamble added
* LICENSE.LGPLv21: Preamble added

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-qt/qt5/{qt5-creator_3.3.0.bb => qt5-creator_3.3.1.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename recipes-qt/qt5/{qt5-creator_3.3.0.bb => qt5-creator_3.3.1.bb} (88%)

diff --git a/recipes-qt/qt5/qt5-creator_3.3.0.bb b/recipes-qt/qt5/qt5-creator_3.3.1.bb
similarity index 88%
rename from recipes-qt/qt5/qt5-creator_3.3.0.bb
rename to recipes-qt/qt5/qt5-creator_3.3.1.bb
index cbcd4bb..8f993ca 100644
--- a/recipes-qt/qt5/qt5-creator_3.3.0.bb
+++ b/recipes-qt/qt5/qt5-creator_3.3.1.bb
@@ -9,9 +9,9 @@ SUMMARY = "Qt Creator is a new cross-platform Qt IDE"
 HOMEPAGE = "https://qt-project.org/"
 LICENSE = "LGPLv2.1 | GPLv3"
 LIC_FILES_CHKSUM = " \
-    file://LGPL_EXCEPTION.TXT;md5=eb6c371255e1262c55ae9b652a90b528 \
-    file://LICENSE.LGPLv21;md5=243b725d71bb5df4a1e5920b344b86ad \
-    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+    file://LGPL_EXCEPTION.TXT;md5=f4748b0d1a72c5c8fb5dab2dd1f7fa46 \
+    file://LICENSE.LGPLv21;md5=825920de5f6db2eeb1bebe625476346d \
+    file://LICENSE.LGPLv3;md5=0786418af032b9e608909874f334a2d1 \
 "
 
 inherit qmake5
@@ -23,8 +23,8 @@ SRC_URI = " \
     file://0001-Fix-Allow-qt-creator-to-build-on-arm-aarch32-and-aar.patch \
     file://qtcreator.desktop.in \
 "
-SRC_URI[md5sum] = "5e33988908282c779f2e6e4dca2bba3e"
-SRC_URI[sha256sum] = "27a5c8815fab95f959134047f8315686de4de6f99b0bedfd46b5dedae390525a"
+SRC_URI[md5sum] = "54cb5918c6852731612672a22627dd08"
+SRC_URI[sha256sum] = "afefb73a05cdc36cdfb8a760c2b39eb6c366a22ef47c7d365d446092dd1d5331"
 
 S = "${WORKDIR}/qt-creator-opensource-src-${PV}"
 
-- 
1.9.3


