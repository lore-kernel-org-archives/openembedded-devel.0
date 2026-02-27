Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57317FD7F72
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:50 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92739.1772187283483422349
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:14:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K85ujqiy;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187283; x=1803723283;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SocIaozx5TN9BFeozQN8WIn6F7yDe/umsx0zAK6aETg=;
  b=K85ujqiyh2wIh8NuB0PAEYXXT8ZXqMgZvHXnb203lRfNaqwS1C4Bu15Z
   V9pVcCBbjjKC4ypRglVfM2Ywu4pymhrpw+PcEJoXMQtzFQMKdFJwZati0
   GvhOSNMSpz/dcEM9nqQklxZp/+k/HJoKjHbBpVh27UCG1tGP+iKnz0d98
   2ntsXoLXa39XHq3blzOkxQuFfaMU5Xfuk2L2zOupjRayeMw5jHitmlneX
   ugycfm6V2r3ZP3SmtY2TmOjlaJ0a2YupPE+YePiN8STV6hx22pKYOc7Dx
   PvncEtY+lZ88ssZnINA4mnTfQmX0dOmtsUC+b+QWEy1Z++xgVDBVWi5Lg
   A==;
X-CSE-ConnectionGUID: j75GA9C2TvSjZ4rRNW0+Hw==
X-CSE-MsgGUID: 1xLD9y/ZTRS9LmCaojePdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231987934"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231987934"
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1DA401C0009A
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:42 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C2561C026CB
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id E73F518005A1;
	Fri, 27 Feb 2026 10:14:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/52] python3-pylint: upgrade 4.0.4 -> 4.0.5
Date: Fri, 27 Feb 2026 18:12:59 +0800
Message-ID: <20260227101327.1432-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124724

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pylint_4.0.4.bb => python3-pylint_4.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_4.0.4.bb => python3-pylint_4.0.5.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_4.0.4.bb b/meta-python/recipes-devtools/python/python3-pylint_4.0.5.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-pylint_4.0.4.bb
rename to meta-python/recipes-devtools/python/python3-pylint_4.0.5.bb
index adee1d10c1..15d8c14806 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_4.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_4.0.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRCREV = "e16f942166511d6fb4427e503a734152fae0c4fe"
+SRCREV = "88e1ab7545a4af4aea15c305a154c164a95ab842"
 SRC_URI += "git://github.com/pylint-dev/pylint;branch=main;protocol=https;tag=v${PV} \
            file://0001-Adjust-test-expectations-for-ptest.patch \
            file://0002-pyproject.toml-Keep-tool.setuptools.license-files.patch \
-- 
2.43.0


