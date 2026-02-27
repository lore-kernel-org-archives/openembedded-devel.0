Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAC2FD7F70
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:40 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92736.1772187274569707151
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:14:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ga6Hp30M;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187275; x=1803723275;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EBH243qt+RfYUeV5JThDYcXq3ay1Yk5bowMgV8SJCDE=;
  b=ga6Hp30Mi0DQjVt2UumBJ9dhf94l4xzWU5CQ1mbr/VD0TSJZDMyoVLJG
   XfjpFTOT9TUk6FiPGp1xx7k7jNczJ9Aj0hCdcXRZF93LQRmI3u1qDF+3H
   y6aOQgtcicPdor+tJRvnvbt4NrZZLyb1RF+8CzH/NVW6Nmns+qhdb5jUz
   njESst6b39cHPMkrspoBu8vA3rNOBUJqrEz3Z6v4WiWLtlQvPKOfPyX9H
   qNMCXuXYtKJcTcLPGh/n2rDKv3UDQuZFYQ6k5DswFicGI2YFYD0/pLVBV
   lqvpe+I/79U+fGG4ylgxfaRkh+ONRhM6nPCI871b2Htn9ZOJebcDxpuJ7
   A==;
X-CSE-ConnectionGUID: xBRis1KESXKjDqJ97Iq+3g==
X-CSE-MsgGUID: XdVV6V7cSHOkis7+Lha5yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="235523433"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="235523433"
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.fujitsu.com (Postfix) with ESMTPS id 20EC2C000BF
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:33 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id CBD7A926749
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id E238C180059F;
	Fri, 27 Feb 2026 10:14:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/52] python3-parse: upgrade 1.20.2 -> 1.21.1
Date: Fri, 27 Feb 2026 18:12:56 +0800
Message-ID: <20260227101327.1432-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124721

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix microsecond precision loss in timestamp parsing
- allow triggering CI manually
- Actually raise exception
- readme: Clarify 'd' type
- Bump actions/checkout from 5 to 6 in the actions-infrastructure group
- Allow grouping char (,_) in decimal format string

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-parse_1.20.2.bb => python3-parse_1.21.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.20.2.bb => python3-parse_1.21.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.20.2.bb b/meta-python/recipes-devtools/python/python3-parse_1.21.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-parse_1.20.2.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.21.1.bb
index 6e7139bfbe..3af0c0e27e 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.20.2.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.21.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
 
-SRC_URI[sha256sum] = "b41d604d16503c79d81af5165155c0b20f6c8d6c559efa66b4b695c3e5a0a0ce"
+SRC_URI[sha256sum] = "825e1a88e9d9fb481b8d2ca709c6195558b6eaa97c559ad3a9a20aa2d12815a3"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.43.0


