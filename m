Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id D609160939
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Dec 2017 09:33:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="30726821"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Dec 2017 17:33:38 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1D7B3486A761
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Dec 2017 17:33:37 +0800 (CST)
Received: from localhost.localdomain (10.167.225.116) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Tue, 5 Dec 2017 17:33:35 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Dec 2017 17:33:07 +0800
Message-ID: <1512466387-8999-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.116]
X-yoursite-MailScanner-ID: 1D7B3486A761.A3E16
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-networking][PATCH] packagegroup-samba: new add
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
X-List-Received-Date: Tue, 05 Dec 2017 09:33:39 -0000
Content-Type: text/plain

Add packagegroup for samba, for there are too many rpms in samba and it's hard to manage.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../packagegroups/packagegroup-samba.bb            | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/packagegroups/packagegroup-samba.bb

diff --git a/meta-networking/recipes-connectivity/packagegroups/packagegroup-samba.bb b/meta-networking/recipes-connectivity/packagegroups/packagegroup-samba.bb
new file mode 100644
index 0000000..6177691
--- /dev/null
+++ b/meta-networking/recipes-connectivity/packagegroups/packagegroup-samba.bb
@@ -0,0 +1,28 @@
+SUMMARY = "samba package groups"
+PV = "1.0"
+PR = "r2"
+
+inherit packagegroup
+
+PROVIDES = "${PACKAGES}"
+PACKAGES = "${PN}-server ${PN}-client ${PN}-ctdb-tests ${PN}-pidl"
+
+SUMMARY_${PN}-client = " samba client"
+RDEPENDS_${PN}-client = "\
+    smbclient \
+    samba-common \
+    winbind \
+    registry-tools \
+    "
+
+SUMMARY_${PN}-server = " samba server"
+RDEPENDS_${PN}-server = "\
+    samba \
+    samba-common \
+    "
+
+SUMMARY_${PN}-ctdb-tests = " samba ctdb-tests"
+RDEPENDS_${PN}-ctdb-tests = "samba-ctdb-tests"
+
+SUMMARY_${PN}-pidl = "samba-pidl"
+RDEPENDS_${PN}-pidl = "samba-pidl"
-- 
2.7.4




