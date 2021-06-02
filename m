Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.13604.1622643306786743526
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jun 2021 07:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=W88z3qRZ;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.51, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f51.google.com with SMTP id o127so1402822wmo.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jun 2021 07:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7GGO+I5auS15jQ18f5c1Gn3V2TX1OMh6CmmH5QKoT+w=;
        b=W88z3qRZ958FCAblmN18+bUyertcHDfYYjsWgRFyAkmM+wqVuYJnA4sqgRv4bMPNJJ
         yMZacqMlAJRcPj9KiEGUrsrdzjUX5H/FNbrTLD2lJDgOvpy9ZjJeoNvyUq6Y4pMA9+Z5
         Qq+Os6EH82ZMbf4jyQYhma7tCxLPYn+9+T7mOzX/ksDFkIaJ2lNOM3YKwopclx5Fp11x
         yKe6afa+d0I21nK3lMHhn62M128es0sIYD4Wtdw82qCqOUida6aDtPmAzbP20w4eIMDd
         1ru2M0p1TOuRJsPYrfQUgZOfn6DH4o/ifjmpKd/EmpGLA2ubsLmNS18+Fnm2zzz+c/qQ
         gusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7GGO+I5auS15jQ18f5c1Gn3V2TX1OMh6CmmH5QKoT+w=;
        b=CvXw6tIUwOE0Owr4BqUDvnBA+m3FPa5FtFy/tc+8WpkRez11GfeHXAXvwhf75coyfL
         0JGaZ5B0y8pf7NXwCTsDrss/a6Kp5kReBpXmqcIzkDC896fzlepaJ+7EQnL+DZ5RAgSw
         MVt8jkwamtuEt45pWdjWGRMvu+95gzOgZqpG1Ny4RAZ5VZHOZjWsxZTI4REJmxfZChHQ
         pUPV3DKhSKGq8+t47SdP1a1ugf5OuJBTj8VBVJZWhmyjqFjodg4BHqPexUpwaJW1wX0z
         1AiDgv7ZAXUf9j7G6coQz1r36ofgGq/sEMjk7vU4+easVKWU8LfxsY0alV3sQ22glLdF
         6Xyw==
X-Gm-Message-State: AOAM53207571puVFKMInfB1oc6xateA/PXFYL8Q6pyYKvXpreFd+8h0g
	HK2M00cVraRaXQTrveOjBfLnbw==
X-Google-Smtp-Source: ABdhPJweKB3ksYqFzGk+fUhws3nG/QJn+izfYxVxWX6DjaGLgohUOvBfl9IewlY8BZUSBQHAXiFgAw==
X-Received: by 2002:a1c:cc17:: with SMTP id h23mr31699132wmb.129.1622643304814;
        Wed, 02 Jun 2021 07:15:04 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id i12sm2824697wmq.7.2021.06.02.07.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 07:15:04 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH 0/9] libgpiod: ptest improvements
Date: Wed,  2 Jun 2021 16:14:52 +0200
Message-Id: <20210602141501.6174-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This series improves the recipe for libgpiod with primary focus on ptest
parts. We bring in support for all test-suites available in the package.
We also tweak the recipe in other places to make it more readable and
robust in general.

Bartosz Golaszewski (9):
  libgpiod: coding style fixes
  libgpiod: list all packages in a single assignment
  libgpiod: fix RRECOMMENDS for python bindings
  libgpiod: correctly split output files into packages
  libgpiod: add RDEPENDS for tests
  libgpiod: redirect stdout from the ptest executable to a file
  libgpiod: ptest: run all test-suites if possible
  libgpiod: ptest: warn if the gpio-mockup kernel module is not selected
  libgpiod: ptest: add kernel-modules to RRECOMMENDS

 .../recipes-support/libgpiod/files/run-ptest  | 21 ++++---
 .../libgpiod/libgpiod_1.6.3.bb                | 61 +++++++++++++++----
 2 files changed, 64 insertions(+), 18 deletions(-)

-- 
2.30.1

