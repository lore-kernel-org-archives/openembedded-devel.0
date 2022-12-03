Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00FAC352A1
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:18:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.101920.1670066326940415218
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:18:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jpn3naPE;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066325; i=@fujitsu.com;
	bh=UVyLQZUyYVByIWxYCeTdnfmympPdSAxnUv5/EmL25WY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jpn3naPENnXlclHowUf1O2QBlER7Eks/WcqoGmjHI/c7h76z/mK2SmtSsPpiO/Ln3
	 plOIZDwMyTosxrWqvK/mzjH2IH8R8Z4RUuuRYOBe5qNnd1Lnp0iMaew6jTSP/hBanb
	 hnERpTMlLq7a1i9C0Bdv1dXedgu8rBZ4VAqS+rHKZIbvy3z76pNRw1dzgYWDz9zkXv
	 8HX9O1hCSFPg+XtsOtJUWB6a/v/aM/koGwEpNU1lf2hBTFA17TAiy9K6sAiGisuJTm
	 KWufPLKlUsCy+NYEz/z+FgryPL7cfhhP9VZ1/SJ6hgww7luJyygFZ6Y2WLQtbXTqo+
	 obtgRQx4C9G1A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8OxWXeyQXe
  ywb4ec4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPFo39sBa3cFY9nXWVsYOzg6mLk4hASeMgo
  cen0GnYI5wqTxJVVkxghnN2MEptOTgVyODnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48buHH
  cQWFvCU2DthNyuIzQIUXzNvEQuIzSvgJLF0wxYwW0JAQWLKw/dgvZwCzhJf2prBbCGgmvv3bj
  ND1AtKnJz5hAVivoTEwRcvmCF6FSVmX26GmlMhMWtWGxOErSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo1lxalFZapGusV5SUWZ6RkluYmaOXmKVbqJeaqluXn5RSYauoV5iebFeanGxXnFlbnJOil5e
  askmRmD4phSnr9/B+G7pH71DjJIcTEqivMfCupKF+JLyUyozEosz4otKc1KLDzHKcHAoSfAG6
  ncnCwkWpaanVqRl5gBjCSYtwcGjJMLbpQqU5i0uSMwtzkyHSJ1i1OWY+bXtALMQS15+XqqUOK
  8SyAwBkKKM0jy4EbC4vsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmFdMD2gKT2ZeCdymV0B
  HMAEdsZG/C+SIkkSElFQDU/MLtj/yS3+0npjNs1SHadNDVtcbTr3pbxWqTfUSv3TUiFdO+2kz
  7emzo/sNxdKdFwRfrfh8dsXvMzdaUg56tOo4lujPOSIU4vVaJLw4UdlcKn9uq7dbbsHl/+qTZ
  R/k+O3qV26J23eefYeU5rLwt3cvtPGfWfM7bHGCSvDdtxr2k1v4dUq/vC3q1Qo7sG2exd2jbJ
  vLbOzdGkNX9M+6K8XhKis4vfKF3Tlul5dz83d7xHkuPf1zm+TuxiXP1c8r/Tm599svlycT1vz
  clhOl0mVjcikhcjJD1KX6Jinb9uvLF8/6wcE7N0Myf8uz6flvFtxUPszO55XMfEKRO6AmJvra
  XIvteyanLpuaxBMvpsRSnJFoqMVcVJwIAARVoYpmAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-732.messagelabs.com!1670066323!41301!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7843 invoked from network); 3 Dec 2022 11:18:43 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-20.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:18:43 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 65EEE153
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:18:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5993F150
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:18:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:18:41 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cbor2: upgrade 5.4.3 -> 5.4.5
Date: Sat, 3 Dec 2022 19:18:12 +0800
Message-ID: <1670066295-24879-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670066295-24879-1-git-send-email-wangmy@fujitsu.com>
References: <1670066295-24879-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:18:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99932

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Added official Python 3.11 support
 Raise proper exception on invalid bignums
 Make Tagged item usable as a map key
 Eliminate potential memory leak in tag handling
 Documentation tweaks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cbor2_5.4.3.bb => python3-cbor2_5.4.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.4.3.bb => python3-cbor2_5.4.5.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.4.3.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.4.5.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.4.3.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.4.5.bb
index bbb57a4a9..43f5299d2 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.4.5.bb
@@ -4,7 +4,7 @@ DEPENDS +="${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "62b863c5ee6ced4032afe948f3c1484f375550995d3b8498145237fe28e546c2"
+SRC_URI[sha256sum] = "2256fdcc11613b0297a4b844e268d20db4f7d4be79d2002f51613bd8105366ef"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.25.1


