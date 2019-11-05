Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 923E57F7B7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 09:01:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xA591L95006529
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Nov 2019 01:01:21 -0800 (PST)
Received: from 41ce8e763d5a.wrs.com (128.224.153.74) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 5 Nov 2019 01:01:20 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 5 Nov 2019 08:59:54 +0000
Message-ID: <20191105085954.190962-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105085954.190962-1-hongxu.jia@windriver.com>
References: <20191105085954.190962-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python-more-itertools.inc: fix python2 package not incorrectly generated
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
X-List-Received-Date: Tue, 05 Nov 2019 09:01:21 -0000
Content-Type: text/plain

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
2.23.0


