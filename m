Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03076D6ACC1
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:23 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37580.1766048655433517852
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:04:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ATNHwPNh;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048660; x=1797584660;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lio53BZ89XhdfRirB1OAtzhRJNVB21QTStf2Rs04q30=;
  b=ATNHwPNhUJZJSQ2CSJR75nJdwBFhmRacWrZc7XzjPyZ0w9rBIgNAUzJO
   vU+LLj5bjm3MhDohhdbUzca3+kgCN4vOfGLVjVh90uOlh+7W7nFuHf1me
   5/yG1sUtW/N7c2GveJeRrs1fqFb4cmr8mc1AL7sq/pLQEBxBc4CRzbz8C
   RsaCSfxYr8UpphNKevZIVNk0LOazlEydCZLMkOPTgqDUZ/lC8ESkNVGc5
   GdUdm0FvYLKmexT/aYk9vslk34sD7eKiBY2DolzVSBj7yiSypZpHjL5kt
   5bPjX84eH/d9HbVqIXKFdTu+v9qQO0tlGWUPqkZzpm46cUu6vuZdD0Pki
   w==;
X-CSE-ConnectionGUID: oB9izNtvSpK/rMc6IMqDpQ==
X-CSE-MsgGUID: CE6JY1yZRNC8CzZoO03nlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="223081559"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="223081559"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:04:19 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id CCB8CC00349
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:18 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 84EA1C041DB
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 0E290101E51F;
	Thu, 18 Dec 2025 09:04:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/20] python3-sqlalchemy: upgrade 2.0.44 -> 2.0.45
Date: Thu, 18 Dec 2025 17:03:41 +0800
Message-ID: <20251218090346.735-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122749

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_2.0.44.bb => python3-sqlalchemy_2.0.45.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.44.bb => python3-sqlalchemy_2.0.45.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.44.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.45.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.44.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.45.bb
index 5bbd79a93a..6c6b95ceaa 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.44.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.45.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=061025f14213ac2818ff353223d6eca6"
 
-SRC_URI[sha256sum] = "0ae7454e1ab1d780aee69fd2aae7d6b8670a581d8847f2d1e0f7ddfbf47e5a22"
+SRC_URI[sha256sum] = "1632a4bda8d2d25703fdad6363058d882541bdaaee0e5e3ddfa0cd3229efce88"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


