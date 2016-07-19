Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B273B607A5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 08:43:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6J8hTJp002349
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Jul 2016 01:43:29 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 19 Jul 2016 01:43:28 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <Joe_MacDonald@mentor.com>, <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Jul 2016 16:30:38 +0800
Message-ID: <20160719083038.11326-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH] snort: fix to remove from blacklist
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
X-List-Received-Date: Tue, 19 Jul 2016 08:43:29 -0000
Content-Type: text/plain

Fix paths in pkgconfig files and remove snort from blacklist.
Also add 'xz' to DEPENDS to avoid the following QA issue.

WARNING: snort-2.9.7.5-r0 do_package_qa: QA Issue: snort rdepends on liblzma, but it isn't a build dependency, missing xz in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
index 7d946af..fb71799 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.7.5.bb
@@ -4,7 +4,7 @@ SECTION = "net"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
 
-DEPENDS = "libpcap libpcre daq libdnet util-linux"
+DEPENDS = "xz libpcap libpcre daq libdnet util-linux"
 
 SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
     file://snort.init \
@@ -56,6 +56,8 @@ do_install_append() {
     install -m 755 ${WORKDIR}/snort.init ${D}${sysconfdir}/init.d/snort
     mkdir -p ${D}${localstatedir}/log/snort
     install -d ${D}/var/log/snort
+
+    sed -i 's/-fdebug-prefix-map[^ ]*//g; s#${STAGING_DIR_TARGET}##g' ${D}${libdir}/pkgconfig/*.pc
 }
 
 FILES_${PN} += " \
@@ -84,6 +86,3 @@ FILES_${PN}-dev += " \
     ${libdir}/snort_dynamicrules/*.so \
     ${prefix}/src/snort_dynamicsrc \
 "
-
-# http://errors.yoctoproject.org/Errors/Details/35137/
-PNBLACKLIST[snort] ?= "BROKEN: QA Issue: snort_preproc.pc, snort_output.pc, snort.pc"
-- 
2.8.3


