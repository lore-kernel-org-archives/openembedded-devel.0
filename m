Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A15ECAAD3
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 02:39:19 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.5584.1663209550746610450
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 19:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cUFbkSLc;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663209548; i=@fujitsu.com;
	bh=zQbIRhRhodP+qbvaRf9lET4gnf7AiS65B0pTJQvmTvY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cUFbkSLczhvnA7uwG5q1MNWh2L0QDokNFeOK+yVlqs8nJcggkVfupNbEFPHNRlr/v
	 vIAJPRFoBCf3shE5Eef00jul8yDuasHtO8ZtgPdN1TXz/VYGec3qc4Yf0uOb7iaf5f
	 dUF7t/LyRQ2b7ke2yBgqIeSMSNAoKNaQF9yOS9459uvwI6QaU2vSQjd8R1ADNapu9T
	 U/qhPMSilLKEenEmZO5Cuw5ANO7MFIEeEN8IFEfRED5Y5+fS7Ypv9Kra4ch4P62/93
	 u1ho7OPmQBImwj9vXjfDPhp/TpLupHpCZ1gXyqROEyW4sqY6ugMf1Qx996LSecE8Rr
	 7LyFg7pwPqpDw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MxSdd7glK
  ywfYVUhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bx0/NZC+azV3Su/cXawLiTrYuRi0NI4Amj
  xNbLy1kgnOtMEls6W4AynEDOXkaJ21/rQGw2AQ2J3VMvM4PYIgL6Ektn7wGzmQXUJI6+/AlmC
  wsYSzQtb2YFsVkEVCXuLNgJNodXwEViyYXzjCC2hICCxJSH75kh4oISJ2c+YYGYIyFx8MULZo
  gaJYm3l/ZA1VdINE4/xARhq0lcPbeJeQIj/ywk7bOQtC9gZFrFaJNUlJmeUZKbmJmja2hgoGt
  oaKpraaZrZGigl1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZm5yTopeXWrKJERiYKcUJl3Yw
  rtv3S+8QoyQHk5IoL5OcUrIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6qPqCcYFFqempFWmYOM
  Epg0hIcPEoivLUgad7igsTc4sx0iNQpRkUpcd4PIAkBkERGaR5cGywyLzHKSgnzMjIwMAjxFK
  QW5WaWoMq/YhTnYFQS5jXsB5rCk5lXAjf9FdBiJqDFRtbyIItLEhFSUg1MqjbxHZfF++v81H3
  jJWSfMkiVlN9/fEkpYLPmwqCM3CM3zJ3UbnKJe1aWbp559Y1U2lsXjSsegRz3dm282rf8o4dW
  Exdnsh77dd03Guv2xbAscvL/Ke1Vbc4zcQLLYZX/8fmLmP44l7feuR02NZDz30PZDPNPt99/E
  Y8M9l7vU/nHIZT1UGVuav+Bg4J7M9dPPt2w7nP00pM/dgvfelm/rnBzQWq32Z5YleXLm3qWzZ
  FTvnU8+vSLPLYk852106aueNZ91eTTxseSe/bHy0ee+OS9/HV0sEtjxE4Be4eQnoksLE9aXk7
  1bxU9uPOrfNIh+/7pn6vY7GrFo289PeuW6rppxoWEG4UdR06uk+lXYinOSDTUYi4qTgQA62QU
  h0cDAAA=
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-3.tower-728.messagelabs.com!1663209547!71452!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16368 invoked from network); 15 Sep 2022 02:39:07 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Sep 2022 02:39:07 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D05271000CC
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 03:39:06 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C2BA0100078
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 03:39:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 15 Sep 2022 03:39:04 +0100
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [PATCH] fltk: Fix buildpaths warning.
Date: Thu, 15 Sep 2022 10:38:54 +0800
Message-ID: <1663209534-3275-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Sep 2022 02:39:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98810

Remove the build path from files.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-oe/recipes-support/fltk/fltk.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fltk/fltk.bb b/meta-oe/recipes-support/fltk/fltk.bb
index 3c9ee5ee3f..82007c4cf4 100644
--- a/meta-oe/recipes-support/fltk/fltk.bb
+++ b/meta-oe/recipes-support/fltk/fltk.bb
@@ -25,7 +25,9 @@ PACKAGECONFIG[xfixes] = "-DOPTION_USE_XFIXES=ON,-DOPTION_USE_XFIXES=OFF,libxfixe
 PACKAGECONFIG[xcursor] = "-DOPTION_USE_XCURSOR=ON,-DOPTION_USE_XCURSOR=OFF,libxcursor"
 
 do_install:append() {
-    sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${bindir}/fltk-config
+    sed -i -e 's,${TMPDIR},,g' ${D}${bindir}/fltk-config
+    sed -i -e 's,${TMPDIR},,g' ${D}${datadir}/fltk/UseFLTK.cmake
+    sed -i -e 's,${TMPDIR},,g' ${D}${datadir}/fltk/FLTK-Targets.cmake
 }
 
 python populate_packages:prepend () {
-- 
2.25.1


