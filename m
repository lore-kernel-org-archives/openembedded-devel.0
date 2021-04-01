Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.67])
 by mx.groups.io with SMTP id smtpd.web11.2192.1617244179743974492
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 19:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LIK+msCB;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.67, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617244178; i=@fujitsu.com;
	bh=2WtKfNOCSpFSue7/sgc0FTKyH6i+nfoDo/YJACQ4gqY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LIK+msCBketsi35FQLRO2Vg5g346VsxpF3OwiU0fc23PAdNWtnzWrXkHMPhLz/ryV
	 hsuscnwbJwJzDD/cJOunwE0AAmRNzKRbHUCe37dHT9gN1gERfFXDKFRo2JDD5t9cJR
	 76CFqtQTQhPVF2XvkrzvoBMktZGmKgxqNsHsJZ9PlA0NOr+eJkpXxnPZfak6b0fn/8
	 LR7NGuAS6n5vHmKIUVJN0JzvMXV7uC20tT5ZhSc+Jr2VwhkH5LI4Oaj1x421adwNl8
	 4YfvnnD7k5Vjs/lXn8e7w4vrF1t6vHHfAvoFPzNXNsMHLJzeu3UFGUgqzXZtdUFx41
	 narRWHR6qfj/g==
Received: from [100.112.196.73] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 3D/5F-55620-21035606; Thu, 01 Apr 2021 02:29:38 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRWlGSWpSXmKPExsViZ8MxVVfQIDX
  B4MVdY4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePeh6+MBb08FWv+zGBuYPzL1cXIxSEksJVJ
  4tz8t+xdjJxAznFGiV9bpEFsNgEdiY4X3SwgtoiAvsTS2XuYQWxhAUuJNSt/sILYLAIqEk/fz
  ATr5RVwl/jW+hisXkJAQWLKw/fMEHFBiZMzn4DFmQUkJA6+eMEMUaMosX3nGaj6Komzs78wTW
  DkmYWkZRaSlgWMTKsYLZKKMtMzSnITM3N0DQ0MdA0NjXQNLS10jQxN9RKrdJP0Ukt1y1OLS3Q
  N9RLLi/WKK3OTc1L08lJLNjECwyil4Nj1HYxXX3/QO8QoycGkJMo7ZVpKghBfUn5KZUZicUZ8
  UWlOavEhRhkODiUJXhf91AQhwaLU9NSKtMwcYEjDpCU4eJREeG00gNK8xQWJucWZ6RCpU4y6H
  Jevz1vELMSSl5+XKiXOy6UHVCQAUpRRmgc3AhZflxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMC
  oJ80aBXMKTmVcCt+kV0BFMQEdceZQIckRJIkJKqoGp7kx3S6iEaJ3cQTF9y+9VJpVqrXsnHHg
  065vj266HHWa7d1Z6Jcz045su6aa74Xi/7DSz9zdeKNVZnJzya8dGe4btC26VOJxwVeDhm7qV
  s/TR4Yf1M5kdzn1dMJn5/3KLvsuva/keXvFdXSWU2zjp9OWJltmf03TNki7rv408JHz96MUP3
  +afeqUQy7v2jECrc82C6WtTr+8N5/nlKK6h/jsjc+NE9tcu56/7GG15yGCZ7ZG/QYtx4zJuPq
  v8h3dOZXU3JEkFzV+87vdu3ctVThYKjz9ci7zx87hYLl+s2c6sXzNWKEa+42wzcs7Zdu3FZzP
  lFp1v63MiTdIXhriKHIj6/YXBx5L3UmnOCQlpJZbijERDLeai4kQAh2qoZCoDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-291.messagelabs.com!1617244177!93600!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25146 invoked from network); 1 Apr 2021 02:29:37 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-2.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Apr 2021 02:29:37 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1312Tbsm026695
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Apr 2021 03:29:37 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 1 Apr 2021 03:29:36 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] xterm: upgrade 366 -> 367
Date: Thu, 1 Apr 2021 10:29:30 +0800
Message-ID: <1617244170-92064-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_366.bb => xterm_367.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_366.bb => xterm_367.bb} (89%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_366.bb b/meta-oe/recipes-graphics/xorg-app/xterm_367.bb
similarity index 89%
rename from meta-oe/recipes-graphics/xorg-app/xterm_366.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_367.bb
index 969159bc5..e0d3dcec1 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_366.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_367.bb
@@ -2,13 +2,13 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
 DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses desktop-file-utils-native"
 
-LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=996b1ce0584c0747b17b57654cc81e8e"
+LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=987de9787175385203a1ea2482246a17"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[sha256sum] = "858b2885963fe97e712739066aadc1baeba2b33a0016303a7fec7d38bc73bf6e"
+SRC_URI[sha256sum] = "27f1a8b1c756e269fd5684e60802b545f0be9b36b8b5d6bdbc840c6b000dc51f"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.25.1

