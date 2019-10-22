Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 30A187CDC0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 07:14:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9M7EGUa003832
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Oct 2019 00:14:16 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Tue, 22 Oct 2019 00:14:16 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 22 Oct 2019 15:14:14 +0800
Message-ID: <1571728454-38810-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] postfix.inc: make deterministic build
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
X-List-Received-Date: Tue, 22 Oct 2019 07:14:17 -0000
Content-Type: text/plain

This postinst can fail depending on host setup, which makes non-deterministic
build on different host.

Use postinst ontarget to always fail at do_rootfs and rerun at target first
boot.

In this situation, remove postfix-native from PACKAGE_WRITE_DEPS

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-daemons/postfix/postfix.inc            | 25 ++++++----------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index de45e08..64c20d0 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -202,26 +202,13 @@ ALTERNATIVE_LINK_NAME[mailq.1] = "${mandir}/man1/mailq.1"
 ALTERNATIVE_LINK_NAME[newaliases.1] = "${mandir}/man1/newaliases.1"
 ALTERNATIVE_LINK_NAME[sendmail.1] = "${mandir}/man1/sendmail.1"
 
-PACKAGE_WRITE_DEPS += "postfix-native"
-pkg_postinst_${PN}-cfg () {
-    if [ "x$D" = "x" ]; then
-        touch /etc/aliases
-        newaliases
-
-        # generate virtual_alias, default is hash
-        touch /etc/postfix/virtual_alias
-        postmap /etc/postfix/virtual_alias
-    else
-        touch $D/etc/aliases
-        # This can fail depending on host setup
-        if ! newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases; then
-            $INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}
-        else
-            touch $D/etc/postfix/virtual_alias
-            postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
-        fi
+pkg_postinst_ontarget_${PN}-cfg () {
+    touch /etc/aliases
+    newaliases
 
-    fi
+    # generate virtual_alias, default is hash
+    touch /etc/postfix/virtual_alias
+    postmap /etc/postfix/virtual_alias
 }
 
 PACKAGES =+ "${PN}-cfg"
-- 
2.7.4


