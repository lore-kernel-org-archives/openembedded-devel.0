Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB0CC3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:04 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.33824.1721034176768112774
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i9t3kjiS;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034176; x=1752570176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=r7NKCGT/3SPDZSx0RT/YqwPWP0H3XvS+ccyfN7I06Qk=;
  b=i9t3kjiSXx2Y5xTj2dIWLqqYTBa5r20layCvaEXjiYrbNvNMBrxeP0xv
   YrZiVtPXS9MCzVAaSFbtlWXEeqDmkwNxeQlKw7GjsWlsoKCQFZz5gnbXs
   VMLl6YgIM+OuFlCDv68CrNSoPs3t2uTjP7nDdo2fxzCkk/iIGldShl/jJ
   TDz6BU40lrdrFtRjjtaHcrbaHb5Hbgo0ZJZqjEBjYsHKUr4scr+k4iQBv
   +X66JU0IDwB7EiLne50rs3qv08fg2JLg9ZcMXk1m5ndSaX0p3HR2OEuYd
   vJ8aDYMk8hgYIO7ZFsQpVWfQHg/dJ2dVKTDqpbErkcvJ5U9ZHqB4MR0mv
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="145974551"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="145974551"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:53 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B702837100
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:51 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 03D2FEA42
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BF0720071A38
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 280D21A000A;
	Mon, 15 Jul 2024 17:02:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/38] ctags: upgrade 6.1.20240630.0 -> 6.1.20240714.0
Date: Mon, 15 Jul 2024 17:01:55 +0800
Message-Id: <1721034151-540-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrTzQRbt3MTJU6qyuEkN+BfWFGzLWqYIsdHstQFyHZEOjp37bNmcSjJDGRz
	AEuOa8dNZO8xkds+fKBQVPKhQXaBnn65QNDgmNuB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111324

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20240630.0.bb => ctags_6.1.20240714.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20240630.0.bb => ctags_6.1.20240714.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240630.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240714.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20240630.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20240714.0.bb
index 0416593c2..8474a90ff 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240630.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240714.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "050dcb938a8be98874f0a6f0afa9dd8cccb6527a"
+SRCREV = "e79e67dc64805a616725c3668ad7ec284de053ed"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


