Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278C3C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 08:49:09 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.5300.1716367740939114261
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 May 2024 01:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qHCCH3/N;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716367741; x=1747903741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xBuWLS1++PgbxmOsv+qQv5BXaS9ajM2lCVdRMnpcy78=;
  b=qHCCH3/N4VrPUwukk856sjbhLPK0phwm7m8qCRz+U3RzPcNl3LzMsM5a
   5+QPq4KQNHhrCAlrIGZ4xIWGJSI9aDsY9x3tiAfLMYGhw2c//Ya2/LMiS
   70ek4ot720EdggVJJHG1V7WEq1prjdfm+dfSzitEpnkVCjisFl346EJCU
   EhZm+7TyxAGyD2VrECKN3iFDwwif4tfiiq45iMHngXgmEApTt9Oj9/vX5
   DZuxwXfGygNzq2YqDGfMHx+xjXYm8oOVQZXP2za9pgiGWkDTRl8l9U4Ts
   wksx4Ty6dAm0GJUR7YlhlD+/o+hPddgHDXKJyNloO7sLUYhXQpQW1EWWE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="138354765"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="138354765"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 17:48:58 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D528D8003
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 17:48:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 987DCBDCA5
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 17:48:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3376A20097E68
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 17:48:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D46051A000B;
	Wed, 22 May 2024 16:48:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] fetchmail: Fix buildpaths warning.
Date: Wed, 22 May 2024 16:48:46 +0800
Message-Id: <1716367726-22329-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716367726-22329-1-git-send-email-wangmy@fujitsu.com>
References: <1716367726-22329-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10-0.725000-10.000000
X-TMASE-MatchedRID: RQY71aWwxlo6BiAI7o4CZvx0ykrbAxjCRzUPAqhCjtjAuQ0xDMaXkH4q
	tYI9sRE/GWtzbrhLRghw21dWyFoYdh8TzIzimOwP/hxxPCwzUoPEQdG7H66TyHEqm8QYBtMO4SZ
	MOwqwur0aL53DmLBHsx2MdVv4EpnGUvzvVkOK17IO4uSE6J4dq6lI9MnbZ8onO2kWe0caRxv9//
	rfuORipYMN9nQeJyMIgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 08:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110480

From: Wang Mingyu <wangmy@fujitsu.com>

WARNING: fetchmail-6.4.38-r0 do_package_qa: QA Issue: File /usr/bin/fetchmail in package fetchmail contains reference to TMPDIR [buildpaths]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
index 587a47949..6cde94b20 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
@@ -18,8 +18,11 @@ inherit autotools gettext pkgconfig python3-dir python3native
 
 EXTRA_OECONF = "--with-ssl=${STAGING_DIR_HOST}${prefix}"
 
+INSANE_SKIP:${PN} = "already-stripped"
+
 do_install:append() {
     sed -i 's,${RECIPE_SYSROOT_NATIVE},,g' ${D}${bindir}/fetchmailconf
+    sed -i 's,${RECIPE_SYSROOT},,g' ${D}${bindir}/fetchmail
 }
 
 PACKAGES =+ "fetchmail-python"
-- 
2.34.1


