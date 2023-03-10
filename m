Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57513C6FA99
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 06:14:07 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.13397.1678428837592003789
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 22:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OQbDWTkj;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678428835; i=@fujitsu.com;
	bh=SfBj6LT2L3rPVIzgpU1u9+pzRuOiBEMDUsPaNIGIJfA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=OQbDWTkjQ/EO3xAoPdtEqFQlTcn0ERchK97rtCzTNjAuKnaXhd6Xq9WXaX9r1wWCo
	 6L5D2g24o2v2om8e2rX7zMwS/Fbx8s7oeHgYk3+/S0hgi4WqDJYUzXELJpcIcxYf4g
	 zNCovzt4mf7djNuvwR/28+LVyU75ea5dHjjV5zumSjdkz/GfDDvKHcFpxODT4GzaoR
	 dzuoExBvZ0mwhXCvTug8L4TT4H5GZWwaoExcPsi9ZsRoVIpXmRZNJEytMu0slqz9Rx
	 0QTNaouM4F8YFgcqYjouT9gyaEpEkDKGB6VRYu+Daxt/YVM5FqPT8yICnD+z61j457
	 Wl0TkFhXLfIhg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORpLvoFFe
  KwYkt+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aZDa2MBZt5K94eXcvewPiIu4uRi0NI4CGj
  xI1zTSwQzhUmiWW3vjFCOHsYJXYuesvWxcjJwSYgJXHj/n8wW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICjxIpTBxlBbBYBVYn/3U9YQWxeoPjeazvB4hICChJTHr4H6+UUcJLomXgKrEYIqObqye
  9MEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsConG6YeYIGw1iavnNjFPYBSchaR9FpL2BYx
  MqxjNilOLylKLdA31kooy0zNKchMzc/QSq3QT9VJLdfPyi0oygFKJ5cV6qcXFesWVuck5KXp5
  qSWbGIHhm1KceHsH4/Lev3qHGCU5mJREeZVTuVKE+JLyUyozEosz4otKc1KLDzHKcHAoSfDuP
  QGUEyxKTU+tSMvMAcYSTFqCg0dJhJd1B1Cat7ggMbc4Mx0idYpRUUqcl/U4UEIAJJFRmgfXBo
  vfS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeSVAtvNk5pXATX8FtJgJaPGuLRwgi0sSEVJ
  SDUxcFWyK+w/P6W/cxiF+y61V2dn2du7d6WfyvwpmnWBR7u+YYqVl28FiFDBXZXFL+9P/lh/a
  thYslVwafkr1Sv5rnZ98c3p3njnD/+SYfk/Dzpq7LBcawm6sn3LP8rDR5+fcEzfu66pYmPh85
  5K8GUIFfdOcMt44qLUGcLDmekldzGJ5cFh5T+sXies7e6d9eeCwlIE1dO7yGWvmzAi99eXUN2
  +/FrHq+TGTl3G1PXzv+v39r+1aLaIMt+SfM/I1b7P59vNXQWliouWbH7vs43N/SFcu2dBuy/s
  r94Xhjwj+hXxLjyzvPXXuluEjRe/dWxu/PnCL8jy4MefUzx8qVm+mSp4pYeH3P+wVyXiz7o2T
  EktxRqKhFnNRcSIAiBlPZ1oDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-745.messagelabs.com!1678428834!41464!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20694 invoked from network); 10 Mar 2023 06:13:54 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2023 06:13:54 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 29AED1B1
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:13:54 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1E57C1AE
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:13:54 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 10 Mar 2023 06:13:52 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/11] php: update 8.1.16 -> 8.2.3
Date: Fri, 10 Mar 2023 14:13:31 +0800
Message-ID: <1678428812-7622-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678428812-7622-1-git-send-email-wangmy@fujitsu.com>
References: <1678428812-7622-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101476

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2022.

Changelog:
=========
- Core:
  . Fixed bug #81744 (Password_verify() always return true with some hash).
    (CVE-2023-0567)
  . Fixed bug #81746 (1-byte array overrun in common path resolve code).
    (CVE-2023-0568)

- FPM:
  . Fixed bug GHSA-54hq-v5wp-fqgv (DOS vulnerability when parsing multipart
    request body). (CVE-2023-0662)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.16.bb => php_8.2.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.16.bb => php_8.2.3.bb} (98%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.16.bb b/meta-oe/recipes-devtools/php/php_8.2.3.bb
similarity index 98%
rename from meta-oe/recipes-devtools/php/php_8.1.16.bb
rename to meta-oe/recipes-devtools/php/php_8.2.3.bb
index 2f45ced95..f7639cd5f 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.16.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.php.net"
 SECTION = "console/network"
 
 LICENSE = "PHP-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=99532e0f6620bc9bca34f12fadaee33c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5ebd5be8e2a89f634486445bd164bef0"
 
 BBCLASSEXTEND = "native"
 DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native"
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "cd9f0ea14d82d9455587a49a0b6c802a7b8d8ff79703f9f48b17db010fb633ce"
+SRC_URI[sha256sum] = "87bb58865f38f5e2941813029152cea2102fe2961bb4d68b88f831ddd0548d0f"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.34.1


