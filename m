Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3165D103E31A
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:27 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18527.1773312799094044119
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XYeulKT1;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312798; x=1804848798;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D5hDbGqzvqYa4jIuXlrcz7nZJ/Zf0KLYEz4nJZLx4Qc=;
  b=XYeulKT1UJS6YIXr0ss0RMBizn6PFi+WBVHHwqs0kPudGC9lX+NBlt6K
   CSShKkwzuB9dvg05WM2D12tyT/3R+Tm8yUpAb0XrXxWXT7sqiE8Mm7QJY
   NvEndVlpWin3sMQlV5YcYP2FMPMbfV5V7H6qkpSGlSCH7xOS8VjuBpUx7
   IjGehAKI0EiDGPoAuGQr/gFvxoDFht/68hsQ8LYmHPx5Ci/OnIR1NHLWb
   eW3o/tRQCrmzZ3pKHUkhxzq3rWqRnuEnbf+zztWiY8UkseAUPr2Ml6Tw0
   inYXV6j3nT4rrlUlMIMSF2mKT9I3FSPXM7m1Hw4s+VeaY79uc2El1H6x+
   Q==;
X-CSE-ConnectionGUID: QGjTN1CAQRWGLPyeAPocdQ==
X-CSE-MsgGUID: 1J5Z0nYYSgeETWDQ461Euw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="237281243"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="237281243"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:17 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B67C642A303
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:17 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 692191009E17
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 86A6718029A2;
	Thu, 12 Mar 2026 10:53:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/64] python3-alembic: upgrade 1.18.3 -> 1.18.4
Date: Thu, 12 Mar 2026 18:51:40 +0800
Message-ID: <20260312105220.1856-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125124

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Reverted the behavior of Operations.add_column() that would automatically
  render the "PRIMARY KEY" keyword inline when a Column with primary_key=True is
  added.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.18.3.bb => python3-alembic_1.18.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.18.3.bb => python3-alembic_1.18.4.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.18.3.bb b/meta-python/recipes-devtools/python/python3-alembic_1.18.4.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-alembic_1.18.3.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.18.4.bb
index b6ea160949..92c8a019e1 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.18.3.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.18.4.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ff111c41e8748bbfa45e8ba92347b681"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "1212aa3778626f2b0f0aa6dd4e99a5f99b94bd25a0c1ac0bba3be65e081e50b0"
+SRC_URI[sha256sum] = "cb6e1fd84b6174ab8dbb2329f86d631ba9559dd78df550b57804d607672cedbc"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.43.0


