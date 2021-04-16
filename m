Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web11.4111.1618541580373836379
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Apr 2021 19:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=U7Uwc1Bf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618541578; i=@fujitsu.com;
	bh=5vvvH+LvjeoOlNsBjP3nWVV1zBoTX2DKfjjDBEunMwg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=U7Uwc1BfT7ayj2IUnNw2rldYwqpJ33UqxjWllKOrPd+Uulwmv2//L3iJOX3hzX/C7
	 YYAr1jzzdl6FHTMay5aeSGCfv2h06biGSGfy5ylJ4gEpltqrtuae9nTA9DnyMKnjfK
	 gNYloNl3qrhu2XTq4yZKrzr9foUnQKOIP1E0n/5w4rUwFwW4k5p4mdIccbLjqojT+j
	 XzMayWAM0CXN3+1cILkTpZk8epFedjEtNaXkyKB5EkgUb4PY9SNh+MENb6J1zgPVEo
	 miDDiz5Oeoy3afdY/Cp4ush+ZWEczBa223QGZP44fJINd252bCykTzHnaLpAkfsjLM
	 ja8bskEv/VuGQ==
Received: from [100.113.6.193] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 8D/2F-44603-90CF8706; Fri, 16 Apr 2021 02:52:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+GYqsv5pyL
  BoOkOr8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFv13amgoecFVN3LWJsYPzG0cXIySEkMJtJ
  YvsyZgh7N6PEthM+IDabgK7Eucdr2UFsEQF9iaWz94DVCAvYSnycsB/MZhFQlTh6oAWohoODV
  8BDYuGbSpCwhICCxJSH78FKeAUEJU7OfMICYjMLSEgcfPGCGaRcQkBRYvZ0eYjySont084yTm
  DkmYWkYxaSjgWMTKsYLZOKMtMzSnITM3N0DQ0MdA0NjXVNdY1MDPUSq3ST9FJLdZNT80qKEoG
  yeonlxXrFlbnJOSl6eaklmxiBIZRSyPpxB+Oh1x/0DjFKcjApifIeWlGWIMSXlJ9SmZFYnBFf
  VJqTWnyIUYaDQ0mCd8HPigQhwaLU9NSKtMwcYDjDpCU4eJREeF/+AkrzFhck5hZnpkOkTjEqS
  onzrgBJCIAkMkrz4NpgMXSJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvKcgUnsy8Erjpr4
  AWMwEtrlhVCrK4JBEhJdXAtPq4WNc73Z0Fp27dKX55j8Fxh/65Bb2bpc5skH7lyC/IsViubN0
  yGc/1WrNCH60+Z1xbL6+6yXqhsOqnn6dLLPKn+fq6MYkpTF8ZIzLN8PDX7ytfWEq3q5qc3h3y
  Wnqyh89VluM+Mxnv7LP5ZaGV/Wv2/dnpvJt7Kn+Y5Siqb9TT/WZ8Pv472x3BZSnGsibbvkkef
  hV+/1PnhVmGu8yX6YsXWkqu+GOzdI2PWULZoktJTbnc9mkn3CI+zNELbvi6UnLLs2NncvqDFz
  dZWt67/qVh5Y/rK9RDv1d0iKnY5G+9Mu1Htup8vZjoPR8PXBY1MLM/a7dEK3zZuYmTVezelwk
  cv25cetqBrcfydLngJiWW4oxEQy3mouJEAKbRxYccAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-238.messagelabs.com!1618541576!2551000!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17710 invoked from network); 16 Apr 2021 02:52:57 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-4.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Apr 2021 02:52:57 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13G2quNm023899
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Apr 2021 03:52:56 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 16 Apr 2021 03:52:55 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] irssi: upgrade 1.2.2 -> 1.2.3
Date: Fri, 16 Apr 2021 19:24:32 +0800
Message-ID: <1618572272-69342-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../irssi/{irssi_1.2.2.bb => irssi_1.2.3.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/irssi/{irssi_1.2.2.bb => irssi_1.2.3.bb} (81%)

diff --git a/meta-oe/recipes-connectivity/irssi/irssi_1.2.2.bb b/meta-oe/recipes-connectivity/irssi/irssi_1.2.3.bb
similarity index 81%
rename from meta-oe/recipes-connectivity/irssi/irssi_1.2.2.bb
rename to meta-oe/recipes-connectivity/irssi/irssi_1.2.3.bb
index 1c5a912f2..c95741cd9 100644
--- a/meta-oe/recipes-connectivity/irssi/irssi_1.2.2.bb
+++ b/meta-oe/recipes-connectivity/irssi/irssi_1.2.3.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55fdc1113306167d6ea2561404ce02f8"
 DEPENDS = "glib-2.0 ncurses openssl"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "8547f89e014e23e1bbbb665bcf7e2f70"
-SRC_URI[sha256sum] = "6727060c918568ba2ff4295ad736128dba0b995d7b20491bca11f593bd857578"
+SRC_URI[md5sum] = "381d3af259ad15d658be50c0a01f0c28"
+SRC_URI[sha256sum] = "a647bfefed14d2221fa77b6edac594934dc672c4a560417b1abcbbc6b88d769f"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 
-- 
2.25.1

