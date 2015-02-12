Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8DA30733B8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 18:40:51 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id y19so11971392wgg.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 10:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Oi9swQEOc8NcjpTJ9Zcj5gYYWtK4y/T5jL+mkyPtWWY=;
	b=0VooqQ1IuXcqjAOj+sDA7VvlmSSvLtCuTQ3VcvOnUZtGLseDQgq+50AuZiIYvVzRWL
	ceLrumO5LmIoUj0vbBocWmy/UwvJmcwFwAtXImQgmDyZs2ji9iB5DWVlhSugrYwZLzok
	tMhNbSMvxLsIY8arcpM83PgxsCmqI4Kr2aJwIWA6JVng0buhnPa70b7kTyBmt+MdECVf
	OeWS6o3JE/pDWWBo9C6uqShXKTVgT6Yv35XcADzuTh6KoGT3EY50ICZB+MnJd9dc1GLM
	lA+B2QUQhHV5oCZ4P1eHd7lQrA/ELaiDSTohttQKNrPSC8wVGvaUs2FMVvprO8lJNBTf
	jz3g==
X-Received: by 10.194.79.226 with SMTP id m2mr10679411wjx.60.1423766452742;
	Thu, 12 Feb 2015 10:40:52 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ub1sm6747576wjc.43.2015.02.12.10.40.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 10:40:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 19:40:52 +0100
Message-Id: <1423766452-23118-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.0
In-Reply-To: <1423766452-23118-1-git-send-email-Martin.Jansa@gmail.com>
References: <1423766452-23118-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 2/2] python-efl: upgrade to 1.13.0
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
X-List-Received-Date: Thu, 12 Feb 2015 18:40:52 -0000

* announcement:
  https://phab.enlightenment.org/phame/live/3/post/python_efl_1_13_0_release/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-efl.inc       | 4 ++--
 meta-efl/recipes-devtools/python/python-efl_1.12.0.bb | 4 ----
 meta-efl/recipes-devtools/python/python-efl_1.13.0.bb | 4 ++++
 3 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-efl_1.12.0.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-efl_1.13.0.bb

diff --git a/meta-efl/recipes-devtools/python/python-efl.inc b/meta-efl/recipes-devtools/python/python-efl.inc
index 9780518..92a26ed 100644
--- a/meta-efl/recipes-devtools/python/python-efl.inc
+++ b/meta-efl/recipes-devtools/python/python-efl.inc
@@ -46,7 +46,7 @@ FILES_${PN}-examples = "${datadir}/${PN}/examples"
 
 FILES_python-ecore = " \
     ${libdir}/${PYTHON_DIR}/site-packages/ecore/ \
-    ${libdir}/${PYTHON_DIR}/site-packages/efl/ecore.so \
+    ${libdir}/${PYTHON_DIR}/site-packages/efl/ecore*.so \
     ${libdir}/${PYTHON_DIR}/site-packages/efl/ecore \
 "
 FILES_python-eldbus = " \
@@ -55,7 +55,7 @@ FILES_python-eldbus = " \
 "
 FILES_python-edje = " \
     ${libdir}/${PYTHON_DIR}/site-packages/edje/ \
-    ${libdir}/${PYTHON_DIR}/site-packages/efl/edje*so \
+    ${libdir}/${PYTHON_DIR}/site-packages/efl/edje*.so \
 "
 FILES_python-elementary = " \
     ${libdir}/${PYTHON_DIR}/site-packages/elementary/ \
diff --git a/meta-efl/recipes-devtools/python/python-efl_1.12.0.bb b/meta-efl/recipes-devtools/python/python-efl_1.12.0.bb
deleted file mode 100644
index 8c7e570..0000000
--- a/meta-efl/recipes-devtools/python/python-efl_1.12.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[md5sum] = "090aa2b22447ea83a1aca9f284ce5288"
-SRC_URI[sha256sum] = "bb9f30bf437b8e9ad5a4ba405795c1f8f840a37c660a6d47a2829587b32dbb67"
diff --git a/meta-efl/recipes-devtools/python/python-efl_1.13.0.bb b/meta-efl/recipes-devtools/python/python-efl_1.13.0.bb
new file mode 100644
index 0000000..ef9f80b
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-efl_1.13.0.bb
@@ -0,0 +1,4 @@
+require ${BPN}.inc
+
+SRC_URI[md5sum] = "98b1ca3e0feeecf8b993f9c415ff22e5"
+SRC_URI[sha256sum] = "16b8234ee763fab27071e7d708accbdb0cd43eecdfdb08775853bf380e558f8d"
-- 
2.3.0


