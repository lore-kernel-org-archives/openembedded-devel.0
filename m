Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web10.5616.1621325297730005052
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 01:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LBrGzBJf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621325295; i=@fujitsu.com;
	bh=VnYMqkDQBJG/gkeW4VwFeCZDQvat43QezumQ6VeCQyY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LBrGzBJfextc5y9FCIi7ZfOuiYcuf3mgN/6a1unDsKANTh5ipWenwqkFx2HpPI+D1
	 b1GzoFVBwzWdpzz4HVIFt085VI09n23f92zI83G+8PrclREdp1i9zm8bmOvAd3aftX
	 KjF746ZeVo1JEz3ifayW4OQacNI89NGhRRIX4ruImAYw/x1Ym+N/3CYMuerLLC2lVw
	 z9zS7BErgdNp83IWulhKSHCNHY8XseI5pnsFbJsqUEn/YXgF2YxzrWa3/VMtDzRwNj
	 g1Jl/JjQ8fYZcgK69S5dstn9UbsfDjrfIMdfEv8fGQhbdsAbrlI569MLjh++QwHSKx
	 j/RR8pu51tqTg==
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 77/21-33893-FE573A06; Tue, 18 May 2021 08:08:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8MxVfdd6eI
  Eg9cr9C0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ox32+4zFswXrvi0eCpLA+N3/i5GLg4hgdlM
  ElPXf2WCcE4wSpzZ+Iu9i5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e8BqhAVsJbrXL
  2UDsVkEVCWudTwHi/MKOEmcnDEbrFdCQEFiysP3YL2cAs4S6xt6wWwhoJqn2zvZIOoFJU7OfM
  ICMV9C4uCLF8wQvYoSsy83s0DYFRKvD19insDIPwtJyywkLQsYmVYxWiYVZaZnlOQmZuboGho
  Y6BoaGusa6RoZmuklVukm6qWW6ian5pUUJQJl9RLLi/WKK3OTc1L08lJLNjECQzKlkOnGDsZv
  rz/oHWKU5GBSEuU1u78oQYgvKT+lMiOxOCO+qDQntfgQowwHh5IE77OSxQlCgkWp6akVaZk5w
  PiASUtw8CiJ8F4GSfMWFyTmFmemQ6ROMepyvPu5eBGzEEtefl6qlDhvD0iRAEhRRmke3AhYrF
  5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMxbBjKFJzOvBG7TK6AjmICO+N+4COSIkkSElFQ
  DU+s54WLtz/MdfqTMyjXQedE+kbmDvTsl8sL5nDjLvouXeUy2rvI6fKTQkDPuvJ5q0lG706+M
  nUsDfp2cnfyg71zXv7q9jqf/FXya23TvFf9FFueN6yfps97PTlef2Gj8Uj3NX/HA0QrOZjGrj
  nP/Dpul6fU4PgpxeOzz44/ArEty1xZ06N6Y8GDOs1Wt6jHG3YbF72s+dXnofDu9TbNa78Kumm
  0MvXduXPrv8zaDjSeXi+HDP6453+pTXzxZ1Mz6eaHtRXfbnT/9F7aV/vvQvKb0iKR89gEfpdM
  RIhMlTCc9L9m8kUuhJdlLtG7z9W9mriE+Jas26sya+LWl9fHT3sy+Vbma+aLdq53O+hmHK7EU
  ZyQaajEXFScCALz2X55QAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-228.messagelabs.com!1621325294!384069!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13058 invoked from network); 18 May 2021 08:08:14 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-9.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 May 2021 08:08:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14I88EoH001432
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 09:08:14 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 18 May 2021 09:08:12 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 7/7] exiv2: Fix CVE-2021-29473
Date: Tue, 18 May 2021 16:08:00 +0800
Message-ID: <1621325280-16454-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1621325280-16454-1-git-send-email-wangmy@fujitsu.com>
References: <1621325280-16454-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

      References
      https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-29473

      The out-of-bounds read is triggered when Exiv2 is used to write metadata into a crafted image file.
      An attacker could potentially exploit the vulnerability to cause a denial of service by crashing Exiv2,
      if they can trick the victim into running Exiv2 on a crafted image file.

      Upstream-Status: Accepted [https://github.com/Exiv2/exiv2/pull/1587/commits/e6a0982f7cd9282052b6e3485a458d60629ffa0b]
      CVE: CVE-2021-29473

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../exiv2/exiv2/CVE-2021-29473.patch          | 21 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch
new file mode 100644
index 000000000..4afedf8e5
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29473.patch
@@ -0,0 +1,21 @@
+From e6a0982f7cd9282052b6e3485a458d60629ffa0b Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Fri, 23 Apr 2021 11:44:44 +0100
+Subject: [PATCH] Add bounds check in Jp2Image::doWriteMetadata().
+
+---
+ src/jp2image.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/jp2image.cpp b/src/jp2image.cpp
+index 1694fed27..ca8c9ddbb 100644
+--- a/src/jp2image.cpp
++++ b/src/jp2image.cpp
+@@ -908,6 +908,7 @@ static void boxes_check(size_t b,size_t m)
+ 
+                 case kJp2BoxTypeUuid:
+                 {
++                    enforce(boxBuf.size_ >= 24, Exiv2::kerCorruptedMetadata);
+                     if(memcmp(boxBuf.pData_ + 8, kJp2UuidExif, 16) == 0)
+                     {
+ #ifdef EXIV2_DEBUG_MESSAGES
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 2419bab35..d5d9e62ff 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -15,6 +15,7 @@ SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.pat
             file://CVE-2021-29463.patch \
             file://CVE-2021-29464.patch \
             file://CVE-2021-29470.patch \
+            file://CVE-2021-29473.patch \
             file://CVE-2021-3482.patch"
 
 S = "${WORKDIR}/${BPN}-${PV}-Source"
-- 
2.25.1

