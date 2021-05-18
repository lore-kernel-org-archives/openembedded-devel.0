Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [])
 by mx.groups.io with SMTP id smtpd.web10.5583.1621325037355320634
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 01:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BmWwIsbu;
 spf=neutral (domain: fujitsu.com, ip: <nil>, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621325040; i=@fujitsu.com;
	bh=q1AIYhl8mghphTdTHLDPJZcGcU5acez63axd2UjJbQI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BmWwIsbuIhkp7pzKfhGjHjRyZjXQ5G6zyq3OL/NVhe/P5hqKwnq2GLOeqZYw3VYr9
	 57r6pKWkwWgGqzq52fj6UsFOEpRnEL7Xaw9X7RMoBEPanL4CWIGfCzyTNeAm718BT1
	 GxEkZJTj3sDZctfqmsRg6e1r2NGq4HycVytKGU3nIKBOVAwaHPndCgw4kegq5xtIhh
	 nR19WO9E79nyThpyekVnw0LkSQQlzC9z4XldjuYjm478kAHikm9PiPV4mjZx7kR3EE
	 Ha8v3P52hBZV9+3oOT+MfY2Uy+NFCZzji8KZ12BsKNJ3jgdAqBj6ZU4/ccPKhSXMZO
	 QcM/03wFgIzmg==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id D7/25-14259-0F473A06; Tue, 18 May 2021 08:04:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MxVfdDyeI
  EgwtfeSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyzd3tYCzZpVcxp+c/awLhavouRi0NIYDaT
  RF/7FRYI5wSjxJzfr4AcTg42ATWJ6bdusILYIgL6Ektn72EGsZkFVCRe/O5hB7GFBWwljl49w
  wRiswioSuxeexyohoODV8BJ4slkX5CwhICCxJSH78FaOQWcJc7ufgVmCwGVrHi6GmwVr4CgxM
  mZT1ggxktIHHzxghmiV1Fi9uVmFgi7QuL14UvMExj5ZyFpmYWkZQEj0ypGy6SizPSMktzEzBx
  dQwMDXUNDY11TXSMTQ73EKt0kvdRS3eTUvJKiRKCsXmJ5sV5xZW5yTopeXmrJJkZgQKYUsn7c
  wXjo9Qe9Q4ySHExKorxm9xclCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgjS1anCAkWJSanlqRl
  pkDjA6YtAQHj5IIL0chUJq3uCAxtzgzHSJ1ilGX493PxYuYhVjy8vNSpcR5U4uBigRAijJK8+
  BGwCL1EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXnWQKTyZeSVwm14BHcEEdMT/xkUgR5Q
  kIqSkGpiyV046HSvpIRI888Byg+XfrMI0BReJeEq99W7j2LFNTPBepZ9Gr/jGk6UhIgaL6+O7
  bi+b+Hv3dlYzJf1Vn+Ysi2Gwtt595mJMSdJtm9DjhR69u3i1Msr+W3le3W6YsMNTRGKft4mO1
  Jzfh/hOTf+adeH0bXWWsu6soKv9fvJ/EmLW+LUHWabnX4+ekX/3jIP2X98ZjI3LNKSShSTdLs
  Xf/Fj0wO/F1HOxLI2GU5Kd8v6Y7i7/vaLc7cfMV5dNIgzeVL56+3LXVI+J7AcuieRwVMQv33G
  5a8WjbdNZwgNXlNYeiv9f2BtgUX9I5Pr+6NKDE46+2va74san3dkJUZZJ6xJPvLgTtXyP+E+1
  D4pKLMUZiYZazEXFiQDfEWCcTwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-238.messagelabs.com!1621325039!130493!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22926 invoked from network); 18 May 2021 08:04:00 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-14.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 May 2021 08:04:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14I83teR030421
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 09:03:59 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 18 May 2021 09:03:56 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 5/7] exiv2: Fix CVE-2021-29464
Date: Tue, 18 May 2021 16:03:32 +0800
Message-ID: <1621325014-16286-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1621325014-16286-1-git-send-email-wangmy@fujitsu.com>
References: <1621325014-16286-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

          References
          https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-29464

          The heap overflow is triggered when Exiv2 is used to write metadata into a crafted image file.
          An attacker could potentially exploit the vulnerability to gain code execution, if they can
          trick the victim into running Exiv2 on a crafted image file.

          Upstream-Status: Accepted [https://github.com/Exiv2/exiv2/commit/f9308839198aca5e68a65194f151a1de92398f54]
          CVE: CVE-2021-29464

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../exiv2/exiv2/CVE-2021-29464.patch          | 72 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch
new file mode 100644
index 000000000..f0c482450
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29464.patch
@@ -0,0 +1,72 @@
+From 61734d8842cb9cc59437463e3bac54d6231d9487 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Tue, 18 May 2021 10:52:54 +0900
+Subject: [PATCH] modify
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ src/jp2image.cpp | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/src/jp2image.cpp b/src/jp2image.cpp
+index 52723a4..0ac4f50 100644
+--- a/src/jp2image.cpp
++++ b/src/jp2image.cpp
+@@ -643,11 +643,11 @@ static void boxes_check(size_t b,size_t m)
+     void Jp2Image::encodeJp2Header(const DataBuf& boxBuf,DataBuf& outBuf)
+     {
+         DataBuf output(boxBuf.size_ + iccProfile_.size_ + 100); // allocate sufficient space
+-        int     outlen = sizeof(Jp2BoxHeader) ; // now many bytes have we written to output?
+-        int      inlen = sizeof(Jp2BoxHeader) ; // how many bytes have we read from boxBuf?
++        long    outlen = sizeof(Jp2BoxHeader) ; // now many bytes have we written to output?
++        long    inlen = sizeof(Jp2BoxHeader) ; // how many bytes have we read from boxBuf?
+         Jp2BoxHeader* pBox   = (Jp2BoxHeader*) boxBuf.pData_;
+-        int32_t       length = getLong((byte*)&pBox->length, bigEndian);
+-        int32_t       count  = sizeof (Jp2BoxHeader);
++        uint32_t      length = getLong((byte*)&pBox->length, bigEndian);
++        uint32_t      count  = sizeof (Jp2BoxHeader);
+         char*         p      = (char*) boxBuf.pData_;
+         bool          bWroteColor = false ;
+ 
+@@ -664,6 +664,7 @@ static void boxes_check(size_t b,size_t m)
+ #ifdef EXIV2_DEBUG_MESSAGES
+                 std::cout << "Jp2Image::encodeJp2Header subbox: "<< toAscii(subBox.type) << " length = " << subBox.length << std::endl;
+ #endif
++                enforce(subBox.length <= length - count, Exiv2::kerCorruptedMetadata);
+                 count        += subBox.length;
+                 newBox.type   = subBox.type;
+             } else {
+@@ -672,12 +673,13 @@ static void boxes_check(size_t b,size_t m)
+                 count = length;
+             }
+ 
+-            int32_t newlen = subBox.length;
++            uint32_t newlen = subBox.length;
+             if ( newBox.type == kJp2BoxTypeColorHeader ) {
+                 bWroteColor = true ;
+                 if ( ! iccProfileDefined() ) {
+                     const char* pad   = "\x01\x00\x00\x00\x00\x00\x10\x00\x00\x05\x1cuuid";
+                     uint32_t    psize = 15;
++                    enforce(newlen <= output.size_ - outlen, Exiv2::kerCorruptedMetadata);
+                     ul2Data((byte*)&newBox.length,psize      ,bigEndian);
+                     ul2Data((byte*)&newBox.type  ,newBox.type,bigEndian);
+                     ::memcpy(output.pData_+outlen                     ,&newBox            ,sizeof(newBox));
+@@ -686,6 +688,7 @@ static void boxes_check(size_t b,size_t m)
+                 } else {
+                     const char* pad   = "\0x02\x00\x00";
+                     uint32_t    psize = 3;
++                    enforce(newlen <= output.size_ - outlen, Exiv2::kerCorruptedMetadata);
+                     ul2Data((byte*)&newBox.length,psize+iccProfile_.size_,bigEndian);
+                     ul2Data((byte*)&newBox.type,newBox.type,bigEndian);
+                     ::memcpy(output.pData_+outlen                     ,&newBox            ,sizeof(newBox)  );
+@@ -694,6 +697,7 @@ static void boxes_check(size_t b,size_t m)
+                     newlen = psize + iccProfile_.size_;
+                 }
+             } else {
++                enforce(newlen <= output.size_ - outlen, Exiv2::kerCorruptedMetadata);
+                 ::memcpy(output.pData_+outlen,boxBuf.pData_+inlen,subBox.length);
+             }
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 8c4c81799..024f4c794 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.pat
             file://CVE-2021-29457.patch \
             file://CVE-2021-29458.patch \
             file://CVE-2021-29463.patch \
+            file://CVE-2021-29464.patch \
             file://CVE-2021-3482.patch"
 
 S = "${WORKDIR}/${BPN}-${PV}-Source"
-- 
2.25.1

