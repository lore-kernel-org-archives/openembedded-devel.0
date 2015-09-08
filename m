Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3CD2D76D96
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 14:37:49 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so119471022wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fowHEZNYETQitfS7OOC9TMOkdKLABjk1CpzMm9tG4qY=;
	b=rvsg8tM666gWAAP+yMQOk7B4ImkuhsGD+OdnnaRW9LomKzc7JUgfRLBO/F++ZmmqcB
	ZeY6asPdfNJ69m32PIIKuMqcHxi5jXg01JumFaEs2rXcMeKzLx5QJ2O9EjH1wBHJ3hl2
	Xnrv5FAlmhLJpehDFpoUmscVJ+An61XBNSsWwpNueDgrx/+LT/ozqEdy9ye+1iSz1jS7
	nuw2cpFUFlU09I2vhpx6Eg6GMud/a1+VHzwXDZv9q9qQtwarYhi2jj7Mz+S2uBiY7HoJ
	VyQpazCdmHGRAi5nj8NpOTEesLjGno8R50AMWW/rJVh02nrHNmYL0GVizFwlywCZaknJ
	Qxkg==
X-Received: by 10.180.105.74 with SMTP id gk10mr43563361wib.92.1441723069893; 
	Tue, 08 Sep 2015 07:37:49 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id h8sm5177165wib.21.2015.09.08.07.37.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 07:37:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Sep 2015 16:38:33 +0200
Message-Id: <1441723113-27004-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <1441723113-27004-1-git-send-email-Martin.Jansa@gmail.com>
References: <1441723113-27004-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 3/3] e-wm: upgrade to 0.19.9
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
X-List-Received-Date: Tue, 08 Sep 2015 14:37:50 -0000

* announcements:
  https://phab.enlightenment.org/phame/live/3/post/e19_6_release/
  https://phab.enlightenment.org/phame/live/3/post/e19_7_release/
  https://phab.enlightenment.org/phame/live/3/post/e19_8_release/
  https://phab.enlightenment.org/phame/live/3/post/e19_9_release/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_0.19.5.bb | 19 -------------------
 meta-efl/recipes-efl/e17/e-wm_0.19.9.bb | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 19 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm_0.19.5.bb
 create mode 100644 meta-efl/recipes-efl/e17/e-wm_0.19.9.bb

diff --git a/meta-efl/recipes-efl/e17/e-wm_0.19.5.bb b/meta-efl/recipes-efl/e17/e-wm_0.19.5.bb
deleted file mode 100644
index 6e374bd..0000000
--- a/meta-efl/recipes-efl/e17/e-wm_0.19.5.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require ${BPN}.inc
-
-SRCNAME = "enlightenment"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-# couple of modules needed for illume2 (mobile) profile were removed in
-# http://git.enlightenment.org/core/enlightenment.git/commit/src/modules/Makefile.mk?id=1be76d599ca27f820b58b8186c5f73d9844c67ca
-# and replacements aren't included yet, if you want to use e-wm on device with small screen, better stay with 0.18 release
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "\
-    ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-    file://enlightenment_start.oe \
-    file://applications.menu \
-"
-
-SRC_URI[md5sum] = "f7557e89b914b4c66eacace66c739437"
-SRC_URI[sha256sum] = "93d27d04e129f6ff751eeec8cda45bbf4f5da6787f8c3e85a4f1aecadc3f0372"
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.19.9.bb b/meta-efl/recipes-efl/e17/e-wm_0.19.9.bb
new file mode 100644
index 0000000..9563501
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/e-wm_0.19.9.bb
@@ -0,0 +1,19 @@
+require ${BPN}.inc
+
+SRCNAME = "enlightenment"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+# couple of modules needed for illume2 (mobile) profile were removed in
+# http://git.enlightenment.org/core/enlightenment.git/commit/src/modules/Makefile.mk?id=1be76d599ca27f820b58b8186c5f73d9844c67ca
+# and replacements aren't included yet, if you want to use e-wm on device with small screen, better stay with 0.18 release
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "\
+    ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+    file://enlightenment_start.oe \
+    file://applications.menu \
+"
+
+SRC_URI[md5sum] = "9a5ca3ddf85132ecc43c8d78919eb2f9"
+SRC_URI[sha256sum] = "363b3c4e13f799dcb547dd76c4e4964441886453843948d852911448c6fa8df5"
-- 
2.5.1


