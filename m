Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.12367.1612990553384913321
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Feb 2021 12:55:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f1wmB9UD;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id i9so3142262wmq.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Feb 2021 12:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=AaHLxT6/00BfYWVE70acFY4ga7tDazAwt533PCgpUZ0=;
        b=f1wmB9UDGNsk0+gNVplv/wnBX2BVze9H8nBRilU8cSdDS/s9aj8ItLKUmSMj5gsFdx
         vKQZKaqQTsFa2mreX5xlYCqqhjoGoJdA/Ibjf+9AwDrgdaNgSeCYQxUDdNy2J/GT2pu8
         fRXMvQdb6Z6g5SNHx3vItsLCmJyDENjsOBM83oAARhgAK15zdRMCoxMxpkhwlW1PfE4s
         ikZgl+WuV7g7yDLQ2pX2ijbIlbaFntCHqjzR7m3v318sWpMMpd+1bCGrAzJxw8c0bf8Z
         KG4sv8HYTc05Ve/0O7OUhXiAytiSLsapLvpBD3UIpgfkqT+tD9aTdo6sPlNNiveFceeu
         oBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AaHLxT6/00BfYWVE70acFY4ga7tDazAwt533PCgpUZ0=;
        b=VvOb5rGGTmaL3TnBKnNk4k3YmyVi457V6butZkK77ajvpZqzOst/QWYhj6a/zeecub
         nQOpg3dQAZa0IXEcpgSq7VdQZbGrIUCcqRDBJpW5k2C7xBa4ckpj+eAVGbnOphV3MG7a
         sAdo5o+NQ902/lgN+9jOsTOSRWivCJhDhujyFD3458N6WvQoPHoyU1tor5NKt2G+FYAY
         p06xbN3MnTEHKtoeHbe3wQvyjwFSWcOJQyGObbPKm3Yfkv1LDz9yrkDl5G42dziwOSIE
         aFrQBo3jOZIXj47/JciT0PzFZx56zvyAvQ5ImvDthMSK2iG/MArPYoBmK6Vz3pwDQhjn
         a8+Q==
X-Gm-Message-State: AOAM533KNN+P4UfgX7qhlu9xla7+HTHX4oPAqmpF+ApIWk18DgFrKL3Z
	JnPDJUiLh2PzOVo+w2A4cesJbbGWzMg=
X-Google-Smtp-Source: ABdhPJzNQ2hHDA8LePCfN/rRrj5L9HFo1hqPzhd+Vc3z0yp6eBjh/IDuY6ti/a7gleaWtMPOHYmXDw==
X-Received: by 2002:a7b:c753:: with SMTP id w19mr896184wmk.41.1612990552058;
        Wed, 10 Feb 2021 12:55:52 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0b5b377382ef15aac10120.dip0.t-ipconnect.de. [2003:f0:7f0b:5b37:7382:ef15:aac1:120])
        by smtp.gmail.com with ESMTPSA id t126sm4521167wmf.3.2021.02.10.12.55.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 12:55:51 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/13] fluidsynth: upgrade 2.1.6 -> 2.1.7
Date: Wed, 10 Feb 2021 21:55:27 +0100
Message-Id: <20210210205538.690009-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210210205538.690009-1-schnitzeltony@gmail.com>
References: <20210210205538.690009-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* a regression introduced in 2.1.0 prevented chorus from being audible when fluid_synth_process() was used (#751, thanks to @chirs241097)
* a regression introduced in 2.0.6 prevented the MIDI player from restarting playback after all files have been played (#755, thanks to @rncbc)
* fix a double-free violation introduced in 2.0.0 after executing the info shell command (#756)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 847a22311..74a2683ac 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -5,8 +5,8 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
 SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=2.1.x"
-SRCREV = "fd9bf6a6b0d10a984d2eb0e0e549700b7aa590ec"
+SRCREV = "e2d67ea77237046b703d537aec90620c22f7f629"
 S = "${WORKDIR}/git"
-PV = "2.1.6"
+PV = "2.1.7"
 
 inherit cmake pkgconfig lib_package
-- 
2.26.2

