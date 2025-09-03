Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBFECAC586
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.7935.1756890228719380268
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JxYcZGD7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890235; x=1788426235;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LzKEvBeh92+Pt90jWywYHf8M0eGZSGOavY9JDGlcWuw=;
  b=JxYcZGD7ZQq+EjSsC+UvSzVmRbjo3FHMt2Kbgm2YJ7MEiOoHZpieOCjg
   +gy2WEdCa0vaFYiKvSXMX3rWS1Kmmpvyu+SV6UyQyQ9O9pP9hFHmjjnhN
   /NoRwcfqVQZyPPXcpHtA6jUBjxXZgt/ydJWgwsXLr8olIFdsHGpzjnLia
   Ko1IQ2puqAl1L3hPSBYD5dSxNiqCGHABFAalk+1kJ60MSZrjk0PvqoxaT
   J7BTv/Ic0Lob1JGFMwCrV8R9b0IMr76rvcW+rzQYhmnlA14DBhti3d6bK
   RZsHMxt004dRBPc/G/WnG/mRgudXHH/T4OoyzyD5JXsmJoGJJgNNRCmxE
   A==;
X-CSE-ConnectionGUID: TpiqGf10QNWBzHQ0ZwJUZA==
X-CSE-MsgGUID: RQEA9CjNQYOzgyy6O905QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211455950"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211455950"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:54 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 4A5D6820711
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:53 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id EA3CC8B67AC
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:52 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id B05A61013130
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AFBDA1A007E;
	Wed,  3 Sep 2025 17:03:47 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/56] python3-ipython: upgrade 9.4.0 -> 9.5.0
Date: Wed,  3 Sep 2025 17:02:56 +0800
Message-ID: <20250903090317.2002-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119233

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.4.0.bb => python3-ipython_9.5.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.4.0.bb => python3-ipython_9.5.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.4.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.5.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.4.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.5.0.bb
index a174b969a4..058e83b373 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "c033c6d4e7914c3d9768aabe76bbe87ba1dc66a92a05db6bfa1125d81f2ee270"
+SRC_URI[sha256sum] = "129c44b941fe6d9b82d36fc7a7c18127ddb1d6f02f78f867f402e2e3adde3113"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


