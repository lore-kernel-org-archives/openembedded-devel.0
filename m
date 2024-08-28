Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395DDC5474F
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:41 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.8718.1724833538730307556
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j2H+P9z/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833539; x=1756369539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Rf3o+klyBpczzeGW/Glg6mkfWvFxz2jwM+ZdaMXQP+M=;
  b=j2H+P9z/6Bvg0LHP7lrcclGlEhLlN3qVsGXr3YFHBJGDPSxAVJGQjqae
   gB4yf+jdLtmEzLsqMBYHz1r4vc145W2FwYGCzQJ6gsy9haqV+slzj7SbG
   kF2+qRF23zI/FOsxUrFYD3BszWRjz+jkAsilIZDZPkZhDquoZNwyQZRKl
   IQ43i+f2+iuE/o4yZfKAXputB2nkh4+m+8xMHwcBGhMrw4aIHnALJ2Wjo
   q+Nnnds9XLQftpwHz6ZXSJzqX1IhMpw907Sbz5Hsc0QKgcxb57WgyxaPf
   1KZqSt6fwYehcWnIwTrwziMFqlA7X6w9Zr4aG2j66wOWCuFo3GQLJnced
   A==;
X-CSE-ConnectionGUID: SjP0qqFwTWijV3xNMmuePQ==
X-CSE-MsgGUID: MXjA0H19QR+R0ZjdeuRKPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171913163"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171913163"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:36 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E5466DAD2F
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 34AC217CCC
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C161A20079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6C8F71A0002;
	Wed, 28 Aug 2024 16:25:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/46] lastlog2: upgrade 1.2.0 -> 1.3.1
Date: Wed, 28 Aug 2024 16:24:44 +0800
Message-Id: <1724833525-2162-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-3.285100-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrTfK5j0EZbytLWMri+QqmsXVR
	51KWfap484lM8MUZ3FkUVWwyhm+bztGETJv1/WyOP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFqqg2TSZUFr2Vd49c0zgWM8BDOqHwPghjVI7KaIl9NhdnHb
	mOz4dRQ+LzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAU6WQLcoKUrAhA5FcGJWldktWIL
	tPYy4yITPyLxSRFRlltxCgsR93CmKwGILdtVmmyAedNEbk4DtJXGivQNUtMJQOsC1IUeP9f7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111983

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- pam_lastlog2: differentiate between three error cases
- Fix error handling of sqlite3_step
- Don't call exit() in a library
- Support 32bit time_t (but is not Y2038 safe!)
- lib/lastlog2: always use int64_t internal
- committed
- Fix minimum required meson version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lastlog2/{lastlog2_1.2.0.bb => lastlog2_1.3.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/lastlog2/{lastlog2_1.2.0.bb => lastlog2_1.3.1.bb} (96%)

diff --git a/meta-oe/recipes-extended/lastlog2/lastlog2_1.2.0.bb b/meta-oe/recipes-extended/lastlog2/lastlog2_1.3.1.bb
similarity index 96%
rename from meta-oe/recipes-extended/lastlog2/lastlog2_1.2.0.bb
rename to meta-oe/recipes-extended/lastlog2/lastlog2_1.3.1.bb
index 0b3ab1f82..ebabcfd40 100644
--- a/meta-oe/recipes-extended/lastlog2/lastlog2_1.2.0.bb
+++ b/meta-oe/recipes-extended/lastlog2/lastlog2_1.3.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=020090a00b69dd2af9ab82eb0003ea2c"
 SECTION = "libs"
 
-SRCREV = "6138dff6f2a5216065fa4833a223b56d98cb62f3"
+SRCREV = "8a743b6559e7b8a9b40747866054d3fb5041a498"
 
 SRC_URI = "git://github.com/thkukuk/lastlog2.git;branch=main;protocol=https \
            file://0001-remove-lto-to-fix-link-error-of-clang.patch \
-- 
2.34.1


