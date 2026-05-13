Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E9ECD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:11:38 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.144.1778645492915145626
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OWn581nf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645493; x=1810181493;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PbJKYize1vl9N6sjr4+0ENqbEhhWcZxsKdLKnXotcv8=;
  b=OWn581nfphOwshkn3JgsQBCB2ERwfOi/o4+A4nbN0coJgPonSkeP/7+P
   GPCU+98xe/RhPQ1AmZMJdPbLJZG+kKFaMnWrty3OZwU0fzkAVd6DfCqPY
   qQ+q9vXzH/HtBQwkRvmv/xfikq0hzllK2JQRLz9I8LGr7COjt/t+WLL/u
   J2bkY8SvqN4Hm1r6u9NLhN0pol1z6xoff5B2s1TXlxHkPGg4d1hvUTlIc
   QpuvGwwA6+paHJXeqv7F159wlPeIq2JMUZOFgkZwKSoy9J7YjwN3KY5cr
   d3vnjuTaHVKnJEntiz37Au5EPSPFkV2WlHPMR/QAf1+EuXahsikWnMgjB
   g==;
X-CSE-ConnectionGUID: FlbCdEpyT6ahDVPRtjIxnA==
X-CSE-MsgGUID: d2TZO9PYRRu7ogLNzMgHrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240206827"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240206827"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:11:31 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5ECF0100036D
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:31 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0BF371C002E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:10:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8511C14001ED;
	Wed, 13 May 2026 04:10:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/56] python3-git-pw: upgrade 2.8.0 -> 2.8.1
Date: Wed, 13 May 2026 12:05:24 +0800
Message-ID: <20260513040555.377-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:11:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126917

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-git-pw_2.8.0.bb => python3-git-pw_2.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-git-pw_2.8.0.bb => python3-git-pw_2.8.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-git-pw_2.8.0.bb b/meta-python/recipes-devtools/python/python3-git-pw_2.8.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-git-pw_2.8.0.bb
rename to meta-python/recipes-devtools/python/python3-git-pw_2.8.1.bb
index 4cb8621ad8..5bffae2aef 100644
--- a/meta-python/recipes-devtools/python/python3-git-pw_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-git-pw_2.8.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/getpatchwork/git-pw"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26e1a171d943c64f00c51f90c256b9d4"
 
-SRC_URI[sha256sum] = "212743923badb38b9da658b0df0b9f3770997684a9e787d489eed5d103e96100"
+SRC_URI[sha256sum] = "fed2afca4cb66832a416404ec02140a5311d8ce7658c0fdd92cc022b0cef8266"
 PYPI_PACKAGE = "git_pw"
 
 inherit pypi python_setuptools_build_meta
-- 
2.43.0


