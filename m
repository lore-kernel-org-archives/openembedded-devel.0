Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.4322.1630042875246045955
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 22:41:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aJL7H8c2;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630042873; i=@fujitsu.com;
	bh=y/I1TwAnm5NvJ75+IJJ7wJW4sJVIxB69T4dGqjfkNhk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aJL7H8c2sSu/casw9eL3OknJPx1GTxUPQZB56MrU+eWQJDGlNf2VjkQqOUCpMvNb1
	 yLACqDiI1cZ0Y6Zr3C+Z9PqfQqIVuNCp/YKipyme6J/gbdB+F7e8GmFHB7OpxynW4U
	 5uZHWKY3pgdOVGEiMQsXeqcHbyJ5QBoPpfi8n65QQqT0tEwr1BR9TJBLs3o7V6Dh9F
	 pvDR/R4K9Q/b2hIrAgANZrqwzMUehu0ivjQDCc8vCR2GW1mEQtBtaKAFgSJIJwOWRw
	 3qriuu0t4kRGCnpuB7ovF/zTjAKETEs+yrWY6EiOX9zIuIZlCZMj0OPLuKDdPbu0vj
	 iT7eKSY1ZDIqA==
Received: from [100.113.6.84] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 48/A1-27408-8FA78216; Fri, 27 Aug 2021 05:41:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYovujSiP
  R4PQqDYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP+w92MBbM5K5rPrWRrYDzI0cXIySEkMJtJ
  YvVsoy5GLiD7BKPEpP49TCAJNgEdiY4X3SwgtoiAvsTS2XuYQWxhAV+J8xObwWpYBFQlzhyeD
  hbnFXCXeL/yKFi9hICCxJSH76HighInZz4BizMLSEgcfPGCGaJGUWL7zjNQ9RUSrw9fYp7AyD
  MLScssJC0LGJlWMVomFWWmZ5TkJmbm6BoaGOgaGhrrmuoamRjqJVbpJumlluomp+aVFCUCZfU
  Sy4v1iitzk3NS9PJSSzYxAgMppZD14w7GQ68/6B1ilORgUhLl3ZGukSjEl5SfUpmRWJwRX1Sa
  k1p8iFGGg0NJgnddBVBOsCg1PbUiLTMHGNQwaQkOHiUR3p5KoDRvcUFibnFmOkTqFKOilDivP
  0hCACSRUZoH1waLpEuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnDQKbwZOaVwE1/BbSYCW
  hxAZ8qyOKSRISUVAMTa4Ff+besbzXCuubr2ZXO62voK+1knpv31i2qKbt1p9RR/VvH9Vsz85+
  uSu7pMLpoGtzl4nHvX/iMeZ0e6tdmzdj8++906aPnPhc+e/BaqNf+q+yf2uqdrHyV3K9K2o/t
  Z/FnfTjpq2R5h93sxLcPH1xNaxR583G5x1RzGT6XWzkH/7jcunogpVIzbGH+z9IdTi27vt93u
  n/liiPL5OnN+zOmRIdseCkosHXfCv9LZnOYmN/slRfUsjp3Lkb6TVC3kYjq/7NVTJ/1naO2+Z
  euKdK6VhEe7Otfts9KKNfw57fbOpyFayX3mP45oyRa9uyrnl1ZsfR+sSmPw00a+TYEvL4l9Tz
  +Y0DFsT0TgvOVWIozEg21mIuKEwHDjuvnHwMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-248.messagelabs.com!1630042872!123027!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12408 invoked from network); 27 Aug 2021 05:41:12 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-7.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Aug 2021 05:41:12 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17R5fCDi013425
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Aug 2021 06:41:12 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 27 Aug 2021 06:41:10 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-haversine: upgrade 2.3.1 -> 2.4.0
Date: Fri, 27 Aug 2021 13:41:05 +0800
Message-ID: <1630042865-53233-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-haversine_2.3.1.bb => python3-haversine_2.4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-haversine_2.3.1.bb => python3-haversine_2.4.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-haversine_2.3.1.bb b/meta-python/recipes-devtools/python/python3-haversine_2.4.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-haversine_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-haversine_2.4.0.bb
index c24c6124e0..9eda659e1d 100644
--- a/meta-python/recipes-devtools/python/python3-haversine_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-haversine_2.4.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Calculate the distance between 2 points on Earth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI[sha256sum] = "75a7f859b3fb6df746564ca66ad1fd5b4052cdbab3d74ff16e8f1a7c3d4a26a5"
+SRC_URI[sha256sum] = "6dcdee48b854b7bd0a121a04a2cb775dc7d9e2354f1e22d29ff62110189305b0"
 
 inherit pypi setuptools3
 
-- 
2.25.1

