Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7E0EA797A
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:15:37 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14220.1770268535527828073
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:15:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=d2gky7f8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268535; x=1801804535;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6En4CPUJOPIrGGBFdpFBvYZn3kE6f4OKxI3KjyDyb0I=;
  b=d2gky7f8iW7ATJXo2FfzvQ72zR9SGIy3vm/VAwAbvPvdC8kbf43S1YWw
   hig/tdsBULkSC8mDUDsn7rRBCRAnoAlHzNnmvav0eao54vz4pdpmSJJOP
   8NdHFUxmbEOn+aS5GIlrZjmFlD+0NE9cig6Up7Yj8LLJearV/k5AH9Rwz
   0304jetrR9OeX9/JqL2A+NZbiE79lfq7vue0//9A4Xjas47Qw/kFoti5I
   fYULl8EwVnv1ugcvSkKAIXZWj+nSVmRq+tRNYN9my8OxI6tolKl/vF6+q
   SalSkyAVNOrS8SV+GHheZrqBb2ENxV/ALd/kS5S7/m/3Lqzu7C98mmsmr
   g==;
X-CSE-ConnectionGUID: OWJCm/TIRVWQGio/BMkQzA==
X-CSE-MsgGUID: I3VdU7YWR4uLpPUfI9nYIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="229250022"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="229250022"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:15:34 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id 1E8BF1000373
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:34 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B858B8D72C1
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 2297920000C5;
	Thu,  5 Feb 2026 05:15:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/24] python3-alembic: upgrade 1.18.1 -> 1.18.3
Date: Thu,  5 Feb 2026 13:14:25 +0800
Message-ID: <20260205051435.1366-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124167

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.18.1.bb => python3-alembic_1.18.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.18.1.bb => python3-alembic_1.18.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.18.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.18.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-alembic_1.18.1.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.18.3.bb
index b9bc454bdb..b6ea160949 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.18.1.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.18.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ff111c41e8748bbfa45e8ba92347b681"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "83ac6b81359596816fb3b893099841a0862f2117b2963258e965d70dc62fb866"
+SRC_URI[sha256sum] = "1212aa3778626f2b0f0aa6dd4e99a5f99b94bd25a0c1ac0bba3be65e081e50b0"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.43.0


