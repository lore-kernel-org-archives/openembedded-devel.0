Return-Path: <brgl@bgdev.pl>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 88CEB78276
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 10:02:46 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p75so21248273wmg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 03:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=EwCtkVKn2+inEVgvR0N3tQLJWwbuyoYgnYfTgHfYYGs=;
	b=UrU5eozyNJ7wbcR4uSia5KzkyIjC/S3+2bSMARQdkHw6ofeqbx2Tc4ufAwO4obER8l
	+wkMwtm16C9x0MqsHicuxpW8Df7aQLpjM8d8t8OubA46aTWLYW7sFixkj2n5MGFIi7ZT
	XFc/kNEdYGOHi9XAxaVu8ID8p39pbqKDJqWTIQsVhYpDwEnwba8S9MmxjQz+tosNYmNo
	PDX/Pp9Ag+K7x7snFNbRiLoCetCp6jTkKgPk9XV7ZlVMHvTRbwXyQqR6b0JAH+Fttao5
	mtRKavTclKL5gBIKa925XxtHsHV59fPCVafGb+GbEuKfU3/rWgv5YdxyZ6TXz/3WyL4y
	eZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EwCtkVKn2+inEVgvR0N3tQLJWwbuyoYgnYfTgHfYYGs=;
	b=L8aarR21MxW8PLkb3RjqWZZX61AkXaEA7AhZzy7u4boAPbZ4CX7D2mxZ0W8PvfSJ5h
	dP9OwoNk0jn6y5/VgBcoRDl2nGRJaisWFruPJoofJcS0D2QG6/ny4gNBsA7FefvR9D99
	ywy6n23zMVseiK/9UmK1c6Bw+Jz4xgjSMr/+kMDSVe8XSm7KCQDN153wCSgVwpwZuUrH
	s3324OlyO1HhsFijpmi6c/GHr36+mT4mIzIC7ZtJbYMW3IZM7rSqvvoVPvTRumxph2OQ
	k8f7iMK93yZocrTb/FPbwzis5UF7GDscAarhbtmDSewrAcE+cjSzyo4f9S5OzfDSm//g
	TUlg==
X-Gm-Message-State: AMCzsaW0I2d0DJ0AAKaGnCvQarbbFTUq4VRcY66hJ5yTUUdtX9RJWPrt
	qkHLLcttHHhTpJgkbaCP9IFMNd2qh94=
X-Google-Smtp-Source: ABhQp+SNt7waCNUMuF2bHBOQY9+NAkyihDVEUrH0uRw1WZxQA2LzvemivShD0C1RyAVutMFGpNcD8A==
X-Received: by 10.28.143.212 with SMTP id r203mr1325584wmd.44.1509444167725;
	Tue, 31 Oct 2017 03:02:47 -0700 (PDT)
Received: from localhost.localdomain ([90.63.244.31])
	by smtp.gmail.com with ESMTPSA id u7sm926250wmf.15.2017.10.31.03.02.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Oct 2017 03:02:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 31 Oct 2017 11:02:45 +0100
Message-Id: <20171031100245.1868-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH] libgpiod: bump version to v0.3.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Oct 2017 10:02:47 -0000

Bug fix release:
- correctly handle signal interrupts when polling in gpiod_simple_event_loop()
- fix the linking order when building with static libraries
- pass the correct consumer string to gpiod_simple_get_value_multiple() in
  gpioget
- fix a line test case: don't use open-drain or open-source flags for input
  mode
- fix the flags passed to ar in order to supress a build warning
- set the last error code in gpiod_chip_open_by_label() to ENOENT if a chip
  can't be found

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.bb b/meta-oe/recipes-support/libgpiod/libgpiod.bb
index c50605775..6aa27ad57 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
 
 SRC_URI = "https://www.kernel.org/pub/software/libs/libgpiod/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "5f9d855352b1a5272cf6f1c2e20689d2"
-SRC_URI[sha256sum] = "6dfd6aeb544e8b7baf484a05c9ae0e67022c109362a41d87005393046b6beacf"
+SRC_URI[md5sum] = "9c1966bea7dffd59bd099a8b2930e2ea"
+SRC_URI[sha256sum] = "50c7862428ca90b58672e2475aea66d33a6fc86c6bab1928c0660f3aedf44a37"
 
-PV = "0.3.1"
+PV = "0.3.2"
 
 inherit autotools pkgconfig
 
-- 
2.13.2


