Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8A3DA7860F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Dec 2017 05:21:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="31047079"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Dec 2017 13:21:41 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id C6D69486A76C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Dec 2017 13:21:41 +0800 (CST)
Received: from localhost.localdomain (10.167.225.116) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 11 Dec 2017 13:21:41 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Dec 2017 22:21:35 +0800
Message-ID: <1513002095-5152-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.116]
X-yoursite-MailScanner-ID: C6D69486A76C.A6B1D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCHv2] samba: Add packagegroup
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
X-List-Received-Date: Mon, 11 Dec 2017 05:21:44 -0000
Content-Type: text/plain

Add packagegroup for samba, for there are too many rpms in samba and it's hard to manage.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../recipes-connectivity/samba/samba_4.6.7.bb         | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
index 2b227c9..0bacb02 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
@@ -162,7 +162,7 @@ PACKAGES =+ "${PN}-python ${PN}-pidl \
              ${PN}-dsdb-modules ${PN}-testsuite registry-tools \
              winbind \
              ${PN}-common ${PN}-base ${PN}-ctdb-tests \
-             smbclient"
+             smbclient ${PN}-client ${PN}-test"
 
 python samba_populate_packages() {
     def module_hook(file, pkg, pattern, format, basename):
@@ -254,3 +254,20 @@ FILES_smbclient = "${bindir}/cifsdd \
 
 RDEPENDS_${PN}-pidl_append = " perl"
 FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
+
+SUMMARY_${PN}-client = "samba client"
+RDEPENDS_${PN}-client = "\
+    smbclient \
+    winbind \
+    registry-tools \
+    ${PN}-pidl \
+    " 
+
+ALLOW_EMPTY_${PN}-client = "1"
+
+RDEPENDS_${PN}-test = "\
+    ${PN}-ctdb-tests \
+    ${PN}-testsuite \
+    "
+
+ALLOW_EMPTY_${PN}-test = "1"
-- 
2.7.4




