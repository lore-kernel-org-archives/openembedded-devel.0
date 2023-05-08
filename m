Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAA6C7EE22
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:03:08 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.103568.1683540181984130813
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EsDRWSJP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540180; i=@fujitsu.com;
	bh=xKjIQlecBUwMEq0SSFECdVc9KOlK4Qn7GPHEXujlmpM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=EsDRWSJPGlhIEDD2FftX6T071Uxb6YUPpmuTxIsWsbjisGAD0LjKTepmTvCFM7t5x
	 OcNPN6UHJosStUWOcECfxAKtHY4eiFADBNJnuZHcrx0Rlx/VJHOQN/NQwaMCmsaBp5
	 0oYkRncEB33fIJJsrtByjegX/mOR+pDbmxq2p68tMgc9nky1qDEvk6Wp2rkqTQWgb3
	 +Rsx00gEeg4U2Uhn6Og0jYEN98E4aGruZheLvCcncDaiHTXOxU10HuFYcLnlTX8t+J
	 cOde8Ylau03AEYdfPBM6CEeVUMTIr6i9WjnHb6RF9UbC8CeRLqpeiF35uet1XZKy3l
	 zQAjE4QxhMvtw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPLMWRWlGSWpSXmKPExsViZ8ORpHv5RES
  KwaJX1hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ac3xvYCj5yVPz5kdvAOImji5GLQ0hgI6PE
  0Wvr2CGcaUwS954uBHI4OdgEJCSm7z0JZosI6Ep8/DCXEcRmFlCRmDH5CFMXIweHsICzxNbXB
  SBhFgFVid0zHzGB2LwCThLf1vSwgdgSAgoSUx6+ZwaxOYHKz954ADZGCKjm0e8zUDVqElfPbW
  KewMizgJFhFaNpcWpRWWqRrrFeUlFmekZJbmJmjl5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnF
  lbnJOil5easkmRmA4pBQzRe5gPLPzr94hRkkOJiVRXtODYSlCfEn5KZUZicUZ8UWlOanFhxhl
  ODiUJHjbtkWkCAkWpaanVqRl5gBDEyYtwcGjJMIrewQozVtckJhbnJkOkTrFqCglzlt6HCghA
  JLIKM2Da4PFwyVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzVION5MvNK4Ka/AlrMBLTY/3
  I4yOKSRISUVANTW81F3Zd9cevTO39O9vom68D6TnYdY8i2SInZm3300n878TRXLWO5r2nxxGn
  SRMmkwiUcux7MCdPOXT7hm+6iT7cbVvtVLvYS2DVzickdhSNf/b+YXtPrv16pP/m15oJlE6Nt
  /vrJJWvLX+DLe+XWvNMh6KKG7V4DkU1qUh9X5x8w+8XC/OiNgrAU31FDX5G0+uf15qX/Hxi43
  lLosN89RyLsT2DXB9G9h0NYdWy33mZWSNZZIqr8d7+fbWPlyxdCvUcWPlaXYk1P0Uu6w60kee
  NWcP2CvaIfBSyzj3y1OONh/9RttYHyvNP/L+wy1p/AvWLzr9Pq7bIzfjzL3M+UvWlLzbF9iZ8
  23jo787CaEktxRqKhFnNRcSIAicb4IgIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1683540179!327034!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 960 invoked from network); 8 May 2023 10:02:59 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:02:59 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 98BFB1D2;
	Mon,  8 May 2023 11:02:59 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id BFF3B1C2;
	Mon,  8 May 2023 11:02:58 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gspell: upgrade 1.12.0 -> 1.12.1
Date: Mon,  8 May 2023 18:02:42 +0800
Message-Id: <1683540162-25172-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683540162-25172-1-git-send-email-wangmy@fujitsu.com>
References: <1683540162-25172-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102389

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* Build: remove gtk-mac-integration dependency.
* Documentation improvements.
* Translation updates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/gspell/{gspell_1.12.0.bb => gspell_1.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gspell/{gspell_1.12.0.bb => gspell_1.12.1.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.12.0.bb b/meta-gnome/recipes-gnome/gspell/gspell_1.12.1.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/gspell/gspell_1.12.0.bb
rename to meta-gnome/recipes-gnome/gspell/gspell_1.12.1.bb
index b7e4954964..6b65af3bb4 100644
--- a/meta-gnome/recipes-gnome/gspell/gspell_1.12.0.bb
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.12.1.bb
@@ -7,4 +7,4 @@ DEPENDS = "gtk+3 iso-codes enchant2"
 
 inherit gnomebase gettext gobject-introspection vala
 
-SRC_URI[archive.sha256sum] = "40d2850f1bb6e8775246fa1e39438b36caafbdbada1d28a19fa1ca07e1ff82ad"
+SRC_URI[archive.sha256sum] = "8ec44f32052e896fcdd4926eb814a326e39a5047e251eec7b9056fbd9444b0f1"
-- 
2.34.1


