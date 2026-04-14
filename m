Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530D7ED7BAF
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:19 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15981.1776163211530201612
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n5pGtQ/T;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163210; x=1807699210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PbE6N1YmmwHSxcNCdeTPGR45Ss4IbW5gzdWkzgYQ3nw=;
  b=n5pGtQ/TX8XSk7ESuNqJPFvZSU2aEj4PfyXWAtMl0fjyZb6xi8s42PCu
   EMOzI0g2BHe6dGVUJkR5umFki/qbzI5htjxtUwlOSq7Z3dqQ41I9xfJNi
   DU5C5uL5JKkS/yq591Q+SxpUyT3ZsYLHg3mxS04GEmdw5SmNLhIufRJAF
   hZD3nzEu/zEQNxUPY93cwTz2CZQWbS1gdke5N9pCMkRiBQXgxDFsVBJrD
   bnD2uGl8bvATojQsKfIn5MHfuo+hqXNOKJy7Mx8hdV1QfoHfHkG0A6AWd
   a9XoF+bPd/gXhQzi1QyCC9PGbDvG/mw6w4p6IXNSbSUHdgUWZm1bJ5le6
   A==;
X-CSE-ConnectionGUID: /rOOqs5iR7+nLYn8vFM8jg==
X-CSE-MsgGUID: UjngKGFpS9qOQABWZ+A64g==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="225583988"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="225583988"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:09 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 15BBAC00213
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:10 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id C4A8614003D0
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3A7AD14000E2;
	Tue, 14 Apr 2026 10:40:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/32] python3-gevent: upgrade 25.9.1 -> 26.4.0
Date: Tue, 14 Apr 2026 18:38:27 +0800
Message-ID: <20260414103845.1728-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126318

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Make gevent.ssl stop reusing exception instances, as this could appear to
  cause a memory leak if there are many short reads or writes.
- Fix Greenlet.dead returning true for an active greenlet during early
  bootstrap.
- Fix some potential GIL-related crashes during interpreter shutdown by
  avoiding acquiring the GIL in libev callbacks when the interpreter is
  finalizing.
- Support for Python 3.9 has been removed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gevent_25.9.1.bb => python3-gevent_26.4.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_25.9.1.bb => python3-gevent_26.4.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_25.9.1.bb b/meta-python/recipes-devtools/python/python3-gevent_26.4.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-gevent_25.9.1.bb
rename to meta-python/recipes-devtools/python/python3-gevent_26.4.0.bb
index 51861f24c7..c29b55d25d 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_25.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_26.4.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} = "python3-greenlet \
 
 SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
 
-SRC_URI[sha256sum] = "adf9cd552de44a4e6754c51ff2e78d9193b7fa6eab123db9578a210e657235dd"
+SRC_URI[sha256sum] = "288d03addfccf0d1c67268358b6759b04392bf3bc35d26f3d9a45c82899c292d"
 
 CVE_PRODUCT = "gevent"
 
-- 
2.43.0


