Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.259.1588771779841078174
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2020 06:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=jbHtOBBK;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.68, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f68.google.com with SMTP id u16so2653460wmc.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2020 06:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+nygrohoC3XmdgebrcFnnfB1c7tN1EG6SJKbveh6NSY=;
        b=jbHtOBBKUx0EaabyYULfUSTZQMi1uBrt6BxitDPh/B/hZznfBfBd9p2Mw7bW8Aj1+Y
         YV8TxRcKlL60SGYOa/2DZAUqBaLd+QS4wBStJ3eV8UT6XS2gT6o0YLwsZ6nhfaoxxxgA
         +WiMAG3haeVhISKPU5m+wL7u9bMxeAgK/ozpk43aLOjqkWn8Jdz3n/s5GeqXx3Lt3S37
         MzOdGa3nE+LNl9qoG+Y4T0Te6soh+lZayrYFU6QH4d7bzgovFpo7p1RBpp5o8bQERe/1
         avopYy4ivluPBovfIVtbmi06PhaoaH6UA10c0xxIOw9Urn3bErfXEuhP/M4HPRr4PLeA
         m75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+nygrohoC3XmdgebrcFnnfB1c7tN1EG6SJKbveh6NSY=;
        b=Rz59MuP6uiwQug6r7bSiNOFruyLlErqYsDJSf0q+3oP5zYgTvRjCiXgi+N8Ctz+e4r
         ruFeaea1TOtvi3EG4tv6XCzqlnQKQzTWMHHHRcJ81yxwmarK6UokjYyd9/k8NgHnCZBz
         lvkb94uu2DZN+zu6Jrkh0NEYwglHNaxaT1hNc95HyxlK3HJn/p0hsPVU4fvYchBUzhw/
         Z/p4cg6wNciHp1wE5Dgx8HV/Cz139Oun2B4e4M5cbz7p+rjA0lPx+X2x6akJzeXsnpCA
         +jj8OOw5GZkMJDtq5MemgySMlf9ILeuErwR9rYrW+j0aGxHtZ3CvxTPqCn6JMW3x6lqs
         1MUw==
X-Gm-Message-State: AGi0PuabgnXbEo/IR+rhm9b6G7wTVIWvoSr+ek3LL7RHJKUbCDWTbD2b
	dLJS701tN43rObSjk0SMe2pqBw==
X-Google-Smtp-Source: APiQypL9mRiq4pgKkp9FPM5kG/Z2XXcuforpDfVpZ70EziXo+uxHmGTu+pih6LB4MiuDyfB9WWCK1w==
X-Received: by 2002:a7b:c14b:: with SMTP id z11mr4278864wmi.44.1588771778346;
        Wed, 06 May 2020 06:29:38 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id d7sm2729211wrn.78.2020.05.06.06.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 06:29:37 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	yocto@lists.yoctoproject.org,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [OE-core][PATCH] busybox: disable i2ctransfer
Date: Wed,  6 May 2020 15:29:32 +0200
Message-Id: <20200506132932.19286-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

I2C tools are built by default in busybox. OE-core on the other hand
disables them all in the busybox defconfig except i2ctransfer. Since
this looks like an oversight, this patch proposes to disable this tool
as well.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 0b27fcd4b3..4334a9d738 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -785,6 +785,7 @@ CONFIG_FEATURE_CROND_DIR=""
 # CONFIG_I2CSET is not set
 # CONFIG_I2CDUMP is not set
 # CONFIG_I2CDETECT is not set
+# CONFIG_I2CTRANSFER is not set
 # CONFIG_INOTIFYD is not set
 CONFIG_LESS=y
 CONFIG_FEATURE_LESS_MAXLINES=9999999
-- 
2.25.0

