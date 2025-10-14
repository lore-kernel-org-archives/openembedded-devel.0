Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F401CCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:19:58 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.10922.1760433596558589768
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:19:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YXFuRUOz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433597; x=1791969597;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rIlgZshH6BZX+ZvnsJ1CpiE7V7PrmbxF2Ek9dWrqP2A=;
  b=YXFuRUOz2CFLWPCmpI8/DRrKTuQI/RsdANm+F8bvvrGmIgvH7wUh39/p
   kANgC5K5/HItWVen/zkaqloQsbbN7C7jEmA2qutDvt2uIndmcvZo5oJd5
   S0qqlLOV2avydHPi7Ka6R3exleFNnDugyaUp7QxJd+a0HKFKZcvORrJmD
   nW8a6HXUWvhceAcsoJCWIIQbhfP0TmfbS2uuPYodZy5UZUjE+W8VbU3jG
   3EUzkW7BZOY3AXytqmJuW/hszV3lTPzHQnlRSEWj+coG8B8FSSSri+qrB
   id/CnvMNCfC9cXr6+GvhsT0MEdD5/RQmLVLm+BIZAS/z1nzO1ta48H9/o
   g==;
X-CSE-ConnectionGUID: FE7Yhf14RTyZu5zBevSjpw==
X-CSE-MsgGUID: KwGHFc6zQQ6UReorVyw2WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="219476984"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="219476984"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:19:55 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id E4AE8100034A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:54 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9D2CD1C002EC
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 335DC101BB77;
	Tue, 14 Oct 2025 09:19:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/44] mcelog: upgrade 206 -> 207
Date: Tue, 14 Oct 2025 17:18:55 +0800
Message-ID: <20251014091927.493-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120566

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_206.bb => mcelog_207.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_206.bb => mcelog_207.bb} (96%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_206.bb b/meta-oe/recipes-support/mcelog/mcelog_207.bb
similarity index 96%
rename from meta-oe/recipes-support/mcelog/mcelog_206.bb
rename to meta-oe/recipes-support/mcelog/mcelog_207.bb
index 7685de722e..b7800066ca 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_206.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_207.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;
            file://run-ptest \
            "
 
-SRCREV = "7aa81797e3a42973c6aca0468ca35638bbbb06dc"
+SRCREV = "bcd71be7776f1fdbd043064bf3034a0cbf297666"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.43.0


