Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E37CD6E43
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:43 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16808.1779875376918040165
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EXzVsFHk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875378; x=1811411378;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hKeaOmUKXNPE9gisb70cG2ALfl44WU9/eiJdo7c84U0=;
  b=EXzVsFHkMJkUTtW6/TzcGqzmLy6/VnYCbvxL7sesHCnKP+niebEUKMXY
   VbuDWQMdNO+zbKSdBtsg8P8ky+bb1zFFMw9sxrSnpFMrjVPtKNTVyECuV
   zAtZzp/CpnKPNjBvA83r3LrdeHg1oIZg0itaqrDVgpKD1OSRIC2f+v8gv
   d74GehDDsymLIoB8nJaL67qb5Oy+EYIlkBrdvkPhz8bznNam2apjiCzZQ
   IEwJUSyfbW8Tq4s8R0kUIyh4/5D78LbkO6z2MYICMVBkc+jvC88N7hb3p
   WEnarF1kiMis2sR7FF5x7tgO5KZX9rpSJF3pycL0yJDDSkt6xi74YF+xS
   A==;
X-CSE-ConnectionGUID: TXkEgzOyShmfk2+NMQQU7Q==
X-CSE-MsgGUID: WO5J7SUgR5m8VUv1dDqvTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="242050144"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="242050144"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:36 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5B6321002BB9
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:35 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 12C7418591C0
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 113D882A2C9;
	Wed, 27 May 2026 09:49:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 47/56] python3-types-psutil: upgrade 7.2.2.20260508 -> 7.2.2.20260518
Date: Wed, 27 May 2026 17:47:56 +0800
Message-ID: <20260527094805.2039-47-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127254

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Upgrade black to 26.5.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...7.2.2.20260508.bb => python3-types-psutil_7.2.2.20260518.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_7.2.2.20260508.bb => python3-types-psutil_7.2.2.20260518.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260508.bb b/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260518.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260508.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260518.bb
index c36047fe42..ba8051ce5c 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260508.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260518.bb
@@ -8,7 +8,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "8cfd8339f5e898570f80486423e65d87558d89d0181bf723d20ac5e778fe218e"
+SRC_URI[sha256sum] = "9f825f631463a5b4d26f19f63aebc9ec25f01140d655026f3ad8a67841f9b331"
 
 BBCLASSEXTEND = "native"
 
-- 
2.43.0


