Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 435B0C54F3D
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web09.27354.1649669655912914641
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 02:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=no32kodJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649669654; i=@fujitsu.com;
	bh=x+VPuJhXdTkv1icVUEsGS7lfDHjkX/oBV8zljXmze3M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=no32kodJj65PKrhrjrdsTa+cXGWD8Mjl3+tcPVdd5Vw31vZREq7sjURQ6LqSYD5/R
	 RBvneWYHgI5S870dlnMTIaZQR3Ok9kgb5G7XQuVyYOj0RgIXBNtZuTsWot2y8TMOQ0
	 dLPxRcziju1E5trPvEGcTSAMLIYjFWgbqn0HhaP4+33EJx6NPX023KzjEC8Umd+bEj
	 eykGdDs5vTZWWIggKnIEmQyK+X6puco8NeRRG2tV2HmE1/sUxaA8MuEdSuAQkDV4Mq
	 +kwFWl57DtwEbm2l6wxoANgxShU9pK/JMTWZ2e3ggjLiWWbdYym29AEqDp5j3136hp
	 DHdpGIOYsja5Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MxSVf0W3C
  Swd1v8hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8anrQvYC+5zVkz6uI+xgfERRxcjF4eQwBNG
  iUVbuhghnAtMEicuPmLqYuQEcvYwSkw64gFiswmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSxgJ3H94SFGEJsFKL7v6EQ2EJtXwEli3tGFLCC2hICCxJSH75kh4oISJ2c+YYGYIyFx8M
  ULZogaRYnZl5uh6iskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1itEoqykzPKMlNzMzRNTQ
  w0DU0NNU10zU0s9RLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMypRitpU7
  GFf2/dQ7xCjJwaQkyrv+UnCSEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQle569AOcGi1PTUirTMH
  GCEwKQlOHiURHj/PwNK8xYXJOYWZ6ZDpE4xGnNcvXJlLzPHDRApxJKXn5cqJc77+AtQqQBIaU
  ZpHtwgWOReYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM+wpkCk9mXgncvldApzABnRK6LRD
  klJJEhJRUA5PukgXF/5x0Ey8GXNKwYj2bytLxPKVtyse/uhNvL9hcc16Q8bvmzca4tG6dNXya
  EuttL09IPtxauDJU/FZZxqH60l16maKrxNoOZlwx9p+8+7G98LZp/Jd0RTs27J9z68a8x4ayt
  UfV/t/KuTcvZM22nxt6mno1n6QvYjetSuHYcGnKu5Myi0wFxcvnPUnkfrdhlsNhO0nzkFMrgx
  gvTk4WvpSgaNG0/unmaAEm4QDFnOoXlzm2/RcNK1SKPFVS8OrnBvmz3x9k3/p45lA+w+Rt75i
  WWLy4eJOB9bDwqwcu9g3eP2a43U5/xnhVzNY77WEMa0/+hNaddw4urdKtKboi4M+2LSNud9sT
  3i0Xgg4psRRnJBpqMRcVJwIAy7YQmVcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-585.messagelabs.com!1649669653!7557!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30350 invoked from network); 11 Apr 2022 09:34:13 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Apr 2022 09:34:13 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1895110047E
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 10:34:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0BBEC100451
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 10:34:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 11 Apr 2022 10:34:01 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] grpc: upgrade 1.45.1 -> 1.45.2
Date: Sat, 9 Apr 2022 00:30:37 +0800
Message-ID: <1649435437-30791-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96550

Changelog:
=========
Various fixes related to XDS (#29314, #29340, #29339)
HTTP2: Should not run cancelling logic on servers when receiving GOAWAY (#29307)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/grpc/{grpc_1.45.1.bb => grpc_1.45.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/grpc/{grpc_1.45.1.bb => grpc_1.45.2.bb} (98%)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb b/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
similarity index 98%
rename from meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb
rename to meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
index 7275f451a7..48d0f58e20 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.45.1.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.45.2.bb
@@ -20,7 +20,7 @@ RDEPENDS:${PN}-dev:append:class-native = " ${PN}-compiler"
 # RDEPENDS:${PN}-dev += "${PN}-compiler"
 
 S = "${WORKDIR}/git"
-SRCREV_grpc = "1c159689ceda2c408f7f9d97d96a264c9521b806"
+SRCREV_grpc = "b39ffcc425ea990a537f98ec6fe6a1dcb90470d7"
 BRANCH = "v1.45.x"
 SRC_URI = "git://github.com/grpc/grpc.git;protocol=https;name=grpc;branch=${BRANCH} \
            file://0001-Revert-Changed-GRPCPP_ABSEIL_SYNC-to-GPR_ABSEIL_SYNC.patch \
-- 
2.25.1


