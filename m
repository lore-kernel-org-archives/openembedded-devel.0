Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A51C3065D
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:26 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.167232.1719305838019027754
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kTmrK4ZO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305838; x=1750841838;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/W7FYl5Yq4QA7RFJrZt8QFYJEfYU0vCWVLKRVqMfVs0=;
  b=kTmrK4ZOTUldKFU8xU/9iN0NWMx6OBaEgvQzc3U3uZVk7Ynl8xrbkB/w
   TPrlNhK9HKDj28e2MV/3XgMICPQ9Y5PTWdzpja/ZLoL20nefVw7S92X3S
   BWsNySeQnVVaTeu8guTqVKmFBwN33LPy/ZnykPHVfQc9W+xHapbr4XEE3
   +ojarJgf6jzeeeUqiD7WeLcotAm2YYKJj5Sd8jQWFNykddnF1CBKWiEv8
   gPHgNIe+Z4vC4vdS+HZPB3QyExTVdPdwKDdXDJ19y1r+JC6vtoDZR7WwQ
   A2XrSghzmE3G5xeZL29pNggZc5KH6uR4Pw24+ZrmgRPyiemP0aUkGtLs8
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164089101"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164089101"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:16 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 58B97C9447
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9FE7FD50A8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 359DB2007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D8DE51A0002;
	Tue, 25 Jun 2024 16:57:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/57] python3-email-validator: upgrade 2.1.1 -> 2.2.0
Date: Tue, 25 Jun 2024 16:56:00 +0800
Message-Id: <1719305790-11484-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--1.266000-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mr2rWnqd4fvlSMltxkB8Rw0/AF
	43IXaj2gw3QxKhCflytaHi3vODvV+7WtJ+5PTkamCtzGvPCy/m5Z+CK+BxQ9k8iCh8yBqE+t6KT
	BH9GU3xrgr0WZ6u+ypfoDJBh8a2v9bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXR/IzlV+CMbaH62
	gsspfBEYGQRIwjTl3i64sVlliWKx8fE8yM4pjsDwtuKBGekqUpnH7sbImOEBShs+bylnw7aGqOY
	xiYBTTstnBJyb9AOVrC1ps8HoQ71eem5ndkWPdKfCqIrY488C3vfGNwkcXm9LFwyKDthHDwGNUl
	zl10WFnsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111041

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Email addresses with internationalized local parts could, with rare Unicode
  characters, be returned as valid but actually be invalid in their
  normalized form (returned in the normalized field).
- The length check for email addresses with internationalized local parts is
  now also applied to the original address string prior to Unicode NFC
  normalization, which may be longer and could exceed the maximum email address
  length, to protect callers who do not use the returned normalized address.
- Improved error message for IDNA domains that are too long or have invalid
  characters after Unicode normalization.
- A new option to parse My Name <address@domain> strings
- Improvements to Python typing.
- Some additional tests added.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...mail-validator_2.1.1.bb => python3-email-validator_2.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-email-validator_2.1.1.bb => python3-email-validator_2.2.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-email-validator_2.1.1.bb b/meta-python/recipes-devtools/python/python3-email-validator_2.2.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-email-validator_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-email-validator_2.2.0.bb
index 90a22e5a0..bf6b1cafe 100644
--- a/meta-python/recipes-devtools/python/python3-email-validator_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-email-validator_2.2.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2890aee62bd2a4c3197e2059016a397e"
 
-SRC_URI[sha256sum] = "200a70680ba08904be6d1eef729205cc0d687634399a5924d842533efb824b84"
+SRC_URI[sha256sum] = "cb690f344c617a714f22e66ae771445a1ceb46821152df8e165c5f9a364582b7"
 
 PYPI_PACKAGE = "email_validator"
 
-- 
2.34.1


