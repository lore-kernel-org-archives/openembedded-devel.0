Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850F3C54756
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:02 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.8727.1724833557599899093
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IgKA8jCL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833558; x=1756369558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=twt0uDAOxuR9ERw0sFV9ByP8wrkgL6U/amgcGfX0r+s=;
  b=IgKA8jCLHNrm3WFYZW7Hfmq8+84oF2XA8YR+g3zcLI8Lkbvj98GI1Ulc
   nJHIEq58z4O/AaE44Dqxp+UU++U6Vm8FOluLEPO+ishL/wzalTInDGZyY
   5tbRkDThWwUn/Y8zOUk2s2fWO9OJEXw5T7ohs4PYBKPBZtOketuDSEvRI
   V+z86fBX/jJKxyDvJYWLyQf0S72JMMc0nb8oEceBC9ZoH43I59QsNQpw8
   ya4Dit+qE3WXr3C+cmHz2GzcqbkZCCj3HCHOzyE+Cx6mj7ji260zRdA5z
   aHcdBQn/ESOcos1TA23aFbYH3qGrIhlErEavoIO9Bkg70+Hi0fXKtdWRI
   w==;
X-CSE-ConnectionGUID: eMGOgrpnTQu6sVe6hUVF3A==
X-CSE-MsgGUID: V301oRGqQzykmcLOpwuHDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="151342548"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="151342548"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:56 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 82FE7E428A
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CC7FACFA5C
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 21C116BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BF9981A0002;
	Wed, 28 Aug 2024 16:25:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/46] python3-sqlalchemy: upgrade 2.0.31 -> 2.0.32
Date: Wed, 28 Aug 2024 16:25:14 +0800
Message-Id: <1724833525-2162-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-1.400200-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSAKo7vFXsOIEr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Br9+Kgn2XgeEukIs3g1Hje1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dIBpRCTkRk5SfoLR4+zsDTtCQvlWYtoEBHOT+
	GkDO8KF6iGApKWkBwtwV1+YT5Y5zFs2mgYuymbc2TZ+od7EKlHUSX8rtn0c86PDWNLU67TOjO/v
	Tmzchi22q7ZtBt2FK/yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112013

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.32

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_2.0.31.bb => python3-sqlalchemy_2.0.32.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.31.bb => python3-sqlalchemy_2.0.32.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.31.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.32.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.31.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.32.bb
index a23a409b5..bb319d566 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.31.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.32.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c78b979ae6c20775a28a287d32092cbb"
 
-SRC_URI[sha256sum] = "b607489dd4a54de56984a0c7656247504bd5523d9d0ba799aef59d4add009484"
+SRC_URI[sha256sum] = "c1b88cc8b02b6a5f0efb0345a03672d4c897dc7d92585176f88c67346f565ea8"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.34.1


