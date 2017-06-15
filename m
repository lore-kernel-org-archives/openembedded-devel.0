Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 30198783E6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:22:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5FHM64E027428
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 10:22:06 -0700
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 15 Jun 2017 10:22:05 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 15 Jun 2017 10:22:05 -0700
Message-ID: <1497547325-11931-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] iscsi-initiator-utils: do not regenerate prom_lex.c
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
X-List-Received-Date: Thu, 15 Jun 2017 17:22:06 -0000
Content-Type: text/plain

prom_lex.c is provided in source.  If we try to remake
it from prom_lex.l, we will not find "lex" since it is
not in recipe-sysroot-native.  If we do manage to provide
lex, the new source will not compile.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
index 72a17b0..16ac199 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
@@ -58,6 +58,8 @@ do_configure () {
 }
 
 do_compile () {
+    # Make sure we DO NOT regenerate prom_lex.c.
+    mv ${S}/utils/fwparam_ibft/prom_lex.l ${S}/utils/fwparam_ibft/prom_lex.l.unused
     oe_runmake -C ${S} ${EXTRA_OEMAKE} user
 }
 
-- 
2.7.4


