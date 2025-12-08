Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA88D3B7DD
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 08:45:50 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3951.1765183485886629124
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 00:44:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@schnwalter.eu header.s=fm2 header.b=lslogDA+;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=lP9QtClo;
 spf=pass (domain: schnwalter.eu, ip: 103.168.172.158, mailfrom: contact@schnwalter.eu)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E2E9B14000FA;
	Mon,  8 Dec 2025 03:44:44 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 08 Dec 2025 03:44:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm2; t=1765183484; x=
	1765269884; bh=L9WW2yDS1pQLCgi3Pz3fDt2IfG6v5v0slBYkrJjnM4s=; b=l
	slogDA+EtUYnLIPWJtpdok3cgN6/eZSxuQEeaeygo0572ZnWODUILGMAZtrO7CHa
	siKSWZf+6Ux+lbCY8Tmm0NoChdZg6M/c5TeFiaXTeJ1Brp72z+4O33psqdJ8QMNd
	jgwlp50X2hoI8NXpCbsI+9xs9TGwQLJG5mXoh2dIRjydFsRQ8Z9MAq2a03sxK292
	5rxxRTzejMpwKIh6g+QIinY2UCxfv7B7vwt2Kjagg1PABJfEpWwmgzhKr8sNdNrJ
	sOHOycYwg4kec+NF6/Fnv/qI9X0laTfkaSkHUu2hWYV2oPKvc+2RUCe2ww+Z24AT
	SB2WrrEHxDTRxhniXeK9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1765183484; x=1765269884; bh=L9WW2yDS1pQLCgi3Pz3fDt2IfG6v
	5v0slBYkrJjnM4s=; b=lP9QtCloyUUgwSOvgy8l9nmJubtDvQM3Fof/t+9oTDWN
	itO3OhexPqpMM+ynPypc3ecNwK2/OHLJQAcSwDA2EYKMzWTu0GzNE44S7OcpH7W6
	QJpRzVIXI7yJug1EklVvBf44fgohPsLgJhXjrQFyCtJ+b7T5aVnu13euWPHT8i/p
	/OMyKYyF6B/nLQLOToWIiaFoEKj1G5V0gulyrmpLe1zMYn8WuMImfJVnAFQgau32
	LPjALSVTXqXWIOH20qIWOi3xXq0KAEfL1dRzb4JPH8trmealJuEhzH+7Ggk3YSr6
	i78pSV7MT1+f91oMgpNFT3f8TcsgS3svMi1fvUwEnQ==
X-ME-Sender: <xms:_I82ab9WoHwbF3qa50U2DVyLYjuxJ8kxMrHKav_ymHAxS_USUN80mQ>
    <xme:_I82adso3JBy9X1rmdxszE9hndVWbUFbjsD-FyOLXjPq1y_lT8bt3zRt2xO48S38i
    L-n0fAt0Zi-HM13aqAyuxGCgyA2sYefmBZ0vu2jlBsiEVehD5xGoeQ>
X-ME-Received: <xmr:_I82aWodn0JBovmS_JNyNnTeG00vHyVXBYtI2COpDGHEdPteX1WkPTwzKnE8xbo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhephfffufggtgfgkffvvefosehtjeertdertd
    ejnecuhfhrohhmpeghrghlthgvrhcuhggvrhhnvghrucfuvefjpffgkfffgfftuceotgho
    nhhtrggtthesshgthhhnfigrlhhtvghrrdgvuheqnecuggftrfgrthhtvghrnhepgeelte
    ejiefhhfdtheefgeejfffgfeetieekueeutdekuedugfeujedvtdehjedvnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheptghonhhtrggtthessh
    gthhhnfigrlhhtvghrrdgvuhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtoheptghonhhtrggtthesshgthhhnfigrlhhtvghrrdgvuhdprhgtph
    htthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghm
    sggvugguvggurdhorhhg
X-ME-Proxy: <xmx:_I82aSkLv4OSOE2s05Kku7yHZ6cUekwqpQH2VTQWNGe1nEHsWGepMQ>
    <xmx:_I82aSwU8X3KM9Q9gGRKGZzmNOz5FGOQFdoevK5QM8gyiTRkRiSYgg>
    <xmx:_I82aSkK7ZWGBDszyys6Lp4ZTkXDbTD_jUB1awVy4Bid0Zz6-2Du4w>
    <xmx:_I82aTfcbpRvvHt0Ss4mGB64eGDn71eSQGxKxVgPjI-EgzNUNGjVzg>
    <xmx:_I82aTE4Qc1szP4CiJAKEGxSBU2P0POtsYs_4f9sffTBOLHydqf--7ef>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Dec 2025 03:44:43 -0500 (EST)
From: "Walter Werner SCHNEIDER" <contact@schnwalter.eu>
Date: Mon, 08 Dec 2025 10:44:21 +0200
Subject: [PATCH] libcamera: upgrade 0.5.2 -> 0.6.0
MIME-Version: 1.0
Message-Id: <20251208-upgrade-libcamera-v1-1-2dca4e4c9e5c@schnwalter.eu>
X-B4-Tracking: v=1; b=H4sIAOWPNmkC/x3MTQqAIBBA4avErBPMiKyrRItRJxvoj5EiiO6et
 PwW7z2QSJgS9MUDQhcn3reMqizAz7hFUhyywWjTVEbX6jyiYCC1sPO4kqDqulY7CmitR8jdITT
 x/T+H8X0/yOSCFmMAAAA=
X-Change-ID: 20251203-upgrade-libcamera-9970beda88ca
To: openembedded-devel@lists.openembedded.org
Cc: Walter Werner SCHNEIDER <contact@schnwalter.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765183483; l=2819;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=tmxMZcc++ovaiHfGjAYdawSDyC4rNoedpVgeZRHU9S0=;
 b=DxEcHHdDUCtvQjCDYyQqirlBFMHH0D406mbF7hY7JH8gBwiTUvul+IzBmL7gB3SPqo6y6W+j1
 uncWLiTYylnD+lpaMiO7JAlq9cW8F+U4Am4QaayHFyeHtQuaESL99Z6
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 08:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122369

Signed-off-by: Walter Werner SCHNEIDER <contact@schnwalter.eu>
---
 .../libcamera/0001-libcamera-Do-not-assume-libc-with-clang.patch  | 8 ++++----
 .../libcamera/{libcamera_0.5.2.bb => libcamera_0.6.0.bb}          | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-libcamera-Do-not-assume-libc-with-clang.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-libcamera-Do-not-assume-libc-with-clang.patch
index 74952050413a9a824712e37f00f1167305a60d0e..25d88cfff432b2ce2d032d778bfec1671c1d903c 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-libcamera-Do-not-assume-libc-with-clang.patch
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0001-libcamera-Do-not-assume-libc-with-clang.patch
@@ -1,4 +1,4 @@
-From 82e9d391d312d65e7a62252e9e153b93c06ad37b Mon Sep 17 00:00:00 2001
+From 0c68347365ec4c0bd3f84e1d2f9f51eb3c2405c8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 24 Oct 2025 11:10:59 -0700
 Subject: [PATCH] libcamera: Do not assume libc++ with clang
@@ -17,13 +17,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 21 insertions(+), 11 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index fd508fd7..5707f850 100644
+index fa6487f6..89294936 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -118,7 +118,24 @@ cpp_arguments = [
      '-Wnon-virtual-dtor',
  ]
-
+ 
 -cxx_stdlib = 'libstdc++'
 +# Try to detect libc++
 +libcxx_ver = cxx.get_define('_LIBCPP_VERSION',
@@ -43,7 +43,7 @@ index fd508fd7..5707f850 100644
 +endif
 +
 +message('Detected C++ standard library: ' + cxx_stdlib)
-
+ 
  if cc.get_id() == 'clang'
      if cc.version().version_compare('<9')
 @@ -138,16 +155,9 @@ if cc.get_id() == 'clang'
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
index 0c6941213be2b4b2ffc07042e1fe086834e485dc..3b9e4e3fd4ef3dc2e8120f5e3ea22ae6cbb69340 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.5.2.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
@@ -13,7 +13,7 @@ SRC_URI = " \
         file://0001-libcamera-Do-not-assume-libc-with-clang.patch \
 "
 
-SRCREV = "096c50ca881f72d858aca19757a5e73b4775a7cc"
+SRCREV = "3c17d1fbb2bd93f221afee788ebf0d7394032e4d"
 
 PE = "1"
 

---
base-commit: 31a08525bedd960c21214f84c256f67c6090bb5a
change-id: 20251203-upgrade-libcamera-9970beda88ca

Best regards,
-- 
Walter Werner SCHNEIDER <contact@schnwalter.eu>


