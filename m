Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C84B86BA93
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 05:17:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6F5HPfJ001512
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jul 2019 22:17:26 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sun, 14 Jul 2019 22:17:25 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jul 2019 13:09:54 +0800
Message-ID: <1563167394-21650-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] postfix: fix postinstall to avoid do_rootfs failure
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
X-List-Received-Date: Mon, 15 Jul 2019 05:17:26 -0000
Content-Type: text/plain

When lsb is enabled, that is, 'linuxstdbase' is in OVERRIDES,
do_rootfs would fail if both 'msmtp' and 'postfix' are installed.
This is because they both try to create /usr/lib/sendmail link if
it does not exist. So we need to fix the check to avoid non-zero
exit status.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 3d4f1df..021129c 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -221,7 +221,7 @@ pkg_postinst_${PN} () {
     else
         if ${@'true' if 'linuxstdbase' in d.getVar('DISTROOVERRIDES', False) else 'false'}; then
             # /usr/lib/sendmail is required by LSB core test
-            [ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail $D/usr/lib/
+            [ ! -L $D/usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail $D/usr/lib/ || true
         fi
 
         touch $D/etc/aliases
-- 
2.7.4


