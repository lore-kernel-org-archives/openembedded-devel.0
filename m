Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94556CFC50A
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:03 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.50330.1728896158310042178
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qzTZtKIn;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896160; x=1760432160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SooVGXauEE0xLIA+PJAx2VbHY/MAK7nzW/Xs1uwjikg=;
  b=qzTZtKInXgb9l+O3gs3eWuFreAZEB5JrOfrjlL835AbYUPdqZDgK/MY+
   DcSE2IXgMeERYUvyrqUX2jRDAhTE3bG9fI49pZ5lbRMvjsdCVlMUm4Ved
   J8HmKMzfQpFqhamD4E/veXoRAYVHzCTTXYeqQJvLJ9lndrQTpJUfI1RZe
   XPXWEghwVOZz16enk7s1MS2TUtvgHPIGZFbeJRTizQxq3M6VwDH30og7G
   A2E5d6+fzpamcONPH1XnFSpJ1Fu/l/V566B7n8Il0fqtAX7AK8PrGC8dR
   xX3GnVjAS75CIF1xFjg98ABRYnmh8Ek/oKhVC+ZJXjpb/cNNvzVVtedHk
   A==;
X-CSE-ConnectionGUID: gJC07hFyS7WFLNojkQwxpQ==
X-CSE-MsgGUID: LVejMlHkQ8qpRwn4z9sF3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="165031659"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="165031659"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:55:59 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 024E5D4334
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 46B62BF3DE
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D7B7B200649DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:55:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9FBFB1A01E9;
	Mon, 14 Oct 2024 16:55:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/54] python3-argcomplete: upgrade 3.5.0 -> 3.5.1
Date: Mon, 14 Oct 2024 16:54:36 +0800
Message-Id: <1728896115-2944-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--1.026300-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOgyKXAUOPYkQQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXLmJ/FDisGNa9XfnjCmLC4LBD9SlvpUi0UMiL
	RzgA070hxwKzuzxMWtnRRIdkdnkDOkrZVpdhwP9ezgLoaV2DZmpoftZWW/K6v+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112860

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Restore compatibility with argparse in Python 3.12.7+

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-argcomplete_3.5.0.bb => python3-argcomplete_3.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.5.0.bb => python3-argcomplete_3.5.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.5.0.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.5.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.5.1.bb
index a5cf6298a..531399d36 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "4349400469dccfb7950bb60334a680c58d88699bff6159df61251878dc6bf74b"
+SRC_URI[sha256sum] = "eb1ee355aa2557bd3d0145de7b06b2a45b0ce461e1e7813f5d066039ab4177b4"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.34.1


