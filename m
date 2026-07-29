Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56525C54F55
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:38 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3036.1785293077030843418
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V4A7IUo1;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-382ef647e20so472179a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 19:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785293076; x=1785897876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCxnW9wxo5UCJzCLbD2I5bqjpAXSYaUxw9taqBVJoq8=;
        b=V4A7IUo1nUsCL15dn46zZwqYOkb4COn3WyNVK9nPcvqz4bDlfppLRr1QsLuW3wxGGh
         jUBPsPUAc6CeyqRLNoxVAm/03HlPyIjIW14XLiSuDWm0zVc5v74o+dUtYTv/B6NOF4+S
         kwcwc8FailQZIf/3Yl2IGiGMf9roraegLRL9KhFqe27o82eUeQTlFnxhBWpdZzmu393b
         PBub4SNdvatMJ8KUbfYwgbMcMqyKePpGFlA7ekRyghY4RkfVTeratDdaOR/ODkOkNYqq
         v3nEmd35NMy8ZOK/ob0jboO1hjd1wgGWiH9R1Fj1BTkkZd8NqYLUugJJHXaNxBXbKVpx
         Bgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785293076; x=1785897876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCxnW9wxo5UCJzCLbD2I5bqjpAXSYaUxw9taqBVJoq8=;
        b=dxiNaeLZf/l756W2MWxMKrKoWXj8EZ5DgUMwD5LV9giNBH+3UPHYSGFmr+OMsdqIgX
         Npn5XHiHYuYkIYN5fyFeTYMQn77AZvf9YkeXLnB4hhAyBpS/kq/2L7E/TkJO+yiCcJ6v
         vZtbHNZC4cc8mKB1yMi3Qd48DtHo6wohvGvWXS5O4YUw6mUUpS4iRb4mf/5vFI6lTPQk
         /98TN4HzFURl0P3XLAMTSgZiXZw8hnbTDtmYgQrOSxc8huLN2ymjwyfm45K0VXyWKV9y
         8ArTuA5tgPOtSff+iLBWjTVKddjWGTW+j9WoPJ2zWrN0nu4Q5hCs2ZUiR/rKpcyzYg1+
         FmzQ==
X-Gm-Message-State: AOJu0YzanePWQkRc75o/nJszZHfupmjvtWCLa1hmDxLm6w0LsJaqLr+d
	Un02CRKcV6DXRwtkG/Q10I3xN+bCYREDoLPRbY9e8tX8YFWKLijaZZcENtd59piy
X-Gm-Gg: AR+sD13l3RzhDX3uPZrbS4sCH5DGoRgmXEwC9zPxB6WWQmge4WSq9pq3LaVOxgXdUtg
	yhOEe3fCekfVdD1caAB5xGc8K0Z+S5NppQ65hNq0C0WuOW8vWmEtoN+GBfNGSXjpUwnWnV3azwf
	yyjFVIK4oAkKPUmSGFXw3xCp0Z8crmhDJTSE7cdRnmSvl7HCB+yxZjhJQ9bnNmp7HHsg8lwRUlX
	Ygt4JRUXUAFVgSz9LD0pjMu6tBS2mJHfd1Ck14aAJ2BGFerLg7i5fHoLFEYXiJSN9pxZ++AnFkV
	RZK19IwL1eRc4hUwcs1wUiHIySsmkSHhIoROk19qTfnuVhY0VqM+P5OgSYlTE+Z4vR0USn1J93f
	0csrWZW96pdMBEQOLc7FPydewGdV7S6E46Mh3PuEPKhWtCvBSD6xEJnvfVa/lDuqE86tavdYPqU
	6q9H/5kJJn+DxfPahsqYZXiT0BWLVLMqbliuWe8dlPH308m3QwdFaeyFuvKAxT/ArHG87BcuzGQ
	wOFqse03bE1a6xv+pg2o1JRsjFLwwtMcOFR5cjs0HSXntXFkk7ABKPUgGixTD65QTLcXhanKGTU
	nNjk+N1je+pQmDoDx1lIekSQHRQC6Aibn4naNd8K0wRaPxXqjZg59r82LA7GpoYDECEbw1lZ6sN
	5I1s=
X-Received: by 2002:a17:90a:e7ce:b0:381:cef1:11b0 with SMTP id 98e67ed59e1d1-38f6a54400bmr4765246a91.33.1785293076293;
        Tue, 28 Jul 2026 19:44:36 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm5787402c88.5.2026.07.28.19.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:44:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 12/18] fwupd: upgrade 2.0.19 -> 2.1.7
Date: Tue, 28 Jul 2026 19:44:14 -0700
Message-ID: <20260729024420.2328180-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
References: <20260729024420.2328180-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128528

Deliberately switch from the conservative 2.0.x branch to upstream's
recommended 2.1.x line (upstream describes 2.0.x as "provided for the more
conservative distros" and recommends 2.1.x for most users).

Notable changes across the 2.1.x arc:
- Remove the flashrom plugin (2.1.0).
- Add native CBOR parsing and drop the libcbor2 dependency (2.1.2).
- No longer depend on json-glib, libarchive or protobuf-c (2.1.2).
- Add a systemd-pcrlock plugin wired into UEFI updates; add MTD lock and TCG
  disk-encryption security attributes and support for externally-managed EFI
  signature lists; enable more plugins when compiling for Android.
- Security/robustness: require trusted metadata for device updates, disallow
  force installs over D-Bus, and numerous segfault / out-of-bounds-read fixes.

2.1.x removed the cbor, libarchive, plugin_flashrom and protobuf
meson options. Removed plugin_flashrom and protobuf from the default
PACKAGECONFIG, deleted the now-dead PACKAGECONFIG for libarchive,
plugin_flashrom, protobuf

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-bsp/fwupd/{fwupd_2.0.19.bb => fwupd_2.1.7.bb} | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)
 rename meta-oe/recipes-bsp/fwupd/{fwupd_2.0.19.bb => fwupd_2.1.7.bb} (88%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.19.bb b/meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb
similarity index 88%
rename from meta-oe/recipes-bsp/fwupd/fwupd_2.0.19.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb
index 586f7ad1f9..3a30b5d1ee 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_2.0.19.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb
@@ -6,7 +6,6 @@ DEPENDS = "\
     curl \
     gcab \
     glib-2.0 \
-    json-glib \
     hwdata \
     libjcat \
     libusb \
@@ -19,7 +18,7 @@ SRC_URI = "\
     https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "3bb7a4a1e2d00f0ab513e4c667d7bf5a3ff34a9802757849d3fedf07dd40ddbb"
+SRC_URI[sha256sum] = "472e9426f7a1b18fa9d199666c15482d4ee51ea35e916ca53bb3ca25919edb10"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
@@ -43,9 +42,7 @@ PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'bluetooth polkit', d)} \
     gnutls \
     hsi \
-    plugin_flashrom \
     plugin_modem_manager \
-    protobuf \
 "
 
 PACKAGECONFIG[bluetooth] = "-Dbluez=enabled,-Dbluez=disabled"
@@ -53,7 +50,6 @@ PACKAGECONFIG[firmware-packager] = "-Dfirmware-packager=true,-Dfirmware-packager
 PACKAGECONFIG[fish-completion] = "-Dfish_completion=true,-Dfish_completion=false"
 PACKAGECONFIG[gnutls] = "-Dgnutls=enabled,-Dgnutls=disabled,gnutls"
 PACKAGECONFIG[hsi] = "-Dhsi=enabled,-Dhsi=disabled"
-PACKAGECONFIG[libarchive] = "-Dlibarchive=enabled,-Dlibarchive=disabled,libarchive"
 PACKAGECONFIG[libdrm] = "-Dlibdrm=enabled,-Dlibdrm=disabled,libdrm"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false"
 PACKAGECONFIG[metainfo] = "-Dmetainfo=true,-Dmetainfo=false"
@@ -63,8 +59,6 @@ PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
 PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,gcab-native"
 
 # TODO plugins-all meta-option that expands to all plugin_*?
-PACKAGECONFIG[plugin_flashrom] = "-Dplugin_flashrom=enabled,-Dplugin_flashrom=disabled,flashrom"
-PACKAGECONFIG[protobuf] = "-Dprotobuf=enabled,-Dprotobuf=disabled,protobuf-c-native protobuf-c"
 PACKAGECONFIG[plugin_modem_manager] = "-Dplugin_modem_manager=enabled,-Dplugin_modem_manager=disabled,libqmi modemmanager"
 PACKAGECONFIG[plugin_uefi_capsule_splash] = "-Dplugin_uefi_capsule_splash=true,-Dplugin_uefi_capsule_splash=false,python3-pygobject"
 

