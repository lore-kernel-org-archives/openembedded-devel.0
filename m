Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web10.2638.1631156835147632092
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 20:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kkZwp5UW;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631156833; i=@fujitsu.com;
	bh=imGHZQmOgBjf19HzIW6D/HheBY87riloBhVO/rNoMRs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kkZwp5UWp9Rx9UFyU8P8+1wSxcgYo6OF78IWKpLTmsinoV4CKiUmha9tmnNSqwWTu
	 PddrVqGIIovASpGa2Kk7jvvjDziwKX1XqcGWhd1DkpbP9WRG3AWbdFM+lnRDL6u4/f
	 5lK2L9Rlr6CfOSuBLqULbHRUJPxxqsf+DPMb6cr9oyW79J6RWLoi9PMAvUT58MXVZm
	 20OO/TSXfy5XFcnBpdM8Tv+mpYWW/0N4f+pVfuwQTG71MtFX2jwurkvRWgXMk0YP9a
	 kfvzQhIhm+tdVcSDzC+Fav4KPMWDra9hMIMLNPaeR8nliTRJg2hHhAh87IUARyxq98
	 eN/iYwihaF7ng==
Received: from [100.112.195.47] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id D7/82-01625-16A79316; Thu, 09 Sep 2021 03:07:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI1U2oskw
  0aJljZHHx8FJmB0aPcxtXMAYwRrFm5iXlVySwZsz7dYC9YBdnxZ4DjUwNjNc4uhi5OIQEZjFJ
  XNnxggXC2c0o8bjlI1MXIycHm4CuxLnHa9lBbBEBfYmls/cwg9jCAt4S198tA6thEVCR2LPgC
  ZjNK+AhsWRCGxuILSGgIDHl4XtmiLigxMmZT1hAbGYBCYmDL14AxTmAahQlZk+XhyivkHh9+B
  LzBEaeWUg6ZiHpWMDItIrRPKkoMz2jJDcxM0fX0MBA19DQSNfQ0kjXxEQvsUo3US+1VLc8tbh
  E11AvsbxYr7gyNzknRS8vtWQTIzCIUgoO6Oxg/Pnqg94hRkkOJiVR3gZhy0QhvqT8lMqMxOKM
  +KLSnNTiQ4wyHBxKErwHK4BygkWp6akVaZk5wICGSUtw8CiJ8H4oA0rzFhck5hZnpkOkTjEqS
  onzPgXpEwBJZJTmwbXBougSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHe/yBTeDLzSuCmvw
  JazAS02PeaBcjikkSElFQD09wjf2bvS2p2/L3l4u2F9YzJz0tfSJ16ePAJb6ngT9brtZe4dyt
  fnnrvy8tfypn3j/8RvKy9lmHBk087eiYKrE7h5/3uPYnjjez3m253nh3f/3beHtXOWw8MVgnO
  Zay3qj7bJ3nbxLiqPfJEeMz9HSqntExPe7AlLNv2lPm9Accu/WsXTEJz1E1zD3k6C+7cmmQix
  7g9l3tX5cEcluk5Fic0J8xqnrNpmzyb47fiFdtWvXX4WfbzZ1rxCYuHWqphqrv8Gv3vVK589F
  j3sBuPx+ItPC4Ri1hesz41fPbrrOccBb4vOTu85gk1zXQ9dIHlsaPv59SNbQ6n0g/FyTiufh+
  rLLefYa+EQruX1uL6jiwlluKMREMt5qLiRABJZK9pHQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-267.messagelabs.com!1631156832!108921!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30679 invoked from network); 9 Sep 2021 03:07:12 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-20.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Sep 2021 03:07:12 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18937Clc028328
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Sep 2021 04:07:12 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 9 Sep 2021 04:07:11 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] mosquitto: upgrade 2.0.11 -> 2.0.12
Date: Wed, 8 Sep 2021 08:16:40 +0800
Message-ID: <1631060200-96208-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../mosquitto/{mosquitto_2.0.11.bb => mosquitto_2.0.12.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.11.bb => mosquitto_2.0.12.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.11.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.12.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.11.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.12.bb
index 9a13e2bc63..2df400846e 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.11.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.12.bb
@@ -19,8 +19,7 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://1571.patch \
 "
 
-SRC_URI[md5sum] = "638d801e6aac611b41de76d030951612"
-SRC_URI[sha256sum] = "7b36a7198bce85cf31b132f5c6ee36dcf5dadf86fb768501eb1e11ce95d4f78a"
+SRC_URI[sha256sum] = "31cf0065cb431d6f4e57a5f4d56663e839c9d177362eff89582d7cfde191c933"
 
 inherit systemd update-rc.d useradd cmake
 
-- 
2.25.1

