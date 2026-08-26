Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B85C61DC4
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:09:54 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7654.1787731789170734525
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NN+tuCIu;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731789; x=1819267789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UMKJgVOk335boEg3NsJUYpOM0dPje25LzL2EsKB2Fl4=;
  b=NN+tuCIuu9ausiO16pikz1fPiuAFfqIfEmZgKFDjwOjMVrmDmqQilu+Q
   fWjhXdyx8PFmVgtTC7FH91T6r+Xz9w3DnQca/hBWy+iBjO+U4PNmlmc36
   dZdKaSmcfB9Z1NCICea3L0IpV85bOzm/v6Y2hZpBfnOMBLM9M14VScRJe
   XHo4rF3ZDLjDoeWCBsqbcZUPGoz6VX/618Zef2zlPkMBSEyRaImXmyAMV
   gAopkqi5PzCxYKLIqh5SIJVNVwdKEASQO4gbQqGWG7lsufeq0Sb2vuCjI
   aIk6A8gP5CPJWTHMh42HqKyxMRsM8L6PCMB5z4DtSRd6/3L7KLriavA2u
   w==;
X-CSE-ConnectionGUID: yjnso6dUSVCHGskmggDLcA==
X-CSE-MsgGUID: SZJFPf/fQ6y83geRR0sNXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="252630963"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="252630963"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:09:47 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7D08B10000CE
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:47 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 33FEF1C002F0
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4048314000B3;
	Wed, 26 Aug 2026 08:09:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/23] python3-cmd2: upgrade 4.2.0 -> 4.2.1
Date: Wed, 26 Aug 2026 16:09:13 +0800
Message-ID: <20260826080926.989-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129502

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmd2_4.2.0.bb => python3-cmd2_4.2.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_4.2.0.bb => python3-cmd2_4.2.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_4.2.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_4.2.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cmd2_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_4.2.1.bb
index 4ee14823d8..c7be4e8f06 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_4.2.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f2a861642858e0858af9dd4e4716bae0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "0546543c1ba3c6090ecec33f1373c59627e417b14419629a48176115946fd329"
+SRC_URI[sha256sum] = "89021603a18ceb41600d2f02b40c5df4d37e411027308e9a58714be1f3a56b6b"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.43.0


