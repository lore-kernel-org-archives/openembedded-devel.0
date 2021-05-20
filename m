Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web10.2462.1621474028496759327
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 May 2021 18:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=W2zf9xK+;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621474025; i=@fujitsu.com;
	bh=JpPKBcRh2nJBQQ0lKQnkNRvHMk4rDPLzKe9nJpZ3DYg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=W2zf9xK+it8pTVy7BVLBQVVjX1YkBIaiBN5xPJYcCZvMFNOrsNS6Gu0z4ILlEo8oR
	 hIzm8l2EO55Kp3hgomnuM5ZQ+HTrip5KjXKYK+Z5OMPDranPWhx+63fnorOOFcY4Yl
	 t1uOPbWy8XkwFCwKBPQ+wqO1D7U2SpAxU1aDXCC7s57oQBnIQ218yG5SuhPsSMuCDh
	 tjb5AsrpqDClPvSCGyHNaqNyeM72uHTqllmVTa1dcrIevbJa/H6n7DmaN/wLPqXqVK
	 KrrO5T6Qu6iAUYYmzLvFLWCnnQtjSp4HJSno2yWpzeHvy8khy3TNxFRqu7CE7Xtorv
	 KiK1Q7VmaQGKg==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 15/BC-38619-9EAB5A06; Thu, 20 May 2021 01:27:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYqvty19I
  Eg2WdrBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bjoUesBUu5Kt6eOsjUwHiEs4uRi0NIYDaT
  xOpDzUwQzglGiZUnTgA5nBxsAjoSHS+6WUBsEQF9iaWz9zCD2MICbhLrVn1mBLFZBFQlpvQsY
  QOxeQXcJa6tmM8KYksIKEhMefieGSIuKHFy5hOwOcwCEhIHX7xghqhRlNi+8wwLhF0hMWPGNr
  YJjDyzkLTMQtKygJFpFaNFUlFmekZJbmJmjq6hgYGuoaGxrhmQpZdYpZukl1qqm5yaV1KUCJT
  USywv1iuuzE3OSdHLSy3ZxAgMpJRCNq4djE9ff9A7xCjJwaQkymt2f1GCEF9SfkplRmJxRnxR
  aU5q8SFGGQ4OJQleQ2BoCgkWpaanVqRl5gCDGiYtwcGjJML7fxtQmre4IDG3ODMdInWKUVFKn
  DdvJ1BCACSRUZoH1waLpEuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHkVQbbzZOaVwE1/Bb
  SYCWRx4yKQxSWJCCmpBiZTBdm1u09tXTCxafoiEyPtXfnXdMw/exw+v71bYrLZt8UqHQ088je
  E/n9acef6shkL1E638ips1H26YYvqRqbtK1oYhXSSVi5yv1BuvvvcneTlMpbL8+bOn3/MbCqz
  ZNHmSqMrtSGrfkV++tJndWN23cQvS/naP02LYGzmPGVS/8j9c5L1nXdSjkq89zSLluz38T+pu
  ILfXb493PS70b2nN/tdpacXGORMTFeRndX5TP1mqvDin2sZGnaXmTnt0bvHdciot27WhaP3gy
  +kl8g2e+vZV/cVCxxda65x9s9k3xn2sX6LnF81ZlpZzbTLESo0/fVR9PavJT+UHPbOrIwpbbG
  8qS0x4ahl5euYuK9KLMUZiYZazEXFiQDTw+ruHwMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-248.messagelabs.com!1621474024!185047!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28595 invoked from network); 20 May 2021 01:27:05 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-20.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 May 2021 01:27:04 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14K1R4a6019463
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 02:27:04 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 02:27:03 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-perl] [PATCH] libencode-perl: upgrade 3.08 -> 3.10
Date: Thu, 20 May 2021 09:26:56 +0800
Message-ID: <1621474016-11186-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{libencode-perl_3.08.bb => libencode-perl_3.10.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libencode/{libencode-perl_3.08.bb => libencode-perl_3.10.bb} (95%)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.08.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.10.bb
similarity index 95%
rename from meta-perl/recipes-perl/libencode/libencode-perl_3.08.bb
rename to meta-perl/recipes-perl/libencode/libencode-perl_3.10.bb
index 3f1d35be8a..94f5a08259 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.08.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.10.bb
@@ -15,8 +15,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://META.json;beginline=8;endline=10;md5=b12e3be1e17a7e99ca4f429ff32c28b5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
-SRC_URI[md5sum] = "3889cf6d1b75e486d54f9fd6517a02b4"
-SRC_URI[sha256sum] = "ed063d01d01a140a3a3ec0aeba2f2b4849a35c18ca96ac231a5d7c7d54d17b5b"
+SRC_URI[md5sum] = "7377c8694a7afeeaa46ee035d0d7335c"
+SRC_URI[sha256sum] = "c2d7906af17664d6b6f16bf76572c95c16c30ad096b7dd980c08c3de33e319a9"
 
 UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1

