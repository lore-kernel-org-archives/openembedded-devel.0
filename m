Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2EE2C433FE
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 06:03:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web09.4307.1652940226491347563
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 23:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=P14YIpfw;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652940224; i=@fujitsu.com;
	bh=85A9pj2W00NMVaD29LBTSEGqBClIcxRuuwWyC2rAKek=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=P14YIpfwkzs+0hB79GWfM+kmoOP3vb3qcLTquwbL6q3cNpliUZPjh45mNX9FgB+aG
	 Jiy21aUu5GuH2+6Zu+3MdRLd6YjVimjXRz7l28xyYUgTWw7dRvemklyn1Sm2AJkDDO
	 z+6Fl2Vk6csH3eM6PKBgk5iDlH2YC3VpTS4VSoXUI/qrT6jjjAUp1QkRnwtZziddKs
	 gHxdC5HPEXyJ7D8NDGJlVR5qrw8r04GRnE/6SHX5eFSwHnUE4KSIVCBez2nXyASB7k
	 zv6iX/KRp1lQ67SQBzI1aP35BSbR8dQDxlUVimWpwXsdLtITepsp7sG0BEZjpj3t1h
	 lJk8tI6/4j2lw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqHvgbmu
  SwZUmPouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN15RnWgi6+ilfTTRoYL/F0MXJxCAk8YZR4
  8f4gI4RzgUni/eunTBDOSUaJt+1r2LsYOTnYBNQlHt98zQhiiwjoSyydvYcZxGYWUJXovghRI
  yzgI3H5wG8wmwUo3tL3HszmFXCTWLzlLguILSGgIDHl4XuwXk4Bd4mlO36DzRQCqrl/9TkbRL
  2gxMmZT1gg5ktIHHzxghmiV0nixIqPTBB2hcTrw5eg4moSV89tYp7AKDgLSfssJO0LGJlWMVo
  nFWWmZ5TkJmbm6BoaGOgaGprqGlvoGhka6SVW6SbqpZbqlqcWl+gCueXFeqnFxXrFlbnJOSl6
  eaklmxiBYZxSrHZlB+OeVT/1DjFKcjApifK6H2lNEuJLyk+pzEgszogvKs1JLT7EKMPBoSTB+
  /kGUE6wKDU9tSItMwcYUzBpCQ4eJRHell1Aad7igsTc4sx0iNQpRkUpcd6EO0AJAZBERmkeXB
  ssji8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZNBZnCk5lXAjf9FdBiJqDFt5TBFpckIqS
  kGphKngjLrDM37Qp3OneSRazl5I7rN9evfG6eHTnr5t/dLI1vBBs4TVYK33si6VikW3q8NPDX
  z3VHkiY0Zv18WVQ7ZYm51ZoTZXvPBK1wmfS8+25PSaDyxthdG7dEF97bXa3XeMKp74xNZ4e++
  ebS/ZLGtjMa9id8faN0/MXLvMM7BSRaNqt+udaa6XlEeYfuYcMpe4y35xZF9IQ9vfpCUaFg42
  alU0mHdh1yuZavYPGgLvrq2xMZTnxzg/6uF3g/ycCEwa3VeTe7+aUZfUIi+1uLf7+43FHvPf3
  K7uLTlV3t9atKrvtGByyo8mH00zO6ZfMqockkKrNgapndvhIJnU3Jm78JsmowT5Jt4rimWaLE
  UpyRaKjFXFScCADOP45iXgMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1652940224!991022!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19516 invoked from network); 19 May 2022 06:03:44 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 May 2022 06:03:44 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id CB1F4100198
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:03:43 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BF33310018F
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:03:43 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 19 May 2022 07:03:24 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pylint: upgrade 2.13.7 -> 2.13.9
Date: Thu, 19 May 2022 14:03:04 +0800
Message-ID: <1652940188-8005-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1652940188-8005-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1652940188-8005-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 06:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97179

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
2.13.9 is the last release supporting python interpreter between 3.6.2 and 3.7.2.
---------------------------------------------------------------------------------
    Respect ignore configuration options with --recursive=y.
    Fix false positives for no-name-in-module and import-error for numpy.distutils and pydantic.
    Fix IndexError crash in uninferable_final_decorators method.
    Fix a crash in unnecessary-dict-index-lookup when subscripting an attribute.
    Fix a crash when accessing __code__ and assigning it to a variable.
    Fix a false positive for undefined-loop-variable when using enumerate().

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pylint_2.13.7.bb => python3-pylint_2.13.9.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_2.13.7.bb => python3-pylint_2.13.9.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.13.7.bb b/meta-python/recipes-devtools/python/python3-pylint_2.13.9.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pylint_2.13.7.bb
rename to meta-python/recipes-devtools/python/python3-pylint_2.13.9.bb
index 0aa645c82..1946a8923 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_2.13.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_2.13.9.bb
@@ -3,7 +3,7 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRC_URI[sha256sum] = "911d3a97c808f7554643bcc5416028cfdc42eae34ed129b150741888c688d5d5"
+SRC_URI[sha256sum] = "095567c96e19e6f57b5b907e67d265ff535e588fe26b12b5ebe1fc5645b2c731"
 
 inherit pypi setuptools3
 
-- 
2.25.1


