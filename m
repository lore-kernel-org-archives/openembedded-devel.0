Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 35D1C60196
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Jul 2014 06:40:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s616ehcf000455
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jun 2014 23:40:43 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 30 Jun 2014 23:40:43 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Jul 2014 14:40:42 +0800
Message-ID: <1404196842-21840-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] hostapd: uprev to 2.2
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
X-List-Received-Date: Tue, 01 Jul 2014 06:40:52 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Rename hostap-daemon as hostapd and uprev it to 2.2

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../hostapd/{hostap-daemon-1.0 => hostapd-2.2}/defconfig         |    0
 .../hostapd/{hostap-daemon-1.0 => hostapd-2.2}/init              |    0
 .../hostapd/{hostap-daemon_1.0.bb => hostapd_2.2.bb}             |    6 +++---
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/hostapd/{hostap-daemon-1.0 => hostapd-2.2}/defconfig (100%)
 rename meta-oe/recipes-connectivity/hostapd/{hostap-daemon-1.0 => hostapd-2.2}/init (100%)
 rename meta-oe/recipes-connectivity/hostapd/{hostap-daemon_1.0.bb => hostapd_2.2.bb} (81%)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/defconfig b/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/defconfig
similarity index 100%
rename from meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/defconfig
rename to meta-oe/recipes-connectivity/hostapd/hostapd-2.2/defconfig
diff --git a/meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/init b/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/init
similarity index 100%
rename from meta-oe/recipes-connectivity/hostapd/hostap-daemon-1.0/init
rename to meta-oe/recipes-connectivity/hostapd/hostapd-2.2/init
diff --git a/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb
similarity index 81%
rename from meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
rename to meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb
index 1699103..d0d9df9 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostap-daemon_1.0.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb
@@ -1,7 +1,7 @@
 HOMEPAGE = "http://hostap.epitest.fi"
 SECTION = "kernel/userland"
 LICENSE = "GPLv2 | BSD"
-LIC_FILES_CHKSUM = "file://README;md5=4d709ce0f9c84b87d148e16731f647e1"
+LIC_FILES_CHKSUM = "file://README;md5=0854a4da34ac3990770794d771fac7fd"
 DEPENDS = "libnl openssl"
 SUMMARY = "User space daemon for extended IEEE 802.11 management"
 
@@ -39,5 +39,5 @@ do_install() {
 
 CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
 
-SRC_URI[md5sum] = "236247a7bbd4f60d5fa3e99849d1ffc9"
-SRC_URI[sha256sum] = "002e9dcb7e46cf82b5900a2fcf92b30fc8cdfd32a72d7fd4488588f1c013dfcc"
+SRC_URI[md5sum] = "23c1f78a693c3288802d516adb7fd289"
+SRC_URI[sha256sum] = "f15b6bcb434378860ea5b88dffed7f54d8cb71fff2146de0f006977a5e25a882"
-- 
1.7.10.4


