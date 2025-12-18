Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63732D6D230
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 15:09:35 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44265.1766070566502855615
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 07:09:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZI3r11Q8;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso9799865e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 07:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766070565; x=1766675365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zgXoIoOR0tx3geMsNY1i91nQQKTwgKJwmmd1f+S/4PY=;
        b=ZI3r11Q8teJ68NgPDBwkeFluhJ/qs6xV61PKhLdSU/bbG9t1b/WWasrnKNJv9fiF6L
         6n8yNXJOo5weeu3phDO1WFWdaAILXDaYDyQO/Cp+RAlcXuuKviowMNizKjUjfKvm6L5V
         Ih4aZoCdEKCnLwDOanO5hmGGpnz4bWU9hZ7x3+JXylG+khtJ0AtY8QloB6KkZfHpwtX/
         DsEpme120f/29X1+pJ2tdumGoMEL0S+8I4o9brAsfBdP2m+rWHoPHstxgYnQqdMdBKFX
         JnoEqfkdWqLDoguc/xRmUygTe/+HCKPjrVPEmErm6nAG9DIx0Sfc7GntBcMrHC9YdFwv
         +/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766070565; x=1766675365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgXoIoOR0tx3geMsNY1i91nQQKTwgKJwmmd1f+S/4PY=;
        b=YQTel//9QYFnRXAIi/luCwSFmCLzHI4q0vJLj2fb+tFUa/eTNAkKzCFUUJWMq8y7vI
         hghhVwVWHie3AAG69g29OvMFQXuPWUaRAaxvCv+s9WsQuqGq9zPdrbQ3i75uy4MCaFHW
         fexrdcRG27Gx0hZdjbk3k6vKHdzZ2nu2xVGFxp2VPhfQPybQCEOcsChvsW544ip97QDY
         NuvRgGirSq3tvdMmRDz1QPN0ZQV17IXBVuJeyWElF0sWnuclvcBPF9WG2GvSzji4DJP+
         G3QSf4S7n9kcMIXrAdUhlr7nVtp1Oik9Cm7Vcz1ALM3loS2O2SMjr1w9fUTkTOT7Fs5l
         tdqg==
X-Gm-Message-State: AOJu0Yxw3zaP9nXmEU79CHACsLAy7kV1uHnOk890ZCi1IFqPWWBMsEt0
	3pfz4lN1gv1Walr+3RPcGngThdluVSbTPsKBJw/IRF/THQCp0rfJS16m8JM0VA==
X-Gm-Gg: AY/fxX5jVdmF0hbWVDCFb8suthPhXTMmSyuqlixt+5W6p5kM/FUvcu0rDq/dhGv3lYx
	ymHaho9ThBxImfwFBLeB8tite38zCRZXGH34jYI2kB5Cns5lZkabYlEAAgNxGbmCOK4IX8Rl3z2
	LuDrSj6fkQe2w7EUXbqoNQr535pgCsGLBczqCBFGPes4M/nDlS4gjECFmN+LNATW45sW23UK9Jm
	8oQeWB2hOgAJWRbn2yBTkufHULkIBp7FDZRbx2RFikbgJ6G+8ToyDjURvSRu9Eh/5U9xdn/Y8JT
	n2HYVkwdV09l0A4J2Jc+C4fXcwBAMul3F2nY+obNq3x6V9UoQ+dBUw/Fwc8facTlCpA5Jr/bz8f
	5LAhmfdjHn+lxOhFxY0JurVbKYBP4fHR+26J488/iF0tPEdbcCNRv4ph/+8X25aFaLXp1TEwDOg
	7PXA0CmYi0
X-Google-Smtp-Source: AGHT+IFF8zUCT3D+sO2gpyse3xCnszIXUTO3dSnytSrBhXSOpJr0pPGxWhF/nS1Uw7UVUGYO0Du7Vg==
X-Received: by 2002:a05:600c:4706:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-47be29c83femr34304015e9.11.1766070564641;
        Thu, 18 Dec 2025 07:09:24 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3aa9971sm15075315e9.13.2025.12.18.07.09.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:09:24 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] keybinder: upgrade to latest revision
Date: Thu, 18 Dec 2025 16:09:22 +0100
Message-ID: <20251218150923.3597632-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 15:09:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122768

The application does use tags and version, but their versioning patterns
are all over the place. I kept the eisting PV declaration due to this (and
because this seems to be the very last upsteam change - the repository
looks abandoned).

Changelog:

* Fix ``keybinder_bind`` and others to not crash on non-X11 displays.
  It simply returns FALSE, failing to bind the key.
* Add new API:
  gboolean keybinder_supported()
    Return TRUE if on key bindings are implemented for this
    configuration. (Right now: only TRUE if gtk says there's an X11
    display)
* Fix deprecated directives in build system

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-support/keybinder/keybinder_3.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
index bbd7c866e1..ec70f8e82b 100644
--- a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
+++ b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
@@ -9,9 +9,9 @@ DEPENDS = "gtk+3 gobject-introspection-native \
 LIC_FILES_CHKSUM = "file://COPYING;md5=1f18f9c6d8b4cfcc7d7804a243a4c0b4"
 
 
-SRCREV = "736ccef40d39603b8111c8a3a0bca0319bbafdc0"
+SRCREV = "04ae06724d914c7d4fec6a2723edf9c6320ec502"
 PV = "3.0+git"
-SRC_URI = "git://github.com/engla/keybinder.git;branch=keybinder-3.0;protocol=https \
+SRC_URI = "git://github.com/engla/keybinder.git;branch=keybinder-3.0;protocol=https;tag=keybinder-3.0-v0.3.2 \
 "
 
 RDEPENDS:${PN} = "gtk+"

