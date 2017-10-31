Return-Path: <brgl@bgdev.pl>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2B9E57824C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 10:47:03 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id s66so21392044wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 03:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=VTqAiv3/Jxn+K4XUzRZqzfdwzK2MzIrkwXureJT15nA=;
	b=HOQ03RRvxJ92k5zx+qJ8ZzL/btR32zxMEKj31aikga0DeiPcE9pawZu080g8heDKtv
	oA4ZGY/aqfOnlKYb7rttoffZFQBBqssTxaGUAlxjsQSTIcIPdjL6db6EEtlc2nKZCFHV
	JTisV1/ffIMYE0DcISYTX/yrAe1n7Lho9hh5QXFMKJ1zvkGmtW9udDPcRP3WOuoKI2F+
	T69MDGKnmFKRj7/gvKcOGTjVbn3OwGHqbr3xB1BmB8ltNQ7CdDYt/01S4ZGCuHOO7wYM
	umGgUWaFTk7zwGQHQiZmPbwyaI8CmH7DMPMOwmjQnOBA0/0eu0ApLhKGAAfVTKNJbZRr
	doIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VTqAiv3/Jxn+K4XUzRZqzfdwzK2MzIrkwXureJT15nA=;
	b=aof2yttxcMjPwu4T+hQP6ZQutgjGwBr/NWPwx4l0YHu+FFHJ7bY8x3rgzvpdS3ks9p
	aS+c6ntvXBijL8Sg46GRIm5RyrvHj4RNuQwSIohiSzfZzrHipGhzQiWQy7oViFvpOlFG
	8sQViLY3oJBarRYF9ganV0Zlp/HEcpqs8IHASdpOIUPYz/ZgKtBGqgzbDNQ9Qa3lkjeD
	uV2m9y0jJY0zsv9pTOMqXOmRyHrTalvsxBZngCG2E/EbqeTmtJOUhfCuifDqgKsi3O1H
	/GHHiQp7czizVnRMArpuIFCz8Z0tknjnWloJGrdmJrGinFiI8hdJSsGc+ORFKYuIHgsM
	k5Bw==
X-Gm-Message-State: AMCzsaUTaLJ7Q+2Epa5I5kWwsnwSSyyasmtXUeYZeZFOdrHbY8jLrj7t
	rKAcUl5U0LqcfkDMxHnJK/gVH+ozfTo=
X-Google-Smtp-Source: ABhQp+TZb/D02Q68fkiPkeV11V5ewdBeXclbK60ViPfF2viy552Ti+8vhAWuEW8BTgfc/IuX4ko8Mg==
X-Received: by 10.28.30.2 with SMTP id e2mr484385wme.36.1509446824669;
	Tue, 31 Oct 2017 03:47:04 -0700 (PDT)
Received: from localhost.localdomain ([90.63.244.31])
	by smtp.gmail.com with ESMTPSA id r23sm614929wrc.93.2017.10.31.03.47.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Oct 2017 03:47:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 31 Oct 2017 11:47:02 +0100
Message-Id: <20171031104702.2094-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.13.2
Subject: [meta-oe][PATCH] libgpiod: bump version to v0.3.2
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
X-List-Received-Date: Tue, 31 Oct 2017 10:47:04 -0000

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
NOTE: resent due to missing meta-oe tag

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


