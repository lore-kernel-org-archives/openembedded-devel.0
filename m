Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED517C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:20 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4898.1783503919932547158
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=acoW0tSI;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503922; x=1815039922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l+W3AoTM5TjvXAd8fWWfo7FgGKKVVwPgR7XzxtbINu0=;
  b=acoW0tSId+1O8oSMweSSTztK7ZuCHoNv3CpwnnRAhIUk/Cicy4M2GKHx
   cSvs0ZOh5cQQE9nCjwTHH1ly7sFu8EHaFoa2pQUZBCU613hUod+Epiake
   wmnBJnX45ZWn3OpDmT7bMWFhpQs/l28MwI9JRucBLcRDabPfkwxTFARkf
   GueUDPeYwQlbqVCWtEgWq/5kgHZfC0dlUrw7QFEy7CmKVAfCL5i+GxUfk
   HF+kMwuOqut9t2EWJ/TWJvH/8KZyKtqm4XIINuCgyfh/eQ7UM7+ByP+6E
   fWs7chgavN8kmq9W25ozruZwKJfxnSL885JvIbkhqgEJQSWrnf8fXvv8D
   w==;
X-CSE-ConnectionGUID: 5NMcSWAoQR2IheehupUEEQ==
X-CSE-MsgGUID: 0aSB1Q6DROmB0dW3XLTrIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="224395638"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="224395638"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:20 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0BE0C33C5
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:18 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B2C4D1C2DF71
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id C88341800C26;
	Wed,  8 Jul 2026 09:45:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/37] ctags: upgrade 6.2.20260628.0 -> 6.2.20260705.0
Date: Wed,  8 Jul 2026 17:44:12 +0800
Message-ID: <20260708094508.2060-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128073

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260628.0.bb => ctags_6.2.20260705.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260628.0.bb => ctags_6.2.20260705.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260628.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260705.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260628.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260705.0.bb
index 16ba447c69..fde3748a33 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260628.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260705.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "a6d973bf0994da42763b02f8b9b99be794e2149d"
+SRCREV = "5437fa6249e95ec55a5f4944dac28f4f6e46c195"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


