Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D552FC001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:34:15 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.151882.1692149650126377587
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="127721305"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="127721305"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:34:08 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2289AD29E1
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:34:05 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5C723D6162
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:34:04 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E4C1D20050193;
	Wed, 16 Aug 2023 10:34:03 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] fmt: upgrade 10.0.0 -> 10.1.0
Date: Wed, 16 Aug 2023 09:33:56 +0800
Message-Id: <1692149636-4756-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10-2.840200-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yUIIxwDaU5mr4y6x6rwIkstDUD0XooUhH6q5
	0jXdZ/0kJTsyU119HwjVeptTRKjYpajIIvD+wS8yz5Bv/2gKFgkEx2nnXvzNI4wnGKAoIKJLU1E
	ZKG8sVmw55WMjHWw8mJ1RbBzUKbwWj5nOH/bPvLGtBybNxXyi/PX71s7cIJuTL31P64kiV5G+6Y
	UxHdZpES/Fzh+xHj4GQDvmQjM2kbHqJs/Ll4uVL/LeH1FBnhK01cuIRwt/4MjAuQ0xDMaXkH4qt
	YI9sRE/KqrQ7lLcMnwGFBbDeVn4ha7Kv+wYXRsgb056mCmF00Z9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO36CZXLlV1mSVOXlz6l3imSLGjsZUq31BMsUo09SIIbijXo2MGu/Foe7XMbD+AK34JbGnu
	xG6IDT6OYjLeZcwPtAdGzWfTfBEvQmicPx9g3GvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uAB
	Di47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:34:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104369

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Optimized format string compilation resulting in up to 40% speed up in
  compiled "format_to" and ~4x speed up in compiled "format_to_n" on a
  concatenation benchmark
* Optimized storage of an empty allocator in "basic_memory_buffer"
* Added formatters for proxy references to elements of "std::vector<bool>" and
  "std::bitset<N>"
* Fixed an ambiguous formatter specialization for containers that look like
  container adaptors such as "boost::flat_set"
* Fixed compilation when formatting durations not convertible from
  "std::chrono::seconds"
* Made the "formatter" specialization for "char*" const-correct
* Made "{}" and "{:}" handled consistently during compile-time checks
* Disallowed passing temporaries to "make_format_args" to improve API safety
  by preventing dangling references.
* Improved the compile-time error for unformattable types
* Improved the floating-point formatter
* Fixed handling of precision for "long double" larger than 64 bits.
* Made floating-point and chrono tests less platform-dependent
* Removed the remnants of the Grisu floating-point formatter that has been
  replaced by Dragonbox in earlier versions.
* Added "throw_format_error" to the public API
* Made "FMT_THROW" assert even if assertions are disabled when compiling with
  exceptions disabled
* Made "format_as" and "std::filesystem::path" formatter work with exotic
  code unit types.
* Deprecated the wide stream overload of "printf".
* Removed unused "basic_printf_parse_context".
* Improved RTTI detection used when formatting exceptions
* Improved compatibility with VxWorks7
* Improved documentation
* Improved build and CI configurations
* Fixed various warnings and compilation issues

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/fmt/{fmt_10.0.0.bb => fmt_10.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fmt/{fmt_10.0.0.bb => fmt_10.1.0.bb} (90%)

diff --git a/meta-oe/recipes-support/fmt/fmt_10.0.0.bb b/meta-oe/recipes-support/fmt/fmt_10.1.0.bb
similarity index 90%
rename from meta-oe/recipes-support/fmt/fmt_10.0.0.bb
rename to meta-oe/recipes-support/fmt/fmt_10.1.0.bb
index a8e6e563da..f8d7edcdfe 100644
--- a/meta-oe/recipes-support/fmt/fmt_10.0.0.bb
+++ b/meta-oe/recipes-support/fmt/fmt_10.1.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b9257785fc4f3803a4b71b76c1412729"
 
 SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
-SRCREV = "a0b8a92e3d1532361c2f7feb63babc5c18d00ef2"
+SRCREV = "e57ca2e3685b160617d3d95fcd9e789c4e06ca88"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


