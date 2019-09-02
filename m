Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E269E7F381
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2019 10:06:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x82A6rHQ009953
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 2 Sep 2019 03:06:53 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 2 Sep 2019 03:06:52 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Sep 2019 18:06:51 +0800
Message-ID: <20190902100651.22832-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-hyperlink: rdepend on python-idna
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
X-List-Received-Date: Mon, 02 Sep 2019 10:06:52 -0000
Content-Type: text/plain

python hyperlink actually requires python idna. Otherwise, we get
the following error.

  Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib64/python3.7/site-packages/hyperlink/_init_.py", line 2, in <module>
  from ._url import (URL,
  File "/usr/lib64/python3.7/site-packages/hyperlink/_url.py", line 33, in <module>
  from idna import encode as idna_encode, decode as idna_decode, IDNAError
  ModuleNotFoundError: No module named 'idna'

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python-hyperlink.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-hyperlink.inc b/meta-python/recipes-devtools/python/python-hyperlink.inc
index 25398541c..653170ca6 100644
--- a/meta-python/recipes-devtools/python/python-hyperlink.inc
+++ b/meta-python/recipes-devtools/python/python-hyperlink.inc
@@ -8,7 +8,7 @@ SRC_URI[md5sum] = "4772fb4d87c26a1ab22a6161424e3cba"
 
 inherit pypi
 
-RDEPENDS_${PN} += "${PYTHON_PN}-stringold ${PYTHON_PN}-netclient"
+RDEPENDS_${PN} += "${PYTHON_PN}-stringold ${PYTHON_PN}-netclient ${PYTHON_PN}-idna"
 
 PACKAGES =. "${PN}-test "
 
-- 
2.17.1


