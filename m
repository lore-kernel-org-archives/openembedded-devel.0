Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.69])
 by mx.groups.io with SMTP id smtpd.web10.2102.1617244026611077321
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 19:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.69, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id B3/93-53303-87F25606; Thu, 01 Apr 2021 02:27:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYoluun5p
  gsG2njcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtG7aT17wR/Oir1LTjE2ME7i7GLk4hAS2Mok
  0XLtPjOEs5tRYub/VUAOJwebgIHE/rMX2EFsEQF9iaWz94DFhQU8Jf71HQOzWQRUJLbteMYIY
  vMKeEvsenKPDcSWEFCQmPLwPTNEXFDi5MwnLCA2s4CExMEXL4DiHEA1ihKzp8tDlFdJnJ39hW
  kCI88sJB2zkHQsYGRaxWiRVJSZnlGSm5iZo2toYKBraGika2hppmtkaKKXWKWbpJdaqlueWly
  ia6iXWF6sV1yZm5yTopeXWrKJERhGKQVHru1gPPD6g94hRkkOJiVR3inTUhKE+JLyUyozEosz
  4otKc1KLDzHKcHAoSfAe0kpNEBIsSk1PrUjLzAGGNExagoNHSYTXRgMozVtckJhbnJkOkTrFq
  CglzsulB5QQAElklObBtcHi6BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV4ZkCk8mXklcN
  NfAS1mAlp85VEiyOKSRISUVAOT5bH3omZzr6zfPqPva63R8WivmLkFS+qmsCSmX6r4Vlone9T
  g4wHDntWfNzk9invnruV+kiPxxO8HBywi8isb9s5xEbzhUsT+kS1m82Rukaj+pt/Bhmp5M43a
  2o43KWYyLfq4ZJoIP4PR41tXvPU22X/d8oDry8fpBxIi/iWuebW8IHDupEuKWw+9mXxsyT+b0
  BqRe0ZyZ6K3x1/cmBeQW7KOOUSOq2Mt7yPFY7Xyj+ZbdW6tihG3OSp3OO1RYuyZQImds+8yCx
  mluHRwvxRw3bKpxYIjpUNsr9WefU1n/8xTuGWyqYbJQueddZGI7oU12u9fHusxeXbNUXdr++N
  9bpL9itYyk7bNm1Jkc22WEktxRqKhFnNRcSIAcG0DJx4DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-287.messagelabs.com!1617244023!101848!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17046 invoked from network); 1 Apr 2021 02:27:03 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Apr 2021 02:27:03 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1312R3XI024383
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Apr 2021 03:27:03 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 1 Apr 2021 03:27:02 +0100
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] snort: upgrade 2.9.17 -> 2.9.17.1
Date: Thu, 1 Apr 2021 18:58:46 +0800
Message-ID: <1617274726-49971-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../snort/{snort_2.9.17.bb => snort_2.9.17.1.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/snort/{snort_2.9.17.bb => snort_2.9.17.1.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.17.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.17.1.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/snort/snort_2.9.17.bb
rename to meta-networking/recipes-connectivity/snort/snort_2.9.17.1.bb
index 324114f63..9c20be537 100644
--- a/meta-networking/recipes-connectivity/snort/snort_2.9.17.bb
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.17.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://www.snort.org/downloads/archive/snort/${BP}.tar.gz \
     file://disable-run-test-program-while-cross-compiling.patch \
     file://configure.in-disable-tirpc-checking-for-fedora.patch \
 "
-SRC_URI[sha256sum] = "c3b234c3922a09b0368b847ddb8d1fa371b741f032f42aa9ab53d67b428dc648"
+SRC_URI[sha256sum] = "303d3d5dc5affecfeaad3a331d3163f901d48d960fdd6598cb55c6d1591eed82"
 
 UPSTREAM_CHECK_URI = "https://www.snort.org/downloads"
 UPSTREAM_CHECK_REGEX = "snort-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.25.1

