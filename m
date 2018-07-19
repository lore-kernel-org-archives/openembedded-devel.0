Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 15FC174599
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 09:33:35 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="42416968"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jul 2018 17:33:33 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id BDD2E4B62619
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 17:33:33 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Thu, 19 Jul 2018 17:33:32 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <1529906018-46076-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: BDD2E4B62619.AE154
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] samba: Delete remain of LSB.
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
Date: Thu, 19 Jul 2018 09:33:36 -0000
X-Original-Date: Sun, 24 Jun 2018 22:53:38 -0700
X-List-Received-Date: Thu, 19 Jul 2018 09:33:36 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.7.8.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.7.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.7.8.bb
index 593ff57..fc1a2e0 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.7.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.7.8.bb
@@ -48,9 +48,6 @@ DEPENDS_append_libc-musl = " libtirpc"
 CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
 LDFLAGS_append_libc-musl = " -ltirpc"
 
-LSB = ""
-LSB_linuxstdbase = "lsb"
-
 INITSCRIPT_NAME = "samba"
 INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
 
@@ -70,7 +67,6 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd zeroconf', d)}
                    acl ad-dc cups gnutls ldap mitkrb5 \
 "
 
-RDEPENDS_${PN}-base += "${LSB}"
 RDEPENDS_${PN}-ctdb-tests += "bash util-linux-getopt"
 
 PACKAGECONFIG[acl] = "--with-acl-support,--without-acl-support,acl"
-- 
2.7.4




