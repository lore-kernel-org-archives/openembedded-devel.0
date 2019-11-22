Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 525A57FCC7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 16:30:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47KMP22xyjz4Y
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2019 17:30:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574440246;
	bh=4ZvmPpwe61tLXUo3nRkySLRiKJywTXuyA6sFKFNQcHA=;
	h=From:To:Subject:Date:From;
	b=eEnT7IERaKN2/O94egJBeekmlonjdBXhTS1kh78qGcGJtH2VELSVQuD321DfBsQav
	tAB03oOXFZQznmQUUW8Zsp7ghtmQkdoBKz8zCE8aS+Q7dEYMWsNHBg/QjwKXFWxX13
	NEsbwHT6efVZnuPK9v9m+TYYwf9hqkBjqMEWGGHKqH6ZMOhlUGmGjP5+UtzKkTEkNS
	ehXbGqfiDj5iRCAqZN4RCrsdMs3CaSs2tCz3nm6bYPlTlWTGqghFuanvBADX5nyAy6
	i6ZOS/7Qf5L2DUTacdhyWnhYQJO/ae0dIXqcnKOsoPRhC4oAbaBOzYx+m+qdqAi6yv
	bTy8Ht114q14vMKAMVqNthX0A3EtvwagYAcA6/SfQHfLXT24kJLbEJqeJL0CqUH2sj
	B6FtM0y+jAvhitr1B8gPZDPXZ+qkF4w1pQ/tdRzt6V1ATVrbPLxiBfw5U3RApAt7I8
	lUIS0QpkYWZM6bjXYP8Lh9hEQn+RFIORYbEaEl2v7ol1s43oZipFXMu3HoxHMplLuh
	PJ6HX33UxO8Nzeuzz9LdQw8qv3uvogck4b80Xdg1Js63mJR9wcgodxldBmp3sk3kFS
	9d7U+UwsUAYVFw5d/AnbqhCslgUiJyMP0wfWi6z+LRSWtPMv6hqSHvFfWj1kESFn0N
	k2Y31hbudgm3lq0bUK9Akf/o=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Nov 2019 18:30:43 +0200
Message-Id: <20191122163045.11693-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][zeus][PATCH 1/3] python-more-itertools.inc: fix python2 package not incorrectly generated
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

The package of python2 is incorrected generated to python3
...
tmp-glibc/work/core2-64-wrs-linux/python-more-itertools/7.2.0-r0$ find image/
image/
image/usr
image/usr/lib64
image/usr/lib64/python3.7
image/usr/lib64/python3.7/site-packages
image/usr/lib64/python3.7/site-packages/more_itertools
image/usr/lib64/python3.7/site-packages/more_itertools/__init__.py
image/usr/lib64/python3.7/site-packages/more_itertools/more.py
image/usr/lib64/python3.7/site-packages/more_itertools/recipes.py
image/usr/lib64/python3.7/site-packages/more_itertools/tests
image/usr/lib64/python3.7/site-packages/more_itertools/tests/__init__.py
image/usr/lib64/python3.7/site-packages/more_itertools/tests/test_more.py
image/usr/lib64/python3.7/site-packages/more_itertools/tests/test_recipes.py
image/usr/lib64/python3.7/site-packages/more_itertools/tests/__pycache__
image/usr/lib64/python3.7/site-packages/more_itertools/tests/__pycache__/__init__.cpython-37.pyc
image/usr/lib64/python3.7/site-packages/more_itertools/tests/__pycache__/test_more.cpython-37.pyc
image/usr/lib64/python3.7/site-packages/more_itertools/tests/__pycache__/test_recipes.cpython-37.pyc
image/usr/lib64/python3.7/site-packages/more_itertools/__pycache__
image/usr/lib64/python3.7/site-packages/more_itertools/__pycache__/__init__.cpython-37.pyc
image/usr/lib64/python3.7/site-packages/more_itertools/__pycache__/more.cpython-37.pyc
image/usr/lib64/python3.7/site-packages/more_itertools/__pycache__/recipes.cpython-37.pyc
image/usr/lib64/python3.7/site-packages/more_itertools-7.2.0-py3.7.egg-info
image/usr/lib64/python3.7/site-packages/more_itertools-7.2.0-py3.7.egg-info/PKG-INFO
image/usr/lib64/python3.7/site-packages/more_itertools-7.2.0-py3.7.egg-info/SOURCES.txt
image/usr/lib64/python3.7/site-packages/more_itertools-7.2.0-py3.7.egg-info/dependency_links.txt
image/usr/lib64/python3.7/site-packages/more_itertools-7.2.0-py3.7.egg-info/top_level.txt
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-python/recipes-devtools/python/python-more-itertools.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-more-itertools.inc b/meta-python/recipes-devtools/python/python-more-itertools.inc
index 41c334e8d..8d814a6f0 100644
--- a/meta-python/recipes-devtools/python/python-more-itertools.inc
+++ b/meta-python/recipes-devtools/python/python-more-itertools.inc
@@ -5,5 +5,3 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
 SRC_URI[md5sum] = "f647bfd27243a7bebe53b5ddb6a3b1c4"
 SRC_URI[sha256sum] = "409cd48d4db7052af495b09dec721011634af3753ae1ef92d2b32f73a745f832"
-
-inherit pypi setuptools3
-- 
2.17.1


