Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A28B978493
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 09:35:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8D9Z9OK024983
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Sep 2018 02:35:20 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 13 Sep 2018 02:34:53 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Thu, 13 Sep 2018 17:34:52 +0800
Message-ID: <20180913093452.357414-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <fbed68fd-3ec8-6058-e43b-329232c1e960@windriver.com>
References: <fbed68fd-3ec8-6058-e43b-329232c1e960@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2] postfix: fix pkg_postinst_${PN}
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
X-List-Received-Date: Thu, 13 Sep 2018 09:35:45 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

"exit 0" will break the postinst logic
below the line "exit 0" such as:
===
update-alternatives --install /usr/sbin/sendmail sendmail /usr/sbin/sendmail.postfix 120
update-alternatives --install /usr/bin/mailq mailq /usr/bin/mailq.postfix 120
update-alternatives --install /usr/bin/newaliases newaliases /usr/bin/newaliases.postfix 120
===

It's enough to call "$INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}"
, so remove it to guarantee the postinstall logic is correct

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 49f9f7b1f..882b27b6e 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -246,10 +246,10 @@ pkg_postinst_${PN} () {
         # This can fail depending on host setup
         if ! newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases; then
             $INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}
-            exit 0
+        else
+            touch $D/etc/postfix/virtual_alias
+            postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
         fi
-        touch $D/etc/postfix/virtual_alias
-        postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
 
     fi
 }
-- 
2.13.3


