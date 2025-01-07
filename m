Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E64E7719D
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:02:06 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.16531.1736240519967429646
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k/rUK+Zp;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240521; x=1767776521;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=cfnC29qpJXKtnHPC34UsAN3DT+nqEHN5BP8kUicSLc8=;
  b=k/rUK+Zp4kw/mPSP1RbeYD/Jaoo4//D4igg3b05oVBqrGSaSCqi8a97h
   qnSNDhk5fln6reGrDzkQc1D49R4WiL2mMOrJ/Ed9JfYQUQb53TdyzjWKr
   qwXEONwFnlmy/zcyc8c+xWVEkVIXIpptiG7sB639CYmzfrwJV6lQGPOIQ
   MXr6kUg7vVbFFRsaeKUZr8fq0ovHsDVjF98T7nto4ylrqmKjNJkkJNN4h
   rq9DFCona0YVW7Ah/SL3+diV9vwtCWFiLHdIxUQjCUXSU2tgWoPBxz4jH
   Z7gX5onl3ksVTLoYPasXp4cEjQxEGcTxjPrDA1kY327tdPqyDq66p+x3W
   A==;
X-CSE-ConnectionGUID: xEo3qKP6R3ecjH+dhonYQg==
X-CSE-MsgGUID: i4PSU8pHTBuiNP0dPsyphg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="184995901"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="184995901"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:58 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 93ADFC226F
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E261BF4B4
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1367D200930C2
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C0C3D1A0073;
	Tue,  7 Jan 2025 17:01:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/18] python3-marshmallow: upgrade 3.23.2 -> 3.23.3
Date: Tue,  7 Jan 2025 17:01:38 +0800
Message-Id: <1736240504-5315-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
References: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa0BQOqUsWgx5qgYxPFkOLKJo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXLJ7hFrZ2akZyLMJifLKOA+s/9tea7danOH2L
	baMvKljBmsR622Yt4pmR9hi3mNJQouxlWLC4yV9Uox0dXeve/Qtwn42sGxOsr+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114688

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Typing: Fix typing for Schema.from_dict <marshmallow.schema.Schema.from_dict>
- Documentation: Various documentation cleanups, including more concise docs in the marshmallow.fields API reference

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-marshmallow_3.23.2.bb => python3-marshmallow_3.23.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.23.2.bb => python3-marshmallow_3.23.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.23.2.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.23.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.23.2.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_3.23.3.bb
index 334c9f8cef..3e01575df1 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.23.2.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.23.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "c448ac6455ca4d794773f00bae22c2f351d62d739929f761dce5eacb5c468d7f"
+SRC_URI[sha256sum] = "d586c8685ebdb80bf754e1f96e3f305aaf30951f1fc69175b977453633467e76"
 
 inherit python_flit_core pypi ptest
 
-- 
2.43.0


