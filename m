Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E5CCD98F0
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:58:48 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11263.1781686712526515305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 01:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k7AXjdTn;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781686720; x=1813222720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qi5fKVmi8h5qMpdf+NylqGeCQAdrBptA1byfT0y5cjg=;
  b=k7AXjdTnkj3qtEfKodco/k9tWq7fY1XgZ+iSxvLGk7he0NNrDlV2fHm3
   nTY5QUJiewyPnDTPgO3/y89rlXQIEUWxZLbD9WbnRNbyINGrLXYjjHVKs
   prNYjnw2GLwBh1/uKYQocvBm3hgxyf1KPKxbdSv4pvP6EgYwnFj2/xqQx
   ytejraC5ePPMELUpDVDOhG1npONE/MqorATjg9agyfHIG56BOQOIZ37Re
   V94jHTlLx1wrxh3LGqB6EM+hZNSM5ddZZ+w76ZM4sfvmQe2u0zD1x9Ctw
   xq1fWRR2DZeT9t4letQnODGfp1B65D556cUvEqyw4tRsk/xHSzSfTvr/w
   g==;
X-CSE-ConnectionGUID: oNEkjHV+RLSG8L2nw12xkA==
X-CSE-MsgGUID: FwujfWEUQHKBRVnynqphuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="242543067"
X-IronPort-AV: E=Sophos;i="6.24,209,1774278000"; 
   d="scan'208";a="242543067"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:40 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E2AAB2B93
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:38 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 8D9291004153
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 9E3531000A79;
	Wed, 17 Jun 2026 08:58:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/17] python3-sentry-sdk: upgrade 2.61.1 -> 2.62.0
Date: Wed, 17 Jun 2026 16:58:05 +0800
Message-ID: <20260617085807.542-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260617085807.542-1-wangmy@fujitsu.com>
References: <20260617085807.542-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127652

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_2.61.1.bb => python3-sentry-sdk_2.62.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_2.61.1.bb => python3-sentry-sdk_2.62.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.61.1.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.62.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_2.61.1.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_2.62.0.bb
index 967dbb7a24..dffbfcf6c6 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_2.61.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_2.62.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	python3-datetime \
 "
 
-SRC_URI[sha256sum] = "9c6adccb3feefa9ba032c8d295ca477575c2f11896046a2b0ad686c47c4af555"
+SRC_URI[sha256sum] = "3c870b9f50d9fd15b58c817dbde1c7cfaa9fe3f05df0a4c6edd5571cb82f5491"
 
 PYPI_PACKAGE = "sentry_sdk"
 
-- 
2.43.0


