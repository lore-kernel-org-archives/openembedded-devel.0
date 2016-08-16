Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA3B7709E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 04:04:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9957493"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Aug 2016 12:04:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id C14D642BC505
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 12:04:50 +0800 (CST)
Received: from localhost.localdomain (10.167.226.25) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 16 Aug 2016 12:04:48 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <1461839408-4251-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.25]
X-yoursite-MailScanner-ID: C14D642BC505.ABDC2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] opensaf: make sure /etc/init.d/opensafd exist
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
Date: Tue, 16 Aug 2016 04:04:55 -0000
X-Original-Date: Thu, 28 Apr 2016 13:30:08 +0300
X-List-Received-Date: Tue, 16 Aug 2016 04:04:55 -0000
Content-Type: text/plain

when disable sysvinit and specify "systemd" in DISTRO_FEATURES,
    the recipe "inhert systemd" will delete "/etc/init.d/opensafd",but
    "/etc/init.d/opensafd" is needed to start opensafd.service.

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
index f687378..da9c105 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.0.0.bb
@@ -55,9 +55,19 @@ do_install_append() {
     install -m 0644 ${B}/contrib/plmc/config/*.service ${D}/${systemd_unitdir}/system
 }
 
-FILES_${PN} += "${localstatedir}/run"
+FILES_${PN} += "${localstatedir}/run ${systemd_unitdir}/system/*.service"
 FILES_${PN}-staticdev += "${PKGLIBDIR}/*.a"
 
 INSANE_SKIP_${PN} = "dev-so"
 
 RDEPENDS_${PN} += "bash python"
+
+do_sysvinit_install() {
+    if [ ! -d "${D}${sysconfdir}/init.d" ]; then
+       install -d ${D}${sysconfdir}/init.d
+       install -m 0755 ${B}/osaf/services/infrastructure/nid/scripts/opensafd ${D}${sysconfdir}/init.d/
+    fi
+}
+
+addtask sysvinit_install after do_install before do_package
+
-- 
2.7.4




