Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B8DE7719A
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:02:06 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.16417.1736240520801990958
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Aq90LBLZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240520; x=1767776520;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rlJHC5ayskEUKmkFxYYD9rVMduZqn8HkGU4ZQcijAtY=;
  b=Aq90LBLZy9Jt2skV8Q4mxvtFxi0lAmcNwqsN/Mp1GQhTz9yy52pZkoZ6
   7CUL1m7kwSy0s0v7+gFBWnRAFfrjchPM4VYGSedcbsgGbkCF5Bf8lUTJY
   FRywOrTAZM0vUwZ/iv0uSiYPgAc3SquTxLsgvGkiFf8nqvf0MUvIq8qvD
   ZA5FeJsHmfkqnT2VrWHF/+t3yi7tO9FJOYuNHPylEyLj1DcVw67mWl+wI
   E1cs7bcZJ+CXh7iRpD2FA+bJiwNDkgLbeeq13z5gsiX064wecQCt7rDr1
   5NRxSuc/2nfEYjk5I3gr5FyVkEr3OFWNzVYlNTLliGjSdPr4jsk7KnGwM
   w==;
X-CSE-ConnectionGUID: 3CB5iE/rRqmnVmICSGlIKg==
X-CSE-MsgGUID: tYp0g788SXWR9FdpCFJnVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="186036862"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="186036862"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:58 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C52196747
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 60166D3F12
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DD15740FF6
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9800E1A0003;
	Tue,  7 Jan 2025 17:01:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/18] python3-starlette: upgrade 0.44.0 -> 0.45.2
Date: Tue,  7 Jan 2025 17:01:42 +0800
Message-Id: <1736240504-5315-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
References: <1736240504-5315-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-1.238700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSAO/N/bK7gp2AvW
	DKOhXpGX4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFAQ2UkoVaZC8tW9+PUvsWP65Nz
	V+oEm3oStMjVon+3QTmJtftRxXZq5/wrNVkJIJ0aR5b1XEyT1UOR/MssP4ieGVvZfd+A5VoOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114691

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://www.starlette.io/release-notes/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-starlette_0.44.0.bb => python3-starlette_0.45.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.44.0.bb => python3-starlette_0.45.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.44.0.bb b/meta-python/recipes-devtools/python/python3-starlette_0.45.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-starlette_0.44.0.bb
rename to meta-python/recipes-devtools/python/python3-starlette_0.45.2.bb
index 192c76997c..5acbe2f76b 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.44.0.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.45.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "e35166950a3ccccc701962fe0711db0bc14f2ecd37c6f9fe5e3eae0cbaea8715"
+SRC_URI[sha256sum] = "bba1831d15ae5212b22feab2f218bab6ed3cd0fc2dc1d4442443bb1ee52260e0"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


