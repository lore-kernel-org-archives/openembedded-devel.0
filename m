Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD19AC021A5
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:01:56 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.46455.1739178111260815299
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o4gLh0zj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178115; x=1770714115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fYe6I7H2lZ8ee9weVQkS3T5T1pzcXJy1mkOw7HQ4shQ=;
  b=o4gLh0zjZTFJxZJFr1P0F0A++aeuIPaQVNqaLhNxHRRxwCZa6s3oJZyD
   VVUNCu6vdui+pjKfdOmAsJsRe+MGGj13qz6kRO27ecH+gKw8U64x04msE
   3y75QhC12ZbO/A9x1f/pKGLY/JfyvtrPc0TNjB0iBRMefQFinRxpNNeLZ
   6qhWCoP3v0ty5H0/Ida3TKzv0jN4ItKuDsFT2on7ojaF0q3zOeOer3XfB
   gj7gB5ozbdIGpFYqZQNgKlrN19L0B/VHRwsGJloXOcDkCWvhM3S0wYoAq
   meUP60GxrzBWbej4HBv7JrNMc77iFo0iFxzagd4mflTkhiuCtbRinuErc
   Q==;
X-CSE-ConnectionGUID: YGFbTFU8TBmS8mCIFxty9A==
X-CSE-MsgGUID: 3Lvk5FwERbSAcSqwI9FhyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189712429"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189712429"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:53 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9DBBCF2A5
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5539810361
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:51 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EC7CE1A000B;
	Mon, 10 Feb 2025 17:01:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 15/66] memcached: upgrade 1.6.34 -> 1.6.36
Date: Mon, 10 Feb 2025 17:00:44 +0800
Message-Id: <1739178095-26432-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115342

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../memcached/{memcached_1.6.34.bb => memcached_1.6.36.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/memcached/{memcached_1.6.34.bb => memcached_1.6.36.bb} (95%)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.34.bb b/meta-networking/recipes-support/memcached/memcached_1.6.36.bb
similarity index 95%
rename from meta-networking/recipes-support/memcached/memcached_1.6.34.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.36.bb
index e4966857bd..26a86d6f48 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.34.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.36.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
            "
-SRC_URI[sha256sum] = "0d5380e2e0a5b4fcef1d89a368a11c4f06686c6017c1fff778b3b4578f0674ec"
+SRC_URI[sha256sum] = "2eeeadbe8ab6c6848654594733e9da4875be7fc870a2c28f651f5bdb4053d041"
 
 CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
 
-- 
2.43.0


