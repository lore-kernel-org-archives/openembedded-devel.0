Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id C6253717F6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2014 04:06:20 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id em10so6519253wid.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Oct 2014 21:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xgxNG+qkqG414qiKncO3cAA4PIpcHqu9f8xFT8B+6CQ=;
	b=nBBOSeQaGLWnN3Op/renv3grC+JOtjW0y9czmnX5jTNuXWzF0+7YLb0Wxvh+cFeqFt
	IazDvhhtXQsE/yvVQzuPkD48MQRBWwMC/mZmUKThi3Ovbq8RfmIldsB5XjRYPStu5hnO
	zoCf1nVIpf1Twgv5NcpzT1vs7dS7Rvl94OafOhozeBG0uusYcfVztWdMYJKW+N1Hl+XR
	NtTo3nyzqAjfcvV2+ZfyJpklKvPaO0LThS/3dS5bbDrJFW9JtRD1ufJg5qz1pATRIVhc
	qxDC2upPfoTUeCZX2FMxvvHq4ouD+lrv//TXHgAJc9v75zpUhBuk6hS7L20dXKuvHXKR
	pQsA==
X-Received: by 10.180.10.162 with SMTP id j2mr24736017wib.72.1412654781566;
	Mon, 06 Oct 2014 21:06:21 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lp8sm13150324wic.17.2014.10.06.21.06.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Oct 2014 21:06:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Oct 2014 06:07:21 +0200
Message-Id: <1412654841-18553-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [meta-qt5][PATCH] qtbase: don't stage the fonts directory
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
X-List-Received-Date: Tue, 07 Oct 2014 04:06:27 -0000

* the staged files conflict with fonts staged by qt4-embedded and we don't need
  them in sysroot at all

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 176aec4..389d356 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -249,3 +249,8 @@ FILES_${PN}-fonts-pfb            = "${OE_QMAKE_PATH_LIBS}/fonts/*.pfb"
 FILES_${PN}-fonts-qpf            = "${OE_QMAKE_PATH_LIBS}/fonts/*.qpf*"
 FILES_${PN}-fonts                = "${OE_QMAKE_PATH_LIBS}/fonts/README \
                                     ${OE_QMAKE_PATH_LIBS}/fonts/fontdir"
+
+sysroot_stage_dirs_append() {
+    # $to is 2nd parameter passed to sysroot_stage_dir, e.g. ${SYSROOT_DESTDIR} passed from sysroot_stage_all
+    rm -rf $to${OE_QMAKE_PATH_LIBS}/fonts
+}
-- 
2.1.1


