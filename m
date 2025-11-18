Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70B4CED249
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:08 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8404.1763456947430791243
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tjprAjHf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456948; x=1794992948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MbeSiUjkGPzY9LsSEE0f4QqlzoT1jGfDrb90Yxmsht8=;
  b=tjprAjHfmAy7sKWLmMymimikVogcM7sv66ElhOYvYwi1pDYqH3fs9QRH
   uGyhWI72a8f6q8XnuyYZbnV50PWR+2Hu+jBoUSJnrkhMM61uCY/Z1nT9r
   Z1AamXzIRk+eBamKyHmv6rbJivDxO66TMzAw/aX+GNHA7iq/rgnggUyv8
   7rLpBeghtObwkmxi81gNoFvUpNfSmb5WeSoxLxllvjpHqLVYF1Kl+Va+e
   QHWT3zcvEL4G3enT+lNS2WuGni3CDe7d9xpsl8H5UUHfZa70sY77H20TE
   KXhz7zhhMBGx2jd0mbDvG4ZnUqL65zABH5q/qXqPyQtuZ2tz7DK+9KAHG
   Q==;
X-CSE-ConnectionGUID: hZbZeEkVQbyYp76AZPZZ8A==
X-CSE-MsgGUID: pPoeIMLLSjqf5HuMgweFSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="219577898"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="219577898"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:06 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id DAE4142A334
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:05 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 8F555C02C69
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 062E01400096;
	Tue, 18 Nov 2025 09:09:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/29] nano: upgrade 8.6 -> 8.7
Date: Tue, 18 Nov 2025 17:08:25 +0800
Message-ID: <20251118090846.1484-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121819

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_8.6.bb => nano_8.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_8.6.bb => nano_8.7.bb} (87%)

diff --git a/meta-oe/recipes-support/nano/nano_8.6.bb b/meta-oe/recipes-support/nano/nano_8.7.bb
similarity index 87%
rename from meta-oe/recipes-support/nano/nano_8.6.bb
rename to meta-oe/recipes-support/nano/nano_8.7.bb
index e45c6df757..b6c65a6f31 100644
--- a/meta-oe/recipes-support/nano/nano_8.6.bb
+++ b/meta-oe/recipes-support/nano/nano_8.7.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f7abfbf0eed5f573ab51bd77a458f32d82f9859c55e9689f819d96fe1437a619"
+SRC_URI[sha256sum] = "afd287aa672c48b8e1a93fdb6c6588453d527510d966822b687f2835f0d986e9"
 
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/nano"
 
-- 
2.43.0


