Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8535F6FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 09:53:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5967638"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Apr 2016 17:52:59 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 07C6E42B4B00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Apr 2016 17:52:58 +0800 (CST)
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 26 Apr 2016 17:52:57 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Apr 2016 12:52:52 +0300
Message-ID: <1461664372-2101-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
X-yoursite-MailScanner-ID: 07C6E42B4B00.AF3B3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH 1/2] rp-pppoe: Fix rootfs creation errors
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
X-List-Received-Date: Tue, 26 Apr 2016 09:53:06 -0000
Content-Type: text/plain

error: file /usr/share/doc/README from install of rp-pppoe-doc-3.11-*
conflicts with file from package dmidecode-doc-2.12*

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb
index d5f4a20..e1ca17f 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb
@@ -29,6 +29,10 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/pppoe-server.service ${D}${systemd_unitdir}/system
     sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/pppoe-server.service
     sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/pppoe-server.service
+    install -d ${D}${datadir}/doc/${PN}
+    if [ -f ${D}${datadir}/doc/README ]; then
+        mv ${D}${datadir}/doc/README ${D}${datadir}/doc/${PN}/
+    fi
 }
 
 do_install() {
-- 
1.8.4.2




