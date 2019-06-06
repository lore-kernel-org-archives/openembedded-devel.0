Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id DB52C7C87F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2019 14:01:30 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d18so2563406wrs.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jun 2019 07:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7x/V4W6Z0gVYkHnRIOjGqWj4/yE8hN33jifloEG4LN8=;
	b=PSTP7V3Tgt0QchKaIqSU4Bo4bxDId/v9XU64YRBlw0CD+mxlxkC2xysInWReo/t3Cc
	UvXcKNB3M/h5Hxo8O+OURW1ekZOq9cioJ5XA0KcmBrUcnDiSMvqFqp+rK+QuIg7zsM3J
	fklztTqH4uB0KN3sQxbtchD+sBDSDdRh3/p9D7HYOy6aJj9Z2DH4NSrU2a8WPNTXjMii
	p3sGaHzm7onoPF392OlPh6i/uZYVZYTRLDJL4Czv3p+nIGwvLa94NS87r4BaC6NRMI4W
	RWvzbTL8F4mgjWEuqHTTB7b38lOzCiPSSljsEqklfxA3EirxxR/xlfGMLS7F4y7WWWFT
	v0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7x/V4W6Z0gVYkHnRIOjGqWj4/yE8hN33jifloEG4LN8=;
	b=NLhmqgkt+J5VH6Lqx/YbjLCSFgsjUQmHDuGFheCwx9Tg1onFpk+dLgxMTrAgyOh9mq
	5t7C11FcKUzvZNp4QTNouZ8/o5m6SFyq6LhCUwLwRS5GcHoSmvtH4C+qsbdMkQgTYF9Z
	WlvNLBz6tFiClsOwXOsgXaa86qVPvzCfFMyWlWHl8nctbrG+v8pLcIMzi4ck71K+n+QE
	wdrVGXN3YyLw0jn5JX6w0IOtYdxZpK59cy4TKB9/GLrNnVKt5R4o6krHElTF3mft0Ypm
	ZqD2wXqOJe3r1fhLXRfj2WC5Y4B0H8J32Ju7XIleOeyWMDs7yH/PfmMRXAq8dMEZH+2h
	a/9w==
X-Gm-Message-State: APjAAAVPZnOfOFu/DFOztDckzgO2FUv7FJoFh+QIH2OOcX8ZuzjAb38d
	DhmsQaD8waR6UBr5Uip4RwaZ0g==
X-Google-Smtp-Source: APXvYqwdqZlv4mqASARqKPiqtbrqfDyz5x0/+7+fkO2SYqmE2DEksZVm8Rw/YGLpMmtMhx4AVg3iOA==
X-Received: by 2002:a05:6000:104e:: with SMTP id
	c14mr18985468wrx.71.1559829691368; 
	Thu, 06 Jun 2019 07:01:31 -0700 (PDT)
Received: from localhost.localdomain
	(amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
	by smtp.gmail.com with ESMTPSA id j7sm2421091wru.54.2019.06.06.07.01.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 07:01:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Thu,  6 Jun 2019 16:01:27 +0200
Message-Id: <20190606140127.1194-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] libgpiod: upgrade to v1.4
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
X-List-Received-Date: Thu, 06 Jun 2019 14:01:31 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This release contains a couple fixes for C++ bindings and testing framework
refactoring. The --enable-install-tests option has been removed as it was
redundant. More info in NEWS.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../libgpiod/{libgpiod_1.3.bb => libgpiod_1.4.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_1.3.bb => libgpiod_1.4.bb} (67%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.bb
similarity index 67%
rename from meta-oe/recipes-support/libgpiod/libgpiod_1.3.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_1.4.bb
index e513a33bd..22650d7b5 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.bb
@@ -2,11 +2,11 @@ require libgpiod.inc
 
 DEPENDS += "autoconf-archive-native"
 
-SRC_URI[md5sum] = "9f7530a5d56f070ba0af78d6ba077973"
-SRC_URI[sha256sum] = "6ec837f23e8f2196e5976dec4ac81403170830075e7f33ede1394eaf67f2e962"
+SRC_URI[md5sum] = "bd52d764017215a30e2f014d2081dc3e"
+SRC_URI[sha256sum] = "ebde83aaf14be3abd33e7a90faa487a2ee231e242897afe7fdefb765386b3c8b"
 
 PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
-PACKAGECONFIG[tests] = "--enable-tests --enable-install-tests,--disable-tests --disable-install-tests,kmod udev"
+PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
 
 PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}
-- 
2.21.0


