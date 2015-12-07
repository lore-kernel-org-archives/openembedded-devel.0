Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 608 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 07 Dec 2015 05:52:29 UTC
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3F52C6012C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 05:52:29 +0000 (UTC)
Received: from yt-mxoi1.gw.nic.fujitsu.com (unknown [192.168.229.67]) by
	mgwym02.jp.fujitsu.com with smtp
	id 1e74_4085_9ee3b178_eb97_4abe_aed3_d7dcd6aca9e5;
	Mon, 07 Dec 2015 14:42:15 +0900
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local
	(g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
	by yt-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 840D0AC0236
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 14:42:14 +0900 (JST)
Received: from g01jpexchyt37.g01.fujitsu.local (unknown [10.128.193.4])
	by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	E52EF5842D4 for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 14:42:13 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchyt37.g01.fujitsu.local (10.128.193.67) with Microsoft SMTP
	Server id 14.3.266.1; Mon, 7 Dec 2015 14:42:13 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 7 Dec 2015 14:43:16 +0900
Message-ID: <1449466996-17396-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] hostapd: upgrade 2.4 -> 2.5
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
X-List-Received-Date: Mon, 07 Dec 2015 05:52:33 -0000
Content-Type: text/plain

1. upgrade to 2.5
2. update HOMEPAGE and SRC_URI to use w1.fi instead

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../hostapd/{hostapd_2.4.bb => hostapd_2.5.bb}                    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-connectivity/hostapd/{hostapd_2.4.bb => hostapd_2.5.bb} (83%)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
similarity index 83%
rename from meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb
rename to meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
index 901c7ea..d95dbec 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.4.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
@@ -1,4 +1,4 @@
-HOMEPAGE = "http://hostap.epitest.fi"
+HOMEPAGE = "http://w1.fi/hostapd/"
 SECTION = "kernel/userland"
 LICENSE = "GPLv2 | BSD"
 LIC_FILES_CHKSUM = "file://README;md5=4d53178f44d4b38418a4fa8de365e11c"
@@ -12,7 +12,7 @@ SYSTEMD_SERVICE_${PN} = "hostapd.service"
 SYSTEMD_AUTO_ENABLE_${PN} = "disable"
 
 SRC_URI = " \
-    http://hostap.epitest.fi/releases/hostapd-${PV}.tar.gz \
+    http://w1.fi/releases/hostapd-${PV}.tar.gz \
     file://defconfig \
     file://init \
     file://hostapd.service \
@@ -42,5 +42,5 @@ do_install() {
 
 CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
 
-SRC_URI[md5sum] = "04578f3f2c3eb1bec1adf30473813912"
-SRC_URI[sha256sum] = "6fe0eb6bd1c9cbd24952ece8586b6f7bd14ab358edfda99794e79b9b9dbd657f"
+SRC_URI[md5sum] = "69f9cec3f76d74f402864a43e4f8624f"
+SRC_URI[sha256sum] = "8e272d954dc0d7026c264b79b15389ec2b2c555b32970de39f506b9f463ec74a"
-- 
1.8.4.2


