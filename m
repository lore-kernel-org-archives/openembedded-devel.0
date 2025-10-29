Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FF1CCF9F1
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:16:02 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web01.964.1761696958298214668
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=moBANbxJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696958; x=1793232958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KjvCGbtereHijrZq6TXdo/XRbaKqkR+PTcxt2D4hIUY=;
  b=moBANbxJgzgiXc9jj7sjyc7j6cIcnYdbTNw17PvhTukuZX2nViIgb8Df
   Vk0lPst86PaDiuW46/kYWd6ErUSu6Jh9pYKdiIS+bg+r0ZvpSlx1YcVMJ
   EgGCGlh2kbKVEsKmpk2s+bgc2R/W8C+lzZYLTA5xvmz7Fk/drn/26oVvs
   grDLHjDR4TJMx2+xLG+8+R6xIPklWo+MYdDGt0IYp3a5FpUDWOgGW7244
   5rihq3wfwn1feBMGVqt9YV3Aq0leHsNcjPfTOnq8mNn1E7ixadH8heDdw
   ZkWFv+FqxmI+fl+RjkObS3qlLEjDE+lCjZ1/k72FtcDLrg5HnQdjUSbdG
   Q==;
X-CSE-ConnectionGUID: Em/FZwPTRk+IG2fNwjdaQw==
X-CSE-MsgGUID: quThWkJORSaksaPFKzdtgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217999665"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="217999665"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:56 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id E0A3242A301
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:56 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 9B300180198B
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 06AC6826FCD;
	Wed, 29 Oct 2025 00:15:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/32] python3-matplotlib-inline: upgrade 0.1.7 -> 0.2.1
Date: Wed, 29 Oct 2025 08:14:54 +0800
Message-ID: <20251029001505.528-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121127

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...otlib-inline_0.1.7.bb => python3-matplotlib-inline_0.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib-inline_0.1.7.bb => python3-matplotlib-inline_0.2.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.7.bb b/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.2.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.7.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib-inline_0.2.1.bb
index b7d5c8efc3..b236802f20 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/matplotlib-inline/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d4692a0eb42ca54892399db2cb35e61e"
 
-SRC_URI[sha256sum] = "8423b23ec666be3d16e16b60bdd8ac4e86e840ebd1dd11a30b9f117f2fa0ab90"
+SRC_URI[sha256sum] = "e1ee949c340d771fc39e241ea75683deb94762c8fa5f2927ec57c83c4dffa9fe"
 
 PYPI_PACKAGE = "matplotlib_inline"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


