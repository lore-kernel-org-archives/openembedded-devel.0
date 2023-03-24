Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFEEC6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:30:03 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.89928.1679617792918118964
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mo+Ael4c;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617791; i=@fujitsu.com;
	bh=uIc3VeYN9lRNGPYLRCX5FiOb+oBuusqLyVcQQD/l5RQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mo+Ael4cOsCUy+oRdL2PelFVuU18UE0/P/E4G5GKvMoMk9cfEdduo4WIU13M2VXUg
	 Tk/HnCyi/hx9LLx9aNaD6TIyIT7nlwuEFjf33fm9D63AQBp7KQ4SIc+PgFtcUcJ0v1
	 lOhOENPDTKMjfKoUcPn5pxDAZRsxE1NGkjgny+EfTM/0utz+MocALUMnqY3S+B8BTH
	 U7XIUG5y1KoycmdoyB2+75ce/zeoYZW3fxCKjUWhx+00RdYiZDasakukiBDvv4AVei
	 e70gAw3Mv7iR4BJWA8o+4D/zvJbOIBHvWJth9rNd06abrkvchwFPSNj9/P5jtNBdBY
	 OpqdffQGFwMGA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqPvvnUy
  KwdwfqhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8addb9ZCpo5K64cmM7YwDiDo4uRi0NI4Amj
  xIWnh1i6GDmBnOtMEp93Z0Ak9jBKzOp+ywySYBOQkrhx/z8biC0ioC+xdPYesDizgIrEi9897
  CC2sICLxMulmxlBbBYBVYnLM2eC1fAKOEmsXH2WCcSWEFCQmPLwPVicU8BZYsOdJmaIxU4S+x
  /OZYOoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdINE4/BDVTTeLquU3MExgFZyFpn4WkfQE
  j0ypG0+LUorLUIl1TvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9
  vNSSTYzA0E0pZjHbwdje91fvEKMkB5OSKK9EqHSKEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnez
  29kUoQEi1LTUyvSMnOAcQSTluDgURLhPXQWKM1bXJCYW5yZDpE6xagoJc6b+BYoIQCSyCjNg2
  uDxe4lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8wsBEIMSTmVcCN/0V0GImoMXONWCLSxI
  RUlINTBN/XG899OLhIpPzGT/SHk1tqi7fOsn+zOGb30Xn3sr53PvdNE6tPi/xaMEyzcXLpsX9
  OD4jfWrgf6uICfmJq//P+7Vs1aMC2fynTnMval4sSPc4dNAiZHLvj0Jx7jqH4B52pzeSrEfu/
  4lgXVa4eUvuw4yNF3l7p3DMN3nX2HNsx5c7dq/178vkTMh9eifHb+mC5nfPRWouTWNQDDWz07
  7c4mL8WDi3Ld9fs3jzDHetdReviLkflTk+tbxy0pcwu65gZjNX5nj3/9kfxU1LAkxP+k57sur
  +5MMH85oFw6Y/T1956GPc3yMHAmv4Cl6vjzeyZ16yKm+CWeY7Ay1tmSg5+d9sjEbCYkoFry4/
  YFdiKc5INNRiLipOBAA9IDBaWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1679617790!254847!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15444 invoked from network); 24 Mar 2023 00:29:50 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:29:50 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3E1BE10019F
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:29:50 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2FDF610019E
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:29:50 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:29:48 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-chess: upgrade 43.1 -> 43.2
Date: Fri, 24 Mar 2023 08:29:24 +0800
Message-ID: <1679617764-27268-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679617764-27268-1-git-send-email-wangmy@fujitsu.com>
References: <1679617764-27268-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101687

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- help: remove references to mailing lists
- Updated translations

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnome-chess/{gnome-chess_43.1.bb => gnome-chess_43.2.bb}   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-chess/{gnome-chess_43.1.bb => gnome-chess_43.2.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1.bb b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1.bb
rename to meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb
index 643e6befeb..343135bfa8 100644
--- a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb
@@ -29,7 +29,6 @@ inherit meson pkgconfig gobject-introspection gtk-icon-cache vala features_check
 GIR_MESON_OPTION = ""
 
 S = "${WORKDIR}/git"
-PV = "43.1"
-SRCREV = "95c7fb91daf36014fc1c2a7ec20b7400a21cd316"
+SRCREV = "de47d07ec6fc828b2668ca6ee59fe9bdfa9dc1d6"
 
 FILES:${PN} += "${datadir}"
-- 
2.34.1


