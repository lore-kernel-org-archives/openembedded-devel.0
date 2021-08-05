Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.6669.1628157083278062826
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Aug 2021 02:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pIP24z5S;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628157081; i=@fujitsu.com;
	bh=rczdc8OaDj2IA5SJ5X/XSTTNfhmz3Dep3uZm335JdZc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pIP24z5S55312mzdi20q+RwMIrtFdJMIJaYazA3RXYrFTboCeecV4n2vcW51ngtj0
	 VbXywX6n7Q+Rq7KNoI14WMQgaQ/o/eqsXTCoR68MMQFROnYdCkfBfvvTl7F109ms5X
	 QjupZTXSndBkm0zD9RdP1sJ6FjkDRE7/45eLJcTzRxOszRs/X1rZVpcgacZFgM9EPW
	 7gVjfjMqR/69pBXedp62Y+YR8GIZR8sPk6KU4Bqyj8HVTC1AYyOqQQTwLXnXh5YNyL
	 MOVrtrtplp9V8H0DapMN0d0E85q1SSqBPkoCXZcvGFfs6eWtph2PqDmy13QVSq8nKk
	 0IMVrXCbApnrw==
Received: from [100.113.1.116] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id FF/83-16478-994BB016; Thu, 05 Aug 2021 09:51:21 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+GYojtzC3e
  iwfKfjBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bCFadZCt5xVpy7+Jy9gbGBs4uRi0NIYBaT
  xMXfbxkhnOOMEvNmTWbuYuTkYBPQkeh40c0CYosI6Essnb0HLC4s4CWxamUrO4jNIqAi8ebzC
  zYQm1fATeJW72ywegkBBYkpD98zQ8QFJU7OfAIWZxaQkDj44gUzRI2ixPadZ6DqKyReH77EPI
  GRZxaSlllIWhYwMq1itEwqykzPKMlNzMzRNTQw0DU0NNY11DUyNtNLrNJN1Est1U1OzSspSgT
  K6iWWF+sVV+Ym56To5aWWbGIEhlJKIeObHYxfX3/QO8QoycGkJMqr38udKMSXlJ9SmZFYnBFf
  VJqTWnyIUYaDQ0mCV2UzUE6wKDU9tSItMwcY1jBpCQ4eJRHexZuA0rzFBYm5xZnpEKlTjIpS4
  rytIAkBkERGaR5cGyyWLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5i0EmcKTmVcCN/0V0G
  ImoMUXYjlBFpckIqSkGph6Hmw596Z9UfFPbof3UdbChsnb59owHD5eqbVtjuwswV9q1Us5V29
  Sn7C2nOlT1Nzb+RaP9so8WvbffV5ialf2M+7X32afOmTcsPFh8Hl2ebYE4azMu2LCikpJJet8
  jq5j4mhjO7h8U8SDSOt3WkY/Tmb+LHx9sdPg9cLdbGVBTlfTp+TULFu369q/9xZL/zdXBehIX
  NM6ZJa8/MLamkghsRl8cv//HvM03quqc7HgW+2mzzcFc345JvF7Np3vyl3GIbdm4aOQvvZsoT
  2PHWtDVMPUzt64luetuuDP2eLLB6PlrnTcORY1X5itkvH02kuTd0iUJQT6LFpp/lo9KbMv9lk
  v31J+ljnSIs9aVZ2UWIozEg21mIuKEwEZYULsIAMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-228.messagelabs.com!1628157080!9089!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25918 invoked from network); 5 Aug 2021 09:51:20 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-14.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Aug 2021 09:51:20 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1759pKD4002411
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 10:51:20 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 10:51:18 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-tqdm: upgrade 4.61.2 -> 4.62.0
Date: Fri, 6 Aug 2021 05:51:12 +0800
Message-ID: <1628200272-4673-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

asyncio.gather API consistency with stdlib (#1212)
fix shutdown exception (#1209 <- #1198)
misc build framework updates (#1209)
add GH Sponsors & merch links

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-tqdm_4.61.2.bb => python3-tqdm_4.62.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.61.2.bb => python3-tqdm_4.62.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.61.2.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.62.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.61.2.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.62.0.bb
index ef0e5f40a4..f9b530d652 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.61.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.62.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=59e4271a933d33edfe60237db377a14b"
 
-SRC_URI[sha256sum] = "8bb94db0d4468fea27d004a0f1d1c02da3cdedc00fe491c0de986b76a04d6b0a"
+SRC_URI[sha256sum] = "3642d483b558eec80d3c831e23953582c34d7e4540db86d9e5ed9dad238dabc6"
 
 inherit pypi setuptools3
 
-- 
2.25.1

