Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8F2207FC38
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 21:38:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47WxQ13zGlz3H
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 22:38:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575927497;
	bh=MIB0opSz0XFS0h3EQ9SMYRnveoXcxYdEnb7BipAP0XY=;
	h=From:To:Subject:Date:From;
	b=b6zYVZn7p/+aXZUuWKVeZcnqINXbbrdKfhkEgngXPUFrV/YrcYLRcy/tvo+aJbifd
	Z2IGBiFp/oOyykMojckx7DGI3+r+rw7DgxwIUgzby8ffb9GPyIR3E9eHFX+UdJyGKi
	xhxW5gF+mMHLLypnsvfsz6Z9vThXfR7u0ZKgoAkGbIKtCqjfPl5zxmgnEbXqvjrECv
	M2jtuuorHsT684lslKOimYWNszL0e3vkapUiIOStIEPYUeqa4SRx9iR7pZ/ny7ynDS
	eewknWeHnAv0kOld+mcWoDv1QDqU8/ZlUhTXTBGLWMtH6NPetVNQv9u8TwJMBpboRc
	yvZBu1VMewcKEmG3UsuxSZbMB5PvJqREGmR2XCtdzpUo6puV/FsPoPt3Ge22Ek7Cco
	SesdnTq2JNY8YqqaKYgg4twi28guY/0V04kYP07b5Z49Z2X+FUbqdT7MzLbYabPoHD
	02rePI4R6q21gUJMAZ85e5PJOhQgEXVrISwdMviTHUqk/dfRPmVrYhJJ6JjO7nNAlq
	TZJ8WrFwt0VYOFg1RErgZ239UIEPzvpKDV4/3DweCJlvQKtXvgFS5zyJMBfzQnpske
	bJRzU+VPUQnvpIOUKOliD8x1OdaI58yndp5Yve61ANqbHnK4+BNfWCF/6QafD166Hc
	gDdjnaqdsqMC01wlq/Xw2S/Y=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 23:38:16 +0200
Message-Id: <20191209213816.15612-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][zeus][PATCH v2] python-more-itertools: downgrade 7.2.0 -> 5.0.0
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
X-List-Received-Date: Mon, 09 Dec 2019 21:38:17 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

Python 2.7 is no longer supported. The 5.0.0 release will be the last
version targeting Python 2.7. [1]

[1] https://github.com/erikrose/more-itertools/commit/560b045b430e8292c18cf5283de4fdc3e13e56f7

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-devtools/python/python-more-itertools.inc      | 3 ---
 .../recipes-devtools/python/python-more-itertools_5.0.0.bb | 7 +++++++
 .../recipes-devtools/python/python-more-itertools_7.2.0.bb | 2 --
 .../python/python3-more-itertools_7.2.0.bb                 | 3 +++
 4 files changed, 10 insertions(+), 5 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python-more-itertools.inc b/meta-python/recipes-devtools/python/python-more-itertools.inc
index 8d814a6f0..33095b3d3 100644
--- a/meta-python/recipes-devtools/python/python-more-itertools.inc
+++ b/meta-python/recipes-devtools/python/python-more-itertools.inc
@@ -2,6 +2,3 @@ DESCRIPTION = "More routines for operating on iterables, beyond itertools"
 HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
-
-SRC_URI[md5sum] = "f647bfd27243a7bebe53b5ddb6a3b1c4"
-SRC_URI[sha256sum] = "409cd48d4db7052af495b09dec721011634af3753ae1ef92d2b32f73a745f832"
diff --git a/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb b/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
new file mode 100644
index 000000000..6c44df40a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
@@ -0,0 +1,7 @@
+inherit pypi setuptools
+require python-more-itertools.inc
+
+SRC_URI[md5sum] = "f2ea58aa336ce6c13b7b225b3bbe305d"
+SRC_URI[sha256sum] = "38a936c0a6d98a38bcc2d03fdaaedaba9f412879461dd2ceff8d37564d6522e4"
+
+PE = "1"
diff --git a/meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb b/meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb
deleted file mode 100644
index 0702aad4e..000000000
--- a/meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-more-itertools.inc
diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb
index 28ddf88fb..06d45ce54 100644
--- a/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb
@@ -1,2 +1,5 @@
 inherit pypi setuptools3
 require python-more-itertools.inc
+
+SRC_URI[md5sum] = "f647bfd27243a7bebe53b5ddb6a3b1c4"
+SRC_URI[sha256sum] = "409cd48d4db7052af495b09dec721011634af3753ae1ef92d2b32f73a745f832"
-- 
2.17.1


