Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA761C43217
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:11:56 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web12.1868.1666055513333142553
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=x7w4k2aS;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055510; i=@fujitsu.com;
	bh=YuN/FoI0KoQX4NPumKTmbqUjc+lC5oDGczjOTqBNRTw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=x7w4k2aSUnJlt26rKl6fAPHLXTmij/OVglOiu4DYrWSKodgxOzLbO7gjTxlXg3hTR
	 38ILBT6jYE+hdilGLLx7aGDMM3LwUzZQ+Sgh0cJVbjU4lwDyzLR5ky90JPQI8t8/Aj
	 8r8W32jy/QdAO+otyTateQulWMZlMzAb5/30KLc/f8+DPDFwKVQlPbjBSNM6+boaaB
	 huIu423QwCPVL2oNwVZRbEDRoY5xnXjrBG8LjRJC0Fg9SlG82lhs+mb+ygJKiJ/P36
	 ZABne577jUn0kkdij+3GThsxh+hvsDzvyX1U6o2oQqtTgd5omUjZjIFDl8X51cCHfy
	 C8wQzT+aM5+cA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8ORqBv61zf
  ZoGmPpsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvHmTANbQRtnxYypd1kaGNdzdDFycQgJPGGU
  aO68xwzhXGeSeP/7NxOEs4dRYs3bV0AZTg42ATWJ6bdusILYIgL6Ektn7wGLMwuoSLz43cMOY
  gsL+EjcfvqACcRmEVCV+LV3HyOIzSvgKLGxqxusXkJAQWLKw/dgNqeAk0T/ggawGiGgmrev/z
  NB1AtKnJz5hAVivoTEwRcvoHoVJWZfbmaBsCskZs1qY4Kw1SSuntvEPIFRcBaS9llI2hcwMq1
  iNCtOLSpLLdI1NNZLKspMzyjJTczM0Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctL
  LdnECAzflGKGrTsYO5b/0TvEKMnBpCTK2zHDN1mILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK/WH
  6CcYFFqempFWmYOMJZg0hIcPEoivFFngNK8xQWJucWZ6RCpU4yWHFNn/9vPzLEcTM782naAWY
  glLz8vVUqcNw1kngBIQ0ZpHtw4WLxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMywEyhSc
  zrwRu6yugg5iADsrY7wVyUEkiQkqqgcnEjfeXmuaXupOfbgnMulfSc9nwKZ9I9kl+1wUx5SU7
  n0w2kPxz8JlIRci5fWW3F7zwW7f5QBO/ef2T5d/fS7UeXOfddL868vFas76O+3oG3mWfl152m
  7714dWLk/edNbiQn/vQ83DbBv2j39ski05w1/TP+C+y586ulqn5SxYV8Z1/2aEosey7qPz8/t
  3Hs7g4WPYGGsl1SUZEv+LKnRDxc/GGZPM7IgyCrcK7NlnuqrgluF3ML2Jau4vtj8W3Zfm9y9+
  9Mvg/r5Pj94sf0vvcQtrF2K5Ml+0+w9GpUau6K9bnj94MFw35/sRdopv6488ce5n7MVdU9M3F
  cI7bK5qLMndEBVossMq+FbHxqZgSS3FGoqEWc1FxIgCeigOCcgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-585.messagelabs.com!1666055509!280764!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18244 invoked from network); 18 Oct 2022 01:11:49 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:11:49 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4FEF1100191
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:11:49 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 43F8810018D
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:11:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:11:47 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymodbus: upgrade 2.5.3 -> 3.0.0
Date: Tue, 18 Oct 2022 09:11:22 +0800
Message-ID: <1666055483-8143-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666055483-8143-1-git-send-email-wangmy@fujitsu.com>
References: <1666055483-8143-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99224

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_2.5.3.bb => python3-pymodbus_3.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_2.5.3.bb => python3-pymodbus_3.0.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_2.5.3.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.0.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymodbus_2.5.3.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.0.0.bb
index 46565876fe..8292419473 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_2.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c2223d66c7e674b40527b5a4c35bd76"
 DEPENDS += "python3-six-native"
 
-SRC_URI[sha256sum] = "5ef68c1a109bdb467c830ef003ef2db6494349a5248e4af946fe21c9eefe7e74"
+SRC_URI[sha256sum] = "37c9b6f3e5c82f39ee42047ca48cbc9fd0c49a6731126789500191e9deea6cbc"
 S = "${WORKDIR}/pymodbus-${PV}"
 
 inherit pypi setuptools3
-- 
2.25.1


