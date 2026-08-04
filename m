Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2651FC55843
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:17:45 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10295.1785820659303284309
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EzOTaO3/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820659; x=1817356659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t4NfJgQkGb4zw56kNrDPH1+G7hryP96eZTeynnd3wU0=;
  b=EzOTaO3/eOljZBj+HD4wpd9xQHvnCM7K99QYeVS45v7gomTzL0QuD1BC
   j0uD01pNT9XQZe3oIApQSfJnfZg6ckYxq2O/teMf6nShE9bEn5VRHNN1j
   wM4N3kNiCBiYBR9ImJh/XdQwviGflO3a19fSxKgcOEONzacalkFSk5yOK
   Wd+Zt+jIK8z1reUn4PYUmoKlUpUl2NergILpEXVaAMUxJqBNZHJkCUjXd
   FpyYcB01iofvL7p994xv0rfZIi/Zx5PpvpE2XJdVuE/ASJHUWtid3iZam
   tzZXQW1fUQ0DZX2HiPrQtBgIY27alcXn0MrXIrAnCqlvVoGW6TaBq6Isz
   w==;
X-CSE-ConnectionGUID: cHJHtn4iQhunALGUgEbKLA==
X-CSE-MsgGUID: CwXO9gYETt6Yg3ItBaNQiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="249549982"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="249549982"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:17:37 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4A8BD1C000A7
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:17:37 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id EEAF3180053E
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:17:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0F75618005F0;
	Tue,  4 Aug 2026 05:17:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 03/28] libtevent: upgrade 0.17.1 -> 0.17.2
Date: Tue,  4 Aug 2026 13:17:01 +0800
Message-ID: <20260804051726.1489-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:17:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128708

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtevent/{libtevent_0.17.1.bb => libtevent_0.17.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libtevent/{libtevent_0.17.1.bb => libtevent_0.17.2.bb} (95%)

diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.17.1.bb b/meta-networking/recipes-support/libtevent/libtevent_0.17.2.bb
similarity index 95%
rename from meta-networking/recipes-support/libtevent/libtevent_0.17.1.bb
rename to meta-networking/recipes-support/libtevent/libtevent_0.17.2.bb
index 3f67b7b842..4484c7cca7 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.17.1.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.17.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
 
 LIC_FILES_CHKSUM = "file://tevent.h;endline=26;md5=47386b7c539bf2706b7ce52dc9341681"
 
-SRC_URI[sha256sum] = "1be2dea737cde25fe06621f84945e63eb71259e0c43e9f8f5da482dab1a7be92"
+SRC_URI[sha256sum] = "e53b1ac288d017d66dde0471cd429a806168ecf07179d7f019572d7a7e05f0d6"
 
 inherit pkgconfig ptest waf-samba
 
-- 
2.43.0


