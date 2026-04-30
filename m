Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40521CD13DF
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:42 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17463.1777546233991367359
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pN4kBzyz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546234; x=1809082234;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1IoWtUJQ7EpsjvLaxNntoioA1jvbefchUdBcxiCf/L8=;
  b=pN4kBzyzA9mCJlF4bve6Ao5i8FZ5nsYV1l3hBK5BpX/U+XVjcVTS/6z4
   5XzoYfBMueAnpUEY8ms6gHVSmiFTCyG5nUV/UrtDSWZqmG8pWEMO9Bxcm
   6HQltkSKHB4qM7ur4Y0f80zM8t6aiImpPoJd+0nJtBz4BsQlDZjIATtun
   FQEPFZ5XJt+Oe+X3oQJ+kf8MspvXGSl/sJQSs9Evgaym6RxcRz6XdZXmh
   39OUBe1aiC4l63ARBWkac6z8r3l/afu+cJtPhPuk3JMRSRoZETExlmNIy
   5wE13kYs7FcyihMSENOllToaIMEy77aR/OP0fROVTRZFVB7KwQoCUebQc
   Q==;
X-CSE-ConnectionGUID: KPj5KMBES6e979qwEzT0Tw==
X-CSE-MsgGUID: WVg5TA2oSWC2xfNSR9pucg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="243116247"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="243116247"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:32 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8D329C01827
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:32 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 477BEC0080A
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id DE203180113F;
	Thu, 30 Apr 2026 10:50:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/64] python3-ipython: upgrade 9.12.0 -> 9.13.0
Date: Thu, 30 Apr 2026 18:48:59 +0800
Message-ID: <20260430104924.1106-40-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126710

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_9.12.0.bb => python3-ipython_9.13.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_9.12.0.bb => python3-ipython_9.13.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_9.12.0.bb b/meta-python/recipes-devtools/python/python3-ipython_9.13.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_9.12.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_9.13.0.bb
index 1dcac8b51c..c563b110e1 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_9.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_9.13.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "01daa83f504b693ba523b5a407246cabde4eb4513285a3c6acaff11a66735ee4"
+SRC_URI[sha256sum] = "7e834b6afc99f020e3f05966ced34792f40267d64cb1ea9043886dab0dde5967"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


