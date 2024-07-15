Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD08C52D1F
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:06 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.33787.1721034178991156327
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FMVKwxEi;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034178; x=1752570178;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7D4sAR3L8FQCZ9/y+q+RX8j7yEbvBQWDmj9NT93y0/4=;
  b=FMVKwxEi/Ey1mLtiN3EkcntxUnoEyGJy92Hqpeq71a6/LgZfzM+2VXP0
   LIjp7pxjf8NaLjWCc8d7CnPQ1tBNiNpI1ImzQOJgL7VLOG+hz1nsO5kN9
   O3s9ew/oUWNPYHAt1iqXu9rEqcJQNWZumYUYGt/6igeZgGxm+qmdeD/za
   ZRAuvq0zCwEU+txeHU7nnXyGROlXtYztTcQ9Xw6Cswu48+CY4Znag2bMW
   ogsYTfQBkN5DQeWAEJxPH4iLBsLoM87k1UIB8BQpw6ifwYNyoeLbAwDNP
   rEoF5XteAfB2DNDQlIAKKCn3KPEPJnQXcMdVvZrocFlfAKMzzHi6GVJt2
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="145800155"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="145800155"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:57 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 59EBCCD6DC
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A79AED9687
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2084F20071A3B
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E0FB81A000A;
	Mon, 15 Jul 2024 17:02:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 11/38] libio-socket-ssl-perl: upgrade 2.085 -> 2.088
Date: Mon, 15 Jul 2024 17:02:04 +0800
Message-Id: <1721034151-540-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10-2.525800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrG24YVeuZGmMjlF+os4xasIc1
	SeY3qdoaXk6W7msm2PiTcsBMukkfR2JZXQNDzktSP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW583JyW70EfyoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzPDhZT2IFDg11UC
	4KOkGaXMMoEGWVw3oyHh9gtukFSfUi8x0agZgMDePofaOPX7q/MM5NPsEqUamxM54n1HLFJXGdf
	E0N9w+NiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111332

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- minor fixes for use on ancient versions of perl and for building with
  newer versions of openssl
- support for PSK, see SSL_psk in documentation
- internal optimzation: implement _touch_entry in session cache instead
  of using del+add.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-socket-ssl-perl_2.085.bb => libio-socket-ssl-perl_2.088.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.085.bb => libio-socket-ssl-perl_2.088.bb} (94%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.085.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.088.bb
similarity index 94%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.085.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.088.bb
index f7b3d416d..0ec892b2a 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.085.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.088.bb
@@ -21,7 +21,7 @@ RDEPENDS:${PN} += "\
 "
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz"
-SRC_URI[sha256sum] = "95b2f7c0628a7e246a159665fbf0620d0d7835e3a940f22d3fdd47c3aa799c2e"
+SRC_URI[sha256sum] = "9d27a31f0b617022180a1d1c45664beb76f51f3b8caede1404072a87dab74536"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.34.1


