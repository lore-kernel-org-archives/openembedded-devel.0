Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A5EC43219
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 06:38:04 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web09.6827.1651127874389779469
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Apr 2022 23:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=URE3C4PG;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651127872; i=@fujitsu.com;
	bh=plC0Nple2yUmwfDyaQCiTs2GVF6ykdmSpFEU8VA1CEI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=URE3C4PGeRWWgEvW95oyn7Sc13HgjvwbFcbLeYneVyIUs1El3P4Zp9cd9DwAmhi/h
	 Ye9FDY0L1It7eBuTKBtaqmPlo0mdY/BdEy9B523KoY7/3fjl7F7KnY0oTeLOqIpntR
	 kbxwEE8CtGzPLYpPMhQPCHb0/WkQn/tT6FRSkIg10jhStDsEM3w3oc65O9v2rH4cDr
	 tE5bxePcUKG46f+2M2Z4zjjgpW6TuvO+UC+92kMusss7c5pDNDwaGOXQzS5T9LIz/R
	 sGVglo73dAe4XRgeflCd1dTbxmhwQuvrz1zZZTnN5UH0fY59iPN6hUkK/qCN2AoA0q
	 t3ZlGc/EaMCIw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8MxSdfeLCv
  J4PVMK4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPh5CeMBY84Kza//cbSwPibo4uRi0NI4Amj
  xK2fu5kgnAtMEpuX7mfvYuQEcvYwShyZawFiswmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  1i9sIC/xKOJ84FqODhYBFQlrm0XBwnzCjhJbJ/+gA3ElhBQkJjy8D0zRFxQ4uTMJywQYyQkDr
  54wQxRoygx+3IzC4RdITFrVhsThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNlUlFmekZJbmJmjq6
  hgYGuoaGpromupbFeYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZgQKYUs8Tu
  YNza91PvEKMkB5OSKK+VaVaSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnebBOgnGBRanpqRVpmD
  jA6YNISHDxKIrwyxkBp3uKCxNzizHSI1ClGRSlx3oUgMwVAEhmleXBtsIi8xCgrJczLyMDAIM
  RTkFqUm1mCKv+KUZyDUUmYNxpkCk9mXgnc9FdAi5mAFq8sygRZXJKIkJJqYFp8gnPpoyjtr97
  7PVZun5vfcyc50EE2/L33vErtL0lKTRU2545OsNh7rqb8+1T+pxsiKiulApLYMnLT1zQGL4xX
  PXixNfRh8KcdKQfSXuyb0SV3NH1+KXPBTNaKz1HJSnpCXYfz2OZM4YvbxJtnM1lhS7ztx3sin
  b4ez6obb4Sclp7hk1Vwo/BB0dmN//mcs5Qv923mLnN2Donx2iiTd3D14ZvMomcepaTa/y39fP
  mMgQzv+db2IxNPnWtv068Q6Yrd66u9cuPH7r7ZZn9+vDxQmrNa+O7FldOrm9SO/Szm85aPLDL
  68ri8hEdo3jbFQsbLN2WVF3zK2rFBIH1fakIrv60yO9OCwEf31Nk3KrEUZyQaajEXFScCAMhA
  4SpDAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-585.messagelabs.com!1651127871!18082!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28631 invoked from network); 28 Apr 2022 06:37:51 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 06:37:51 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 774DC100354
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 07:37:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 660D31000FC
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Apr 2022 07:37:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 07:37:33 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.5.8 ->
 1.5.10
Date: Thu, 28 Apr 2022 06:53:25 +0800
Message-ID: <1651100009-17477-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Apr 2022 06:38:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96821

Changelog:
===========
    Remove Flask version contraint (#1395)
    Change ordering of event drop mechanisms (#1390)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...python3-sentry-sdk_1.5.8.bb => python3-sentry-sdk_1.5.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.5.8.bb => python3-sentry-sdk_1.5.10.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.8.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.10.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.8.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.10.bb
index cf1337e2b1..7076e19039 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.8.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.5.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
 RDEPENDS:${PN} += "python3-urllib3"
 
-SRC_URI[sha256sum] = "38fd16a92b5ef94203db3ece10e03bdaa291481dd7e00e77a148aa0302267d47"
+SRC_URI[sha256sum] = "0a9eb20a84f4c17c08c57488d59fdad18669db71ebecb28fb0721423a33535f9"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.25.1


