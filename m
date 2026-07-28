Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20BFC54F52
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:30 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5780.1785218838054026039
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=W/Qw3Cep;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218840; x=1816754840;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Hx6hWNtHayyRA0o6yxFxz3AeUIsh0ts/xfWMw6Lw/2w=;
  b=W/Qw3CepwW5wf7ltYCYqsJUw0W3bfC8q++XKFa1TNjgr8CObLDW8HpgT
   lknZh0Fmi4+WZPoz4cV1R61wVtHBuCAjeQlqht1ze7dFA7em0yJyJdWYN
   mATTC6359HehFsqNe+jXvOQmM1h8OndEw9PLwvdNSZn/d2FS/OxSyxQGo
   0/9XfqqyxwTqZI2u/cjPALoXUMeGGti+ZXXO2O5OfrmHm4m1IKtTBbof+
   nLusUjCwf/4N5PROAhUuop1YvmdcVmn6GmAdpuB0Akz+jVb96RurwrS1i
   DAJXFMrQ4y9jIug+FZklh47lWYaNho2a2yQc359NhbENihMfz2oQ1jE8N
   w==;
X-CSE-ConnectionGUID: a9rw6nvUSWO6hgT4xBSk+A==
X-CSE-MsgGUID: k9/1FdfHQ/aBm5OjUpdoYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="227717826"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="227717826"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:20 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 56F871002BAA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:20 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 0E35E8D29D1
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:20 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 66F8A10005F0
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:18 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-sh: upgrade 2.3.0 -> 2.4.0
Date: Tue, 28 Jul 2026 14:06:37 +0800
Message-ID: <20260728060645.819-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128493

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sh_2.3.0.bb => python3-sh_2.4.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sh_2.3.0.bb => python3-sh_2.4.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_2.3.0.bb b/meta-python/recipes-devtools/python/python3-sh_2.4.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-sh_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-sh_2.4.0.bb
index 962f9afb6d..a9c60db0f2 100644
--- a/meta-python/recipes-devtools/python/python3-sh_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_2.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/amoffat/sh"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
 
-SRC_URI[sha256sum] = "402af9087bf8a5557562913ca83d715bfa0646cb93865c5d60c5578b07b17871"
+SRC_URI[sha256sum] = "a250aef68509ed93419c9a1d90b0647cd5cbe26107ba94d3717ef5b6d595ffd9"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


