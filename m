Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id B0C576F7CA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:06 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id q5so5607471wiv.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0fLLSC5Lk2kAsE9Z75ZXzjV4G35HO5DnWfxBIowW3rE=;
	b=Wjw657j5wc854gOqj8ptmnqV+38IDjP5Roq4IgEO7I8mjmuUNf2gs63lve5SGMrqHz
	F6H8vclDoyq5CXhrn2f3+gne3vUP1L8KZGJhV5QpVUQliDSqb1LaAQLeNamlvo6XgzNs
	9/7CAIqF6EaNF1O5XLMyXDBxJCvVbKCDaILNOWRdmLjhgRr/eQCaH9m2mgejRrHp2ilF
	9iWe5xomJSoiGBjBHjv8hZ3mKdJI03nbBqNz5TKwbGnlZN2wixbj2wfFLpHOTgD7oAQ+
	vUgaH0S3zKa5/f1HAvD9tlsILQ30ygsP4mGu1yJXJ7K0SK8POcqOWEoodMMp6xIc9ZSe
	gXKg==
X-Received: by 10.180.211.208 with SMTP id ne16mr21477891wic.21.1396372447327; 
	Tue, 01 Apr 2014 10:14:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	t50sm41846166eev.28.2014.04.01.10.14.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:13 +0200
Message-Id: <1396372434-10710-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 05/46] python-efl: upgrade to 1.9.0
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
X-List-Received-Date: Tue, 01 Apr 2014 17:14:07 -0000

* announcement:
  http://sourceforge.net/p/enlightenment/mailman/message/32066075/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-devtools/python/python-efl.inc      | 2 +-
 meta-efl/recipes-devtools/python/python-efl_1.8.1.bb | 4 ----
 meta-efl/recipes-devtools/python/python-efl_1.9.0.bb | 4 ++++
 3 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-efl_1.8.1.bb
 create mode 100644 meta-efl/recipes-devtools/python/python-efl_1.9.0.bb

diff --git a/meta-efl/recipes-devtools/python/python-efl.inc b/meta-efl/recipes-devtools/python/python-efl.inc
index cca3562..6ac7ad8 100644
--- a/meta-efl/recipes-devtools/python/python-efl.inc
+++ b/meta-efl/recipes-devtools/python/python-efl.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "${PN} bindings"
 
-LICENSE = "LGPLv3.0"
+LICENSE = "LGPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
 # there is also GPLv3.0 in COPYING;md5=d32239bcb673463ab874e80d47fae504 but no file seems to use that
 
diff --git a/meta-efl/recipes-devtools/python/python-efl_1.8.1.bb b/meta-efl/recipes-devtools/python/python-efl_1.8.1.bb
deleted file mode 100644
index 15009f6..0000000
--- a/meta-efl/recipes-devtools/python/python-efl_1.8.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[md5sum] = "ca71f501c7e0479f15d2746380b0f81d"
-SRC_URI[sha256sum] = "90ea20d0a90448fd1dcd56210bf34cb9a78905852d83620617bf164f1cef5edc"
diff --git a/meta-efl/recipes-devtools/python/python-efl_1.9.0.bb b/meta-efl/recipes-devtools/python/python-efl_1.9.0.bb
new file mode 100644
index 0000000..f34e428
--- /dev/null
+++ b/meta-efl/recipes-devtools/python/python-efl_1.9.0.bb
@@ -0,0 +1,4 @@
+require ${BPN}.inc
+
+SRC_URI[md5sum] = "c643d66157cac9b2892af8b6d1a803b1"
+SRC_URI[sha256sum] = "f6d6fecca20df016acc79a12348ae0a0f6db82e6cceaf53c4b46d7ca72bb8f07"
-- 
1.9.1


