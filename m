Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5BBCD13D2
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:41 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17455.1777546230830066069
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IzBmYo9C;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546235; x=1809082235;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Boz2LZ9cspVw+jFzGw28YgLHGxKQmeTyo26ujkGF1UM=;
  b=IzBmYo9C+W93d2CqCiRwn1CQWgdFK0IyVfOh46rhKCzpRyKHwrfbtGHA
   ekS8xK6c6izsf4rRrEd9QDl88faNyvdzqlnWmH+H8fPFQxdO8UwXV0Z5i
   Rp55NpdtdWNOzRVzie3U+9jwXXJteKYH0lgJM1aFhCAz1bs8sVYVYoMJt
   RxRiUG/4KPT0QdpjZURCzBpuBBAVTm5cw2AP9tpHhyjSVuWqB3yhn8jJX
   y8d1DalXDqH/VJSdLgNs3VXA28NVHhHRB0ZKA3P8/EWWzlj1ymfPnZrJP
   tKDZJSynG65k08v+g5stLUdSDGDftPNzxH0uEskJfvEfkR4ycIBlpbxvk
   g==;
X-CSE-ConnectionGUID: ielM+yNjRT2eFhe28okGzA==
X-CSE-MsgGUID: ICN6vG8STNOKh8rjwyZOkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238077241"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238077241"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:34 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 3B3B11C1C701
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:34 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E76E58D65E9
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 87B6C180113C;
	Thu, 30 Apr 2026 10:50:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/64] python3-moteus: upgrade 0.3.100 -> 0.3.101
Date: Thu, 30 Apr 2026 18:49:00 +0800
Message-ID: <20260430104924.1106-41-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126711

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-moteus_0.3.100.bb => python3-moteus_0.3.101.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.100.bb => python3-moteus_0.3.101.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.100.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.101.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.100.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.101.bb
index fe12809d78..0b7d636cd6 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.100.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.101.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c2d9643b4523fdf462
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "cab1bdcffc18b83ebb52066b1bffe6de7c1354b163b3bd63e430b4fa04fbc6b9"
+SRC_URI[sha256sum] = "a288796f54515a40b02f548d8bcfb47c1e846e6460748d81856798c463b35cf5"
 
 S = "${UNPACKDIR}/moteus-${PV}"
 
-- 
2.43.0


