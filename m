Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8427AC47094
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.7050.1649903584341478505
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 19:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WvkSaXjc;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649903582; i=@fujitsu.com;
	bh=eoBa9oNFHOgNiSxzKvyWjVclBgKjM5FmnUVuzo2iFPk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WvkSaXjcjeq6H3fcgiQ2zT807RQOrJx0pNwu6Vw1qmosWvPkaHDnEU0CJ0aftBz1a
	 Jh705Z2zmuXXRLDiOMl6ucUoSvhFFZO5FThLNjNWDwhQTCj58LC89qadfoX3T3ssJK
	 AAOO0D2IsC+eb1h6ipuWlRZjSHR5vskf05stGHV2G+tkrGipiFQ/BR/DosCzuMz8hx
	 QR7djHRzxsE+nzL4YmRLda2tbQHeG9AlcXVeoXnElq4eEG1gr9IQ6xQM7GYJTb87Bm
	 0xxVjDjtWjSFIHYQKX/R5rb/51Qh90FO1kzHzZCLlsPPccj894nRiPLU9o1gs63Gsn
	 1ugC/bg8CRclA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8MxSfdue3i
  SQfsWC4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPFvs2sBS2cFWcX/2dsYFzO0cXIxSEk8IRR
  onX2GkYI5wKTxNqVJ5ggnD2MEn/OPGTuYuTkYBNQk5h+6wYriC0ioC+xdPYesDizgIrEi9897
  CC2sICtROvX+2wgNouAqsTSxi1gNq+Ak8S8DWfB6iUEFCSmPHwPZHNwcAo4SzzYnAESFgIq+b
  jhBCtEuaDEyZlPWCDGS0gcfPECqlVRYvblZhYIu0Ji1qw2JghbTeLquU3MExgFZyFpn4WkfQE
  j0ypG26SizPSMktzEzBxdQwMDXUNDU10zE11jE73EKt1EvdRS3eTUvJKiRKCsXmJ5sV5qcbFe
  cWVuck6KXl5qySZGYCinFDso7WA82/dT7xCjJAeTkihvlmF4khBfUn5KZUZicUZ8UWlOavEhR
  hkODiUJXq9WoJxgUWp6akVaZg4wrmDSEhw8SiK8TTVAad7igsTc4sx0iNQpRkUpcd7PbUAJAZ
  BERmkeXBssli8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuadCjKFJzOvBG76K6DFTECLv60
  KBVlckoiQkmpgEvaebG13OeFTWc/uqOe7NiS7735b/yl/Yjyn96d8uWW2JRd3eFVVqj8/6Cxa
  VX5lRj37k1ctN5sVHn9k8lw++19Q9t3gl127nJnaVR6LeWyozqpnYf4krHIh6cesHSxfbx3YI
  /jdQHZ///JS8dVTNV4u3PqvWTq0duP7uUZHZbXc4/pfP3h+9SHPP62/Teue7Mnu1pE6+TbDbN
  Ld3O+HJlm9vP4mfqby2sT1pVyL800+35l/hVuq7gDX8t2dO+b0svMJdRQ5qjR7mksdnKCxi1X
  BoKy01X/7lyDVx9dYfhufPlTs++FfcPzUD1ZLCiP+v+JWXeoSt/j6Sfbb/ctj17gVWCnaTDhx
  45i6uJbfNiWW4oxEQy3mouJEAB/x/YJgAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-528.messagelabs.com!1649903581!39317!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12135 invoked from network); 14 Apr 2022 02:33:01 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 02:33:01 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 77A1F100471
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:33:01 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 651D110046B
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 03:33:01 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 03:32:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pegtl: upgrade 3.2.1 -> 3.2.5
Date: Thu, 14 Apr 2022 10:32:30 +0800
Message-ID: <1649903550-17752-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649903550-17752-1-git-send-email-wangmy@fujitsu.com>
References: <1649903550-17752-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96635

Changelog:
==========
Added missing include for fallback demangle() implementations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/pegtl/{pegtl_3.2.1.bb => pegtl_3.2.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/pegtl/{pegtl_3.2.1.bb => pegtl_3.2.5.bb} (85%)

diff --git a/meta-oe/recipes-extended/pegtl/pegtl_3.2.1.bb b/meta-oe/recipes-extended/pegtl/pegtl_3.2.5.bb
similarity index 85%
rename from meta-oe/recipes-extended/pegtl/pegtl_3.2.1.bb
rename to meta-oe/recipes-extended/pegtl/pegtl_3.2.5.bb
index f0ae229414..b4e0d17b37 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_3.2.1.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_3.2.5.bb
@@ -3,8 +3,8 @@ HOMEPAGE="https://github.com/taocpp/PEGTL"
 LICENSE="MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5b6701671289d12b7ffa69138832c006"
 
-SRC_URI = "git://github.com/taocpp/PEGTL.git;protocol=https;branch=main"
-SRCREV = "6d03c8decc22b4ddd51115e2170e0e82413c7104"
+SRC_URI = "git://github.com/taocpp/PEGTL.git;protocol=https;branch=3.x"
+SRCREV = "eeba7fa1180655bd683be620cc31be35607442ca"
 
 inherit cmake
 
-- 
2.25.1


