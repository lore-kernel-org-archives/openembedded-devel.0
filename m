Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DC8C4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:06:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.111330.1669615600266010407
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:06:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lJSPcGwP;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669615598; i=@fujitsu.com;
	bh=tawjWMelny8lHNosriOFTMpTYG3xBxl9G4gmYdmUr1A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lJSPcGwP7lYeTnUImhAfI18sicv4bAZhg4yzmNxlYgzs8hjrZqPgSeDSjqzTX9mI3
	 whH7DGZ8VS3+rV9OSkz94WqTYqga9cILnhDPY06j1zMfFRQ1nxU1Td/jglca3YJ9nr
	 NGYnq2MBXNv/D/YZGvFIg7Hfx9IRhdc027CHgN6SmacNHqLsGdWPE3MEVKugykKR/K
	 Agqucq7G+DzfJd6KQe6f5ArlsjyslNwcz0dIRP+8GfBrzoqBvXw/wSqEMIIc0EhMMJ
	 BLOQbUzZStj0VrngEXTJLbgB1skp+l+Xc19KJ7SwF5pnuj6c7DgzpqYvtCniJnOVaB
	 ZrS8dGMCCWciA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8MxSfetf0u
  ywctHlhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8azeSvYC26wVlx6cJyxgXEuaxcjF4eQwBNG
  iXf7pkM515kk3l24zwjh7GGUWLi7AyjDycEmICVx4/5/NhBbREBfYunsPcwgNrOAisSL3z3sI
  LawgKfE0w0zWEBsFgFViYN9H5hAbF4BJ4n7S5eAxSUEFCSmPHwP1ssp4CzRteM4mC0EVLN34n
  NWiHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNUHMqJGbNamOCsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYjQrTi0qSy3SNTTTSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM35Rixa07GG8s+6N3iFGSg0lJlHfhpaZkIb6k/JTKjMTijPii0pzU4kOMMhwcShK86
  z1bkoUEi1LTUyvSMnOAsQSTluDgURLhXWwPlOYtLkjMLc5Mh0idYtTlmPm17QCzEEtefl6qlD
  ivIzAyhQRAijJK8+BGwOL6EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXkE/oCk8mXklcJt
  eAR3BBHTEJsUmkCNKEhFSUg1M1QlfNS+9eLyn+dP9BQ3v5kyIXGX6fVLjW90T0/+Gn3F60ifp
  58tiIHlnmf2KxF2bH1/cEfYkpeRx6rv9ehf33poty7zUocPpXNOVSPMyPo3ZFZuKdu+S+3CfQ
  0msy7Lm+awzlsWVjZyMGXuYGIwvTeh87OPo/6LsltFVjzO7+hlL9ldsiKuewa9bV84fyvXwZs
  9avk5PyXm7/v30C0xhn9ninj11++O/IV9KrmoEvNNxV/u37YVrkcj3RelBCeyNhTqCk9JWXk9
  7oLGy/3Xg5/c9hgUu21/3BFffOW3NIjfl6YfSpO3f82JfsPXuXTJhVnYyW6mUz1HzuydvfprD
  Jjv1nHzflfvaOxZ8d3hdpcRSnJFoqMVcVJwIAPYv6bJmAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1669615597!290317!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9137 invoked from network); 28 Nov 2022 06:06:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:06:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A49F31000E9
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:06:37 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 97E8A1000E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:06:37 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:06:35 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] flatbuffers: upgrade 22.10.26 -> 22.11.23
Date: Mon, 28 Nov 2022 14:05:52 +0800
Message-ID: <1669615552-13033-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669615552-13033-1-git-send-email-wangmy@fujitsu.com>
References: <1669615552-13033-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99790

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
index 0700c5bd3..a2294d1c7 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
@@ -1,3 +1,3 @@
-PV = "22.10.26"
-SRCREV = "203241ed3275625c8a25c4a1e7b86e3c0289c488"
+PV = "22.11.23"
+SRCREV = "8f625561d053d232897790ad5fdcc9a6a1832133"
 SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
-- 
2.25.1


