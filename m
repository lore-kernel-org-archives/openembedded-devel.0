Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981C5CF64A3
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:38 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.49297.1727682213960665763
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ewqfUxWF;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682213; x=1759218213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VrehSgGXIwFrfj6f56AqtZkxfi3TndlKyNqeGxN00Zg=;
  b=ewqfUxWFRplJ5jn5vWpPiiucBgJdhch9sMiDDW+2zis366bKw6RNX9ly
   xrcXtiG80aQ9CY76cdj1V5ulN02lhBf+LsOWAc86kKmocMMlc7JLV6os+
   C+YK71MJKo1H7/J8fbOHG5SH1ywWiopx7KcxL7i+aQGszNU6g72vRslcg
   35VrcyKxpROcBN0+LBoLrQDW0hm7rvUN2Hmb6LBvRbcLIH+Vg33GWY2JB
   d1G4vljfbPmpTMkjxZKCMdJ4kTQZUV/BWazVSA2h1jvXx3UJI/4NO/XqZ
   vCIe7IeVksAS9JREOcFa/ffI8n7qljaYnb1OiKWpMx3aq63qvycDvDNhb
   g==;
X-CSE-ConnectionGUID: L56lo+AVRAOz4oaE+cj2Bg==
X-CSE-MsgGUID: 6CI25c09SX6Jk3rvHkr9HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="175401305"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="175401305"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:31 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BFA11CA1E5
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CD800D8BCF
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E4AF2007B716
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2BA201A01ED;
	Mon, 30 Sep 2024 15:43:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/40] libzip: upgrade 1.10.1 -> 1.11.1
Date: Mon, 30 Sep 2024 15:42:31 +0800
Message-Id: <1727682185-12664-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--4.385200-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv7fZJfDdCIXOf0
	GHC0waAL4EXw14zmtrKZHmD2sOsnKM0Dkwsmw27fHWRJEfGP5nk30KSHUeaVmNGMGYFaxr1EcxZ
	+avxQRTyBFdTLd/2OxOxusWJlVLar6uzQ761p8bM5ZRbFNAl0j2ITUqKSBxojNdJaIF63RCG+qc
	W0zo2r8vu0HEWlaGvJxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+A+KgiyLtJrSDXJ9LzNSOcraPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrfuQNcxJMrzQPQcU9VHp6nNyDgkrb2jaYyWXwwhsu7giQAuf
	CuGcdXJMWqU3kZBQ/Uh5FxeQsw40awZNXbeHqsE70mjx5msEWx0m4Rm5hspVxSSu8i52URmXTt0
	OuyJi/IIuEVM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112565

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix zipconf.h for version number with missing third component.
* Stop searching after finding acceptable central directory, even if it
  contains inconsistencies.
* Only write Zip64 EOCD if fields don't fit in normal EOCD. Previously libzip
  also wrote it when any directory entry required Zip64.
* Allow bytes from 0x00-0x1F as UTF-8.
* Add new error code 'ZIP_ER_TRUNCATED_ZIP' for files that start with a valid
  local header signature.
* 'zipcmp': add '-T' option for comparing timestamps.
* 'zip_file_replace' now removes the target's extra field information.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libzip/{libzip_1.10.1.bb => libzip_1.11.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libzip/{libzip_1.10.1.bb => libzip_1.11.1.bb} (91%)

diff --git a/meta-oe/recipes-extended/libzip/libzip_1.10.1.bb b/meta-oe/recipes-extended/libzip/libzip_1.11.1.bb
similarity index 91%
rename from meta-oe/recipes-extended/libzip/libzip_1.10.1.bb
rename to meta-oe/recipes-extended/libzip/libzip_1.11.1.bb
index a314efc12..b1a0dd66c 100644
--- a/meta-oe/recipes-extended/libzip/libzip_1.10.1.bb
+++ b/meta-oe/recipes-extended/libzip/libzip_1.11.1.bb
@@ -21,6 +21,6 @@ inherit cmake
 
 SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "dc3c8d5b4c8bbd09626864f6bcf93de701540f761d76b85d7c7d710f4bd90318"
+SRC_URI[sha256sum] = "721e0e4e851073b508c243fd75eda04e4c5006158a900441de10ce274cc3b633"
 
 BBCLASSEXTEND += "native"
-- 
2.34.1


