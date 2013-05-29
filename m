Return-Path: <net147@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id D5CB761802
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2013 03:32:41 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id jt11so8641634pbb.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 20:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=y9lgYzjYlDaOjqP4ITSwgjV5kVXPYozthARBdZA/zqY=;
	b=hgO331UG9kJEQ/UOmk6ILujJZSLQ30nimG+SruVvZswQhkxG3S0wkjQGsgRbPTN5OH
	imdHjaPMbLJIiLcI+suVW72Pw0nSRiQpVmdvUFd5A9DPJNdWzMB5vWgMWJG1q34derN+
	8ekFWA7wFCYjq8I2uujmFqZbWHRvdZG6kVA5Je5OG/LvC8p7OTufjJ5A//W2twUs45ug
	ahC6KKHXBkjBAhu4vFf567Hg9OG+UXa6D9rfGSX/zlWkqJXy1RcAdisj3tdnIGal6wss
	LxGMvbTm3BR1prvPtEno9y/g0L8nLBv0lCpLBlLDT430fBe8Uc5JS8JwZnKkBi5zRVYU
	VZ1A==
X-Received: by 10.68.164.33 with SMTP id yn1mr849115pbb.71.1369798362635;
	Tue, 28 May 2013 20:32:42 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	ya4sm35425895pbb.24.2013.05.28.20.32.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 28 May 2013 20:32:41 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 May 2013 13:46:08 +1000
Message-Id: <1369799168-9813-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [meta-oe][PATCH] llvm: disable build rpath
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
X-List-Received-Date: Wed, 29 May 2013 03:32:42 -0000

This avoids QA Issue where tblgen has an rpath to lib in the shadow
build directory.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm.inc       | 1 +
 meta-oe/recipes-core/llvm/llvm2.9_2.9.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
index 6230495..b2ab935 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -62,6 +62,7 @@ EXTRA_OECMAKE = "\
     -DLLVM_ENABLE_ASSERTIONS:BOOL=ON \
     -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \
     -DBUILD_SHARED_LIBS:BOOL=ON \
+    -DCMAKE_SKIP_BUILD_RPATH:BOOL=ON \
 "
 # We need to reset this to avoid breakage as we build out of tree
 TOOLCHAIN_OPTIONS = ""
diff --git a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
index ee7c3a3..1cd68be 100644
--- a/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
+++ b/meta-oe/recipes-core/llvm/llvm2.9_2.9.bb
@@ -34,6 +34,7 @@ EXTRA_OECMAKE = "\
     -DLLVM_ENABLE_ASSERTIONS:BOOL=ON \
     -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo \
     -DBUILD_SHARED_LIBS:BOOL=ON \
+    -DCMAKE_SKIP_BUILD_RPATH:BOOL=ON \
 "
 
 LLVM_RELEASE = "2.9"
-- 
1.8.2.3


