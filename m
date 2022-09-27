Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108CDC07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 09:37:53 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.8987.1664271463808550767
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 02:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FC+3cA9z;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664271462; i=@fujitsu.com;
	bh=NrI1CMjkpapDPNTmQ9XKjci+vLFbGH2ah7TM0JYSpBA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FC+3cA9z5ryk5dyDxtMt4Dsig1XTW1azl/ICJfXo8F5MqBW/NOScynMuRqrH5faTy
	 jjKiv+7LJyv5nl3sfhjk3LWju81USq+HDkA5NsIhVAp1c4xqXSGg2WSdzT2jZ6vhl8
	 3DR5nELy6SioRShsV8F+p77H+rH8ObUx45HsoH/Ot8s5xp1PpRYOk9Vg7Q1RMtnUvF
	 xaih1CYDAnOkdjqx0h1LNW4JmFA6KdEPrYnylh8A9o9HOPznTWkqaz7xbl2YJYoj2v
	 TPEiGnqpzq4ZuYbqGSctz+PhZ2jiJiYKU/i/Bz1eGyzwc5RR9F3Kq7HfCk2RHJH8yJ
	 GbMJASqA2WJPQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8ORqJt6xCj
  Z4OMSDYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNzR3HBdd6KhZO2sjUwPufuYuTiEBJ4wihx
  vPEFI4RznUni+vkpLF2MnEDOAUaJu0/qQGw2AV2JFz8Wg8VFBPQlls7ewwxiCwv4SHR++sYOY
  rMIqEp0Pb0HNIiDg1fAXeLPr0qQsISAgsSUh+/BynkFBCVOznwCNoZZQELi4IsXzCDlEgKKEr
  Ony0OUV0g0Tj/EBGGrSVw9t4l5AiPfLCTds5B0L2BkWsVolVSUmZ5RkpuYmaNraGCga2hoqmu
  oa2RorpdYpZuol1qqW55aXKJrqJdYXqyXWlysV1yZm5yTopeXWrKJERh2KcWMN3cwtvb91DvE
  KMnBpCTKa7/IKFmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBG/yIaCcYFFqempFWmYOMAZg0hIcP
  EoivDtA0rzFBYm5xZnpEKlTjIpS4rymW4ASAiCJjNI8uDZY3F1ilJUS5mVkYGAQ4ilILcrNLE
  GVf8UozsGoJMwrBDKeJzOvBG76K6DFTECL7fj0QRaXJCKkpBqYGhcLuE/83vJup19iyO+NVjt
  X8VlKq2269vfyzcLFdudE2tZkp9fIi8wRmSVyId5BLvaS35T3+jLzFPaYhU/U4vt4d8aNJY9j
  Nn4NUt781+Jg1J65s2+Ivo5e+Ov27zebS4v/TKsp91T3c2fYVp7fWsDx4dezxrwjHkq7V2bPa
  /nbpL2n9Tdnbcgl41Mby3W6vQ8aLTHxV1yhZmh5pfTQg5g5nzmMXQU+SU2xUc76VT+r/tGmuC
  IL6ar8e4o7zr7kaKqJvzfZdvaM8uN1z2fcOtxncHZeU/ce/lqfT2XBvMnTp2y5dEvL+fCmNzs
  vuDdJrqr9y/LPfnoEp9muDWvXe8cv15z8Nu++u2jE8wfWFkosxRmJhlrMRcWJAHbt+kA2AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-587.messagelabs.com!1664271461!526844!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32636 invoked from network); 27 Sep 2022 09:37:41 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 09:37:41 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4900E100195
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:37:41 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3CB16100043
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:37:41 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 10:37:40 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-sqlparse: upgrade 0.4.2 -> 0.4.3
Date: Tue, 27 Sep 2022 17:37:13 +0800
Message-ID: <1664271433-2676-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 09:37:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98989

Changelog:
==========
Enhancements
-------------
    Add support for DIV operator
    Add support for additional SPARK keywords
    Avoid tokens copy
    Add REGEXP as a comparision
    Add DISTINCTROW keyword for MS Access (issue677).
    Improve parsing of CREATE TABLE AS SELECT

Bug Fixes
---------
    Fix spelling of INDICATOR keyword
    Fix formatting error in EXTRACT function
    Fix bad parsing of create table statements that use lower case
    Handle backtick as valid quote char
    Allow any unicode character as valid identifier name (issue641).

Other
-------
    Update github actions to test on Python 3.10 as well

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-sqlparse_0.4.2.bb => python3-sqlparse_0.4.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlparse_0.4.2.bb => python3-sqlparse_0.4.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb
rename to meta-python/recipes-devtools/python/python3-sqlparse_0.4.3.bb
index 0980ff9c24..c952c71d0b 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.3.bb
@@ -8,7 +8,7 @@ SRC_URI += "file://0001-sqlparse-change-shebang-to-python3.patch \
             file://run-ptest \
 	    "
 
-SRC_URI[sha256sum] = "0c00730c74263a94e5a9919ade150dfc3b19c574389985446148402998287dae"
+SRC_URI[sha256sum] = "69ca804846bb114d2ec380e4360a8a340db83f0ccf3afceeb1404df028f57268"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.25.1


