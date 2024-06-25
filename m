Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D461C30653
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:04 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.167222.1719305823573911933
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sRw0lhe5;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305823; x=1750841823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7S/R1Rs55hkdeHPIo6l6Gt+8r/Bq3YxOCPU5OI1iCsU=;
  b=sRw0lhe53HHHd1J0K570NVNPzfH+5H7nNZ3027/sZswR2HfaXVCoTS5r
   a89wKKaP+VT7A/sAyz0o+4/c7n0/GeSYzto9k5lcggU6Uj6ElCKw+i4De
   Ne6jHqQyWPxNEoFVQG35mBiWIr7F/VueGC9DPfgC3V+Gh82QayakOZOwu
   oJnivBjyEIrpbJDWsVU1Xm6ftFNRqFSiIuJWOEnn1I2yqD67SzLvCDFYp
   RKwoY+hI5L0Lmqhuloe2v5W+ED/sLgvGiqQuv0sFuz123FLwUrcpOyonh
   SWjInSIdin0nyNP+U64UoxsDtXDvBe9m1ixeSDKMRcjYaz5KmDlG9Ccw6
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="152254677"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="152254677"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:01 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E180BD6473
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 36A95BF3D7
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C1EADE2B14
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6FDC41A0002;
	Tue, 25 Jun 2024 16:56:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 14/57] libextutils-helpers-perl: upgrade 0.026 -> 0.027
Date: Tue, 25 Jun 2024 16:55:47 +0800
Message-Id: <1719305790-11484-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-0.233500-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr0VvRkjCHhK6U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3IFFT9wqfr1r9+Kgn2XgeImv//9w5w6heVs
	0skyEaS2BkESMI05d4uuLFZZYlisfHxPMjOKY7A8WeMpVNhsMwMRB0bsfrpPIcSqbxBgG0w7ZT7
	QzkxZKynO34yU/DQMLblIiHjWR6XaKgdiP/waWQFA08aOjo4ao115yjXqBRtjUcY3/81BpWKj05
	/ucPkF33YfGTnoEMaWCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111025

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 - Revert "Make split_like_shell always unixy"

License-Update:
 modify format
 update Artistic License 1.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...lpers-perl_0.026.bb => libextutils-helpers-perl_0.027.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-helpers-perl_0.026.bb => libextutils-helpers-perl_0.027.bb} (80%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.026.bb b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.027.bb
similarity index 80%
rename from meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.026.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.027.bb
index 8534822e6..69f246b33 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.026.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-helpers-perl_0.027.bb
@@ -5,11 +5,10 @@ SECTION = "libs"
 HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-Helpers/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=223c04045664f72c3a6556462612bddd"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c0280160e4f26faafef507664884bf63"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-Helpers-${PV}.tar.gz"
-SRC_URI[md5sum] = "83b00c1e401321c425ae5db6b2b2fd12"
-SRC_URI[sha256sum] = "de901b6790a4557cf4ec908149e035783b125bf115eb9640feb1bc1c24c33416"
+SRC_URI[sha256sum] = "9d592131dc5845a86dc28be9143f764e73cb62db06fedf50a895be1324b6cec5"
 
 S = "${WORKDIR}/ExtUtils-Helpers-${PV}"
 
-- 
2.34.1


