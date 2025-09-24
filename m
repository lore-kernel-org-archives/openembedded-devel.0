Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCBECAC5BB
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.8226.1758704439377690112
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pTfA7I9X;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704441; x=1790240441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bdSUPNWs2bZSyRd+bbizLOvKysNrfrtmWOjCBnDCUDE=;
  b=pTfA7I9XPc8GMBY2IIUZCet/T00eKN76qJFlYXv9sADCBzrwxs81AGYa
   /j69wRBYHKVlqyBSDyVYJBhskZOHFn/dyzdQJQEN5l2dQp75jvx1U71R9
   91cp3HO1L/JGpVbvzHAbVkyaatrcTIlTNm17Xhu+dyduZvxXsRNWW0lLw
   o6ZD0DCOwub8V/dguv3tYqZ67vH7XRTGClWb+iAvTxvAqxRG+MPR0hP1p
   3OD84QNWz5MMzFoML886fl0t4WaQg3i8hDpnFdWbzK3O5fHdwouvcKEhJ
   /UpSc+nJnYtEgtXsZEuJUo/svX/9YC/VkLZv/qHmL0dwLw1kAqy5j11o8
   Q==;
X-CSE-ConnectionGUID: okxMAYciTbyHDre1qBNIJw==
X-CSE-MsgGUID: GjEmv7H+SYCrmQ2uBe21lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="192706864"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="192706864"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:40 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 89BEF1002BAA
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:40 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 436198D6F8C
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:40 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id BAC33404680;
	Wed, 24 Sep 2025 09:00:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 684A61A008A;
	Wed, 24 Sep 2025 17:00:34 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/29] inotify-tools: upgrade 4.23.9.0 -> 4.25.9.0
Date: Wed, 24 Sep 2025 17:00:07 +0800
Message-ID: <20250924090029.1786-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119768

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{inotify-tools_4.23.9.0.bb => inotify-tools_4.25.9.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/inotify-tools/{inotify-tools_4.23.9.0.bb => inotify-tools_4.25.9.0.bb} (92%)

diff --git a/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb b/meta-oe/recipes-support/inotify-tools/inotify-tools_4.25.9.0.bb
similarity index 92%
rename from meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb
rename to meta-oe/recipes-support/inotify-tools/inotify-tools_4.25.9.0.bb
index cb77dc81b0..a107925ce1 100644
--- a/meta-oe/recipes-support/inotify-tools/inotify-tools_4.23.9.0.bb
+++ b/meta-oe/recipes-support/inotify-tools/inotify-tools_4.25.9.0.bb
@@ -4,7 +4,7 @@ SECTION = "console/devel"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ac6c26e52aea428ee7f56dc2c56424c6"
 
-SRCREV = "5c2ab772338bcbe516306bf8cf1059ddf2fa6bb7"
+SRCREV = "81c6c9881edf4844f2b8250e63f82da9cb7f5444"
 
 SRC_URI = "git://github.com/${BPN}/${BPN};branch=master;protocol=https \
            "
-- 
2.43.0


