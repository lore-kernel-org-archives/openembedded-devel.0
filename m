Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web12.4302.1630043249519099139
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 22:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=xOugIlmp;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630043247; i=@fujitsu.com;
	bh=ETuQ5Nktw3MmeBo7j36LU2MEd3y8vmUGmfme9HnXTgg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=xOugIlmp5Lgo2fBTlAJmvdiQvqnpvRzdIwmlmg8g2hicz3I0JUJoGT/F+KKItHAxV
	 XEOBwErVUuBwZ7utVaqHmZfbPSuhDgw6oK3Kt0ht82fQ8/UOtgRqWZbNrL/TrGrh7J
	 WhwncUW/1OGLriwrhp1fDXmnd3Pb1FMCgqajLp+zdXalzGxjtWCJa9fyswq8/EtAbF
	 fmkzoJDBkLQsPS3WAcnVFLQuMmSbZKkKl5Rs4DIB2hEt1BUREZezIEyq3K3iUXvpoH
	 9GPcYns+gxgqUozAiS4L7+m/O8OVVG3EFbBROQYno4UPXSLzcWk0vs8lfwPozHMgCM
	 SIALSU7y8bAFw==
Received: from [100.113.6.40] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id E8/31-28249-E6C78216; Fri, 27 Aug 2021 05:47:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI1c2r0Ug
  0WNOtbXHx8FJmB0aPcxtXMAYwRrFm5iXlVySwZvyZwlKwmruiaddF5gbGNVxdjJwcQgKzmSRW
  HfDrYuQCsvcwSvQde8cCkmAT0JU493gtO4gtIqAvsXT2HmYQW1jAV2LSo2tgNSwCqhIfrx4Aq
  +EVcJdYcvscmC0hoCAx5eF7Zoi4oMTJmU/A6pkFJCQOvngBFOcAqlGUmD1dHqK8QuL14UvMEx
  h5ZiHpmIWkYwEj0ypGy6SizPSMktzEzBxdQwMDXUNDY11zXSNTI73EKt0kvdRS3eTUvJKiRKC
  sXmJ5sV5xZW5yTopeXmrJJkZgEKUUsv/ZwXj99Qe9Q4ySHExKorw70jUShfiS8lMqMxKLM+KL
  SnNSiw8xynBwKEnwJlcD5QSLUtNTK9Iyc4ABDZOW4OBREuF9CpLmLS5IzC3OTIdInWJUlBLnf
  QKSEABJZJTmwbXBougSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeNyBTeDLzSuCmvwJazA
  S0uIBPFWRxSSJCSqqBKWnnGutH/X4sq64sTk6zXvU37BOLwY2KfRKmZ69/Fj/I93T7ElPOeTK
  X12//fknhV9t9YSFhzYC0tfZzzE26n3+KNDYwk523+suUfc1TQpM7v+77csPYikUzRuzHhF8u
  ZzflV6x5vbFprzLnn/k7bfa8jniyye336kB/1p8nz11etX/WeaNj1s9UTRKvZy5doShQlmmQG
  HRQrpPrZOjamS37rfcWXOi/5TfN7vbzjhmsQtNzq6e8UmrymGHxvNLJ5iDfn/uXJ+fzfznZ/e
  cWv6P4+cM/6m7JrtT+eVKzrXTFjXUTdOVrbl1ZujFonkjnV48tcspHnxltF3Nxj84sXHDdOXS
  TFV/GjclHv83L65ZRYinOSDTUYi4qTgQAfg8kWx0DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-245.messagelabs.com!1630043246!122798!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8924 invoked from network); 27 Aug 2021 05:47:26 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-15.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Aug 2021 05:47:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17R5lQKC014423
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Aug 2021 06:47:26 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 27 Aug 2021 06:47:24 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-stevedore: upgrade 3.3.0 -> 3.4.0
Date: Thu, 26 Aug 2021 10:56:55 +0800
Message-ID: <1629946615-7304-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

3.4.0
-----

* setup.cfg: Replace dashes with underscores
* Fix formatting of release list
* Remove lower-constraints remnants
* Move flake8 as a pre-commit local target
* Add Python3 xena unit tests
* Update master for stable/wallaby
* Dropping lower constraints testing

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-stevedore_3.3.0.bb => python3-stevedore_3.4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_3.3.0.bb => python3-stevedore_3.4.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_3.3.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_3.4.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-stevedore_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_3.4.0.bb
index 486fa71a85..e2f43048e6 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_3.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "3a5bbd0652bf552748871eaa73a4a8dc2899786bc497a2aa1fcb4dcdb0debeee"
+SRC_URI[sha256sum] = "59b58edb7f57b11897f150475e7bc0c39c5381f0b8e3fa9f5c20ce6c89ec4aa1"
 
 DEPENDS += "${PYTHON_PN}-pbr-native"
 
-- 
2.25.1

