Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FE8C77B60
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:05:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.66298.1680516345778675597
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:05:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vT/ieXR1;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516344; i=@fujitsu.com;
	bh=7/wrCJ3iD+uM91gd0kt8rKUCVZIf14QSDpxNjk/aHuY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vT/ieXR1R9LTVK7AYHKkRcATkNFKv/TB/k6fNnlmF7GUaZR2hd2oI6ELJ8uO0QFHj
	 S7QSZSOSEZkT+7w95u9qCoqMNWvGhjxjxbL8yXQRvX/HbkisyLtQeXiyF/WIj5jvKf
	 UjhXKqD0n6Qd5jVTjBgiuq7kJzcLtdmV7OwxkIy9V9NqxXQqYzy8PVBIshkrn6GfPe
	 TeKle3N/CMN9VSMPEG7irMBo4PvsqOL+0BiGhNRv3tvlKBNVt/ZESSmDsybtflBcSX
	 /O9NU1pb0ayRdI4AluwQqywrLojIUdXxzVdRMyvQALkYCvP6/+Rq4oHFrGWELzInHB
	 uACC+M1uESDPQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORpPt9iVa
  Kwd41FhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bJ1l/MBW+4KlatbmVvYHzP2cXIxSEk8JBR
  YtvprWwQzhUmie83NjJBOLsZJVa0LmbsYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAV+LknO9gcRag+Ic5J8HqeQWcJNp+TgCbIyGgIDHl4XuwGk4BZ4lju5pZQGwhoJqOK6
  3sEPWCEidnPmGBmC8hcfDFC2aIXkWJ2Zch6iUEKiQapx9igrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0K04tKkst0jU01EsqykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknR
  y0st2cQIDN+UYmWPHYxP+/7qHWKU5GBSEuUVrNdKEeJLyk+pzEgszogvKs1JLT7EKMPBoSTBO
  28RUE6wKDU9tSItMwcYSzBpCQ4eJRFexQVAad7igsTc4sx0iNQpRkUpcd7TIH0CIImM0jy4Nl
  j8XmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzCu2GGgKT2ZeCdz0V0CLmYAWt0ZpgCwuSUR
  ISTUwsc9W5WtW538jq/rTL/Z/07rPf9mZWaJ8DkUI3fJOn2PgFFo8bW9lz/fktTOjrjB9P5E4
  5zjLxh7mzufHZ2V/L3o071zM7e3iM6yOztV4df9xc1DrxdKjZdeXJiR/7LDzefCPWeHV77sJT
  styFD1fxS5oLih2OMb//zfHfuUPfQ5m756bTMpl2nnOVd77ndI9g7//w5lnfV/BWOD344t4R5
  at9orEw0Li8w1Om347NHPmb1M/Fo+/LUFxlarnDCLOi379cnLB9oe8O+oMeM0/c33Jq3rwaUN
  Im6Sc2qVql9NaV36e81h23o3pcXPoVFMLBQXLWiXWS28aWQWfd1lb51b2mn4zy3D0vqH08mCu
  EktxRqKhFnNRcSIA2ln9bloDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1680516343!192340!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20320 invoked from network); 3 Apr 2023 10:05:43 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:05:43 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9F3851D0
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:05:43 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 93E191B0
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:05:43 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:05:41 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-jdatetime: upgrade 4.1.0 -> 4.1.1
Date: Mon, 3 Apr 2023 18:05:22 +0800
Message-ID: <1680516324-30996-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516324-30996-1-git-send-email-wangmy@fujitsu.com>
References: <1680516324-30996-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:05:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101921

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Add
------
    Add fromisoformat method to jdatetime.date
    Add support for Python 3.11

Fixed
------
    Fix two chars month handling in jdatetime.datetime.strptime

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-jdatetime_4.1.0.bb => python3-jdatetime_4.1.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jdatetime_4.1.0.bb => python3-jdatetime_4.1.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_4.1.0.bb b/meta-python/recipes-devtools/python/python3-jdatetime_4.1.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-jdatetime_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-jdatetime_4.1.1.bb
index c96e5c39e..1b65f3bc9 100644
--- a/meta-python/recipes-devtools/python/python3-jdatetime_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_4.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/slashmili/python-jalali"
 LICENSE = "Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c80be45b33471b4a23cf53d06a8172be"
 
-SRC_URI[sha256sum] = "4a67a82ee57e35b5f6f9f7fbe6a0eda63f56ce1dd8af409b4c2a26a3340457db"
+SRC_URI[sha256sum] = "1dd0ee210160c7bd30002803c443e6260ac602ea65b065652a1d567d3bfdca7a"
 
 PYPI_PACKAGE = "jdatetime"
 
-- 
2.34.1


