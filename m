Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F594C76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:02:44 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.66215.1680516161808686965
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nUnFhbjq;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516160; i=@fujitsu.com;
	bh=dTfZIuTLLyC/DGdeXtKhQMppyHhRkys5wcs7EOWTOvk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nUnFhbjq8it3RlgRpy0zQqWlxLP0hJPHJX45cOvf/VATIE76my4nRS1ExUh4Oy0+p
	 YK6Je//1xFWOJpT7ZDg5Qx0RuZmWaUpUSji7BEqKONRajdTdjg5vq65JXLLAWLaCJk
	 2OgschgrUadeBIqRrMjK7V1XjxR7gPl/0YaBthBN7K/SjRbq4sOVv/AESgC0IE7UgW
	 /xnsn+VPSSTRKW6SJYz+OPbiYHllzGTPxr3DycTcW1NJbb75A9lZwo2XwF9LC7uQoJ
	 HBaNidLKu7rL/stm0QX+83gTn6JHY0pujwSHr0N/DCWI/flfFfJIwei+Vw8Tw+Jtu4
	 RYamg4NST8Gqg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpGu/RCv
  FYP88C4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPW+e3sBYt4Kg48OsHewNjH3cXIxSEk8JBR
  4tWOg2wQzmUmib+3p7JDOLsZJe4+usfYxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAn8T860fA4ixA8fbVS4FsDg5eASeJBxv5QcISAgoSUx6+ByvhFHCW+HdtH1iJEFDJyw
  +CIGFeAUGJkzOfsEBMl5A4+OIFM0SrosTsy80sEHaFROP0Q0wQtprE1XObmCcwCs5C0j4LSfs
  CRqZVjGbFqUVlqUW6hiZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIGhm1Ks8mIH47O+v3qHGCU5mJREeQXrtVKE+JLyUyozEosz4otKc1KLDzHKcHAoS
  fDOWwSUEyxKTU+tSMvMAcYRTFqCg0dJhFdxAVCat7ggMbc4Mx0idYpRUUqc9zRInwBIIqM0D6
  4NFruXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzii0GmsKTmVcCN/0V0GImoMWtURogi0s
  SEVJSDUx2dfkLT62N5v7UWxcWWWtW7vrM46l+6RwDPYtyuTDRlrnaL7bv41hq/tpm+mzGh0vu
  qwT8ZM29Mv22+umzO+acN2/fffBVVoN+isuyI5cUH986/PzR4xMyV25GKKfkfte/1HTphxUr+
  z+h6sN2x26YaIStNtzN6rO+TH/zp3Xmldp9Wr48h2SeW8xuCRcP//O+z3iFo8sZ2c1P/Tyuri
  ydW/7y4ryIlNBlVg/k2ER+L/8ive0P66ov+ZWT9iqnzqjYJWMs/G+uVWen2r9pT+KMpdcZek5
  ty6v68VEs3it1qpr0do0Jr41svhzIOMJ6Pt1l5tT65h/K7NOuzVYrCHE6etm1+EiS1Dz3bdpH
  VPYqsRRnJBpqMRcVJwIAQoW/b1gDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-571.messagelabs.com!1680516159!356135!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31851 invoked from network); 3 Apr 2023 10:02:39 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:02:39 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 8EAC61B0
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:02:39 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 83AD77B
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:02:39 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:02:38 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-dateparser: upgrade 1.1.7 -> 1.1.8
Date: Mon, 3 Apr 2023 18:01:48 +0800
Message-ID: <1680516108-30896-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516108-30896-1-git-send-email-wangmy@fujitsu.com>
References: <1680516108-30896-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101913

From: Wang Mingyu <wangmy@fujitsu.com>

Improvements:
==============
 Improved date parsing for Chinese (#1148)
 Improved date parsing for Czech (#1151)
 Reorder language by popularity (#1152)
 Fix leak of memory in cache (#1140)
 Add support for "\d units later" (#1154)
 Move modification in CLDR data to yaml (#1153)
 Add support to use timezone via settings to get PREFER_DATES_FROM result (#1155)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dateparser_1.1.7.bb => python3-dateparser_1.1.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dateparser_1.1.7.bb => python3-dateparser_1.1.8.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.1.7.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-dateparser_1.1.7.bb
rename to meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb
index 4d592308a..67b82940b 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.1.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scrapinghub/dateparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
 
-SRC_URI[sha256sum] = "ff047d9cffad4d3113ead8ec0faf8a7fc43bab7d853ac8715e071312b53c465a"
+SRC_URI[sha256sum] = "86b8b7517efcc558f085a142cdb7620f0921543fcabdb538c8a4c4001d8178e3"
 
 PYPI_PACKAGE = "dateparser"
 
-- 
2.34.1


