Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A10CAC59E
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.15062.1758015731556293991
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e2TNBqER;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015732; x=1789551732;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0WceYDLCzki36qJLdqNc+k0ZOJYy2VDlgV5p9HQT/SM=;
  b=e2TNBqERYrq15awRrNIaqceezj6qbQn90BzkjKZFGApc2tUm4qweWiFp
   X1Tug8Qi3qGF+sETUpP+JnKwfeiePQHhFXkZhkJaxkjC/eKAvwGIbTwZc
   0y3/5X5YJPQVekbIEOS3Rrie20RlCXfcRRqQBOUTI/2bZAv9wueVYlxfU
   07nvhKE1065TLAth+MV/v+7Vl945L23pcOiSt7+b8bQEMiGq9Y1e4lT66
   xMMHEj+S7rvAE27iziXoMdtC+vmUTgBlnM7Sr2X4urn0/hmDzvACVLsmp
   4ngbmkCYkH2kb39lj6aoJ+xuSKbdprQZ/US/Vcpek5clYHNaKlfSIRtZz
   Q==;
X-CSE-ConnectionGUID: Ir/Z/LopROGVbHkr7iPM3g==
X-CSE-MsgGUID: NBaE9cv+RXqQWs0LaWmVrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="213031806"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="213031806"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:09 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 30C7E1C1C710
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:09 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id DE91FC008AC
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:08 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 4FB5E1801558;
	Tue, 16 Sep 2025 09:42:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DF32E1A0078;
	Tue, 16 Sep 2025 17:42:03 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/42] python3-psycopg: upgrade 3.2.9 -> 3.2.10
Date: Tue, 16 Sep 2025 17:41:36 +0800
Message-ID: <20250916094152.1479-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119450

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-psycopg_3.2.9.bb => python3-psycopg_3.2.10.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.2.9.bb => python3-psycopg_3.2.10.bb} (85%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.9.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.10.bb
similarity index 85%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.2.9.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.2.10.bb
index 9be72bc4fd..d9d2091c38 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.9.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.10.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "2fbb46fcd17bc81f993f28c47f1ebea38d66ae97cc2dbc3cad73b37cefbff700"
+SRC_URI[sha256sum] = "0bce99269d16ed18401683a8569b2c5abd94f72f8364856d56c0389bcd50972a"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


