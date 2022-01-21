Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F4CC433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 00:36:11 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.5279.1642725370391042612
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Jan 2022 16:36:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cPrPQXJ2;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642725367; i=@fujitsu.com;
	bh=Spfo/tb7xcWuDIpqWP8kD+kd70PfIaESpJbhMwha59o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cPrPQXJ2btfFocZiYLuE5IVdF+8XgJZjQQ8eeJEaQxzAja28Q0ZhVmX2H/+TytKnB
	 zyhXS6AJSi29ZFkK6eVlycrTSz7JnEgEDuWqqkAvn7zopWXiIsJgSLDBotaYWY5nDf
	 BF+BDj3BysQBg5ehRdIxSXwbB+Qe1PVwUoj9LSafOCjsiRvaEwwBywu07D0vKWOtbJ
	 MVcmXcWaJMQHkuou0khNSDLdccBmGI9PCpVVv9P8f0G8j45sz3r4BLukR/Y1TmjqPm
	 2zr7hHW04hrGlUnnjdNqGeBYSKw8nkcH8DzoANK8D3yhVi9JSLQJA21SozTswEp740
	 0cmKhF1cee6LQ==
Received: from [100.115.1.29] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id 71/64-30341-7FFF9E16;
 Fri, 21 Jan 2022 00:36:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8MxRff7/5e
  JBndOsFtcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBkrDk9mKVjOUfH2wxq2Bsb97F2MXBxCAjOZ
  JDatv8kK4ZxglOhf95Opi5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e9hBbGEBa4lJj
  VcZQWwWAVWJ+bN2gtXzCjhJfN+zDaxGQkBBYsrD98wQcUGJkzOfsEDMkZA4+OIFM0SNosTsy8
  0sEHaFxKxZbUwTGHlnIWmZhaRlASPTKkarpKLM9IyS3MTMHF1DAwNdQ0NTXRMgy1AvsUo3US+
  1VLc8tbhEF8gtL9ZLLS7WK67MTc5J0ctLLdnECAyylGKW1B2MfX0/9Q4xSnIwKYnyFq94mSjE
  l5SfUpmRWJwRX1Sak1p8iFGGg0NJgvfWX6CcYFFqempFWmYOMOBh0hIcPEoivK//AKV5iwsSc
  4sz0yFSpxjtOd6sXbKImaPt3l0gOXPBwdXMHPfbD61mFmLJy89LlRLndfwH1CYA0pZRmgc3FB
  ahlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8z4EmcKTmVcCt/sV0FlMQGf1P3sGclZJIkJ
  KqoGJt+hc+dlb+6fuWseYERA52VlEUaMmf8EZdZ3NqZHiic7Nm1Jm7lI6catWpocrZPa7Hd+b
  ZbubElT/2v3+ULZ1Z2XPR7bNdwO4m3MmFIl9UFLiSjlSG/hI3yjeqyWI0yWo/MOLynK1LcE+W
  X/n+l1Li+UvmZ98+u+lk84X6uPdFhziiD/T5rl59dZ/M/Ufdd/w1rrTqmvdco5Fc8KHOn/lD6
  uN/n3/0VknpL6nffn5e92l9yr0uqVv62dd54yvFUzc/vWELuv7CZIr5x994LRcOzldcvW5/Im
  PevxX9MYvj/6eNf3piW9ha/b/KQgL9zll4qxusOX4CbPJCb+DA/47vItZe3bStLl9QkZVlblK
  LMUZiYZazEXFiQATaKK+SwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-587.messagelabs.com!1642725366!9252!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26782 invoked from network); 21 Jan 2022 00:36:07 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-20.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Jan 2022 00:36:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20L0a1eZ009230
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 00:36:06 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 21 Jan 2022 00:35:59 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] fmt: upgrade 8.0.1 -> 8.1.1
Date: Fri, 21 Jan 2022 08:35:49 +0800
Message-ID: <1642725351-24004-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 00:36:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94963

Changelog:
=========
Restored ABI compatibility with version 8.0.x
Fixed chrono formatting on big endian systems
Fixed a linkage error with mingw

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/fmt/{fmt_8.0.1.bb => fmt_8.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fmt/{fmt_8.0.1.bb => fmt_8.1.1.bb} (90%)

diff --git a/meta-oe/recipes-support/fmt/fmt_8.0.1.bb b/meta-oe/recipes-support/fmt/fmt_8.1.1.bb
similarity index 90%
rename from meta-oe/recipes-support/fmt/fmt_8.0.1.bb
rename to meta-oe/recipes-support/fmt/fmt_8.1.1.bb
index ee14ad55b..c53dd3890 100644
--- a/meta-oe/recipes-support/fmt/fmt_8.0.1.bb
+++ b/meta-oe/recipes-support/fmt/fmt_8.1.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
 
 SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
-SRCREV = "d141cdbeb0fb422a3fb7173b285fd38e0d1772dc"
+SRCREV = "b6f4ceaed0a0a24ccf575fab6c56dd50ccf6f1a9"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


