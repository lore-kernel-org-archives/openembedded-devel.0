Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0C7DA60DD7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 06:31:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9G6VFIe010197
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Oct 2014 23:31:15 -0700 (PDT)
Received: from PKE-CLU1-D1.corp.ad.wrs.com (128.224.162.204) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 15 Oct 2014 23:31:15 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Oct 2014 14:31:13 +0800
Message-ID: <1413441073-2727-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-networking][PATCH] quagga: remove watchquagga when start with systemd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Oct 2014 06:31:20 -0000
Content-Type: text/plain

When we start with sysvinit, watchquagga uses quagga init script to
monitor zebra daemon. But we need not do this in systemd environment.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../recipes-protocols/quagga/quagga.inc            |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 9bdd4d5..2c0817b 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -62,7 +62,7 @@ EXTRA_OECONF = "--sysconfdir=${sysconfdir}/quagga \
                 --enable-exampledir=${docdir}/quagga/examples/ \
                 --enable-vtysh \
                 --enable-isisd \
-                --enable-watchquagga \
+                ${@base_contains('DISTRO_FEATURES', 'sysvinit', '--enable-watchquagga', '--disable-watchquagga', d)} \
                 --enable-ospf-te \
                 --enable-opaque-lsa \
                 --enable-ipv6 \
@@ -135,6 +135,7 @@ do_install () {
     # Remove sysinit script if sysvinit is not in DISTRO_FEATURES
     if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}; then
         rm -rf ${D}${sysconfdir}/init.d/
+        rm -f ${D}${sysconfdir}/default/watchquagga
     fi
 
     install -d ${D}${systemd_unitdir}/system
@@ -160,7 +161,7 @@ pkg_postinst_${PN} () {
 # Split into a main package and separate per-protocol packages
 PACKAGE_BEFORE_PN = "${PN}-ospfd ${PN}-ospf6d ${PN}-babeld ${PN}-bgpd \
                      ${PN}-ripd ${PN}-ripngd ${PN}-isisd \
-                     ${PN}-ospfclient ${PN}-watchquagga"
+                     ${PN}-ospfclient ${@base_contains('DISTRO_FEATURES', 'sysvinit', '${PN}-watchquagga', '', d)}"
 
 RDEPENDS_${PN} += "${PN}-babeld ${PN}-bgpd ${PN}-isisd ${PN}-ospf6d ${PN}-ospfd ${PN}-ripd ${PN}-ripngd"
 
-- 
1.7.9.5


