Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F966C433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 07:45:25 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.15993.1668843920495280256
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 23:45:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AUSUFiM9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668843918; i=@fujitsu.com;
	bh=zWfoPniqHGA8quYX1jugCpbMT+pN4eT02MoCEGpHKGU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AUSUFiM9aIMMKhA9YNaeof4vNWlxjTJNm6uRz0QRawylu2AbHM69owyL52woPj3bF
	 NJooZIjTlP9gU8aB+BxpTpgNXwqTwx8qrd5JPxwFLyxsg55JlI3X1rUqOUW9+5CRAY
	 ytxBmJImh4RNrDExkZL8TkEziGD/bxES0mOukW6FKZqmRX5dfc/+lR/qFYto20/t6j
	 aZvpVaacB+/qqYNVvKPcPPQUxkV03MOnpX9xZrcvIspJmig93a+sel3s6h1sLqMWr/
	 8UF04F+mXHqFjUH/VzaQ2mvkemCuwEvXF+4dTq9TC/XwW2i80b531+xP76TQUaMKV1
	 23qIPf+PNDD1A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8MxSbe3syL
  ZYNY7PouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePDAbaCrbwVzbOnszQwruXpYuTiEBJ4wijR
  dukKWxcjJ5BznUmif5IBRGIPo0TTmimMIAk2ASmJG/f/gxWJCOhLLJ29hxnEZhZQkXjxu4cdx
  BYWiJDo/vieCcRmEVCVOL5pM1g9r4CjxIIJz8DiEgIKElMevmeGiAtKnJz5hAVijoTEwRcvmC
  FqFCVmX25mgbArJGbNaoPqVZO4em4T8wRG/llI2mchaV/AyLSK0aw4tagstUjX0EAvqSgzPaM
  kNzEzRy+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzAUU4pZ4ncwPlz2R+8Q
  oyQHk5Io79728mQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErxxbRXJQoJFqempFWmZOcC4gElLc
  PAoifCK+ACleYsLEnOLM9MhUqcYdTlmfm07wCzEkpeflyolzlvfDlQkAFKUUZoHNwIWo5cYZa
  WEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMeBZnCk5lXArfpFdARTEBH5DiXgRxRkoiQkmpgKlk
  fHl/xU/fril1H+xb1/LLceXwNq6AFM1OyCPuqEOUst5KNnSWVJj/13D/uP8ZmsSjniOiLNFdv
  J//zql+Mvx1fJ7eW04w1+WTm81Sv49oqau/Mp0rx3u3hF6t7d2G/lOdOnpeXhd6z9ao+ikhmu
  BPxn83Uwtm36uFBtihvhXkTit1a73GzJX5Ofc5fXle+6DD35CkXmcsOl4WbzN709X6QSk/gpG
  1fr7erpUc7rf06cU7tiV3ve0IW/CqRcd7vscx9f8ah+s3/Tz6foOVn0+bK7dOzyeRi3R3Vz5b
  ZRxLfB8z9eSXokqzP30XC6RXJU6OY/P/OPcCblzbTVHKW4vn6jP0n+vwDMpJ+X2dQYinOSDTU
  Yi4qTgQA5e3YKkwDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-591.messagelabs.com!1668843917!177522!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1862 invoked from network); 19 Nov 2022 07:45:17 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-6.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Nov 2022 07:45:17 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D9FE41039DD
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:45:16 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id CD2C31039DA
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:45:16 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 19 Nov 2022 07:45:15 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] networkmanager-openvpn: upgrade 1.10.0 -> 1.10.2
Date: Sat, 19 Nov 2022 15:44:53 +0800
Message-ID: <1668843897-3019-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99631

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* IP condfiguration is no longer required in TAP mode.
* Fix initialization of secret flags.
* Add support for DOMAIN-SEARCH option.
* Set data-ciphers option with chosen cipher.
* Update Brazilian Portuguese, Croatian, Danish, Georgian, Polish, Serbian,
  Slovenian, Swedish, Turkish and Ukrainian translations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nager-openvpn_1.10.0.bb => networkmanager-openvpn_1.10.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.10.0.bb => networkmanager-openvpn_1.10.2.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.0.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb
index 1fcb43539..3114731f2 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.10.2.bb
@@ -10,7 +10,7 @@ inherit gnomebase useradd gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5745d4107f3398a97afbb93f69239b510c9e45eb7fb62d60d9ed0a7297f4d101"
+SRC_URI[sha256sum] = "62f0f2a8782221b923f212ac2a8ebbc1002efd6a90ee945dad4adfb56d076d21"
 
 S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
 
-- 
2.25.1


