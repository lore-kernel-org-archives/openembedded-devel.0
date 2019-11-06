Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F33537F687
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 07:49:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xA67nb1n009404
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Nov 2019 23:49:37 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 5 Nov 2019 23:49:36 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 5 Nov 2019 23:49:30 -0800
Message-ID: <20191106074935.46751-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191106074935.46751-1-hongxu.jia@windriver.com>
References: <20191106074935.46751-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/8] python-pathlib2: add python-scandir and python-misc to runtime depends
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
X-List-Received-Date: Wed, 06 Nov 2019 07:49:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

...
$ >>> python
$ >>> import pathlib2 as pathlib
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib64/python2.7/site-packages/pathlib2/__init__.py", line 52, in <module>
    from scandir import scandir as os_scandir
ImportError: No module named scandir

$ >>> import pathlib2 as pathlib
ceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python2.7/site-packages/pathlib2/__init__.py", line 9, in <module>
    import ntpath
ImportError: No module named ntpath
...

Module scandir comes from python-scandir and ntpath comes from python-misc

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-python/recipes-devtools/python/python-pathlib2_2.3.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-pathlib2_2.3.5.bb b/meta-python/recipes-devtools/python/python-pathlib2_2.3.5.bb
index e4bf78913..6317e1c16 100644
--- a/meta-python/recipes-devtools/python/python-pathlib2_2.3.5.bb
+++ b/meta-python/recipes-devtools/python/python-pathlib2_2.3.5.bb
@@ -1,2 +1,6 @@
 inherit pypi setuptools
 require python-pathlib2.inc
+
+RDEPENDS_${PN} += "python-scandir \
+                   python-misc \
+"
-- 
2.21.0


