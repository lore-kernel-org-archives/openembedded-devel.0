Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.2117.1617244151343143630
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 19:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=D/DyQr+3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617244149; i=@fujitsu.com;
	bh=unYWbNp3HUCzRU33MneVgRDYVPtwKQhJxrrfpGYKW6Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=D/DyQr+3TGsaVce/FsBo8/igAbR9dxgmVUtxL2K+AvO6+sPV3fyHLErWRInvv7wMn
	 Lwkk3ZL3gV7J6bTbkytl+u10NsWhmw46kBXoeUjVS6Hyzb+IjRjZ32qI6zUfDc6Y36
	 CLC9mZl+6R2eRkJkJe9X1lRWZX3jFGo4QMDTNhrx0sTEE/JMzM+izIaZIR8nOejvne
	 leqIE/AyX7rwvRowdTa1be4U0nl2v1Lw/GGcQZTDO0WyF88dgUeHzmeWhGsIl6Jder
	 WveHEmX+pJ8qw6iWxVKsPwF2LeRh3QCNyW8rlP9c/SwOzaJbXlfOTM2mIpUYnIJk3V
	 6haJ3HvJ0sD8A==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id F8/C7-55623-5FF25606; Thu, 01 Apr 2021 02:29:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRqvtFPzX
  BYPs2a4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePBpuvsBT2cFf19f1kaGBdzdDFycQgJbGWS
  2Ph7MhuEc5xR4vPaJqYuRk4ONgEdiY4X3SwgtoiAvsTS2XuYuxg5OIQFHCS+nkoGCbMIqEisv
  /KLEcTmFXCXmLbsEiuILSGgIDHl4XtmiLigxMmZT8DGMAtISBx88YIZokZRYvvOMywQdpXE2d
  lfmCYw8sxC0jILScsCRqZVjJZJRZnpGSW5iZk5uoYGBrqGhsa6xrqGliZ6iVW6iXqppbrJqXk
  lRYlAWb3E8mK94src5JwUvbzUkk2MwEBKKWQ+tIPxyesPeocYJTmYlER5p0xLSRDiS8pPqcxI
  LM6ILyrNSS0+xCjDwaEkwesCDE0hwaLU9NSKtMwcYFDDpCU4eJREeG00gNK8xQWJucWZ6RCpU
  4y6HJevz1vELMSSl5+XKiXOy6UHVCQAUpRRmgc3AhZhlxhlpYR5GRkYGIR4ClKLcjNLUOVfMY
  pzMCoJ80aBXMKTmVcCt+kV0BFMQEdceZQIckRJIkJKqoGJLSvCviDHsPn8yaD2xHvKVbziOg0
  lb++HybRX7r0i1bRkw+P5OVpKJW0cSV0hwYpMwVblVQf+8feo9dytqZqz1WNlp7fqvCXuuc9n
  zvmV1elfYrLQoj/okbSMwX+7Sb96lDcpP7v/ZFPT1SrJ6vp/qktO3vY/3y98Qai9dbVSMkP/M
  6YVUvtjuX8/9ff7rsE242aqtGbuscIKEcX/qeZT5cU7+MotKxx+yxZ4K01hf7dsiXPl1vBlqx
  Va3laKxny40jpfbXehgPx0/zcKT9awJyyPcp0r+XjxCf/Vn8XC04scNsjsLDvDuDbk0c0s3bv
  Zp9c1rZdtuqfx9/V3ieiJBhJ7O/c+U519btFXayWW4oxEQy3mouJEAJGETZcrAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-228.messagelabs.com!1617244148!437218!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23634 invoked from network); 1 Apr 2021 02:29:08 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-2.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Apr 2021 02:29:08 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1312T8sF006314
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Apr 2021 03:29:08 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 1 Apr 2021 03:29:06 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libxaw: upgrade 1.0.13 -> 1.0.14
Date: Thu, 1 Apr 2021 10:29:00 +0800
Message-ID: <1617244140-91947-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../xorg-lib/{libxaw_1.0.13.bb => libxaw_1.0.14.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-lib/{libxaw_1.0.13.bb => libxaw_1.0.14.bb} (83%)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
similarity index 83%
rename from meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb
rename to meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
index cb1ffcd8c..1783ee8fb 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
 PE = "1"
 PR = "r2"
 
-SRC_URI[md5sum] = "e5e06eb14a608b58746bdd1c0bd7b8e3"
-SRC_URI[sha256sum] = "8ef8067312571292ccc2bbe94c41109dcf022ea5a4ec71656a83d8cce9edb0cd"
+SRC_URI[md5sum] = "c1ce21c296bbf3da3e30cf651649563e"
+SRC_URI[sha256sum] = "76aef98ea3df92615faec28004b5ce4e5c6855e716fa16de40c32030722a6f8e"
 
 do_install_append () {
     ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
-- 
2.25.1

