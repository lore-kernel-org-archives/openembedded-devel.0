Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF95E7719B
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:30:50 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.58740.1735543846399626492
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nWepTLfM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543846; x=1767079846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QCvlacOm4sTNRQh5z0XpyY1nKaDuuCRKGwQvObVAR5Y=;
  b=nWepTLfM07a/VpWXjiOyhqZqTeTKAN91vXYq7TZ7xZnUMOTNd6zYRWfL
   +9GWxiRTTqOGTqyOspo+qLniKtHiDEriGP3XUUm+s5rWcjgtpyVCi5sVW
   jm4qHlhA2ZcAzxm9UyXdzO0ddULHi3cQvAhzdDRXxjCaLULmAhzd5td0y
   yBiv+qLBwP1EquEnfo8LSerzHbzSrCZnV0NPQlE1cz3e82dfcf9s19ojf
   hvSh9xx6X8go9s2DDZtI8zjoRLDvrUn12TFCa2dKp8nyRf4u19Pz//6eD
   6L5jpvgVDdMFVl1P2v3XVQvVNimqr+AGBaU0pQj3CcCkuOXSv9wR43rOM
   g==;
X-CSE-ConnectionGUID: kD/La9W7T5+/MKC7ltCvqA==
X-CSE-MsgGUID: q6PwVPIRRiGruZQ2oGjt6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="173278777"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="173278777"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:30:44 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 38CF6C2260
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 106A4D88A1
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A07ED20074EB1
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:41 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4C2C31A0003;
	Mon, 30 Dec 2024 15:30:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 06/18] memcached: upgrade 1.6.33 -> 1.6.34
Date: Mon, 30 Dec 2024 15:30:24 +0800
Message-Id: <1735543836-2512-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
References: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10--0.415000-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOeKNmNNd29Xuce7gFxhKa16AgcdfYvhjN9zZd3pUn7KgCP
	qS35N7AcDIW5a7lmiCpf7OoMC1/+WDPIzF4wRfrAURSScn+QSXt8dWDYdvqmp9zw4lzv7RUn3FL
	eZXNZS4PExmMzPfDZvjaoqFwxNAxdIULPsDrgVnM9tXqaGttTJ3u5mZO/c9GBYo7/TAgVDUhheu
	O0+COP8ouD+6+Mv+XURPHIufQt8CNhbAPv46AKAS7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 07:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114586

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../memcached/{memcached_1.6.33.bb => memcached_1.6.34.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/memcached/{memcached_1.6.33.bb => memcached_1.6.34.bb} (95%)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.33.bb b/meta-networking/recipes-support/memcached/memcached_1.6.34.bb
similarity index 95%
rename from meta-networking/recipes-support/memcached/memcached_1.6.33.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.34.bb
index 346754c6ad..e4966857bd 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.33.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.34.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
            "
-SRC_URI[sha256sum] = "707f74c4c6876b61532b998ca8f118b0b82a0d96365d7a1d70ebfc40dfe83dad"
+SRC_URI[sha256sum] = "0d5380e2e0a5b4fcef1d89a368a11c4f06686c6017c1fff778b3b4578f0674ec"
 
 CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
 
-- 
2.43.0


