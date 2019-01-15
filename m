Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE1AD7C0AF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jan 2019 05:06:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0F56OHl007969
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 Jan 2019 21:06:24 -0800 (PST)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 14 Jan 2019 21:06:23 -0800
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 15 Jan 2019 13:02:33 +0800
Message-ID: <20190115050233.38899-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH V3] pmdk: fix install error
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
X-List-Received-Date: Tue, 15 Jan 2019 05:06:25 -0000
Content-Type: text/plain

Install files to /usr instead of /usr/local.
Install bash_completion file to /etc/.
Remove unnecessary files which are only for debugging.
Set FILES to package /etc/bash_completion.d/pmempool.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
index 3da22a970..cbd9174c0 100644
--- a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
+++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
@@ -35,24 +35,10 @@ EXTRA_OEMAKE = "HOST_SYS='${HOST_SYS}' EXTRA_CFLAGS='${SELECTED_OPTIMIZATION}'"
 EXTRA_OEMAKE_append_libc-musl = " EXTRA_LIBS='-lfts'"
 
 do_install() {
-	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
-
-	# Copy these into the standard directories
-	install -d ${D}${bindir}/
-	mv ${D}/usr/local/bin/pmempool ${D}${bindir}/
-	mv ${D}/usr/local/bin/daxio ${D}${bindir}/
-
-	install -d ${D}${libdir}
-	mv ${D}/usr/local/lib/*so* ${D}${libdir}/
-
-	install -d ${D}${libdir}/pkgconfig
-	mv ${D}/usr/local/lib/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
-
-	install -d ${D}${includedir}
-	mv ${D}/usr/local/include/* ${D}${includedir}/
+	oe_runmake prefix=${prefix} DESTDIR=${D} sysconfdir=/etc install
 
 	# Remove uneeded files
-	rm -rf ${D}/usr/local/
+	rm -rf ${D}/usr/lib64/pmdk_debug
 }
 
 # Include these by default otherwise the SDK is not very useful
@@ -60,5 +46,6 @@ FILES_${PN} += "${bindir}/pmempool ${bindir}/daxio"
 FILES_${PN} += "${libdir}/*so*"
 FILES_${PN} += "${libdir}/pkgconfig/*.pc"
 FILES_${PN} += "${includedir}/libpmemobj++/* ${includedir}/libpmemobj/*"
+FILES_${PN} += "${sysconfdir}"
 
 COMPATIBLE_HOST='(x86_64).*'
-- 
2.14.4


