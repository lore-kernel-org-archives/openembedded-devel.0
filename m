Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28ABC44503
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:46:12 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4730.1783503966898586091
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DHtR2+13;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503969; x=1815039969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MOkUYYFAj6prgLBH6zXh9CAeSedTTFgFIVqQU5l5X58=;
  b=DHtR2+131nuvb3oP08XReF9TzHqPBFi6mb1vEaJKu/5UmpLh1xjqcoI/
   LbNb0l8Tcft8qiw47TGweAZ1HEyondv1ZQf2QquYD5tCB/mzmTiQVMJ7l
   Dy1C/edjvymiyN2T/VbfHCM8tA8JFsO5KM6sBVwrywDbZx7YMx7R2Jr1V
   O0otNAZsRCQn159HsM0sx6Wmp9NRKE1hiCpqufg3CVlB8MVTzhpjxLVGC
   5xrcJN7yyb78Ix8VjSB/gwIcUhjJUhg6CPBGHFDPGLVZ2Fn5lz+BsflDd
   6m88R1NXUO1g4VsGGWn7Zo5fVN9BuXgxt6F/PltwMjcdBq3e6w+5eXt/q
   Q==;
X-CSE-ConnectionGUID: lUQOfS9yTH+F7N2KWR4GMA==
X-CSE-MsgGUID: hfE9L+H4TF2Ka9IQ6L714g==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="250142809"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="250142809"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:46:08 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7666C1C000F8
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:46:08 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 24B8D1C2DF66
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:46:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 38D031801133;
	Wed,  8 Jul 2026 09:46:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 34/37] stunnel: upgrade 5.78 -> 5.79
Date: Wed,  8 Jul 2026 17:44:44 +0800
Message-ID: <20260708094508.2060-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128105

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stunnel/{stunnel_5.78.bb => stunnel_5.79.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.78.bb => stunnel_5.79.bb} (92%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.78.bb b/meta-networking/recipes-support/stunnel/stunnel_5.79.bb
similarity index 92%
rename from meta-networking/recipes-support/stunnel/stunnel_5.78.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.79.bb
index 1740ad41f2..3435f8cd3c 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.78.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.79.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "8727e53bb8b7528f850327a2a149158422c02183bc120d1d733cc65b1e2c349d"
+SRC_URI[sha256sum] = "8ea0de6e5ea76f38ea987fa831c7fd47f7a1f1e7dd465fd6fa8622edf30d3a45"
 
 inherit autotools bash-completion pkgconfig
 
-- 
2.43.0


