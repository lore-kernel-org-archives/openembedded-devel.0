Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEB7C4167B
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 21:39:40 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.104748.1699479497578375533
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 13:38:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bpUDHiJ3;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: mklntf@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40837ebba42so791195e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 13:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699479496; x=1700084296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RoJFOjXByyRKL9E/FhOGo9wTJ5IffMGii7ow4o5LZM4=;
        b=bpUDHiJ3eNMyo3X+7l4XsMm1blBBo3tL9xVkojhTYg9W8C/60ghzcgh+PTze1CHTUa
         aIJ7k3Dv51viFIgt+YNUhMogGa01BzOflHjV+uQmGujKcuD7/X4Rh1S6h89SvEhIwIkp
         cZellxyfMmjyR57j68qEhCWVkgps4xPMOYijDefPkhaYODbwmf+C2KGPW6RuqJrqMFNR
         HMg67+7JCerpeuziCPjK/riQKjzRSBS5e8s9bs13hAgCztCOyXHpsF9UnyZlUfZzPH8G
         Z9bH9qzTXNOTgNC5AdAY3Hf5oskUELZTHK6thU6Uu94ojoYfIZFosRIvBpgWgdlOAI2f
         jUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699479496; x=1700084296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoJFOjXByyRKL9E/FhOGo9wTJ5IffMGii7ow4o5LZM4=;
        b=LbuJ3AnDEWU96hJEG9cT0yT1G6g0omrDgkA+kURY+MEUiC/dtmgT8QACansdG6U0zd
         2KIi+zMJPKg9q8D6eAQPwNfjiNK2powcLLBwpO+dVM/retfs5W1SbEgoIoZ6zWT0sEWx
         FGOvtQjoC+EwB9bRGhAoeoV8JPjt2mJA4EyebmEpfNgUK0UlQtAsRRWVqf8DDY6T0ppM
         gvO7QsLPQcvW3Ftio+RrnQGDt2bxzTk6WDLK5HP60IRNI1mezMyRXJACjDTIwAlwCHdE
         b+PasLgEWMU/7eci4oeX//auHkuK3jWasB6+qOokrlWRk+5fBkSfHCDd/LUWSGRjYL9w
         hIvw==
X-Gm-Message-State: AOJu0Ywqk6c6oIsSRQRB9tv6aRX6qISe5fPJKDMJrKV6mfIFTI8asHQH
	urUJ5W2oeIXo3RSAvLy9VH89Clsc7vmiJw==
X-Google-Smtp-Source: AGHT+IFuPAQQe9r+vEqGhPmD2k0rK7F895vzauHdFpK4fr5daXxs4uD4ss+wY9rfhlfxR1UUygSZXg==
X-Received: by 2002:a05:6000:18c5:b0:32d:b9c5:82fc with SMTP id w5-20020a05600018c500b0032db9c582fcmr2175670wrq.36.1699479495842;
        Wed, 08 Nov 2023 13:38:15 -0800 (PST)
Received: from nbmf.example ([2a02:810d:6e40:708:d1f8:a4c2:4c8d:975e])
        by smtp.gmail.com with ESMTPSA id j3-20020adfe503000000b0032db8cccd3asm5814919wrm.114.2023.11.08.13.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 13:38:15 -0800 (PST)
From: "Markus Fuchs" <mklntf@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Fuchs <mklntf@gmail.com>
Subject: [meta-oe][PATCH] remove unused AUTHOR variable
Date: Wed,  8 Nov 2023 22:38:03 +0100
Message-ID: <20231108213803.16953-1-mklntf@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 21:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106488

From: Markus Fuchs <mklntf@gmail.com>

No longer used in generating packages
Also creates a possible confusion with the recipe maintainer
name.

Signed-off-by: Markus Fuchs <mklntf@gmail.com>
---
 meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb   | 1 -
 .../recipes-multimedia/wireplumber/wireplumber_0.4.15.bb         | 1 -
 meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb                    | 1 -
 3 files changed, 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb
index 34c4a68ee..25d4762c8 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.84.bb
@@ -2,7 +2,6 @@ SUMMARY     = "Multimedia processing server for Linux"
 DESCRIPTION = "Linux server for handling and routing audio and video streams between applications and multimedia I/O devices"
 HOMEPAGE    = "https://pipewire.org/"
 BUGTRACKER  = "https://gitlab.freedesktop.org/pipewire/pipewire/issues"
-AUTHOR      = "Wim Taymans <wtaymans@redhat.com>"
 SECTION     = "multimedia"
 
 LICENSE = "MIT & LGPL-2.1-or-later & GPL-2.0-only"
diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.15.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.15.bb
index 679921922..5a180d1e0 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.15.bb
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.15.bb
@@ -1,7 +1,6 @@
 SUMMARY    = "Session / policy manager implementation for PipeWire"
 HOMEPAGE   = "https://gitlab.freedesktop.org/pipewire/wireplumber"
 BUGTRACKER = "https://gitlab.freedesktop.org/pipewire/wireplumber/issues"
-AUTHOR     = "George Kiagiadakis <george.kiagiadakis@collabora.com>"
 SECTION    = "multimedia"
 
 LICENSE = "MIT"
diff --git a/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb b/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb
index 0ac06c361..683600f71 100644
--- a/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb
+++ b/meta-oe/recipes-test/shunit2/shunit2_2.1.8.bb
@@ -1,5 +1,4 @@
 SUMMARY = "shUnit2 is a xUnit based unit test framework for Bourne based shell scripts"
-AUTHOR = "Kate Ward <kate.ward@forestent.com>"
 HOMEPAGE = "https://github.com/kward/shunit2"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
-- 
2.42.0


