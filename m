Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8A3757611E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 09:18:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98927223"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Jul 2015 17:22:23 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6R9GuEn015042
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 17:16:56 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 27 Jul 2015 17:18:46 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Jul 2015 17:18:37 +0800
Message-ID: <1437988719-2641-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-networking][PATCH 1/3] netcf: upgrade 0.2.3 -> 0.2.8
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
X-List-Received-Date: Mon, 27 Jul 2015 09:18:51 -0000
Content-Type: text/plain

Add "--with-sysinit=systemd" to support for systemd init script.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-support/netcf/netcf_git.bb | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-support/netcf/netcf_git.bb b/meta-networking/recipes-support/netcf/netcf_git.bb
index 0e88b30..1a571b3 100644
--- a/meta-networking/recipes-support/netcf/netcf_git.bb
+++ b/meta-networking/recipes-support/netcf/netcf_git.bb
@@ -6,8 +6,8 @@ LICENSE = "LGPLv2.1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
 
-SRCREV = "b8a19dc860b38c97c42115d8a559b78853452a4b"
-PV = "0.2.3+git${SRCPV}"
+SRCREV = "9158278ad35b46ce9a49b2e887483c6d8c287994"
+PV = "0.2.8+git${SRCPV}"
 
 SRC_URI = "git://git.fedorahosted.org/netcf.git;protocol=git \
 "
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 
 inherit gettext autotools-brokensep pkgconfig
 
-EXTRA_OECONF_append_class-target = " --with-driver=redhat"
+EXTRA_OECONF_append_class-target = " --with-driver=redhat --with-sysinit=systemd"
 do_configure_prepend() {
 	cd ${S}
 	rm -f .gitmodules
@@ -26,6 +26,9 @@ do_configure_prepend() {
 }
 
 do_install_append() {
-     mv ${D}${sysconfdir}/rc.d/init.d/ ${D}${sysconfdir}
-     rm -rf ${D}${sysconfdir}/rc.d/
+    install -d ${D}${systemd_unitdir}/system
+    mv ${D}${libdir}/systemd/system/ ${D}${systemd_unitdir}/system
+    rm -rf ${D}${libdir}/systemd/
 }
+
+FILES_${PN} += "${systemd_unitdir}"
-- 
1.8.4.2


