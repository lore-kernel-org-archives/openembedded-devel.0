Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A99CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:23:09 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.4825.1761099780454634910
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LTZSEtIA;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099780; x=1792635780;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iffsWaiGPTP2bjNV32tTSepq2Ra9F3ycxA5qHf9L5tI=;
  b=LTZSEtIAaWWn/PjkiYxmIRCfdhHrL1pW8gJDsol+86sDfZ1od5hx8J9v
   QFsVJeUU0mGDmRYOKeP1Ew4yQ+K67RGzbIZZ+KAIwBeyedcAfcXsgwnYS
   555N+EG4+z7jdqI/O5a64DGLVgaPy41XhKl+dRh6//83PYea4yVVj/TyM
   RDZPXKFOvVllXuXP3deI6PoYH6Z9tgne7Waf67mIT+Cty2hJBB6VjYZfK
   wU+JeD+4KvHsca/aOh2Ao84HDcRGlRH2I0YadAbKc70LTqSalGbY3VZpp
   ptbmXBYl/tNzOQOAqiplkYo+it75F0AVKoP3V6YYR8LzZkZ8rB0McljZa
   Q==;
X-CSE-ConnectionGUID: 6D0P1G02SF2VYwOMH85JMQ==
X-CSE-MsgGUID: rldljfISTfCJxgrvTsGKHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="204094644"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="204094644"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:22:59 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id BA6512B8F
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:58 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 709301C0015F
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id D3E8582C0E4;
	Wed, 22 Oct 2025 02:22:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/29] python3-charset-normalizer: upgrade 3.4.3 -> 3.4.4
Date: Wed, 22 Oct 2025 10:22:09 +0800
Message-ID: <20251022022227.226-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120860

From: Wang Mingyu <wangmy@fujitsu.com>

Changed
--------
- Bound setuptools to a specific constraint setuptools>=68,<=81.
- Raised upper bound of mypyc for the optional pre-built extension to v1.18.2

Removed
----------
- setuptools-scm as a build dependency.

Misc
-----
- Enforced hashes in dev-requirements.txt and created ci-requirements.txt for security purposes.
- Additional pre-built wheels for riscv64, s390x, and armv7l architectures.
- Restore  multiple.intoto.jsonl in GitHub releases in addition to individual attestation file per wheel.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-normalizer_3.4.3.bb => python3-charset-normalizer_3.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_3.4.3.bb => python3-charset-normalizer_3.4.4.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.3.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.4.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.3.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.4.bb
index c257e1fb2a..38086ca017 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.4.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48178f3fc1374ad7e830412f812bde05"
 
 #SRC_URI += "file://0001-pyproject.toml-Update-mypy-requirement.patch"
 
-SRC_URI[sha256sum] = "6fce4b8500244f6fcb71465d4a4930d132ba9ab8e71a7859e6a5d59851068d14"
+SRC_URI[sha256sum] = "94537985111c35f28720e43603b8e7b43a6ecfb2ce1d3058bbe955b73404e21a"
 
 DEPENDS += "python3-setuptools-scm-native python3-mypy-native"
 
-- 
2.43.0


