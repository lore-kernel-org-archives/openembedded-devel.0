Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56522C54E5D
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:26 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.8150.1710827184129407891
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SPhhvpQ+;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827184; x=1742363184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Dk85mSFhOwkjAonOKeK1waFUig4s6XAYR48ow4tVyCk=;
  b=SPhhvpQ+YYLM91JatlDrjT32S/glDqHBWqykMc6ZkqV6Ne+yD90l0e+K
   SMR6+9zgFHzaAPNACScF1n6MfvUXN0EZNIYRq7njDqBEMbtSNUKWfesaL
   XJWZ73KtBiyPnlK9JmmI+iKqeiHy1rj8vvFE4RP5C8LURGQ13zqAkPsf+
   EawkIWOKoIp6nvzg0Qygrd1vzyKu+QfJvYj3GyYrQwxhL/S5GCfMj2RO6
   R78g2iID+2l2hx8OjooqAtPvJ6zncYKmaD/9hI+yi82jlnviFaSQiL2SF
   iGn9YOsNkFMN+Zn2yoHEcvc9t6XEMlNdNB8jE6ntbh0Ijz+q+QEWZqmie
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="140681156"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="140681156"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:21 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8A705F2646
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id ADFE9D5623
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 47B9821BD6E
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E34BD1A006B;
	Tue, 19 Mar 2024 13:46:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 15/50] opensc: upgrade 0.24.0 -> 0.25.0
Date: Tue, 19 Mar 2024 13:45:04 +0800
Message-Id: <1710827139-30056-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-0.217800-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mr0NnUUVMlTKaAchyDu1cfS7+x
	g266CxvaBZONHdT1B7nSxCIdI99AUMFBoCgEV4LyKsurITpSv+MXivwflisSrHYdkYOuyxVSOcY
	/jkDGKiKuQzLBshmV3gWLGD0fGqzIHVikQ9YmLLM/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bm0xeKYZaxlkBhQWw3lZ+IWuyr/sGF0bIN0KiTeJteVBTnSpwnlY4yGbKItl61J/yfJvo
	cwUrWp7H0aAsAc4EWInRE+fI6etklZGUqmQPmCpBDKmmGPS8g8v8ASUx1ZiL60U8xWtdItrSECw
	nRyTmTd/qsJL4ymcLOH+VQJy4Y09u+NaejwBgRcr4OQy5iYl1ku/kTKv9giuqwOHO1Fdn0Kb4tj
	0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109432

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
## Security
* [CVE-2023-5992]: Side-channel leaks while stripping encryption PKCS#1.5 padding in OpenSC
* [CVE-2024-1454]: Potential use-after-free in AuthentIC driver during card enrollment in pkcs15init

## General improvements
* Update OpenSSL 1.1.1 to 3.0 in MacOS build
* Remove support for old card drivers Akis, GPK, Incrypto34 and Westcos, disable Cyberflex driver
* Fix 64b to 32b conversions
* Improvements for the p11test
* Fix reader initialization without SCardControl
* Make RSA PKCS#1 v1.5 depadding constant-time
* Add option for disabling PKCS#1 v1.5 depadding (type 01 and 02) on the card
* Enable MSI signing via Signpath CI integration for Windows
* Fixed various issues reported by OSS-Fuzz and Coverity in drivers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../opensc/{opensc_0.24.0.bb => opensc_0.25.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/opensc/{opensc_0.24.0.bb => opensc_0.25.0.bb} (96%)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.24.0.bb b/meta-oe/recipes-support/opensc/opensc_0.25.0.bb
similarity index 96%
rename from meta-oe/recipes-support/opensc/opensc_0.24.0.bb
rename to meta-oe/recipes-support/opensc/opensc_0.25.0.bb
index fd64cf9e8..02c9c7e80 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.24.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.0.bb
@@ -12,7 +12,7 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cb8aedd3bced19bd8026d96a8b6876d7"
 
 #v0.21.0
-SRCREV = "f15d0c5295f3247ae56bf976cf411fec4b47b6ec"
+SRCREV = "67986eda93a3a359a897f0b0be97f4315dde8d42"
 SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
           "
 DEPENDS = "virtual/libiconv openssl"
-- 
2.34.1


