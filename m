Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FE9CAC595
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:01 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.7944.1756890240259920460
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LXKnNCZ9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890241; x=1788426241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OGKJNRlphgTNwRlpexrYo44lCwXe1NsomFdOL14xPAw=;
  b=LXKnNCZ9fUGvHxv82Amu/YWA+W6KhyaRQx7xkR0zjY7ZsCubtW44v3eH
   2S8c1f9Urz4M3kPFvSNE3Bye5tg+04MVry/BMuGdbdKp6rxIYkrdR7uyJ
   H78IFSb5jzsCTNLPvdoNTU/rH/La8O2GSETDYzZK30k0Dx/jUTReLuJI0
   0P0pOGgTsbHtf9AygNEhd8TtgVNnebBKXGjJ1kGbs3W0Otu4rWqvx8u5h
   vdhEI5eIgj3IswSafF0t0MGd4Y/6Dw3XzhCT0oq7rU1KM0GJVHwUDtHE6
   yzaUxQ3yG69lbhkhvzfx30+aK/js8I6H2T6i5jEpxT6LZMn3rbFQYXDpW
   w==;
X-CSE-ConnectionGUID: miM4b3EeS0e5O2CQcpxHuw==
X-CSE-MsgGUID: jnDsmqFJRF6Uj6q9hPpwcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211549716"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211549716"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:59 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id C3882100034E
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:58 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7B5A41C2C20A
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:58 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 565461003109
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6E4911A0078;
	Wed,  3 Sep 2025 17:03:53 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 50/56] python3-starlette: upgrade 0.47.2 -> 0.47.3
Date: Wed,  3 Sep 2025 17:03:11 +0800
Message-ID: <20250903090317.2002-50-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119249

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-starlette_0.47.2.bb => python3-starlette_0.47.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.47.2.bb => python3-starlette_0.47.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.47.2.bb b/meta-python/recipes-devtools/python/python3-starlette_0.47.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-starlette_0.47.2.bb
rename to meta-python/recipes-devtools/python/python3-starlette_0.47.3.bb
index 98108a5369..f27be4d6d0 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.47.2.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.47.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "6ae9aa5db235e4846decc1e7b79c4f346adf41e9777aebeb49dfd09bbd7023d8"
+SRC_URI[sha256sum] = "6bc94f839cc176c4858894f1f8908f0ab79dfec1a6b8402f6da9be26ebea52e9"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


