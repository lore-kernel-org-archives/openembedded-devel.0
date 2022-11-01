Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04889FA3740
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 02:08:37 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.1670.1667268513101139897
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 19:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ji2PWwNV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667268511; i=@fujitsu.com;
	bh=iLgvu0n8pvt4t4vKhXHDz83bz/xYSis9bgGYu0fX+Cs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ji2PWwNVVJQAhvL1ub4aTo2X6R7D0OEtzkj6HtIwOrNdhyHjyJtJot4vJSMF2FwGK
	 AIWPQJWh4mleOBeGGM7d3+IE2T/4Y3ZgiJciQDoh9pC4KfbHlZQJo7EAnk+4PCz2CU
	 xs2WszjQBGKNtXM6dlvOF6qdDGD7iEHEC3aoVTrrwg3GEZTqE1w7Fd7bBFIh5wBsnT
	 As6k3cniyDzJe4th1TQft2s3NRThV9m7p926Mc+Zwf63qwhXv/iLw9I8LHYd0vLeRK
	 4zndNFS7teOG55cPdCOS5xOrw1+fdtcyrbo6XQ82lXf8KXl9jhLr32huFn+iOu0ZLC
	 5B2Yp1xgHzvkA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8ORqDuvPiH
  ZoHWJvsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFgk2rBYa6KZZ2X2BoY93N2MXJyCAk8YZRY
  89Wgi5ELyL7OJLGk9z0bhLObUWLd5r+sIFVsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC3hI3Jl0iBHEZgGK31lxjQXE5hVwkvi6fznYHAkBBYkpD9+D9XIKOEt8/H6LCeIKJ4mTj8
  4xQtQLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0LU4tKkst0rXQSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM3JRi9a07GA8v+6N3iFGSg0lJlPe/REKyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQney
  BqgnGBRanpqRVpmDjCKYNISHDxKIry/qoHSvMUFibnFmekQqVOMlhxTZ//bz8yxHEzO/Np2gF
  mIJS8/L1VKnNepFqhBAKQhozQPbhws0i8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZtALm
  KJzOvBG7rK6CDmIAOYmuPAzmoJBEhJdXAtCFgj//017FmO8qU28o7limosM35/L9/byKbYddW
  5Zub36id+uxiK2ZsyJPplX32VHZMqfX9P3Lnj2/Ynr9BxH5yJM8W5r+X34jNv3nq01L54zv3M
  QbE/DK/UGnXxyx9YP2f/W+z7F5/75NfW244PfH98Tnbnn4TlS/YoDfzufbPH1x2oios6gkLZg
  WGTexaaMk4z/WWsoHW9Y8ypS8/Mk3SvmEgeS7kiGjZhgvax36eYRe45yo1S7hFXz6W6c/sDx9
  dNG/U8VttPW/pxeTAUXU1/L6q6Bdd9tr4HTrmvi9P18xYJWiQ8CjZRnfZKb/6HffUbAXCGBy2
  PzLl1xHqe77+x5KHJblzzPqtzzirK7EUZyQaajEXFScCACdtcF9vAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-548.messagelabs.com!1667268510!51255!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26383 invoked from network); 1 Nov 2022 02:08:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Nov 2022 02:08:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 7F159100191
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:08:30 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 71719100043
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:08:30 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 1 Nov 2022 02:08:28 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pint: upgrade 0.20 -> 0.20.1
Date: Tue, 1 Nov 2022 10:07:57 +0800
Message-ID: <1667268480-10004-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667268480-10004-1-git-send-email-wangmy@fujitsu.com>
References: <1667268480-10004-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 02:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99388

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Simplify registry subclassing.
  (Issue #1631)
- Restore intersphinx cross reference functionality.
  (Issue #1637)
- Use a newer version of flexparser that can deal with
  imports in linked/temporary folders.
  (Issue #1634)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pint_0.20.bb => python3-pint_0.20.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.20.bb => python3-pint_0.20.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.20.bb b/meta-python/recipes-devtools/python/python3-pint_0.20.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pint_0.20.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.20.1.bb
index fc25eeed47..625f50f847 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.20.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.20.1.bb
@@ -10,7 +10,7 @@ PYPI_PACKAGE := "Pint"
 
 inherit pypi ptest python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "4035f6d1431913afd86a056959e35d342399b0ab7d6f8cad1f0f6058dc83fad8"
+SRC_URI[sha256sum] = "387cf04078dc7dfe4a708033baad54ab61d82ab06c4ee3d4922b1e45d5626067"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.25.1


