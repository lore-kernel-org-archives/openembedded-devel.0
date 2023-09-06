Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C12CFC616B
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:06:35 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.2561.1693965993469168287
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="132258648"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="132258648"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:06:31 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E71A5F0762
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:06:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 20E2AD6155
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:06:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 833D02007684B;
	Wed,  6 Sep 2023 11:06:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] thrift: upgrade 0.18.1 -> 0.19.0
Date: Wed,  6 Sep 2023 10:06:18 +0800
Message-Id: <1693965978-15157-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27858.004
X-TMASE-Result: 10--9.742100-10.000000
X-TMASE-MatchedRID: aJfGYVVmw3ijz0nOeth/yUIIxwDaU5mrfrTt+hmA5bIvfU/riSJXkWdr
	jZkJClxevBAd3dE9o6Ol9RgYzX4UHhJ8EINAmcWb5CghTisABMzDvsJEJ3LgvK0GJL2EV5pMAu0
	C/xvh/SjAxw1znnkwcRCUWSZ2TdU6y0hDAlxfVkQapIb9znReA1ff5+SGZ4Nk1+OTFqKF59k5Tw
	TvSSgBPWGdDn7ME8qMzafWP25QA6GNnYpO97f9vYL5ja7E+OhybkygYp8Zf7r+Aw16GgqpOxwfH
	QbbTwQG5/5i4uH1x+K54PYAo2DfLrhPu4tF1R7BKsurITpSv+Nd5/m3qrxFzFgYwsPuFUjAlTzE
	lHFiLspIZLx8cDwe/HVUSbHuxOT/7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5DfZLr
	Ulw8Hx9uuW1pm0x7zEEu7gcGO7sbAoh0zbRRsid0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR4
	+zsDTthUfR2rvBju6nw52XVXCkJIwp6mrkX8uXaNQBHvTnPHdwPIkz+NvYD5msFaOwUHzEslqOi
	xJajVs=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:06:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104766

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- C++ library don't work with HTTP (csharp server, cpp client; need cross test enhancement)
- Swift service generator doesn't support oneway
- LNK4042 and LNK2019 in go_validator_generator.cc
- Add dependabot
- Thrift SSL server stops working if the file descriptor returned is zero
- TMemoryBuffer resizing might shrink the buffer size due to uint32_t overflow
- Constant expects type to be defined before
- Add comparer and capacity arguments to container classes
- Handle ErrAbandonRequest automatically
- uuid sets and map keys may throw on some Haxe targets
- Superfluous block scope in generated write() code
- Haxe 4.30 emits "Local variable retval used without being initialized" on generated code
- Support for deprecated methods (via annotation)
- deprecation warning fixes for @:extern and @:enum
- Migration to JakartaEE and Apache HttpComponents 5
- FutureClient does not extend when service extends from another service
- Support Java 8
- TByteBuffer.java does not allow non-default TConfiguration
- Fix Java UUID typeid
- Server implementation exceptions are not sent to client in ES6 promise-style invocation
- Upgrade to net7.0
- NodeJS header transport leaks headers between all instances
- Php8.1 fix warnings
- add TJSONProtocol support in thrift-swift

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../thrift/{thrift_0.18.1.bb => thrift_0.19.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/thrift/{thrift_0.18.1.bb => thrift_0.19.0.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.19.0.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb
rename to meta-oe/recipes-connectivity/thrift/thrift_0.19.0.bb
index 2809e24ad1..70c9a7a087 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.19.0.bb
@@ -10,7 +10,7 @@ DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 
 SRC_URI = "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch"
-SRC_URI[sha256sum] = "04c6f10e5d788ca78e13ee2ef0d2152c7b070c0af55483d6b942e29cff296726"
+SRC_URI[sha256sum] = "d49c896c2724a78701e05cfccf6cf70b5db312d82a17efe951b441d300ccf275"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


