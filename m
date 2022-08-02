Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EF1C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:40:02 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web09.6214.1659447591983506548
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nh9cZgO3;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659447590; i=@fujitsu.com;
	bh=LkqQ5YISiRMidhDGkyBt6lUo7GiBO4lDmlwMDK9uQII=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nh9cZgO3H6pi/5QxfMKoz0wgR/+2eOn6QqBg9vA89W6GcwKDgk9SiETVSxUbERIht
	 OGHSk7yiQHaDi/xEbIpmk+BRh9lbcpOwJvZ94NPHkGuZ4d9qqV6gbpWzqznlzw4QA0
	 51QsqGIR7pntuIOBeSmelEovoRGFoPcrDAg9vYYY7ZVEoGdLaxxKlT+MizVdEj22hC
	 rWYVFImkZ7PRayZCarjjciMvfFZWxsNxiUZz8XiG8PeETi0eYtcHeHZ49XDFxliqcR
	 RgqsVViSLd/8txXWM0oZqldzTM0Y4kXMpDG8eggPL2rHwxRrVwHTy+CIWSXxMEvhhl
	 52jerTqUI/aDQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqKuq+TL
  JoHOZucXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrF7fTdrwR+hirlf2xkbGLsEuhi5OIQEnjBK
  rNu8jQ3Cuc4kcezjREYIZzejxJ6H/cxdjJwcbAJqEtNv3WAFsUUE9CWWzt4DFmcWUJF48buHH
  cQWFrCXePL1JVgNC1B8yeP7LCA2r4CTxN9TE8HiEgIKElMevgfr5RRwlrjVfoINxBYCqrm/7Q
  s7RL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmFgi7QmLGjG1sELaaxNVzm5gnMArOQtI+C0n7Aka
  mVYyWSUWZ6RkluYmZObqGBga6hoamuoa6ppZ6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBQZxSzGi9g7Gj76feIUZJDiYlUV45xZdJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4b6kC5QSLUtNTK9Iyc4ARBZOW4OBREuF9pwaU5i0uSMwtzkyHSJ1i1OWY+bXtALMQS15+Xq
  qUOO8tkCIBkKKM0jy4EbDovsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPceyBSezLwSuE2
  vgI5gAjpCh+sFyBEliQgpqQYmdp4TYvyL35VK5r4VKPj3M6LhllDwrstz8k8HO/Fuv76feUdd
  /NcIDdeKTUcuTI3PZF4neWCexqE9zyU5l7JxOx3+emfH5teBmgu2hBqqzGTxv8Qh1nZy/ccNq
  yu3f4w5NXVVknvt/f5TH7xiJIWWJYqpn3jxqO10Q/t7AXHvIzyaWlvWzng5N82s92av+IKJx8
  XL2HnOP1RNWC7wftOM80mexrHefrPFq74fYI59syRm18+1j6XTXU2WJCgVtvCKb8lN2pFc//O
  Cpsok3zLGjeIcm6qVFNImaey98p5F5Lmt06FfTdkL783cc+v5rXrbhFUXJjxwC4j4+vp4UtWT
  xe+2fAgSet02N9clZ4OQgxJLcUaioRZzUXEiAFWyi01pAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-585.messagelabs.com!1659447589!938867!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16350 invoked from network); 2 Aug 2022 13:39:49 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Aug 2022 13:39:49 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 825A410018D
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:39:49 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 76540100043
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:39:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 2 Aug 2022 14:39:48 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] freerdp: upgrade 2.7.0 -> 2.8.0
Date: Tue, 2 Aug 2022 21:39:29 +0800
Message-ID: <1659447571-24348-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659447571-24348-1-git-send-email-wangmy@fujitsu.com>
References: <1659447571-24348-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:40:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98085

Changelog:
==========
Noteworthy changes:
-------------------
    Backported API to get peer accepted channel option flags
    Backported API to get peer accepted channel names
    Backported Stream_CheckAndLogRequiredLength
    Backported #7954: Add server side handling for [MS-RDPET]
    Backported #8010: Add server side handling for [MS-RDPECAM]
    Backported #8041: Remove ALAW/ULAW codecs from linux backends (unreliable)
    Backported #8051: Relieve CLIPRDR filename restriction when connecting to non-MS Windows servers
    Backported #8048: TLS version control
    Backported #7987: Add a new command line arg to enforce tls1.2

Fixed issues:
--------------
    Fixed #7837: Prevent out of bound reads for FFMPEG
    Backported #7859 and #7861: Unwind support for backtrace generation
    Backported #7440: wlfreerdp appid
    Backported #7832: RAIL window restore
    Backported #7833: Refactored WinPR thread locking
    Backported #7893: Mac rdpsnd memory leak fixes
    Backported #7895: Mac audin memory leak fixes
    Backported #7898: Automatic android versioning
    Backported #7916: GFX 10.7 capability support
    Backported #7949: Server RDPSND API improvements
    Backported #7957: Server DVC API improvements
    Backported #7760: Fixed osMinorType values
    Backported #8013: Add missing osMajorType values
    Backported #8076: Fix wrong usage of subband diffing flag (tile artifact fix)


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freerdp/{freerdp_2.7.0.bb => freerdp_2.8.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp_2.7.0.bb => freerdp_2.8.0.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.7.0.bb b/meta-oe/recipes-support/freerdp/freerdp_2.8.0.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp_2.7.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.8.0.bb
index 0645ccd944..33782e56b7 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.7.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.8.0.bb
@@ -13,7 +13,7 @@ inherit pkgconfig cmake gitpkgv
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "40ee5d3bcc70343af6c0300d71968858c1f1948f"
+SRCREV = "e3fc97feb512053189e276b2ca79762990bb8c4c"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
     file://winpr-makecert-Build-with-install-RPATH.patch \
 "
-- 
2.25.1


