Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F673C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:42:18 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web12.8982.1648460536867323357
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tuURLCbU;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648460535; i=@fujitsu.com;
	bh=kuNI85aBiYHAGTbRxM9yeGGZigdrnGeRYXamiABss3M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tuURLCbU9wHAiLUXJwBaCMgYgPF46zGQNwX7d4xWOXwvpq3ljaR8SW67j7C2GZPgx
	 RYsZdy4boH79pDk5hpvhSrPbzs6Sd5IWcu+7YVE69WktFnHX8EBfrd7t5qpW65810J
	 E7QMG6p+AGQwuPH5lAbCY9CKGyUvsklff2995HSefjz0oqb1eQuXP3ujMitqO9gY7h
	 0OEOtLbfDrgjz298/0BSwhr6CzcDypPpQ+NYGEZfFviejkoWhvOeCX9H1uXLqDE/JL
	 ixAR2bYUE+HmP0JqPEhFODHUH3Yw9TrTzJu5vqU9wz8cw3eV7SXdd17R93PfPYxCLR
	 8NjUBOTF4lTrQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqPutyTH
  J4NVHFYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePdj0dsBVs5KlbsaGFtYHzI3sXIxSEk8IRR
  4sbz91DOBSaJ25f3s0E4exglns99z9zFyMnBJqAmMf3WDVYQW0RAX2Lp7D1gcWYBFYkXv3vYQ
  WxhAUeJhhPHwWpYBFQl9hz6yQhi8wo4SdxfdxssLiGgIDHlIcRMTgFnie8988BsIaCamXv/Q9
  ULSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUjaFzAyrWK
  0TCrKTM8oyU3MzNE1NDDQNTQ01TXWtTDTS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknR
  y0st2cQIDOKUYuawHYx/en/qHWKU5GBSEuU1ynRMEuJLyk+pzEgszogvKs1JLT7EKMPBoSTBW
  9EAlBMsSk1PrUjLzAFGFExagoNHSYR3Qg1Qmre4IDG3ODMdInWKUVFKnHdtI1BCACSRUZoH1w
  aL4kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnNQKbwZOaVwE1/BbSYCWjx2ne2IItLEhF
  SUg1MXBphnOFnHrhJtZlPawp80rKge2u4yGfvv9fWWfzevUXK9dUnpbWc19NWPTFIu5pZfSV8
  FX+2LtN7O5n5E/zO/fqo37P5osvkmS2ddne7laen6W9VUqqXTooNfhbUNO/eZbPF8tGLHpcbn
  Q9RXL72abvfqg1qhwpF/z2I1f/tkt2qZNRU8kloHrvYr7WBYvu1DGf6ntXITs65UXbHUspC0a
  23Urlr4s3ZHIHsn4SSCyUz1U9es+Q7Z7RH6cFkxX9d+p6FQsumqT+/wbt12T3DjPt51VHcl7d
  MM18W8lhErI/rktcFu91XHTy+M07duoJl2+9aH5UaUcFHNX97A01MDD84Nq3R5uXV/Xtn3nQl
  luKMREMt5qLiRABhy0j+XQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-585.messagelabs.com!1648460534!130438!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17545 invoked from network); 28 Mar 2022 09:42:14 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:42:14 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E725510004D
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:42:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8AF7910018B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:42:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:41:58 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] babl: upgrade 0.1.90 -> 0.1.92
Date: Mon, 28 Mar 2022 17:41:42 +0800
Message-ID: <1648460503-15630-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648460503-15630-1-git-send-email-wangmy@fujitsu.com>
References: <1648460503-15630-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 09:42:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96233

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gimp/babl/{babl_0.1.90.bb => babl_0.1.92.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.90.bb => babl_0.1.92.bb} (87%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.90.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.92.bb
similarity index 87%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.90.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.92.bb
index 0d2ac527a0..156c91bcbd 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.90.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.92.bb
@@ -15,6 +15,6 @@ CFLAGS:append:toolchain-clang:mipsarch = " -ffp-exception-behavior=ignore "
 CFLAGS:append:toolchain-clang:riscv64 = " -ffp-exception-behavior=ignore "
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] = "6e2ebb636f37581588e3d02499b3d2f69f9ac73e34a262f42911d7f5906a9243"
+SRC_URI[sha256sum] = "f667735028944b6375ad18f160a64ceb93f5c7dccaa9d8751de359777488a2c1"
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


