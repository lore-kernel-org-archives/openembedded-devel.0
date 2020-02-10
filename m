Return-Path: <straka.derek@gmail.com>
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
	[209.85.167.181])
	by mail.openembedded.org (Postfix) with ESMTP id 68BD060D64
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 00:08:54 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id b18so7630193oie.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 16:08:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UvcfBPJdFpt+GKR14AqkJmJ5oV753lBA5hCvnFR4FcE=;
	b=n4NGFkQn1Zm7iwKXPtI9lA9POJHj0pURr7G0z3I/ZOkKq6Q7rRpZOWqVqzfR+z65FE
	1lHPrLj+ah6togategWxqs/Rb0xwhmlS2x99R3AqTJpmjaMh5qdHXEQlMANytKk3ZWDr
	teEFWPLr+rwyFlScm1aRmWdTvH+HTrSXXItg7hzsv8IewloLJoePua3w2ApNfFnCR/v8
	1kj+n1C7TzeI3o7mAaK6xEJOxERlwfQQtQ6dzebNoTmUXur8P4KUSuv6AlQojbKBtyLC
	dh1a2QnH9El4evQJLLWvFzkB0X/RuC+giMH3I+SMmypkr2rKHwfJ6UG5680MZB1xhJ/W
	NYDg==
X-Gm-Message-State: APjAAAV1AFbZttHYd7yJ5kvBSLZ+1P2t/UVq+L4khftjGCUegLcvv9LW
	wv4lKNrK6kgh8u30+/8p+Vkn2Fz0Afg=
X-Google-Smtp-Source: APXvYqyRwmp2h7VoU05q+lX2fjgAOlALfkjLn37nOOabVHr9LXBM7Aaq5Er0J5GhDjA/7OR8m1Xq/w==
X-Received: by 2002:aca:1903:: with SMTP id l3mr9121420oii.16.1581293335008;
	Sun, 09 Feb 2020 16:08:55 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	m15sm3850680otr.65.2020.02.09.16.08.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 16:08:54 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 19:08:28 -0500
Message-Id: <20200210000828.3756-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-aiofiles: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Mon, 10 Feb 2020 00:08:54 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-aiofiles.inc                 | 14 --------------
 .../python/python3-aiofiles_0.4.0.bb           | 18 ++++++++++++++++--
 2 files changed, 16 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-aiofiles.inc

diff --git a/meta-python/recipes-devtools/python/python-aiofiles.inc b/meta-python/recipes-devtools/python/python-aiofiles.inc
deleted file mode 100644
index 3ecb21c86d..0000000000
--- a/meta-python/recipes-devtools/python/python-aiofiles.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "File support for asyncio"
-DESCRIPTION = "Asynchronous local file IO library for asyncio and Python"
-HOMEPAGE = "https://github.com/aio-libs/aiohttp"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
-
-SRC_URI[md5sum] = "cb33cf96c371fbd56fc27ab0bd81bd61"
-SRC_URI[sha256sum] = "021ea0ba314a86027c166ecc4b4c07f2d40fc0f4b3a950d1868a0f2571c2bbee"
-
-PYPI_PACKAGE = "aiofiles"
-inherit pypi
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-asyncio \
-"
diff --git a/meta-python/recipes-devtools/python/python3-aiofiles_0.4.0.bb b/meta-python/recipes-devtools/python/python3-aiofiles_0.4.0.bb
index b4d188b2ed..b21cade522 100644
--- a/meta-python/recipes-devtools/python/python3-aiofiles_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiofiles_0.4.0.bb
@@ -1,2 +1,16 @@
-inherit setuptools3
-require python-aiofiles.inc
+SUMMARY = "File support for asyncio"
+DESCRIPTION = "Asynchronous local file IO library for asyncio and Python"
+HOMEPAGE = "https://github.com/aio-libs/aiohttp"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+
+SRC_URI[md5sum] = "cb33cf96c371fbd56fc27ab0bd81bd61"
+SRC_URI[sha256sum] = "021ea0ba314a86027c166ecc4b4c07f2d40fc0f4b3a950d1868a0f2571c2bbee"
+
+PYPI_PACKAGE = "aiofiles"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-asyncio \
+"
-- 
2.17.1


