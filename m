Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web08.2667.1623982820684593727
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jun 2021 19:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YrwGf6BX;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623982819; i=@fujitsu.com;
	bh=zzWC4ir0o52UvgMMr3M3BWZWJ1/GrJbc6wM9lxCSFrs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=YrwGf6BXLtMGz3xovU3idoSDGNzBoKbAxZaoijXm7pqYpLD1d6bkqtSM8YKXfCu8U
	 rX/z4u3/YKI1O0fCfozUxPeW92625ktmXJN+wl4wh95ACU0jpRdoYHh0l3ym0nf6NL
	 Irnrr/RvkNNo2QfZoHRu6WPw5ByQJhaHpZq9hR78I5mKkuQc/utAyORTlns2Q3K5/R
	 OVk2a+OFGzkMguY1zI6pq/rt/Nar65MUA+zm4QNIegRLE73wNpmbWm9XX9ibBCDGAJ
	 /g9v3KlPI68bOIHqGlcaS8WOc+2lEsRRKZl6iIJKWmy86lF/JhlDF8xAypVRC8JiLx
	 oX2qyqIYSgOtg==
Received: from [100.112.193.7] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id EF/99-34775-2E20CC06; Fri, 18 Jun 2021 02:20:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI1X3EdCb
  B4PN0SYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP+roVsBQ0cFX1X2pkbGNexdzFycggJzGaS
  +Lqdo4uRC8g+wSgx6fdDFpAEm4CORMeLbjBbREBfYunsPcwgtrCAhcSaPZfAbBYBVYntJ48D2
  RwcvAJuQPVFIGEJAQWJKQ/fg5XwCghKnJz5BGwMs4CExMEXL5ghahQltu88wwJhV0jMmLGNbQ
  IjzywkLbOQtCxgZFrFaJFUlJmeUZKbmJmja2hgoGtoaKRraGmka2RgopdYpZuol1qqW55aXKJ
  rqJdYXqxXXJmbnJOil5dasokRGEQpBQfO7GA89fqD3iFGSQ4mJVFeq5enE4T4kvJTKjMSizPi
  i0pzUosPMcpwcChJ8N5iPJMgJFiUmp5akZaZAwxomLQEB4+SCK81MKiFeIsLEnOLM9MhUqcYF
  aXEee1AEgIgiYzSPLg2WBRdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMuw1kO09mXgnc9F
  dAi5mAFrcJnQJZXJKIkJJqYOJQWvlUbsm82zNueh1umhbecUJ5jXRC26x0FW/+N1bOyhdvzjx
  5ZNXNNX/X/P8v2XI33f9C0OfGSZ/nOl54uedW4Ffjw/HyLzl/hzTsmBhw8eWFgF+P978/9KK2
  9lNehvosPY0njNyTSmb7hD9SUQyfI8bj6VF6gH/39cZz7Bd2dFc07stnSVjefqRim8VT8Synq
  8xtD05e/nNEWumRW6ra/UeMbw7MPOB4ZRpz5+TDK1z1VD/YVyYc3hScljHP6ULrYYs5Ycqf65
  d+OZ/8MLpd2jZ1+rTGzrJl8+zFl+fd3movW7hwj5/n3U1iM9jtl709LjcvLbXz2zuZi/uP8nM
  k+x99/eXrXK7981jLI9e4K7EUZyQaajEXFScCAJW+4k4dAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-265.messagelabs.com!1623982818!90742!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29603 invoked from network); 18 Jun 2021 02:20:18 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-10.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Jun 2021 02:20:18 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15I2KI2v032642
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Jun 2021 03:20:18 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 18 Jun 2021 03:20:16 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] nano: upgrade 5.7 -> 5.8
Date: Fri, 18 Jun 2021 22:20:09 +0800
Message-ID: <1624026009-7865-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_5.7.bb => nano_5.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_5.7.bb => nano_5.8.bb} (88%)

diff --git a/meta-oe/recipes-support/nano/nano_5.7.bb b/meta-oe/recipes-support/nano/nano_5.8.bb
similarity index 88%
rename from meta-oe/recipes-support/nano/nano_5.7.bb
rename to meta-oe/recipes-support/nano/nano_5.8.bb
index 6a293c7635..8ba4ca13f0 100644
--- a/meta-oe/recipes-support/nano/nano_5.7.bb
+++ b/meta-oe/recipes-support/nano/nano_5.8.bb
@@ -13,7 +13,7 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d4b181cc2ec11def3711b4649e34f2be7a668e70ab506860514031d069cccafa"
+SRC_URI[sha256sum] = "e43b63db2f78336e2aa123e8d015dbabc1720a15361714bfd4b1bb4e5e87768c"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.25.1

