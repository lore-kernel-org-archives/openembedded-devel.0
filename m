Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id B286378856
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Feb 2018 02:43:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="36651469"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Feb 2018 10:43:09 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 4358749F19BC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Feb 2018 10:43:10 +0800 (CST)
Received: from localhost.localdomain (10.167.225.156) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 2 Feb 2018 10:43:08 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 2 Feb 2018 19:42:33 +0800
Message-ID: <1517571753-69081-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.156]
X-yoursite-MailScanner-ID: 4358749F19BC.A6ADF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] xrdp: bug fix
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
X-List-Received-Date: Fri, 02 Feb 2018 02:43:10 -0000
Content-Type: text/plain

Change default config file for pam to fix the pam problem.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
index ccc8e35..a75bcfc 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.4.bb
@@ -65,7 +65,7 @@ do_install_append() {
 	sed -i -e 's,@sbindir@,${sbindir},g' ${D}${systemd_unitdir}/system/xrdp.service ${D}${systemd_unitdir}/system/xrdp-sesman.service
 
 	install -m 0644 ${S}/instfiles/*.ini ${D}${sysconfdir}/xrdp/
-	install -m 0644 ${S}/instfiles/pam.d/xrdp-sesman.debian ${D}${sysconfdir}/xrdp/pam.d/xrdp-sesman
+	install -m 0644 ${S}/instfiles/pam.d/xrdp-sesman.suse ${D}${sysconfdir}/pam.d/xrdp-sesman
 	install -m 0644 ${S}/sesman/sesman.ini ${D}${sysconfdir}/xrdp/
 	install -m 0644 ${S}/sesman/startwm.sh ${D}${sysconfdir}/xrdp/
 	install -m 0644 ${S}/xrdp/xrdp.ini ${D}${sysconfdir}/xrdp/
-- 
2.7.4




