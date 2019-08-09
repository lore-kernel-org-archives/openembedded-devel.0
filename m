Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6342D7CE27
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Aug 2019 07:07:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7977YbX018187
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 Aug 2019 00:07:34 -0700 (PDT)
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 9 Aug 2019 00:07:33 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Aug 2019 15:07:31 +0800
Message-ID: <1565334451-28926-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [meta-networking][PATCH] snort: upgrade 2.9.14 -> 2.9.14.1
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
X-List-Received-Date: Fri, 09 Aug 2019 07:07:33 -0000
Content-Type: text/plain

Add volatile conf to create log directory.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/snort/snort/volatiles.99_snort  |  2 ++
 .../snort/{snort_2.9.14.bb => snort_2.9.14.1.bb}         | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/snort/snort/volatiles.99_snort
 rename meta-networking/recipes-connectivity/snort/{snort_2.9.14.bb => snort_2.9.14.1.bb} (89%)

diff --git a/meta-networking/recipes-connectivity/snort/snort/volatiles.99_snort b/meta-networking/recipes-connectivity/snort/snort/volatiles.99_snort
new file mode 100644
index 0000000..acf5f61
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort/volatiles.99_snort
@@ -0,0 +1,2 @@
+# <type> <owner> <group> <mode> <path> <linksource>
+d root root 0755 /var/log/snort none
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.14.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.14.1.bb
similarity index 89%
rename from meta-networking/recipes-connectivity/snort/snort_2.9.14.bb
rename to meta-networking/recipes-connectivity/snort/snort_2.9.14.1.bb
index 6ead49b..892fe4d 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.14.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.14.1.bb
@@ -8,6 +8,7 @@ DEPENDS = "xz libpcap libpcre daq libdnet util-linux daq-native libtirpc bison-n
 
 SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://snort.init \
+    file://volatiles.99_snort \
     file://0001-libpcap-search-sysroot-for-headers.patch \
     file://fix-host-contamination-when-enable-static-daq.patch \
     file://disable-run-test-program-while-cross-compiling.patch \
@@ -15,8 +16,8 @@ SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://0001-chdeck-for-gettid-API-during-configure.patch \
 "
 
-SRC_URI[md5sum] = "d1689c7ccaaa7bfcfa83b5bff6b8f9b8"
-SRC_URI[sha256sum] = "c0306db9ce64f45cc7c64c9afc70abe9689daa860020345ec3ba099928b7464b"
+SRC_URI[md5sum] = "009254a9797ec93321c5936b99dcd6c8"
+SRC_URI[sha256sum] = "2472989da3aace000d1ea5931ece68f8e5cc0c511e272d65182113a2481e822d"
 
 UPSTREAM_CHECK_URI = "https://www.snort.org/downloads"
 UPSTREAM_CHECK_REGEX = "snort-(?P<pver>\d+(\.\d+)+)\.tar"
@@ -72,12 +73,19 @@ do_install_append() {
 
     cp ${S}/preproc_rules/*.rules ${D}${sysconfdir}/snort/preproc_rules/
     install -m 755 ${WORKDIR}/snort.init ${D}${sysconfdir}/init.d/snort
-    mkdir -p ${D}${localstatedir}/log/snort
-    install -d ${D}/var/log/snort
+
+    install -d ${D}${sysconfdir}/default/volatiles
+    install -m 0644 ${WORKDIR}/volatiles.99_snort ${D}${sysconfdir}/default/volatiles/99_snort
 
     sed -i -e 's|-fdebug-prefix-map[^ ]*||g; s|-fmacro-prefix-map[^ ]*||g; s|${STAGING_DIR_TARGET}||g' ${D}${libdir}/pkgconfig/*.pc
 }
 
+pkg_postinst_${PN}() {
+    if [ -z "$D" ] && [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+        ${sysconfdir}/init.d/populate-volatile.sh update
+    fi
+}
+
 FILES_${PN} += " \
     ${libdir}/snort_dynamicengine/*.so.* \
     ${libdir}/snort_dynamicpreprocessor/*.so.* \
-- 
2.7.4


