Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.30543.1630978029668347819
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Sep 2021 18:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wGKJbJi1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630978027; i=@fujitsu.com;
	bh=QQDDXVDcJtFZx5r9T1meJZEo9lsuRNfSYWvS8huM+go=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wGKJbJi1gPbl47IYxsTL5dBBrC1SUxcQsJ5JzA4Kqw3UnvI4MFq2plnGH+g3aqx/C
	 p+TkcF64PJXswi5LwTweEbJprVkGyoH4kHdrVxJniyt8t4iwYPLHza84J/6boSb/4+
	 6/qrXI5Ax1mXuz682TxIvRqfqcKUHewKyqpZRwMOaEWNMyJghvjPIeu6VKMeGp1V/l
	 EJ+UO0o5kpk5iNnBJJaszTzXAVjtV0OYB83EjMuXiK/Zt2VvgsRzFi4zGU93zlvsV4
	 geDbBXVW1xv5q6YtbNfqMShtw4Ks1kvGB2lKHZSMp7zDQkEFjw6fq1Phux1FuqwIZZ
	 pxKyx8EYpGT7A==
Received: from [100.113.6.150] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 63/66-23595-BEFB6316; Tue, 07 Sep 2021 01:27:07 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYovtqv1m
  iwZnH+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bDObeZCmbyVexZfpS1gfEcTxcjF4eQwCwm
  iaYTN1khnOOMEv2fvwE5nBxsAjoSHS+6WUBsEQF9iaWz9zCD2MIC5hIvDi0DquHgYBFQkXg93
  QEkzCvgLvH17UtGEFtCQEFiysP3zBBxQYmTM5+AjWEWkJA4+OIFM0SNosT2nWdYIOwKideHLz
  FPYOSZhaRlFpKWBYxMqxgtk4oy0zNKchMzc3QNDQx0DQ2Ndc11jUyN9BKrdJP0Ukt1k1PzSoo
  SgbJ6ieXFesWVuck5KXp5qSWbGIGBlFLI/mcH4/XXH/QOMUpyMCmJ8v4oM0sU4kvKT6nMSCzO
  iC8qzUktPsQow8GhJMFbsw8oJ1iUmp5akZaZAwxqmLQEB4+SCO+yPUBp3uKCxNzizHSI1ClGR
  Slx3knbgBICIImM0jy4NlgkXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzHsUZDtPZl4J3P
  RXQIuZgBa3PTQBWVySiJCSamBSe1o+3fr/nOvsJcIpe7g8a25WzArv6Fzv8vnR86dt/Fzer+R
  nOUyqro51n7fiT/qRP+7xTyMdTKfsO3ZWbtn1v0knLkcoXbh56GfUcR22C9uXW3DGnAkwSy/u
  Sjt35WW3Sf4SVj4lg6T+1tlcGyyni8aGicpKNKbtenIqklNaf3nHnClpInNlFyiLeZR8LAvOZ
  fi67f+9t08Tor0ylgbfu9B0SWq1sx4LT6O8wYRTekINBbf7Q/c0LAqO23HK/2a180+j2oUPw5
  n5Kz84zhSZ+PGnVs7dxyXzc4ozvhqa3lDx/sj/5MgCnTfMYSpXNlxR6djN5vxW+727eset7/Y
  3+BJtHMvsdYqdnvetMlBiKc5INNRiLipOBAB6CVtUHwMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-245.messagelabs.com!1630978026!56634!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11176 invoked from network); 7 Sep 2021 01:27:06 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-20.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Sep 2021 01:27:06 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1871Qwvb015282
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Sep 2021 02:27:06 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 7 Sep 2021 02:26:57 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] gsl: upgrade 2.6 -> 2.7
Date: Tue, 7 Sep 2021 09:26:50 +0800
Message-ID: <1630978010-83147-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

* What is new in gsl-2.7:

** fixed doc bug for gsl_histogram_min_bin (lhcsky at 163.com)
** fixed bug #60335 (spmatrix test failure, J. Lamb)
** fixed bug #36577
** clarified documentation on interpolation accelerators (V. Krishnan)
** fixed bug #45521 (erroneous GSL_ERROR_NULL in ode-initval2, thanks to M. Sitte)
** fixed doc bug #59758
** fixed bug #58202 (rstat median for n=5)
** added support for native C complex number types in gsl_complex
   when using a C11 compiler
** upgraded to autoconf 2.71, automake 1.16.3, libtool 2.4.6
** updated exponential fitting example for nonlinear least squares
** added banded LU decomposition and solver (gsl_linalg_LU_band)

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 meta-oe/recipes-support/gsl/gsl_2.6.bb | 5 -----
 meta-oe/recipes-support/gsl/gsl_2.7.bb | 4 ++++
 2 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gsl/gsl_2.6.bb
 create mode 100644 meta-oe/recipes-support/gsl/gsl_2.7.bb

diff --git a/meta-oe/recipes-support/gsl/gsl_2.6.bb b/meta-oe/recipes-support/gsl/gsl_2.6.bb
deleted file mode 100644
index 367a08321e..0000000000
--- a/meta-oe/recipes-support/gsl/gsl_2.6.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-include gsl.inc
-
-SRC_URI = "${GNU_MIRROR}/gsl/gsl-${PV}.tar.gz"
-SRC_URI[md5sum] = "bda73a3dd5ff2f30b5956764399db6e7"
-SRC_URI[sha256sum] = "b782339fc7a38fe17689cb39966c4d821236c28018b6593ddb6fd59ee40786a8"
diff --git a/meta-oe/recipes-support/gsl/gsl_2.7.bb b/meta-oe/recipes-support/gsl/gsl_2.7.bb
new file mode 100644
index 0000000000..d40eebb4ca
--- /dev/null
+++ b/meta-oe/recipes-support/gsl/gsl_2.7.bb
@@ -0,0 +1,4 @@
+include gsl.inc
+
+SRC_URI = "${GNU_MIRROR}/gsl/gsl-${PV}.tar.gz"
+SRC_URI[sha256sum] = "efbbf3785da0e53038be7907500628b466152dbc3c173a87de1b5eba2e23602b"
-- 
2.25.1

