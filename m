Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06A6EB64DC
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:24 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.7463.1687850057592469226
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="110615704"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="110615704"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:15 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 17DD9F0760
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:13 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D134D5C41
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 57C9088D20;
	Tue, 27 Jun 2023 16:14:11 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libzip: upgrade 1.9.2 -> 1.10.0
Date: Tue, 27 Jun 2023 15:12:03 +0800
Message-Id: <1687849939-19941-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10--1.787700-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwghjHWMqmY5LqQ
	ldU8NEzpRLeU4XG6FGWZT8nmZo9idz+wOpps1LJAkYD8wAZKsSAytf6nW43O0HYdkYOuyxVSuJE
	UmdYPGSXEFeiN2zKWKT1/zOJeFqtY0NhPFaxdwCXwbwIBMSBLpg/juoYMRF1/PJ29SD5V9Ka+qc
	W0zo2r8vu0HEWlaGvJxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+A+KgiyLtJrSC8awBtjpu6djosL
	f1kH5CfXAmWj4MrPIejMDj0f9ZRSq1i/8UCZ5uOngIgpj8eDcBpkajQR5gb3qbj/c4OO+6RKrau
	Xd3MZDV4pbUbGV6Pt/ONsZ6+Fg1VvDH/WYdT5BjQJ1pctxEVW54os0YogIiyhdHTxz7jbe0x4TO
	lRHsw3rFEPvqTur+PnwEp4nka5nljgo81taOvxFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLW
	lXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103597

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Make support for layered sources public.
* Add `zip_source_zip_file` and `zip_source_zip_file_create`, deprecate `zip_source_zip` and `zip_source_zip_create`.
* Allow reading changed file data.
* Fix handling of files of size 4294967295.
* `zipmerge`: copy extra fields.
* `zipmerge`: add option to keep files uncompressed.
* Switch test framework to use nihtest instead of Perl.
* Fix reading/writing compressed data with buffers > 4GiB.
* Restore support for torrentzip.
* Add warnings when using deprecated functions.
* Allow keeping files for empty archives.
* Support mbedTLS>=3.3.0.
* Support OpenSSL 3.
* Use ISO C secure library functions, if available.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libzip/{libzip_1.9.2.bb => libzip_1.10.0.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libzip/{libzip_1.9.2.bb => libzip_1.10.0.bb} (92%)

diff --git a/meta-oe/recipes-extended/libzip/libzip_1.9.2.bb b/meta-oe/recipes-extended/libzip/libzip_1.10.0.bb
similarity index 92%
rename from meta-oe/recipes-extended/libzip/libzip_1.9.2.bb
rename to meta-oe/recipes-extended/libzip/libzip_1.10.0.bb
index 7fb58de3c1..e8aa7fdc07 100644
--- a/meta-oe/recipes-extended/libzip/libzip_1.9.2.bb
+++ b/meta-oe/recipes-extended/libzip/libzip_1.10.0.bb
@@ -21,7 +21,7 @@ inherit cmake
 
 SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "c93e9852b7b2dc931197831438fee5295976ee0ba24f8524a8907be5c2ba5937"
+SRC_URI[sha256sum] = "cd2a7ac9f1fb5bfa6218272d9929955dc7237515bba6e14b5ad0e1d1e2212b43"
 
 # Patch for CVE-2017-12858 is applied in version 1.2.0.
 CVE_CHECK_IGNORE += "CVE-2017-12858"
-- 
2.34.1


