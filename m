Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2978D3C92B
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 16:15:08 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.898.1765383302593864520
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 08:15:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pz5iKMNB;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-340bcc92c7dso667134a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 08:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765383302; x=1765988102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjeqWU1H6jTPNOmoJZXAepdfarA3be0e1AVz87NPJms=;
        b=Pz5iKMNBYRQGYjS1UM5hxbsxgARcrofAFnnKqEO6tAvf0qjjkZTSaz9fz68LNG9atT
         CL8ddWuKyzZOIBZn0qWZtU0ziQjLBVTlR5r3wDBAbQJYVr/R3iAzrQSGeTUIZFosSyTh
         MoVisf6p23p5LL6uPhHF0HERQuE77saAIRo/cGcbZQGBiLPHHD+JLi2tx+YbWA/bmUWB
         JDBFL2CARj1CTZT+5UJIWSp8TZq0JvgrBxJpyCLwTW+Pg3HrYby0oZemY9PJ/PL3iqcJ
         BXNKFjqKPscIM12ulVmYQzm7gQ1PNWQIwl3mExnWXTUYRdcaNIZSIDirkcFeNHxV3/YT
         wbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765383302; x=1765988102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DjeqWU1H6jTPNOmoJZXAepdfarA3be0e1AVz87NPJms=;
        b=tIImRP6V4y5Vh0X5YVq3/kO2RfIn+3kAKHG0DUjoPGv6HE7tSAP+UURcub1XDOkIEu
         4pf+a5Rj/Y7TbEdLi3QRCdf3PqwKWzPUwqmhKeER/iv+AyOCItD8s0frV2miLEbOoB8H
         KWnZEy1KdKXoF5dDWfa9wU93RYWgwwWRPj7MR2rWgHzAegt+3tmcysIqvN9Yzw/WfdH+
         HDZdXDgTpuSZvrVf5ADngE8VNv8pRqvLCEFYBrX9hlSwoRd9VeyyBirhvLnfb9w8Xp1W
         uWnHqr+dq1M2/bf3x3cc8VbFFxdzoHomf94IzocbkCCZ/Se8TaC69/NeteFMPGadzbBi
         cd3w==
X-Gm-Message-State: AOJu0YwAqHEknv7gy9ExdR4Q1vc10eqhB1wCoWq4gMZTKlNBST3ooweP
	IsLnjr90qTL3p36f0Ffyl28NHYY5Gu3m0LFawJ40WxCL5RHh1vfNybuc/s6M5QMN
X-Gm-Gg: AY/fxX75OL8geBGS+ykVg8hSkPMY11IAQUOojxL8j1kz7evkNxCGLj2xYulQv2eC2i6
	bLDH4kQsAmip+n5CUqytRmA6MDLcWiOBjWho/kLIqmrtn4JhfowCuyZ2mWogxoIb0YoKbRjLcQu
	Vp5aQ3epVOTraHPGUEMtHjvJq0HW9twsNWlK707oi6ueibeKRVp2Q5DmC3fc8hqZ9kR4nqEhS2P
	dzgZWS5i0x5nicmY6KRBrhHs/2g/2Z3QQPxVblwIT+Ut7XIOQhFLUZy7NiGWGjzCwcQH8Nwwna0
	B0uoUWyeDCuMSWNiAnHc5OKYyN4hgit9inz5VeDz+hoacMLe3cN1AMvhHRnVyvG8PqmMi6C3cJn
	lDWXypW1vqQgyNPIfX3LsLIZwABP2L4vS5xB9dFg2NiWGstp7bEYmT89ihDlVm30cNYAcOzCsJg
	i7xxogomMBiBOXjD1tZTngN8g=
X-Google-Smtp-Source: AGHT+IGulx6ynWi/Du05LUca2opif30zBiY94P8okuCq2sv200DXNuIDkBQw3QyA2Q4btd0Gj0VEsw==
X-Received: by 2002:a17:90b:2e42:b0:340:bfcd:6af9 with SMTP id 98e67ed59e1d1-34a7286bd86mr3113713a91.3.1765383301726;
        Wed, 10 Dec 2025 08:15:01 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a70427ea6sm2928546a91.3.2025.12.10.08.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 08:15:01 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH v2] dbus-broker: rework EXTRA_OEMESON opts to PACKAGECONFIG
Date: Wed, 10 Dec 2025 21:44:40 +0530
Message-ID: <20251210161440.2151692-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210161440.2151692-1-ankur.tyagi85@gmail.com>
References: <20251210161440.2151692-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 16:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122560

From: Gyorgy Sarvari <skandigraun@gmail.com>

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 75fad30c62491d0246374cffd3a10b94499524ba)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
changes in v2:
- rebased on whinlatter branch
---
 meta-oe/recipes-core/dbus/dbus-broker_37.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_37.bb b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
index c531f555d2..ae9c8f2fcd 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_37.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_37.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 DEPENDS = "\
     expat \
     systemd \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'audit (>= 3.0)', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux (>= 3.2)', '', d)} \
 "
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/${BP}.tar.xz \
@@ -23,9 +21,11 @@ SYSTEMD_SERVICE:${PN} = "${BPN}.service"
 
 inherit meson pkgconfig systemd features_check ptest
 
-EXTRA_OEMESON += "-Daudit=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
-EXTRA_OEMESON += "-Dselinux=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
-EXTRA_OEMESON += "-Dtests=${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'audit selinux', '', d)} \
+                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'test', '', d)}"
+PACKAGECONFIG[audit] = "-Daudit=true, -Daudit=false, audit (>= 3.0)"
+PACKAGECONFIG[selinux] = "-Dselinux=true, -Dselinux=false, libselinux (>= 3.2)"
+PACKAGECONFIG[test] = "-Dtests=true, -Dtests=false"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 

