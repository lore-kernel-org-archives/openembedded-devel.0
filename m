Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F658CCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:19:58 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10923.1760433597451302600
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:19:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HyixcP6B;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433597; x=1791969597;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aLlal+o4SRVoWsN4OFopl12Upwb/l+PfGwo9yey3bEI=;
  b=HyixcP6BpXiTJBjh6BsdRIc3FFvNeId7+gf8PwugvH/sAL3FMYrUFc6b
   tcmx6oGXZvy/qJwYCFyHPHS2RLm1K5c6pkKOmQdjjYdsBBJTMBeSio7IS
   ClGovt8vSemN4Og8K7eG1W8az8FezQfwl7qaG/seURR6yeNwKGHf+kjt8
   6hGfmO22gyVDW39PimBsy6S1+I+emvknoO1fQD79DnIsvr5EwUy0qflg2
   cX03GzlgDjCer8OJnQX8JXgBJPXdKDbnH9tx14luaExnjsi/dohHU7J8b
   aXTnRNUyFztGgXEa6C55WaP+RKH17h5SfpdnpIHqqTERWCRGL9S87wuXj
   A==;
X-CSE-ConnectionGUID: fU01EUTPRsaTDU8kjL/P6A==
X-CSE-MsgGUID: wW98yWs4Q66IShg4J/K3ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="194812619"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="194812619"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:19:34 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 1BD0042A31A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:34 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C842B18009E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 4CC14101BB77;
	Tue, 14 Oct 2025 09:19:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/44] b4: upgrade 0.14.2 -> 0.14.3
Date: Tue, 14 Oct 2025 17:18:44 +0800
Message-ID: <20251014091927.493-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120567

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/b4/{b4_0.14.2.bb => b4_0.14.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/b4/{b4_0.14.2.bb => b4_0.14.3.bb} (79%)

diff --git a/meta-oe/recipes-devtools/b4/b4_0.14.2.bb b/meta-oe/recipes-devtools/b4/b4_0.14.3.bb
similarity index 79%
rename from meta-oe/recipes-devtools/b4/b4_0.14.2.bb
rename to meta-oe/recipes-devtools/b4/b4_0.14.3.bb
index 794e1d24dd..a922f999e2 100644
--- a/meta-oe/recipes-devtools/b4/b4_0.14.2.bb
+++ b/meta-oe/recipes-devtools/b4/b4_0.14.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit pypi python_pep517 python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "4f835b6e5ae30eff6004bb25c15fd8f4f6ecd1105596e86db1871fef7d18113d"
+SRC_URI[sha256sum] = "31a4927b8dfbb5c97edfc9569cda3b6737bbfd8430881e8cc48a0b088ced6147"
 
 RDEPENDS:${PN} += " \
     python3-mailbox \
-- 
2.43.0


