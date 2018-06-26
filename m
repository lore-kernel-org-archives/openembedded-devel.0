Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1D87B746FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 05:57:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5Q5w0sP013288
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 22:58:00 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 22:57:59 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:00:45 +0800
Message-ID: <1529992863-24711-2-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 02/20] python(3)-protobuf: upgrade 3.5.2 -> 3.6.0
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
X-List-Received-Date: Tue, 26 Jun 2018 05:57:59 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python-protobuf.inc               | 4 ++--
 .../python/{python-protobuf_3.5.2.bb => python-protobuf_3.6.0.bb}     | 1 +
 .../python/{python3-protobuf_3.5.2.bb => python3-protobuf_3.6.0.bb}   | 0
 3 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-protobuf_3.5.2.bb => python-protobuf_3.6.0.bb} (97%)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.5.2.bb => python3-protobuf_3.6.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-protobuf.inc b/meta-python/recipes-devtools/python/python-protobuf.inc
index 5802fea88..6a0568ae6 100644
--- a/meta-python/recipes-devtools/python/python-protobuf.inc
+++ b/meta-python/recipes-devtools/python/python-protobuf.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec
 
 inherit pypi
 
-SRC_URI[md5sum] = "393a53483224cb338df5c643646c0300"
-SRC_URI[sha256sum] = "09879a295fd7234e523b62066223b128c5a8a88f682e3aff62fb115e4a0d8be0"
+SRC_URI[md5sum] = "074abcceee0d795ba34ad6430f71d0e8"
+SRC_URI[sha256sum] = "a37836aa47d1b81c2db1a6b7a5e79926062b5d76bd962115a0e615551be2b48d"
 
 UPSTREAM_CHECK_REGEX = "protobuf/(?P<pver>\d+(\.\d+)+)/"
 
diff --git a/meta-python/recipes-devtools/python/python-protobuf_3.5.2.bb b/meta-python/recipes-devtools/python/python-protobuf_3.6.0.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python-protobuf_3.5.2.bb
rename to meta-python/recipes-devtools/python/python-protobuf_3.6.0.bb
index f04fc489f..dc0823fd2 100644
--- a/meta-python/recipes-devtools/python/python-protobuf_3.5.2.bb
+++ b/meta-python/recipes-devtools/python/python-protobuf_3.6.0.bb
@@ -1,2 +1,3 @@
 inherit setuptools
 require python-protobuf.inc
+
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.5.2.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.5.2.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.6.0.bb
-- 
2.11.0


