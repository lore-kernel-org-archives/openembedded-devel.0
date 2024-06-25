Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CB1C30658
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:36 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.167239.1719305851066664531
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q4KWUDqi;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305855; x=1750841855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=mz68e9vbR0/J2kCL/kiGfmKR0q3kpcrIUNB6OYOHG3k=;
  b=q4KWUDqiPYF3yWjjNvyp4QXRt6w2idBxy0+GNlaFZ+6BSac3mpCfCn08
   7+PFDzxggsgFhUm8jierUtovxLKlWTFbXkG0hSfWodqnkJtOHaG5Nd46y
   KEok0wKiDuVp/D23FpTRG7ma2vQ1poHaAhnVOLW6YPkyVNnMItw3B8xuG
   4aPmSL9+I59NIBCY0TDw2EjkoGKxhBpXsbWZRbpFglpX0rg7KsOciMg9u
   9lamv9AVbI/rc3zuOskx9afUOwsdSCs3Dul9XYDcJvjdMhx/LuG/xS8MX
   foOxB40Q/qVfkkObYg36LAaTWGmtZExtdAGOoHlm/hxHudAMJRWiFl9Zu
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164960080"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164960080"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:34 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 206E3D6482
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FE72D8AF0
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D0CB52007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7F6D31A000C;
	Tue, 25 Jun 2024 16:57:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 51/57] python3-sqlalchemy: upgrade 2.0.30 -> 2.0.31
Date: Tue, 25 Jun 2024 16:56:24 +0800
Message-Id: <1719305790-11484-51-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-1.400200-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSAKo7vFXsOIEr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Br9+Kgn2XgeEukIs3g1Hje1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dIBpRCTkRk5SfoLR4+zsDTtfUeErNKFJifYCG
	XmBn3IeQ+KZY0+1CWxQ0dOIZT05Fnn0ZT3/dBaTWTZ+od7EKlHUSX8rtn0c86PDWNLU67TOjO/v
	Tmzchi22q7ZtBt2FK/yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111062

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.31

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_2.0.30.bb => python3-sqlalchemy_2.0.31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.30.bb => python3-sqlalchemy_2.0.31.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.30.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.31.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.30.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.31.bb
index 1a42aa1b4..a23a409b5 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.30.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.31.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c78b979ae6c20775a28a287d32092cbb"
 
-SRC_URI[sha256sum] = "2b1708916730f4830bc69d6f49d37f7698b5bd7530aca7f04f785f8849e95255"
+SRC_URI[sha256sum] = "b607489dd4a54de56984a0c7656247504bd5523d9d0ba799aef59d4add009484"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.34.1


