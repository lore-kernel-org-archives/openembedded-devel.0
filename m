Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04640C44512
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:31:21 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9511.1768995072106144671
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q8/wcUDP;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995072; x=1800531072;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=POwRyv4eMnuXD34pBA60gfXkoAO+v3H7+KZFauGqYpE=;
  b=Q8/wcUDPyTN1ZWtiQ6zYjfUydOwPLI5e0zHKu0vLk/oXawu+ejnox3J2
   zsOsy1K/01pCJIPF9sGO9pM+k0bheS3VarC97YWO9ymeKE3kDslLiTSM8
   Ws/rZ6Bw6BjOS+YXBHMTQn+Qjh0Res2FVMEGPS9t1ToCRv6NXwqyrGSyU
   oTKdJ2kr12FkR4f1EqxG2crV/DbMTkWn4GuJV6HpL5F+a9OAuuBiWzNUe
   ol7dP0ZViPkGVSnC7gzxRnNnPAMjNZkw6rzf5VSj3hASZIiDSg2H/DYHq
   cv03YQ/vEbzTAPPwAlm1On/Pk3H9ALePl8GHzt6tXnJTN6M06DE62SKum
   w==;
X-CSE-ConnectionGUID: T/uajCw5TryCZNCqmY+6sw==
X-CSE-MsgGUID: kJ99GizEQy2KOmHoKIXKtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="227203942"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="227203942"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:31:10 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id A2903C0035D
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:31:10 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 5F17FC0608F
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:31:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id D944D140486C;
	Wed, 21 Jan 2026 11:31:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 19/30] rdfind: upgrade 1.6.0 -> 1.7.0
Date: Wed, 21 Jan 2026 19:29:10 +0800
Message-ID: <20260121112921.857-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123710

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/rdfind/{rdfind_1.6.0.bb => rdfind_1.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/rdfind/{rdfind_1.6.0.bb => rdfind_1.7.0.bb} (79%)

diff --git a/meta-oe/recipes-support/rdfind/rdfind_1.6.0.bb b/meta-oe/recipes-support/rdfind/rdfind_1.7.0.bb
similarity index 79%
rename from meta-oe/recipes-support/rdfind/rdfind_1.6.0.bb
rename to meta-oe/recipes-support/rdfind/rdfind_1.7.0.bb
index 3a15fe6c9a..1472ca94ea 100644
--- a/meta-oe/recipes-support/rdfind/rdfind_1.6.0.bb
+++ b/meta-oe/recipes-support/rdfind/rdfind_1.7.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fa22e16ebbe6638b2bd253338fbded9f"
 DEPENDS = "nettle autoconf-archive"
 
 SRC_URI = "https://rdfind.pauldreik.se/${BP}.tar.gz"
-SRC_URI[sha256sum] = "7a406e8ef1886a5869655604618dd98f672f12c6a6be4926d053be65070f3279"
+SRC_URI[sha256sum] = "78c463152e1d9e4fd1bfeb83b9c92df5e7fc4c5f93c7d426fb1f7efa2be4df29"
 
 inherit autotools
 
-- 
2.43.0


