Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E24DC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 12:45:06 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.25705.1646657104293069852
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 04:45:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ubT+wxPl;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646657102; i=@fujitsu.com;
	bh=9AR9EH8k2WBjWH8OBELSsppWePc7z5CVpC+853sSsDQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ubT+wxPlJ/T8WDXWGL9KRHKlZfrO9VyWQbqyPhRuzJI/8xxjpUha4En0Zee9bhWSZ
	 alM/H9W6VzrkplyDWAbqmc5lcKZUrDbN3txzbvaoIr7I1lJIps9g7CLYWrBlTlMSpx
	 XSpdpOGDNKfeWnGED4XK46pNjpNOc6nHaUcHoZeGOdJmMCjvDWGUKIMDHS8ohGMN/n
	 97K0SgNTKWyScqHHW4chiSLrLcxUjgBkIRUe/iLhBOZVDRvoexVgOdbYtoYu+rsKWk
	 Pag7gLPLValnj1pboWTppoWfBBRMAYxAnizBHo/li7b5oqS/lzUOBjayObUCqO1CaE
	 7aei//CfwVfcQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqOv3TzX
  J4H83m8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjFzfR9bwQGeiv+bNzE2ML7h6mLk4hASeMIo
  8WLBHGYI5wKTxKXjW9ghnOOMEgf+PWPqYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAWeLJru0sIDYLUHzt+f2MIDavgJNE89EOsHoJAQWJKQ/fg9mcQPWPnt4Es4WAap7cf8
  cEUS8ocXLmExaI+RISB1+8gOpVlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRGwVlI2mchaV/AyLS
  K0TqpKDM9oyQ3MTNH19DAQNfQ0FTX2ELX0MhcL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMJBTitXqdzC+WPlT7xCjJAeTkihvygLVJCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvF//AOUEi1LTUyvSMnOAUQWTluDgURLhDfkClOYtLkjMLc5Mh0idYlSUEuf9AdInAJLIKM
  2Da4NF8iVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzuf4Gm8GTmlcBNfwW0mAlocZWtEsj
  ikkSElFQDU/apk0KTpnx8/W9FAfOGgCCJ9uvev350sfJ72B2VTdKWk7r8+7OLW2Hnk14DzlVm
  +eqSs9mPPnh5w844kfXTEaMP63/lGO/+aMaqqFT45/4TOd3592d2PpgjZzxfSHr+hMO8vxb9s
  eM6PfubjcO8u+G9/6QeytTpl6punRKaZHCwNKbWv3DLmWsf9hVrvlyTVtbPcYqxwvDJQYWHCi
  f/b06/aabek/fapDlf4/THM4ZvTyyRD9p295bCyujFTy9I77Iz5qxj5/1lVxT1aH1QWaT685f
  /p/252NLyYN3bPwpPPXiY/TQO8m3UehCe+lno7b53ynw3pata1gdf+yIqqMxz2Jh7771u7m4P
  th9qv5VYijMSDbWYi4oTAe0d5HtfAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-565.messagelabs.com!1646657101!117161!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31333 invoked from network); 7 Mar 2022 12:45:02 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 12:45:02 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9D36E1001A4
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 12:45:01 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 81399100193
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 12:45:01 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 12:44:44 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 22.02.0 -> 22.03.0
Date: Mon, 7 Mar 2022 20:44:28 +0800
Message-ID: <1646657069-56146-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646657069-56146-1-git-send-email-wangmy@fujitsu.com>
References: <1646657069-56146-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 12:45:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95854

Changelog:
=========
core:
 * Signature: Fix finding Signatures that are in Pages not not in the global the Forms object
 * Signature: Improve getting the path to the firefox certificate database
 * Splash: Fix rendering of some joints. Issue #1212
 * Fix get_poppler_localdir for relocatable Windows builds
 * Minor code improvements

qt:
 * Minor code improvements

utils:
 * pdfimages: Fix the wrong Stream being passed for drawMaskedImage

build system:
 * Small code improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poppler/{poppler_22.02.0.bb => poppler_22.03.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_22.02.0.bb => poppler_22.03.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_22.02.0.bb b/meta-oe/recipes-support/poppler/poppler_22.03.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_22.02.0.bb
rename to meta-oe/recipes-support/poppler/poppler_22.03.0.bb
index a53b3fe65..a0d8be6af 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.02.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.03.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "e390c8b806f6c9f0e35c8462033e0a738bb2460ebd660bdb8b6dca01556193e1"
+SRC_URI[sha256sum] = "728c78ba94d75a55f6b6355d4fbdaa6f49934d9616be58e5e679a9cfd0980e1e"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.25.1


