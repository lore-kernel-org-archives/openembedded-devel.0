Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 405C5C3DA61
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:05 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.33831.1721034181417654502
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FALSCOC4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034183; x=1752570183;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Gpn4N7rIiqdpFFWMPyk37OI9poF4NELGOuk7aT5QbkA=;
  b=FALSCOC4r9p80PQmxJ3EzBmcqeMo7p3jOmJmLWjVMLYVTekgRCpicLHE
   d7nl75LPCfhW/Dxg845XJjrPwhNQu5ytyWZyhluMBbuij9oyIA8bwFP1f
   CBeup/IBh3MaH+ikukd4sKjsMwmXmAKgmX9Vke9DJ+6BJJMYsTEKZCBVl
   y37dPPSvoto+2wRJZvoWvMiU31ZG5JjmNfTzbHAbuNtLkl5dijxuqAXA0
   P78ivn4nazzn6TH2i7aaZsILU2NYQy033F1GPK3Jok4PNqS3W+CeY4d1b
   jdNklfuxvbUg2P82onbj7AWqwX+9f6kI77sBuXgDAlbmoTDyfjVd0qKZ4
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="166909673"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="166909673"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:03:01 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5776FD4250
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:59 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id ABBAFBF3C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F7E520071A38
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0C05E1A000C;
	Mon, 15 Jul 2024 17:02:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/38] python3-validators: upgrade 0.28.3 -> 0.32.0
Date: Mon, 15 Jul 2024 17:02:23 +0800
Message-Id: <1721034151-540-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10-8.621600-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyUucejOoym7xzg
	cDH9HmxuaEQS/oGcScC3pOSQRQ7xBU1QH6PUk2DDA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IY0Dg2p0ztpjS5x7uAXGEprZiQDIJsDspXmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibec3QM3secWYUrhNq2OnZEqFzB9DnGLOfYI4yUI1RE/qmGpxtizLUVJKaR
	xaDyLscaiERQFbQmw0BSvSKxOEBgqQX85EkIjsS1GPVlv28dg0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111350

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- feat: add validator for sha384 hash
- feat: add validators for base16 and base32 encodings
- feat: add validator for trx addresses
- patch: moves btc_address to crypto_addresses
- feat: add validator for eth addresses
- chore: update dev deps; adds python EOL info

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-validators_0.28.3.bb => python3-validators_0.32.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-validators_0.28.3.bb => python3-validators_0.32.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-validators_0.28.3.bb b/meta-python/recipes-devtools/python/python3-validators_0.32.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-validators_0.28.3.bb
rename to meta-python/recipes-devtools/python/python3-validators_0.32.0.bb
index a132d74eb..606143197 100644
--- a/meta-python/recipes-devtools/python/python3-validators_0.28.3.bb
+++ b/meta-python/recipes-devtools/python/python3-validators_0.32.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-validators.github.io/validators"
 LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3fb4b9e6db86c69a33d5e3ee013ab59"
-SRC_URI[sha256sum] = "c6c79840bcde9ba77b19f6218f7738188115e27830cbaff43264bc4ed24c429d"
+SRC_URI[sha256sum] = "9ee6e6d7ac9292b9b755a3155d7c361d76bb2dce23def4f0627662da1e300676"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


