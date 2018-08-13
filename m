Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D785978E67
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 07:30:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7D7U5vP014955
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 00:30:05 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Mon, 13 Aug 2018 00:30:04 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Aug 2018 15:30:03 +0800
Message-ID: <1534145403-450580-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] kea: fix do_package warning
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
X-List-Received-Date: Mon, 13 Aug 2018 07:30:05 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Add libdhcp_stat_cmds.a and libdhcp_ha.a to
FILES_${PN}-staticdev to fix below warning:

WARNING: kea-1.4.0-r0 do_package: QA Issue: kea: Files/directories were installed but not shipped in any package:
  /usr/lib64/hooks/libdhcp_stat_cmds.a
  /usr/lib64/hooks/libdhcp_ha.a

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-networking/recipes-connectivity/kea/kea_1.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/kea/kea_1.4.0.bb b/meta-networking/recipes-connectivity/kea/kea_1.4.0.bb
index 40db22b..ba01b8c 100644
--- a/meta-networking/recipes-connectivity/kea/kea_1.4.0.bb
+++ b/meta-networking/recipes-connectivity/kea/kea_1.4.0.bb
@@ -45,7 +45,7 @@ PACKAGECONFIG[openssl] = "--with-openssl=${STAGING_DIR_TARGET}${prefix},,openssl
 PACKAGECONFIG[log4cplus] = "--with-log4cplus=${STAGING_DIR_TARGET}${prefix},,log4cplus,log4cplus"
 PACKAGECONFIG[boost] = "--with-boost-include=${STAGING_INCDIR} --with-boost-lib-dir=${STAGING_LIBDIR} --with-boost-libs=-lboost_system,,boost,boost"
 
-FILES_${PN}-staticdev += "${libdir}/kea/hooks/*.a"
+FILES_${PN}-staticdev += "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
 FILES_${PN} += "${libdir}/hooks/*.so"
 
 BBCLASSEXTEND += "native"
-- 
2.7.4


