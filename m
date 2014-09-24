Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 27FC471666
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 15:24:19 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id q5so7537067wiv.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 08:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t5YrM1Rw6AwZFPDmy3ZWfK6ktcTdpc2pA8dRsm6AF4I=;
	b=JREv32cYY4zRpTqajXNL0mGFhzuLCTjRONox4SfgGgsOvXzycQG4t6HRmfRmsOR2p9
	dLeC8CWSYOLfvjqWUbdoo4AmiorqMmCbGE1CdXFmFgpEwOFYEl4D36JNpQDgr9b/adXV
	rUdNcJQSKiCUMRHMhXOlzISzc3GvlVshBEcSPihrqdhGUeMwLfza5pPfL1jmkmnd+UgU
	rPcL7XezdUbkc1eT2kSdkN0bnX75/xjQ4PGbgZo2Cq8rTEZd6upjpg7HCShcrogm44FC
	ZO7ln0QB+hlgvwfUqcuWgAupI/M41EpM8e3/mtb3Z4lyLa+vtEsRn7OoXX2NF4oCpDoC
	43og==
X-Received: by 10.194.80.71 with SMTP id p7mr8783893wjx.35.1411572260620;
	Wed, 24 Sep 2014 08:24:20 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id xm4sm54117wib.9.2014.09.24.08.24.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Sep 2014 08:24:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Sep 2014 17:24:54 +0200
Message-Id: <1411572295-5889-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1411572295-5889-1-git-send-email-Martin.Jansa@gmail.com>
References: <1411572295-5889-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 2/3] python-efl: upgrade to 1.11.0
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
X-List-Received-Date: Wed, 24 Sep 2014 15:24:23 -0000

* announcement:
  https://phab.enlightenment.org/phame/post/view/86/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-efl_1.10.1.bb | 4 ----
 meta-efl/recipes-devtools/python/python-efl_1.11.0.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-efl_1.10.1.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-efl_1.11.0.bb

diff --git a/meta-efl/recipes-devtools/python/python-efl_1.10.1.bb b/meta-efl/recipes-devtools/python/python-efl_1.10.1.bb
deleted file mode 100644
index 2f7d3ed..0000000
--- a/meta-efl/recipes-devtools/python/python-efl_1.10.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[md5sum] = "1cc68d6cd77d9d20d07c91188d523a9a"
-SRC_URI[sha256sum] = "a6c803bdd205e08c2d1e3199abd095552bc7ca4be6faafaf3b3f6db1d78c80ef"
diff --git a/meta-efl/recipes-devtools/python/python-efl_1.11.0.bb b/meta-efl/recipes-devtools/python/python-efl_1.11.0.bb
new file mode 100644
index 0000000..379b1be
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-efl_1.11.0.bb
@@ -0,0 +1,4 @@
+require ${BPN}.inc
+
+SRC_URI[md5sum] = "b378f48ae4defbcb7c3e82479d106cfc"
+SRC_URI[sha256sum] = "e147b5c8995afbae691b90385ec3b008f9675207c7aa3c3bb724c57d9bcf8ed5"
-- 
2.0.4


