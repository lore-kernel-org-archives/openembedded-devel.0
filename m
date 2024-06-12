Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B69C27C79
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:59:08 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.2495.1718161135947040611
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QPcVr/cq;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161139; x=1749697139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6aBXWTo9NgFlqFNcLxaC8kkndwouNOrZFB59PTujdQ8=;
  b=QPcVr/cqmVF+WQNXPSbKPSAZ8Is+HjPnDm3wZ/RKPzQ4FYbyIFDJ80kD
   8im61KzCD9deg5Z8IlEyV/RchWVvOuktZgyDEY0uMfKbIUK81xmF8WH7A
   NKTAPp7ZMxiZuByBpS7sB84W3fmavqqxPieIXvHClMh7JISvpdaFy4Cy4
   0PwbhdARrD7oQZpYq0nVPUO0Z0v9TIGbPGh648qBH813PgTnFb1JAECA5
   PgEMiUJOQN9PxrJs30n9FZRGJCuKUyInn7B0z7rxwdtBpjM3p4yGyGnvA
   8+TS0b/52et9W3ADO40e5+kM4+goxFni/GgjbeoahQAEIhhOPN5VXyijZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="141806765"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="141806765"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:58 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AB0CFD9227
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E6471D8AE6
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7FB26E2917
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1083C1A000C;
	Wed, 12 Jun 2024 10:58:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 43/43] usbredir: upgrade 0.13.0 -> 0.14.0
Date: Wed, 12 Jun 2024 10:58:16 +0800
Message-Id: <1718161096-29710-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-1.117000-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv+Aw16GgqpO2Rl
	vEY1J5OICqIlUwwPgeyoRfmzONNsP69LXqtHL0cwA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLeBzEkCCpnRmVd49c0zgWM8BDOqHwPghjmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZIeIGZrh8S6FJPfDDoeJXjq8Q6vo93wF5crQqExOApAM5Qiv
	LXYuEDBZKWiV4doWR6q/8eVoOOjtQe6YuBaO2JxqB7t4Fzb+IVLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110878

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- usbredirect: Fix redirecting identical devices
- usbredirect: Fix CPU tight loop when run as TCP server
- usbredirect: Fix some minor memory leaks
- usbredirect: Add documentation about bus-device option
- usbredirtestclient: Fix build on MacOS 10.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../spice/{usbredir_0.13.0.bb => usbredir_0.14.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/spice/{usbredir_0.13.0.bb => usbredir_0.14.0.bb} (89%)

diff --git a/meta-networking/recipes-support/spice/usbredir_0.13.0.bb b/meta-networking/recipes-support/spice/usbredir_0.14.0.bb
similarity index 89%
rename from meta-networking/recipes-support/spice/usbredir_0.13.0.bb
rename to meta-networking/recipes-support/spice/usbredir_0.14.0.bb
index 3a73f9b18..82f48ccdb 100644
--- a/meta-networking/recipes-support/spice/usbredir_0.13.0.bb
+++ b/meta-networking/recipes-support/spice/usbredir_0.14.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 DEPENDS = "libusb1 glib-2.0"
 
-SRCREV = "5fc0e1c43194d948545941d408f4c10d084eb6ed"
+SRCREV = "2d373432e604960c1dcc14fb97098febe4d64025"
 
 SRC_URI = "git://gitlab.freedesktop.org/spice/usbredir;branch=main;protocol=https"
 
-- 
2.34.1


