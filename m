Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 455AD71AFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 08:10:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1G8AlUX020694
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 00:10:47 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 16 Feb 2017 00:10:46 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Feb 2017 16:04:38 +0800
Message-ID: <20170216080438.31466-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20170216080438.31466-1-kai.kang@windriver.com>
References: <20170216080438.31466-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] libldb: update package split rules
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
X-List-Received-Date: Thu, 16 Feb 2017 08:10:53 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update packages split rules:
* make libpyldb-util.so* are really packaged into pyldb and pyldb-dev
* set NOAUTOPACKAGEDEBUG which causes all .debug directories are
  packaged into pyldb-dbg

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-support/libldb/libldb_1.1.29.bb | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.1.29.bb b/meta-networking/recipes-support/libldb/libldb_1.1.29.bb
index 2269a5726..28cb8479f 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.1.29.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.1.29.bb
@@ -45,16 +45,19 @@ EXTRA_OECONF += "--disable-rpath \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
                 "
 
-PACKAGES += "pyldb pyldb-dbg pyldb-dev"
+PACKAGES =+ "pyldb pyldb-dbg pyldb-dev"
+
+NOAUTOPACKAGEDEBUG = "1"
 
 FILES_${PN} += "${libdir}/ldb/*"
-FILES_${PN}-dbg += "${libdir}/ldb/.debug/* \
+FILES_${PN}-dbg += "${bindir}/.debug/* \
+                    ${libdir}/.debug/* \
+                    ${libdir}/ldb/.debug/* \
                     ${libdir}/ldb/modules/ldb/.debug/*"
 
 FILES_pyldb = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/* \
-               ${libdir}/libpyldb-util.so.1 \
-               ${libdir}/libpyldb-util.so.1.1.17 \
+               ${libdir}/libpyldb-util.so.* \
               "
 FILES_pyldb-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.debug \
-                   ${libdir}/.debug/libpyldb-util.so.1.1.17"
+                   ${libdir}/.debug/libpyldb-util.so.*"
 FILES_pyldb-dev = "${libdir}/libpyldb-util.so"
-- 
2.11.0


