Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C906C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 03:30:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.56094.1672716625515088102
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jan 2023 19:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GxKY2gNO;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672716624; i=@fujitsu.com;
	bh=wCvdPB2AZ7CDNHo9qBbHPCxCFuRrEQVuQowP+2zFA8g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=GxKY2gNO4pTOlywbnCFxJ8GJfdFhEwWvbOkeu7s7z7OCB+9H+kikHuKiSakoZ9ILo
	 YQJAbQzkpi1DZhs9n3VcCk8rvVL3XiMPjfeo+uahuEAB6PFOZgtNCh77s8SM93B++z
	 xDefXx9ZNmlYviuEz/zzveCZoHhIXdOQv8LskB6nsB3EKXN6oleaWn9+SGx2LT44Dk
	 jE8EJUonEBvi9jy6iWXVYKVV8oGZ/8AT4+xpzuwVmzMU0gWQgBhBP9vsX++icMFvlV
	 x9GuG8OLukRxVAsPTmWN00fdLgvd6/KBmXJ44/On3pY9DwkdwLUjDghhd/fzI12/s7
	 1WgE4EZsc4kEw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8OxWdd/4eZ
  kgzPLhSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxF9y4wF+zjqjg69xBzA+Nizi5GLg4hgYeM
  Elf/3GKCcK4wSay7spcdwtnNKLHqeRtrFyMnB5uAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MICDhJnpk9lArFZBFQlZkzYCNbLK+AkcebrdLBeCQEFiSkP3zNDxAUlTs58wgIxR0Li4I
  sXzBA1ihKzLzezQNgVErNmtTFB2GoSV89tYp7AyD8LSfssJO0LGJlWMZoVpxaVpRbpGproJRV
  lpmeU5CZm5uglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjlpZZsYgSGY0qxSvsOxk/L
  /ugdYpTkYFIS5S3fuylZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgQvz/zNyUKCRanpqRVpmTnA2
  IBJS3DwKInwHpoHlOYtLkjMLc5Mh0idYjTmuLtw715mjqtXruxlFmLJy89LlRLnFZkLVCoAUp
  pRmgc3CBazlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ884HuYcnM68Ebt8roFOYgE5JWrM
  R5JSSRISUVAMT279uCTOdz1Nkvy275GquE8l+OYhhs0iec5O63PVaZdmKGNeDRe+szDk15Aza
  LmZMOjfV5tRkVa5rrwxOvQ+2Pr61/+yjFVOsF2vdkhb/u9N5q5VEMbdO6dw9z2MWdcgk/nmrc
  Oxc5upM/4XCSZvvFHrtXt035VzH4rPf7lezGc2vPp6ZuiLfQ6zpSb2TT2XASs0N6zZ/XCr7iJ
  +90szizOEkjbybPRNNkqK3Ne8PUX6yo9GAbcoWVRnBG6qz/geWttYnZj9NCnMzfMP5J8Kthdv
  O+kaelP5++Z5k7SDTWw9zq76em82ZZT3Xv2aVXwy7RKDFMzs51rv3ateVi218l7zFluXWvGWy
  9s1njimxFGckGmoxFxUnAgCfXT9EVAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1672716623!234684!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4542 invoked from network); 3 Jan 2023 03:30:23 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jan 2023 03:30:23 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 09424151
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 03:30:23 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id F0C00150
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 03:30:22 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 3 Jan 2023 03:30:21 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hunspell: upgrade 1.7.1 -> 1.7.2
Date: Thu, 29 Dec 2022 12:46:52 +0800
Message-ID: <1672289215-16118-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 03:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100350

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Crash fixes, code clean-up in ~200 commits
    tdf#136306 don't accept/suggest typos as 3-or-more-word compound words
    Prepare optional spelling mode of LibreOffice to not accept/suggest not dictionary-based words as compound words (#517)
    Merge in weblate translations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../hunspell/{hunspell_1.7.1.bb => hunspell_1.7.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hunspell/{hunspell_1.7.1.bb => hunspell_1.7.2.bb} (90%)

diff --git a/meta-oe/recipes-support/hunspell/hunspell_1.7.1.bb b/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
similarity index 90%
rename from meta-oe/recipes-support/hunspell/hunspell_1.7.1.bb
rename to meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
index 54bbc2f22..910bd4c15 100644
--- a/meta-oe/recipes-support/hunspell/hunspell_1.7.1.bb
+++ b/meta-oe/recipes-support/hunspell/hunspell_1.7.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LESSER;md5=c96ca6c1de8adc025adfada81d06fba5 \
 "
 
-SRCREV = "1180421f50f211984211e968eb6801ffd3390b8f"
+SRCREV = "2969be996acad84b91ab3875b1816636fe61a40e"
 SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


