Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2317DC433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 03:15:46 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.299.1668309342327562863
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Nov 2022 19:15:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VQ/3kdtj;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668309343; i=@fujitsu.com;
	bh=zJQ41SbrxEr9sM4HggBW5YoOCPso4jRuk5leVPEmMmI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VQ/3kdtjtA+dqU8LhAH+3triJytUCMNo36f9dwUlPlsmc/xBEtj7yY7h1CWNbvsd2
	 nfW/pK1ZV7K/UbXk1s/oo6XJOYcDtTt1txf+/BNAmgJhcHewmZ13IXydWl3YAQQoTZ
	 XCpbQsQek7B3kZ/iZqttIK/ZlM4M3LXnjG6+0e2lquBWvk3anhoXUlNxMhT3sIbEYl
	 NdvY3w/CjxLQRr3BmgfsnqlM4gjE7VcaxjDMNLCrGEQhROHMWe43PA2D8HBAQDQYkY
	 bOTmir43y1yzGwqRzXKwUIXMxGxkh0/UuxKTsxGprmfqrC0D3E2AQsKk4Og4P192pT
	 eq3NCfKBgafPQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8ORqBuXWJB
  s8OMMj8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvH71mrWgn0cFU+bEhoY97J3MXJyCAk8YZSY
  v165i5ELyL7OJNF0ZRszhLOHUeLZnzksIFVsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N0DN
  klYwEPi2s3nYDaLgKpE451jjCA2r4CTxIH93WBzJAQUJKY8fA/Uy8HBKeAsMeGQDMQRThJTZ5
  xghSgXlDg58wkLxHgJiYMvXjBDtCpKzL7cDDWmQmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkaz4tSistQiXUu9pKLM9IyS3MTMHL3EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3iytzknBS9
  vNSSTYzAwE0pTs/dwXhp2R+9Q4ySHExKorxp1/OThfiS8lMqMxKLM+KLSnNSiw8xynBwKEnw/
  o4sSBYSLEpNT61Iy8wBRhFMWoKDR0mEt8IOKM1bXJCYW5yZDpE6xWjPcfXKlb3MHFNn/9vPzL
  EcTM782naAWYglLz8vVUqc93E8UJsASFtGaR7cUFjUX2KUlRLmZWRgYBDiKUgtys0sQZV/xSj
  OwagkzLs2GmgKT2ZeCdzuV0BnMQGd9T0yD+SskkSElFQDk8KpzxKzC34JWZ1L0I+YMMF84iyG
  Xx7MLDVvez5yXpm9wv3QYc/PUu7nlry1L+MsXGW1o/3yege+E0ncO5dr5fMsnaQj9/aEgYRd5
  I6wpbe+6ayzqTGa0qMYUFr6aw2rr/r8sKhX199Pqtv/bFJx2T5P6Y4L9s1WTg8XLd/0/IOBfu
  5e64dhh5fy2HXOei3BW3Z4wbfw8MNPfAu9Z5du32L+69/3e/LnxbvfiViem3/DXTrW3GL/D7v
  iyrUTKthtpt38aG65fErPy8RJjPaF7LW3DqsxerJffnAx1vyZVWPz+QKJbfeeqD/qnVPgEHih
  0ut3EpMp4yUDs0rFfyHOS+xMDM/ztPKzC/ncvCsmo8RSnJFoqMVcVJwIAPlfXPJ1AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-732.messagelabs.com!1668309341!778163!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15212 invoked from network); 13 Nov 2022 03:15:42 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 03:15:42 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A8351100198
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:15:41 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9BD25100194
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:15:41 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 03:15:40 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] libnftnl: upgrade 1.2.3 -> 1.2.4
Date: Sun, 13 Nov 2022 11:15:14 +0800
Message-ID: <1668309316-15398-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668309316-15398-1-git-send-email-wangmy@fujitsu.com>
References: <1668309316-15398-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Nov 2022 03:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99569

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnftnl/{libnftnl_1.2.3.bb => libnftnl_1.2.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.2.3.bb => libnftnl_1.2.4.bb} (95%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.3.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.4.bb
similarity index 95%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.2.3.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.2.4.bb
index ab55767fe..ede35e762 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.3.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.4.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://git.netfilter.org/libnftnl;branch=master \
            file://0001-configure.ac-Add-serial-tests.patch \
            file://run-ptest \
            "
-SRCREV = "817c8b66f1ea8c223b7513d4cd7bff525d8a0a9f"
+SRCREV = "141cc997755dd91e94dd64c5497f2a23bd9a894c"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


