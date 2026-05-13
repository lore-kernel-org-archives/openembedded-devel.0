Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C6ACD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:11:48 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148.1778645507604880163
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hKGUHHbN;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645507; x=1810181507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Qfr39bq8kTZo51IRVwxsn0smV0Br3260/QJonXo7E9w=;
  b=hKGUHHbNqEmSlbjPcHTmI4GHpE+ZnEojIxKBmbV02kZm3baS4FqqSjF9
   VPFY4T/L6hkn0Fa23QT25a7YbgzzqH/5GZOehwvpBntEN7OxJgfnUuPAu
   GsrJ+b3kJ5B8OHXbodQBvzFqe7LPUidQdtTsl1VVz3B7u6xDXwnY2hCRf
   QAu8dAt78RV1XdmeTxlZISsgPXsBJuf5V54DMxGt4kMOgOrzxwJYGjanc
   HIiPDKROB01CIOeWmJdDC7mj+o2dh0LvkACN69TALidm4FbxkRYYmrfHg
   q9TwXRywXl8C4jkjasq2xwhjk3ysYY6oQyUVPNGZ3hzJOHN/TO35unhZy
   A==;
X-CSE-ConnectionGUID: NiyHnWcgQZ2odtEiRK9L6A==
X-CSE-MsgGUID: nLpjatVJSXK/oh4OtlhCeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="228214366"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="228214366"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:11:46 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0EF6F676E
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:46 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A8ED0C0034F
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1A259140008D;
	Wed, 13 May 2026 04:10:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/56] python3-parse: upgrade 1.21.1 -> 1.22.0
Date: Wed, 13 May 2026 12:05:31 +0800
Message-ID: <20260513040555.377-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126920

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add type hinting

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-parse_1.21.1.bb => python3-parse_1.22.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.21.1.bb => python3-parse_1.22.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.21.1.bb b/meta-python/recipes-devtools/python/python3-parse_1.22.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-parse_1.21.1.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.22.0.bb
index 3af0c0e27e..95bb2017b5 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.22.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
 
-SRC_URI[sha256sum] = "825e1a88e9d9fb481b8d2ca709c6195558b6eaa97c559ad3a9a20aa2d12815a3"
+SRC_URI[sha256sum] = "d4987d68ccf08b6ba3bf80b5004ff7de61c4337cba2d8350ae5c9925794979d9"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.43.0


