Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83954CCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:55:46 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12749.1762847740266904096
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:55:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ISPxUXne;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847739; x=1794383739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LziaGVRVQRr6OEQ6SLbQESXOPYEml9St3UEoVspDvoA=;
  b=ISPxUXnefy6pAbu1MMMP0fS+Aw0giVJFv6uT5heONe9aXSdiM+v5U4rZ
   enHaKWcsicZu4HVxJQq5W+pbTHzF0TnEUweso7BzxUm7XiZaw2kj+1DcN
   D/Fyztb0sZ/i3V1r9KHtxeRY6dc7G+BGloQGrWM2NwIkom5BF49nc4iZh
   uKsQFz0cciYZ/OJoKVs9QmjZ6SvYWAa39apxIpJjkwaIM0upJ0QOV4JsW
   OL8tqq/JOPHPaWPQslnwDLsx4lsoaWZkphZMBscfDdhQHAeNT0wKRdiW9
   rfvgYYy1ExQ1VsDUu8qL4csLtoqbfDzhzG/Rr9MZRVUPp33PMSTXz8s3v
   A==;
X-CSE-ConnectionGUID: yCqB3YgqTK2vXbf0D0SgFw==
X-CSE-MsgGUID: wHVkrQp7RMWLRx+PegDa+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="207370150"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="207370150"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:38 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id CDB6E82009D
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:38 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 8E9841400624
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 175CB1800D79;
	Tue, 11 Nov 2025 07:55:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/23] pv: upgrade 1.9.44 -> 1.10.0
Date: Tue, 11 Nov 2025 15:55:02 +0800
Message-ID: <20251111075517.1650-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121487

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/pv/{pv_1.9.44.bb => pv_1.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pv/{pv_1.9.44.bb => pv_1.10.0.bb} (95%)

diff --git a/meta-oe/recipes-support/pv/pv_1.9.44.bb b/meta-oe/recipes-support/pv/pv_1.10.0.bb
similarity index 95%
rename from meta-oe/recipes-support/pv/pv_1.9.44.bb
rename to meta-oe/recipes-support/pv/pv_1.10.0.bb
index 2cc1f0b229..347cca32f3 100644
--- a/meta-oe/recipes-support/pv/pv_1.9.44.bb
+++ b/meta-oe/recipes-support/pv/pv_1.10.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.ivarch.com/programs/sources/${BP}.tar.gz \
            file://pv-test-system-version.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "e130c9e18b1e6e9e2ef95bec6117c72cb9be27a1b8ffe97fca787e4c8e014562"
+SRC_URI[sha256sum] = "998e717419c02ee735aea0b8d57f9cbe1112f40f4b947a39ba2611a415b64da0"
 
 UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
 UPSTREAM_CHECK_REGEX = "pv-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.43.0


