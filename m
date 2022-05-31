Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CDAC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 09:45:56 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.47372.1653990349728394854
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 02:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=s+w17Dby;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653990348; i=@fujitsu.com;
	bh=OI9Lzw36JmDT4yGmtNywgFRSB3pTk06t39VxMvRM7hY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=s+w17Dbym+nDxNoqXrVADzQRO0ubjJhq+VIJhC5qRryNVfaH7uhvncMN+edLEOfKr
	 TVOzWALgBlm4CfQGqYD0I79dmjVQ7VdpKf1i7sMuA2pUZOiRRugde/pu4x3eCqBqRd
	 HPY1BHUckisPAwMYTyPE0TXHLVo7fxCxaGzF/x14D3ivKTb7NmTLYNBXauMBrbG13j
	 O5RKA/gmqjDJ1Axx0SFeCxKjnJfXcNT67r0pTycmlXTai6ctRYrI18VV/rdOtjk4fZ
	 fJSwOfWX53dWA4q4Ewd+0gHAgKeTHnUnp4hG5jkRiUfi9+y3YLt95H0tXEDUENNNp+
	 J+b7BoWubDZSA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8OxWff046l
  JBi+WqlhcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBmvlioWTOOuuHb/PHsD41vOLkYuDiGBh4wS
  L6dfZYRwzjJJLLtwixnC2cMocf91C0sXIycHm4CaxPRbN1hBbBEBfYmls/cwg9jMAioSL373s
  HcxcnAICzhI3JxeCBJmEVCVOLvmKVgJr4CTxNMd1xlBbAkBBYkpD9+DxTkFnCWOTV8AZgsB1b
  xcvYUFol5Q4uTMJywQ4yUkDr54wQzRqygx+3IzC4RdITFjxjY2CFtN4uq5TcwTGAVnIWmfhaR
  9ASPTKkabpKLM9IyS3MTMHF1DAwNdQ0NTIG2oa2ygl1ilm6iXWqqbl19UkqFrqJdYXqyXWlys
  V1yZm5yTopeXWrKJERjGKcWpcjsYD+z7pXeIUZKDSUmUN/jy1CQhvqT8lMqMxOKM+KLSnNTiQ
  4wyHBxKErw1D4BygkWp6akVaZk5wJiCSUtw8CiJ8Lo/BErzFhck5hZnpkOkTjHqcsz82naAWY
  glLz8vVUqcd/I1oCIBkKKM0jy4EbD4vsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmLcXZBV
  PZl4J3KZXQEcwAR1x7dsUkCNKEhFSUg1MZtXBuS0qepqVjd8l80/ZxWoYnz2ROjVq7prgz5/U
  ueS3FlSHllpaBcWKSpy6uH2Pz7Zlxzum9zN94pUTSU/0tSlXatu96fe8ivW73zJ6m0y8oFp2R
  yz7bpCArVLCPiuXCu6EJJ5/exk1T/849FQyyYD19sm05jm1C8uE5VKlwk8Fvb4Xe4PlyomIv1
  MizITzpnxZeja6+ciuY0c+vXCska8z5Cx5X2fEnHP/xZK0B3Pnrf8jwihza8O5iOzjfwrbJXR
  MMuYI+X1p4y60a1x7XeT3s0svmTef2CX0RdL1T0Fa00LJtXvMXa53KwUdirx1/Ojf+XbvHAUc
  Lp5mZrxS8H2596Jr32VEsm/8fndciaU4I9FQi7moOBEAfJH692oDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-745.messagelabs.com!1653990347!221854!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14507 invoked from network); 31 May 2022 09:45:47 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-2.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 31 May 2022 09:45:47 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 861F08A2
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 10:45:46 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 4E330813
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 10:45:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 31 May 2022 10:45:38 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hidapi: upgrade 0.11.2 -> 0.12.0
Date: Tue, 31 May 2022 17:45:18 +0800
Message-ID: <1653990320-31470-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653990320-31470-1-git-send-email-wangmy@fujitsu.com>
References: <1653990320-31470-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 May 2022 09:45:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97345

Changelog:
==========
  Windows: migrate from SetupApi to CfgMgr32 (#362) - as per recommendation from Microsoft;
  Windows: add hid_winapi_get_container_id WinAPI-specific function (#379);
  Windows: improved error messages (#388);
  Windows: fixed out-of-boundary memory access for some of the function (#418);
  windows: Add .rc (#415);
  macOS: add hid_darwin_get_location_id macOS-specific function (#378);
  macOS: add macOS-specific function(s) to open device(s) in non-exclusive mode (#397);
  libusb: improved CMake dependency on Iconv (#405) - as a result, better support for NetBSD;
  general: documentation improvements;
  general: small code cleanups/improvements;

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/hidapi/hidapi_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/hidapi/hidapi_git.bb b/meta-oe/recipes-support/hidapi/hidapi_git.bb
index 1c57a1d83..4aa58ec7f 100644
--- a/meta-oe/recipes-support/hidapi/hidapi_git.bb
+++ b/meta-oe/recipes-support/hidapi/hidapi_git.bb
@@ -12,6 +12,6 @@ RDEPENDS:${PN}:append:libc-glibc = " glibc-gconv-utf-16"
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/libusb/hidapi.git;protocol=https;branch=master"
-PV = "0.11.2"
-SRCREV = "31bde69a1f08c880ef1622f2586eea0daf3b0857"
+PV = "0.12.0"
+SRCREV = "76108294092c023a4ece99eb3219559cea0d5066"
 S = "${WORKDIR}/git"
-- 
2.25.1


