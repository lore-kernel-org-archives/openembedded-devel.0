Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 05FBD60290
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2015 15:45:32 +0000 (UTC)
Received: by lbbcs9 with SMTP id cs9so84162684lbb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2015 07:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=P/6fGhvgzLVDdZxkSWJI4qs4Oy0qAs0TpgMHEjec8l4=;
	b=eA/ZbkGh0nNfZSd5IM4ff/UMnwp80UiJCMHfd5U9gj7KxCmCY0+2unv7YsOWCzARzc
	As/gNwbHBejRgphNvxuGM9KIHWUvqx920SYuFswvGfLwAp93eQTy6DK0KNskrv2tt10t
	Vd4PAkyL9WY5zmxaaTW7s+0iNe7CFHyBqB1zdWhCJC1FwHZssnM1bJ+iCSu0b8fjYm0j
	haWagcTKSSc7bO8vOy0G9Nh0IvVEmM1bWURKQU1VS8Eo0R7JH+WY1qa5KZpCJCdVp/W3
	+mbDcJGVIFzilRXva7EFbN1bzPhR4rBzzb2hht9xKK4qfxcGos87ZE1cZ8SkfaYYR6sW
	qfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=P/6fGhvgzLVDdZxkSWJI4qs4Oy0qAs0TpgMHEjec8l4=;
	b=mNb1XeYpRhh4F4vrjX3B0VDY8LXkri28wGgaZZTzxpItxQsrkFYrD+oYyqEQcR+shR
	rjjacD9z5iIFeIsxxlIbjql94Q3lL+k4LYk8YL1/eCld57HPfv/LR0xJ4JHjmEcYS9dS
	eKH49SwaqI8uMC0U8xrKFGbPvvqOfEirJfxz1wA7xTBjSzOTPBnfcM5HwMDVFBkZkfuf
	plWZlhLgDMMifUSJnwTOXnx4Oh6m20IvwYfbBZuctkfRncGKZbEOuYlpibWgEiHEXxtp
	psSLvkLkm2awkwoSFII0sQjpU6imSkehA1nLyaMVQABhv6xAk0lXbMuRfhFExT7TS+vR
	C65g==
X-Gm-Message-State: ALoCoQnli8ImKPHbijNC7ZnqfJeULTf8SHOyJtqGCa7HPDo2mRd0SSC8Kv4LBIRLWrtFloZs1WKb
X-Received: by 10.112.200.40 with SMTP id jp8mr9134809lbc.104.1448207132253;
	Sun, 22 Nov 2015 07:45:32 -0800 (PST)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16]) by smtp.gmail.com with ESMTPSA id
	a75sm1273428lfe.34.2015.11.22.07.45.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 22 Nov 2015 07:45:31 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Nov 2015 17:45:10 +0200
Message-Id: <1448207110-17855-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.6.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] libsoc: upgrade from version 0.6 to 0.7
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
X-List-Received-Date: Sun, 22 Nov 2015 15:45:35 -0000

* update SRCREV
* add --with-board-configs to configure
* run oe-stylize to sanitize the recipe

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../recipes-support/libsoc/{libsoc_0.6.bb => libsoc_0.7.bb}    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/libsoc/{libsoc_0.6.bb => libsoc_0.7.bb} (85%)

diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.6.bb b/meta-oe/recipes-support/libsoc/libsoc_0.7.bb
similarity index 85%
rename from meta-oe/recipes-support/libsoc/libsoc_0.6.bb
rename to meta-oe/recipes-support/libsoc/libsoc_0.7.bb
index 79c171a..1a7f4a7 100644
--- a/meta-oe/recipes-support/libsoc/libsoc_0.6.bb
+++ b/meta-oe/recipes-support/libsoc/libsoc_0.7.bb
@@ -1,17 +1,17 @@
 SUMMARY = "Library for interfacing with common SoC peripherals"
 DESCRIPTION = "libsoc is a C library to interface with common peripherals (gpio, i2c, spi, pwm) \
                found in SoC (System on Chips) through generic Linux Kernel interfaces."
-
 HOMEPAGE = "https://github.com/jackmitch/libsoc"
-
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
+SRCREV = "4d5c5af71e225cc4e792d2166da3f3e432b08735"
 
-inherit autotools
-
-SRCREV = "3643cf161a4b37bfbdfd05437166c4a29ac3ed8d"
 SRC_URI = "git://github.com/jackmitch/libsoc.git"
 
 S = "${WORKDIR}/git"
 
+inherit autotools
+
+EXTRA_OECONF = "--with-board-configs"
+
 RDEPENDS_${PN} = "libgcc"
-- 
2.6.2


