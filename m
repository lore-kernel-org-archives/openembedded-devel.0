Return-Path: <M.Vovard@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1797DC04A6A
	for <webhook@archiver.kernel.org>; Mon, 14 Aug 2023 14:43:34 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web10.109402.1692024210033814722
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Aug 2023 07:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=a4 header.b=uAoRY991;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: m.vovard@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1692024207; x=1694616207;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QbFAmE5VRy0xRytyA/CfdiRWFhygxX/+o26MP1CAgmk=;
	b=uAoRY991hEICIHe7asuRFkYgxR3pm18VoqS3z4EPASrOpSvqHzQwu+qIrQCUFd5P
	1mzYz0ng84uj5qCLg0nihdxBD4GhDNbLANm0LKRfTWiK2OgUTWdES6NnNR/cv97F
	BNceCAynmud8jlgAM3xAhsXly3Y9mjCRke60efjsXxQ=;
X-AuditID: ac14000a-917fe70000007ecb-ab-64da3d8fff7c
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 09.19.32459.F8D3AD46; Mon, 14 Aug 2023 16:43:27 +0200 (CEST)
Received: from augenblix2.phytec.de (172.25.0.11) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 14 Aug
 2023 16:43:27 +0200
From: Marine Vovard <m.vovard@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 1/1] python3-kivy: Remove X11 from REQUIRED_DISTRO_FEATURES
Date: Mon, 14 Aug 2023 16:43:04 +0200
Message-ID: <20230814144304.2395362-2-m.vovard@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230814144304.2395362-1-m.vovard@phytec.de>
References: <20230814144304.2395362-1-m.vovard@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMLMWRmVeSWpSXmKPExsWyRpKBV7ff9laKQcc/fouLh5cyOzB6nNu4
	gjGAMYrLJiU1J7MstUjfLoErY/+Mk8wF19gqnm55wt7A+Iq1i5GDQ0LAROLdr8IuRi4OIYEl
	TBKbZ3SzdzFyAjlPGCXWXdECqWET0JBYd9QRJCwioC+xdPYeZhBbWCBC4lH/bUYQm0VAVWLG
	mw9gcV4BS4mmBydYQWwJAXmJmZe+g43kFLCSOH/3M9R4S4ldTScYIeoFJU7OfMICYjMD1Tdv
	nc0MYUtIHHzxghmiXl5iwfsrbDAzp517zQxhh0rMX/OdfQKj4Cwko2YhGTULyagFjMyrGIVy
	M5OzU4sys/UKMipLUpP1UlI3MYICUoSBawdj3xyPQ4xMHIyHGCU4mJVEeHt4b6UI8aYkVlal
	FuXHF5XmpBYfYpTmYFES573fw5QoJJCeWJKanZpakFoEk2Xi4JRqYMyYvCEvx9VBL+wwA4ch
	W/7laxelAry+P1+/irFy0b7tL5/b74nJ0wk/Kvu582q5/tu7t49+yZbz36jmkD//u+DczL/+
	Kz+cZFM9+dooVb9U8YRCw9fD1/eG8kw53yYkZJxRp1le+q7ypes309LztrcdfN2M2zgbt04M
	keRqt+9YMuf/+ee885RYijMSDbWYi4oTAfaByHc2AgAA
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Aug 2023 14:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104350

We can use pure Wayland and therefore X11 is not required all the time.

Signed-off-by: Marine Vovard <m.vovard@phytec.de>
---
 meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb b/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
index ca1fc5f96..93894c860 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.1.0..bb
@@ -43,7 +43,7 @@ export KIVY_GRAPHICS
 KIVY_CROSS_SYSROOT="${RECIPE_SYSROOT}"
 export KIVY_CROSS_SYSROOT
 
-REQUIRED_DISTRO_FEATURES += "x11 opengl gobject-introspection-data"
+REQUIRED_DISTRO_FEATURES += "opengl gobject-introspection-data"
 
 DEPENDS += " \
     gstreamer1.0 \
-- 
2.25.1


