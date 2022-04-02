Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC205C48BE5
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.2678.1649137134253696616
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=a9K8oNXz;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649137132; i=@fujitsu.com;
	bh=R2JtvqIEM2ZhGNE4284WmQnqudUdD7L01eOv32g/GEQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=a9K8oNXzQea6rTAYcmwlLZ/A5MU1ANHOyvjHfC1ucGADWjAYwSHc74NF/PusFcbTz
	 iTDX/96Ybx48Oqs79oUl9tte29Z0Mkd+RcqhCqnygLGtCp1UeCRwXXOx7A24PVFxSD
	 3mbgCvnAbOhNvaonQLFwpYQOV0mw4jqz+y8FnO31M9tptkCv7cFtjy1AICk1ydWHx9
	 QMCdZQaNedWpa1uoXbybQRCR3hPmdzhC5JBQHc3CfRALTTY8GN+6aOTbHpEhzaM2GC
	 xIoD/DYh8udclxQxrem+6EELeFph1eP/6ZAPR9DVr1dj5SuqnH38zofbeY13Igr2Ph
	 wePqGPrbklz3A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSffNVe8
  kg0fTRC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owtzSuZC2bwV+ybo97A+Iqni5GLQ0jgCaPE
  vMY3zBDOBSaJDSfeAzmcQM5uRomTr8NBbDYBNYnpt26wgtgiAvoSS2fvAathFlCRePG7hx3EF
  hZwljiyYxYLiM0CFN8/fx4jiM0r4CTxqfM8WL2EgILElIcQ8zmB6tvbG9ggdjlJTH68BqpeUO
  LkzCcsEPMlJA6+eAHVqygx+3IzC4RdITFrVhsThK0mcfXcJuYJjIKzkLTPQtK+gJFpFaN1UlF
  mekZJbmJmjq6hgYGuoaGprrGRrqGRmV5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFlbnJOil5e
  askmRmAQpxQr1O1gvLbyp94hRkkOJiVR3jOu3klCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhPn
  gXKCRalpqdWpGXmACMKJi3BwaMkwnvkIlCat7ggMbc4Mx0idYpRUUqc9+YVoIQASCKjNA+uDR
  bFlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8/KATOHJzCuBm/4KaDET0OJ3ZzxBFpckIqS
  kGpgSG2q1ps+sXr2srrsq//qpBIGpLesFRGd87Tgn4PIpaP0d7aPc2w3VVuYvkvxb/MY281V2
  mriIhNu9ipoNV0KaZ2av2VF7cFa3t/cdW8lE0eS3mcYaFi38dVcKNnk6sK3KNQ96bNyQZcS06
  XaaTVkbvw1z7tIP6nEZLx308oS6VFZ8twqWv3/nE3tewFM7+eQrl7d58beGtFhcdNnhy5jEvb
  h2sqxf1MwrWlGVJ4TFy1LTMz+VW5m2KzBlnFFovsu/9N3H/3ste3by5m1gXRMX8j3vcHuytZe
  Rt3THop1+BzjlnoeFq3TZRMRFc/Z6eC91y/vlILJqFQMTf8Ux4fttO3axK3CvbNypvV6JpTgj
  0VCLuag4EQC94cDuXQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1649137132!91822!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7791 invoked from network); 5 Apr 2022 05:38:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:38:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id EFB40100450
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:38:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E2E9C100359
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:38:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:38:33 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 22.03.0 -> 22.04.0
Date: Sat, 2 Apr 2022 20:35:04 +0800
Message-ID: <1648902907-19815-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648902907-19815-1-git-send-email-wangmy@fujitsu.com>
References: <1648902907-19815-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96402

Changelog:
=========
 core:
  * Fix underline sometimes being drawn only partially
  * Fix Adobe Reader not reading some of the contents we write correctly
  * Fix code that workarounds some broken-ish files
  * FoFiTrueType: Parse CFF2 fonts too
  * FoFiTrueType: Support cmap types 2 and 13
  * Fix a few small memory leaks
  * code improvements

 qt:
  * Handle SaveAs named action
  * Annotations: don't change the text color when changing the font

 utils:
  * pdftotext: print creation and modification date when using htmlmeta param

 glib:
  * Fix returning internal data of temporary strings

 cpp:
  * Fix code incompatibility with MSVC

 build system:
  * poppler internal library is no longer forced to static on MSVC
  * Error out if iconv is not available and the cpp frontend is enabled
  * Require FreeType 2.8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poppler/{poppler_22.03.0.bb => poppler_22.04.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_22.03.0.bb => poppler_22.04.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_22.03.0.bb b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_22.03.0.bb
rename to meta-oe/recipes-support/poppler/poppler_22.04.0.bb
index a0d8be6aff..9c9122160c 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.03.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "728c78ba94d75a55f6b6355d4fbdaa6f49934d9616be58e5e679a9cfd0980e1e"
+SRC_URI[sha256sum] = "813fb4b90e7bda63df53205c548602bae728887a60f4048aae4dbd9b1927deff"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.25.1


