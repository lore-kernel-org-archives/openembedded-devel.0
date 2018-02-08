Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDB5460190
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Feb 2018 20:22:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w18KMiFm006513
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Feb 2018 12:22:44 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 8 Feb 2018 12:22:43 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 8 Feb 2018 12:22:49 -0800
Message-ID: <20180208202249.58495-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-netwokring][PATCH 1/1] postfix: adapt pkg_postinst to postinst_intercept
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
X-List-Received-Date: Thu, 08 Feb 2018 20:22:49 -0000
Content-Type: text/plain

Request delay to first boot if newaliases fails on host.
Check for linuxstdbase before we might fail.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index fa5eef9..09447d5 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -239,15 +239,20 @@ pkg_postinst_${PN} () {
         touch /etc/postfix/virtual_alias
         postmap /etc/postfix/virtual_alias
     else
-        touch $D/etc/aliases
-        newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases
-        touch $D/etc/postfix/virtual_alias
-        postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
-
         if ${@'true' if 'linuxstdbase' in d.getVar('DISTROOVERRIDES', False) else 'false'}; then
             # /usr/lib/sendmail is required by LSB core test
             [ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail $D/usr/lib/
         fi
+
+        touch $D/etc/aliases
+        # This can fail depending on host setup
+        if ! newaliases -C $D/etc/postfix/main.cf -oA$D/etc/aliases; then
+            $INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}
+            exit 0
+        fi
+        touch $D/etc/postfix/virtual_alias
+        postmap -c $D/etc/postfix $D/etc/postfix/virtual_alias
+
     fi
 }
 
-- 
2.7.4


