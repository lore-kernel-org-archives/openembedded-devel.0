Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.69])
 by mx.groups.io with SMTP id smtpd.web09.537.1632375093709823791
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 22:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PxTNx/E4;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.69, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632375091; i=@fujitsu.com;
	bh=P1XUFODGzC9xL+d6UpgB9GbUv5e5gyg9sj4a7TIAi6o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PxTNx/E43qSPMG37QbaAsfXBbG9WtiPIQLCpPsn5i+zF5xtwfkIW0xHfDa9+RqKiF
	 0GxgfdzHbLJcLpYHWa/bY2Paw7evc3i7o4QW9RNGFrevCLVS1h+NfF4fgULV2E3ToD
	 MJH+EH/nlfKCkeGREEhoyFT8QA/Eqy2KUDpH3OBi9p5/ArCX4OUwHN+f9yVTGgS7vd
	 e4H4ycsuHYyC2VSpxFh0Q+B8AOJaPjNrHXvds0+aCtnzA4ODQeacSRO9Zm37UWKd06
	 QpsChAd6Gl+mef128PBZfpIL9HCa4jHQO3YEZT0u5xgXoh0FtD0aoa5T53aGKVEp9s
	 u0oQXx316jezw==
Received: from [100.112.199.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-west-1.aws.symcld.net id 60/05-19003-3311C416; Thu, 23 Sep 2021 05:31:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYomss6JN
  osOIKo8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjFlyizWgha2it3//rM1MO5l7WLk4hASmM0k
  0bl2JTuEs4dRov16C3MXIycHm4CuxLnHa9lBbBEBfYmls/eAxYUF7CRuHP7PBmKzCKhK/L+/i
  BXE5hXwkLj35B9YvYSAgsSUh++ZIeKCEidnPmEBsZkFJCQOvngBFOcAqlGUmD1dHqK8QuL14U
  vMExh5ZiHpmIWkYwEj0ypGi6SizPSMktzEzBxdQwMDXUNDI11DSwtdQ2MDvcQq3SS91FLd8tT
  iEl1DvcTyYr3iytzknBS9vNSSTYzAMEopONa0g/Hk6w96hxglOZiURHnTBXwShfiS8lMqMxKL
  M+KLSnNSiw8xynBwKEnwnuEHygkWpaanVqRl5gBDGiYtwcGjJMKrwA2U5i0uSMwtzkyHSJ1iV
  JQS5zUFmSkAksgozYNrg8XRJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvHtAtvNk5pXATX
  8FtJgJaDH/Sg+QxSWJCCmpBqZ9zznXt88z6A7vO+AkFpQlu+Mm69QNgc7fPDnydX+G5Rcbnou
  LbjK4u83yp9bV2noLsVMtn+ssC4U83rx7LFr787tpf8wDjvdXD24uN1Q/MCWOTfZlz2Lmt8fL
  5vhG7TCbb1J2bl7OZqWWjctvZMmoXL21aZ30iQVLGM7Fb12ziXP5sjCuXTP1NuwP/fU2Nu1Ag
  jtDQ4FCxvpHEUI//p5xjH2YWNP/3a5dz+KUo/LT7ROSYs6tjvXLbt38PdNrVfshy9+fSpKYLe
  dKeIrz93wP55rsZxAZ2PWs8MyHZebvcvVbvz3rE3zO021T/Z7vSeFawQepaZd23rK9FK97SDq
  kbKK1xff+VmemK8dqtJRYijMSDbWYi4oTASO8WDYeAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-291.messagelabs.com!1632375090!250574!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22847 invoked from network); 23 Sep 2021 05:31:31 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-5.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Sep 2021 05:31:30 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18N5VKAa017469
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Sep 2021 06:31:30 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 23 Sep 2021 06:31:18 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] cppzmq: upgrade 4.8.0 -> 4.8.1
Date: Thu, 23 Sep 2021 22:30:53 +0800
Message-ID: <1632407453-15581-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
index 270df6f0e8..d234d01850 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
 DEPENDS = "zeromq"
 
-SRCREV = "267d300d1c99381a0fbc7e060ae2899e51f5e425"
-PV = "4.8.0"
+SRCREV = "dd663fafd830466d34cba278c2cfd0f92eb67614"
+PV = "4.8.1"
 
 SRC_URI = "git://github.com/zeromq/cppzmq.git;branch=master"
 
-- 
2.25.1

