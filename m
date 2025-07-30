Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ADA2C87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 23:29:35 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.49271.1753918173587488387
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 16:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WDiDKTF2;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753918174; x=1785454174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vxpKudhi9RxKlzcAlMJCzaCTzqsE1CwZbkvkMMk5ag8=;
  b=WDiDKTF2k+kbwpdWJRmWV8fijCAsk+uuG/LAqKOhdawNGf8OoWP1iik1
   nZH80bxU3FfVRAlnTJ3MeqwfO4PXwO3f/7V7lXy15QhPJQ8s/XHk9+8ZK
   F26ugIeKhxivE8rzIUXMoFIBxWX95AVA9M0/a9tTk2UxxQAKE7HVUNhfQ
   TyltRSBgcjlhaZoXwMbXwEsiyDPfEkBq8n8S49DUGFIDTVHpkle/dsv2B
   rmIweY4d3T7QA4qBaLwch+u2TKKm5pVd7xhdcIZa8Sggfxph8ru0870E6
   F0oxrb67dnGX/Qig86eNC/kd0grz6QT4a8xbh8lxd4DuKat7Leajqf43k
   A==;
X-CSE-ConnectionGUID: juEdOxUgS06jh/V8H5r2iQ==
X-CSE-MsgGUID: evzBovt8R2iw/0xtybO9xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="211236635"
X-IronPort-AV: E=Sophos;i="6.16,353,1744038000"; 
   d="scan'208";a="211236635"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 08:29:32 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id E0F158204CF
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:31 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 508391806304
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0B80F1A008D;
	Thu, 31 Jul 2025 07:29:28 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/40] python3-pyroute2: upgrade 0.9.2 -> 0.9.3
Date: Thu, 31 Jul 2025 07:29:14 +0800
Message-ID: <20250730232923.522-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730232923.522-1-wangmy@fujitsu.com>
References: <20250730232923.522-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118803

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Async generic netlink sockets
- Use pyproject files only

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyroute2_0.9.2.bb => python3-pyroute2_0.9.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.9.2.bb => python3-pyroute2_0.9.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.2.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.9.2.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.9.3.bb
index 0b47b1219d..b0478ecbdf 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dccbff78d7d79ae7e53953d43445c6e6 \
                     file://LICENSE.GPL-2.0-or-later;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache-2.0;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[sha256sum] = "aea3c0e1b46f48295edb29caaba3ceb6415bdcb975cba3f1489ffcc3198e0ce3"
+SRC_URI[sha256sum] = "97253f8a192e92ac29db9c159a50a59195d72f2b8cdcf20c069d59187fa49ad1"
 
 inherit python_setuptools_build_meta pypi ptest-python-pytest
 
-- 
2.43.0


