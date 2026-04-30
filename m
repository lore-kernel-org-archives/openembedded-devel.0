Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B076CD13DE
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:51:03 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17468.1777546255145746602
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Sk9vjjRJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546255; x=1809082255;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xLptGg50pZeIfArvaJZVgKMjI5U8u5TWDkFgYqLX0F8=;
  b=Sk9vjjRJuQWmnosLbaliYmcFZglQFvkE5G/Eslk7jFG9juv1T0fqaYl/
   gFg93FeETT6nNL8LgxhkYPhIUhurPwaqsRJVo+LF1JNxw9p3Y3VukDs5+
   70fDRdrCSXWvGg/vhSTn1RHLFRciPcQsDbxP4EQR3PWe0MgnyYZQsGJF2
   TxjrePYExOBdPOveKhbCsmxDdztJyXlIDVtU5DIexAMuDFRIrcBDNwZu5
   uHCwizELH8Iu835M/3J2tO811+Q0SuQAl5Gy/a+BVw9lD/HgWw1m/0J7F
   QDq7+j+HeqkRyRncPQZLa6+afDUDsGNsdKVsNVYQfCRhGHn8sUeTtFBiP
   Q==;
X-CSE-ConnectionGUID: g04V8/DbSYOh7zrUmR5buQ==
X-CSE-MsgGUID: 4+YZbs7RQ6+k7eCh6nIdbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238552750"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238552750"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:53 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 98C60C00091
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:53 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5366A8D65E9
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id E8C9E1801137;
	Thu, 30 Apr 2026 10:50:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 53/64] python3-virtualenv: upgrade 21.2.1 -> 21.3.0
Date: Thu, 30 Apr 2026 18:49:12 +0800
Message-ID: <20260430104924.1106-53-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126723

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-virtualenv_21.2.1.bb => python3-virtualenv_21.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_21.2.1.bb => python3-virtualenv_21.3.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.3.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_21.3.0.bb
index 3ff03e43c7..492d1ff731 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.3.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "b66ffe81301766c0d5e2208fc3576652c59d44e7b731fc5f5ed701c9b537fa78"
+SRC_URI[sha256sum] = "733750db978ec95c2d8eb4feadaa57091002bce404cb39ba69899cf7bd28944e"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


