Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web10.4317.1630042850853726595
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 22:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Y/JwEQLt;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630042848; i=@fujitsu.com;
	bh=qPmq8MwUi2B1s1Nm8PRYGHYfVYlfSFcaWq5M7xcXlDU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Y/JwEQLtLXGzri7fjRd+JOS45FdrMLHTrQCQB323un9V88+LkFmarWJRnu+MsdzoW
	 rYUCcC8OtUgiJqhcor5YNIolmYzj+XWpCTcBuc3zEncvvhXQKslS6kMPrcaVuz0njS
	 7DkVhXyI5bvS7SVnrYi/YgAVePjPP8TvZBfh1W4kUV6Nk8XDG+5kRHKdM97CYrV5Km
	 cCkeA/puHWvLfWuk9NTQQ8nIFNBZjUDGuBcUreeLz+Md/xlNymPmmCQDGEUBRspAD4
	 35GEwJASyIvmOQQ6AtGytaUXzbt4MofiZUGiWtCpD5IihX+I4Jmo6nvI2Lq8JiR5wx
	 zHcgDMeOPBZPA==
Received: from [100.113.3.88] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 1F/68-28153-0EA78216; Fri, 27 Aug 2021 05:40:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplkeJIrShJLcpLzFFi42Kxs+GYonu/SiP
  R4Fq/tsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtHReZWp4AZXxeqbrYwNjMs4uxi5OIQEZjNJ
  XHn6gBnCOcEoseHpBJYuRk4ONgEdiY4X3WC2iIC+xNLZe5hBbGEBD4m7GzrAbBYBVYm5q7Ywg
  ti8Au4S1+8fAquXEFCQmPLwPTNEXFDi5MwnYHFmAQmJgy9eMEPUKEps33kGqr5C4vXhS8wTGH
  lmIWmZhaRlASPTKkbLpKLM9IyS3MTMHF1DAwNdQ0NjXWNdQ0sTvcQq3US91FLd5NS8kqJEoKx
  eYnmxXnFlbnJOil5easkmRmAopRQyH9rB+OT1B71DjJIcTEqivDvSNRKF+JLyUyozEosz4otK
  c1KLDzHKcHAoSfCuqwDKCRalpqdWpGXmAMMaJi3BwaMkwttTCZTmLS5IzC3OTIdInWJUlBLn9
  QdJCIAkMkrz4NpgsXSJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvGMgUnsy8Erjpr4AWMw
  EtLuBTBVlckoiQkmpg8hTNX9cjdszy2rPZl0tUVvBcf9p6flf5BYM+hgnHNp7jv7rv8LQ7h96
  v199borFonWH87S+6cw+cO5PHtHJFEbundEtoHF+V/er+R6/jn3xfkNB8wlexL/UTB9e+5ZuO
  edTeYrbim315ee6EPaXbg3/rp/x/KB+6XnQCx/kNHHdLJuiYr7PhNr+sNuuC0q3zCme17yz95
  Lh8jdbF0/n86R4yl5/GRNxdLftd9dz3fwL1EfOOm0pUORyYm8VQ3KXXV1Wovqi5gvvY/pzP7S
  WP0qJYHJn3c23K36Wj9EVCII1V9Jn4Ee+VMwSZTk9R8Mo7/0X6sNpURpsTa568Lf0lu9I3JeN
  BaA73Wq+z9xZ9alBiKc5INNRiLipOBAAkhpcVIAMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-232.messagelabs.com!1630042847!122479!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2158 invoked from network); 27 Aug 2021 05:40:47 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-12.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Aug 2021 05:40:47 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17R5elre013287
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Aug 2021 06:40:47 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 27 Aug 2021 06:40:45 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-h5py: upgrade 3.3.0 -> 3.4.0
Date: Fri, 27 Aug 2021 13:40:40 +0800
Message-ID: <1630042840-53158-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-h5py_3.3.0.bb => python3-h5py_3.4.0.bb}    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-h5py_3.3.0.bb => python3-h5py_3.4.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.3.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.4.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-h5py_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.4.0.bb
index 68cd8ea850..cc23802626 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.4.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
 
-SRC_URI[sha256sum] = "e0dac887d779929778b3cfd13309a939359cc9e74756fc09af7c527a82797186"
+SRC_URI[sha256sum] = "ee1c683d91ab010d5e85cb61e8f9e7ee0d8eab545bf3dd50a9618f1d0e8f615e"
 
 SRC_URI:append = " \
            file://0001-setup_build.py-avoid-absolute-path.patch \
@@ -26,6 +26,7 @@ DEPENDS = "python3-pkgconfig-native \
 
 RDEPENDS:${PN} = "python3-numpy \
                   python3-six \
+                  python3-json \
                  "
 
 export HDF5_VERSION="1.8.21"
-- 
2.25.1

