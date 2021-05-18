Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.5661.1621325294811321051
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 01:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Tl5MPBnT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621325292; i=@fujitsu.com;
	bh=abgyryrBc4XMdqUGfymnzfc62FhEZRW34ljw1+kC1eo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Tl5MPBnT3Y6f+2Zlsy7QtsWHEORGVzSS8arOTvVmjOhZtrhyF16NYtpb0WJ3aNTQN
	 1CLQ0a1bQqFGIGS4HohlVyEe8oKOzht/f/9rjIYgFk4MjJy4w1DNdZY+Tt+Y4Cv4/I
	 nT9gV7aDV62FITGG/z5OWylpBxsEjhFzjwZwm8wGJITYm21GxyU4zKlmwpEuCzGhpr
	 /poks52724AOMjqSWaoswfBsLCXl1jglG0zWuAWI+Cmj/AG35I+JBM8WSIa9BFueX1
	 PF15GiKSi58ibtJ0ff3kLlsza9CRu1W6D9a8nP3v4CSNQus/C4ewPegckXoD4FjsIf
	 oQ+HAFjS6KWlw==
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 8E/BA-37841-CE573A06; Tue, 18 May 2021 08:08:12 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8MRqvu6dHG
  CwbZlhhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aOn83MBY8lK7Y+nsbUwNgt2sXIxSEkMJtJ
  YtWPw2wQzglGifNzjzJ3MXJysAmoSUy/dYMVxBYR0JdYOnsPWJxZQEXixe8edhBbWMBWounzZ
  kYQm0VAVWLNzlVgNq+Ak0TzwcVgNRICChJTHr5nhogLSpyc+YQFYo6ExMEXL5ghahQlZl9uZo
  GwKyReH77EPIGRdxaSlllIWhYwMq1itEwqykzPKMlNzMzRNTQw0DU0NNY11DUyMNdLrNJN1Es
  t1U1OzSspSgTK6iWWF+sVV+Ym56To5aWWbGIEhlhKIeP5HYxT33zQO8QoycGkJMprdn9RghBf
  Un5KZUZicUZ8UWlOavEhRhkODiUJ3mclixOEBItS01Mr0jJzgOEOk5bg4FES4b0MkuYtLkjML
  c5Mh0idYtTlePdz8SJmIZa8/LxUKXHeHpAiAZCijNI8uBGw2LvEKCslzMvIwMAgxFOQWpSbWY
  Iq/4pRnINRSZi3DGQKT2ZeCdymV0BHMAEd8b9xEcgRJYkIKakGJktXXc9V84WV5DIS9qclKtu
  uz9sS9qnd4fd0o10v/2mEirh3L5wt9T/aYu9Rjf45tsbPGSQ2HWZZm6qprTvv8bcbC3e1y+6K
  eKBhzcH4hXfe+RbJVTzu77tPHd6wtbFz8d0ap4+8n8W/5nyu+3LitfcWR5+vGadYzuQfOX063
  +jMa0a7f4FvXu9dfuhaueN0BtXHl6enG+vo+jN6KLuuNNhj82/zlmtX/5R99/r6L+tmsWL0L3
  kNFhXHxb1t9t8b04MWrmUUblPaaXTS40eYQkXuiUbu4rwsnZXiXruWvXYttFly6eXEP2mZ7vs
  kZDn6omw4KvvfGPQ4qYRM2+k7J96Bp9bwQnvroYTr8mcblFiKMxINtZiLihMBF5zrHzgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-232.messagelabs.com!1621325291!131639!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17074 invoked from network); 18 May 2021 08:08:11 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-9.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 May 2021 08:08:11 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14I88Ba2010378
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 09:08:11 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 18 May 2021 09:08:09 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 6/7] exiv2: Fix CVE-2021-29470
Date: Tue, 18 May 2021 16:07:59 +0800
Message-ID: <1621325280-16454-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

      References
      https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-29470

      The out-of-bounds read is triggered when Exiv2 is used to write metadata into a crafted image file.
      An attacker could potentially exploit the vulnerability to cause a denial of service by crashing Exiv2,
      if they can trick the victim into running Exiv2 on a crafted image file.

      Upstream-Status: Accepted [https://github.com/Exiv2/exiv2/pull/1581/commits/6628a69c036df2aa036290e6cd71767c159c79ed]
      CVE: CVE-2021-29470

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../exiv2/exiv2/CVE-2021-29470.patch          | 32 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch
new file mode 100644
index 000000000..eedf9d79a
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29470.patch
@@ -0,0 +1,32 @@
+From 6628a69c036df2aa036290e6cd71767c159c79ed Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Wed, 21 Apr 2021 12:06:04 +0100
+Subject: [PATCH] Add more bounds checks in Jp2Image::encodeJp2Header
+---
+ src/jp2image.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/jp2image.cpp b/src/jp2image.cpp
+index b424225..349a9f0 100644
+--- a/src/jp2image.cpp
++++ b/src/jp2image.cpp
+@@ -645,13 +645,16 @@ static void boxes_check(size_t b,size_t m)
+         DataBuf output(boxBuf.size_ + iccProfile_.size_ + 100); // allocate sufficient space
+         long    outlen = sizeof(Jp2BoxHeader) ; // now many bytes have we written to output?
+         long    inlen = sizeof(Jp2BoxHeader) ; // how many bytes have we read from boxBuf?
++        enforce(sizeof(Jp2BoxHeader) <= static_cast<size_t>(output.size_), Exiv2::kerCorruptedMetadata);
+         Jp2BoxHeader* pBox   = (Jp2BoxHeader*) boxBuf.pData_;
+         uint32_t      length = getLong((byte*)&pBox->length, bigEndian);
++        enforce(length <= static_cast<size_t>(output.size_), Exiv2::kerCorruptedMetadata);
+         uint32_t      count  = sizeof (Jp2BoxHeader);
+         char*         p      = (char*) boxBuf.pData_;
+         bool          bWroteColor = false ;
+ 
+         while ( count < length || !bWroteColor ) {
++            enforce(sizeof(Jp2BoxHeader) <= length - count, Exiv2::kerCorruptedMetadata);
+             Jp2BoxHeader* pSubBox = (Jp2BoxHeader*) (p+count) ;
+ 
+             // copy data.  pointer could be into a memory mapped file which we will decode!
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 024f4c794..2419bab35 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.pat
             file://CVE-2021-29458.patch \
             file://CVE-2021-29463.patch \
             file://CVE-2021-29464.patch \
+            file://CVE-2021-29470.patch \
             file://CVE-2021-3482.patch"
 
 S = "${WORKDIR}/${BPN}-${PV}-Source"
-- 
2.25.1

