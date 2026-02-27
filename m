Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCAEFD7F66
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:20 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92440.1772187251063572890
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:14:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nZOJ6L/B;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187251; x=1803723251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yb9O6Fzqjotx3dcAyhWAxLMUtIjbMTjIwdazJMBxSpo=;
  b=nZOJ6L/By1AT31lybfVG9afS0dxVRZXTYLYyHLaYaXSl788FUMOXQAoQ
   IvYQLwcb1WGbzshSDrTzxQ9vyBCfv6HxjPVtsIcCln4iH/zN6alB7E2RU
   vk6Ojt9QxoeWuWh4jCmHhOw202Fr54v3JF2Ie5TDyv9giUd6vVzhGkiKu
   LIHL69QAE3yqsRIgyAzeuthlvEUm04YC4d26BZxSAWqc3f1a0fyYLcUxR
   CUGNGnfrUt2Rb+2Fcvgj7hCuC00xboKCpR1irDUHUdSijnQN9jcOJlHaw
   6BHynMYNfhmMpswPeSHELPaBriEkfXgoV+P2YxPz+Npzaq+Nan9UvkNkT
   g==;
X-CSE-ConnectionGUID: Tptq8DGrSX6XRmb/9Eu6xw==
X-CSE-MsgGUID: 7qe+3YgFRKKS4EmqitGMFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="219940699"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="219940699"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.fujitsu.com (Postfix) with ESMTPS id 935F81C1C706
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:09 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4AFCE180ABD4
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6558018005A1;
	Fri, 27 Feb 2026 10:14:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/52] python3-greenlet: upgrade 3.3.1 -> 3.3.2
Date: Fri, 27 Feb 2026 18:12:49 +0800
Message-ID: <20260227101327.1432-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124714

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix a crash on Python 3.10 if there are active greenlets during interpreter shutdown.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-greenlet_3.3.1.bb => python3-greenlet_3.3.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.3.1.bb => python3-greenlet_3.3.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.3.1.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.3.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.3.2.bb
index 1ee90f9f57..21d6d620cb 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.3.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "41848f3230b58c08bb43dee542e74a2a2e34d3c59dc3076cec9151aeeedcae98"
+SRC_URI[sha256sum] = "2eaf067fc6d886931c7962e8c6bede15d2f01965560f3359b27c80bde2d151f2"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


