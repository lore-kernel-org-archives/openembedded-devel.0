Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A5CC4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 07:39:25 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.15736.1668843562414917934
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 23:39:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DoYaahQz;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668843560; i=@fujitsu.com;
	bh=EQayNcy8KR3L5jq7AucLzECRnQR5vEIe8z5Yyyb5gvk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DoYaahQzf0M2lPfMNRtnRdv7QhALrhVsFdWqcgAsEKXRMt6nPPUGMddOc6Q8wG3mq
	 Aw+jLOhmYvNa+2zFEBcZuQQwrjMLEtBkMfNPui0tMMv9NWpeYmUZzPGxale3A+bf1I
	 QiCvvw2bsE4owZV9ldHtUMX4h6Cb1gPeJFjnQ2XGq5gOq6CjfTd8W3t2uYaDae3Seo
	 l7ZUwVyLfaYFkHoSbOWPtJ7hTDaropHlHhuhR/lFS8P2MtKMogEuueExayrM+O1CHq
	 VbxgDAjfQHKMCkCK7kbHw9qWHy9OaG0aAoF9menc/dXoNfFzyCoQdLXmgGRCnBSRhp
	 t+loMJpz1XEvQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWVe9oyL
  ZYP87fYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePg7pnMBbs4K+7tb2FtYNzN0cXIxSEk8IhR
  4u7qX4wQzlUmiXs/D7N1MXICOXsYJd49dQKx2QSkJG7c/w8WFxHQl1g6ew8ziM0soCLx4ncPe
  xcjB4ewgLvEgRn8IGEWAVWJJSt+sIDYvAKOEt/XTGMCsSUEFCSmPHwP1sop4CTxfNYrZohVjh
  KLHx5ihKgXlDg58wkLxHgJiYMvXjBD9CpKzL7czAJhV0jMmtUGNVNN4uq5TcwTGAVnIWmfhaR
  9ASPTKkaz4tSistQiXUMDvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzk
  nBS9vNSSTYzA0E0pVunbwfh22R+9Q4ySHExKorx728uThfiS8lMqMxKLM+KLSnNSiw8xynBwK
  EnwxrVVJAsJFqWmp1akZeYA4wgmLcHBoyTCK+IDlOYtLkjMLc5Mh0idYlSUEudNAukTAElklO
  bBtcFi9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd7pIFN4MvNK4Ka/AlrMBLQ4x7kMZHF
  JIkJKqoFJMWCTz1VTw6JJetGFsgfTJyilClUtmjXldJ+q8Tz2tedc5TbXM3oXzZ+beOvMtzc1
  zN4J0Uc67nI7Maokhb60+Law2crFa2bkwb/JxzQOLFAJZjjGHerzt0Fj9id7UVm72pzPvyZsm
  Lgmf+4k+9UfZHmSS/+HGhqefCDPKZcxjS/UKvDXj8J21XfJLx/1G02pn6bZ+35CwITrOVv3vF
  zRdl8+9OBTj7Zf24LZ5q42aPGeMzd9t1JtTfo3rXcpnyUfVLO4fZ0sv3/9z59TVoibcvULJa2
  XPtcvnmq6+qHfpMtrtyQETt1+e3NkT8iFzUcf/cqZL8MSsD04cuN/H6XSy3oPPzYc3OfA4cF2
  xbhTiaU4I9FQi7moOBEADLAiYFgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1668843559!179452!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22452 invoked from network); 19 Nov 2022 07:39:19 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Nov 2022 07:39:19 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 7F9384B11
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:39:19 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7304A4AF4
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:39:19 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 19 Nov 2022 07:39:18 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] lldpd: upgrade 1.0.15 -> 1.0.16
Date: Sat, 19 Nov 2022 15:38:05 +0800
Message-ID: <1668843486-2933-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668843486-2933-1-git-send-email-wangmy@fujitsu.com>
References: <1668843486-2933-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:39:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99629

From: Wang Mingyu <wangmy@fujitsu.com>

Fix:
--------
    Do not use 00:00:00:00:00:00 as chassis ID.
    Do not busy loop when an interface with a neighbor disappears.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-daemons/lldpd/{lldpd_1.0.15.bb => lldpd_1.0.16.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.15.bb => lldpd_1.0.16.bb} (96%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
similarity index 96%
rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
index 6a3687cf7..7ac188f76 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     file://lldpd.default \
     "
 
-SRC_URI[sha256sum] = "f7fe3a130be98a19c491479ef60f36b8ee41a9e6bc4d7f2c41033f63956a3126"
+SRC_URI[sha256sum] = "e3b391650c7ba67cea2fe84d67fdb4d7fc8aa1ec5cf86eb8bb984711df8465a9"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion github-releases
 
-- 
2.25.1


