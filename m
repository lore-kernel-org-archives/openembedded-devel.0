Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41793FD7F6E
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:40 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92446.1772187277986595366
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:14:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fYYfLI6E;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187277; x=1803723277;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=46DJAxuWok2YFeWnxZBnjutl+F3XdtAkGNjj4HBJ3GM=;
  b=fYYfLI6E+1qOiqIooN0wAqC/fNn/G3y1/Jl8cculwJ0R3RkcmtIrUYSd
   vJQm7R5eE+UgdWcTMXRYLynUPjOWeOgTnqUpdeC19CXvXY2c9c5Qi3oFW
   jZCnf/7UFfxAgiLYZcJvO2i3RWhKx3EJK7EMR1A16lWF9fR19QuEw7GMv
   0jhsTi6ura41w0Y8NnxYuoGH+ubYAr1Jk9ahtVSHrihxOFy3YGA83vHlj
   wR9k8Bheaymg+SC8/9zhQBTJdcXM+3Mz8JIt+K5Hm1xXqeMvqDpNbK3O5
   /9vn8m2nhyiagxxVVnLD9ASqJZauBmu836uHdoLTwZkQxntrGdk6Ghe4h
   w==;
X-CSE-ConnectionGUID: hbg7yk8kQGKqeH6QsIyEDw==
X-CSE-MsgGUID: RTh5FLj9R+aICBa+gMhYag==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231262837"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231262837"
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3DCC91000341
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:36 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id E1E3E1807149
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1B1F6180059F;
	Fri, 27 Feb 2026 10:14:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/52] python3-pillow: upgrade 12.1.0 -> 12.1.1
Date: Fri, 27 Feb 2026 18:12:57 +0800
Message-ID: <20260227101327.1432-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124722

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Patch libavif for svt-av1 4.0 compatibility
- Fix OOB Write with invalid tile extents

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pillow_12.1.0.bb => python3-pillow_12.1.1.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_12.1.0.bb => python3-pillow_12.1.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.1.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.1.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pillow_12.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_12.1.1.bb
index 83231cad06..2b3660fc56 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.1.1.bb
@@ -5,10 +5,10 @@ HOMEPAGE = "https://pillow.readthedocs.io"
 LICENSE = "MIT-CMU"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a1b708da743e3fc0e5c35e92daac0bf8"
 
-SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;tag=${PV} \
+SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=12.1.x;protocol=https;tag=${PV} \
            file://0001-support-cross-compiling.patch \
            "
-SRCREV = "46f45f674d47b5d8bc54230dda8fe9e214598b87"
+SRCREV = "5158d98c807e719c5938aa3886913ef0ea6814e9"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


