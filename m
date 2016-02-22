Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id B80027714F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:35:31 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id o6so55546683qkc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:35:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JBukPOEDCqULyIFKss+JonheLFYDUDZJAUhzRcdxbPg=;
	b=b18hcniiKRbP9n7LMfxwpsITcmSmHYlCfsFg9FxKCoBMlPoK5TSiatZ9cdV83zNI/m
	S6oSBuI6L5avHCqP5+HuoYoiyNDza+HpPdxn05mufcFpPeOCs6SYCmDp7WFVrvoy8WkF
	vV+yxZGWcdu7nYD5pvLOlHYdvFoJOMOy/7ddLOMT7Ql8EYnShN5ylHUGK9NBtA3x+sAN
	0dsMlDukmakbVPfig/PlFlovrGdiFm36qcE8I+0s7NaSTKYX6oGsegfb1FyKxErsAEnk
	n/iIq/UOm6h08eVWV/y19ridWZDoNgc54BbYa2vCVUydDqAQOnrmR7b5UArFxwrsbIDM
	4vIg==
X-Gm-Message-State: AG10YORuWzWuSBlZDFP5wl/Pjg9/QCasciydi614Yb8N/O4Fvo9saw/GSu49pRaTsyOgDw==
X-Received: by 10.55.75.212 with SMTP id y203mr35203712qka.3.1456148132058;
	Mon, 22 Feb 2016 05:35:32 -0800 (PST)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id w1sm10232368qha.3.2016.02.22.05.35.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Feb 2016 05:35:31 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 08:34:58 -0500
Message-Id: <1456148105-9644-4-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456148105-9644-1-git-send-email-derek@asterius.io>
References: <1456148105-9644-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 04/11] python-feedparser: update to 5.2.1
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
X-List-Received-Date: Mon, 22 Feb 2016 13:35:32 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-feedparser_5.1.3.bb     | 14 --------------
 .../recipes-devtools/python/python-feedparser_5.2.1.bb     |  9 +++++++++
 2 files changed, 9 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb b/meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb
deleted file mode 100644
index 92d5568..0000000
--- a/meta-python/recipes-devtools/python/python-feedparser_5.1.3.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Python Atom and RSS feed parser"
-HOMEPAGE = "http://code.google.com/p/feedparser"
-SECTION = "devel/python"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f5fbe7f8b71b4019eca5ac5f900fd8ad"
-
-SRC_URI = "http://feedparser.googlecode.com/files/feedparser-${PV}.tar.bz2"
-SRC_URI[md5sum] = "6fb6372a1dc2f56d4d79d740b8f49f25"
-SRC_URI[sha256sum] = "7f6507d400d07edfd1ea8205da36808009b0c539f5b8a6e0ab54337b955e6dc3"
-
-S = "${WORKDIR}/feedparser-${PV}"
-
-inherit setuptools
-
diff --git a/meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb b/meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb
new file mode 100644
index 0000000..3ac18b0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-feedparser_5.2.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Python Atom and RSS feed parser"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c21a7713ef6dc1b99644061c397e7c2a"
+
+SRC_URI[md5sum] = "d552f7a2a55e8e33b2a3fe1082505b42"
+SRC_URI[sha256sum] = "bd030652c2d08532c034c27fcd7c85868e7fa3cb2b17f230a44a6bbc92519bf9"
+
+inherit pypi setuptools
+
-- 
1.9.1


