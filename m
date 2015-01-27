Return-Path: <coldnew.tw@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 79B8E6AC95
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jan 2015 06:27:07 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id y13so16934734pdi.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 22:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UhCsSMC5M8rfevPE5WfVCCli2vEnEYGxIT3Pcj9SVDk=;
	b=WyPmCFukh1qWjzliwJRK+FZ7Uy+tyEKGTb/7mrz8b6/CMnig8ThXJAV3eQU1el8O2e
	/pQWQUA1ewYBf60OWr6hsmWWBnCI6RGw799yNqM5LLk0QZx7vXxnKbK0RUYv5aBbdrZT
	KYD8gZ866Lj7jnA12y8rS1mbJ2+TrLhkkJ9hUEPzMdQUNDHNpjfxbkWp4qWkR/nw4vod
	BDdBL+HNJiSqDh9z3ImqlVOP5DTvGkO4RHu3aJJBJTeFKobneyFH5g4TnEmQUEr8fyRa
	WCreJqcnNF8VGir5GrEX9sMNuqlmVaz2fECLwnGPTmNlrVfimElAkQJ8HvTf4i8wAGLy
	8jIg==
X-Received: by 10.70.42.65 with SMTP id m1mr10115600pdl.123.1422340028174;
	Mon, 26 Jan 2015 22:27:08 -0800 (PST)
Received: from localhost.localdomain ([203.70.194.104])
	by mx.google.com with ESMTPSA id gl6sm431960pbc.26.2015.01.26.22.27.05
	(version=TLSv1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Jan 2015 22:27:06 -0800 (PST)
From: Yen-Chin Lee <coldnew.tw@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jan 2015 14:26:55 +0800
Message-Id: <1422340015-44159-1-git-send-email-coldnew.tw@gmail.com>
X-Mailer: git-send-email 1.9.3 (Apple Git-50)
Subject: [meta-raspberrypi][PATCH v2] qtbase: Add basic Qt5 building support
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
X-List-Received-Date: Tue, 27 Jan 2015 06:27:10 -0000

To build raspberrypi with Qt5, we need to add extra QT_CONFIG_FLAGS to
indicate device config.

Signed-off-by: Yen-Chin Lee <coldnew.tw@gmail.com>
---
 qt5-layer/recipes-qt/qt5/qtbase_%.bbappend | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 qt5-layer/recipes-qt/qt5/qtbase_%.bbappend

diff --git a/qt5-layer/recipes-qt/qt5/qtbase_%.bbappend b/qt5-layer/recipes-qt/qt5/qtbase_%.bbappend
new file mode 100644
index 0000000..384df9f
--- /dev/null
+++ b/qt5-layer/recipes-qt/qt5/qtbase_%.bbappend
@@ -0,0 +1,7 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+QT_CONFIG_FLAGS_append_raspberrypi = " \
+    -device linux-rasp-pi-g++ \
+    -device-option CROSS_COMPILE=${TARGET_PREFIX} \
+    -I${STAGING_DIR_TARGET}${includedir}/interface/vcos/pthreads \
+"
-- 
1.9.3 (Apple Git-50)


