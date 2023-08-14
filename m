Return-Path: <M.Vovard@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D01C001DB
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 14:43:34 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web10.109402.1692024210033814722
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Aug 2023 07:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=a4 header.b=ruHsdyQV;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: m.vovard@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1692024207; x=1694616207;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4lNCRw+EWczKERq8AJVfNZuSflME78tIDhBhmYxNM0w=;
	b=ruHsdyQVgjRHtT4N1HReyXoWP+M19QRHN6lqngF8Adc63nfP6qzsV5yEljPtRCT9
	OgpdidG2FOhmjga4TV7vcOloD06AC5K5zD1Wjw1tWTstgneCbjklk/yjgTinMt/y
	c/MieSo0Hqvt+fDwHZAWH7p4kUkDHFDu0loiz2GKS7s=;
X-AuditID: ac14000a-923ff70000007ecb-aa-64da3d8ff18a
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id E8.19.32459.F8D3AD46; Mon, 14 Aug 2023 16:43:27 +0200 (CEST)
Received: from augenblix2.phytec.de (172.25.0.11) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 14 Aug
 2023 16:43:26 +0200
From: Marine Vovard <m.vovard@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 0/1] Remove X11 from REQUIRED_DISTRO_FEATURES from Kivy 
Date: Mon, 14 Aug 2023 16:43:03 +0200
Message-ID: <20230814144304.2395362-1-m.vovard@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphluLIzCtJLcpLzFFi42JZI8nAq9tveyvFoLGB3eLi4aXMDowe5zau
	YAxgjOKySUnNySxLLdK3S+DKOP70KVPBa6aKT9O1GxgXM3UxcnJICJhIPLi+g72LkYtDSGAJ
	k8TyptOsEM4TRokTD98zdzFycLAJaEisO+oI0iAioC+xdPYeZhBbWCBU4vmJI2CDWARUJZ5e
	PQQW5xWwlJjQ3cMCsUBeYual7+wQcUGJkzOfgMWZgeLNW2czQ9gSEgdfvACzhYDiC95fYYPp
	nXbuNTOEHSoxf8139gmM/LOQjJqFZNQsJKMWMDKvYhTKzUzOTi3KzNYryKgsSU3WS0ndxAgK
	MREGrh2MfXM8DjEycTAeYpTgYFYS4e3hvZUixJuSWFmVWpQfX1Sak1p8iFGag0VJnPd+D1Oi
	kEB6YklqdmpqQWoRTJaJg1OqgXHjroOrmucXZG/w+2X37GWRd9RrrV8737quViu9EqQxbUPa
	FbMvKYI/LDrKowI5isLKKhgKdW7PKfc7mNPwX0NsSUuvQtP0qZ9VBRu22Lzz/uzQKikq9Dpa
	6eDEWv3d/w8Ernh/YBpP/VU/ua6zv89z5co+jzj0Qst3pnCAvtpnkyXRfC//KiqxFGckGmox
	FxUnAgDhOgdQHwIAAA==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Aug 2023 14:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104349

I'm not sure if removing X11 is the good option. Maybe we could try to
say it's either Wayland or X11 in the distro if it's possible with
Yocto.

Marine Vovard (1):
  python3-kivy: Remove X11 from REQUIRED_DISTRO_FEATURES

 meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.25.1


