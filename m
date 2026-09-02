Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8E2C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:49 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9734.1788344980399250123
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ap7pIcsX;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344983; x=1819880983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SQmzgsy0y2/3NDJAH8hWpQQTEkaC3GTANBsLfzcJ548=;
  b=Ap7pIcsX0zK4ILaSUkBZJryNV8bmsgAelzWycG16U4QoPJ2ZJRvKWwxm
   Mxr89ZnPav5nv9malJlIo5EMAQLphwFufgmV5USXEsXd49p2DWHGZAWKL
   ttHTt61gkfm2cQXRORykmo+IRpp5c0Mae5mHRA6P2iPvXtgYsP0qT88ha
   uYrnAY/fEOzG0JK+SDB2ZvaJw16mWeG5uDlransRALzpASBEBmtiYZDJ1
   m1H0zuWuo8DzhbmXagUUHwyLfI0ZgdoYq5HnhTRmMsxlqtjQBzfhnitss
   LC3GFhd19j90IYdWp9/+e3+pHzCZja2yOB+pIAPbIVa21yk6aIm4c7QKD
   A==;
X-CSE-ConnectionGUID: OY9UfpfTSMSa+QUwkT73/w==
X-CSE-MsgGUID: u5EyjReVSfW0KiZmWG0yuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="241060695"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="241060695"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:43 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E2FB11C1C725
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:42 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 948111800261
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 8BD722000224;
	Wed,  2 Sep 2026 10:29:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/34] python3-mmh3: upgrade 5.2.1 -> 5.3.0
Date: Wed,  2 Sep 2026 18:28:45 +0800
Message-ID: <20260902102900.1296-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129678

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mmh3_5.2.1.bb => python3-mmh3_5.3.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mmh3_5.2.1.bb => python3-mmh3_5.3.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-mmh3_5.2.1.bb b/meta-python/recipes-devtools/python/python3-mmh3_5.3.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-mmh3_5.2.1.bb
rename to meta-python/recipes-devtools/python/python3-mmh3_5.3.0.bb
index 4d9be9a7b1..c7f3f18ad4 100644
--- a/meta-python/recipes-devtools/python/python3-mmh3_5.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mmh3_5.3.0.bb
@@ -8,6 +8,6 @@ inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
 
-SRC_URI[sha256sum] = "bbea5b775f0ac84945191fb83f845a6fd9a21a03ea7f2e187defac7e401616ad"
+SRC_URI[sha256sum] = "95832419b87b882bec9dcd7d041d74887ba7745b3659c14be1ae1db5cfa35cad"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


