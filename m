Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87319C3DA7D
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:48:15 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.153589.1672123689371553089
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:48:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=p2EtX23G;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123687; i=@fujitsu.com;
	bh=QsXoCqk9gaEqIkgwWNCmv8EM2HF5MnQxaojcJpy+/ys=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=p2EtX23GjGfFfmUcFc5N2pqsVwqDcAkrfga7pOF0bTcfdnUq/uEfOUNkhj9nHpJPp
	 y05o4pdEvv4+9F5SxSQYAFpKh6PnOpBnCKvoex6HW5t162xG/gn1OGLsLDKnvd/qzn
	 Z74/WqjZBQZzb4DwCYWAb1lklhOjhDTasGlgs4aiaTdXXrDkp4dE2dXgO/547r7LXm
	 NUnsnDky6PZMpkKz/PPi3Jjxtk2KCZqmUwyn0m/JW6dy8DHqb+/pTbBUcC1fV6FMhC
	 bUWFp47ldusfVKyeVaULRTJlSXI7FrvopKdbxAlcEGWrlFpdJSDkGN+/YzWHOIHOve
	 Av9+O2IkVg/Zw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqKs2dVW
  yQeMjHYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePlXsGCjxwVn+5fZG1gnMDRxcjFISTwhFFi
  +saT7BDOdSaJ9tudUM4eRonXex4wdjFycrAJSEncuP+fDcQWEdCXWDp7DzOIzSygIvHidw87i
  C0s4CjRsvknK4jNIqAqcbD7BFgvr4CTxIPXL5lAbAkBBYkpD9+D9XIKOEssbWgBs4WAalrO7W
  aBqBeUODnzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSMya1QY1U03i6rlNzBMYBWchaZ+FpH0BI9M
  qRrPi1KKy1CJdE72kosz0jJLcxMwcvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK3OScFL28
  1JJNjMDgTSlOstnB+HfpH71DjJIcTEqivFLdq5KF+JLyUyozEosz4otKc1KLDzHKcHAoSfCWT
  gLKCRalpqdWpGXmACMJJi3BwaMkAtHKW1yQmFucmQ6ROsWoKCXO+xWkTwAkkVGaB9cGi95LjL
  JSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR51UHG82TmlcBNfwW0mAlo8YdDK0EWlyQipKQamIL
  Oa2sujnjg0WipuNVNfGNzV0hSqhdDbdNEqX0tC//eVfIKWZZtsejhzE+Cu7L+nr17+61345PA
  jS8L55SGzv7jPfepEH/MA6d/d0RCaq1usm89Jeq1KrGrXUHR+/3a6vVODpoHonVu1sk5eFyy5
  DwnvHn3oa3P/hcXXizbfErP/l28wNMF7dIKejW9U+Om62/TZUw0POcqMeFtuEWtY3XVg3tfC/
  3cwjdKsl9eFF99zbzjhsNRfdff69ccMpkXMKksNVV8n9lc/sdPrJLtqxJ/yl6aEvn+qpG00vm
  /b/J5RRcWPsjqn81zQ0jm6M9ZG9u/tlfcsbrcP+e1pdyPS7u/aPillap+ejPf8uXOnUosxRmJ
  hlrMRcWJACMLjW1ZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-745.messagelabs.com!1672123686!425429!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 321 invoked from network); 27 Dec 2022 06:48:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:48:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2E0D1100192
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:48:06 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 21AC9100182
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:48:06 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:48:04 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ser2net: upgrade 4.3.10 -> 4.3.11
Date: Tue, 27 Dec 2022 14:47:28 +0800
Message-ID: <1672123650-32043-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672123650-32043-1-git-send-email-wangmy@fujitsu.com>
References: <1672123650-32043-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:48:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100276

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ser2net/{ser2net_4.3.10.bb => ser2net_4.3.11.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.3.10.bb => ser2net_4.3.11.bb} (84%)

diff --git a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.10.bb b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.11.bb
similarity index 84%
rename from meta-oe/recipes-connectivity/ser2net/ser2net_4.3.10.bb
rename to meta-oe/recipes-connectivity/ser2net/ser2net_4.3.11.bb
index f52921f22..ca7982c0a 100644
--- a/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.10.bb
+++ b/meta-oe/recipes-connectivity/ser2net/ser2net_4.3.11.bb
@@ -9,7 +9,7 @@ DEPENDS = "gensio libyaml"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ser2net/ser2net/ser2net-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "bfad2b5d98c56f957daf2be975a5a2cefd645f27ef02d54817fadd6e4bf291b3"
+SRC_URI[sha256sum] = "8f831f11b67538280aa0e8787cb0785ff705cf90749aa175d32c337f29412ae3"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ser2net/files/ser2net"
 
-- 
2.25.1


