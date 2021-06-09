Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.206.1623267034021934681
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jun 2021 12:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=P5vE78Rs;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f45.google.com with SMTP id a11so24842503wrt.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jun 2021 12:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pB28mPkUeJjv1wvRevVDTRu3hPlcuhjNvBJkxJzOHOg=;
        b=P5vE78RsxZUqjTYxgXatNAaJf/8/+hP9vrsdiBjZjPmQJRZYM6kGHDwxt67T1Ur3VT
         LTCxiUSOKhiAORZcuFwaX+N5jUZuQtA8YNNgcm/5HKy6OESr7Wkl5kaY59y+V07ZOv9k
         ZbgAIJb8FNeq+FDmjM+TVjYo3NZJ4jdPr0WXh2Rrmt3ppPV7a/OZoKfuKUjkH7fVHcRP
         K+Crt3Urg+ISySzp3hYDurvN1bK2Gyjf5G1cqgZvrgFSS1AFXkC97VJJB4rAsFAlJe9K
         QlmlW6dHSnmER54AADOefX8tINjhfF+6TqjFmlckXOhkxHYyLI773BtvLzY62zjqPZkH
         gmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pB28mPkUeJjv1wvRevVDTRu3hPlcuhjNvBJkxJzOHOg=;
        b=i5s3+EICKbb1vKp5zyUU1cJHFx/WcnwLnhgRYkt7TlLXE6OY81bvEsz8kYM/ovgIn/
         0Uy4XE20RGehyKQs08NwYkUMy+UyQTksuI5fOOEMIGlVYDVKGDxy+WiUbAMXw4zRonac
         MoW/P6n2/7QxGZrs5ooOYDy4cl6S3TRpbZEDCp+HXQKU62XcC3YWQrr74+uqkO+G8f4D
         fNdfFPC6iVPTrHr+aT0bnly19MBg/afvM1P41/KQpDzbzimIS8Ggn8h6M74KXhZg0MYK
         rdITUAAFyxI3igt022gjJv3YlzIWeUWRXoO9znp0FwdmErG9VMyGAyHVnP0iJ0125k11
         dREQ==
X-Gm-Message-State: AOAM532O1CWFUlo9bjjdDaIySNWUbKNbtpO+YgWkalolLVIwaJMRPVo7
	Sm8Abgra83Y8fZ9NUYJ+T4wNWg==
X-Google-Smtp-Source: ABdhPJwXP4ath8nHAFfDfj+B/MkH/lxeMVY5kZ9PYuUvOeSR74I3RWdqixgPHwwVKGXxWsdXAiTmIg==
X-Received: by 2002:a5d:540a:: with SMTP id g10mr1474603wrv.254.1623267032464;
        Wed, 09 Jun 2021 12:30:32 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id n10sm787924wri.77.2021.06.09.12.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 12:30:32 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: "Signed-off-by: Bartosz Golaszewski" <brgl@bgdev.pl>
Subject: [PATCH] Revert "libgpiod: ptest: warn if the gpio-mockup kernel module is not selected"
Date: Wed,  9 Jun 2021 21:30:30 +0200
Message-Id: <20210609193030.25303-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Signed-off-by: Bartosz Golaszewski" <brgl@bgdev.pl>

This reverts commit 977c5f56198f075376f753b0b4178ecb35ad02ec.

This recipe doesn't see the final value of KERNEL_FEATURES that the
linux-yocto recipe uses - that's why this warning was always triggered
if the gpio-mockup feature was not defined globally in this variable.
The linux-yocto recipe pulls in gpio-mockup automatically if ptest is
in DISTRO_FEATURES so we don't really needs thich check.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index 48a1e23ef..bb586b681 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -53,13 +53,6 @@ RRECOMMENDS_${PN}-ptest += "kernel-module-gpio-mockup"
 PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests', '', d)}"
 
 do_install_ptest() {
-    if [ "${PREFERRED_PROVIDER_virtual/kernel}" = "linux-yocto" ] && \
-       ${@bb.utils.contains('KERNEL_FEATURES', 'features/gpio/mockup.scc', 'false', 'true',d)}; then
-        bbwarn "libgpiod test-suites need the gpio-mockup
-module and will not work without it. Consider adding
-'features/gpio/mockup.scc' to KERNEL_FEATURES"
-    fi
-
     install -d ${D}${PTEST_PATH}/tests
 
     # These are the core C library tests
-- 
2.30.1

