Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A876BC87FD2
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 23:29:45 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.49381.1753918176420066226
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 16:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kgr/ZwxA;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753918176; x=1785454176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=df2lXGIHADZ//IRzKy+foo0WPhcCnl1Eec4d64lP484=;
  b=kgr/ZwxAkE9vBLKqTg9u7wxA6YuV8FB2I7YyNUJHTrRu0ws+foll8Dtk
   pH65UZl4uIg58pkjyqBolMrsPIod8HAR95Qmo7qVvVWOcl7BxIUgpgrpf
   6hP7KamPgd5KGgGvmHuOwB6oJBAr9GOXz7bd9xFXt3BqeZulTeAb6duro
   3rPsmco4+kfknth7T4ag9B85w7ntiKEP60p1Zv8i3JH4e5z47pKdkoWRY
   sWGqcdTIPXD1b2kJyV9lt0GOaRYPAwq+6PrSVEhuvOQTB/P4RbYsDULqj
   iMAcERg6elafPORUxuE/WPoOIBcmqpDmom/kzHqB97skyORDo9nKj0wZF
   A==;
X-CSE-ConnectionGUID: DeglPRSkS9SvwrWmb8bM9A==
X-CSE-MsgGUID: eOciDMj9QDKtqupjYqKcCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="186882704"
X-IronPort-AV: E=Sophos;i="6.16,353,1744038000"; 
   d="scan'208";a="186882704"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 08:29:35 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id EA83F1C01683
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:34 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 57B1114003FC
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E56F71A00A0;
	Thu, 31 Jul 2025 07:29:29 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 37/40] rsyslog: upgrade 8.2504.0 -> 8.2506.0
Date: Thu, 31 Jul 2025 07:29:20 +0800
Message-ID: <20250730232923.522-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730232923.522-1-wangmy@fujitsu.com>
References: <20250730232923.522-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118810

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rsyslog/{rsyslog_8.2504.0.bb => rsyslog_8.2506.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2504.0.bb => rsyslog_8.2506.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2504.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2506.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2504.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2506.0.bb
index c4ddb72bcc..4ba41678aa 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2504.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2506.0.bb
@@ -32,7 +32,7 @@ SRC_URI:append:libc-musl = " \
     file://0001-Include-sys-time-h.patch \
     file://disable-omfile-outchannel.patch \
 "
-SRC_URI[sha256sum] = "5092a20ed40987c74cc604ebfcd6c749e47eb9fc34adc1c2637e6553e7f047ab"
+SRC_URI[sha256sum] = "6d6fd0257c95e756765d4d585a833d54dd3a0e5eeb8308b862a81b368a74bb7b"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


