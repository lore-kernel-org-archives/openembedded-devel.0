Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338DCC0219D
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:32 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.30365.1735032445892108500
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ak8WDmra;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032450; x=1766568450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IzZ21A5Lmn6Xv92A9GaS9Yov/rQRec+nimLLC4B2x84=;
  b=ak8WDmrass+amG45vTDAiHzrwyYgPl1NYcyl+lCQG6QDXGkWly0J/8LM
   +WmfOvfYTCKgAJgQUKJeZgfjAEHp/uZLIEBjmjIe+b7sO1oi1Tc4+97e/
   hr9S+ur7abpCKRh3JmDECXYZ4pgzWmndiF/NXvhy/6ruM2e0Qb9we1oXy
   M399pW4CvwiQkicBsb6L+hYNHHPxkl7S3IKGxqPlFzmwxAQw53RTEEGGv
   Wvr2Yskhq1jAURlmDlua/pJC3xt3gWlXDdvA7WkU/zsx1CkkQKFlVY3Zm
   GlM7Yaw/KqvEYq+hb50RNt4cxeuVzTjeugWI/n9PFpCxR68OZSGGenPYH
   A==;
X-CSE-ConnectionGUID: +gDnZB0KQk6lexeAgvnjrQ==
X-CSE-MsgGUID: 33hvEPArTXid0Ia7cBJa/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="163677418"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="163677418"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:29 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 74D7BE8525
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4A444D5096
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D0BEB6BB64
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:26 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 961D41A006C;
	Tue, 24 Dec 2024 17:27:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 56/67] python3-schedule: upgrade 1.2.1 -> 1.2.2
Date: Tue, 24 Dec 2024 17:26:50 +0800
Message-Id: <1735032421-13513-56-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-0.276900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysR/noA8sNkvc1y
	AQzkcdXPXr7NXg/pSgQM3mca5V43C+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1AYUFsN5WfiFlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2W79
	Uq8KMo9UK0W4+LdJPf8kXtfQmN0Y19P0zWJYY1xvlHe7e+5exompyo015Rq4baiJhupW0AvevDx
	gummHsfm8UKOo+MNmxL8m6Kl7usV/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114527

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix bugs in cross-timezone scheduling
- Add support for python 3.12
- Remove dependency on old mock

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-schedule_1.2.1.bb => python3-schedule_1.2.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-schedule_1.2.1.bb => python3-schedule_1.2.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-schedule_1.2.1.bb b/meta-python/recipes-devtools/python/python3-schedule_1.2.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-schedule_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-schedule_1.2.2.bb
index 6ebde30e61..ecf6bfd4c1 100644
--- a/meta-python/recipes-devtools/python/python3-schedule_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-schedule_1.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/dbader/schedule"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6400f153491d45ea3459761627ca24b2"
 
-SRC_URI[sha256sum] = "843bc0538b99c93f02b8b50e3e39886c06f2d003b24f48e1aa4cadfa3f341279"
+SRC_URI[sha256sum] = "15fe9c75fe5fd9b9627f3f19cc0ef1420508f9f9a46f45cd0769ef75ede5f0b7"
 
 inherit pypi setuptools3
 
-- 
2.43.0


