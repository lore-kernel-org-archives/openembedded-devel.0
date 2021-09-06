Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web10.16662.1630890745369028741
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 18:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Lpov1CPU;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630890743; i=@fujitsu.com;
	bh=URtJUt3dwWe6YnmdgC7M59CTJW9U1Ed6yqWAse1HF9w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Lpov1CPURDgcHPzXawPh6sBrGT/62Bg/dYvGlzPnK2mdQZw3jaf8l1ag8vG25pyeR
	 f8x8JQaa7oEVfZNLVy4EsLpq2HYtofNIPSJfKu7u9TvrdzfqfZZvLD6N06HTAMmc2M
	 RY0JnpqePiznY5BYNPTTAGrfbLnN0U5jk8RfBkP07D1VnRBA4dtsl7QPdCF7/aGvq6
	 qe7xI/yCNXudLsSChGL4CAAzhxkeCbz+FPPd8GUP3fzKn4kR95xyYRbqJ6Zompoy4B
	 sbZRwoFoX7oJ7On2BpK+i/ilqfV15Q3JyUXISuUN9Ln2IpejOTom6BTAV7x2U/TUeU
	 WD/SlCf8Nrupg==
Received: from [100.113.3.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 14/8D-32481-6FA65316; Mon, 06 Sep 2021 01:12:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MxVfdblmm
  iwdOpYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aHSWuYCyZxVDzr2cfewLiLvYuRi0NIYBaT
  xPume6wQznFGiSe7jjB2MXJysAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3DzuILSzgKdHa8
  A2shgUofrVlAVgvr4CTxO9zz8BsCQEFiSkP3zNDxAUlTs58wgIxR0Li4IsXzBA1ihKzLzezQN
  gVErNmtTFNYOSdhaRlFpKWBYxMqxgtk4oy0zNKchMzc3QNDQx0DQ2NdQ11jYzM9BKrdBP1Ukt
  1k1PzSooSgbJ6ieXFesWVuck5KXp5qSWbGIEhllLI+GgH4+nXH/QOMUpyMCmJ8mrYmSYK8SXl
  p1RmJBZnxBeV5qQWH2KU4eBQkuAtSwfKCRalpqdWpGXmAMMdJi3BwaMkwnspEyjNW1yQmFucm
  Q6ROsWoKCXOewAkIQCSyCjNg2uDxdglRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8rfFAU3
  gy80rgpr8CWswEtLjtoQnI4pJEhJRUA5Pd10eW7E6su+eXcQrkc/3tWsmspV79/cyzm6+kE2P
  /HjUXK+00ybq/u2KBSZnMlpxp33MdD6T0B23d75q1imvTLUF3j7OGmxyLlsv/bnvVIHPwavO2
  eq/LWlMPfz/9rqR+5tszz7qmfHGSVvRd+G3Lj4Yly7n7s0+qcbNYlC+fddrz7uRWdY1T23Y82
  C0SdduO88aXM2zHi970fVuk1/40Wk7ha2G27Kx3rKkPrRnPvl7NOFX2ecWz4+IqZQ12TnN81A
  WM1/plR+lE3rJJWPNkX2VA0L4Z/IfTt2rc2XlQx2153u4AsSy2TV+ORrguOx2uzap3w0NWUOk
  eh6n1S97Zz62Wvrt/uu6/5Zub56YrsRRnJBpqMRcVJwIAD6x9rSwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-232.messagelabs.com!1630890742!232111!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2314 invoked from network); 6 Sep 2021 01:12:22 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-2.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Sep 2021 01:12:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1861CFwf013497
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Sep 2021 02:12:22 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 6 Sep 2021 02:12:14 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] wireshark: upgrade 3.4.7 -> 3.4.8
Date: Mon, 6 Sep 2021 09:11:57 +0800
Message-ID: <1630890720-12064-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wireshark/{wireshark_3.4.7.bb => wireshark_3.4.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.7.bb => wireshark_3.4.8.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.7.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.8.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_3.4.7.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.4.8.bb
index fc360f6691..faf2a3ad1f 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.8.bb
@@ -19,7 +19,7 @@ SRC_URI += " \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "6c4cee51ef997cb9d9aaee84113525a5629157d3c743d7c4e320000de804a09d"
+SRC_URI[sha256sum] = "58a7fa8dfe2010a8c8b7dcf66438c653e6493d47eb936ba48ef49d4aa4dbd725"
 
 PE = "1"
 
-- 
2.25.1

