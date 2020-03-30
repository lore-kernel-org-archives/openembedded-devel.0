Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.54468.1585585530090419226
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2020 09:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: trevor.gamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02UGP8VY023179
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2020 09:25:19 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Mar 2020
 09:24:58 -0700
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-jinja2: upgrade 2.10.3 -> 2.11.1
Date: Mon, 30 Mar 2020 12:24:57 -0400
Message-ID: <20200330162457.31684-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-python/recipes-devtools/python/python-jinja2.inc         | 4 ++--
 .../{python3-jinja2_2.10.3.bb => python3-jinja2_2.11.1.bb}    | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jinja2_2.10.3.bb => python3-jinja2_2.11.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-jinja2.inc b/meta-python/recipes-devtools/python/python-jinja2.inc
index 6a6aad9ef..6a95b953f 100644
--- a/meta-python/recipes-devtools/python/python-jinja2.inc
+++ b/meta-python/recipes-devtools/python/python-jinja2.inc
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
 PYPI_PACKAGE = "Jinja2"
 
-SRC_URI[md5sum] = "7883559bc5cc3e2781d94b4be61cfdcd"
-SRC_URI[sha256sum] = "9fe95f19286cfefaa917656583d020be14e7859c6b0252588391e47db34527de"
+SRC_URI[md5sum] = "5d88c7e77aa63fc852a04f65dbfe5594"
+SRC_URI[sha256sum] = "93187ffbc7808079673ef52771baa950426fd664d3aad1d0fa3e95644360e250"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-io ${PYTHON_PN}-pickle ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-math ${PYTHON_PN}-netclient \
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.10.3.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-jinja2_2.10.3.bb
rename to meta-python/recipes-devtools/python/python3-jinja2_2.11.1.bb
-- 
2.24.1

