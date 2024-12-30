Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3693DE7719C
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:30:50 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.58737.1735543844307724593
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:30:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=msLgcYAC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543845; x=1767079845;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=W5dWWVDyDfyILSejQxC83ALEWDV2ep9KITX1x/rCBss=;
  b=msLgcYACglVD2TH4MIiENO4l5DdDsXh/IztDjybHNr5abpW3Z0RYFyl/
   KkqmxLDD/1D/sz7T1/tjpDbIsEBfebTuIZZKaqxQO3RtFlGpQzrzGUZbK
   RBCnYP1OoMyJWWJntpvbomCxMQ8qKSXol7A3X5IixqwGeh0Y3mHxUY7vM
   0y6veNyE3yDYrNfZ09PR0+KZHtmzq3LzHTiWYOtBcjb2UnkbvmQmyRQqo
   BS1CCrCxj7KlcQN5Ec5LPS00T0/MAEkyPB9x7TCWE3WTcw96ELzdGl0cP
   anw9ZCNXvNZma3eTrN3hJnnKh2HsrloCizFandPOwHusuWcF2CJQ5YtJs
   Q==;
X-CSE-ConnectionGUID: LC/ptK18R0yoI39WC52MSg==
X-CSE-MsgGUID: bqsPYjLWRhyM35Lq6/rDjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="184471579"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="184471579"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:30:44 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 75C7BD6EA5
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 48A0ED5040
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D146020074EB1
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:40 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7BA3C1A0003;
	Mon, 30 Dec 2024 15:30:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 04/18] libnet-dns-perl: upgrade 1.47 -> 1.49
Date: Mon, 30 Dec 2024 15:30:22 +0800
Message-Id: <1735543836-2512-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
References: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10-0.690500-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmI/dksnGuGmFXFXmAqsdcFcdXu122+iJtp9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrQ+K9bKUhgfo2IYj+8UhobsL0kgWuzyFHu13myMLTYJSbI+4l5tV0q/vae
	K7MKHe+n2WdergvcvvQnBuPyCus8KHhX9+nESxzR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 07:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114582

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnet/{libnet-dns-perl_1.47.bb => libnet-dns-perl_1.49.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.47.bb => libnet-dns-perl_1.49.bb} (95%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.49.bb
similarity index 95%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.49.bb
index e837013970..0ea91c0c4c 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.49.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "fec3dab10ac82dbac26b1ae2e367909256f420835d96cda7dc1b508e29938f0b"
+SRC_URI[sha256sum] = "8da11c6d491732e6f389901b81f86d4d67a208759e7da63688b2e5a26e23be5e"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.43.0


