Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 48DCB6C106
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 05:40:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0A5eTsH005974
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Jan 2019 21:40:29 -0800 (PST)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 9 Jan 2019 21:40:29 -0800
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Jan 2019 13:36:33 +0800
Message-ID: <20190110053633.40604-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] pmdk: fix install error
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
X-List-Received-Date: Thu, 10 Jan 2019 05:40:33 -0000
Content-Type: text/plain

Install files to /usr instead of /usr/local by replacing
PREFIX=${prefix} with prefix=${prefix}.
Remove unnecessary files which are only for debugging.
Set FILES to package /usr/etc/bash_completion.d/pmempool.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
index 3da22a970..8c3ead2ef 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
@@ -34,25 +34,13 @@ EXTRA_OEMAKE = "HOST_SYS='${HOST_SYS}' EXTRA_CFLAGS='${SELECTED_OPTIMIZATION}'"
 # Fix the missing fts libs when using musl
 EXTRA_OEMAKE_append_libc-musl = " EXTRA_LIBS='-lfts'"
 
-do_install() {
-	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
-
-	# Copy these into the standard directories
-	install -d ${D}${bindir}/
-	mv ${D}/usr/local/bin/pmempool ${D}${bindir}/
-	mv ${D}/usr/local/bin/daxio ${D}${bindir}/
-
-	install -d ${D}${libdir}
-	mv ${D}/usr/local/lib/*so* ${D}${libdir}/
+FILES_${PN} = "/usr/etc"
 
-	install -d ${D}${libdir}/pkgconfig
-	mv ${D}/usr/local/lib/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
-
-	install -d ${D}${includedir}
-	mv ${D}/usr/local/include/* ${D}${includedir}/
+do_install() {
+	oe_runmake prefix=${prefix} DESTDIR=${D} install
 
 	# Remove uneeded files
-	rm -rf ${D}/usr/local/
+	rm -rf ${D}/usr/lib64/pmdk_debug
 }
 
 # Include these by default otherwise the SDK is not very useful
-- 
2.14.4


