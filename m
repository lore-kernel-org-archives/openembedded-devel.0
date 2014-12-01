Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id C0C0B72270
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 20:46:02 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id bs8so25952682wib.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 12:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VgVrq3/BaNc9qd0P7Yx4diPhwP4XwtGiokDZPuMrnTs=;
	b=EvRSiYVI6uFqCEJ+EDOBhBMDsfoG5wqqs5q2mSYH6/9HNS2tqQOtW1fVTO5kHzV6s+
	SaPHZAJoVGCH2PSrKDSJsm5ceeFyMNaJDQw2MNCvtyUQoFtwkzsAkpOy2KKp/cZnTzj5
	4YDDK9kdUgb/eEitEHuDaq8B0lK6oJ1bD8sKTpuwwLtMm26xquMKjat2yeo8tkNNLw0F
	7r69Gx+NytWTFmvlmJmlqInWJOl+y/oVmsG5cWUVgy0y78VngwSnwc/ri2Bfex7x4yXW
	AK1ulgLYBhdwljozbIZ4Z1694L25WqqXGfVTIBIgD8BAieRDYCUYtSHNKBWGF2QKH7gJ
	4lTg==
X-Received: by 10.180.104.65 with SMTP id gc1mr11448161wib.46.1417466763330;
	Mon, 01 Dec 2014 12:46:03 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	nj9sm29755618wic.10.2014.12.01.12.46.02 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Dec 2014 12:46:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Dec 2014 21:46:02 +0100
Message-Id: <1417466762-3489-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1417466762-3489-1-git-send-email-Martin.Jansa@gmail.com>
References: <1417466762-3489-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][WIP][PATCH 2/2] python-efl: Upgrade to 1.12.0
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
X-List-Received-Date: Mon, 01 Dec 2014 20:46:05 -0000

* announcement
  https://phab.enlightenment.org/phame/post/view/98/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-efl_1.11.0.bb | 4 ----
 meta-efl/recipes-devtools/python/python-efl_1.12.0.bb | 4 ++++
 meta-efl/recipes-devtools/python/python-efl_git.bb    | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-efl_1.11.0.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-efl_1.12.0.bb

diff --git a/meta-efl/recipes-devtools/python/python-efl_1.11.0.bb b/meta-efl/recipes-devtools/python/python-efl_1.11.0.bb
deleted file mode 100644
index 379b1be..0000000
--- a/meta-efl/recipes-devtools/python/python-efl_1.11.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[md5sum] = "b378f48ae4defbcb7c3e82479d106cfc"
-SRC_URI[sha256sum] = "e147b5c8995afbae691b90385ec3b008f9675207c7aa3c3bb724c57d9bcf8ed5"
diff --git a/meta-efl/recipes-devtools/python/python-efl_1.12.0.bb b/meta-efl/recipes-devtools/python/python-efl_1.12.0.bb
new file mode 100644
index 0000000..8c7e570
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-efl_1.12.0.bb
@@ -0,0 +1,4 @@
+require ${BPN}.inc
+
+SRC_URI[md5sum] = "090aa2b22447ea83a1aca9f284ce5288"
+SRC_URI[sha256sum] = "bb9f30bf437b8e9ad5a4ba405795c1f8f840a37c660a6d47a2829587b32dbb67"
diff --git a/meta-efl/recipes-devtools/python/python-efl_git.bb b/meta-efl/recipes-devtools/python/python-efl_git.bb
index b776f7d..15f490f 100644
--- a/meta-efl/recipes-devtools/python/python-efl_git.bb
+++ b/meta-efl/recipes-devtools/python/python-efl_git.bb
@@ -1,7 +1,8 @@
 require ${BPN}.inc
 
-SRCREV = "c1497e10288589ff9834f3d4da17461b8a3a1c15"
-PV = "1.10.0+git${SRCPV}"
+SRCREV = "71ed20ebf662a7b72e60913df94ce6933236bf09"
+PV = "1.12.0+git${SRCPV}"
+DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "git://git.enlightenment.org/bindings/python/${BPN}.git;branch=python-efl-1.10"
 
-- 
2.1.3


