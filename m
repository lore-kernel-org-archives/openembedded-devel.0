Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [])
 by mx.groups.io with SMTP id smtpd.web12.5609.1621325038185388480
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 01:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=P8THFEUY;
 spf=neutral (domain: fujitsu.com, ip: <nil>, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621325040; i=@fujitsu.com;
	bh=TXjT5PPfKJYMNk5+ZxfgXimfoLzjdO5UzmoVCwznv+c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=P8THFEUYXF6TPqUz/wKrH8Crzudyb0w9Do0fUBJpFtPXUiYJatH14wUXVauHmB8rs
	 TO5lpV5btS6QNA7B5Xe6E8QHFFBGNcXE64JOgwGRjrtB/jgDQcWZvguefo3VN+A8ob
	 5zytknJrUdYuVV1kvVoAkk8uXRLPMklRV6ZuVu5mYONxDyZPBeGevffpUbs/6blh//
	 bbtt0fEhzwhHrVFqc5y+9BujaY9qw/MjIg8fRO+KMjnLWD8yxRxgVkxJN+ea/howAz
	 iRK5BMU3F4VMl7+NNVGk2eBaZHxEi1xoRVDqrG+tEPoGTcAH0gM6Ce6g9gryvrS3qR
	 LeDnvor1RHKMw==
Received: from [100.112.199.171] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 48/C9-64908-0F473A06; Tue, 18 May 2021 08:04:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRWlGSWpSXmKPExsViZ8MxVfd9yeI
  Egy0vzCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozfHS4F/UoVzZtnMjcw3pDoYuTiEBKYzSQx
  YflkdgjnBKPEiQvz2boYOTnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHHcQWFrCRePN0F
  QuIzSKgKvF2ShtjFyMHB6+Ak0THLDWQsISAgsSUh+/BWjkFnCXO7n4FZgsBlax4uhqslVdAUO
  LkzCcsEOMlJA6+eMEM0asoMftyMwuEXSHx+vAl5gmM/LOQtMxC0rKAkWkVo0VSUWZ6RkluYma
  OrqGBga6hoZGuoaWFrqGxgV5ilW6SXmqpbnlqcYmuoV5iebFecWVuck6KXl5qySZGYDCmFBxr
  2sF48vUHvUOMkhxMSqK8ZvcXJQjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4I0tWpwgJFiUmp5ak
  ZaZA4wMmLQEB4+SCC9HIVCat7ggMbc4Mx0idYrRmOPdz8WLmDlaHi1ZxCzEkpeflyolzptaDF
  QqAFKaUZoHNwgWsZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOqg0zhycwrgdv3CugUJqB
  T/jcuAjmlJBEhJdXAtNhRYIFikuRnj7kSN6bdD3Pn1UhZsX9bxL3yjXbt89fHG6+sUvStvPhV
  /8gUtYa0W6t9uit6mqdvcb4bud+iZvKJWwWrjmbsbJ5x5PGpFx+3vbeSOvrzwJsSjxnpdYEL9
  r/4U7tjUQGnf0dBwuzgGRsCix9NqF0u+u5Pl6SEaNk/ozDn8Ns+1yds/5m3g3FDl3ntkvWWCv
  KPbS+fmeik3bM6eRP3S6ctZ69w67vsfJ2waltZg7q367Kzaybyn1mkVbfe13j6qdS31YETzP/
  2moh3NOa9SmuPa594cU7MdNm0A55lcxl2u59LZFFdeMzrZ+otNc9t+kfa7hRzzXR07TbxUP/0
  n/djAP+1G0ZPKpRYijMSDbWYi4oTAchxSZtTAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-285.messagelabs.com!1621325039!131568!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19238 invoked from network); 18 May 2021 08:03:59 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-16.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 May 2021 08:03:59 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14I83teQ030421
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 09:03:59 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 18 May 2021 09:03:53 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 4/7] exiv2: Fix CVE-2021-3482
Date: Tue, 18 May 2021 16:03:31 +0800
Message-ID: <1621325014-16286-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1621325014-16286-1-git-send-email-wangmy@fujitsu.com>
References: <1621325014-16286-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

      References
      https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-3482

      Improper input validation of the rawData.size property in Jp2Image::readMetadata() in jp2image.cpp
      can lead to a heap-based buffer overflow via a crafted JPG image containing malicious EXIF data.

      Upstream-Status: Accepted [https://github.com/Exiv2/exiv2/pull/1523/commits/22ea582c6b74ada30bec3a6b15de3c3e52f2b4da]
      CVE: CVE-2021-3482

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../exiv2/exiv2/CVE-2021-3482.patch           | 54 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch
new file mode 100644
index 000000000..e7c5e1b65
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-3482.patch
@@ -0,0 +1,54 @@
+From 22ea582c6b74ada30bec3a6b15de3c3e52f2b4da Mon Sep 17 00:00:00 2001
+From: Robin Mills <robin@clanmills.com>
+Date: Mon, 5 Apr 2021 20:33:25 +0100
+Subject: [PATCH] fix_1522_jp2image_exif_asan
+
+---
+ src/jp2image.cpp | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/jp2image.cpp b/src/jp2image.cpp
+index eb31cea4a..88ab9b2d6 100644
+--- a/src/jp2image.cpp
++++ b/src/jp2image.cpp
+@@ -28,6 +28,7 @@
+ #include "image.hpp"
+ #include "image_int.hpp"
+ #include "basicio.hpp"
++#include "enforce.hpp"
+ #include "error.hpp"
+ #include "futils.hpp"
+ #include "types.hpp"
+@@ -353,7 +354,7 @@ static void boxes_check(size_t b,size_t m)
+                             if (io_->error()) throw Error(kerFailedToReadImageData);
+                             if (bufRead != rawData.size_) throw Error(kerInputDataReadFailed);
+ 
+-                            if (rawData.size_ > 0)
++                            if (rawData.size_ > 8) // "II*\0long"
+                             {
+                                 // Find the position of Exif header in bytes array.
+                                 long pos = (     (rawData.pData_[0]      == rawData.pData_[1])
+@@ -497,6 +498,7 @@ static void boxes_check(size_t b,size_t m)
+                 position   = io_->tell();
+                 box.length = getLong((byte*)&box.length, bigEndian);
+                 box.type = getLong((byte*)&box.type, bigEndian);
++                enforce(box.length <= io_->size()-io_->tell() , Exiv2::kerCorruptedMetadata);
+ 
+                 if (bPrint) {
+                     out << Internal::stringFormat("%8ld | %8ld | ", (size_t)(position - sizeof(box)),
+@@ -581,12 +583,13 @@ static void boxes_check(size_t b,size_t m)
+                                 throw Error(kerInputDataReadFailed);
+ 
+                             if (bPrint) {
+-                                out << Internal::binaryToString(makeSlice(rawData, 0, 40));
++                                out << Internal::binaryToString(
++                                        makeSlice(rawData, 0, rawData.size_>40?40:rawData.size_));
+                                 out.flush();
+                             }
+                             lf(out, bLF);
+ 
+-                            if (bIsExif && bRecursive && rawData.size_ > 0) {
++                            if (bIsExif && bRecursive && rawData.size_ > 8) { // "II*\0long"
+                                 if ((rawData.pData_[0] == rawData.pData_[1]) &&
+                                     (rawData.pData_[0] == 'I' || rawData.pData_[0] == 'M')) {
+                                     BasicIo::AutoPtr p = BasicIo::AutoPtr(new MemIo(rawData.pData_, rawData.size_));
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index fb8d12619..8c4c81799 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -12,7 +12,8 @@ inherit dos2unix
 SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch \
             file://CVE-2021-29457.patch \
             file://CVE-2021-29458.patch \
-            file://CVE-2021-29463.patch"
+            file://CVE-2021-29463.patch \
+            file://CVE-2021-3482.patch"
 
 S = "${WORKDIR}/${BPN}-${PV}-Source"
 
-- 
2.25.1

