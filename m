Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A638105A57B
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 11:00:09 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18634.1773313203267558116
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 04:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TF4fKslr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773313203; x=1804849203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xuFrYsJ7QpnRBmMR2neEzU8lkgJXXcAWeV/fU0UwMwA=;
  b=TF4fKslrZA0XKiwyh/UIL+9B9LoFesmvbep2C+e8Hxs7k1F4x068N5vC
   0QLYnz1/OV6N50bBe2wLUiLe4TRp484amQhaMGQZP41qbFRRhYTsHuEtj
   cyQKSLYVQzCtf+VBwppPJ7ebYo2yjZ4c1vWB0pTmXBZxUTZnx13yOiqGb
   O3A9zzkIXGysL4+3Rbug6MGUEe8fQswWyMRg0SjRXhQ7rV2DN2x/SBefC
   8jwV31oel+2NR4eKQzT4ekGXWBG2hjr9IQWv1iOe8uEIojRwSS8Y8715l
   RMBSpw4viKjKJJ5HY+SzWzBbJwOMDxKD5+hTPd7OW60vjUzZQMChNYx26
   Q==;
X-CSE-ConnectionGUID: CNnb7Ds9Ro29AOZqyEa1BA==
X-CSE-MsgGUID: IR/3agOnREy8Y1J68rCU+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="233688465"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="233688465"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 20:00:01 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id CCFF682070C
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:01 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 8085186125C
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 960A48288EC;
	Thu, 12 Mar 2026 10:59:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 58/64] python3-wheezy-template: upgrade 3.2.4 -> 3.2.5
Date: Thu, 12 Mar 2026 18:59:34 +0800
Message-ID: <20260312105940.1900-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105940.1900-1-wangmy@fujitsu.com>
References: <20260312105940.1900-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125158

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Added wheezy.html 3.2.1 as a development dependency.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...heezy-template_3.2.4.bb => python3-wheezy-template_3.2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wheezy-template_3.2.4.bb => python3-wheezy-template_3.2.5.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.4.bb b/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.5.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-wheezy-template_3.2.4.bb
rename to meta-python/recipes-devtools/python/python3-wheezy-template_3.2.5.bb
index 9386b0ca2f..a2125a0a0c 100644
--- a/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-wheezy-template_3.2.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fa10554c46b94944529c6a886cf85631"
 PYPI_PACKAGE = "wheezy_template"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "465b9ac52e1c38bc9fc30127ae90bd232ce8df07fc2ac53383cb784f238b144f"
+SRC_URI[sha256sum] = "c7c0bf85af0f70ca2ef4b6ea9a74ef372f73392aa17bea0d885dcba7356d0867"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


