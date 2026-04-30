Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D3BCD13DA
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:42 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17455.1777546230830066069
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UlP31nxw;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546231; x=1809082231;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=teCOx24KuxQriWpRg+kBKOl5b39O4lMGxqFzDJgYJJc=;
  b=UlP31nxwVnmiWPU4kiZrXaEAbXq2ikTR9LMk35bp0JF70o4ONws9JcLk
   hLyshJARZfAOQX0i14sk0jQJK8SqO6q4p/O+mzXcu1+jDGmakh5dREfBO
   fvKD0uzmpndfAZBfFNhC2+8Toxc6jgwGzgQGLqvVxUkaYB7PYrSYQM2KO
   u4lbEGqRu1evTM0noDZIIZp0LRm35XDSICz9Q1k6gAdh9N9Ld0mPYP/He
   91fkLNlbJLaC7hiT9T/Jw/khORnjAKCsAWCu10N34i3iq6KeoHE7s4eSF
   RkQl8jN6qggdoOi2GXE2v5pSwk3FDqBiah1ujcu1sT4xW0+QSqY8Y9aoE
   w==;
X-CSE-ConnectionGUID: qfy2IYwERcW/Kxp9rhTxKw==
X-CSE-MsgGUID: MclvGkpRSya5L/0sKkrhTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238077232"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238077232"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:29 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 61ED8C01812
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:29 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1C03792674A
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id AFB181801137;
	Thu, 30 Apr 2026 10:50:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/64] python3-identify: upgrade 2.6.18 -> 2.6.19
Date: Thu, 30 Apr 2026 18:48:57 +0800
Message-ID: <20260430104924.1106-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126708

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-identify_2.6.18.bb => python3-identify_2.6.19.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-identify_2.6.18.bb => python3-identify_2.6.19.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-identify_2.6.18.bb b/meta-python/recipes-devtools/python/python3-identify_2.6.19.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-identify_2.6.18.bb
rename to meta-python/recipes-devtools/python/python3-identify_2.6.19.bb
index 7418b43150..9b8d49c61d 100644
--- a/meta-python/recipes-devtools/python/python3-identify_2.6.18.bb
+++ b/meta-python/recipes-devtools/python/python3-identify_2.6.19.bb
@@ -6,7 +6,7 @@ PYPI_PACKAGE = "identify"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "873ac56a5e3fd63e7438a7ecbc4d91aca692eb3fefa4534db2b7913f3fc352fd"
+SRC_URI[sha256sum] = "6be5020c38fcb07da56c53733538a3081ea5aa70d36a156f83044bfbf9173842"
 
 RDEPENDS:${PN} = " \
 	python3-ukkonen \
-- 
2.43.0


