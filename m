Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web09.1739.1628233336207824095
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Aug 2021 00:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=g14cEiwv;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628233334; i=@fujitsu.com;
	bh=zJsybeDCS27sfHk58tLglrJR1al81lWewZf5ohHep+0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=g14cEiwvGbVlwbtzclkO41TU037rewkx7ynM1A3xPITgnvu7CeDt5DxYsepw7FoZP
	 8taSHs1mEzU5yJVqe6sVFjrKFDKSY4C4HfXkYOt/sv4tFJsaupOK3I1CeHmFVcdJr8
	 Ge8r8ap7CmSsvQpyM2r1d8Xv/w15nkKQ3sA1PgPiDJrStMkBJniMzsIRsVgGaSi1GP
	 NXL0VKQtAiYRO2my/mlL4v7VtG6N9GIgv/+rHcPqraEZOHHlTn0kWT1qTkMrRbUkAB
	 8fkeecq7dqLjYQRy+XHeyBwn78EAi7Ad/t4SWu28/CpmFxkPWPSMn4irI5kSYMrlPR
	 ROQsCp/mH3OcQ==
Received: from [100.112.192.148] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 07/B3-07317-67EDC016; Fri, 06 Aug 2021 07:02:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI1S27x5N
  oMOsJl8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHo7na2gmOcFatfP2ZpYHzG0cXIxSEkMItJ
  Yuez64xdjJxAznFGiaX3xEBsNgEdiY4X3SwgtoiAvsTS2XuYQWxhAT+J3s4lTCA2i4CKxKSfE
  HFeATeJP4eawWwJAQWJKQ/fQ8UFJU7OfAI2h1lAQuLgixdQNYoS23eeYYGwKyReH77EPIGRZx
  aSlllIWhYwMq1iNE8qykzPKMlNzMzRNTQw0DU0NNI1tDTRNTPTS6zSTdRLLdUtTy0u0TXUSyw
  v1iuuzE3OSdHLSy3ZxAgMopSCQ047GN+//qB3iFGSg0lJlLf5HE+iEF9SfkplRmJxRnxRaU5q
  8SFGGQ4OJQnevXeBcoJFqempFWmZOcCAhklLcPAoifB23QJK8xYXJOYWZ6ZDpE4xKkqJ85qB9
  AmAJDJK8+DaYFF0iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7wSQ8TyZeSVw018BLWYCWn
  whlhNkcUkiQkqqgWnazKUnje889eWdteMYv2gUh/DqFXyimzaof/72rWfLzV9+vCclwnuOr5O
  4G20WwM8f+ERFzoOPSTXGXuKyq+eN6Fpu5jd+388JebpwlDtvX7Xk5IQXx96ZzFhi+f9HCE9O
  x9bbe9q3Lb5+Ytm5hwcW5qklbDq/o2DOT7t3Uxu5S0sNo07fyXy0S3xyffv3DxOWeDRHzFjrt
  CeEL4Lv1J7T+pf0426teS//QWG7/l2xpaby+wV1TPb38XlxTfhVnD215/nnR9KXvvy5P/f7Ga
  WdBvVy3haGP2/2C/idXejS/SVYVC6Rw3ut5dxpb5UlWI818JxeqP5RiqlBjF+8f3rnrGe6cSu
  7f7+7eG/KJu3tSizFGYmGWsxFxYkA/p/2sh0DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-267.messagelabs.com!1628233333!360867!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5152 invoked from network); 6 Aug 2021 07:02:14 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-12.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Aug 2021 07:02:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17672DY0006018
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Aug 2021 08:02:13 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 6 Aug 2021 08:02:08 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-humanize: upgrade 3.10.0 -> 3.11.0
Date: Fri, 6 Aug 2021 15:02:02 +0800
Message-ID: <1628233322-7641-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Added
Add Bengali langauage (#221) @wasi-master
Fixed
Fix Korean localization (#219) @Craphting

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-humanize_3.10.0.bb => python3-humanize_3.11.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.10.0.bb => python3-humanize_3.11.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.10.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.11.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_3.10.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.11.0.bb
index 56983841cb..aacda65ca5 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.11.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "b2413730ce6684f85e0439a5b80b8f402e09f03e16ab8023d1da758c6ff41148"
+SRC_URI[sha256sum] = "4160cdc63fcd0daac27d2e1e218a31bb396fc3fe5712d153675d89432a03778f"
 
 inherit pypi setuptools3
 
-- 
2.25.1

