Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D21C7EE26
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:04:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.103521.1683540270760360969
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WMH0sC4k;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540268; i=@fujitsu.com;
	bh=A+jHidKLG730FaMmDIS/MyuoewJ5u/3Mk+fTK6WJ0eA=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=WMH0sC4kFxy/PvuqWfn4HXM0MvdEnvX3Z4jLutEODyjBxzQTJgPIzF3AJI6Jl1oTd
	 dk9REghEHjgN7Kp5YIJj/k6IqRae9VLH8fOdHEp1VOnfBKaJnQCCkOHtUWIKvZbbFu
	 FHKftFwV51oO3+oz12zQ13lb19pU78LmG2NEO6PLYk/Avm3sZiQrUTy2prld8MEsRy
	 IkTv8zhixwW1uq2ZRqhM1RnV5zmYUy8HPn7Ih4M8JJV0sOMjSSaIT1dJQZZiwXkhlv
	 OWuHRDIPLvffwqP+XnF+0NBH/h4mYOnYH6ITNk3yZP4X+DF2UX4qRziX8TpsYrVIU3
	 YnhiKHDGTacsw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKLMWRWlGSWpSXmKPExsViZ8ORpKtzMiL
  FoPuXlMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnH2zxTmguUcFRfPfWVqYDzD3sXIxSEksJFR
  YuGXTSwQzjQmiaP32oAynBxsAhIS0/eeBLNFBHQlPn6YywhiMwuoSMyYfIQJxBYWsJP4NHc7a
  xcjBweLgKrEppcFIGFeASeJ+XdOgpVICChITHn4nhnCVpO4em4T8wRGrgWMDKsYzYpTi8pSi3
  QNjfWSijLTM0pyEzNz9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJSSzYxAn2cUqy
  +dwfj/l1/9Q4xSnIwKYnymh4MSxHiS8pPqcxILM6ILyrNSS0+xCjDwaEkwdu2LSJFSLAoNT21
  Ii0zBxhuMGkJDh4lEV7ZI0Bp3uKCxNzizHSI1ClGXY6rV67sZRZiycvPS5US5xU5AVQkAFKUU
  ZoHNwIW+pcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfPagUzhycwrgdv0CugIJqAj/C+Hgx
  xRkoiQkmpgSuLK+8hjsqJ98YmOXaEV03tlPgk93XTRSDqLMdT0qvvM32sqzzqaer/fx7Igp+S
  U8mmzPWUGctNUd/95uC04bu+p32t6eKzTroTUFJfYxUZN1940+Y54u+lkUe7FQU5PWuc+3fTi
  +8LTP7618lpkTEgoyaoucVZZdO7kUtWUvNKH/xbOWOpy6PeDwKSDy5d7enyudQ860+/r8tV3l
  V+h0FN+v7TjszZNeimy6GbE09WKn+zubFValR+vtGHW2p/LHS3cvu2TuFwqmLvhfaLvrKj9nw
  P/dgXa/erfvb50lb931QOPl31S3eHrcv+pS3K7W6wSme+3UORt9CnfX+fc/yR6H1rouu3tOcY
  N2jZFLUosxRmJhlrMRcWJAJjYLo/4AgAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-565.messagelabs.com!1683540268!181045!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9912 invoked from network); 8 May 2023 10:04:28 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:04:28 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2D9BC1D2;
	Mon,  8 May 2023 11:04:28 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 526CD1C2;
	Mon,  8 May 2023 11:04:27 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hwdata: upgrade 0.369 -> 0.370
Date: Mon,  8 May 2023 18:04:15 +0800
Message-Id: <1683540259-25209-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102390

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.369.bb => hwdata_0.370.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/hwdata/{hwdata_0.369.bb => hwdata_0.370.bb} (91%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.369.bb b/meta-oe/recipes-support/hwdata/hwdata_0.370.bb
similarity index 91%
rename from meta-oe/recipes-support/hwdata/hwdata_0.369.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.370.bb
index c20e2430bc..56d4253772 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.369.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.370.bb
@@ -5,7 +5,7 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "ced93f9d1c15e45e35378e82b8da96027e58174a"
+SRCREV = "21cb47beb1716545b25dfe8ae1b9e079c73b85d9"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


