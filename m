Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57894C30653
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 09:08:02 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.3772.1719479280282617904
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 02:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fTBnhju8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719479280; x=1751015280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=lNbL9gJimFU85L75R3/kBrCI/EqvKNu+mOY6PtGu40s=;
  b=fTBnhju8EeQOg6cSg5ooypCkh6aLmpgQA+QOdmM/5dnhXSz8X9lAolPU
   Dtg6TVgG0ahv2Ix3RuP7Gb2rfCqvSGX68L/n7Ceu85GfAPVehDsYhu7iJ
   rUnIlhrtOsKn3rpm5hTzktD+g/EYAgixzn87zh8+1FwI+Yd8iEeAjj5jY
   nRapiOxYlGgXkpM+7tCZhuR0CzOb8A1v4Wj8YJQVneAxqfdTKuulGIXHV
   bI2VoGZ+jk4o3Lo5I71BqfXILqqlP5StdI4110ajKgu7KKpf0rrLOvCY7
   hoVjy0bGu0fSvshdxO2QbRHgjRQck13kvdbZnYDi+EAAojpRuMg+6PDXd
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="144561064"
X-IronPort-AV: E=Sophos;i="6.08,269,1712588400"; 
   d="scan'208";a="144561064"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 18:07:57 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9FD49D6473
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 18:07:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E3759BDC9E
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 18:07:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D74641191
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 18:07:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2DBA71A0002;
	Thu, 27 Jun 2024 17:07:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 2/2] openct: fix build failure with gcc-14
Date: Thu, 27 Jun 2024 17:07:49 +0800
Message-Id: <1719479269-11512-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719479269-11512-1-git-send-email-wangmy@fujitsu.com>
References: <1719479269-11512-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28484.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28484.006
X-TMASE-Result: 10--4.567900-10.000000
X-TMASE-MatchedRID: S05r5h69z2Is0w7LCKZc9jo39wOA02LhRzUPAqhCjtg6FHRWx2FGsOvn
	/O99cHKFNiNu3oEpxISaernOJKdgiK/Elphzpf1LEXjPIvKd74BSuvtBzlaEqDUvQN19brjgzv0
	+UmYCZcNZk01J3c7PASDLhawxlpdk3UVz9IzbDMSp3Btb1bH20I5UafLmrvaGRLL5tnjOOSFdaO
	8DxOlYWMR8uH5v1UzhgDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyJXpw57DOVU/DONaoF+2Gu7+un
	jrNKYsUhgPnBagJ+sgQxGcAzwX3pXpjjnDyb2SPNogu5RCn/ZPRMl+cv7d3BhTz/3xM4U1f/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 09:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111122

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...e-pointer-type-error-with-gcc-option.patch | 65 +++++++++++++++++++
 .../recipes-support/openct/openct_0.6.20.bb   |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-support/openct/openct/0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch

diff --git a/meta-oe/recipes-support/openct/openct/0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch b/meta-oe/recipes-support/openct/openct/0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch
new file mode 100644
index 000000000..73c9d0666
--- /dev/null
+++ b/meta-oe/recipes-support/openct/openct/0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch
@@ -0,0 +1,65 @@
+From c4351058da555e1e6a2b4b15d913baee80f55865 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Thu, 27 Jun 2024 06:27:18 +0000
+Subject: Fix incompatible pointer type error with gcc option 
+ -Wincompatible-pointer-types
+
+| ../../../openct-0.6.20/src/ifd/ifdhandler.c: In function 'ifdhandler_run':
+| ../../../openct-0.6.20/src/ifd/ifdhandler.c:239:52: error: passing argument 2 of 'ifd_get_eventfd' from incompatible pointer type [-Wincompatible-pointer-types]
+|   239 |                 sock->fd = ifd_get_eventfd(reader, &sock->events);
+|       |                                                    ^~~~~~~~~~~~~
+|       |                                                    |
+|       |                                                    int *
+| In file included from ../../../openct-0.6.20/src/ifd/internal.h:17,
+|                  from ../../../openct-0.6.20/src/ifd/ifdhandler.c:7:
+| ../../../openct-0.6.20/src/include/openct/ifd.h:182:65: note: expected 'short int *' but argument is of type 'int *'
+|   182 | extern int                      ifd_get_eventfd(ifd_reader_t *, short *);
+|       |                                                                 ^~~~~~~
+
+| ../../../openct-0.6.20/src/ifd/process.c: In function 'do_memory_write':
+| ../../../openct-0.6.20/src/ifd/process.c:461:61: error: passing argument 4 of 'ct_tlv_get_opaque' from incompatible pointer type [-Wincompatible-pointer-types]
+|   461 |             || !ct_tlv_get_opaque(args, CT_TAG_DATA, &data, &data_len))
+|       |                                                             ^~~~~~~~~
+|       |                                                             |
+|       |                                                             unsigned int *
+| In file included from ../../../openct-0.6.20/src/ifd/process.c:20:
+| ../../../openct-0.6.20/src/include/openct/tlv.h:40:62: note: expected 'size_t *' {aka 'long unsigned int *'} but argument is of type 'unsigned int *'
+|    40 |                                 ifd_tag_t, unsigned char **, size_t *);
+
+Upstream-Status: Submitted
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ src/ifd/ifdhandler.c | 2 +-
+ src/ifd/process.c    | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/ifd/ifdhandler.c b/src/ifd/ifdhandler.c
+index 12686c9..ebd1b53 100644
+--- a/src/ifd/ifdhandler.c
++++ b/src/ifd/ifdhandler.c
+@@ -236,7 +236,7 @@ static void ifdhandler_run(ifd_reader_t * reader)
+ 		sock->fd = -1;
+ 	}
+ 	else {
+-		sock->fd = ifd_get_eventfd(reader, &sock->events);
++		sock->fd = ifd_get_eventfd(reader, (short int *)&sock->events);
+ 	}
+ 	if (sock->fd == -1) {
+ 		ifd_debug(1, "events inactive for reader %s", reader->name);
+diff --git a/src/ifd/process.c b/src/ifd/process.c
+index 4563bdf..7088a76 100644
+--- a/src/ifd/process.c
++++ b/src/ifd/process.c
+@@ -458,7 +458,7 @@ static int do_memory_write(ifd_reader_t * reader, int unit,
+ 		return IFD_ERROR_INVALID_SLOT;
+ 
+ 	if (ct_tlv_get_int(args, CT_TAG_ADDRESS, &address) == 0
+-	    || !ct_tlv_get_opaque(args, CT_TAG_DATA, &data, &data_len))
++	    || !ct_tlv_get_opaque(args, CT_TAG_DATA, &data, (size_t *)&data_len))
+ 		return IFD_ERROR_MISSING_ARG;
+ 
+ 	rc = ifd_card_write_memory(reader, unit, address, data, data_len);
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
index e4b99089f..e013fb26e 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://openct.init \
     file://openct.sysconfig \
     file://openct.service \
+    file://0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch \
 "
 
 SRC_URI[md5sum] = "a1da3358ab798f1cb9232f1dbababc21"
-- 
2.34.1


