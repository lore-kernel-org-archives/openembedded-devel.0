Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 27F7C61103
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 06:28:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9V6Sl2N010912
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Oct 2013 23:28:47 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 30 Oct 2013 23:28:47 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2013 14:29:42 +0800
Message-ID: <1383200986-18674-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/5] cyrus-sasl: remove the unnecessary pkg_postinst
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
X-List-Received-Date: Thu, 31 Oct 2013 06:28:47 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

saslpasswd2 is used by an administrator to set a user's sasl password,
setting a default one in pkg_postinst in not only unnecessary but also
inappropriate.

Besides, running saslpasswd2 takes a significant amount of time to finish,
so this pkg_postinst will make the first boot take longer time.

According to the above two reasons, the patch remove the pkg_postint.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../cyrus-sasl/cyrus-sasl_2.1.26.bb                |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
index f05ab85..b4e9190 100644
--- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
+++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
@@ -54,11 +54,6 @@ USERADD_PACKAGES = "${PN}-bin"
 GROUPADD_PARAM_${PN}-bin = "--system mail"
 USERADD_PARAM_${PN}-bin = "--system --home=/var/spool/mail -g mail cyrus"
 
-pkg_postinst_${PN}-bin () {
-    echo "cyrus" | saslpasswd2 -p -c cyrus
-    chgrp mail /etc/sasldb2
-}
-
 SRC_URI[md5sum] = "a7f4e5e559a0e37b3ffc438c9456e425"
 SRC_URI[sha256sum] = "8fbc5136512b59bb793657f36fadda6359cae3b08f01fd16b3d406f1345b7bc3"
 
-- 
1.7.9.5


