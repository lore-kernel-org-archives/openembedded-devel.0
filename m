Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C61E17453A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 05:53:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4G5r1T0018208
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2018 22:53:17 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 15 May 2018 22:52:51 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 May 2018 13:52:50 +0800
Message-ID: <1526449970-15017-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] postfix: Remove useless file makedeps.out
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
X-List-Received-Date: Wed, 16 May 2018 05:53:26 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

file /etc/postfix/makedeps.out is useless, remove it.
makedeps.out is intermediate file that documents how Postfix was built for your machine.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 09447d5..24e8607 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -207,6 +207,8 @@ do_install () {
     chown :postdrop ${D}${sbindir}/postdrop
     chmod g+s ${D}${sbindir}/postqueue
     chmod g+s ${D}${sbindir}/postdrop
+
+    rm -rf ${D}/etc/postfix/makedefs.out
 }
 
 do_install_append_class-native() {
@@ -214,10 +216,6 @@ do_install_append_class-native() {
     ln -sf ../sbin/sendmail.postfix ${D}${bindir}/mailq
 }
 
-do_install_append_class-target() {
-    # Remove references to buildmachine paths in target makedefs.out
-    sed -i 's:-fdebug-prefix-map[^ ]*::g; s:--sysroot=${STAGING_DIR_TARGET}::g' ${D}/etc/postfix/makedefs.out
-}
 
 ALTERNATIVE_${PN} = "sendmail"
 ALTERNATIVE_TARGET[sendmail] = "${sbindir}/sendmail.postfix"
-- 
2.7.4


