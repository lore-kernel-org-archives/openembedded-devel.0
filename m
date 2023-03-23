Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DCEC76196
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 05:15:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.65411.1679548502899202765
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 22:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dPrF78oT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679548501; i=@fujitsu.com;
	bh=2XING2MjxIzdZyJKKKDaX21mhmUzb2Dck4oqQh7EZp8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=dPrF78oTVXV0PkMRn4SIpjPFXgxmhwuL5rkft/iHaZBw95th+sGpfiSW0fyg3i2eF
	 21qmdo27TsaYYmV5AuGMEgeL1TNo3OzrPkD6eT194mgeQnPpZEg2B36ix8umr0KXmr
	 IG2JIBtnVUcTcWg2XYzSJ8NheCOr2DtYggQScJpJ1x8N7gxf/UtECFMk4kJYoYnfND
	 qYUBBQaOd87UGnX91j1dwxCEuq9hGOlp5nsa0GFVSPad7KijP7CGRyxsk8FoWcMr0d
	 IcEk0EED2CYlCGeLrjxcxgE89IrU/Bpn9o5tS+nhdaFJQHBjTOm+KC94BKV28/Ypbf
	 ZWr9WpdUqamQw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqBv8QDr
  F4PRKA4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePJ4YNMBQ85KibeWMfUwNjO0cXIxSEk8IRR
  Yt28g+wQznUmiUmz5zN1MXICOXsYJW58jgKx2QSkJG7c/88GYosI6Essnb2HGcRmFlCRePG7h
  x3EFhbwlJj96CKYzSKgKvHx5AqwGl4BJ4m3kw+D2RICChJTHr4Hsjk4OAWcJc43JUCscpJ4fP
  8AE0S5oMTJmU9YIMZLSBx88QKqVVFi9uVmFgi7QqJx+iEmCFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbz4tSistQiXUMjvaSizPSMktzEzBy9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK94src5JwU
  vbzUkk2MwOBNKU5z28H4u++v3iFGSQ4mJVFeiVDpFCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  AJ3gHKCRanpqRVpmTnASIJJS3DwKInwzj0IlOYtLkjMLc5Mh0idYlSUEudlug+UEABJZJTmwb
  XBovcSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFenXtAU3gy80rgpr8CWswEtDhuhgTI4pJ
  EhJRUA9OKUjaGaTF6+4p+HV235iGXdiuH/Fk305snUmKsV0/0Zt7uMTveUNOaOfmog93Va11q
  v7+GZfuZqIQtNqs/InXHV3JrMd9m75WCSivSNlrPcvpi8mvGi49bwt04WDrCZSODOgyTSzZWP
  pvFaHdN72i3ZupW/iW/NW7kbE0OCDzzRmuP4c1Vd9acW8OW13BrxdwpS7Yc8ompuHF4fsfcS0
  8vKe+K28VoK1f1yPpl26YTvouy1i9Onvot3P/56/LOC91i75kzP81QeBBWcGdubMrSTY2XHbb
  Msz8s9cV6ZQpTzITYv65TtZkaZnipHzTiP5/h57HHoJI9VWbXHrfZ+0UmN39Ydnai6rkU1iB+
  uZdKLMUZiYZazEXFiQCcw4j1WQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-728.messagelabs.com!1679548499!172097!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1485 invoked from network); 23 Mar 2023 05:14:59 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 05:14:59 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2DA0010019C
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:14:59 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2146110019A
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:14:59 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 05:14:57 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 5.31.4 -> 6.0.0
Date: Thu, 23 Mar 2023 13:14:26 +0800
Message-ID: <1679548466-20438-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679548466-20438-1-git-send-email-wangmy@fujitsu.com>
References: <1679548466-20438-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101661

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_5.31.4.bb => python3-web3_6.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_5.31.4.bb => python3-web3_6.0.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_5.31.4.bb b/meta-python/recipes-devtools/python/python3-web3_6.0.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-web3_5.31.4.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.0.0.bb
index cc95c0600..060cc3ed0 100644
--- a/meta-python/recipes-devtools/python/python3-web3_5.31.4.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
 
-SRC_URI[sha256sum] = "f763d339dd63f922920c8a53cb46e8ee47d9ea7efaba9b8cf006956661d874d0"
+SRC_URI[sha256sum] = "6b925a19e4a0001337d8b2faa72577d6b7e8f9a8a9a0b98d8834cdf698cfc045"
 
 inherit pypi setuptools3
 
-- 
2.34.1


