Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72F69C0218D
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.32745.1737360861831978250
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RMRgCoi3;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360864; x=1768896864;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uNOeRDlroL+WWv6Eqfk95aPDTqFYJBLAIHD8DyRHXoA=;
  b=RMRgCoi3P2Z0Ou83T21PBANw4VBQBQF3LwKzM7oGcidTTSG3sq8vWt+e
   KMMWspOBP1VeXIlMVmoTnjhgLtHZwYeMYazwU3pMw3ZvkMkcfx8u78ySw
   Eia6L7J0jIXWYmAMeUMyRMFeZAeCiWfEsEWMUufD+FAOsA6kPdYbLWe0M
   TpYozPY/bt+fyvR27YW1q4G40Y8d+iNPZq4OfVprT9kL23nl+XvJIyOkM
   YKOJ1K74nNbHwMvvS3q+wJLrLIbY1ehkioFHBW1caTOckn1bqlMm4bucd
   KoQN0bLX4UTY7o7PuC9y+UP+UiIsE4MKPpEsy42srR3HTL29ihBD+l7L6
   g==;
X-CSE-ConnectionGUID: J9Rr/fj4SRa0qrukabP+ZA==
X-CSE-MsgGUID: yF1/4hTVQkCXUSB5F/N5JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="186303499"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="186303499"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:23 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E07BAE0765
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id AF719D968C
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 36E6920074705
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 01A871A0074;
	Mon, 20 Jan 2025 16:14:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/32] python3-smpplib: upgrade 2.2.3 -> 2.2.4
Date: Mon, 20 Jan 2025 16:14:01 +0800
Message-Id: <1737360846-4824-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-0.414600-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLP85tlrdTfE3uDhljfG03rzmwpmAFt7kWYkAyCbA7KV5soi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SJlmksD18b47geoOhRQJLaj0o9f+rhsA1xnjdJsdSpJNUp6
	9Z6VZJqNlEasLuQx8Q89e1PMEFyOlOSx6Y/OF5Kah9Ft6OH6SoS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114991

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-smpplib_2.2.3.bb => python3-smpplib_2.2.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-smpplib_2.2.3.bb => python3-smpplib_2.2.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.2.3.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.2.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-smpplib_2.2.3.bb
rename to meta-python/recipes-devtools/python/python3-smpplib_2.2.4.bb
index 2fdd2a4634..c177d4020c 100644
--- a/meta-python/recipes-devtools/python/python3-smpplib_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-smpplib_2.2.4.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://README.md;md5=8b4e2ac8cf248f7b991784f88b630852"
 
 PYPI_PACKAGE = "smpplib"
-SRC_URI[sha256sum] = "5215a95b0538d26f189600e0982b31da8281f7453cd6e2862c5b21e3e1002331"
+SRC_URI[sha256sum] = "6f3b036fcb2643c1b7a3289bb5ac4c9a720af1bf73e572e2729db6b5d800c273"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.43.0


