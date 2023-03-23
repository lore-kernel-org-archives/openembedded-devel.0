Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA21C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 04:15:07 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.65217.1679544900610001869
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 21:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ENjW1DV6;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679544898; i=@fujitsu.com;
	bh=brI2mZaQKYGd3cyVHIccurbHcKRTSTHH7NCdclx2CAs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ENjW1DV6LWpL+FfiT/xTsbIiO8g/8OKMX2Ir86V7JNwlVmpcPnyqp2Pmj7qBdFqM1
	 o8XZ+C110SRfJOs8hmoOeLrmSWp3F9XbPqYciUAEAhIzEu1KvQedwccUBssigzFvn8
	 mDd8ISsHYE5G1BhHQqYhiwwQjvzoizvmkL5ZF3JWV+TtTLey0joV2d3CL30aGZKYjO
	 V5PauGKt7YGJoCEchiTh06BxhFfzcgcN/0W8f7g1sTXWS5OUCmqSXSAxq+DLCzFg31
	 tsTJO+U/7pmx8FzlrlMzCv0Ze+uONh2tCSM0/aPoKxboF8xsg00B9fW0XGaqkI8nU5
	 vS1XvSBZhPnxQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORpOt4STr
  F4GCbqMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH9SBt7wWG+iluX3zM3MM7k7WLk4hASeMgo
  cWPFFkYI5wqTxPIH59i7GDmBnD2MEhueuIPYbAJSEjfu/2cDsUUE9CWWzt7DDGIzC6hIvPjdA
  1YvLOAt8a/7LwuIzSKgKrHj41mwGl4BJ4mvB24zgtgSAgoSUx6+h4oLSpyc+YQFYo6ExMEXL5
  ghahQlZl9uZoGwKyQapx9igrDVJK6e28Q8gZF/FpL2WUjaFzAyrWI0LU4tKkst0jXVSyrKTM8
  oyU3MzNFLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMxZRiFrMdjO19f/UO
  MUpyMCmJ8kqESqcI8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuDVuQiUEyxKTU+tSMvMAcYFTFqCg
  0dJhHfuQaA0b3FBYm5xZjpE6hSjopQ4byxInwBIIqM0D64NFouXGGWlhHkZGRgYhHgKUotyM0
  tQ5V8xinMwKgnzzjgPNIUnM68EbvoroMVMQIvjZkiALC5JREhJNTDt/qHEUbhH4PMz9wlFWjd
  F4iPOPTp5MaXsLPdP93ULKySW8HhmS0ZZ1kstcGE7tfHvYs33kc9iNky8tdbio0h497STSvJf
  jZgPZm1cxCt4WlPR5ftE7l8PeOV9vNT7XW1PKB+54881W36D3/W1nF7m6boptv4acbGy+0q/h
  WxZZ1FZENxzY3WJr/LW2a37kioVfFOmTwjVlU3W5jj591/gnRcetns635i/rawMbT36X8XjZr
  lF2SqDOn02ceeHhmKNjpo7lrDZ2C8subSPI6T7tPtrtV1PAjUlfvwOnvpeNI9vbq1qQprL6bW
  //scKZt5JE2biV4kqlWOf/K1N3mNi9dvGY/ofPC9kfOEsUGIpzkg01GIuKk4EAJf1uy5AAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-587.messagelabs.com!1679544897!169100!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8527 invoked from network); 23 Mar 2023 04:14:57 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 04:14:57 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E15F01B4
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:14:56 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D62461B0
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:14:56 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 04:14:55 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-geojson: upgrade 2.5.0 -> 3.0.1
Date: Thu, 23 Mar 2023 12:14:37 +0800
Message-ID: <1679544881-19951-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 04:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101642

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Update library name in license

Changelog:
==========
Add Support for Python 3.11.x minor revisions
Support for Python versions 3.7-3.11 (Python 2 no longer supported)
Primary development branch renamed from master to main
Handle all real numbers as coordinates
Default precision improvements
CI improvements
utf-8 support added to geojson.dumps()
Polygons now constrained to bounding box
Better GeometryCollection handling in util.coords()
Improved point validation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-geojson_2.5.0.bb => python3-geojson_3.0.1.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-geojson_2.5.0.bb => python3-geojson_3.0.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb b/meta-python/recipes-devtools/python/python3-geojson_3.0.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-geojson_3.0.1.bb
index 40cf8bda76..671fe4f23a 100644
--- a/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-geojson_3.0.1.bb
@@ -1,10 +1,9 @@
 SUMMARY = "Python bindings and utilities for GeoJSON"
 HOMEPAGE = "https://pypi.org/project/geojson/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=f48972abe5cddee79e301574742ed745"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=f77f2ed49768c8d4c79ba874c0f94d8a"
 
-SRC_URI[md5sum] = "14753ed28678828b1de73f68b04e2324"
-SRC_URI[sha256sum] = "6e4bb7ace4226a45d9c8c8b1348b3fc43540658359f93c3f7e03efa9f15f658a"
+SRC_URI[sha256sum] = "ff3d75acab60b1e66504a11f7ea12c104bad32ff3c410a807788663b966dee4a"
 
 inherit pypi setuptools3 ptest
 
-- 
2.34.1


