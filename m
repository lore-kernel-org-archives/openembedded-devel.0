Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0243D3B7FD
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:50 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4138.1765274209547005548
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pDn9UTN/;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274209; x=1796810209;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B9Hn/SV+FCwlpjNpFBJ1nJKXNeb9xqI2bGun0n5URwQ=;
  b=pDn9UTN/ScE4xXp39d2y3Pn1Sy3t+q/x8x6n0Mdn3+nkPQpkCPQ4w9Rf
   E7K+xXbaN6e/2HHDmRa+2NL7L40l7yO02yA1mswoPu5Ux+e5qDNP/JuEE
   LN3egitxunpZCSUM+865Gp5x7BthfKtiKB0ozDzB31VeHAUMioQHFTwG5
   +VUyvLAES/Ukdaxc0/BQjDWjFnezJzkeU81wXlCxqpxghWYOrXOuQIBGP
   9EM6ONXX2g0CQyMsGZEo2P5a3JxIuzKTeSRlBuvWlv4w1fmobLhmnaYmT
   sfNWTXPrEeY4+w4dyajsNye6DSHsZNHIjUb2jl/N1aSVQvVD9PiINj8Ad
   g==;
X-CSE-ConnectionGUID: 8iEAUXECSZKDE4SYEl+dFQ==
X-CSE-MsgGUID: Vtcs7F4/TOCJYmn7CNnulg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="221381962"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="221381962"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:48 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id E37AF42A31F
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:47 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 88F251C0014D
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 2E76B20002BF;
	Tue,  9 Dec 2025 09:56:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/38] python3-ipython: upgrade 9.7.0 -> 9.8.0
Date: Tue,  9 Dec 2025 17:55:36 +0800
Message-ID: <20251209095552.690-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122426

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.7.0.bb => python3-ipython_9.8.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.7.0.bb => python3-ipython_9.8.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.7.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.8.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.7.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.8.0.bb
index c650a0e61f..322ad36d5d 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "5f6de88c905a566c6a9d6c400a8fed54a638e1f7543d17aae2551133216b1e4e"
+SRC_URI[sha256sum] = "8e4ce129a627eb9dd221c41b1d2cdaed4ef7c9da8c17c63f6f578fe231141f83"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


