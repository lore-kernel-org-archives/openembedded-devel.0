Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9315EDE99A
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:31 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.18594.1725959008382244695
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mzsvaWRT;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959009; x=1757495009;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iDSmXhcY3KIslRtQ6L8Rj7TJMIa5hMtqqsbWsaizfWw=;
  b=mzsvaWRT35fDtke6R9Qkn2HdUjtyLgF80TcnEmZQxqr9INuf00kZbT6x
   7WFzN3ucaU/i9rpzz9pgSEnigwU5DzKII659rTg9KJznif6adrxz0PzDX
   msaigg7piMTPw3wts+frr+EkoN2E74lFIIe+erYQxBO+PM3Hctu75bSv0
   Hhg3QfYNdf/UVqlzA4snF9TXBP3DnoOqhPiZBqeej28+DNmbnAyvICCRK
   QtA53FLtia2450tTkGQ0H8SRHuyPTq+ENzqrTqHlZj0rGxJTjCQNZiU+G
   rFcbEWZty4r47Hgpdu8VmjiCmbcxVmUWuqnUKcaihrSTqbGHQVpfeLxVd
   Q==;
X-CSE-ConnectionGUID: 3hBhLE1rTqWCZRBlkuxqzg==
X-CSE-MsgGUID: ffs+SONITWWLZXo3oGZA4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="160627405"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="160627405"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:27 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B6EE3C68E7
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:24 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 05839D3F0D
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 95B58200894AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 486691A000B;
	Tue, 10 Sep 2024 17:03:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 14/42] libio-socket-ssl-perl: upgrade 2.088 -> 2.089
Date: Tue, 10 Sep 2024 17:02:42 +0800
Message-Id: <1725958990-5719-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-2.211200-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrKQNhMboqZlowAYdq1VTXo6YD
	xfmcVMRmQ34KvL2zw5no+OqzvawqfgDNPxu11HXjP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW583JyW70EfyoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu/558CedkGIvkrXfN5BwqVHyu2
	oUL1gCvy5wJ5yhCoY+Il9zrHQji5TtTNLlppZgEpxOcPl2dagOSZ0OchKWhlA/yqqYIZ4pF5PmO
	YD+QLCQk7Qe8pbLNI+CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112202

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- new option SSL_force_fingerprint to enforce fingerprint matching even if
  certificate validation would be successful without
- document _get_ssl_object and _get_ctx_object for cases, where direct use of
  Net::SSLeay functions is needed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-socket-ssl-perl_2.088.bb => libio-socket-ssl-perl_2.089.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.088.bb => libio-socket-ssl-perl_2.089.bb} (94%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.088.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.089.bb
similarity index 94%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.088.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.089.bb
index 0ec892b2a..e745cecaf 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.088.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.089.bb
@@ -21,7 +21,7 @@ RDEPENDS:${PN} += "\
 "
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
-SRC_URI[sha256sum] = "9d27a31f0b617022180a1d1c45664beb76f51f3b8caede1404072a87dab74536"
+SRC_URI[sha256sum] = "f683112c1642967e9149f51ad553eccd017833b2f22eb23a9055609d2e3a14d1"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.34.1


