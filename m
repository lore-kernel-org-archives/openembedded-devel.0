Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 33CEE73D66
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 07:04:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="91339609"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 28 Apr 2015 15:00:22 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t3S72x6w000649
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 15:02:59 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 28 Apr 2015 15:04:16 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Apr 2015 14:57:11 +0800
Message-ID: <1430204231-15700-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-networking][PATCH] ipsec-tools: set SYSTEMD_SERVICE correctly to avoid building warning.
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
X-List-Received-Date: Tue, 28 Apr 2015 07:04:16 -0000
Content-Type: text/plain

 ipsec-tools-0.8.2: ipsec-tools: Files/directories were installed but not shipped
   /lib
   /lib/systemd
   /lib/systemd/system
   /lib/systemd/system/racoon.service [installed-vs-shipped]

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
index 9704b13..67b70d0 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb
@@ -67,6 +67,8 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam,"
 PACKAGECONFIG[selinux] = "--enable-security-context,--disable-security-context,libselinux,"
 
+SYSTEMD_SERVICE_${PN} = "racoon.service"
+
 do_install_append() {
     install -d ${D}${sysconfdir}/racoon
     install -m 0644 ${WORKDIR}/racoon.conf.sample ${D}${sysconfdir}/racoon/racoon.conf
@@ -82,3 +84,6 @@ do_install_append() {
         install -m 0644 ${WORKDIR}/racoon.conf ${D}${sysconfdir}/default/racoon
     fi
 }
+
+FILES_${PN} += "${sysconfdir}/racoon/racoon.conf \
+                ${sysconfdir}/default/racoon"
-- 
1.9.1


