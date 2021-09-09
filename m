Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.5350.1631181419130315098
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Sep 2021 02:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=q66pGgSP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631181417; i=@fujitsu.com;
	bh=n8nDaX01f840U2o4X254nYfwGP5v2OjpNZOF24WRWxk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=q66pGgSP5gvkvROuuwgwiWEUJH3+j+qbN5DWqkvw4TyCmb4pK82uTmzE8WxtLLa48
	 QQeHN0U+J3hA60QzHKVgVOjNaq0/CexgT54Bggp1RuYjSjvZ/Dp+en3fkKZOWB+pXb
	 /V+ubUypxRK8CFJE5EO+O0Sf/aitkiEgwa4rqGsSbQ9n0kZefdKXWBi+5hxvwKChld
	 8AP94n58ZMyAzENYN9+cwRshT68WFbv0agmq8bQW8wM7WQwWq7GleBradQwV5f8r2c
	 mVWF81r9CW1b/U+1QTCVtxkwxHHmDZTfYm9+RhWtDijvn+mS2INiuW1IyRCA/81Q36
	 Lr09uaE49XFYQ==
Received: from [100.112.199.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-west-1.aws.symcld.net id 33/53-30018-96AD9316; Thu, 09 Sep 2021 09:56:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYoptxyzL
  R4NFFQ4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPSzi6mgq08FcvOT2BrYPzL1cXIxSEkMItJ
  4t/bdnYI5zijxLkX64AcTg42AR2JjhfdLCC2iIC+xNLZe5hBbGEBL4lFZw6ygdgsAqoSW7p/g
  tm8Am4SX74cBKuREFCQmPLwPTNEXFDi5MwnYHOYBSQkDr54AVWjKLF95xkWCLtC4vXhS8wTGH
  lmIWmZhaRlASPTKkaLpKLM9IyS3MTMHF1DAwNdQ0MjXUNLM10jQxO9xCrdJL3UUt3y1OISXUO
  9xPJiveLK3OScFL281JJNjMBASik4cm0H44HXH/QOMUpyMCmJ8prdtEwU4kvKT6nMSCzOiC8q
  zUktPsQow8GhJMGbcB0oJ1iUmp5akZaZAwxqmLQEB4+SCK8aSJq3uCAxtzgzHSJ1ilFRSpzXE
  mSmAEgiozQPrg0WSZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMeBpnCk5lXAjf9FdBiJq
  DFvtcsQBaXJCKkpBqYEhitYpd+SpFmO/FRlLdP/eNuJzZe97ZlNdz3uu7MiJlyajr/3HMK/99
  sfPhz1YwHkrv4dJ8eqH99eNFC/4yuCbIfa75MUHS9stz4puXqWJ6rjBVRF/7Jek2Y/VTo4r+y
  r7p883JvaClYPLmukHpgr19D3dcDix1Mw96ISxefSL7Bnvfq3859ChbxLHPvv2XvWRYwsazNM
  jF6O9vKw5nm51uP6V7aEDvl5+PeaxNjsgOXRr4xmL4sLnb5n5A51xc8fG4X8SzPu3xb2fu612
  3vT9tV27aoKLrH3+/0Ym2tPMt60zXnq2yO3oUNX4IyzPt5rlezKER5ZmXL7XTXvcGe8SD0Wsi
  FUMc2ppu/5tkKKbEUZyQaajEXFScCAC8vUmQfAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-287.messagelabs.com!1631181416!76898!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1316 invoked from network); 9 Sep 2021 09:56:56 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Sep 2021 09:56:56 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1899uuVB010864
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Sep 2021 10:56:56 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 9 Sep 2021 10:56:55 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pillow: upgrade 8.3.1 -> 8.3.2
Date: Fri, 10 Sep 2021 05:56:49 +0800
Message-ID: <1631224609-4581-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

8.3.2 (2021-09-02)
------------------
- CVE-2021-23437 Raise ValueError if color specifier is too long
  [hugovk, radarhere]
- Fix 6-byte OOB read in FliDecode
  [wiredfool]
- Add support for Python 3.10 #5569, #5570
  [hugovk, radarhere]
- Ensure TIFF ``RowsPerStrip`` is multiple of 8 for JPEG compression #5588
  [kmilos, radarhere]
- Updates for ``ImagePalette`` channel order #5599
  [radarhere]
- Hide FriBiDi shim symbols to avoid conflict with real FriBiDi library #5651
  [nulano]

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-pillow_8.3.1.bb => python3-pillow_8.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_8.3.1.bb => python3-pillow_8.3.2.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb b/meta-python/recipes-devtools/python/python3-pillow_8.3.2.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pillow_8.3.2.bb
index d0a17cb1ac..68b80a7392 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_8.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.3.2.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.3.x \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
 "
-SRCREV ?= "92933b86574b9c80764bf52c357ed29e1ef53382"
+SRCREV ?= "8013f130a5077b238a4346b73e149432b180a8ea"
 
 inherit setuptools3
 
-- 
2.25.1

