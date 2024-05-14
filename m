Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01E3C25B7E
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:40 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.10785.1715677830995301832
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XdDHijR6;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677831; x=1747213831;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VoRV02YYUwsQqC+QBUKaPacSt06X8YXnPiZ6ejSLHTM=;
  b=XdDHijR6L6hLS9Dns2ZLxpougIXUJiWFnqqoVo8EKFgldugApJJa1onR
   0f8JGnI8r6EQ3YT5yXk+RSa3HF0BAFuc1S+iFI4lueYJ/iq/RyqimQfHs
   TjiLhgvbDBYCozj0FHvxJLEEjFd5dSKloZ5bnXkfH6NY7LwsuLjkofTSh
   ZLxZzw6tPyaT69/9FSVhvqVZCXLueazG7vVKOwU8huSVTVtoJhfJ3r5zV
   DCp5tvoS2yw83kWWfJ6i7Un8JOo2sCCRaat6UznMlSL5pMM4zI/OKBRBl
   ssgsKlK2q0LeH5Gdpsb5rp0qnFPEI3eK2DyhbvHKrKVdLBDG9f9YPGTp0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="160257813"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="160257813"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:28 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 234B5C68ED
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6136FD090D
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DEC2820076D15
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8BE761A000B;
	Tue, 14 May 2024 17:10:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 05/44] libnet-dns-perl: upgrade 1.40 -> 1.45
Date: Tue, 14 May 2024 17:09:38 +0800
Message-Id: <1715677817-2223-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--6.679900-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzfghYDxv+lXZzi
	pOOCnHvUrCCXG3Lpn8RVB8qC/u6mVxLjP7CYMe6/owvZ4t/MYW6CX6vIxLpD2FSOymiJfTYXwzf
	BWWycnX2gJmJz6B3WQg3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXBX18z5X2O3vsWi
	BRDS9X2MYyZWTwka4Gtz9kIuTkBq64lcR4ssnr7J4CIKY/Hg3Am4n49vyf9XEvM/mydp5vVCq2r
	l3dzGQ1fzhPfaaJf1/U3Uvg9vRFnBo6hFLrJpojb0NMkLUQL+K7ClvaTqNTiw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110352

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add support for EDNS CO flag.
- Simplify testing of resolver error paths.
- Prevent read beyond end of RDATA in corrupt SVCB RR.
- Update b.root-servers.net addresses in resolver hints.
- Improve accuracy and completeness of dependency metadata.
- Nameserver: hangs on persistent TCP connection (Windows).
- IPSECKEY: leave gateway undefined for gatetype 0.
- Remove remaining support for GOST.
- Accept inbound Ethernet "Jumbo" UDP packet.
- Facilitate decoding of mDNS/SD packets with compressed RDATA.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnet/{libnet-dns-perl_1.40.bb => libnet-dns-perl_1.45.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.40.bb => libnet-dns-perl_1.45.bb} (95%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.40.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.45.bb
similarity index 95%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.40.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.45.bb
index e30125ab7..21f5b7f57 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.40.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.45.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "209bbd40de8d48c1bd7aade48da237fe0a499f89d279baa2e1a99bd5ec922ddc"
+SRC_URI[sha256sum] = "39f4b82ffe822f4d28691f6c4260f6f1fe6b5a09b546b56dd2410c21b38c1380"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.34.1


