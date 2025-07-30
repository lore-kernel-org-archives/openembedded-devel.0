Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6BC4C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:19 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.31493.1753869308081090093
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=by1ycxrl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869311; x=1785405311;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jKr2i57HD+OSqEqWHVnEFu4TqXZVj7AKQf9avJtkycA=;
  b=by1ycxrly/UsfdPvaPrnme4JiVO2PWjIIx/UA4A1CHTWldSrB86kGorO
   hpBL/FH2NoqT4Xjb57dGaOsj7ZYdK6hLRthcTOLA2vM0hIAMIsXQHbQv8
   DObNI+rcpeX6Em8uu3VorgYRCg3wQ+FtzvL+OzY/cpAfcL1lnrYdqeqts
   EnHVR3saiFEarm4RUONi7fnM0YpUekd5Dn1ryhhNwrmL1MHfScUzupqay
   /ZqursQyZtqWbbqPyLuMcnZKXvMVGJFjM9baXGRmhlIJqHwGOpydEdjPP
   riOPSzfiCszuYFmtpIFMJco5vQc44/pilYTE7CbRxZXp8xQw1BuFMO1bw
   A==;
X-CSE-ConnectionGUID: N+zGy2jwQjKLY99UI9IiDg==
X-CSE-MsgGUID: /pB18Fc4RmmRZ2q9sKrbeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="207849426"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="207849426"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:11 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 1A50DC000BE
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:11 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 84D208319F1
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9719F1A0073;
	Wed, 30 Jul 2025 17:55:07 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/40] python3-grpcio-reflection: upgrade 1.73.1 -> 1.74.0
Date: Wed, 30 Jul 2025 17:54:42 +0800
Message-ID: <20250730095456.695-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118791

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...reflection_1.73.1.bb => python3-grpcio-reflection_1.74.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-reflection_1.73.1.bb => python3-grpcio-reflection_1.74.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.73.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.74.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-reflection_1.73.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-reflection_1.74.0.bb
index dfce718a41..914abbf589 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.73.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.74.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_reflection"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "2d6a420264e31e83e81114dd2586b5cd05a6c689b01dd5e2121d91f2b4e167f2"
+SRC_URI[sha256sum] = "c7327d2520dcdac209872ebf57774c3239646dad882e4abb4ad7bebccaca2c83"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


