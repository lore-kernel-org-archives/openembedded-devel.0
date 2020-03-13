Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC7F61B94
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 18:58:02 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id B2EA960045;
	Fri, 13 Mar 2020 19:57:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1584125879;
	bh=lLq7MMpj9bOklkUW21yo5AePPFj8vFDJfPsaOwA0BnE=;
	h=From:To:Cc:Subject:Date:From;
	b=k9ZmXsyms1L5azEcuVfYfueqqWgtXd3z6lPQHaxPmxFRI04U7klO/kilBWxaoW37s
	hgEskFzihsNHgbzrYOAEUJGqO2AljpTa2wTp+R6a3FyM4ttuia45wSS1msftoMUhsD
	yx8ZuYlURzIV1HyZqNsTMHHVUVXsiD6VCoaFgPkWg1/ciSTWgQAVhLPAyZFddL/Tqu
	UtF9m0yg5bxU5JzF19cGEZ7JNYzklC7m+/Q8avD+BGAPcCwmO1JusTeLzOxog5mrt7
	KDsZy9FwzADnY3YRSW3iixbAWefJE6c6NwVt4HP7XK2l/+oE/+eC5fieeW12QcY/gq
	Ww/zLLgzjLqkA==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Mar 2020 19:57:48 +0100
Message-Id: <1584125871-11210-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] python-requests: upgrade 2.22 -> 2.23
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
X-List-Received-Date: Fri, 13 Mar 2020 18:58:02 -0000

License-Update: copyright years updated

-Copyright 2018 Kenneth Reitz
+Copyright 2019 Kenneth Reitz

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-python/recipes-devtools/python/python-requests.inc             | 6 +++---
 .../{python3-requests_2.22.0.bb => python3-requests_2.23.0.bb}      | 0
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-requests_2.22.0.bb => python3-requests_2.23.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index 5fe5dc2..ddca4bc 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -1,12 +1,12 @@
 DESCRIPTION = "Python HTTP for Humans."
 HOMEPAGE = "http://python-requests.org"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a8d5a1d1c2d53025e2282c511033f6f7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=19b6be66ed463d93fa88c29f7860bcd7"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-requests:"
 
-SRC_URI[md5sum] = "ee28bee2de76e9198fc41e48f3a7dd47"
-SRC_URI[sha256sum] = "11e007a8a2aa0323f5a921e9e6a2d7e4e67d9877e85773fba9ba6419025cbeb4"
+SRC_URI[md5sum] = "abfdc28db1065bbd0bc32592ac9d27a6"
+SRC_URI[sha256sum] = "b3f43d496c6daba4493e7c431722aeb7dbc6288f52a6e04e7b6023b0247817e6"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.22.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.23.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-requests_2.22.0.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.23.0.bb
-- 
2.7.4


