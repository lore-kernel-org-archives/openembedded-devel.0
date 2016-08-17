Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD716E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 09:52:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7H9qaNO001503
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 02:52:36 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 17 Aug 2016 02:52:36 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Aug 2016 17:51:35 +0800
Message-ID: <20160817095135.12043-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH] ifenslave: upgrade to 2.7
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
X-List-Received-Date: Wed, 17 Aug 2016 09:52:36 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The current version of ifenslave is 2.6_1.1.0 actually, then update to
2.7 and change the version to 2.7 too.

* update to SRC_URI to the debian git repo
* the license is changed from GPLv2 to GPLv3
* the program is rewrote with shell script

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{ifenslave_1.1.0.bb => ifenslave_2.7.bb}       | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)
 rename meta-networking/recipes-support/ifenslave/{ifenslave_1.1.0.bb => ifenslave_2.7.bb} (22%)

diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb b/meta-networking/recipes-support/ifenslave/ifenslave_2.7.bb
similarity index 22%
rename from meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
rename to meta-networking/recipes-support/ifenslave/ifenslave_2.7.bb
index acc0864..7473b0d 100644
--- a/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
+++ b/meta-networking/recipes-support/ifenslave/ifenslave_2.7.bb
@@ -2,17 +2,19 @@ SUMMARY = "Configure network interfaces for parallel routing"
 HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/bonding"
 SECTION = "net"
 
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://ifenslave.c;beginline=8;endline=12;md5=a9f0bd2324cdc1b36d1f44f0e643a62a"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=6807ba81c0744ab50d735c94628c3f64"
 
-SRC_URI = "http://ftp.debian.org/debian/pool/main/i/${BPN}-2.6/${BPN}-2.6_${PV}.orig.tar.gz"
-SRC_URI[md5sum] = "56126cd1013cefe0ce6f81613e677bdd"
-SRC_URI[sha256sum] = "7917bf34de80a2492eb225adf9168c83a4854ac8a008ed0fd5b3fd147ccd3041"
+SRCREV = "400c490d52acb31f1064e1bf4fc9fcaf3791888f"
+SRC_URI = "git://anonscm.debian.org/collab-maint/ifenslave.git"
+
+S = "${WORKDIR}/git"
 
-do_compile() {
-    ${CC} ifenslave.c -o ifenslave
-}
 do_install() {
-    install -d "${D}${sbindir}"
-    install -m 755 "${S}/ifenslave" "${D}${sbindir}/"
+    install -d ${D}${sbindir}
+    install -m 0755 ${S}/ifenslave ${D}${sbindir}/
+
+    install -m 0755 -D ${S}/debian/ifenslave.if-pre-up ${D}${sysconfdir}/network/if-pre-up.d/ifenslave
+    install -m 0755 -D ${S}/debian/ifenslave.if-post-down ${D}${sysconfdir}/network/if-post-down.d/ifenslave
+    install -m 0755 -D ${S}/debian/ifenslave.if-up ${D}${sysconfdir}/network/if-up.d/ifenslave
 }
-- 
2.9.3


