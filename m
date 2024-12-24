Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92340E7718E
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:20 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.30502.1735032438455142389
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BIgpgBdr;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032439; x=1766568439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=G5TnuSwb/mvrfL/ouTpgYUf8OCqJmsi0KczgXPTB4GI=;
  b=BIgpgBdrBBJ2qf55daCpcjJImRR3+UARj1/j5999J4oOfu+Q17Tfxdyv
   M3wGa8MexvB48ZPgtC1+FdQsN3OwW0+riuujGn25MColRtVId9IrF/AEr
   JavBK7j6VJ6p4LcwaYrPWQG7OY1Z0QwecChbclRo0sbk7HFX8HrBZVnKO
   pyetjq997hsulE20VHfEae02DPciWLlttUgy6+u3RieSV086kMV9yjZZv
   Gmrz/ND751ZzLZzsmQ4885qFBnF1pQDCX1ek7tntUqqWmLc1vb2QhWHBh
   0j9Nlwqmf2WW4YlIDhrbjH7oBUFjMYgKPYGvXl/qE2dkQQfCHoRGYuwew
   g==;
X-CSE-ConnectionGUID: UNgtuX3sQqWdZyD02Nl+hQ==
X-CSE-MsgGUID: yrRMv+gwTZ+zU9UjOLD4fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="164248046"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="164248046"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:17 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 19529DBB87
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DDD29D5B42
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 62C1620071A3A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:13 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0873E1A006C;
	Tue, 24 Dec 2024 17:27:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 02/67] libcapture-tiny-perl: upgrade 0.48 -> 0.50
Date: Tue, 24 Dec 2024 17:25:56 +0800
Message-Id: <1735032421-13513-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-1.116500-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yaoXHZz/dXlx+jvxoJvICJkH4DTIEE89jHiR
	8N4veKk9SUQWNWP9oCx2TdMGhtDwkO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+
	EY120A3q4mvl5MJqKUcFbFOtYZ9NB4nM8SgEQxQqeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDu2SAeoumr/CZznc8U+4mCixwjU/gCTcKrZbx0gJF8W44iZvZRXZ9EuKYsd6YcfE3dV3f
	ealFVHAVKJHky0LrSCwDy/0nwXjPoK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114475

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: add year and name of copyright owner

Changelog:
==========
- Stringify '$]' for far future compatibility.
- Fixed docs about custom files for capture

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...capture-tiny-perl_0.48.bb => libcapture-tiny-perl_0.50.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcapture/{libcapture-tiny-perl_0.48.bb => libcapture-tiny-perl_0.50.bb} (89%)

diff --git a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.50.bb
similarity index 89%
rename from meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
rename to meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.50.bb
index e37101d726..7154a18788 100644
--- a/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.48.bb
+++ b/meta-perl/recipes-perl/libcapture/libcapture-tiny-perl_0.50.bb
@@ -11,11 +11,11 @@ SECTION = "libs"
 HOMEPAGE = "https://metacpan.org/dist/Capture-Tiny"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=37a4918a30ace24395020e5b8c03b83f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dc7698cd2954eda44d2b50be647784f8"
 
 SRCNAME = "Capture-Tiny"
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DAGOLDEN/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "6c23113e87bad393308c90a207013e505f659274736638d8c79bac9c67cc3e19"
+SRC_URI[sha256sum] = "ca6e8d7ce7471c2be54e1009f64c367d7ee233a2894cacf52ebe6f53b04e81e5"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.43.0


