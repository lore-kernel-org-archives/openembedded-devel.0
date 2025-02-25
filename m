Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1ECC282DE
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.2203.1740525898314938418
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J5V5iu62;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525899; x=1772061899;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=A0Xe+gqF/gT2VHxU+d8Ed2FlKen89vtfalXhgjhP6uM=;
  b=J5V5iu62J6Q7ryt/N/9HMlZTNsf4a54pbZ0yTIt0YQF2lOGmR+ZWpdmj
   A4wyDvz+BTRIEdEDR3/Alx+b+XDAc7STjRBCW2kjcsENuV1zKYRrMJ6Kx
   iSPPV43F4LFF6T1IULw8lSO3ZcBoKLScnIBPdM97Pi7LaTXboZvWrgJps
   wnqeuLt0nUpB36pAPIXwbtrAeT8b7ITBHhhcdJjB9Ac3oZ4wELkF4PYXt
   I5j3AW68HLZT9bHe4sGZlJ8flVb5Wos0Xdb1WrmzhY74z+wU7ITXHoVF1
   6Lakrn7ryShi6RKkfX9Y6+uJngQHt9f+naGpx/B7pzqgq4MFdE1feQb2l
   w==;
X-CSE-ConnectionGUID: 7l7k72+7SY6sqQzqsMkdtA==
X-CSE-MsgGUID: mp0Vu3ONTFSVoJLnXpB2QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="179142876"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="179142876"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:57 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B7B0D6EA5
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C428DC8BF5
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:54 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 89BEB1A0073;
	Wed, 26 Feb 2025 07:24:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 15/51] libnet-dns-perl: upgrade 1.49 -> 1.50
Date: Wed, 26 Feb 2025 07:24:05 +0800
Message-Id: <1740525881-21103-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115614

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Minor code improvements in Resolver::Base.
- Add RESINFO package for resolver information.
- Documentation revision and reformatting.
- Fix rt.cpan.org:
   Fedora41: IPv4 loopback disabled in IPv6-only configuration
   Use of uninitialized value [in _send_udp]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnet/{libnet-dns-perl_1.49.bb => libnet-dns-perl_1.50.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.49.bb => libnet-dns-perl_1.50.bb} (95%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.49.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.50.bb
similarity index 95%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.49.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.50.bb
index 0ea91c0c4c..c7c0e381a6 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.49.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.50.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "8da11c6d491732e6f389901b81f86d4d67a208759e7da63688b2e5a26e23be5e"
+SRC_URI[sha256sum] = "c660500b9d96e5aa2b16d9f4260b6f9f05b5602d3c4bea0ca39b45bcd02ba993"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.43.0


