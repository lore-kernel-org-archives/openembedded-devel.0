Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE88C54751
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:41 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.8715.1724833535769596083
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X9Okn0KO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833539; x=1756369539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JJAeY+BzdW+21FNQ4LD8tJInQ3Nwqo+dUW+Ru5X9Jsk=;
  b=X9Okn0KOX6/4uOoUWz+nJnTzY96ottXNed+cGtfRmW/FZ6iO874NaBFl
   0bFgyigg+bBzGc94lTSBvcfhFcRDlSQmeXkE1asv7QeWSBs2zJ9jJcCUq
   6crAnBMmmgSMy8/VTgHqRIY8cti3vkFaIyzP8ZxoEP+ppPZMRBHS1srTP
   AB0zPNT9meUfkTbODoAGt5DYheKgwbH1nPZSQGzBTe2f/2cRpThhDFXN2
   aIT54z1sPh/XniviHB6Pg2LROd6vLkjDwJFOH9uCNW2ELvxbVdFM3ertg
   sF+9y/pqDFnW4HAP54DIVzB4zD3lvL5kDc22mcO6wRIoE7HEw4CUecVoD
   A==;
X-CSE-ConnectionGUID: r5EyYrvGREu/hhqmRZO68w==
X-CSE-MsgGUID: MleSYABnQq21MdtOmAnEeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="151342508"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="151342508"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:38 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 273A2D5A46
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 698DECF7CA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E87726BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 936941A0002;
	Wed, 28 Aug 2024 16:25:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 08/46] libnet-dns-perl: upgrade 1.45 -> 1.46
Date: Wed, 28 Aug 2024 16:24:47 +0800
Message-Id: <1724833525-2162-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-3.417400-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrBe9Kp823lBgCiXI7bHFUBX72
	uNnedUzGkzG01C/Uzh6hIfz5Pq8buO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKJaf/8Uw5sGwm+OJmpydfpycVeYCqx1wVx1e7Xbb6Im2n0tCKdnhB58I/9UW5M5dRMQpr
	Z/7WnuveTCMddcL/gjxlblqLlYqXI8WjwLFcHqbEEJscB96VtGl5KPP0PcuTHjInHp5HwYHBg/5
	EMRkcBvajjHcWBnEXJOIq0amq9AsCJ/Q/vOH3S3v3nnZ6wdVxv+v9v52ZIoWjoAf389xF3XFSk9
	HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111984

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Resync with IANA DNS Parameters registry.
- Revise documentation for Packet.pm and Header.pm.
- Random ID cache moved from header->id to packet->encode.
- Restructure resolver method inheritance tree.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnet/{libnet-dns-perl_1.45.bb => libnet-dns-perl_1.46.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.45.bb => libnet-dns-perl_1.46.bb} (95%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.45.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.46.bb
similarity index 95%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.45.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.46.bb
index 21f5b7f57..18ba6336f 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.45.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.46.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "39f4b82ffe822f4d28691f6c4260f6f1fe6b5a09b546b56dd2410c21b38c1380"
+SRC_URI[sha256sum] = "91b65cd0f12461802c61ca5474f87b3e29f5182d2e1b3a2ea70702a3efb4a743"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.34.1


