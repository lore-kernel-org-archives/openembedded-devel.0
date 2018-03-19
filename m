Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 246C978A1A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 23:50:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2JNoQmS016326
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 16:50:26 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 19 Mar 2018 16:50:26 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 19 Mar 2018 16:50:25 -0700
Message-ID: <20180319235025.43485-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] postfix: remove host references from makedefs.out
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
X-List-Received-Date: Mon, 19 Mar 2018 23:50:26 -0000
Content-Type: text/plain

Several -I definitions contain the value of ${STAGING_DIR_TARGET}
which should be removed to reference directories on the target.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 5e11794..fab9e36 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -217,6 +217,7 @@ do_install_append_class-native() {
 do_install_append_class-target() {
     # Remove references to buildmachine paths in target makedefs.out
     sed -i 's:-fdebug-prefix-map[^ ]*::g; s:--sysroot=${STAGING_DIR_TARGET}::g' ${D}/etc/postfix/makedefs.out
+    sed -i 's:-I${STAGING_DIR_TARGET}:-I:g' ${D}/etc/postfix/makedefs.out
 }
 
 ALTERNATIVE_${PN} = "sendmail"
--- 
2.7.4


