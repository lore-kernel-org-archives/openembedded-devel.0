Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BC8C6FA85
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 01:35:46 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.1689.1662082541805508351
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 18:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ANh71PcP;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662082539; i=@fujitsu.com;
	bh=gZ9i1JXEJ0RcRFMnKCdzn6u8p9Q2BHvaZBHFSFNimDI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ANh71PcP78DIDtkOOvLEuBIXQNZG19g63Z3xwhub9j7T/UhFlB7j8z5QOQ/mSgmFB
	 qnpVF9EcVMNewJHGiiHgCYtfXVzX5B5+msB9L/Y6jkbmvbnhqHGg027AgeEJR6oG1p
	 aZBuoa2iTpqbqGmbKsUKqrAsSJw9BmIbxEVGU+rlIoAhdLpfxAlnv1Li7Ooq0844Jy
	 XXMQlpvzkamsS5YAnxB0x4HyVdcARj6ZWMiCLAK/kjyZDATMzF3HkJuBFc35xjWjzf
	 +sGkvOwkyFY3hF5oU6/Lh6jdCKRmhC6c2hDrS4W+Wu2vK+WEzIjBdKPZjJW5ZtTx5F
	 DNJ68R13Kdiaw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRWlGSWpSXmKPExsViZ8ORqPs6VjD
  Z4IOqxcXDS5kdGD3ObVzBGMAYxZqZl5RfkcCasfN0H1PBAc6KczfuMTYwPuPoYuTiEBJ4wijx
  7ORlFgjnOpPE2+Yf7BDOCUaJXcueMHYxcnKwCahLPL75GswWEdCXWDp7DzOIzSygKtF9cQ07i
  C0s4Cux/cghJhCbRUBF4uyvI6wgNq+Au8SGXRfYQGwJAQWJKQ/fg/VyCnhITFpxHyjOAbTMXW
  LLe0+IckGJkzOfsECMl5A4+OIFM0SrksSJFR+ZIOwKicbph6BsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYbZOKMtMzSnITM3N0DQ0MdA0NTYG0ka6hqbFeYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFe
  cWVuck6KXl5qySZGYCCnFKfN3MG4Zd8vvUOMkhxMSqK8TH8EkoX4kvJTKjMSizPii0pzUosPM
  cpwcChJ8GrFCCYLCRalpqdWpGXmAKMKJi3BwaMkwvs3HCjNW1yQmFucmQ6ROsVoyTF19r/9zB
  zLweTMr20HmIVY8vLzUqXEeWOjgBoEQBoySvPgxsEi/xKjrJQwLyMDA4MQT0FqUW5mCar8K0Z
  xDkYlYV7/CKApPJl5JXBbXwEdxAR00PSZ/CAHlSQipKQamGaePSSbzaYf6Lw2IpOHN31BZHfh
  1oDN75JfLr4q9erV3SnpVTL5hxnF7kbvWmW66ssK/7DH13v+TPe7OHP5x8VLAj8yFsddl+lbc
  spm5xHB/uqiRMVn73wWHi8qlE95fOLUNtkJe5rFvmzO3Nf81SyR6+HCLXr9F1wv8Z1+vnTRN+
  +d02eV1VWvrDXd+uuP7beGrSynFGdbJ20KfDhv3mSdg4dV2SMa65l+H9j30H55dKni5KtiPj6
  RsXKGFSnLJj4Myn34OjQ25LZKr57h/Q+KGh/XWnMIH5m4/fUkda6lmoozTGPyoqrTr32ffElA
  eO/J23etjyfYT3ka/qTqc+vPgN6TkpqRBx+v4orQYDJQYinOSDTUYi4qTgQA+Yt/TXcDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-745.messagelabs.com!1662082538!49176!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20474 invoked from network); 2 Sep 2022 01:35:38 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Sep 2022 01:35:38 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6B460100198
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  2 Sep 2022 02:35:38 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5F839100043
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  2 Sep 2022 02:35:38 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 2 Sep 2022 02:35:36 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xmlschema: upgrade 2.0.2 -> 2.0.3
Date: Fri, 2 Sep 2022 09:36:41 +0800
Message-ID: <1662082601-12677-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1662082601-12677-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1662082601-12677-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Sep 2022 01:35:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98593

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-xmlschema_2.0.2.bb => python3-xmlschema_2.0.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_2.0.2.bb => python3-xmlschema_2.0.3.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_2.0.2.bb b/meta-python/recipes-devtools/python/python3-xmlschema_2.0.3.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-xmlschema_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_2.0.3.bb
index eb9d4f511b..5c1c60f601 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_2.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
 
-SRC_URI[sha256sum] = "ce915696b3a819fe0f986824517b9281dbd5626fd2d213363fab40f34edf05bd"
+SRC_URI[sha256sum] = "adef8cb1e6572fe095b56ae4243b3618f842b32adba98e1b1bab0bd014f2234e"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.25.1


