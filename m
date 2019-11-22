Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 534357FCD3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 16:30:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47KMP263MXz4f
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 17:30:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574440247;
	bh=VxqBNs4o+a6TDlKsw3/tACY0Hil/Tkvtz9Yi6wP5F98=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VWAo2ZMDmw8QfMJCyy7QqaRQpU5S6+HkQhbQ7v+bn6bVA7zmqSSRAxYAcvllKTpc5
	Ff6BfyQXNPUvUMWEIenMWCyygLT3ZAWmAxbM0xi4xiBnkKORqdqr7BhpGFTBuxZz+s
	0/MID/VK6OorYnJ8g/Esr2WOfYI8tWqkQx3VP/4mZ8OcgRcPqMj5P95xwLoQOW2gD2
	XLAeBJFFdFTUPzHKiiuzU1Gx5ls9MHa/viNljoFdnVMWbr+Bf5yU6ruyInVhdBX3JY
	tIu/t4sLQUofKEIePCMfFMUA+Xx/19K8u1pYMUWECWUlT1v32qF9nODgqyW36IBegd
	nYwWcuB3diiDJaFv+H2fJ8QkIdYMYdwPC3gzoag8cvJPC0DqVg4ALeGcWvPd+sB6pt
	pqLMX2fp7X8IcU04BmLPdtTsfUPexHxUBNPGabiBrJZsmEZ+CtGQvmlUjhr8pDaUeE
	8hCKAoff+BcUNHDoospvZkgyb6fzvh004FvxZKv1NLA/kEq1YPZAXB/8HnzdTj05w0
	9nghysqO4PJFBqt9eohrAH9FT7Peq0ZgK2bDvnL5BncyI1eQbyoL61LuwFB+IoFQyg
	uotbpQF1vsz0zZLj11Y0AK/7biRLpV8O7t7sxq76lfEyDiSyU1wOZUE8IQVB/HjKmE
	0TTBUOYNSmISde7PMUMp5p3A=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Nov 2019 18:30:44 +0200
Message-Id: <20191122163045.11693-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122163045.11693-1-bunk@stusta.de>
References: <20191122163045.11693-1-bunk@stusta.de>
Subject: [meta-oe][zeus][PATCH 2/3] python-more-itertools: downgrade 7.2.0 -> 5.0.0
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
X-List-Received-Date: Fri, 22 Nov 2019 16:30:46 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

Python 2.7 is no longer supported. The 5.0.0 release will be the last
version targeting Python 2.7. [1]

[1] https://github.com/erikrose/more-itertools/commit/560b045b430e8292c18cf5283de4fdc3e13e56f7

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../recipes-devtools/python/python-more-itertools.inc        | 3 ---
 .../recipes-devtools/python/python-more-itertools_5.0.0.bb   | 5 +++++
 .../recipes-devtools/python/python-more-itertools_7.2.0.bb   | 2 --
 .../recipes-devtools/python/python3-more-itertools_7.2.0.bb  | 3 +++
 4 files changed, 8 insertions(+), 5 deletions(-)
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
index 000000000..c66e55cac
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
@@ -0,0 +1,5 @@
+inherit pypi setuptools
+require python-more-itertools.inc
+
+SRC_URI[md5sum] = "f2ea58aa336ce6c13b7b225b3bbe305d"
+SRC_URI[sha256sum] = "38a936c0a6d98a38bcc2d03fdaaedaba9f412879461dd2ceff8d37564d6522e4"
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


