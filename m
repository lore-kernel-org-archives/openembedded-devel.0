Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F21FC44503
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:46:02 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4911.1783503954141676684
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LTyfIkDg;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503956; x=1815039956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vCj7ElNKZ1F6XJ5cqHo+l736Qt4/3NPxMdt4/giMlQE=;
  b=LTyfIkDgQJBQeNxgvUpzTLChlAMupt7s9UHaIwvQ8tt5abQF2zYL8/Ex
   Ibn1aX39JnH6ebLJ8a1yqCaxwRdhOvP2rxUXUN11KmPE2ncSgjQjpq8LE
   Pw7X8T4GduLDJVP70wWGKHU1ToKetBHdbPtrRruixGS7flQBhdhjgT7pL
   8JqA7pF95IRysWFBfO5ypa6ijNXwNVWcil/VMFXECw+qKnmkFjy0upiao
   TtwR1myvCZmVGcTRS2A4ZKBGhaSz5NRYvass21CFSIJZvCulgYJpN3nT3
   c8Zwv955fjIZMsVnZxEJStzI4C0XhzxHtH0i8sFiJl3lLQg622eOgFrtP
   g==;
X-CSE-ConnectionGUID: ktk7PnI/RPy+U52Gqss2ig==
X-CSE-MsgGUID: WAmHSHe/RYi6+SN1NPqD1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="224395719"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="224395719"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:54 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9E48A1561
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:52 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 53245102096F
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 727AE1800C26;
	Wed,  8 Jul 2026 09:45:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/37] python3-mlcommons-loadgen: upgrade 6.0.15 -> 6.0.16
Date: Wed,  8 Jul 2026 17:44:34 +0800
Message-ID: <20260708094508.2060-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128095

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ns-loadgen_6.0.15.bb => python3-mlcommons-loadgen_6.0.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-mlcommons-loadgen/{python3-mlcommons-loadgen_6.0.15.bb => python3-mlcommons-loadgen_6.0.16.bb} (91%)

diff --git a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.15.bb b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.16.bb
similarity index 91%
rename from meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.15.bb
rename to meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.16.bb
index 9a9e777658..926f3c4aea 100644
--- a/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.15.bb
+++ b/meta-python/recipes-devtools/python3-mlcommons-loadgen/python3-mlcommons-loadgen_6.0.16.bb
@@ -21,7 +21,7 @@ SRC_URI += " \
 PYPI_PACKAGE = "mlcommons_loadgen"
 UPSTREAM_CHECK_PYPI_PACKAGE = "mlcommons_loadgen"
 
-SRC_URI[sha256sum] = "5b5c5c0545526a767c35a5f295a7680e9380b5a08bcea058422c61bc9f608fb5"
+SRC_URI[sha256sum] = "f9122f0f09168aad38e3c8b130f728a5a28a269990e9ff724b350495a11054fe"
 
 # Because the pyproject.toml contains invalid requirements.
 INSANE_SKIP += "pep517-backend"
-- 
2.43.0


