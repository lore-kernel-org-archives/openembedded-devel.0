Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE93C1B0FF
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.2300.1740525899545131700
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tGD2e8bo;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525899; x=1772061899;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Ig3oq6+H2pTmL2HamsVFwp9MWBMEYIvTypbhLpBf4O0=;
  b=tGD2e8boTLEQqZ41Lg17+ysk1T4di4KnwI4vOVdoycoYVFyvfcMZ5mHR
   uSDtpIVMd64OjldIJlsYsHN5G3144eQ+3dCtvISRMrI6ulB8lCcwXG8V/
   bdyeQ0KZO88L8t3pim3do8R1eXhvqOqm3dq9s9UYmY5nWzNjzQzvR0QWz
   YaoC1bxLqhKDS2BDwo08NqitmjrxlXddcLL2WWDJBGcxF5WW9H83eA/mz
   CKNYG/OFLU/szC0zR6A2WNzWl7nEDNEmTIOVi0ihYap4T72OrFPf1zS3r
   6s3g+JXXhwhaOP8pGMnxq14u0i41EvR7/GtCl7aVro4kKXBzolEP1UGGA
   A==;
X-CSE-ConnectionGUID: CSmgk/QsSduC9RDQxuBWlQ==
X-CSE-MsgGUID: uRBdnFbwTcqbRp+M5ZtNQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="191193461"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="191193461"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:57 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 643E1D500F
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 29DA4F99A
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C0B691A006C;
	Wed, 26 Feb 2025 07:24:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 16/51] libtalloc: upgrade 2.4.2 -> 2.4.3
Date: Wed, 26 Feb 2025 07:24:06 +0800
Message-Id: <1740525881-21103-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115616

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtalloc/{libtalloc_2.4.2.bb => libtalloc_2.4.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.4.2.bb => libtalloc_2.4.3.bb} (96%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
similarity index 96%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
index b617f097cf..e20a6a4b14 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.2.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.3.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://0002-Fix-pyext_PATTERN-for-cross-compilation.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "85ecf9e465e20f98f9950a52e9a411e14320bc555fa257d87697b7e7a9b1d8a6"
+SRC_URI[sha256sum] = "dc46c40b9f46bb34dd97fe41f548b0e8b247b77a918576733c528e83abd854dd"
 
 inherit waf-samba pkgconfig ptest
 
-- 
2.43.0


