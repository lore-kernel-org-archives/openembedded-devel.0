Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DCAC77B75
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:04:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.103605.1683540278774527280
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=neAFJ6q8;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540276; i=@fujitsu.com;
	bh=g4ijdEJHsjMsUQXYLR4cu/rt9GqmEkP7G2DU4P+fI6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=neAFJ6q8SBtIjttxeuOxF0M2DN6l2ACm6Rfsryt4u5kAKx0BFDZNfsouzEB8Y+WrL
	 PyT9qazitfHDvn/PM+nl26pSr+IzAVMaZCHFNhH4KJSbEJ4iTqy5f7BaczBCXoYapY
	 Ewv43XjZ8bKoS+3EvLLrO227aLNbbdM2Oee1BVEobPWQuK1zzbkaPvFlG9ZbnMx628
	 /xpCdsnEtL8k8pLOqWQbFUL/f91CPP6WZhut0k8L37btH7L/r7QocSjeUadnrMdMPg
	 fx6sIZEOgJFl9u2AeZ4o6e9aCwNxi7XB4jnlx6lOBYrJSJUILSebTxZR4+tVDAM34L
	 laQ3WdTVVn70g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMLMWRWlGSWpSXmKPExsViZ8ORpGtyMiL
  F4OtUaYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeN15xT2gomcFd8u3GVtYFzN0cXIxSEksJFR
  4szKs6wQzjQmiQvLLjB1MXJysAlISEzfe5IdxBYR0JX4+GEuI4jNLKAiMWPyEbAaYQFniZfzW
  plBbBYBVYlpvzaB1fMKOEmsvT8DrEZCQEFiysP3YDWcQPXPD0xhBbGFgGqWXd3GDFGjJnH13C
  bmCYw8CxgZVjGaF6cWlaUW6Rpa6CUVZaZnlOQmZuboJVbpJuqllurm5ReVZOga6iWWF+ulFhf
  rFVfmJuek6OWllmxiBIZFSnGC/Q7G9l1/9Q4xSnIwKYnymh4MSxHiS8pPqcxILM6ILyrNSS0+
  xCjDwaEkwdu2LSJFSLAoNT21Ii0zBxiiMGkJDh4lEV7ZI0Bp3uKCxNzizHSI1ClGRSlxXpETQ
  AkBkERGaR5cGywuLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5rUDmcKTmVcCN/0V0GImoM
  X+l8NBFpckIqSkGpgcSnXjVh2R2MZdtqhixd6VKn9PfV1r2bcptKvfaNPkAzFpqixNjkodF2a
  WewbuOh13gYF39dxClmuzVfj+7/c7NGf6WVUv/QOfPn+WWP7Nf0LnfIaXnDnKCYdUa6TOTrcw
  mxJ2h6/10n8j7X85PH+eS2jkX2mMWcHQ4GBXqLArs2PFmtiXfxbOsO+Pi+tmTa+6qeL4OrtKv
  HTb48l5i/yMpz1Qfd0keePV+r2Va14llOsUsBTfqfuxmOnx9mRnKcVPq3y8/a5udeUOWPjnSN
  7MTyyOj4Wquh85RriI55vua+1+O8V9Wv3hFpbT069sMtfb6T5nL/eLzYVPPNdl8uZaS675ytO
  eG9YwYVmhxUMlluKMREMt5qLiRAA5os1JBgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-728.messagelabs.com!1683540276!495506!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11084 invoked from network); 8 May 2023 10:04:36 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:04:36 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id DC89C1C2;
	Mon,  8 May 2023 11:04:35 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0F5C81D2;
	Mon,  8 May 2023 11:04:34 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libcgi-perl: upgrade 4.56 -> 4.57
Date: Mon,  8 May 2023 18:04:19 +0800
Message-Id: <1683540259-25209-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683540259-25209-1-git-send-email-wangmy@fujitsu.com>
References: <1683540259-25209-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102394

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Documentation tweaks around uploadInfo() and hooks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcgi/{libcgi-perl_4.56.bb => libcgi-perl_4.57.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcgi/{libcgi-perl_4.56.bb => libcgi-perl_4.57.bb} (93%)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.56.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.57.bb
similarity index 93%
rename from meta-perl/recipes-perl/libcgi/libcgi-perl_4.56.bb
rename to meta-perl/recipes-perl/libcgi/libcgi-perl_4.57.bb
index 341d348f92..dea5f7a453 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.56.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.57.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "2d36d930b89ecdfbcc7d6d4740821bd466a0218abf1bd413568640b2f43799b7"
+SRC_URI[sha256sum] = "4e6ca634fe0d5621bb55b0fce5c1d08e6f643c65eecdfffbb4b344fd51b963ac"
 
 S = "${WORKDIR}/CGI-${PV}"
 
-- 
2.34.1


