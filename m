Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849BBC4167B
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:39:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.37741.1670830757315782553
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:39:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=u8aGmUsR;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830755; i=@fujitsu.com;
	bh=SFdr1ybdOVjWoBNIrtmHN33n8e8m4CMFqTL8bSdLewM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=u8aGmUsR2VrxjYiDNBo8hVlmP3ium8wHclPizLCYPdYo51ZNeEtEXbf5L032gBgvk
	 2hz01B16oAHRzcREUFjRtFdCq1faoSTiU1rT6UiCRYAbS+gz9J49IV+VTegSx5yW3S
	 3LGPZqDVyREeCim1vk+MipVbawlp7uFsDXZ9gWm7WwIXvrKpC2q/gKhlP9zOHKg0/e
	 Zc9z+tYyKvZijPEiTT450GXvM3Rt3pSmIRYoIiSilSul7u7oMe6kPkGVzaqcrk45JV
	 f9FGo8sYTo2yGudN7D6CM2z0FTfqGGicwOawXbJcSSuk/taGQ1TovID3BG/9nUnsF4
	 oNnzev3+aSquw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqLv41rR
  kgxMfxSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyNC2+yFFznqZj7cw17A+Mu7i5GLg4hgSeM
  ElePnWCEcK4zSZw99YwNwtnDKHHk2nvWLkZODjYBKYkb9/+zgdgiAvoSS2fvYQaxmQVUJF787
  mEHsYUFfCSebN4HVsMioCrR8fs8WJxXwFGia+NZRhBbQkBBYsrD92C9nAJOEg+bf4HVCAHVfJ
  /ZxAJRLyhxcuYTFoj5EhIHX7xghuhVlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRGwVlI2mchaV/
  AyLSK0aw4tagstUjX0EAvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzkn
  RS8vtWQTIzB8U4pV+nYwvl32R+8QoyQHk5Iob+WVaclCfEn5KZUZicUZ8UWlOanFhxhlODiUJ
  HgP3gTKCRalpqdWpGXmAGMJJi3BwaMkwqsCjCch3uKCxNzizHSI1ClGXY6ZX9sOMAux5OXnpU
  qJ8wqDzBAAKcoozYMbAYvrS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeXlBVvFk5pXAbXo
  FdAQT0BFRL6eCHFGSiJCSamCqVZ31sXD5vMfpT8LfXWj/eJj3r53isilbdsw/dTzFKmVDRVqT
  6Xkr/T/dzrZhK+LXzDh9QqfGxb2iakvhsYcn49zjmLfduWZxUyJ9adfy2fUebzdf2xkQ7q8bk
  5m3/U1bmOJGN7EKKYaZQrz67n8SXikfaDYzr5xypNVr/6reCD/etr/apaKnVgq7zP8Tue2Ide
  gJ99oXgXml3vcCcuMqH6X5/j9SsvdgydaUr/HL7yuHfT6+oOYJ16r7e7oztfLPTJbjfzwpSbG
  7X81n67UF23SzFL84LqjdZdS2NWBJrH0j08qfK6xTShZwqBed0u4PPpVtPXvWxYJ1aut+B597
  wBrHMdlyhuS+Zye+LzBTYinOSDTUYi4qTgQAZWRSZWYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-571.messagelabs.com!1670830755!274023!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15614 invoked from network); 12 Dec 2022 07:39:15 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:39:15 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 142E3100182
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:39:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 08158100043
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:39:15 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:39:13 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-watchdog: upgrade 2.1.9 -> 2.2.0
Date: Mon, 12 Dec 2022 15:38:37 +0800
Message-ID: <1670830717-3138-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830717-3138-1-git-send-email-wangmy@fujitsu.com>
References: <1670830717-3138-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100054

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
[build] Wheels are now available for Python 3.11 (#932)
[documentation] HTML documentation builds are now tested for errors (#902)
[documentation] Fix typos here, and there (#910)
[fsevents2] The fsevents2 observer is now deprecated (#909)
[tests] The error message returned by musl libc for error code -1 is now allowed (#923)
[utils] Remove unnecessary code in dirsnapshot.py (#930)
[watchmedo] Handle shutdown events from SIGHUP (#912)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-watchdog_2.1.9.bb => python3-watchdog_2.2.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_2.1.9.bb => python3-watchdog_2.2.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_2.1.9.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.2.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_2.1.9.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_2.2.0.bb
index 8c7c6dd47..12adaf9f7 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_2.1.9.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_2.2.0.bb
@@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "43ce20ebb36a51f21fa376f76d1d4692452b2527ccd601950d69ed36b9e21609"
+SRC_URI[sha256sum] = "83cf8bc60d9c613b66a4c018051873d6273d9e45d040eed06d6a96241bd8ec01"
 
 inherit pypi setuptools3
 
-- 
2.25.1


