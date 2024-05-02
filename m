Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69933C25B74
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:32 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.6639.1714628968804437873
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gnDhMB+/;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628968; x=1746164968;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8bsSDfNje1JOT4bzpI6hCGB5Ot08AfOHV2/mR43ecZk=;
  b=gnDhMB+/n3IFww5HZmWpWLmUmim29o3x0INgsD4dHacEvhJAcdCEHlCS
   SAOGIcLAxebEvfvCpmLU8ggD8IXLe/M5oM4U23KCnyAXVpbuJp2DJXXe7
   /SphrCLTgPKVuBI2DpAr6HRENXQyA1P6xK2+jobV2hOFZyYOtkKq+zP8G
   zyz+7u9CgzrE0MUk2BUHlij3a3D7JDMIPSAeBH0wZfbCEqIX6hcL/I1Ih
   0geiRnN6n4womZ9HdMwcX2BBYx4t2UdTQl/VPhWoGAtr3A3gheXeY7PS0
   ZEcVnQRTw/Z7C5UBkeeOLp5RAw1dSDjyNosAdHA5QiGTzXupmKiNuRs7G
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="136526435"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="136526435"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:26 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 06F96D4C2C
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3038BBF4B0
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C2E40217354
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:22 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6E0771A000C;
	Thu,  2 May 2024 13:49:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 07/30] python3-bitstring: upgrade 4.1.4 -> 4.2.1
Date: Thu,  2 May 2024 10:48:06 -0400
Message-Id: <20240502144829.241208-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10--0.286300-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/ycb6dLbgzMd5lEDhvi2wR879wRnyxuPjhDkQ
	p1oMb8xLPL6F5JtDNmECC4lT2pIYna1UpJChTZPBfOaYwP8dcX5pkBMYDn8FeKCjQPEjtbB07W9
	iCA7HUAvgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZMwxLuRKoyaTnAw
	8yp081LIGQRIwjTl3iKI5/U0OcIj6tYv/FAmebjp4CIKY/Hg3AaZGo0EeYG97fwtq4jZ/G3iq2r
	l3dzGQ1NpNG3hThTzP21ouyC3G7QIpIaQ8inYLoRdoG2PNspgNNlewM4ADhQ/u2cIlVOTIes9gy
	FH1bpFphXFtj90mYhgAcTh5nVo6KA8xJxKFzCygVxRB/din+uJ07T8ZSLiAVvR84/OmB1wQp4n8
	eQBnwiw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110216

From: Wang Mingyu <wangmy@fujitsu.com>

License-UPdate:
 format of LICENSE updated to "ASCII text, with CRLF line terminators"

Changelog:
==========
- Module crashes on import with 32-bit Python.
- Lists of integers not converted to bytes when using the bytes constructor.
- Empty comma separated tokens not handled correctly.
- Crash on import when docstrings not present due to optimize flag.
- Dropped support for Python 3.7. Minimum version is now 3.8.
- For tokens that use a non-numeric length, a ':' is now compulsory rather than
  recommended. For example use 'uint:foo' instead of 'uintfoo'.
- The previous e4m3float and e5m2float formats have become the slightly modified
  p4binary8 and p3binary8 formats.
- Some parameters are now enforced as positional only, such as auto in constructors.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-bitstring_4.1.4.bb => python3-bitstring_4.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitstring_4.1.4.bb => python3-bitstring_4.2.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstring_4.1.4.bb b/meta-python/recipes-devtools/python/python3-bitstring_4.2.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-bitstring_4.1.4.bb
rename to meta-python/recipes-devtools/python/python3-bitstring_4.2.1.bb
index 0777b6cff..8485e2e8f 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_4.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_4.2.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Simple construction, analysis and modification of binary data."
 HOMEPAGE = "https://github.com/scott-griffiths/bitstring"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=661f450e2c0aef39b4b15597333444a7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f7f2fd3f1cd52b5ccd39d76fb3568d3f"
 
-SRC_URI[sha256sum] = "94f3f1c45383ebe8fd4a359424ffeb75c2f290760ae8fcac421b44f89ac85213"
+SRC_URI[sha256sum] = "8abb5a661588c764bacf1a23d64c7bb57517d2841e3e6f54fb8c057119e0540d"
 
 PYPI_PACKAGE = "bitstring"
 
-- 
2.34.1


