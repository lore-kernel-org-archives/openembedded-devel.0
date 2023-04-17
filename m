Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8A2C77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:38:51 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.49008.1681717125758867855
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GZ9a1nYq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717123; i=@fujitsu.com;
	bh=Bb0q6uy1oaEo9a6WlMMUoe7uvmvVX17/FXGI+Z4LQh8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GZ9a1nYqMDT8lGul+MZ7xE3UlygwKmdv4kO8zHRBtiZd0Mc5m15AGQUE4ZKnP8T6v
	 UFMsC/k76LMfa/qCnProNJKzcmDH7NJouukUT1kDrSu9gSRsQ7W7v91445TxkJCR5E
	 fJCRxjYyxmMRR1WwLu7iDPQCp+pZE5BmqLclNTR3elPAeTEfhIbbbhWoEBqoDu/xxD
	 61LWQKY38M8xgptWRzP1G1rG907KdX2aq23KGm7ZOK76EKUcCwJyMRM0lVAXwyZuEX
	 RndI7M/Xt+37uLiCH5gqOt0iuIFNUT9+oOYBQ/IYLQlXjGndZH9/whTOmHpubvDsbl
	 pwtNNEn/xVpww==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8MxSbf5u02
  KwbQ2MYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNz52qmgmscFZOvH2RrYPzL3sXIxSEk8IRR
  4t3/NijnBpPEuRc7WCCcvYwSPbOagBxODjYBKYkb9/+zgdgiAvoSS2fvYQaxmQVUJF787mEHs
  YUF/CUuzT0AVsMioCrR8OU3K4jNK+AksfLFS0YQW0JAQWLKw/dgvZwCzhKHew+C2UJANQ2N16
  HqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2JUSrR9+QdlqElfPbWKewCg4C0n7LCTtCxiZVjG
  aFacWlaUW6RoZ6CUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWW
  bGIEhm9KMePeHYyT+/7qHWKU5GBSEuV9kWqdIsSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd9Vnm
  xQhwaLU9NSKtMwcYCzBpCU4eJREeI2fAaV5iwsSc4sz0yFSpxh1Oa5eubKXWYglLz8vVUqc1/
  obUJEASFFGaR7cCFhcX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzBv+BWgKT2ZeCdymV0B
  HMAEdIacEdkRJIkJKqoEp1dF+xlevL35/csSfzom0V3/Innvs3bJPRs6hX+9bOvB5rLj469WX
  9Al3zT/vPbN0f9KEeRsfxqZ5vpYXNLjqEPcrTefPjIfbjqmw9V09lHZUcI7LgT+7N5dNctrKt
  V2s8ANPsWyqq5GUrsq+6WeYugNVFWeVCxw26lJtWZe88tbk9a8+pcydOY/H7Or8EzpP95qosf
  bZhPr84TTflH7s5hX9xh/TKp2Yv3VfkVkv5pCtcVLjM9PWP2darxmtDVgddtpF8+P69E2SNlU
  fSks2bzmfsOjpgdVc91mS60tFv754LRI7803JJLmJRWrRJzf3+xhOjHq2Ktzdde+TbNuCjXFW
  0+V1X868+CjxZWOeiBJLcUaioRZzUXEiAFgceQdmAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1681717123!482482!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26046 invoked from network); 17 Apr 2023 07:38:43 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:38:43 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 021EE100329
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:38:43 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id EA5631000FE
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:38:42 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:38:41 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20230402.0 -> 6.0.20230416.0
Date: Mon, 17 Apr 2023 15:38:03 +0800
Message-ID: <1681717086-19067-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681717086-19067-1-git-send-email-wangmy@fujitsu.com>
References: <1681717086-19067-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:38:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102103

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20230402.0.bb => ctags_6.0.20230416.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20230402.0.bb => ctags_6.0.20230416.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230402.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230416.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20230402.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20230416.0.bb
index b7cf45950..cc82d9953 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230402.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230416.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "1231ebe5b4ac1cc095b4480a0bb2b016c135d6fb"
+SRCREV = "5ba7dfcc55471e599375281f52ad2bebdc527c62"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


