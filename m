Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3B9C77B61
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:33:09 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.43269.1682307185866752376
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YSJC31Tx;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682307184; i=@fujitsu.com;
	bh=HYysO5xbMkVwfI3Tc2G09XJC/c8Klo4awnz4Ia3qKuA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YSJC31Tx7gnJL+BUiaPtwMNG+dFz1c4guB/LVW20rgk32S8knt6ebio22EeNhO+9l
	 VDwmHwtw+gdGybrGhq3jQ7+/x5NtoQAIWjC3BLpfCt5mlaW2TxlGsIe+cS2pRdaKwX
	 Aa71fJxcJxoJoLhwDMbro5U1zHObAn/ngNn7S/SFfK21pgoMJdQr6iwhCF6YVFCHEI
	 ywxaXxnotiaccg6DSKBuTez9E+NGjLFOxw8AWO1AhGBqhCawPNSO/Ka0ZfJArdDgsD
	 ntmfmRxyRwqWMyMhgLbkiEoazNa9hcgy015WNa2VVhz72Jz2/523f9nM7fWhfE1K1X
	 StmHfMkMfDYPg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWTf/h2u
  KwdrdNhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a9q4vZCl5zVOx7d4exgfE9excjF4eQwENG
  ie4ln5khnKtMEpdebWSFcPYySrx88papi5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBd4lHTdNYuhg5OFgEVCW6G8RBwrwCThInG1rAxkgIKEhMefgerJVTwFniys61TCDlQk
  A1kzq0IcoFJU7OfMICMV1C4uCLF8wQrYoSsy83s0DYlRKtH35B2WoSV89tYp7AKDgLSfssJO0
  LGJlWMZoWpxaVpRbpmuolFWWmZ5TkJmbm6CVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfmJuek
  6OWllmxiBAZuSrGi0Q7GJzv/6h1ilORgUhLlXbLBJUWILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  G/RJ9cUIcGi1PTUirTMHGAUwaQlOHiURHiXfQFK8xYXJOYWZ6ZDpE4xKkqJ89p+B0oIgCQySv
  Pg2mCRe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK/kB6ApPJl5JXDTXwEtZgJavIvbBWR
  xSSJCSqqBKdR1XbnslnW/Ts404Fr8SiA04UMq268IjaMzxG+z7GE05D+0Xk4k/0FS0ZfUkBzJ
  BX+qS/M/HHvrZLO2dqJO3PPdausPJWzg75HyPJ/99WDLoh1/YoQ3/+1+nm+1ymO+/5yZUZX13
  HtNT31teWHpJdNvnnlpVfQtdb5HFzrkpUsP+i0VWbw9OX/zucu3UmcJGDfv/yKxX8nk5/4dNS
  wJaaUBLasS24Oe7Xc9ai/T8Mh//15tvoAt61XOnzTzt/NnM50f/XvZjYyA6siaXb8y+Bc//R9
  0tuuV/rKHvrn9j1rPeT+Irj96zs/n6tNJws+6971uOvrpdNzKI/elzJTZhBMbpI/t0o/fffft
  qbO8Z5RYijMSDbWYi4oTAUkT5PRXAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-571.messagelabs.com!1682307183!123944!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12501 invoked from network); 24 Apr 2023 03:33:03 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:33:03 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id B2E51154
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:33:03 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id A6942142
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:33:03 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:33:02 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] samba: upgrade 4.18.1 -> 4.18.2
Date: Mon, 24 Apr 2023 11:32:40 +0800
Message-ID: <1682307162-12043-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682307162-12043-1-git-send-email-wangmy@fujitsu.com>
References: <1682307162-12043-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102176

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../samba/{samba_4.18.1.bb => samba_4.18.2.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.18.1.bb => samba_4.18.2.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.18.1.bb b/meta-networking/recipes-connectivity/samba/samba_4.18.2.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.18.1.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.18.2.bb
index 7992fa968..51b0ca751 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.18.1.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.18.2.bb
@@ -32,7 +32,7 @@ SRC_URI:append:libc-musl = " \
            file://cmocka-uintptr_t.patch \
            "
 
-SRC_URI[sha256sum] = "cedeaa2f244a0862c4f73b7b9f2ff92d181fd3ba7df80284a2f25f7713b9cc0e"
+SRC_URI[sha256sum] = "5bf87e179616cd12a52d85fb8b26eec709f13709a2b67fe42b1fb0213f7e8106"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.18(\.\d+)+).tar.gz"
 
-- 
2.34.1


