Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.9010.1623133349231575199
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 23:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ksadw8mF;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id m18so20178350wrv.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 23:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sWAYkr24xHa8O34hYbLCZVIjXBtZhKH1e26WVgNkpAA=;
        b=ksadw8mFo8NkhQ+oAW+i29fPnP6mSGQE/KhaG5tRiSTriUaPX+vE3mSAFYJ6GBxDjY
         iQ+zg4wZnp6CCQKCNJ4mJeIn/z8mtFaDseVmqXj4gTm3zU0G+Yb+IH8NawRoMqziT+7B
         b06MjqM1x/ZIoJRYZAzArFSznUY1uYiHNLtJ5hk38lApgpFpHZtK2XH9NAGg2wgGC2Oq
         2ssuZ3juMyzw0Oe0lkdX6EjKBbbT6wIfUc1fk4xubXhKzyxcKnsooEo+4dfeJh5FYV/r
         g0YwZoiEsyEt8DxNVQBGC0r8rL43o4ZlEg7H5eorW1sS4yngNv2WF2+MbDNrwmlaqUYz
         ZvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sWAYkr24xHa8O34hYbLCZVIjXBtZhKH1e26WVgNkpAA=;
        b=lJ7dQddkCGZJ42fB3hbawbIsiArNWp0yqBCF4bimqdkVyQEq9ZgntFA9+wnE29MHmJ
         E+dyTfh7rH4WVWuEDOf8E5XlWuvlYvkZ6+vmKjNQc0yJGpJ6Hutvva+rtOkk7MCcthhj
         voFY3yvquldcmnQ1TmsIqvKalP16FSYLt9UbIKqA+IRT9oKpzd/YE07aTWTHMX9j1gem
         NWmMHV+kU4D9SHK9hN3J2l4QcFU2BY3wFlleoFpnhnnZQEQn+jeGZ2ITUTYv3emnZS3C
         C4CsEIAcddH3IKMnSIO0u67kfvfQVZ/JOi6jX8VliQ8IS1XEnfvoqKthdWoTapl+XhN4
         sH/g==
X-Gm-Message-State: AOAM531zDhUE7VJ+embMPhhXmtvxVI3KdBMnKCRcv3ofMJwspa7Tn2oS
	Qp/io2nVdpif84N0I42/SrB2nHiFoFHSbg==
X-Google-Smtp-Source: ABdhPJzj63sK5W12cgf98afKiX99mBvWxt42odBhVHprQN7xhOP39RP85TuEtURRrszXZ6wmxnSa9w==
X-Received: by 2002:adf:fd90:: with SMTP id d16mr20508156wrr.35.1623133347302;
        Mon, 07 Jun 2021 23:22:27 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e97639a19d79e95f79a.dip0.t-ipconnect.de. [2003:f0:7f29:7e97:639a:19d7:9e95:f79a])
        by smtp.gmail.com with ESMTPSA id f18sm16493969wmj.13.2021.06.07.23.22.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 23:22:26 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/4] remmina: upgrade 1.4.17 -> 1.4.18
Date: Tue,  8 Jun 2021 08:22:09 +0200
Message-Id: <20210608062212.2887426-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

List of changes:
full changelog

* [SNAP] Removing unsupported architectures !2268 @antenore
* Try more shells as launcher if default isn't found !2269 @cirelli94
* Minor fixes for v1.4.17 !2270 @antenore
* SSH session improvements !2271 @antenore
* Fixes - Auto-start file created on tray icon disabled !2272 @antenore
* RDP: Remove older usage of ClientHostname @giox069
* Fix libfreerdp version check @giox069
* Explicitly set user resolution to a multiple of 4 !2273 @antenore
* Code refactoring - ASAN exceptions !2274 @antenore

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../remmina/{remmina_1.4.17.bb => remmina_1.4.18.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.17.bb => remmina_1.4.18.bb} (95%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.17.bb b/meta-oe/recipes-support/remmina/remmina_1.4.18.bb
similarity index 95%
rename from meta-oe/recipes-support/remmina/remmina_1.4.17.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.18.bb
index ef7876786..954da272e 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.17.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.18.bb
@@ -25,7 +25,7 @@ DEPENDS = " \
 DEPENDS_append_libc-musl = " libexecinfo"
 LDFLAGS_append_libc-musl = " -lexecinfo"
 
-SRCREV = "0ef1621b3e16b3168213147a2bfca39da2c2668f"
+SRCREV = "045862cc7d7dd986b349c68131df2f86b9b1cd9c"
 SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.31.1

