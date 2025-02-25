Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8243AC282EC
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2304.1740525903703602786
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aEfq93/a;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525906; x=1772061906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jbygzqMI283Mm6nS727lf7mYzcF/TiVp2G1pLRQOC/o=;
  b=aEfq93/a2rA/qMvYSIyRgw3Q3cDLGWEBU65eJYSUVhPQ69eK+knqYyg9
   pYhmpxWZvD7GOoWggh01lmE8ZZ90SF/w/CVtR5MwqJTr6z0jCy70cVUgV
   C15q9LEwfVQuCxADcZw8hQCi4dIM+NPqtFDHcC1LDkvf6RitXqyahUvVk
   sIo09Pd6Lrb/IE5YkpSkHcNSYRqCC88BuEQoB6KZ+oLdDApd03pOgfIho
   9OQiJHL4ldgE5j67qQnrovz4k/ldijS2KcYL5d07XnCpKmRM++NzOgPK/
   Hy6sIfeoHVgN8vQVD9VFy2kSqAMl1VPjPie1IuwCZDNkyAjG2UVBRSw8I
   A==;
X-CSE-ConnectionGUID: p6UiMcG/QwmFC+cUhEV+nA==
X-CSE-MsgGUID: E1bMdPF6Qb+PQWeNSsps3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="191193475"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="191193475"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:05 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D16D6E6141
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 975D9D7298
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:02 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3B07F1A000B;
	Wed, 26 Feb 2025 07:25:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 49/51] ser2net: upgrade 4.6.3 -> 4.6.4
Date: Wed, 26 Feb 2025 07:24:39 +0800
Message-Id: <1740525881-21103-49-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115644

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- tests: Fix some typos in the ipmisol basic test
- tests: Fix the modemstate and add linestate tests
- Fix modemstate and linestate handling
- Fix break sending to use the right function

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ser2net/{ser2net_4.6.3.bb => ser2net_4.6.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.6.3.bb => ser2net_4.6.4.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.3.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.4.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.6.3.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.6.4.bb
index 52497a211a..ae8a5108d8 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.3.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.6.4.bb
@@ -11,7 +11,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz \
     file://ser2net.service \
 "
 
-SRC_URI[sha256sum] = "9c23a3d82c3d36507cdb58e8a0eb33487b600fa491c05f7dcf1aaf8b70566051"
+SRC_URI[sha256sum] = "75864434c4f002fa3570daaffeb6f794354fca6d8b5814b8386977a3b1416be9"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.43.0


