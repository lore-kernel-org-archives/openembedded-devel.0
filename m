Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52274C61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 13:33:45 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.8969.1676122422198452195
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 05:33:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vDFySH1u;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676122420; i=@fujitsu.com;
	bh=eF3JrG1FkfBfKM45ax35tCPTJjwxQ53SDYDDsC6I8Ec=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vDFySH1u3VVf/3K6u7pRffuTIAihHt9kiHieVCMd0VeZZ/7MBlzt3ASfs5rXd1ttm
	 A/rZtgkteSVJnm573DCnqICtQfZM7eP6ulYgK2M9+k/e3ftr/bT3M64JXp4O7pwoyF
	 ODvEposoNlynCdnI+uA3XYOYvV1IJbruzICZp8IZkILeerO3Se2p5SpBqVvEP3/XdC
	 tS/q0msAlB4SX8r2ipp4f/90igAKscfqzckDJ+6ECMjoI+KwbMZnWwI/XnGIJmS7nj
	 9IHMc8XCzT85qVu3X0DBEbLZXMyYxlyy46x9f2sKtj3CJ5GwVrEpIjJnn/yjLVfg9x
	 u7PH8rm3ddFFw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8MxSdd45vN
  kg4nbRCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ox376cyFuzjrni25RZzA+NKri5GLg4hgSeM
  Emu+PmWGcG4wSWztecgK4exllNh0dB9jFyMnB5uAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+9
  7B3MXJwCAt4Sxw/wA9isgioSuxaIA9SwSvgKPHty2GwKRICChJTHr5nhogLSpyc+YQFYoqExM
  EXL5ghahQlZl9uZoGwKyVaP/yCstUkrp7bxDyBkX8WkvZZSNoXMDKtYjQtTi0qSy3SNdNLKsp
  MzyjJTczM0Uus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAzElGKGGzsY5/T9
  1TvEKMnBpCTKu2zz02QhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErzLJj5PFhIsSk1PrUjLzAFGB
  UxagoNHSYS3ezpQmre4IDG3ODMdInWKUVFKnPciSJ8ASCKjNA+uDRaJlxhlpYR5GRkYGIR4Cl
  KLcjNLUOVfMYpzMCoJ806dAjSFJzOvBG76K6DFTECLGaSegiwuSURISTUwVZ/8urp1yr3+go/
  LJVYYevNMCBbQ6fnI+O/0bfdtRtbBSzjnZaw1Z6uIPHjrW1mW8oKUH0G3f0TxLX/sWdT8ZMX5
  Ey6FLS8dXupsjhVb6Z3CYvvf+a6ptMMhj453AZqTz3+93zG3yauP6+zZ+APH1CNleHNk5kWG5
  OewR7/O/TVHwPXdvJS0PSLKotnrGG5fi9LYeMjM4R1jisn8EH/VYK8KYafZrGELv3avmvs4Jz
  iPJaOxXsft8o7bGlfvCZUIVru+szo2o+WGuMm1J0HrouIivh2wzDnfL+1/6f4Vph83TZdWHW3
  +w3JD8Zfa8sqihxnzmU7+1s1b0FpwyrNUJHLjxxWPHt+ZJ23Cey5YiaU4I9FQi7moOBEAuW22
  iT8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1676122419!447711!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11504 invoked from network); 11 Feb 2023 13:33:39 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Feb 2023 13:33:39 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id EF1C11000DC
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:33:38 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E33171000D2
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:33:38 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 11 Feb 2023 13:33:37 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-portion: Upgrade 2.3.0 -> 2.3.1
Date: Sat, 11 Feb 2023 21:33:21 +0800
Message-ID: <1676122405-5945-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101022

From: Wang Mingyu <wangmy@fujitsu.com>

Changed
=======
 Speed up lookups in IntervalDict for non-interval keys.
 Speed up iterate by no longer creating singleton instances under the hood.
 Drop official support for Python 3.6.

Fixed
=====
 Infinite recursion when a subclass of an Interval is compared using > with an Interval instance (see #75).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-portion_2.3.0.bb => python3-portion_2.3.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-portion_2.3.0.bb => python3-portion_2.3.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.3.0.bb b/meta-python/recipes-devtools/python/python3-portion_2.3.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-portion_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-portion_2.3.1.bb
index 1638d64c3..d998db01d 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.3.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "0e9d42838099263201b25517e4c1bd57042b5fe44432d6df38cef72d84d1eb1f"
+SRC_URI[sha256sum] = "247471718131d41fb82137ab7b6466cdf4b785d047e38d309ebf34c84101a3a6"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-sortedcontainers \
-- 
2.34.1


