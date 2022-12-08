Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D49C63708
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 06:12:52 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.7002.1670479963809258453
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 22:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=huA8kAdL;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670479962; i=@fujitsu.com;
	bh=5uhff8juiRPZ2V1sIXoK6s7rdtbLeAtIcRe3LuaPqOM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=huA8kAdLbkcpbmAnr3vQNCJHwxj5dZ2L1ofQvFznDA3Cm8guXs4kIJ6osfX6B8Otn
	 hQsUb9l+9Mar1SD3dPgkMUbOgCKX4Cs7/xwmY4njJif11JzF3sBj3F+UDfCMys8TN/
	 NkZ2jQh3ZmxK5jtdKvsIb3Y+DvQCWCfPudMsogmNvwbAWDNV4C8f00czktovP3lDSI
	 4VbddWGgtlMf3zYyOAbAEFVFm3Vb1jpMO0GfQRns0ivh6h06Bs5p5uMXSGXJPIruyZ
	 nfRKi2NlZnjVmxVfabmSL7JsLScTyARBbkK2OXgDMfN5ylidKQ35aJJvN+2h7bww+0
	 mh/vFel2B7Tyg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWTeyYWK
  yQds7YYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWN3z2fmgq1cFe9nzWFqYNzL2cXIxSEk8JBR
  YuW62WwQzmUmiU+vN7FCOLsZJWYefcbexcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  WA1wgKeEp82nQSLswDF71z+BFTPwcEr4CjxYWYySFhCQEFiysP3YCWcAk4SJ48fAhspBFTyds
  s5FhCbV0BQ4uTMJywQ4yUkDr54wQzRqygx+3IzC4RdITFrVhsThK0mcfXcJuYJjIKzkLTPQtK
  +gJFpFaNZcWpRWWqRrqGZXlJRZnpGSW5iZo5eYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5y
  TopeXmrJJkZg8KYUMz3fwXh22R+9Q4ySHExKorwvqvuThfiS8lMqMxKLM+KLSnNSiw8xynBwK
  EnwXqicmCwkWJSanlqRlpkDjCSYtAQHj5IIr28tUJq3uCAxtzgzHSJ1ilGXY+bXtgPMQix5+X
  mpUuK86+qAigRAijJK8+BGwKL6EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3jqQKTyZeSV
  wm14BHcEEdMS9/70gR5QkIqSkGpjMJvB05U+xfbHk3Bu7ytzqqp7OUJP+Xh6hLrPz/m0X468v
  +Kb7NESaycJmCmtwYMrBiA3GjYv279sx9Xf1r5bI+euf1nLOKMu/lnz9jYV+094FtSxVBnmxS
  3QefStS/nb2VWZnYfFDmZXbc+P1Xq1VCPwTcr3NavPBsgVGH7wX/qqu93KoW/J2luqSJyd2ez
  tlBsjP0pd3qXC48nW+WGW22uGZ+23PBL0sjH7WpP3i/3L3q5bzP2tIPHAKZeTZNvP4gtIUT53
  js39dF7T/Mt9mZuMll3l7E548K9kyLyfgx5GrAdPKf30JTip4IxqzKzv5lqWf39tKhxDP367X
  yjW+fjn7qNbeisMwe55D31IlluKMREMt5qLiRADnW630ZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-591.messagelabs.com!1670479961!45641!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22928 invoked from network); 8 Dec 2022 06:12:41 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-18.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Dec 2022 06:12:41 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E9CD7154
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Dec 2022 06:12:40 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id DD36C7B
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Dec 2022 06:12:40 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 8 Dec 2022 06:12:39 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ujson: upgrade 5.5.0 -> 5.6.0
Date: Thu, 8 Dec 2022 14:12:06 +0800
Message-ID: <1670479927-1286-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670479927-1286-1-git-send-email-wangmy@fujitsu.com>
References: <1670479927-1286-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 06:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99989

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
  Update vendored double-conversion to 3.2.1 (#570)
  Fix len integer overflow issue (#567)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-ujson_5.5.0.bb => python3-ujson_5.6.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_5.5.0.bb => python3-ujson_5.6.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.5.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.6.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-ujson_5.5.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.6.0.bb
index 9f080eb27..ee12deffb 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.6.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e0039a83d8a99726b5418f0b03302d0a"
 
-SRC_URI[sha256sum] = "b25077a971c7da47bd6846a912a747f6963776d90720c88603b1b55d81790780"
+SRC_URI[sha256sum] = "f881e2d8a022e9285aa2eab6ba8674358dbcb2b57fa68618d88d62937ac3ff04"
 
 inherit pypi ptest setuptools3
 
-- 
2.25.1


