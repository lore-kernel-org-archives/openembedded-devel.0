Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D92CAC5B4
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:14 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.15058.1758015726070597579
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o13tVhTm;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015728; x=1789551728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WaoQ/kww/+tE7cnNAB1ZlfsojTJZEVJ1X+ljmzYI5SI=;
  b=o13tVhTmwzZMQQA8UeYYBWAKlzy5nYTLf9COY3viO2rU5OLCllZYtHZM
   BhbbCA+SehwFla/JgeL3RmLPIDCCfOf+DA1Oh5dtzHURtCuX5px6/DoYe
   7E8d5uGlPDYyfxVjB66Z2pz9gpj4Ha3rI/ckXPs1gw8tysTpDbvCjJfhA
   07Iv4emIZO5AVAWSYnpnuZcGxtZaaq4GH2xS8NG/31iI+cGPK/OugnQiT
   ONjHV82ntNT7ChYvKo+ZJ+MXjpLFi1ZobjES19pBzk6Ur7U4oubvQTuU0
   b5L+JMkD48Ztow2caKlvVwF+ktdtnFAYRbRQHA7MVQ7b1d7+t/gUJ2XCX
   w==;
X-CSE-ConnectionGUID: dgHO22SvQF6UPMhj9VWRGA==
X-CSE-MsgGUID: 7nPeWsIGR0O7wEZKNw+uBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="191834347"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="191834347"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:07 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 5A481C000B9
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:07 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 0DE188D9B8B
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:07 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id ED91A20017C2;
	Tue, 16 Sep 2025 09:42:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6A7FB1A008B;
	Tue, 16 Sep 2025 17:42:01 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/42] python3-bleak: upgrade 1.1.0 -> 1.1.1
Date: Tue, 16 Sep 2025 17:41:29 +0800
Message-ID: <20250916094152.1479-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119440

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-bleak_1.1.0.bb => python3-bleak_1.1.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bleak_1.1.0.bb => python3-bleak_1.1.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-bleak_1.1.0.bb b/meta-python/recipes-devtools/python/python3-bleak_1.1.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-bleak_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-bleak_1.1.1.bb
index 3fc95ea631..a532a520e7 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_1.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/hbldh/bleak"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 
-SRCREV = "edc9c5125614f816ac7e8edbf2b4338e3142fd3b"
+SRCREV = "2564f9162c46f451db8067930637f30487315f7a"
 PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop;destsuffix=${S}"
 
 inherit pypi python_poetry_core ptest-python-pytest
-- 
2.43.0


