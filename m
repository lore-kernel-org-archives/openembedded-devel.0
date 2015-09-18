Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9824560125
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 12:52:17 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so31168976wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 05:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=z7mMvR/laDDoxrLEySj2d5ClRojTl8Gol4QQ7EsVfL0=;
	b=cE7HcEbbnirYJ33EpfNcOm/yzy3EwpJUDHgPo7A7/8lggR+PX92bc7lTYN1vYegLQ7
	YSWyI26NNSxFS0qWe1CCz3rZAng04DF4iyso7dBvI6cSj0ewQYWMsRR0mAx3gCrHO58I
	+72EnYWD1nIzgsanLZdcTYNYdtx/ealL9A551aw1pA/lVmxyp+li2wjioT3d9z733Ryt
	YCj1QfgXmq4JbMyi/6vLmxnZKaHq9xiv8Ms+6dwRoqci+wEsVA+fQG/vgQiPfKMMlLaB
	zuRczTdrWRdLO0Vaz6afdxempb7L5pOvpkCS0fh2XMN9fN923oYEHp2V0Cj5awMvcyKA
	4m4w==
X-Received: by 10.180.104.68 with SMTP id gc4mr16088064wib.78.1442580737371;
	Fri, 18 Sep 2015 05:52:17 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	az6sm15442033wib.12.2015.09.18.05.52.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Sep 2015 05:52:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Sep 2015 14:52:34 +0200
Message-Id: <1442580755-27729-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
Subject: [PATCH][meta-efl 1/2] terminology: upgrade to 0.9.1
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
X-List-Received-Date: Fri, 18 Sep 2015 12:52:18 -0000

* announcement:
  https://phab.enlightenment.org/phame/live/3/post/terminology_0_9/
  https://phab.enlightenment.org/phame/live/3/post/terminology_0_9_1/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/terminology_0.8.0.bb | 8 --------
 meta-efl/recipes-efl/e17/terminology_0.9.1.bb | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/terminology_0.8.0.bb
 create mode 100644 meta-efl/recipes-efl/e17/terminology_0.9.1.bb

diff --git a/meta-efl/recipes-efl/e17/terminology_0.8.0.bb b/meta-efl/recipes-efl/e17/terminology_0.8.0.bb
deleted file mode 100644
index 6e520ab..0000000
--- a/meta-efl/recipes-efl/e17/terminology_0.8.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "9f664d3205deaad956c253081cebf9fb"
-SRC_URI[sha256sum] = "7a10d44b023cf6134c2483304e4ad33bea6df0f11266aec482f54fa67a3ce628"
diff --git a/meta-efl/recipes-efl/e17/terminology_0.9.1.bb b/meta-efl/recipes-efl/e17/terminology_0.9.1.bb
new file mode 100644
index 0000000..482bd60
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/terminology_0.9.1.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "c7ce2e8ebc5f311d3d3f59ecfdf18f61"
+SRC_URI[sha256sum] = "7fb864a14202490e9181c5f254a7e772019216a3aa75c3952d0f12cd32113896"
-- 
2.5.1


