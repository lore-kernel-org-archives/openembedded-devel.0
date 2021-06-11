Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.3706.1623381370757207343
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jun 2021 20:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iUCm82Mw;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623381369; i=@fujitsu.com;
	bh=T+YyGEUkEGOsfKzP72BBxO7HSeG27MdMjY52TTnabMk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iUCm82MwPo99nPiiPrOrEU6PYgjMM91+EjNyE8Oiq5OG6x1yGIqVCUedWav4hpCel
	 aFQXYhvzIHA5EgNh+TSBKDFVI2GcfsEiTf2jLLsOAWxzTJ0KxifwhEvh4b/N3DkaTd
	 pp3T4WraJ1XPd2DuDTCMDWiw3Q0p0js8+BjUcQKNhE4IXpoxIJ9gA9qyf6yf5jBIW/
	 16GmFTvYSdxPY/9Cs896ZnAmy8D6m5P4mUJ3efZ4fma0vBZkVmP7bvp4Tdv063JZN7
	 pXlCLza92HLLMAE7jctvJPpMegVRtIiO3jnB4V+5Sz0thjOGAFoxjUSvKJ6Q8+e+Z1
	 V/MFhhqHnv04Q==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id C7/AB-28327-875D2C06; Fri, 11 Jun 2021 03:16:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8MxVbfi6qE
  Eg3kPBC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyehgNMBY3yFb2vVrI1MM6V7mLk5BASmM0k
  ceN4eRcjF5B9glFi5e3l7CAJNgEdiY4X3SwgtoiAvsTS2XuYQWxhAS+JD69+gtksAqoSJx71s
  IHYvALuEkcurWcFsSUEFCSmPHzPDBEXlDg58wnYHGYBCYmDL14wQ9QoSmzfeYYFwq6QmDFjG9
  sERp5ZSFpmIWlZwMi0itEiqSgzPaMkNzEzR9fQwEDX0NBI19ASiE1M9BKrdBP1Ukt1y1OLS3Q
  N9RLLi/WKK3OTc1L08lJLNjECwyil4MCEHYz7X3/QO8QoycGkJMqbc/BQghBfUn5KZUZicUZ8
  UWlOavEhRhkODiUJ3u1XgHKCRanpqRVpmTnAkIZJS3DwKInwnroIlOYtLkjMLc5Mh0idYgzne
  LN2ySJmjrdgsu3eXSDZDiZnLji4mpljFpi8334ISD4AkUIsefl5qVLivEcuA40TABmXUZoHtw
  wWs5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNuBZnCk5lXAnfTK6BzmYDOZdYAO7ckESE
  l1cAUfCr+xrGi4y3eRZ9sbl03ny+zfa7E9zjtb18aDj1RPr41YAO7y4nFvdZLmRxqRYIffgvj
  NV/ktTUyMez0iW/q1+0WKuc+SC5nY18dvWnl6/CIuY6LrBs+2PU0c3+QnPjgRMnjW2uFQmz2J
  jE1HKz5d8W7T4OrrKBBdR2bYd2CC54LWNyyJl+VdZTov1q7UqzquW3QO5lZq8R2Fcv2lfeHhR
  w0amdvFk76e3abLt/N6oBtC+IsdnGnX3/hIxSzhuPCCrlTm//KK1p4skQyWh6rTDv3s+Ouioy
  sk21pyG6TmqfnVue/2ia/Y3uOQs78lOXFAatMhSQcCgyO/F9j/irHeOL7DUYpZ+USvrL0Miqx
  FGckGmoxFxUnAgCmgrUiVAMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-271.messagelabs.com!1623381367!71898!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11577 invoked from network); 11 Jun 2021 03:16:08 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-18.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jun 2021 03:16:08 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15B3G4lq002021
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jun 2021 04:16:07 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 11 Jun 2021 04:16:03 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] abseil-cpp: upgrade 20210324 -> 20210324.2
Date: Fri, 11 Jun 2021 11:15:55 +0800
Message-ID: <1623381355-46721-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Refresh the following patch:
0001-Export-of-internal-Abseil-changes.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...01-Export-of-internal-Abseil-changes.patch | 29 +++++--------------
 .../abseil-cpp/abseil-cpp_git.bb              |  4 +--
 2 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Export-of-internal-Abseil-changes.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Export-of-internal-Abseil-changes.patch
index 52d4f42d52..680d0915eb 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Export-of-internal-Abseil-changes.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Export-of-internal-Abseil-changes.patch
@@ -1,6 +1,6 @@
-From a9831f1cbf93fb18dd951453635f488037454ce9 Mon Sep 17 00:00:00 2001
-From: Abseil Team <absl-team@google.com>
-Date: Mon, 3 May 2021 07:37:39 -0700
+From c9250af98f48e4aa734cab0e2f5ae1f780c05ad0 Mon Sep 17 00:00:00 2001
+From: Zang Ruochen <zangrc.fnst@fujitsu.com>
+Date: Fri, 11 Jun 2021 10:53:37 +0900
 Subject: [PATCH] Export of internal Abseil changes
 
 --
@@ -27,15 +27,16 @@ Cmake builds should only install pkg-config when explicitly requested.
 PiperOrigin-RevId: 371403419
 GitOrigin-RevId: cf88f9cf40eab54c06bca7f20795352ec23bb583
 Change-Id: I4360a18c638a4d901ff44ab1e0a9d8f321c302ea
+
+Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
 ---
  CMake/AbseilHelpers.cmake                        | 3 ++-
- absl/debugging/failure_signal_handler.cc         | 3 ++-
  absl/strings/internal/str_format/arg.h           | 8 ++++++++
  absl/strings/internal/str_format/convert_test.cc | 3 +++
- 4 files changed, 15 insertions(+), 2 deletions(-)
+ 3 files changed, 13 insertions(+), 1 deletion(-)
 
 diff --git a/CMake/AbseilHelpers.cmake b/CMake/AbseilHelpers.cmake
-index 1f754392..1a80b5b4 100644
+index 54fb8df3..a32b94d5 100644
 --- a/CMake/AbseilHelpers.cmake
 +++ b/CMake/AbseilHelpers.cmake
 @@ -141,7 +141,8 @@ function(absl_cc_library)
@@ -48,20 +49,6 @@ index 1f754392..1a80b5b4 100644
      if(NOT ABSL_CC_LIB_TESTONLY)
        if(absl_VERSION)
          set(PC_VERSION "${absl_VERSION}")
-diff --git a/absl/debugging/failure_signal_handler.cc b/absl/debugging/failure_signal_handler.cc
-index e458a795..689e5979 100644
---- a/absl/debugging/failure_signal_handler.cc
-+++ b/absl/debugging/failure_signal_handler.cc
-@@ -136,7 +136,8 @@ static bool SetupAlternateStackOnce() {
- #else
-   const size_t page_mask = sysconf(_SC_PAGESIZE) - 1;
- #endif
--  size_t stack_size = (std::max(SIGSTKSZ, 65536) + page_mask) & ~page_mask;
-+  size_t stack_size =
-+      (std::max<size_t>(SIGSTKSZ, 65536) + page_mask) & ~page_mask;
- #if defined(ABSL_HAVE_ADDRESS_SANITIZER) || \
-     defined(ABSL_HAVE_MEMORY_SANITIZER) || defined(ABSL_HAVE_THREAD_SANITIZER)
-   // Account for sanitizer instrumentation requiring additional stack space.
 diff --git a/absl/strings/internal/str_format/arg.h b/absl/strings/internal/str_format/arg.h
 index 7040c866..3c91be70 100644
 --- a/absl/strings/internal/str_format/arg.h
@@ -96,5 +83,5 @@ index 926283cf..91e03609 100644
  
  TEST_F(FormatConvertTest, NullString) {
 -- 
-2.31.1
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 01dd9f550e..3f89df558b 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -7,8 +7,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-PV = "20210324+git${SRCPV}"
-SRCREV = "e1d388e7e74803050423d035e4374131b9b57919"
+PV = "20210324.2+git${SRCPV}"
+SRCREV = "278e0a071885a22dcd2fd1b5576cc44757299343"
 BRANCH = "lts_2021_03_24"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH}         \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
-- 
2.25.1

