Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559E2C46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 05:39:43 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.97329.1673329173222921480
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 21:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kXJG9eQK;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673329171; i=@fujitsu.com;
	bh=y8+p2cCDnWpgsh4MH1lJakjs15D1hGQc7x/0dILWq5M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kXJG9eQKNEeq6w5FnGkb1QXrkPZAJqEkCCiQr/odgbs+hWHZrd0xhM5oSHv1j5CXm
	 hwDkTbCVZKp589PHMzN4gwUcYFO6FEn0THgqgjLIItJP+8vM67RZ44FDFIOmtr6oJ9
	 EgZIBPCwG64CidgsNIWjKSY1ID636xSUp6kdMzxh4WklgCgsNEXoHiWs8OvNDhG2Tz
	 HHrTNqD3c0Q+qTgyUDSCK3jCRWJH1+u3k0XPxxy2xhd4D59nAbBjvMAZXuvnip957l
	 fsMPu+Lbp4cSSP88J5Op7n6BuWrfWYajuQyX5IANvQsZHFeO5RdcrRNW5NkXEJw8Wr
	 2zr6ySHFF0lLA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8MxSVfo155
  kg7uvpSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxpPb0sBdc4Ki4c/8rcwPiXvYuRi0NI4Amj
  RMu9ycwQzg0miWldh4AcTiBnL6NE854qEJtNQErixv3/bCC2iIC+xNLZe8BqmAVUJF787mEHs
  YUF/CVObVnBBGKzCKhKfHp1iQXE5hVwlHhx+AeYLSGgIDHl4XtmiLigxMmZT1gg5khIHHzxgh
  miRlFi9uVmqPpKidYPv6BsNYmr5zYxT2Dkn4WkfRaS9gWMTKsYzYpTi8pSi3SN9ZKKMtMzSnI
  TM3P0Eqt0E/VSS3Xz8otKMnQN9RLLi/VSi4v1iitzk3NS9PJSSzYxAoMxpTh9/Q7Gd0v/6B1i
  lORgUhLlLfq0J1mILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK/OD6CcYFFqempFWmYOMDJg0hIcP
  EoivPOuA6V5iwsSc4sz0yFSpxh1Oa5eubKXWYglLz8vVUqcdynIDAGQoozSPLgRsCi9xCgrJc
  zLyMDAIMRTkFqUm1mCKv+KUZyDUUmY1/or0BSezLwSuE2vgI5gAjrix9SdIEeUJCKkpBqYaqt
  madi8+5v1v85561GGXX7Vm0RSm6Yd5Z2+VdkgMyDyCz+DvlkaU5MRa8AUsVda7np7J/ALZS61
  kdwxtZkxZMbipZOvHLjffEfF6MP1O2fP2B/JuJ4+/2dRZFHEn66Psbds9l7OSayflnb4VEi9v
  cAj++93phYdNGHz18s9UMCxq/9w6vvaGR9n6bvqc5icFd23ebvtRN67/gGu9VPaPj5eXLbxWb
  ykf/O/679eLXNi/WDa1qN6niffMv9n8vcTM1Slmn53qX46bRm3qePLam/eqC0LNQqylycJV1T
  OjHELvGeid8Bse/WCfVYM/47cEODcJlG5fxWnvMezg5OLsiZcNDhr638kQJnpa9omJZbijERD
  Leai4kQAd/vTrE0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-732.messagelabs.com!1673329170!319617!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7254 invoked from network); 10 Jan 2023 05:39:30 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jan 2023 05:39:30 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D529F1000D2
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:39:29 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id C988D1000C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:39:29 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 10 Jan 2023 05:39:28 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20230101.0 -> 6.0.20230108.0
Date: Tue, 10 Jan 2023 13:39:14 +0800
Message-ID: <1673329158-5189-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 05:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100499

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20230101.0.bb => ctags_6.0.20230108.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20230101.0.bb => ctags_6.0.20230108.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230101.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230108.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20230101.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20230108.0.bb
index faeca6ce8..60579ede0 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230101.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230108.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "c89b92d5622221be2e02e71092dcdbc72733b08a"
+SRCREV = "dfdabb5ba13b3db2c278a732b4cc1d51f1d9bcf8"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


