Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524C4C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 07:53:18 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.10769.1749023594045285681
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jun 2025 00:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cRW0Mi6H;
 spf=pass (domain: smile.fr, ip: 209.85.218.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad69e4f2100so963487866b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 00:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1749023592; x=1749628392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NUYYtcA49bG7LTNzc95B69pWLKND3hhkiFrR6KqTxcY=;
        b=cRW0Mi6HF8rOUVGdaYzKHvWKIG+o6VTpEZo1+lCAmJh44qYS1XolHaSn88zTbmS5DL
         HV1km8j5Bs+skwmimbsjUa18u0AaSS2ql0WFSLs9NZiL+HNtD7Rd14vXM3qJT68ShQbP
         ZHAU6HK+RBkLiUqJh7stsejtdaDgpF6Po8ZGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023592; x=1749628392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUYYtcA49bG7LTNzc95B69pWLKND3hhkiFrR6KqTxcY=;
        b=qALtph3AEn6Lhc88YaeGVAQgErtDWGCkhaxxIQRKg5gxyjliDQaxLuZ1Rtw9/wbkuh
         ek6ZVQD+Qq09gpLQ8skscB5z5Rt/IwBC04vy8OkUKSaarHCTwQDUqCzgQ+fVv+8vCYjF
         1wPgXjeBzxEywJlW+Hb4a4sCNM5q3EzCEkCo1c0fSeKkii7MYdFbl8TMsbfHkERkEIWp
         SWGYeCmYbCa6iIgAT4TT78QWTv4wiap78HY8LSRG0L3rVKkNktorHf1MgE2+SBXAshW0
         0E+6hLel5cUibOGkNVH19Vele3un4Fax0J2D0h72rAh7Wc3eAjHJcBwm9aq3WlGLBO9Z
         Jf5Q==
X-Gm-Message-State: AOJu0YyHWhsIRVDFQ4sMkgOuThQbhJo0Is1oYDDchCY07wH9xKEzr/zv
	IFTsyJkt+W55TohIgMWf8k2sqd0PZ7vWJhsLzU6EYK5P1M8zDyzf1Ek4qOoDS6Lcz/vmoXI6o+c
	uerRkEiA=
X-Gm-Gg: ASbGncsafasfuyIYgG3yIo7WTLFMvBO1KCqgvsp+MVwNv/W5SdnoJ8PASYbmI1aAPcG
	L8NLIQd4x75b5QrlJrOyl7VnW8ldjvWj1S94Fc26rIfjqjlA4BYPbveEjSRdsUW6+ypDxxiaVdU
	SydBhassZi/LgPJsfb9uSmiVlnglnN6PVMosFL+cP4awQDdim5QDnfxkMrzCoKkCmap+Zr5kjij
	r79X1o3rS8bUZk/UGB3GoYgOk//+cQqi1K0iaJfqaix6sUPIQ/wLBybsh7OBRdW3ho/sAObHObT
	lrcyWb0owhAWb30siw4tBYpxKwpGUObTmE3ya2pGR/CjUvBljt3IHKeQIK6uRPm/uG+kyWaYXF+
	QIAvCKi4lzjmXhAn0DzjW//+A/2PzEq5MjBZa9w5A/+yoBhNYfCKvFpwnCcM=
X-Google-Smtp-Source: AGHT+IHPI8Y+zo3U0G/pTxyPF/K4ud6BvjuKVehL74yrV+NJ0ACWGdgCrC+glLDV/dSRStgzQKusvw==
X-Received: by 2002:a05:600c:19c6:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-451f0b0d5cdmr10262975e9.21.1749023108767;
        Wed, 04 Jun 2025 00:45:08 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f22sm20494145f8f.43.2025.06.04.00.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:45:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [RFC PATCH] reproducibility: move known non-repro list to the new common file
Date: Wed,  4 Jun 2025 09:44:58 +0200
Message-Id: <20250604074458.2460753-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 07:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117732

From: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>

Since commit [<insert here merged OE-Core commit>], the reproducible
test uses the known_non_repro.inc file to get the known non-reproducible
package list from each layers.

This patch moves the ad-hoc file to this new common interface.

Co-Developed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
---
RFC: This is the application/example of
[PATCH] reproducible: allow each layer to define its known non-repro packages
https://lists.openembedded.org/g/openembedded-core/message/217827
---
 .../{non-repro-meta-filesystems.inc => known_non_repro.inc}     | 2 +-
 .../include/{non-repro-meta-gnome.inc => known_non_repro.inc}   | 2 +-
 .../{non-repro-meta-initramfs.inc => known_non_repro.inc}       | 2 +-
 .../{non-repro-meta-multimedia.inc => known_non_repro.inc}      | 2 +-
 .../{non-repro-meta-networking.inc => known_non_repro.inc}      | 2 +-
 .../conf/include/{non-repro-meta-oe.inc => known_non_repro.inc} | 2 +-
 .../include/{non-repro-meta-perl.inc => known_non_repro.inc}    | 2 +-
 .../include/{non-repro-meta-python.inc => known_non_repro.inc}  | 2 +-
 .../{non-repro-meta-webserver.inc => known_non_repro.inc}       | 2 +-
 .../include/{non-repro-meta-xfce.inc => known_non_repro.inc}    | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)
 rename meta-filesystems/conf/include/{non-repro-meta-filesystems.inc => known_non_repro.inc} (78%)
 rename meta-gnome/conf/include/{non-repro-meta-gnome.inc => known_non_repro.inc} (86%)
 rename meta-initramfs/conf/include/{non-repro-meta-initramfs.inc => known_non_repro.inc} (73%)
 rename meta-multimedia/conf/include/{non-repro-meta-multimedia.inc => known_non_repro.inc} (89%)
 rename meta-networking/conf/include/{non-repro-meta-networking.inc => known_non_repro.inc} (95%)
 rename meta-oe/conf/include/{non-repro-meta-oe.inc => known_non_repro.inc} (98%)
 rename meta-perl/conf/include/{non-repro-meta-perl.inc => known_non_repro.inc} (86%)
 rename meta-python/conf/include/{non-repro-meta-python.inc => known_non_repro.inc} (95%)
 rename meta-webserver/conf/include/{non-repro-meta-webserver.inc => known_non_repro.inc} (80%)
 rename meta-xfce/conf/include/{non-repro-meta-xfce.inc => known_non_repro.inc} (80%)

diff --git a/meta-filesystems/conf/include/non-repro-meta-filesystems.inc b/meta-filesystems/conf/include/known_non_repro.inc
similarity index 78%
rename from meta-filesystems/conf/include/non-repro-meta-filesystems.inc
rename to meta-filesystems/conf/include/known_non_repro.inc
index 509907d889..bf0d08fdc0 100644
--- a/meta-filesystems/conf/include/non-repro-meta-filesystems.inc
+++ b/meta-filesystems/conf/include/known_non_repro.inc
@@ -1,6 +1,6 @@
 # List of known non-reproducible package of the meta-filesystems layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_FILESYSTEMS = " \
+KNOWN_NON_REPRO_PACKAGES_LIST += " \
     e2tools-ptest \
     xfsprogs-doc \
 "
diff --git a/meta-gnome/conf/include/non-repro-meta-gnome.inc b/meta-gnome/conf/include/known_non_repro.inc
similarity index 86%
rename from meta-gnome/conf/include/non-repro-meta-gnome.inc
rename to meta-gnome/conf/include/known_non_repro.inc
index 553bc32cc6..46701a8905 100755
--- a/meta-gnome/conf/include/non-repro-meta-gnome.inc
+++ b/meta-gnome/conf/include/known_non_repro.inc
@@ -1,6 +1,6 @@
 # List of known non-reproducible package of the meta-gnome layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_GNOME = " \
+KNOWN_NON_REPRO_PACKAGES_LIST += " \
     geary \
     geary-dbg \
     gegl-dev \
diff --git a/meta-initramfs/conf/include/non-repro-meta-initramfs.inc b/meta-initramfs/conf/include/known_non_repro.inc
similarity index 73%
rename from meta-initramfs/conf/include/non-repro-meta-initramfs.inc
rename to meta-initramfs/conf/include/known_non_repro.inc
index c05f59d1a2..6395d20fc1 100755
--- a/meta-initramfs/conf/include/non-repro-meta-initramfs.inc
+++ b/meta-initramfs/conf/include/known_non_repro.inc
@@ -1,3 +1,3 @@
 # List of known non-reproducible package of the meta-initramfs layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_INITRAMFS = ""
+KNOWN_NON_REPRO_PACKAGES_LIST += ""
diff --git a/meta-multimedia/conf/include/non-repro-meta-multimedia.inc b/meta-multimedia/conf/include/known_non_repro.inc
similarity index 89%
rename from meta-multimedia/conf/include/non-repro-meta-multimedia.inc
rename to meta-multimedia/conf/include/known_non_repro.inc
index b02de42eb9..524c3c80dd 100755
--- a/meta-multimedia/conf/include/non-repro-meta-multimedia.inc
+++ b/meta-multimedia/conf/include/known_non_repro.inc
@@ -1,6 +1,6 @@
 # List of known non-reproducible package of the meta-multimedia layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_MULTIMEDIA = " \
+KNOWN_NON_REPRO_PACKAGES_LIST += " \
     crossguid \
     libcamera \
     libcamera-dbg \
diff --git a/meta-networking/conf/include/non-repro-meta-networking.inc b/meta-networking/conf/include/known_non_repro.inc
similarity index 95%
rename from meta-networking/conf/include/non-repro-meta-networking.inc
rename to meta-networking/conf/include/known_non_repro.inc
index 16240df059..68d293ff7f 100755
--- a/meta-networking/conf/include/non-repro-meta-networking.inc
+++ b/meta-networking/conf/include/known_non_repro.inc
@@ -1,6 +1,6 @@
 # List of known non-reproducible package of the meta-networking layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_NETWORKING = " \
+KNOWN_NON_REPRO_PACKAGES_LIST += " \
     babeld \
     babeld-dbg \
     dhcp-relay-staticdev \
diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/include/known_non_repro.inc
similarity index 98%
rename from meta-oe/conf/include/non-repro-meta-oe.inc
rename to meta-oe/conf/include/known_non_repro.inc
index ae4fb1d194..e621259466 100755
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ b/meta-oe/conf/include/known_non_repro.inc
@@ -1,6 +1,6 @@
 # List of known non-reproducible package of the meta-oe layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_OE = " \
+KNOWN_NON_REPRO_PACKAGES_LIST += " \
     apitrace \
     apitrace-dbg \
     asio-dbg \
diff --git a/meta-perl/conf/include/non-repro-meta-perl.inc b/meta-perl/conf/include/known_non_repro.inc
similarity index 86%
rename from meta-perl/conf/include/non-repro-meta-perl.inc
rename to meta-perl/conf/include/known_non_repro.inc
index 9082691f67..81da990ba8 100755
--- a/meta-perl/conf/include/non-repro-meta-perl.inc
+++ b/meta-perl/conf/include/known_non_repro.inc
@@ -1,6 +1,6 @@
 # List of known non-reproducible package of the meta-perl layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_PERL = " \
+KNOWN_NON_REPRO_PACKAGES_LIST += " \
     libencode-perl-src \
     libhtml-tree-perl \
     libhtml-tree-perl-doc \
diff --git a/meta-python/conf/include/non-repro-meta-python.inc b/meta-python/conf/include/known_non_repro.inc
similarity index 95%
rename from meta-python/conf/include/non-repro-meta-python.inc
rename to meta-python/conf/include/known_non_repro.inc
index 03d3fefba5..71cc6efd43 100755
--- a/meta-python/conf/include/non-repro-meta-python.inc
+++ b/meta-python/conf/include/known_non_repro.inc
@@ -1,6 +1,6 @@
 # List of known non-reproducible package of the meta-python layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_PYTHON = " \
+KNOWN_NON_REPRO_PACKAGES_LIST += " \
     python3-evdev \
     python3-evdev-dbg \
     python3-evdev-src \
diff --git a/meta-webserver/conf/include/non-repro-meta-webserver.inc b/meta-webserver/conf/include/known_non_repro.inc
similarity index 80%
rename from meta-webserver/conf/include/non-repro-meta-webserver.inc
rename to meta-webserver/conf/include/known_non_repro.inc
index ee998ea961..f7461e83d1 100755
--- a/meta-webserver/conf/include/non-repro-meta-webserver.inc
+++ b/meta-webserver/conf/include/known_non_repro.inc
@@ -1,6 +1,6 @@
 # List of known non-reproducible package of the meta-webserver layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_WEBSERVER = " \
+KNOWN_NON_REPRO_PACKAGES_LIST += " \
     netdata \
     netdata-dbg \
     php-phar \
diff --git a/meta-xfce/conf/include/non-repro-meta-xfce.inc b/meta-xfce/conf/include/known_non_repro.inc
similarity index 80%
rename from meta-xfce/conf/include/non-repro-meta-xfce.inc
rename to meta-xfce/conf/include/known_non_repro.inc
index aad6b0c24d..b227b29cd5 100755
--- a/meta-xfce/conf/include/non-repro-meta-xfce.inc
+++ b/meta-xfce/conf/include/known_non_repro.inc
@@ -1,6 +1,6 @@
 # List of known non-reproducible package of the meta-xfce layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_XFCE = " \
+KNOWN_NON_REPRO_PACKAGES_LIST += " \
     catfish \
     libsamba-util0 \
     samba-dbg \

