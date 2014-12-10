Return-Path: <folkus@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id BAF0D72573
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 11:48:15 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so10926600wiv.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Dec 2014 03:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oPrDyFy/OQe0PXTznLMDPHGothUErG/oemgRBasvdJc=;
	b=Ey9YfM5bBLg1AcQAz5XmAZjxdI7KBKdb9ynxII16ARIsbqi2J65vC0WQI8AGOhmSJq
	d+14Iy1Mu8yt3nGpDKUVxbheYog4TPDNNbA8RylYc6EerLPXZpfmYuIB4+FSuct2XmRY
	E/C/L62htK6H2AxdO69LlZjg40UZ9WOa/InttjJNRJYVTW1MByy+8+htWbYMHBiq/akB
	q92lKS1yBTtd08U5jQB5lBwMyxfCudJQGGWFOIolROtS8yyyZ/7+W3faIPKF/weTpI4o
	QWr3ewq8ZXvMpea0/tnU4dqowMcHKEcBNsaU9l+qbbrMB7b0kP0DTL3PJU3zdygTA7aK
	rV0w==
X-Received: by 10.180.90.206 with SMTP id by14mr12599679wib.67.1418212096374; 
	Wed, 10 Dec 2014 03:48:16 -0800 (PST)
Received: from localhost.localdomain ([87.105.187.254])
	by mx.google.com with ESMTPSA id pl1sm6008200wic.16.2014.12.10.03.48.15
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 10 Dec 2014 03:48:15 -0800 (PST)
From: =?UTF-8?q?S=C5=82awomir=20Paszko?= <folkus@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Dec 2014 12:48:00 +0100
Message-Id: <1418212081-32563-1-git-send-email-folkus@gmail.com>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] SRCREV was change to newest (03.12.2014) since the previous revision was outdated. LIC_FILE_CHKSUM was changed. Added qtmultimedia to DEPENDS.
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
X-List-Received-Date: Wed, 10 Dec 2014 11:48:18 -0000

From: folkien <folkus@gmail.com>

---
 recipes-qt/examples/qt5everywheredemo_1.0.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb b/recipes-qt/examples/qt5everywheredemo_1.0.bb
index 4f7022c..7d1b42b 100644
--- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
+++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
@@ -2,11 +2,10 @@ SUMMARY = "Qt5 everywhere demo"
 DESCRIPTION = "Quick tour of Qt 5.0, primarily focusing on its graphical capabilities."
 HOMEPAGE = "https://qt.gitorious.org/qt-labs"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://main.cpp;md5=1187cb795a0f96bce64e63dd1a67dc2b"
+LIC_FILES_CHKSUM = "file://main.cpp;md5=a3ecdc1d777da347f1bf35dd9966606f"
+DEPENDS = "qtdeclarative qtgraphicaleffects qtmultimedia"
 
-DEPENDS = "qtdeclarative qtgraphicaleffects"
-
-SRCREV = "9a868f96ee63c21ceda890d8dfc9d33f093d1b6d"
+SRCREV = "6178748a6ea34df40a8e3c9ce67137e33383bb0e"
 SRC_URI = "git://gitorious.org/qt-labs/qt5-everywhere-demo.git"
 
 S = "${WORKDIR}/git/QtDemo"
-- 
2.2.0


