Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E2FC6FD18
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:23:39 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.43120.1682306609846547320
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PNV68WFG;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306608; i=@fujitsu.com;
	bh=S6WJZRaV9UHXe3DgHtAkk086OcXUeTyjQ6xZgwtidbc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PNV68WFGR6doP2ykLkD1n2fcp3jac/S/MO5PMI4hfEbNtg3xq3EopZtijZ/NnssNA
	 l+Db7DcDP+wM17pjis4HFGiTNm103QRnSVQhCn/DAJH5q/monftYunoRN1VtGU2MFl
	 wqESUmTm+PRSZOOMMKP3QyvrDHpNNEqe7UwBjwlUAU4TN+iwKF+mWumzWIZBkqIRyw
	 47W7RnWVA9cspS+FO72bPdvqhPaOjCBefm61uBvje1748FaPOnhgUlqcl7AdraexTn
	 JibcV3l9c0mBDwT64vrJe9R5GkMfnXS6xjQxmbHHuvLgY+etaEAT7xz0v4Vtaet2Kc
	 N4nhoMBy4PMbQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqKv/zTX
  FYMcaLouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPWyn72gq/cFadbnrE0MH7l6mLk5BASeMIo
  cW9JfRcjF5B9g0ni8LyFzBCJvYwSh7sqQWw2ASmJG/f/s4HYIgL6Ektn7wGrYRZQkXjxu4cdx
  BYW8JY4u3YGC4jNIqAqcfvpdrB6XgEniSkzDoHVSwgoSEx5+B7M5hRwlujd/YwFYpeTxP9Dj9
  gh6gUlTs58wgIxX0Li4IsXUL2KErMvN7NA2JUSrR9+QdlqElfPbWKewCg4C0n7LCTtCxiZVjG
  aFqcWlaUW6ZroJRVlpmeU5CZm5uglVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjlpZZs
  YgQGbkoxQ+QOxvs7/+odYpTkYFIS5V2ywSVFiC8pP6UyI7E4I76oNCe1+BCjDAeHkgRv0SfXF
  CHBotT01Iq0zBxgFMGkJTh4lER4l30BSvMWFyTmFmemQ6ROMSpKifMGgiQEQBIZpXlwbbDIvc
  QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmFfyA9AUnsy8Erjpr4AWMwEt3sXtArK4JBEhJdX
  AlLRkijpvv0oZQ7Z5HyPLexY/NgXBH3yvCxtFznjsjZZd/WSJW725F29rinA2z+Z5vH86LY5k
  P1JgalgYdcg5kCVl5ZHpsl9WfeC7PUU7vXX51/nLJ777u/PC/PVLLrdzCDyRYd4gZaBm9a1L2
  8kk82F46oufL888WRJxY+IL3+4rwYsuVr6smZ1T7Jb2ck3K40L37e/WOm2zPNOj1sqQ/078B0
  /hbTvNl1rPAg+GzV0o6KHfNUFYdYW1m919n9PzurKzox+GvWlX8zjdtU5um7PVvM61Rgcz92s
  svavGs4phUrT0os6eTjmJItm/zQ4ypbtnnJLLaNXfbyAwkyfYdhuPyPEtu25dbCs0XV2uxFKc
  kWioxVxUnAgAXf/PEVcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-585.messagelabs.com!1682306606!121274!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16387 invoked from network); 24 Apr 2023 03:23:27 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:23:27 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C868E1001A5
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:23:26 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BC1FD10019A
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:23:26 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:23:25 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-soupsieve: upgrade 2.4 -> 2.4.1
Date: Mon, 24 Apr 2023 11:23:06 +0800
Message-ID: <1682306589-11841-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682306589-11841-1-git-send-email-wangmy@fujitsu.com>
References: <1682306589-11841-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102160

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Changelog:
 FIX: Attribute syntax for case insensitive flag optionally allows a space, it does not require one.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-soupsieve_2.4.bb => python3-soupsieve_2.4.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.4.bb => python3-soupsieve_2.4.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.4.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.4.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.4.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.4.1.bb
index ba5fe505d..70c35844a 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.4.1.bb
@@ -2,9 +2,9 @@ SUMMARY = "CSS selector library for python-beautifulsoup4"
 HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c7a2acf04248c0d02dac4c82ee8a7f56"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=520586fa71ed2cbda50b4a8c89621e09"
 
-SRC_URI[sha256sum] = "e28dba9ca6c7c00173e34e4ba57448f0688bb681b7c5e8bf4971daafc093d69a"
+SRC_URI[sha256sum] = "89d12b2d5dfcd2c9e8c22326da9d9aa9cb3dfab0a83a024f05704076ee8d35ea"
 
 inherit pypi python_hatchling python_setuptools_build_meta ptest
 
-- 
2.34.1


