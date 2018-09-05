Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A0AA4753DE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 12:34:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w85CYKi6009860
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Sep 2018 05:34:20 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 5 Sep 2018 05:34:19 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Sep 2018 08:33:21 -0400
Message-ID: <1536150801-171989-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1536150801-171989-1-git-send-email-hongxu.jia@windriver.com>
References: <1536150801-171989-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] sblim-sfcb: do not use 'exit 1' to postpone to first boot
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
X-List-Received-Date: Wed, 05 Sep 2018 12:34:19 -0000
Content-Type: text/plain

Since `939f7f1 meta/lib/oe/rootfs.py: do not execute
defer_to_first_boot when processing postinst_intercept hooks' applied
in oe-core, use defer_to_first_boot rather than `exit 1' to postpone
to first boot

Remove duplicated `systemctl enable', it is done in systemd.bbclass

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index ffbe7ea..91c5002 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -68,14 +68,8 @@ do_install() {
 }
 
 pkg_postinst_${PN} () {
-    OPTS=""
-
     if [ x"$D" != "x" ]; then
-        OPTS="--root=$D"
-        if type systemctl >/dev/null 2>/dev/null; then
-                systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
-        fi
-        exit 1
+        $INTERCEPT_DIR/postinst_intercept delay_to_first_boot ${PKG} mlprefix=${MLPREFIX}
     fi
 
     ${datadir}/sfcb/genSslCert.sh ${sysconfdir}/sfcb
-- 
2.8.1


