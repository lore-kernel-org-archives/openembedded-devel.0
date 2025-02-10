Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938D4C021A3
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:01:56 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.46623.1739178114780922744
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sQbYtGxR;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178115; x=1770714115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UTtj3s121yW0KeiKRH5kHIzYVuBYnpDHv89/My26gg0=;
  b=sQbYtGxRbY3fed/PDL51nf17SChi+fq4wxRNPP4nscZjN43Ex8Un1iXR
   HSaHghLvXM9F69bSEmEscIemL+QkR3KZPnxDFVt23L43p03jc0wADqZMq
   EXlOJH+p6LOUK/ahkz73ozZSk4exN2pLkk7P0S3qHrlHmcsJEJ0vyp66p
   sgS45gxJM0/Z0WCFYZrkublglr7fcpx82YY9cSOipUrY836qxoL0OCkac
   rD5Mg7+digLAhGMxu7bFrb/ANHcYUTXmvMMrqOVJ0IiX9nzbD1T8DPUpc
   4kDtGQQijUqw/jH+IW0v80juGceO0MNmoTmHtOR/qH9I+7b9jNdn5wI2R
   w==;
X-CSE-ConnectionGUID: Bgfo3eCGQ+KEyEyyIYlDzA==
X-CSE-MsgGUID: 6agOjKWWTZWBR1xuA7uhqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="192032028"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="192032028"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:53 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B2EBBD4F55
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 78204D3F09
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:49 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1AE5E1A000B;
	Mon, 10 Feb 2025 17:01:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/66] libmxml: upgrade 4.0.3 -> 4.0.4
Date: Mon, 10 Feb 2025 17:00:40 +0800
Message-Id: <1739178095-26432-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115341

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added Linux-specific build files and dropped unused 'long long' config tests
- Documentation fixes
- Fixed an issue when reporting errors with a 'NULL' options pointer
- Fixed some compiler warnings
- Fixed installation on MingW

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libmxml/{libmxml_4.0.3.bb => libmxml_4.0.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libmxml/{libmxml_4.0.3.bb => libmxml_4.0.4.bb} (95%)

diff --git a/meta-oe/recipes-support/libmxml/libmxml_4.0.3.bb b/meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb
similarity index 95%
rename from meta-oe/recipes-support/libmxml/libmxml_4.0.3.bb
rename to meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb
index 54582e7047..a271b697cd 100644
--- a/meta-oe/recipes-support/libmxml/libmxml_4.0.3.bb
+++ b/meta-oe/recipes-support/libmxml/libmxml_4.0.4.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://www.msweet.org/mxml/"
 BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
 
 SRC_URI = "git://github.com/michaelrsweet/mxml.git;branch=master;protocol=https"
-SRCREV = "804c4f4d922e4ca240ce2cad3ec7bc5d00c08691"
+SRCREV = "0d5afc4278d7a336d554602b951c2979c3f8f296"
 S = "${WORKDIR}/git"
 
 # Package does not support out of tree builds.
-- 
2.43.0


