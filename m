Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B68FE6C5E4
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:10 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8209.1733185022119642583
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hn148CcY;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185022; x=1764721022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=s1L2XeGnaQ+tza5C3v5kfrGe85ZLteumM4uuzbmx6Pk=;
  b=hn148CcYw1Xu+jNzBQJhFK2ldmzl6jP8rK7c60RLGJcdwggs1RezXnUa
   oauNQPaOs4apoGGycAwOnTirsLlL2OgHgb42Agr/z4hZfJUjohkz4bACi
   90V+9R/fIVyNdMoJLDKBtvB5/pCyKo7lcE9ZKL1pQRYyP5ZytuRwZXqZc
   OdRldbstq9ue44dW1KmJSXmeYQiXBedWLnpmjjUFs5Zej0Ch6llO0eAqI
   dZ+8KDewPpdoQFEM8afX7IZs9Q5UlFcVLxhn7YVBFP8sQKc1LJE0y1JS7
   I5uJM56mXmZCzntrBj8aLQRmG7EeO2DygGngHFAtv4sXaiQ/RhCoKCEtS
   A==;
X-CSE-ConnectionGUID: KXkOisNDSrO+zL5ucnGasA==
X-CSE-MsgGUID: 419d8+QFQQ+AE5ByhIZCig==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="161323081"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="161323081"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:17:00 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E92B3D480C
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BDFC6BDC8A
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B99620071A06
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:57 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CED411A0003;
	Tue,  3 Dec 2024 08:16:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/34] python3-httpx: upgrade 0.27.2 -> 0.28.0
Date: Tue,  3 Dec 2024 08:16:24 +0800
Message-Id: <1733184999-27041-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--2.217500-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrlDt5PQMgj02/UKSk38cGDGca
	731DH1CiBuERYaQAnMmGTsPgiGw80bkRMDcY9eUD7+etKcKRtq7cAmu1xqeetgjxoTu0kNRwGHx
	+YXGgv6suLKEVDNY1QWbO5wFo8PNmAM0/G7XUdeM/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bm0xeKYZaxlkBhQWw3lZ+IXsz8PwlGcGDZ4CIKY/Hg3AaZGo0EeYG96m4/3ODjvukSq2r
	l3dzGQ1DBbGvtcMofwOPxuimt/0j+POdJMZ0XBdvBQQdyHAOc9DZmJHTsOZ1rw6dv03geRUk3Si
	pu4lPgvMa7ZbpL+6zjKAavwFo5L16fJhrawUwkEdJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhF
	TP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114162

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- The following cases of configuration API have been deprecated:
  The verify argument as a string argument is now deprecated and will raise warnings.
  The cert argument is now deprecated and will raise warnings.
- The deprecated proxies argument has now been removed.
- The deprecated app argument has now been removed.
- JSON request bodies use a compact representation. (#3363)
- Review URL percent escape sets, based on WHATWG spec. (#3371, #3373)
- Ensure certifi and httpcore are only imported if required. (#3377)
- Treat socks5h as a valid proxy scheme. (#3178)
- Cleanup Request() method signature in line with client.request() and httpx.request(). (#3378)

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python3-httpx_0.27.2.bb => python3-httpx_0.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httpx_0.27.2.bb => python3-httpx_0.28.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-httpx_0.27.2.bb b/meta-python/recipes-devtools/python/python3-httpx_0.28.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-httpx_0.27.2.bb
rename to meta-python/recipes-devtools/python/python3-httpx_0.28.0.bb
index e4e1eeea73..2b8c809c08 100644
--- a/meta-python/recipes-devtools/python/python3-httpx_0.27.2.bb
+++ b/meta-python/recipes-devtools/python/python3-httpx_0.28.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c624803bdf6fc1c4ce39f5ae11d7bd05"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "f7c2be1d2f3c3c3160d441802406b206c2b76f5947b11115e6df10c6c65e66c2"
+SRC_URI[sha256sum] = "0858d3bab51ba7e386637f22a61d8ccddaeec5f3fe4209da3a6168dbb91573e0"
 
 DEPENDS += "\
     python3-hatch-fancy-pypi-readme-native \
-- 
2.34.1


