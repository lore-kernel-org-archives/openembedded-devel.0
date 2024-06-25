Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC12C38150
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:15 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.166850.1719305823566395119
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BVPRD9hD;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305825; x=1750841825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JZPUb3BJwIuWmwC0IjJ3rl7Aedlx/Anxs5ThQCQ9Q3o=;
  b=BVPRD9hD5+CSZ+NXRkWa4K91BmdsdjNfZIDlL+9lUYUSViFyV+mQgc7f
   xIz6e2ItjSfSCwzaePAEfGNvEMSvXyFpbYX2rmPvq5zwCZ2dKNmOmHGQn
   aa69ezg3U2eI+XKLbZnvH696jIuG7jHfOuSPGUXCLq/DTjr2orJyo054Z
   c8+KRi2DQg3yxNoqSHYh/ZoHIMgUxGutaSUXFWHKljBkXzwZQZnpWhRjc
   hphwM5mPiupTwKpVjH5oMdxpGZzDZP0mAtIg5WXRv8SDYA01esSltYMIg
   LpTOk0y3IByJB2aDtwPDqVdFDvDJJOmR7yH7xqkwytEo4SkRZWxWs1tMv
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="153145158"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="153145158"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:04 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B13F0D424F
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:02 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 01CAED8AFE
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 71EFFE2A0B
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1FB2F1A0002;
	Tue, 25 Jun 2024 16:56:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 12/57] libcrypt-openssl-random-perl: upgrade 0.16 -> 0.17
Date: Tue, 25 Jun 2024 16:55:45 +0800
Message-Id: <1719305790-11484-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-1.515900-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrTfK5j0EZbys1a43ksVK2hX/d
	9E1ifIV7JMWwj3LdYKfXLt4PUEqpmTbcsMCH+ZLFA9lly13c/gEohquWh8Y7agfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmiN/pmQg8J7XLcgUVP3Cp+vfNYQxCOihTNYA3qL69rXq7Sn0
	NplHOg3f8pW19mJIOmiSBtKT/MiwYfE8yM4pjsDxZ4ylU2GwzAxEHRux+uk8hxKpvEGAbTDhDaO
	4jh8dPeSeVB0EnPqvgSFyTenChaa5tw8IXEYjVpzlZUf1FsYtDsFklhSioLyKvVC3zd0FlxpNLK
	cq6FTYj4WqrpMWotOYK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111030

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- fix older aix with missing -lz dependencies
- minor ci fixes

License-Update:
 "(Some other Free Software Foundation software is covered by the GNU Library General Public License instead.)"
 removed from license file.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ndom-perl_0.16.bb => libcrypt-openssl-random-perl_0.17.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-random-perl_0.16.bb => libcrypt-openssl-random-perl_0.17.bb} (82%)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.16.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.17.bb
similarity index 82%
rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.16.bb
rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.17.bb
index dc2075d13..c15d41713 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.16.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-random-perl_0.17.bb
@@ -2,10 +2,10 @@ SUMMARY = "Crypt::OpenSSL::Random - OpenSSL/LibreSSL pseudo-random number genera
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=089c18d635ae273e1727ec385e64063b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9e876d4149406d88b4ff1b37645363ad"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-Random-${PV}.tar.gz "
-SRC_URI[sha256sum] = "fcf58cb2af4c3eda2fe1405527d9373efe9576268fce8adb34df9ce9b6b44d1e"
+SRC_URI[sha256sum] = "a571b24181baaa76c96704e92acffc6934ff593e380dade274db4e43c140ad51"
 
 S = "${WORKDIR}/Crypt-OpenSSL-Random-${PV}"
 
-- 
2.34.1


