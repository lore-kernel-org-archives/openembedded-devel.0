Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2EBC44511
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:32 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3450.1784112027949029322
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RJ2Bhzn2;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112028; x=1815648028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZLYHq1H5+nqBLZCDPxUk/kFFQsi75/Dr4MCyf6JFRTg=;
  b=RJ2Bhzn2JWgJopTUQiIAV+n1UBRDB7OQ6EhR+YEDZlIOEQBJe7bZoWe/
   5WstxBdVYZEAg+QR9hi7O3hRSEVclGiyFYtPFquwR0h+l7f0uzrz5gi2x
   qPcRM0CR2Ymlzbb/jvA0Dw+5iMBTJ7aWYyDvKkbGhVds54ZU2+9urvd+b
   wpdZdoMXsqPNV+T5JSkw4+Jjb00xNT86IBFE72rsQa7AwgKGITRykHg8j
   0A2XZXEIhHHVQkWoA55pTr6MvkA6LR8GmPMrigEp481HFJJDhoeLi9Hft
   H6iabwxrtMeFtnSo8WtL/zMRUhxisJMCZLvYBJ7ihxCKftW09AvjJouxO
   A==;
X-CSE-ConnectionGUID: VgU+YuxjRbGzHEOsyC68VQ==
X-CSE-MsgGUID: pt6CinhAThind1Fc1KgSxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="234938106"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="234938106"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:26 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 657D2551D
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:26 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 14738C026D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 1E4371801122;
	Wed, 15 Jul 2026 10:40:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/44] python3-virtualenv: upgrade 21.5.1 -> 21.6.1
Date: Wed, 15 Jul 2026 18:39:02 +0800
Message-ID: <20260715103914.2120-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128205

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-virtualenv_21.5.1.bb => python3-virtualenv_21.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_21.5.1.bb => python3-virtualenv_21.6.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.5.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.6.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_21.5.1.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_21.6.1.bb
index b8662ea7dd..d6db6a8692 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.6.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "dca3bf98275a59c652b69d68e73433e597d977c2da9198882479d1a7188009c8"
+SRC_URI[sha256sum] = "15f978b7cd329f24855ff4a0c4b4899cc7678589f49adbdcbbb4d3232e641128"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


