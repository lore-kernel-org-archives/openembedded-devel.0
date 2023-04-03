Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C5CC761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:04:34 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.66278.1680516268830694561
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=L9VJjL+F;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516267; i=@fujitsu.com;
	bh=MDhyj+n7fbQREM0Y2VheFlYQGdm+agj8qaYapnl7V8o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=L9VJjL+F8lQ2eY+/19RQ59uo75gUrrEYELkbEseW6wpFUvaK4LNNS3Dgm3Mj0j6lJ
	 br0tc28czukDtR6FhLTlLkNVUxnohWa/NBbZ2MFBuluUA1wLcpKJzyFYcNT4fv01Ra
	 G/SMcrTsqjZ0yUugUvNzfXob5M7aBQuU9F9mldNbQi7zAFeszSxx86BNJXm1TZQ5ra
	 FTlAS2+rhtKwXyBHgt83CVJV07t2X5AK3RKOrji7MYfA9u0uJRFS4nYrLpg4+N3Uff
	 ONT+Oe2M30gCNcfGTpX6twWaPhZMsfC8bwZkeDOt5+fMRn3Iv4hOVa+InQS5Gt0Foq
	 xdrpIhE+teewg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8ORpLtqiVa
  KwenrChYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a3M12MBR08FQ+vbGFqYPzH1cXIxSEk8JBR
  4u3cXcwQzhUmiYtH+xkhnN2MEpO3vmHqYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAT2L1nb+sIDYLUPzgwgMsIDavgJPEqef7weZICChITHn4HqyXU8BZ4vaM02A1QkA1P6
  5/ZoSoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdINE4/BDVTTeLquU3MExgFZyFpn4WkfQE
  j0ypG8+LUorLUIl0jA72kosz0jJLcxMwcvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK3OSc
  FL281JJNjMAATilO27eDsaPvr94hRkkOJiVRXsF6rRQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rzzFgHlBItS01Mr0jJzgNEEk5bg4FES4VVcAJTmLS5IzC3OTIdInWJUlBLnPQ3SJwCSyCjNg2
  uDRfAlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8YouBpvBk5pXATX8FtJgJaHFrlAbI4pJ
  EhJRUAxNTz9tXGz/+uHzId0m5lMj2+Zrijw/1HM6oZ14/N0E9IC3F7kffYVbrKz8Uj7y9bR9a
  qHHpnO631INTF+6dJfpGU4X/15pL81532vmobFu0YfcJ5jN3TFexapw8pZr94OLKxB9/OH4WH
  VFeHf61WfFDdZS1+9aJAnnsKh9UkjY2x1lo3zp+dR1bxtqDM5atLph62STYIm/5dBcdrZU34m
  9UWj7erpJhcFrghb8xp7jR3TePbIq275SNO/brUtOOgtQ5f195fuaZbBem/jdq7fVE5/1LEk0
  CYpSjPDzrf/XXHlJgvLFNtln09ru1ZtN3FHI8KT2oWpV/UvRpaFVJdNINCfEZIYsPXLo6I376
  t32+SizFGYmGWsxFxYkAc5fqmlsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-745.messagelabs.com!1680516266!1029356!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19184 invoked from network); 3 Apr 2023 10:04:26 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:04:26 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id F116B1D2
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:04:25 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E5CB61D3
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:04:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:04:24 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-httplib2: upgrade 0.21.0 -> 0.22.0
Date: Mon, 3 Apr 2023 18:04:04 +0800
Message-ID: <1680516244-30936-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516244-30936-1-git-send-email-wangmy@fujitsu.com>
References: <1680516244-30936-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101918

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  https: disable_ssl_certificate_validation caused ValueError: Cannot set verify_mode to CERT_NONE when check_hostname is enabled
  build(deps): bump cryptography from 37.0.4 to 38.0.3
  Reason from cryptography changelog: Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.0.7, which resolves CVE-2022-3602 and CVE-2022-3786.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-httplib2_0.21.0.bb => python3-httplib2_0.22.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.21.0.bb => python3-httplib2_0.22.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.21.0.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-httplib2_0.21.0.bb
rename to meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb
index 3e285d9ae..9614de920 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.22.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf"
 
-SRC_URI[sha256sum] = "fc144f091c7286b82bec71bdbd9b27323ba709cc612568d3000893bfd9cb4b34"
+SRC_URI[sha256sum] = "d7a10bc5ef5ab08322488bde8c726eeee5c8618723fdb399597ec58f3d82df81"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


