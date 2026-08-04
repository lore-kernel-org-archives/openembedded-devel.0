Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA0AC55843
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:18:15 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10156.1785820687137646063
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dcjetIA3;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820687; x=1817356687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fYIX5JeGO6Qajp96/DOO2iTWLDEDDALBQ/lN3/dcUSY=;
  b=dcjetIA3F75h7JkPlJ6MLNWwd8mQ7Yt9UQm2Eo6QH5pUsRiE+CjhbIFM
   oCiF0qz8b22GdD4aFUlqpBbAKS+26IXZEnnACAEluTp3P+p5KKAbQ22jH
   df3q/wDcQQdydEpku81jS+w3kKPCTmwFQ5TSKbrEmX6zvlz1UYuk9v+8L
   HgT7Kvy0xECgsecQWZKGGdUCOCqcGRSlDhTMdeCSy57SebKgfTkYkfCEu
   ehqskB3ztDbT6sZ5ggADQ6yUrodUD8sAdNRFZdTN+1BpocjTkPdZP2p4o
   kuZK1H9LLwZwlg+NS6nD3gHNX3Qd3e43OqzyNXVm0ZzQJONQx9xYfLjoP
   w==;
X-CSE-ConnectionGUID: U/ztQYeTTsKIp8unAD9IQw==
X-CSE-MsgGUID: iypPlOkhQauosEnZKv/Ufw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="237066308"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="237066308"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:18:05 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7E1F51000368
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:05 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 347AC1C2852A
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4B4481800592;
	Tue,  4 Aug 2026 05:18:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/28] python3-bitarray: upgrade 3.9.2 -> 3.10.0
Date: Tue,  4 Aug 2026 13:17:07 +0800
Message-ID: <20260804051726.1489-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128714

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.9.2.bb => python3-bitarray_3.10.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.9.2.bb => python3-bitarray_3.10.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.9.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.10.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.9.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.10.0.bb
index 9372c56e6e..d61b280298 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.10.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "37342f81c8f8e10ee5d1e23d5eda2e8dbd9d8d3a9d90e8285181fad57f21cdc1"
+SRC_URI[sha256sum] = "d8f8dbcda062ea59b3a6d5233b5a9b67f6bf58c1418ad8f418c5138361f9f068"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.43.0


