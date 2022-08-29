Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D53C3DA6B
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:32:24 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.67627.1661754732986101102
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mqe0nGxV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661754731; i=@fujitsu.com;
	bh=Xw0pDjn1VbKmqQgmqwj30NjnnROTZoTEJG3iox+52uA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mqe0nGxVCVLf7Xn3z5FG6891PwbctOSoPFAzmqTxRFu9cqYF8+H9/HJjFmxxt80SP
	 F1S4mIbG4Nw+evig80ZS1mlOKTfAiJKuhfd8q8NXiObFoPR74WzpjRYTOuYqveG/vq
	 Gm5qDVkn/flCz3hwK8TKpkqCPGRW7zUGLMMWil+JvA3vyEib+c8+lKRorW+k1sydj7
	 TYgWWvWwqwZ8rKw1feRc/jFKOc8xs3pDjQnNPY4b6vfqgGLqB5B1D2Z4/D1vA0WGpE
	 ByE2geYvMOIUyaB3f/wKU2ibirGfmo+dET9ZT7S9aB0jGN85EhwORos/olW4YIFvMw
	 99KQ95lURaY7g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8OxWTcrlif
  ZoP+BmsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjF101vmgmmcFbv27WVrYNzG0cXIxSEk8IBR
  4uD5LWwQzlUmiatff7JCOHsZJc7tPs/UxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAh8S62fPA4iwCqhKLD9xnAbF5BRwlWvZfAJsjIaAgMeXhe7AaTgEniZZdb8F6hYBqDm
  5bywRRLyhxcuYTFoj5EhIHX7xghuhVlJh9uZkFwq6U2DOrH2qmmsTVc5uYJzAKzkLSPgtJ+wJ
  GplWM1klFmekZJbmJmTm6hgYGuoaGprrGRrqGRmZ6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBgZxSrFC3g/Hayp96hxglOZiURHlNzHmShfiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnw3o4EygkWpaanVqRl5gCjCiYtwcGjJML7ygEozVtckJhbnJkOkTrFqMvx4dCVvcxCLH
  n5ealS4rwbo4GKBECKMkrz4EbAIvwSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFe4SigKTy
  ZeSVwm14BHcEEdMTDJdwgR5QkIqSkGpgUJvVfut+yxWp5Ru+TFOHb/I+eOz7Y+WXv/FmlR8+f
  WJd54rooZ3bsu0NvWC8sjtq493ni8p6Ae8duvRf4qRfw5IlvKFtl8aLdUdWpkxlkpZd9vX1gz
  v/1KuvvXXxj5Cr1UZv31hzGPE/uxO0LPr1iVPm0z7GmWmuZPUPbkfxL1w+oSPnIRly3NPZLYl
  p++JH7m+fr2Cv2q1TEnj7R/z34aNvtj2rJudlF9RcUnZfG6F61WGvrrLJyuj/nszTZnL0ZATP
  947bW83WfPCepxfo+PnaB+NP50dwFpxasmSat0W4potGqvKY70uGfWu6f4My9/Iw1zK/ZMycL
  +0+LDnfzWJ0Y1v1s84ktzOvuXTVVYinOSDTUYi4qTgQAwR2522sDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-565.messagelabs.com!1661754730!337376!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1499 invoked from network); 29 Aug 2022 06:32:10 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-10.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Aug 2022 06:32:10 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 5788873
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:32:10 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 4BE15142
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:32:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 29 Aug 2022 07:32:08 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-bluetooth: upgrade 42.2 -> 42.3
Date: Mon, 29 Aug 2022 14:31:40 +0800
Message-ID: <1661754703-4722-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661754703-4722-1-git-send-email-wangmy@fujitsu.com>
References: <1661754703-4722-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:32:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98501

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-bluetooth_42.2.bb => gnome-bluetooth_42.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_42.2.bb => gnome-bluetooth_42.3.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.2.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.3.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.2.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.3.bb
index c916aca007..cf73f823c8 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.3.bb
@@ -26,7 +26,7 @@ inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspection
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "8ce8ecfab28272db1830a63f08f9ccb5304734d1be2dbfce795fe4029e629f0c"
+SRC_URI[archive.sha256sum] = "c37a2a07f77d4816b261e6c2086a056ed9767c3881dfabc826f4f82f6e1aa302"
 
 BT_PULSE_PACKS = " \
     pulseaudio-lib-bluez5-util \
-- 
2.25.1


