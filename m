Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F9FCCD194
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:08 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10923.1760433597451302600
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=h6NxAu3s;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433599; x=1791969599;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oDpAxHMPMnAo4ie1Amb4y0nqdCphaSCddNuFE3BPbEg=;
  b=h6NxAu3s+ghXyBNqEu9adcpS5JZF1HJ2N1X6qMbNW1A6UjiQTTUAG51t
   P5htYKNpN1S30+s4eFtWrOsRjE1CD3ASA10RlgskJzZX9NRDtc9ZjXKqM
   2yAlHM6/wDh70OWXKlXr0s6A8SC6BfDpYonfzqGGjZ/YabJ3xYawro+5d
   awOBKWG5kFBvs7Pk6Ph21DW08N9vuFIPNSvUUEtq0s7k3tNom23Iyrtrp
   jBqEzAzJzxtzubfu3JHszg6BUi8sEiIAQset0rWwoiWWqdiKdt0Xdz8+L
   q8M92C7aoMflo/b9wTaEJLxrUkfuOQJhSRKJzPKJ5WswVnUI8XmFf30a7
   A==;
X-CSE-ConnectionGUID: yUYg8Ek6T1WiJtzJq0Kc9g==
X-CSE-MsgGUID: X42l868AQL2ZDzJa+oIhMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="194812640"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="194812640"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:19:51 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 4E29942A320
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:51 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 0D1B2100027E
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 94473101BB76;
	Tue, 14 Oct 2025 09:19:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 10/44] libcgi-perl: upgrade 4.70 -> 4.71
Date: Tue, 14 Oct 2025 17:18:53 +0800
Message-ID: <20251014091927.493-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120570

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcgi/{libcgi-perl_4.70.bb => libcgi-perl_4.71.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.70.bb => libcgi-perl_4.71.bb} (93%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.70.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.71.bb
similarity index 93%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.70.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.71.bb
index 59803b403a..8e44e1ffb0 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.70.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.71.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "538ad19c40402e3bbbe00e6d374c3ce2966feb391096dac883ac5104c2083bc9"
+SRC_URI[sha256sum] = "9da85b30d9404d183da7ca7aedb83702cb07ed73c3078bf6f36c87f1e8a0196a"
 
 S = "${UNPACKDIR}/CGI-${PV}"
 
-- 
2.43.0


