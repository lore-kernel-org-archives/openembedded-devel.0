Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 802B37780A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Feb 2018 21:26:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w11LQIhx024497
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Feb 2018 13:26:18 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 1 Feb 2018 13:26:17 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Feb 2018 13:26:17 -0800
Message-ID: <20180201212617.94472-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] postfix: move running newaliases back to pkg_postinst
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
X-List-Received-Date: Thu, 01 Feb 2018 21:26:17 -0000
Content-Type: text/plain

newaliases, when run on the host, will fail if /var/spool/postfix
does not exist.  Run it during pkg_postinst() so that we can defer
it to first boot.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index e48fc39..d5d0789 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -217,12 +217,6 @@ do_install_append_class-native() {
 do_install_append_class-target() {
     # Remove references to buildmachine paths in target makedefs.out
     sed -i 's:-fdebug-prefix-map[^ ]*::g; s:--sysroot=${STAGING_DIR_TARGET}::g' ${D}/etc/postfix/makedefs.out
-    # Since we are building recipe postfix, newaliases and postmap come from our sysroot_native.
-    touch ${D}/etc/aliases
-    newaliases -C ${D}/etc/postfix/main.cf -oA${D}/etc/aliases
-    touch ${D}/etc/postfix/virtual_alias
-    postmap -c ${D}/etc/postfix ${D}/etc/postfix/virtual_alias
-
 }
 
 ALTERNATIVE_${PN} = "sendmail"
@@ -235,6 +229,7 @@ ALTERNATIVE_LINK_NAME[mailq.1] = "${mandir}/man1/mailq.1"
 ALTERNATIVE_LINK_NAME[newaliases.1] = "${mandir}/man1/newaliases.1"
 ALTERNATIVE_LINK_NAME[sendmail.1] = "${mandir}/man1/sendmail.1"
 
+PACKAGE_WRITE_DEPS += "postfix-native"
 pkg_postinst_${PN} () {
     if [ "x$D" = "x" ]; then
         touch /etc/aliases
@@ -248,6 +243,12 @@ pkg_postinst_${PN} () {
             # /usr/lib/sendmail is required by LSB core test
             [ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail $D/usr/lib/
         fi
+
+        touch $D/etc/aliases
+        # fails if /var/spool/postfix is not on host
+        newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases  ||  exit 1
+        touch $D/etc/postfix/virtual_alias
+        postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
     fi
 }
 
-- 
2.7.4


