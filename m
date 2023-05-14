Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D940BC7EE24
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:05:45 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.66055.1684069536544843965
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kqglL4QM;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069534; i=@fujitsu.com;
	bh=svoWzCXk2WPrHrlqZGUT19M7CymHaCpaMI9Tb0T92Uk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=kqglL4QMBtBWkS+a5/iCBV+kVajvCLeOFUOuEXkl+4Ok17U6uSTdqj54uAGD4ZxKh
	 ttNwI8IYM8sV/kNAH18G9vtGowfnnT2dDPZV+I09Zq+6dJUStTGUpeultTCNfP1TVS
	 FCN/tb6NOq+3IQSPefJ57FRG+2svQWljkIU0GbUAu56U2MpezbfwcWvpuiQCxXw3+c
	 mCV4WPp7H5JGS1nGRQ/Im7SNgRuEzE+YM1r2jMlaZP87newVYM6IOsw6/ILLHjuvQU
	 VVtlDTA5td8m9ZPPaqO1Y4/FvOcq9VcJjCF3Cc52JAhWC8nI2qPYoyfXB+ZVAFDjQi
	 ARtD0LWDyHz/Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRWlGSWpSXmKPExsViZ8ORpDv3TkK
  KwZKDChYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a0NWtYC85wVTz/3cfWwLiVs4uRi0NIYCOj
  xMEt69khnKlMEneX72LuYuTkYBOQkJi+9yQ7iC0ioCvx8cNcRhCbWUBFYsbkI0xdjBwcwgLWE
  r92FIGEWQRUJX6fOsEEYvMKOEms/3IRrFVCQEFiysP3YCM5BZwlftx6AVYjBFTz9N5kVogaNY
  mr5zYxT2DkWcDIsIrRrDi1qCy1SNdML6koMz2jJDcxM0cvsUo3US+1VDcvv6gkQ9dQL7G8WC+
  1uFivuDI3OSdFLy+1ZBMjMCRSipPtdjB+2flX7xCjJAeTkijvtZK4FCG+pPyUyozE4oz4otKc
  1OJDjDIcHEoSvDo3E1KEBItS01Mr0jJzgOEJk5bg4FES4Y27CpTmLS5IzC3OTIdInWJUlBLnP
  QDSJwCSyCjNg2uDxcQlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8PDeApvBk5pXATX8FtJ
  gJaPGtPfEgi0sSEVJSDUxFLl8muhyvvzAx9VT8vtsnzJ80Vrgcjfp+fmq65LU126bm7L/tc6T
  +11PpnqrveWYCBs2lSRVCrvm8pa6P56cayq3gsFxrwLPL4LW19LLQqx0n15zJmXjOqaRpYZLR
  /rdX0hQ21FuKCZROPVmxeuNcP+UNtkf7JDq8tp5dUfVnr/PuCUe+uFqY75bYscXDKn3dvY/Hz
  y9k/JNwNGiOZ2BwX//p7w9W2B1dyPfJfva5uIYJmatXHeXv93sTHFh6WGT3W57dNZo2pyaL1W
  3afOT4oa0xX5udDJddXSNbtJv79MWrzbVeqdPX3ZbOfdC+o+vi+kKmCEPmPZ9mfZLY+2DbEo8
  nlf9Ffl4VXrHI53nURCWW4oxEQy3mouJEALclf9AEAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-728.messagelabs.com!1684069533!366389!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30621 invoked from network); 14 May 2023 13:05:33 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:05:33 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 004CB1AE;
	Sun, 14 May 2023 14:05:33 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 265AE7B;
	Sun, 14 May 2023 14:05:31 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] php: upgrade 8.2.5 -> 8.2.6
Date: Sun, 14 May 2023 21:05:17 +0800
Message-Id: <1684069520-12282-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684069520-12282-1-git-send-email-wangmy@fujitsu.com>
References: <1684069520-12282-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102572

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Fix inconsistent float negation in constant expressions.
Fixed bug GH-8841 (php-cli core dump calling a badly formed function).
Fixed bug GH-10737 (PHP 8.1.16 segfaults on line 597 of sapi/apache2handler/sapi_apache2.c).
Fixed bug GH-11028 (Heap Buffer Overflow in zval_undefined_cv.).
Fixed bug GH-11108 (Incorrect CG(memoize_mode) state after bailout in ??=).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.5.bb => php_8.2.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.5.bb => php_8.2.6.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.5.bb b/meta-oe/recipes-devtools/php/php_8.2.6.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.5.bb
rename to meta-oe/recipes-devtools/php/php_8.2.6.bb
index ff432f3adc..833a70fac3 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.5.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.6.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "e5a80663cca4f6044ad86a489798147c7af037eca96f6cd357ab36d28cb63757"
+SRC_URI[sha256sum] = "44a70c52f537662c10d91eedbf51fd765c9961be6ba2508ed63bf7a26cdd3100"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.34.1


