Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.63898.1629340273612636326
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Aug 2021 19:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZEctr+2C;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629340271; i=@fujitsu.com;
	bh=2NFlAkxLXCdUnlSE+oGIFJNfRbxQaFIgJL3tv0XPC/s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ZEctr+2CSEzSi9Ke/KWh/O+jhBjDTGDp/SnC7Cjp320aRcsrZ/aY85mBk39/2hC49
	 uc01+67Pvgj155Sl4heWTmDLRBRvYkNNrgUJl+qsaWrMGZeFDJzQbFuB8Rb5c/OazE
	 DLg7i5oYPeUzbNt1MJyMSWhSQliH2tW5UHk/1Dwnf1Z+2BDDGa0EcZVts8Qr1Wysg4
	 IkjlnyQufH9o3VT686i9M8M7o/6nRnHTEbK0zv5BNZz4BFcXKX0LJFAFGO66q9NB7p
	 VkPtzSguoF19ZGVuPDtK3aFaDMEnDbod+gP2+qr4kuJpCZ2bYb6pabgXMuhZ/j1Fm+
	 8qwC0qzBCxEjA==
Received: from [100.112.198.129] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 8E/D6-02582-E62CD116; Thu, 19 Aug 2021 02:31:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxRTfvkGy
  iwb6r/BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b+yy9ZCzbyVvyZk9fAeJ+7i5GLQ0hgNpPE
  hf+zmCCcE4wSL1s2snYxcnKwCahJTL91A8wWEdCXWDp7DzOIzSygIvHidw87iC0s4C2x9vhJM
  JtFQFWi58lxNhCbV8BJ4vbPDYwgtoSAgsSUh++ZIeKCEidnPmGBmCMhcfDFC2aIGkWJ2ZebWS
  DsColZs9qYJjDyzkLSMgtJywJGplWMFklFmekZJbmJmTm6hgYGuoaGRrqGlha6RoameolVukl
  6qaW65anFJbqGeonlxXrFlbnJOSl6eaklmxiB4ZVScOz6Dsarrz/oHWKU5GBSEuVdWiObKMSX
  lJ9SmZFYnBFfVJqTWnyIUYaDQ0mCt/MgUE6wKDU9tSItMwcY6jBpCQ4eJRHe33uA0rzFBYm5x
  ZnpEKlTjIpS4rz6IH0CIImM0jy4Nlh8XWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzFsMMo
  UnM68EbvoroMVMQIuFVMEWlyQipKQamJJnlEw9dHtt06nfS7laztxcmhEY+Vmx+KlcdlrOzpl
  8K7leZpUL/unMaH2Xovv8dHJGjvyO3Af63l5fF0+vWPRy9bbUp1PyHL/Pk7So+n77V+vByw+n
  /m9PnXh+QmYCc/2uXbczfB48iHh/w/xl8+ZLX5Zd853pb910y9f8G29u2m7nCb/Z7wnXx1oyc
  V3YVaa5pnjXbk+WgkM5t/kSE9d/v7il9r9jzNnjiTcOt1RLt+YI8KjFWbrLbc17evrrkk8tc1
  5LK2m5vps+r+Bk8IPVz5K2m81nWCK0YKuCo4Zm5Ok2l9fq9xrfJyvyXtaQEOb8c/p9RG7IEn0
  GJWX1GRePXVhr9XjNqQplO8tn/jeUWIozEg21mIuKEwHHCu8iKgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-287.messagelabs.com!1629340269!478235!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9071 invoked from network); 19 Aug 2021 02:31:10 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-8.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Aug 2021 02:31:10 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17J2V4kg006835
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 03:31:09 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 19 Aug 2021 03:31:02 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] fetchmail: upgrade 6.4.20 -> 6.4.21
Date: Thu, 19 Aug 2021 10:30:47 +0800
Message-ID: <1629340247-42791-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

* The new security fix in 6.4.20 for CVE-2021-36386 caused truncation of
  messages logged to buffered outputs, predominantly --logfile.

  This also caused lines in the logfile to run into one another because
  the fragment containing the '\n' line-end character was usually lost.

  Reason is that on all modern systems (with <stdarg.h> header and vsnprintf()
  interface), the length of log message fragments was added up twice, so
  that these ended too deep into a freshly allocated buffer, after the '\0'
  byte.  Unbuffered outputs flushed the fragments right away, which masked the
  bug.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fetchmail/{fetchmail_6.4.20.bb => fetchmail_6.4.21.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/fetchmail/{fetchmail_6.4.20.bb => fetchmail_6.4.21.bb} (91%)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.20.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.21.bb
similarity index 91%
rename from meta-networking/recipes-support/fetchmail/fetchmail_6.4.20.bb
rename to meta-networking/recipes-support/fetchmail/fetchmail_6.4.21.bb
index 13d91b4d52..33a05ed61a 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.20.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.21.bb
@@ -12,7 +12,7 @@ DEPENDS = "openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "c82141ae2e8f0039ceb0c5c2eda43c5e93ad0bf7f9c6bb628092b3be74386176"
+SRC_URI[sha256sum] = "6a459c1cafd7a1daa5cd137140da60c18c84b5699cd8e7249a79c33342c99d1d"
 
 inherit autotools gettext python3-dir python3native
 
-- 
2.25.1

