Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B51C5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:42 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3361.1787132197948940799
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JlCIET0w;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132198; x=1818668198;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tmvi+/DjN+MIHM5XMC8vgPyGGcDactY9ZFNtzmLaVO4=;
  b=JlCIET0w+CviaWmhWn0HjiZKOGIvROB4U9p9Ske/cDEDGL1jt2+XhYV6
   uvFfcIgcbwcxlsNfEao98N3yUZixRuxDoeF7cHMPDgeN3ZVxyH0Eecmra
   SRmVTzDYsyHEFvouRMEwGw0pZGRcfEx6LrjmsgCwyLbicd9JkL9NwsjQ+
   7XDtW/Ah/oIwNRYw+wrLFKJvBp6MjIghod91C+0tCDRrrzwgqrlCBq5wX
   osJW/ikWbgxbq2ooEhrn8CXPMAAOAPwt/XMbDsgFYWoM36wE7n7cj+Loh
   n5hn//XUMLvxStBC95kN9CIRAM9Eynq7xyOjhvp1/Bxs4x57zOshqcvbS
   g==;
X-CSE-ConnectionGUID: YRgxmu19SXCCR2Jf3+6FGQ==
X-CSE-MsgGUID: NoYnTJmYQn+1BxaMzWkJaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251882287"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251882287"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:36 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4E7B41C000EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:36 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 028DA1800BC2
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id E27721801C0A;
	Wed, 19 Aug 2026 09:36:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/70] python3-nanobind: upgrade 2.13.0 -> 2.15.0
Date: Wed, 19 Aug 2026 17:34:47 +0800
Message-ID: <20260819093514.1101-43-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129313

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-nanobind_2.13.0.bb => python3-nanobind_2.15.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nanobind_2.13.0.bb => python3-nanobind_2.15.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-nanobind_2.13.0.bb b/meta-python/recipes-devtools/python/python3-nanobind_2.15.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-nanobind_2.13.0.bb
rename to meta-python/recipes-devtools/python/python3-nanobind_2.15.0.bb
index f903641e93..9623214657 100644
--- a/meta-python/recipes-devtools/python/python3-nanobind_2.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nanobind_2.15.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/wjakob/nanobind"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7646f9ee25e49eaf53f89a10665c568c"
 
-SRC_URI[sha256sum] = "c7b04d6a6a4cd57985571e605539399b51331ae455d7fce576a5e2fcb89b1dcf"
+SRC_URI[sha256sum] = "3eace37a3b8cdadd531fcc6145263985b29821467161d34ff722b0644cf445b5"
 
 inherit pypi cmake python_setuptools_build_meta
 
-- 
2.43.0


