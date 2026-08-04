Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9156BC55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:19:25 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10170.1785820761686629372
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SgKvUH9+;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820765; x=1817356765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IqEiWf6MRYIy5c5ibOQTw4nV4f+Rk6eaRPa5JFh6wVY=;
  b=SgKvUH9+hn/aKZ20ez2yLRqjff8BeGmBkymyRSz8hMi+Lcq23FaGksx+
   yF8WBSzoPvXyeebnmkp6z5J+rqgQqlT8lZDtV/Ao4UcEtr6Ve6NPlAMXY
   d3l9UAqtCyr4JDwHuVImsRpdVQSzLlJDUFyh+LLy38JN1LmWJ8sdyYDZo
   fVtBqW3Di9Oi9TmWaQ2a6TxXPcIkYQALk1BxUyhxkMckF9w+gHcmfqkl/
   PP7e4xw4KA7QnE3rLsazcrX/v4nzRBhqtpJpnBG1yGn6iBuJUza2cbhfm
   Ul2xZILIjYe+21x1XTmzVUQSGsm4FwpwsoI4WddQWxW1u5zujCuoWionX
   w==;
X-CSE-ConnectionGUID: yFj5c+22TCSIwJiub1BHGQ==
X-CSE-MsgGUID: YuCjrNK1ROuSVdA4KnR/fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="253203259"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="253203259"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:19:23 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1967F1C000A7
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:20 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C3CBD1800EA3
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:19:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id E40861800131;
	Tue,  4 Aug 2026 05:19:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/28] python3-ipython: upgrade 9.15.0 -> 9.16.0
Date: Tue,  4 Aug 2026 13:17:17 +0800
Message-ID: <20260804051726.1489-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128724

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: remove trailing whitespace

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.15.0.bb => python3-ipython_9.16.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.15.0.bb => python3-ipython_9.16.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.15.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.16.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-ipython_9.15.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.16.0.bb
index 589f0a584f..b4bc03d47b 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.16.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "IPython: Productive Interactive Computing"
 HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
+LIC_FILES_CHKSUM = "file://COPYING.rst;md5=954609b5a3603364bc25989a92e38d67"
 
-SRC_URI[sha256sum] = "da2819ce2aa83135257df830660b1176d986c3d2876db24df01974fa955b2756"
+SRC_URI[sha256sum] = "d2f92587b1ef51d84f934dffe05fabb9255f0038ed0a21426f2ea761e39ad09a"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


