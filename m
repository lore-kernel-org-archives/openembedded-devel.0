Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E123F74793
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 06:00:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5Q60Egh003047
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 23:00:14 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 23:00:01 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:00:56 +0800
Message-ID: <1529992863-24711-13-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 13/20] python(3)-pyasn1: upgrade 0.4.2 -> 0.4.3
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
X-List-Received-Date: Tue, 26 Jun 2018 06:00:13 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The license checksum changes but the license remains the same.
The change is only about year, 2017 -> 2018.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc              | 7 ++++---
 .../python/{python-pyasn1_0.4.2.bb => python-pyasn1_0.4.3.bb}      | 0
 .../python/{python3-pyasn1_0.4.2.bb => python3-pyasn1_0.4.3.bb}    | 0
 3 files changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.4.2.bb => python-pyasn1_0.4.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1_0.4.2.bb => python3-pyasn1_0.4.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index f3c32e08a..614b6d4ed 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -1,10 +1,11 @@
 SUMMARY = "Python library implementing ASN.1 types."
 HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=280606d9c18f200e03e0c247ac61475a"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=815ac3f9ca693006349094b358ab3155"
 
-SRC_URI[md5sum] = "cb5883ddc6a9f405600429f37cf0759c"
-SRC_URI[sha256sum] = "d258b0a71994f7770599835249cece1caef3c70def868c4915e6e5ca49b67d15"
+
+SRC_URI[sha256sum] = "fb81622d8f3509f0026b0683fe90fea27be7284d3826a5f2edf97f69151ab0fc"
+SRC_URI[md5sum] = "311fff5b2a1303a8cdc334c8867a06f4"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.4.2.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.4.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1_0.4.2.bb
rename to meta-python/recipes-devtools/python/python-pyasn1_0.4.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.4.2.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.4.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1_0.4.2.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1_0.4.3.bb
-- 
2.11.0


