Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EBD9A7F872
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 07:49:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xA67ndOb009416
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Nov 2019 23:49:39 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 5 Nov 2019 23:49:39 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 5 Nov 2019 23:49:33 -0800
Message-ID: <20191106074935.46751-6-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191106074935.46751-1-hongxu.jia@windriver.com>
References: <20191106074935.46751-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 6/8] python3-importlib-metadata: add python3-misc to runtime depends
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
X-List-Received-Date: Wed, 06 Nov 2019 07:49:40 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

...
$ python3
$ >>> import importlib_metadata
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.7/site-packages/importlib_metadata/__init__.py", line 15, in <module>
    from ._compat import (
  File "/usr/lib/python3.7/site-packages/importlib_metadata/_compat.py", line 28, in <module>
    import pathlib
ModuleNotFoundError: No module named 'pathlib'
...

Module pathlib comes from python3-misc

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-devtools/python/python3-importlib-metadata_0.23.bb  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb
index d71c45b5f..4c53d5fbb 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_0.23.bb
@@ -1,2 +1,4 @@
 inherit pypi setuptools3
 require python-importlib-metadata.inc
+
+RDEPENDS_${PN} += "python3-misc"
-- 
2.21.0


