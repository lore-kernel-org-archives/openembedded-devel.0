Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4938AC4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 07:36:35 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.15705.1668843387294002265
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 23:36:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uM80dSnV;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668843385; i=@fujitsu.com;
	bh=sIQxaaR39LEhhrZCeCndh16YUjINpU33R/ltCf/hx0g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uM80dSnVUX7600Jk3UFskLeQ8F8moXHk1CZE9rUZmeDrL8G0Y4K4ea/fFSh5UuOaF
	 KpOTcPiDNxi5ftQxcr00PI1aKvHNRT0aj/N+2MckjRFpMhcKoutfqMkQ3esqPs33AC
	 gERU8YrfD2V7WkfddC9e8awGdu5ewAs8PbFfcJ+NwE2UUxL/SsA5h59qwJbi6juvyc
	 fHzLqPK+CMfIjjz68c6EEyKaKbpYUWdhl/1MsDKARolrXN6cGFZIVbs5FVYmBygkt7
	 aVn4yf8BmDiyx8/hINNkNcVuR6xbtXh7waC4nULsezsJ715JIo/4NhKubCJjaiXfHU
	 2XZpf4fSKppAg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8MxSbeivSL
  Z4PIZYYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPFinusBdc4Kz43rmNsYHzD0cXIxSEk8IRR
  YvHNfewQznUmiUlTzrJCOHsYJTrXvALKcHKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPW
  I2wgKPEvAXLWEFsFgFVidatt8BqeIHip1rWM4HYEgIKElMevoeKC0qcnPmEBWKOhMTBFy+YIW
  oUJWZfbmaBsCskZs1qg+pVk7h6bhPzBEb+WUjaZyFpX8DItIrRrDi1qCy1SNdQL6koMz2jJDc
  xM0cvsUo3US+1VDcvv6gkAyiVWF6sl1pcrFdcmZuck6KXl1qyiREYjinFyew7GN8s+aN3iFGS
  g0lJlHdve3myEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneuLaKZCHBotT01Iq0zBxgbMCkJTh4l
  ER4RXyA0rzFBYm5xZnpEKlTjLocM7+2HWAWYsnLz0uVEudNApkhAFKUUZoHNwIWp5cYZaWEeR
  kZGBiEeApSi3IzS1DlXzGKczAqCfNOB5nCk5lXArfpFdARTEBH5DiXgRxRkoiQkmpgEmk0eh4
  y6W2kvP0CFZdX72W3Xgkt003g/CFzSqN4wnWP5ymiB3wuvVGRXfkgZkNAP7fhvgOLWF5Ep5Zu
  /araUL32a1aQmONWLearbcer9ZdYblocsOPHGlbZI2bRsvdjl+2OFOH4WHF072L7nN0dksHh6
  RNcGN6FZZukXxPo4fyZcPynRMuahf0RRjPTz63df3F66mlnM8ZdyTM83xZ1eZ/+b8VRzmJqKP
  k1IKftyvbnt7f9evlo9cMEo6xeo2vzp0aVHecMn/7V9F6Omm7Oaik37Zfxpy1UxW58O6wZ9eD
  uytydJZ/Vuf9lFndtMOD7zL7ZSCz8RJePI5PI5HdZrEKMSue3v498Wth4O+aeEktxRqKhFnNR
  cSIAPiNo4E4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1668843383!126390!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13488 invoked from network); 19 Nov 2022 07:36:24 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Nov 2022 07:36:24 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C4CA61039DB
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:36:23 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B87A61039DA
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:36:23 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 19 Nov 2022 07:36:22 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] babl: upgrade 0.1.96 -> 0.1.98
Date: Sat, 19 Nov 2022 15:35:57 +0800
Message-ID: <1668843361-2892-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99622

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
More robust bounds protection in ICC handling, avoid garbage collecting lookup
tables in-line with processing.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gimp/babl/{babl_0.1.96.bb => babl_0.1.98.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.96.bb => babl_0.1.98.bb} (87%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.96.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.98.bb
similarity index 87%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.96.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.98.bb
index 85cc7793c..a9e192b75 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.96.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.98.bb
@@ -15,6 +15,6 @@ CFLAGS:append:toolchain-clang:mipsarch = " -ffp-exception-behavior=ignore "
 CFLAGS:append:toolchain-clang:riscv64 = " -ffp-exception-behavior=ignore "
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] = "33673fe459a983f411245a49f81fd7f1966af1ea8eca9b095a940c542b8545f6"
+SRC_URI[sha256sum] = "f3b222f84e462735de63fa9c3651942f2b78fd314c73a22e05ff7c73afd23af1"
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


