Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4099CC761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:07:14 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.66317.1680516429961427445
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Avco8LXm;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516427; i=@fujitsu.com;
	bh=3y3ribNVuyUS0c+W5p1GkKkqX6PA0YMYk3vmGCTbfP4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Avco8LXmLqhe/+VDqSyliu0e5uS56uB6i+5f1gnuIrSIprIi8RigYdL8XLMtaCqdC
	 RcSnKDCQ82yX34anuRXwextNB2Pgg+ENN+6X7wPpcAvlnkIyk0ibgioJkO6SCzbslX
	 eCj1r+HD62gYU0Hw6ehTI3NOupJgqumeqMJLM+sabj4GKdtt7KqTyDNfVbEdafmv8z
	 aRwz+qWA73jxoVBfhTPtpIoWkFM0bvMzy0VVnHV7MiLN8CUAEvO8pzVJjt+EqbLo4/
	 TUqoPcBIGEIR84tCBsss4PhYDTsVwG6XmL4Pk+yBHY0exOO/tT/E6dxePBazlowT8Z
	 0D+ztZ8PJCnyw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORpOu9VCv
  F4NYaWYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePI48nsBat5Kxb+2sfWwPiSu4uRi0NI4CGj
  RMOam6wQzhUmiZt9/WwQzm5GiZnrVjN3MXJysAlISdy4/58NxBYR0JdYOnsPWJxZQEXixe8ed
  hBbWMBP4urVh6wgNgtQ/OatjWA1vAJOEne+HACrkRBQkJjy8D1UXFDi5MwnLBBzJCQOvnjBDF
  GjKDH7cjMLhF0h0Tj9EBOErSZx9dwm5gmM/LOQtM9C0r6AkWkVo1lxalFZapGuoaleUlFmekZ
  JbmJmjl5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJOil5easkmRmA4phSzxO9gvNb3V+8Q
  oyQHk5Ior2C9VooQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd55i4BygkWp6akVaZk5wNiASUtw8
  CiJ8CouAErzFhck5hZnpkOkTjEqSonz3lkMlBAASWSU5sG1weLxEqOslDAvIwMDgxBPQWpRbm
  YJqvwrRnEORiVhXjGQKTyZeSVw018BLWYCWtwapQGyuCQRISXVwNSbJPCXT9PPUf5fstOaKKE
  vmvzcH+c6b7o3tXON/E4uGffixZv97u8yjfLtfaFklB1V3O2y67Lw9jvRm68x/BfzXsb/ozBC
  8HfYiyntCVk5V7clPMna9PrvkyQLhRT+SVvUpqUVHXq1N+2485vqu9e5AzQKUs+xnlW+MV9g3
  q+Zr3O6Q+b/lUu5FTu/VSvcKLPy+4rL59/fErth7PmT94sd87HzSctyanSULK5vPKd5lE+8za
  9tV/Xf/Kw1/f7znrtcOBav+yqec/p7nnf5v7pzH96cfWWClZ7j03NaHiEdb4N+iqnWeu5XD3f
  M29+iIj7xd+m9KzNauOQLf79LYF6pXsI150oH340Nc/m4GZRYijMSDbWYi4oTAVVGxUpCAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-587.messagelabs.com!1680516427!1009590!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9960 invoked from network); 3 Apr 2023 10:07:07 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-16.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:07:07 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 1E79F1D3
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:07:07 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 139611B0
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:07:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:07:05 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pydantic: upgrade 1.10.6 -> 1.10.7
Date: Mon, 3 Apr 2023 18:06:52 +0800
Message-ID: <1680516416-31035-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101924

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Fix creating schema from model using ConstrainedStr with regex as dict key
    Address bug in mypy plugin caused by explicit_package_bases=True
    Add implicit defaults in the mypy plugin for Field with no default argument
    Fix schema generated for Enum values used as Literals in discriminated unions
    Fix mypy failures caused by the pydantic mypy plugin when users define from_orm in their own classes
    Fix InitVar usage with pydantic dataclasses, mypy version 1.1.1 and the custom mypy plugin

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pydantic_1.10.6.bb => python3-pydantic_1.10.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_1.10.6.bb => python3-pydantic_1.10.7.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_1.10.6.bb b/meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pydantic_1.10.6.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb
index c888f4a5d..70f6834f5 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_1.10.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_1.10.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c02ea30650b91528657db64baea1757"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "cf95adb0d1671fc38d8c43dd921ad5814a735e7d9b4d9e437c088002863854fd"
+SRC_URI[sha256sum] = "cfc83c0678b6ba51b0532bea66860617c4cd4251ecf76e9846fa5a9f3454e97e"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-typing-extensions \
-- 
2.34.1


