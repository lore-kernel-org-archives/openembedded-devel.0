Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 39B3D79BCD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 17:48:18 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id r64-v6so6544328pfb.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 10:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SgT6m/p5QccEqXlSNDxqdwndsue5/GEyK4ejsO+ZKkE=;
	b=PmwlaRKDfaSs2vhJ590msglcqya8TA7Al9RVyVCzKNTlhjPCmsMfRXTfOYU+ykMic5
	/mEmHQRribTgSN1/4i9N/FNpVDwlk+BpuFDVNiqnFXQIi6mN2UREeCxLreA/4IWi/o+a
	DX4R26QXCa6w83elL3JTWANDvrKK5w7ILcaTNY+lCXtWV6X9nbEeRWGOU/i7Ybg/xHMS
	PXNGqfWToKYVIbNnYvyP95hL1BPZoW7m2KB9XQvYVCL17oT0kZb8x5DesomEyq8Rrk+I
	TEuT1Pb3r/hVubrcv+aFXtdsih81azIeuPlbo3ZcrY8H9adN22nUCq4cd7M490f2F9ZW
	Bt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SgT6m/p5QccEqXlSNDxqdwndsue5/GEyK4ejsO+ZKkE=;
	b=c98eacZ4qhd+uPctDwy6mmH2HqSpBWmsqupwbWcTZGTdJUcy5xg8iIf9ut21PvRp/Z
	Bparga4BetUNSQgun8qA/mK8YdtIreZoXZE/qgbpXcwQG5qUI7nstWS8YIg4YoVSRhJ2
	0LI90hste0F0Fswo8NWm9Y++00jTlgJ8G0ODiLGggipKpeuvCkQiQ+Ag5ZqatpmUGwn9
	UurE6f7ZyEUU6sdoHGjE/EeY9E32jnksS121++21tenppDoumEapj6fd06l1XGgY0T77
	XkvkcsAKd4QF3xS5dLSpdzsNiPd3WXYmYVhdjs+HzP3sG4DToO7AtN5xMavrZZcEQGa9
	I91w==
X-Gm-Message-State: ABuFfojdoHCi0QYg1HUoIl1i00h2Tmw9Fc8yws2CZWLvozVibv0u2ccu
	Z4z/mQw2FegvRm8/1Qc9fnacuWnR
X-Google-Smtp-Source: ACcGV62EBT6G64NjnBG3FqK6wfbS2OULW6c8a8xgI7FTWS/7wqFp/7t/8stqiz1nujPRG8mnv+guQQ==
X-Received: by 2002:a63:e442:: with SMTP id
	i2-v6mr6446756pgk.381.1539366498756; 
	Fri, 12 Oct 2018 10:48:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::939f])
	by smtp.gmail.com with ESMTPSA id
	h63-v6sm2454588pge.48.2018.10.12.10.48.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Oct 2018 10:48:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Oct 2018 10:48:09 -0700
Message-Id: <20181012174809.23154-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [sumo][meta-qt5][PATCH] qtdeclarative: Backport patch to silence spurious warnings
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Oct 2018 17:48:18 -0000
Content-Transfer-Encoding: 8bit

This helps in reducing clutter in syslogs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-Software-render-Fix-warnings-flood.patch | 33 +++++++++++++++++++
 recipes-qt/qt5/qtdeclarative_git.bb           |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 recipes-qt/qt5/qtdeclarative/0001-Software-render-Fix-warnings-flood.patch

diff --git a/recipes-qt/qt5/qtdeclarative/0001-Software-render-Fix-warnings-flood.patch b/recipes-qt/qt5/qtdeclarative/0001-Software-render-Fix-warnings-flood.patch
new file mode 100644
index 0000000..7557e53
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative/0001-Software-render-Fix-warnings-flood.patch
@@ -0,0 +1,33 @@
+From d4f89ae32e0f206dc3609467e9923652d0ec56d1 Mon Sep 17 00:00:00 2001
+From: Friedemann Kleint <Friedemann.Kleint@qt.io>
+Date: Mon, 19 Feb 2018 11:51:24 +0100
+Subject: [PATCH] Software render: Fix warnings flood
+
+Add missing QPainter::end(), fixing:
+
+QBackingStore::endPaint() called with active painter on backingstore paint device
+
+Task-number: QTBUG-66452
+Change-Id: Ia00e61953528b15015b3e41ba1868e670818cf14
+Reviewed-by: Laszlo Agocs <laszlo.agocs@qt.io>
+(cherry picked from commit 047f161b1a706e81034ccd8d4700a3126c16dfe4)
+Upstream-Status: Backport
+---
+ .../scenegraph/adaptations/software/qsgsoftwarerenderer.cpp      | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/quick/scenegraph/adaptations/software/qsgsoftwarerenderer.cpp b/src/quick/scenegraph/adaptations/software/qsgsoftwarerenderer.cpp
+index d403884b4..ffcee5f56 100644
+--- a/src/quick/scenegraph/adaptations/software/qsgsoftwarerenderer.cpp
++++ b/src/quick/scenegraph/adaptations/software/qsgsoftwarerenderer.cpp
+@@ -156,6 +156,7 @@ void QSGSoftwareRenderer::render()
+     m_flushRegion = renderNodes(&painter);
+     qint64 renderTime = renderTimer.elapsed();
+ 
++    painter.end();
+     if (m_backingStore != nullptr)
+         m_backingStore->endPaint();
+ 
+-- 
+2.19.1
+
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index d6f468f..32e12de 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.GPL3-EXCEPT;md5=763d8c535a234d9a3fb682c7ecb6c073 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
 "
+SRC_URI += "file://0001-Software-render-Fix-warnings-flood.patch"
 
 DEPENDS += "qtbase"
 
-- 
2.19.1


