Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EDEC678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 13:21:11 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.6596.1678281666032285174
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Mar 2023 05:21:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qLpTSLj0;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678281664; i=@fujitsu.com;
	bh=edgCguhXnJBdheLMtZk17HjfvTeK5bMLiYI68O0Oz+k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qLpTSLj0Kj0buDr3TLj5iqF5yQJv0qDnJBttqGzQVz5zhJKwaJi64ccQ2jOg7xx7J
	 Z3Q/xGKyfCH4XiY//aUuALIUKwnZs0478y5xpM6Kk1E7DHbTKufrxaWjKFgRVYDVnO
	 k92BCQTtPehD6dsLigqfJNUqUh22OVvU1N27LC3SkyxA58NWomIz8LtDAS5iRHjj34
	 esqpizPlmOJxh526vEpjk1n0YnZAKSVN6fio1OApGYp92Lva7lpab0DERXAiQtkDoD
	 0vRA4bnyRySluJdPIYtok8RcjDPXXlDviH8iKMnYap79pdZkW/sWWcg5WgtuiSiXHU
	 Q/w8C6pyNtf/g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSXd/N0e
  KwfqT2hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a3t8eYC36yV5y7PZG9gXERexcjF4eQwBNG
  ib2/e6CcG0wS81rPM0E4exglFu/5ApTh5GATkJK4cf8/G4gtIqAvsXT2HmYQm1lAReIFWDcnh
  7CAlcTEKx9ZQWwWkPjuqSwgNq+Ak8TFJ9PBaiQEFCSmPHwP1ssp4Cxxcf1aoGUcQMucJI41eE
  GUC0qcnPmEBWK8hMTBFy+YIVoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUjaFzAyrWI
  0LU4tKkst0jXUSyrKTM8oyU3MzNFLrNJN1Est1S1PLS4ByiSWF+ulFhfrFVfmJuek6OWllmxi
  BIZuSjEL8w7Gwz1/9Q4xSnIwKYnyssZwpAjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4P3UBZQTL
  EpNT61Iy8wBxhFMWoKDR0mE9249UJq3uCAxtzgzHSJ1ilFRSpx3A0ifAEgiozQPrg0Wu5cYZa
  WEeRkZGBiEeApSi3IzS1DlXzGKczAqCfNuB5nCk5lXAjf9FdBiJqDFF/azgCwuSURISTUwlT7
  RNwmY9LZizVLGnRsnfH2XvfbxCW6uiVu/vd5i/sFVtufZEp5Pfc/Ml784NiH0sCNbTaZDisHC
  KQw/ZT80sH2dcfi1UBSzj6sNk6F6X89e43u7+RRi/XvFZFdPn+Pp+Cjw4A0bWcfS0KVJX7rvu
  l/db8LQVbCzR9rr2LtvyvWrGudc/JB4rCJry848tTPqu/92nn+W+WgRy92mh635H41Uk9+cYv
  8l7DbBY1mp+dfUHgl+5suz2xauDwg/6aHALd1V8t+Ek2Oj0eHpkpvlrymaB75cGSb5eZaenpy
  ise+hPIfgLBeFopqXno63ClfNfsQx0fajzD9tsbtB6qZmc/qOM7FJdK8tOx90bv8VJZbijERD
  Leai4kQALz7CWFgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-591.messagelabs.com!1678281663!459288!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14388 invoked from network); 8 Mar 2023 13:21:03 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Mar 2023 13:21:03 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 567971000DB
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:21:03 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4AE761000D2
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Mar 2023 13:21:03 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Mar 2023 13:21:01 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] lcms: upgrade 2.14 -> 2.15
Date: Wed, 8 Mar 2023 21:20:42 +0800
Message-ID: <1678281642-25317-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678281642-25317-1-git-send-email-wangmy@fujitsu.com>
References: <1678281642-25317-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Mar 2023 13:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101415

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/lcms/{lcms_2.14.bb => lcms_2.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/lcms/{lcms_2.14.bb => lcms_2.15.bb} (79%)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.14.bb b/meta-oe/recipes-support/lcms/lcms_2.15.bb
similarity index 79%
rename from meta-oe/recipes-support/lcms/lcms_2.14.bb
rename to meta-oe/recipes-support/lcms/lcms_2.15.bb
index eb671449f..3656e1cfd 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.14.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.15.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ac638b4bc6b67582a11379cfbaeb93dd"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz"
-SRC_URI[sha256sum] = "28474ea6f6591c4d4cee972123587001a4e6e353412a41b3e9e82219818d5740"
+SRC_URI[sha256sum] = "b20cbcbd0f503433be2a4e81462106fa61050a35074dc24a4e356792d971ab39"
 
 DEPENDS = "tiff"
 
-- 
2.34.1


