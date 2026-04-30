Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECE8CD13D2
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:51:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17252.1777546253593599723
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VZQsfwKO;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546253; x=1809082253;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D3d8kS6tExDzKzMvWYRY4gKmuaUnWWfFhCKBFQy+Gb4=;
  b=VZQsfwKOe07apYtWPcN04MEkA1iNqPgg5xFj8Rk5RYQpcQwbNQmYf9Zo
   HPaAMyjD/BnC6/8RPR1/3ZT8Etl7zPE/lrQDzoI7ShV3meugjDdF3tLY9
   +e5Qg+CKnOrk0jFj5lDovXWQmTX1BQLc0tcAQg2U5t9ajDVDFXp8ghLOy
   2sDPgCII4apr/fZqnjyaGHVBvLgrddadgE2MxJ2SGz5qO+H4rrVNvYO9Q
   fps/VAYEkY/WDKAQTmXPQp3svP969MuIqcwDyhH1AJR8yNXJe0qCnzB5G
   3+YQPXXOoD9Z0NBfwEHThbjentinm08BI/EtCmwohZhGjthoBnvpZqfAB
   g==;
X-CSE-ConnectionGUID: sV4LsrpRTQuafps7Acv1OQ==
X-CSE-MsgGUID: kqzRD9iiQIaTyeVutnwi/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="217414109"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="217414109"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:52 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 03ADD8204D6
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:52 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B0E8C92674F
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 518DC1801130;
	Thu, 30 Apr 2026 10:50:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 52/64] python3-tzdata: upgrade 2026.1 -> 2026.2
Date: Thu, 30 Apr 2026 18:49:11 +0800
Message-ID: <20260430104924.1106-52-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126722

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tzdata_2026.1.bb => python3-tzdata_2026.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2026.1.bb => python3-tzdata_2026.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2026.1.bb b/meta-python/recipes-devtools/python/python3-tzdata_2026.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-tzdata_2026.1.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2026.2.bb
index 9a66460e76..0a94aa59ff 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2026.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2026.2.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fca9fd5c15a28eb874ba38577a585d48 \
                     file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "67658a1903c75917309e753fdc349ac0efd8c27db7a0cb406a25be4840f87f98"
+SRC_URI[sha256sum] = "9173fde7d80d9018e02a662e168e5a2d04f87c41ea174b139fbef642eda62d10"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


