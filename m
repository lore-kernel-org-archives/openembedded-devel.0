Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869F2C19F2C
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:43:32 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.6171.1659447804370196269
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vTRts6F1;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659447804; i=@fujitsu.com;
	bh=8NnHG4lgD90uajKTw0f8TeITD39+ATvYPLSb7cO7WvU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vTRts6F1rR7d8xe+p0ubH1DzLSgOHxJ6U4DMHyxtxgHFA3SeUIWePdiP5wjuVWZRC
	 TOfXEx6qf8UK3H8ukiPD3cfmAJtrpKXEprPQwOM8Lq3257ELMl80VNmY1Eo18if+NO
	 lzbcjTa0eLO8vag9KZA9TSvdBPFLq0d0j2QD8ESyCxGZcQjPGzaKskAeSwqIx13d4h
	 rLAbijJYw4sBQy78v9Awvxvh8hUEKjMrmVVReYAV/25uGkJYdjkEwvpM++p8DRF3cM
	 z2+d7sHNFF1vrQmt+XLlyZPE80r12FUGr1jXywxirodxeHyhutR5aCpyVoaSmgLUf8
	 Z1mWkDUuzn4WA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRWlGSWpSXmKPExsViZ8ORqPtH82W
  SQcNKeYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePr0klsBYs5Khon2jcwnmXvYuTiEBJ4wigx
  Z8svRgjnOpPEr91noDK7GSX+PGxn6WLk5GATUJOYfusGK4gtIqAvsXT2HmYQm1lAReLF7x52E
  FtYwEFi3q/rQDYHBwtQfMJ5DpAwr4CTROOF5WDlEgIKElMevmcGKeEUcJb41G8PEhYCKul42M
  wIUS4ocXLmExaI6RISB1+8gGpVlJh9uZkFwq6QmDFjGxuErSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo3VSUWZ6RkluYmaOrqGBga6hoamusYWuoYmBXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVu
  ck6KXl5qySZGYAinFKv17GA8seqn3iFGSQ4mJVFeOcWXSUJ8SfkplRmJxRnxRaU5qcWHGGU4O
  JQkeG+pAuUEi1LTUyvSMnOA8QSTluDgURLhPasBlOYtLkjMLc5Mh0idYrTkWNtwYC8zx6Q/14
  DkzK9tB5iFWPLy81KlxHmXgzQIgDRklObBjYPF/CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIx
  KwrwHQKbwZOaVwG19BXQQE9BBOlwvQA4qSURISTUwbXk2f5Z/8QXuZf/n3YgUvzNFT6Nvwf5F
  t2s6ox3CyrZyZJc17JURmtEbrrytYNX86wK3PnRGxrL1yzTwc9oXMB60MFmy/cKCDYaB13I4/
  aS55CxqH019e2dzvc1ydlYmfrltXJcjkz9s2/do/Yovjd9b4iNPfHl3qkWJq+yzzTaJd0fkXb
  mXPZlaK92WO9c97laIcqWmws/EtgsXe4Wn/4sWEZL3tejx/Ory4EiaTDnXKsPji1pbywULAuZ
  vmOhrcO78TcEDke5XSw1NRO8zmNd2ai9bs7Li0fuNPVfmGCluWXHr4l3eiXc4DH36zz6wMbSc
  UG3TdJaLfzXjhu61HnyH0yZY8hyqNv40S/WCEktxRqKhFnNRcSIAqtiMhXQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-548.messagelabs.com!1659447804!4087!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22679 invoked from network); 2 Aug 2022 13:43:24 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Aug 2022 13:43:24 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3668610018D
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:43:24 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2A505100043
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:43:24 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 2 Aug 2022 14:43:22 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xmessage: upgrade 1.0.5 -> 1.0.6
Date: Tue, 2 Aug 2022 21:43:08 +0800
Message-ID: <1659447791-24448-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659447791-24448-1-git-send-email-wangmy@fujitsu.com>
References: <1659447791-24448-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:43:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98094

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xmessage_1.0.5.bb => xmessage_1.0.6.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xmessage_1.0.5.bb => xmessage_1.0.6.bb} (60%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xmessage_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/xmessage_1.0.6.bb
similarity index 60%
rename from meta-oe/recipes-graphics/xorg-app/xmessage_1.0.5.bb
rename to meta-oe/recipes-graphics/xorg-app/xmessage_1.0.6.bb
index 23cfb26c7b..cb123837d0 100644
--- a/meta-oe/recipes-graphics/xorg-app/xmessage_1.0.5.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xmessage_1.0.6.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73c7f696a728de728d7446cbca814cc5"
 
 DEPENDS += "libxaw"
 
-SRC_URI[md5sum] = "e50ffae17eeb3943079620cb78f5ce0b"
-SRC_URI[sha256sum] = "373dfb81e7a6f06d3d22485a12fcde6e255d58c6dee1bbaeb00c7d0caa9b2029"
+SRC_URI[sha256sum] = "d2eac545f137156b960877e052fcc8e29795ed735c02f7690fd7b439e6846a12"
+SRC_URI_EXT = "xz"
-- 
2.25.1


