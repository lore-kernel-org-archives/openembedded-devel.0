Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5BCCCF9E0
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:23:20 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.4837.1761099798259613546
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:23:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ItE4ir4X;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099798; x=1792635798;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wVh3EtnOqHXyMJ7ipFZYImdSvMFWKap9pCbGqJ0ys24=;
  b=ItE4ir4Xsab4aDKxGKF/tjgUVxAWHjNavkrNMYQ9GGJZsyfypqvbmvXx
   +77ehoMVZ1iSuo5h6zWV9AGv1ExiCgpVgHRPwPsDhNnjXcjS8ZnHZ25a+
   T9xIfIpS25/IYT3kR173zJTJMi9+EpNMpDSxY51GjMJYBnOYsja0rHmgh
   ZbbivIi5xAmqNgMVN1+onnJntbXt9dzfZ/9avlCAxaQ47AIFCsE8zm8C+
   sTGR3BYECtbFJ9UJC1por5V3OFqD5IHjqNSD83oHNAZg1R6uKhM36QHul
   mJka7fB7mpvps5DBb7Os8eMLLRqs3nxE3j4RPPVwNrsY3HjS6xlilHjWm
   Q==;
X-CSE-ConnectionGUID: B5Yvd3MuQsaojIYPTYZ14Q==
X-CSE-MsgGUID: 2sgV1aooTaGw5AUcOESdyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="195536342"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="195536342"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:23:16 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id BB39D1C000F0
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:16 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 761FE1C0015F
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id DEB6082C0E9;
	Wed, 22 Oct 2025 02:23:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/29] python3-protobuf: upgrade 6.31.1 -> 6.33.0
Date: Wed, 22 Oct 2025 10:22:18 +0800
Message-ID: <20251022022227.226-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120869

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-protobuf_6.31.1.bb => python3-protobuf_6.33.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_6.31.1.bb => python3-protobuf_6.33.0.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.31.1.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.33.0.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-protobuf_6.31.1.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_6.33.0.bb
index bb801ffb71..633c82f365 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.31.1.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "d8cac4c982f0b957a4dc73a80e2ea24fab08e679c0de9deb835f4a12d69aca9a"
+SRC_URI[sha256sum] = "140303d5c8d2037730c548f8c7b93b20bb1dc301be280c378b82b8894589c954"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 
-- 
2.43.0


