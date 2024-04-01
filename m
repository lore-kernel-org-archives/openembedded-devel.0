Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D625BCD129F
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:54 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.39363.1711983108562843765
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r3Db8DK5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983108; x=1743519108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uRQ7BQk+GP3HPCyuZDJsYF3qXDMNLRDV/M6WA79kZyQ=;
  b=r3Db8DK5whZO7ZGAnlNey4fTtAouWuPL253XFYBEGzJ7PylsM8B/9K78
   Sx/yChSej2DVjo5ssAqpCyO/eM+b4avGH6ez7tilt0q3myPmpMcK73vx1
   jhOVOBwRmRrkzUTIbh2/3Xx9WS8ZteS6FBKp3X4hemy23EqU9ITJZQsqP
   gOyx+HuzeuF4ga1xa+dCug641E8qGIFAckpfnnYgHk79CSk3BYsqBmnEA
   GSfb/m7yd0pgmA5BVunJ1DFZHSodgEDymfcV8JKAQbqUfXQl0w5wPO5Z9
   8BrdWsfRYl4vPC7/GJhEsfORurHF73FcjRdsdBbkzPFr9nW1URe8MeNp8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="154291745"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="154291745"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:46 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 71AEBC6808
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:44 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C0BC8D9681
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 55B2321EEEF
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0BE921A000B;
	Mon,  1 Apr 2024 22:51:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/47] python3-web3: upgrade 6.15.1 -> 6.16.0
Date: Mon,  1 Apr 2024 22:51:12 +0800
Message-Id: <1711983079-16849-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--3.778500-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mr9v33UW8WNYB4YeSlHZYFogkn
	4ngcjic8fMGQ20CtFkxHkly7AY5JBaqkg+o+yGWuu5p85xvjgOlpkBMYDn8FePoMXwwsUQ61vqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgK7YaZ2V2aJQYA3qL69rXq4Gp0
	VGMd0huFslxAfd+6tXeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpnH7sbImOEBSngu2Mv3Uq8ypbj
	lVbtnRBTRBciPNlCJSQzfAWm9Q9vqqmBeqezUAzeE4BWU9GrlrbX846ZoMhkIemiOS+8rrzTo6G
	8WlVI6vsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109756

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-Catch all types of "eth-abi" "DecodingError" in "EthereumTesterProvider->_make_request()"
-Fix/update methods and decorators in "web3/_utils/abi.py" to address issues
 raised by "mypy"
-Fix "process_log()" when parsing logs for events with indexed and non-indexed
 inputs. "get_event_data()" now compares log topics and event ABIs as hex values.
-Fix "process_log" for "HexStr" inputs. Explicit type coercion of entry "topics"
 and "data" values.
-Fix typing for json data argument to "eth_signTypedData".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_6.15.1.bb => python3-web3_6.16.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.15.1.bb => python3-web3_6.16.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.15.1.bb b/meta-python/recipes-devtools/python/python3-web3_6.16.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-web3_6.15.1.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.16.0.bb
index 4eea0f052..01738f22c 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.16.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "f9e7eefc1b3c3d194868a4ef9583b625c18ea3f31a48ebe143183db74898f381"
+SRC_URI[sha256sum] = "b10c93476c106acc44b8428e47c61c385b7d0885e82cdc24049d27f521833552"
 
 inherit pypi setuptools3
 
-- 
2.34.1


