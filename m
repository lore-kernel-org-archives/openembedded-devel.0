Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E31C3ABA8
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:16:04 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.7605.1745900154233605117
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YiINmTtz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900156; x=1777436156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1ujvhyxB0FtUPBheT+8fvP6iaocL9k/bgEe0jZYt4ik=;
  b=YiINmTtzMAUoB6KbMqQEmPRSVc0VcJRExdlHFdJaog6CFEmZk6tQYBO3
   Tm29HqxutqC0GZ7o9AtJuqLGanLfsHFN9lg/RnWDG9pCSXpujJKNHZAIu
   NAacnYr7dUeRx+CZU9WMUnHaVhOgXux51ENs8Cw0fFELVaKogQWBlbDDe
   yPy7Shvh+BnTrjVUrr6ID+2ty0HoMgPlhPDpOUvRoiJvS6o6sBhGb186R
   Ze7Wi3mn/CzularMqmAy+RFSLOks21+c3tqhza7rtfrChYnlVeb/Dx4n5
   D4kdKiU0OzdgM6ISFGTB+1LyTJL8sr3HUekyJmWvp0/ffsVoXpslxv7gJ
   A==;
X-CSE-ConnectionGUID: yW2zwYoSQ5OHpdSZrPRy+w==
X-CSE-MsgGUID: 0C/c2RSTQhmZ57DUDB0quA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="197966430"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="197966430"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:53 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id AA426D4808
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A0B5D88A7
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:50 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2998B1A00A1;
	Tue, 29 Apr 2025 12:15:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/23] python3-m2crypto: upgrade 0.45.0 -> 0.45.1
Date: Tue, 29 Apr 2025 12:15:34 +0800
Message-Id: <1745900138-26424-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117227

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-m2crypto_0.45.0.bb => python3-m2crypto_0.45.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-m2crypto_0.45.0.bb => python3-m2crypto_0.45.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.45.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.45.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-m2crypto_0.45.0.bb
rename to meta-python/recipes-devtools/python/python3-m2crypto_0.45.1.bb
index 77f1f7df89..b029b2978c 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.45.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.45.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://gitlab.com/m2crypto/m2crypto"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 
-SRC_URI[sha256sum] = "ffc10d4d09901514f408dc74f60a4d7df21c44ebc9bf776c947bfdc7359421cf"
+SRC_URI[sha256sum] = "d0fc81a8828edbf4308432b3040bf06bb26bad95abb9e7d4690b6118551e76ec"
 
 SRC_URI += " \
            file://0001-setup.py-Make-the-cmd-available.patch \
-- 
2.43.0


