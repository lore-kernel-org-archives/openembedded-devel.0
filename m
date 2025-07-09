Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28492C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 08:13:33 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.10530.1752048807021107844
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 01:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ahJxuknH;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso2305438f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 01:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752048805; x=1752653605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+gvlR5wlYciB2PoNehi6KkBiNcJl31Qqy2hna7aGhLg=;
        b=ahJxuknHGfGPUssBCBaUiR4T4/GzGuOIQGcMAEFPSBCw/O4lF4GRcp11PifrV4dOcf
         9Kv0nTegm+sSYm5VSdVWkfsVTN6GC4CmebT8bTG9WfEwShxjxV2ThLGCYDlDOq1mKI1r
         g+YR451GmhOWybZRyF3MQ4Ww1iVDIsWJ7T2jS65R6dlVU1F7l5bsXZ1oufWsAlxHIdAe
         YF9lnYXpfgbWoq6rzv9NKSghuq+DbPTrrACcB7iBOTOGOR75cxnDWTLHRCqJr2I6FRiJ
         1nyctsSM3JmvwtZxPg2Y2ZS0KvHSgRzmBFN+e+kRGCVfSleY+QzWQAOcVLSOkO3yYe2o
         p06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752048805; x=1752653605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gvlR5wlYciB2PoNehi6KkBiNcJl31Qqy2hna7aGhLg=;
        b=xBkEb9A1nXebQ/L6fpbj4GukIokWrslOcrKz88jrHT3tJG4Q6gO48RY7LsHV5YBQfR
         DffTW57b0dpbW759G6R/I+JxW3zwnMOjrWqFOVw9E5ne7Du4Pm12fIqEnVPOfnrQbu4c
         3cs3Y8w4A7RJ9LoYdYXiuPaZqVKgfwhEzc43YALXf/VAMv8iJxuMkSOWyfgaodmD1voS
         Vry8YZXWGKj/1sURaSC7i/XockhXKSISftiifuqytaUMaQIn5e/5PNITeYo3wrA1bZb0
         E3/2GK4AsfJpaRBQoxfwi79mhQeDnrt+qb9VCIsIcJ2Xo1sUdNFsD11Xz1mrLf2z2mqA
         h7Ig==
X-Gm-Message-State: AOJu0YyHRBfH3ykr5tTZdKFnbZ3a6hiJKav/HEMmnjKsCDkgV3jDLh+R
	kagjolXQPWMVIW0L1+v141JIBrTPKm7uwFA2ykIEPQxOYx28Kz4OvjSIrp/XhQ==
X-Gm-Gg: ASbGncuy6kg0z3TD2TvrTSnssIflXw7iYOf1yBoNScwcYvDcdFPeC8lopC2B8Cn1lg4
	tKeZatqgqQ7cxtjrGPnM6PJJGbf+7ZfcPCJjhWNQYZw81XSREuEBbSOySGRElXQTBwtiD4+jjMZ
	Ea6wfHSPFzy291msL/BpelLvqwhefH9uJbElF0+hsh31B6tTQD9T8PSUZ5qvmu146Kkp5mlCuUU
	JYbyh5VLvQEWC2+dPd/xD9ewYZUcYmv1XoB8f11YnI+iX2uUuC82dDv3NsuPJS38zgV1Vdt4+tT
	O6UX2C1GNCj2B9B7AUB9xUDiDdkis/b2HNS+ilqSDa7DrQdRwqZwOZJ3Jp6lS08ywy4Rgi0nTID
	tHZYoIbe2wS6zoz0iUWY=
X-Google-Smtp-Source: AGHT+IGAzjvwduc8xpBhY426zjlDR3eonKm+84xp40JE0usWvnsUvcGEJKpn3jsFNRZ3sn5b/QDCmA==
X-Received: by 2002:a05:6000:3111:b0:3a4:eef5:dece with SMTP id ffacd0b85a97d-3b5e452a3bfmr1146498f8f.35.1752048805198;
        Wed, 09 Jul 2025 01:13:25 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b4708d0ed9sm15252359f8f.38.2025.07.09.01.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 01:13:24 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: hiagofranco@gmail.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv2] gpicview: enable gtk3 PACKAGECONFIG only when gtk+3 is available and depend on libx11
Date: Wed,  9 Jul 2025 10:13:18 +0200
Message-ID: <20250709081319.8705-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 08:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118345

From: Martin Jansa <martin.jansa@gmail.com>

* add dependency on libx11 and require x11
* x11 doesn't seem to be optional:
  https://github.com/lxde/gpicview/blob/master/configure.ac#L57

| checking pkg-config is at least version 0.9.0... yes
| checking for gtk+-3.0 >= 3.0.0... yes
| checking for x11... no
| configure: error: Package requirements (x11) were not met:
|
| No package 'x11' found

* use gtk+ when gtk+3 isn't available to fix:
  https://lists.openembedded.org/g/openembedded-devel/message/118307

| checking pkg-config is at least version 0.9.0... yes
| checking for gtk+-2.0 >= 2.12.0... no
| configure: error: Package requirements (gtk+-2.0 >= 2.12.0) were not met:
|
| No package 'gtk+-2.0' found

  with combination of required x11 at least one gtk version should be
  available (in builds with x11 in DISTRO_FEATURES)

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: add gtk2 when gtk3 isn't enabled to fix:
    https://lists.openembedded.org/g/openembedded-devel/message/118307
    squash with x11 requirement

 meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb b/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
index dab11a02bc..01ba65728c 100644
--- a/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
+++ b/meta-oe/recipes-graphics/gpicview/gpicview_0.3.1.bb
@@ -8,14 +8,16 @@ SECTION = "x11"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-DEPENDS = "glib-2.0-native intltool-native jpeg"
+DEPENDS = "glib-2.0-native intltool-native jpeg libx11"
 
 SRC_URI = "git://github.com/lxde/gpicview.git;protocol=https;branch=master;tag=${PV}"
 SRCREV = "ca13623c6176585db4759ce4371fbf89c56fa630"
 
-inherit autotools mime-xdg pkgconfig
+inherit autotools mime-xdg pkgconfig features_check
 
-PACKAGECONFIG ?= "gtk3"
+REQUIRED_DISTRO_FEATURES = "x11"
+
+PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk3', 'gtk2', d)}"
 PACKAGECONFIG[gtk2] = ",,gtk+"
 PACKAGECONFIG[gtk3] = "--enable-gtk3,,gtk+3"
 

