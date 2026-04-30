Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D52CD13DA
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:52 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17246.1777546240533654019
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NpLlCmgY;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546243; x=1809082243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9GErLQdRTE51GRq1baVj84Vdt6iTAWGfJvlQxtTxrlI=;
  b=NpLlCmgYuid7fyShYEdPSIJXg1QfF3sd60O28nU87gD903Bsg9FxVxuz
   osOo01EKZ+8daqPbJAnnIOkx1mP4EJkY0CJH7lzIOh+VeQl78WXZmYXl8
   bx0VhJ/CLEbHOn+vJrYw3AtKzNZ2k175at8pXUNtzXt9AMI1Gr0yP6wgI
   Z+Zi1mdIxNbIitizMtz7GlURdSnrcaZPPwk80yCf4U00icDDMSzaHrDYk
   G9WBbhT9jkZQX1ac2A1KiWPYqLILwAJg74gfm6pCH/YaSOBdooVMbhTyp
   D+PsapkPPcb6ZUL0Zc1IyY0TVoKfYaFFfLhzMlh58Wu9YLREmaM0vDoeC
   A==;
X-CSE-ConnectionGUID: rY660+bzSdKV/1jtbQ1Q9g==
X-CSE-MsgGUID: e6NNmhN4Rdm760FFs7dzyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="217636977"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="217636977"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:43 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E2A168203D2
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:43 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 98ADA180A311
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 417FE180113F;
	Thu, 30 Apr 2026 10:50:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 47/64] python3-python-multipart: upgrade 0.0.26 -> 0.0.27
Date: Thu, 30 Apr 2026 18:49:06 +0800
Message-ID: <20260430104924.1106-47-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126717

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Pass parse offsets via constructors
- Add multipart header limits

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n-multipart_0.0.26.bb => python3-python-multipart_0.0.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-python-multipart_0.0.26.bb => python3-python-multipart_0.0.27.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.26.bb b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.27.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-python-multipart_0.0.26.bb
rename to meta-python/recipes-devtools/python/python3-python-multipart_0.0.27.bb
index 46046dc050..184f5212a8 100644
--- a/meta-python/recipes-devtools/python/python3-python-multipart_0.0.26.bb
+++ b/meta-python/recipes-devtools/python/python3-python-multipart_0.0.27.bb
@@ -2,7 +2,7 @@ SUMMARY = "A streaming multipart parser for Python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "08fadc45918cd615e26846437f50c5d6d23304da32c341f289a617127b081f17"
+SRC_URI[sha256sum] = "9870a6a8c5a20a5bf4f07c017bd1489006ff8836cff097b6933355ee2b49b602"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


