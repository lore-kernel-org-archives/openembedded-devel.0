Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27407C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:01:54 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.17074.1707206509158978466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 00:01:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cfBGPZdD;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707206509; x=1738742509;
  h=from:to:cc:subject:date:message-id;
  bh=EB7rzG7IXT73JhP15tSIo/LXObLMtjn3xAkobD8PycY=;
  b=cfBGPZdDcYBUL9i3wfLBji+3Uraa5pg+H0QQOpTwwvsRM/JAvvU+KeeH
   mZ0V1DJYXsu3UOCDRVSwaR+xt34WVQhKciQMrtX7vQOzDKMga8+iLmbWo
   EawVVdE1tfRgu7Cb6c3E8TOXzhn9JtGeGRE7byN7AWSNUIZXSmPKlff11
   RKbRsmrix3xI3dqx+oWF6c8VgXKdnl95MsFmtLHnrOZUvU1HAkY6/yWHJ
   mSljtkTXJP5pkckmzTe8eeIQh5qMxvBUthtNGlBnbtwgWDiGcvi4bN/ty
   Hni+4Rm1vm8hZSchK9/hLgzu4spKh1Xxh0b7Lu13FHOAG+WH3VGBaodqb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="136543777"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="136543777"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 17:01:47 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C5D071DDD50
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:01:44 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B8DC2BF4AD
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:01:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 29BAA1EBE52
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:01:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BAA841A006A;
	Tue,  6 Feb 2024 16:01:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] squid: upgrade 6.6 -> 6.7
Date: Tue,  6 Feb 2024 16:01:16 +0800
Message-Id: <1707206476-5165-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--0.721900-10.000000
X-TMASE-MatchedRID: 242WXRytjV6jz0nOeth/yUIIxwDaU5mrGBULflUTtXThA4WtAM986Q/9
	275IaKqDqh6ayVk/ef+hH9YEXFGn/i8oE1Ngob6lHEDUAqZUZM72/fdRbxY1gLoVNuDqd1E5PbG
	fARr+8Lq3T22yAfj5MHjhw4b/Sd4TTjMjF3x6fOlYUconbBJWJApbrx4idn+FoS4fXu6r0iIG6E
	w0t87pQGTBHJB+pPJTTDW61Lsl8qP3NhTrOUQg2z9B1SHosSXQN5dqZcIK7VjAuQ0xDMaXkO5tC
	u25FAyi/ylbX2Ykg6a4aE+cD2zDF/PumXek4cU6SHCU59h5KrHjLrHqvAiSy1cZNuxCoduS1vZ7
	s3YIVDJ6eUBjjG/BILVijUdnqQBWkfRhdidsajMURSScn+QSXgGlEJORGTlJ+gtHj7OwNO2qszj
	olCcvyN0fD3xblzVxZo9ARkr4Fy0uDCbr8K4vilAEtnq9/UFoAEIH2HZiSIz80HyIgwt61eIcx/
	mugluAPY+kA9pZjL8XoW+7sGuBp/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:01:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108602

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Bug 5337: workaround for crash on startup if -a option is used
- Bug 5274: Successful tunnels logged as TCP_TUNNEL/500
- Fix crash when NTLM and Negotiate helpers are queried with no HTTP request
- Fix SslBump memory leak when mimicking certificates with Authority Key Identifier
- Fix memory leak on SslBump certificates with Authority Key Identifier extension
- Fix a possible integer overflow in FTP Gateway
- Extend cache_log_message to Bug 5187 and job invalidation BUGs
- Remove incorrect beta version warning
- MS Windows portability improvements and some documentation improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-daemons/squid/{squid_6.6.bb => squid_6.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/squid/{squid_6.6.bb => squid_6.7.bb} (98%)

diff --git a/meta-networking/recipes-daemons/squid/squid_6.6.bb b/meta-networking/recipes-daemons/squid/squid_6.7.bb
similarity index 98%
rename from meta-networking/recipes-daemons/squid/squid_6.6.bb
rename to meta-networking/recipes-daemons/squid/squid_6.7.bb
index e5053f092..519ece80f 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.6.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.7.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
 
 SRC_URI:remove:toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
 
-SRC_URI[sha256sum] = "bc73ce506050334f51441f9054ffba4eb7cfd365a5e98a6d178b8263b9222f40"
+SRC_URI[sha256sum] = "7a09a0232026824c300b72c42cc5c0c431cbb65498f41d5dea48ef447ab8037e"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://errors/COPYRIGHT;md5=d324bc1f9447d1d1588d75b22a678dc4 \
-- 
2.34.1


