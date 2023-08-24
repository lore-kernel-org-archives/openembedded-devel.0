Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58738C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:12:04 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.6150.1692864721863200859
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="129138050"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="129138050"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:12:00 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 76B94CA1E4
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:11:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id AA22ED9470
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:11:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E0236BE79;
	Thu, 24 Aug 2023 17:11:56 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitstring: upgrade 4.0.2 -> 4.1.0
Date: Thu, 24 Aug 2023 16:11:20 +0800
Message-Id: <1692864680-2464-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27832.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27832.005
X-TMASE-Result: 10--0.385300-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrKQNhMboqZlq3Stk62MqiCG+t
	WVFb8XYl1joxU3t+0uRGhfJHDo8fSAs4RJ2o55hNlRdhw/BBzafjLrHqvAiSy74hD5p4uWGfkrI
	9/WPu3jcxyLhPAz35J77hMTwFP/LZXOFTT+immjafrLSY2RbRpIXSbXMHmBUMlPH7Ysio2a3TI4
	8G/UH1dggvGgJhnjupVdNPsIcMVUMv+0FNnM7lDZ1U1lojafr/EITY2UGMiNwpeqaZhManGJSDl
	QPoCUXSsX24ahsS5PuAMuqetGVetnyef22ep6XYxlblqLlYqXJ1W9/4DaGGgdAJybWM4Ev5IX5W
	eMRtDvHQxb7f0M3pGrgcFQJxcUc3jBateVtqtBtvSfpoeOxwxA1tYuQMTYvp3UkD4DoKyUH+v9v
	52ZIoWjoAf389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104568

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Added two new floating point interpretations: float8_143 and float8_152.
-Auto initialistion from ints has been removed and now raises a TypeError.
-Explicitly specifying the 'auto' parameter is now disallowed rather than discouraged.
-Deleting, replacing or inserting into a bitstring resets the bit position to 0 if the
 bitstring's length has been changed.
-Only empty bitstring are now considered False in a boolean sense.
-Casting to bytes now behaves as expected, so that bytes(s) gives the same result as
 s.tobytes(). Previously it created a byte per bit.
-Pretty printing with the 'bytes' format now uses characters from the 'Latin Extended-A'
 unicode block for non-ASCII and unprintable characters instead of replacing them with '.'
-When using struct-like codes you can now use '=' instead of '@' to signify native-
 endianness. They behave identically, but the new '=' is now preferred.
-More fixes for LSB0 mode. There are now no known issues with this feature.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitstring_4.0.2.bb => python3-bitstring_4.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstring_4.0.2.bb => python3-bitstring_4.1.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstring_4.0.2.bb b/meta-python/recipes-devtools/python/python3-bitstring_4.1.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-bitstring_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-bitstring_4.1.0.bb
index b2ad991f5e..8a70f60db5 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_4.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scott-griffiths/bitstring"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=661f450e2c0aef39b4b15597333444a7"
 
-SRC_URI[sha256sum] = "a391db8828ac4485dd5ce72c80b27ebac3e7b989631359959e310cd9729723b2"
+SRC_URI[sha256sum] = "b1672fb31721dbb6c809e76a3a19ac76a608e1f8fcacce9349ae2b72b1917b20"
 
 PYPI_PACKAGE = "bitstring"
 
-- 
2.34.1


