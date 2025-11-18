Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B608DCEBF93
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:18 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8426.1763456950707351449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pXT5SSGC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456951; x=1794992951;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FmjTnoMQBoVZ6jzDHSOUzmW6cLfrch0Oe/85JffUgDQ=;
  b=pXT5SSGCDqq48pokGYJQcn9rsWdoVazmcZcbQY846H+okki2AQ8hFHEa
   phhdo5PKoxwkMeiGID4clVisrFI9WN/b4yEsrW6FgD6KmO8uzxOwa6UFy
   dcFr84z/O9Mp6hZuBSoQh2l2hcTYO2UUZ4e7hBT9cQjqWafI1sqNRvsh9
   TYJREDXIvhcAb38GJxU6WmgjCaV2ooaeiRYRPrnhjgBjcbK+h/8M00d6f
   vieyRt64OwjuKt6CKHaggzlNGgl7eg+nSHK62YjFWcJIsbtjBeudg33NM
   k7CmMErqah+uHgOKcdhQDqN46aJ6FWTdy5k55QNQaB9YVaqRD2FJab7e/
   g==;
X-CSE-ConnectionGUID: +8VFT8ukTIysZlwM+/GvIg==
X-CSE-MsgGUID: HQPWylSPTwmNXM5GGG+XnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="219006569"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="219006569"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:09 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 4A1103D04
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:09 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id F30B11800EB8
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6FF49140024E;
	Tue, 18 Nov 2025 09:09:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 10/29] openipmi: upgrade 2.0.36 -> 2.0.37
Date: Tue, 18 Nov 2025 17:08:27 +0800
Message-ID: <20251118090846.1484-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121821

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openipmi/{openipmi_2.0.36.bb => openipmi_2.0.37.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openipmi/{openipmi_2.0.36.bb => openipmi_2.0.37.bb} (98%)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
similarity index 98%
rename from meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb
rename to meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
index a4308aba77..090b54846c 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.37.bb
@@ -34,7 +34,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
 
 S = "${UNPACKDIR}/OpenIPMI-${PV}"
 
-SRC_URI[sha256sum] = "a0403148fa5f7bed930c958a4d1c558047e273763a408b3a0368edc137cc55d9"
+SRC_URI[sha256sum] = "c62d38f5da7df4299ac3a652508e959537752440181e34c76b2aecebd7f301b9"
 
 inherit autotools-brokensep pkgconfig perlnative update-rc.d systemd cpan-base python3targetconfig sourceforge-releases
 
-- 
2.43.0


