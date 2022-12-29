Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D835C53210
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 03:29:18 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.56073.1672716548846344055
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jan 2023 19:29:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=K7BUo2In;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672716547; i=@fujitsu.com;
	bh=uMKkYgnNDYnbKBftxptXwAX2d+sNwXOV97lhFXbcEWI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=K7BUo2InN3ltOGviqNZfvEejH1ik23ftMVX0UsIBDxs172RYRABiSHcrSh4Mq88QQ
	 mL8Mkb4mouQmOtBtU3P6+/pSvwAIiV0vCB1+0GV2xtXtF6bNvsmNakOhi6/0oJJunM
	 PBF3te7fH4b9tbgcRY+uTHxQ01B8N5/TXGsDyK9tRV2hebxnsXSXe7PB2SNdLuBzr9
	 6hAyCwN/6nBLCLzvWxkxmceJ6O831J33bWAMtTlPUG/LR302OL1agoKoQmeD9YUPEb
	 SFhBfDM/xVn7e4tObOsOHUsvyCfqa/aDoVDGTT8GOQEgLTB3g3aK9TN4J6dy4DBus9
	 zRtXUx/y9kHEA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORqMu0cHO
  yQfNTAYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPn2lTGgmscFbdPvWVuYPzL3sXIxSEk8IRR
  4vvR21DOdSaJph2NbBDObkaJPzefMHYxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAvcfXzbVYQm0VAVWLm37lMIDavgJPE/B+7WEBsCQEFiSkP34P1cgo4S2zv/QA2Uwio5t
  yFP8wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5uh5lRIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFqcWlSWWqRrqpdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOi
  l5dasokRGLwpxYxlOxi7l/3RO8QoycGkJMpbvndTshBfUn5KZUZicUZ8UWlOavEhRhkODiUJX
  p75m5OFBItS01Mr0jJzgJEEk5bg4FES4T00DyjNW1yQmFucmQ6ROsVozHF34d69zBxXr1zZyy
  zEkpeflyolzisyF6hUAKQ0ozQPbhAswi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuadD3I
  PT2ZeCdy+V0CnMAGdkrRmI8gpJYkIKakGJo8/jMa57n8eK5uYbTZamuBbNDnS7q/gKd6TDxYX
  F7+38MxdkG3NoxGe/DVuYcDre2se8S5zYD2bWXwtTXHxIcna+LcXQhRSPgULh2zQ4Y6+Y5Cyw
  KNi/uuTnH8PVf1iTHDdyZQ8+W5vIKvwk/26JUsFqzz3Xio97PVz+vS8nrWLD/Xa/mycxH6kN0
  Q8YW7VgcdPT0WJhjzcLlc85+7c4A3vhZjZrL15/pp++7uGO5u36lxdjsvxf3vOa9+vqPcWsl1
  47f8r5v1Gax8y/DZIcznI+b5Y/eqEjd4zGy9+YHfQ61mYEH1UNf7Jx5kmdxwe+SS8V3VrPXFM
  y/qxEpfccafb5nOuRheYxezfGjTBXomlOCPRUIu5qDgRANL+u+trAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-585.messagelabs.com!1672716546!279197!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28828 invoked from network); 3 Jan 2023 03:29:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-19.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jan 2023 03:29:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id DEA16100192
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 03:29:05 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D32B1100191
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 03:29:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 3 Jan 2023 03:29:04 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20221225.0 -> 6.0.20230101.0
Date: Thu, 29 Dec 2022 12:45:30 +0800
Message-ID: <1672289132-16078-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672289132-16078-1-git-send-email-wangmy@fujitsu.com>
References: <1672289132-16078-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 03:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100347

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20221225.0.bb => ctags_6.0.20230101.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20221225.0.bb => ctags_6.0.20230101.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20221225.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230101.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20221225.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20230101.0.bb
index 60ac26a31..faeca6ce8 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20221225.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230101.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "033929ad16caa2742bacbcf7484f89c72b85680e"
+SRCREV = "c89b92d5622221be2e02e71092dcdbc72733b08a"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


