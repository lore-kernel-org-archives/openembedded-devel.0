Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9A77F872
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 07:49:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xA67neI9005078
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Nov 2019 23:49:40 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 5 Nov 2019 23:49:40 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 5 Nov 2019 23:49:34 -0800
Message-ID: <20191106074935.46751-7-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191106074935.46751-1-hongxu.jia@windriver.com>
References: <20191106074935.46751-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 7/8] python-importlib-metadata: add python-compression to runtime depends
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
$ python
$ >>> import importlib_metadata
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python2.7/site-packages/importlib_metadata/__init__.py", line 9, in <module>
    import zipp
  File "/usr/lib/python2.7/site-packages/zipp.py", line 8, in <module>
    import zipfile
ImportError: No module named zipfile
...

Module zipfile comes from python-compression

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-devtools/python/python-importlib-metadata_0.23.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-importlib-metadata_0.23.bb b/meta-python/recipes-devtools/python/python-importlib-metadata_0.23.bb
index dd95cf360..09c5700db 100644
--- a/meta-python/recipes-devtools/python/python-importlib-metadata_0.23.bb
+++ b/meta-python/recipes-devtools/python/python-importlib-metadata_0.23.bb
@@ -3,4 +3,5 @@ require python-importlib-metadata.inc
 RDEPENDS_${PN} += "python-configparser \
                    python-contextlib2 \
                    python-pathlib2 \
+                   python-compression \
 "
-- 
2.21.0


