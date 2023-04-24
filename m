Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B5E4C6FD18
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:19:39 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.42763.1682306375025217045
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Y0ye6xAR;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306373; i=@fujitsu.com;
	bh=L0wNVlyQ+66A9PGEB/poz0F6PvV69nYgmlXY0oJmGJk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Y0ye6xARufzPyDZukOXTtOB5FOSrMrAAbu2PmXD6ARMmGg/SBCOIW2ulbUfi43dDQ
	 PUKkvXgmcMBA66Jp9Dyejb7gcVUfjLM00jKjPY1IJMlJgtqJNpYbf+Qzey2PK1bOUA
	 ivs9ttnI9ooNmGL2Sg6P5G5r0TF7/M//WIxOhJ4uM2DGSLqQw41iJ2WnLdfxccvYyv
	 ovBBIS6XaNhsn0VEUS8oyXpRSYss4GZ808bqe4i9AzuGlRn8UMT3lM0UqY9cswVl9H
	 0QjoLN1/mGVxJY6+TvCCu5Yh+Ez/WLGZsP2qGmF86gz/dSnNWgzPYttQDGFjO+kApl
	 67wbyTTl755Xw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRWlGSWpSXmKPExsViZ8ORqOv81TX
  F4Mcyc4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP4y4XMBZ08FevmpTUwPuLqYuTiEBJ4wijx
  sekEO4Rzg0ni8JVzUM5eRolbs/tZuxg5OdgEpCRu3P/PBmKLCOhLLJ29hxnEZhZQkXjxuweog
  YNDWCBI4tlmAZAwi4CqxJoDHWBhXgEniUczE0DCEgIKElMevmcGCXMKOEu87c8ACQsBVVxZ9g
  psIK+AoMTJmU9YIIZLSBx88YIZolVRYvblZhYIu1Ki9cMvKFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbT4tSistQiXVO9pKLM9IyS3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL28
  1JJNjMCgTSlmYtjB+GjnX71DjJIcTEqivEs2uKQI8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuAt+
  uSaIiRYlJqeWpGWmQOMIJi0BAePkgjvsi9Aad7igsTc4sx0iNQpRkUpcd5AkIQASCKjNA+uDR
  a1lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ80p+AJrCk5lXAjf9FdBiJqDFu7hdQBaXJCK
  kpBqYPJKXdCywUlVbcvbgMyE+w7Qtk9Pbjvn+KHti2HtCrrPpy8tbL7LclZW9X/fUa5ld13A6
  PP2Y/605H7bb/hG5VCFWMuGbJv8Epv/Cj78bLXA6dL5IabGo8+5WqYCGsi2swtHC39tSk6KF9
  273nlOxWOet9FKBYxacad8CPuro3FBZctgt66wLx8vydczp5yeffHyb7Ruf4fXNK6/t3blJJI
  hPV1D8rsZGNebfLv4XD57c7WMbsW6ZzE2mta1b/aosbXe5+vneSyit259nf2BR4a6z3wq1/qy
  TNs2+0Jdo7rM1RlBccSb3p8/FrVamcr4tSQkLtY5NeHyBxZYzLbxFr8Imt+5GLpOa7Ac16VNK
  LMUZiYZazEXFiQALpLcRVQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1682306371!120599!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7868 invoked from network); 24 Apr 2023 03:19:31 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:19:31 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 840E51001A5
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:19:31 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 778AF1001A1
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:19:31 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:19:29 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] evolution-data-server: upgrade 3.48.0 -> 3.48.1
Date: Mon, 24 Apr 2023 11:19:08 +0800
Message-ID: <1682306351-11741-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682306351-11741-1-git-send-email-wangmy@fujitsu.com>
References: <1682306351-11741-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102150

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Bug Fixes:
---------
 I#459 - Camel: POP3's 'UTF8' command blocking login
 I#461 - backends: React to destination URI changes
 I#462 - Fails to refresh backend with offline changes and broken local cache state
 I#469 - IMAPx: Ignore 'Permission denied' error on refresh
 M!116 - libedataserver: Disable deprecation notice around e_flag_timed_wait
 M!119 - Calendar: Change file backend discard_alarm() function

Miscellaneous:
--------------
 WebDAV Notes: Fallback to derive component summary from description
 CamelFilterDriver: Unset info's headers only when folder has summary

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 9db5e9011..59d3b5a29 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "0f25f73331edf53909be40f412b2a86939270327517616303f322de157083c35"
-PV = "3.48.0"
+SRC_URI[archive.sha256sum] = "5ce62c1e67f2789342a7f4a035b102f74e62ed85f60e81a5b7f3e04165404dff"
+PV = "3.48.1"
-- 
2.34.1


