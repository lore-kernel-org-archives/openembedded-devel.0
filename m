Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF58FC4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:53:27 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.18886.1714391603471022548
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 04:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PgiyO6oZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516d2600569so5206911e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 04:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714391602; x=1714996402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ab5f26LrtdgdaxmG+8Wtm7VeOXNdbURF7NQIh9C1qfw=;
        b=PgiyO6oZz5qKatIInTL3onfz0tD3QH/VIY3cwmYb431qucEcc0+nMb7x6wzh81g+Rx
         nxZ1VSyEw59Yf9LI0fknzmPSD8SJ7Uebt66f35WGvD50pEXdL36VwzWQ89EgtIhBiczk
         TFT5l9wle8/dgaCEkMhoYLmi6JfNNb6aVesyCb+PqkQBnDjq47UqTmInyNkJgvaaDl6/
         3n7vZUq/XJm4XbuY1Zkm9QCyf472BU9cSspBQQdt2rJnnB+EXb2vSrAYcixgj4TszFqM
         XA4AMP3vqz2EEuz1eOFQe9mmpWJa+W0uvbiwF9Ro7BsVwJQ3Rfp+Zn61+lsiGKza/hqY
         GmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391602; x=1714996402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ab5f26LrtdgdaxmG+8Wtm7VeOXNdbURF7NQIh9C1qfw=;
        b=jsHnFDPTSHpmz7wfwr2XTVxMaePe6dDrrSJAhzEkByra/AECjCt4oZWxr1HDpiC12D
         nzibSHqcSQjejK9W5GrZtyhEUSBV4Q0EQkT/HmSsG7MV5N0aLn1UBW6I9SY6vhrNF71g
         492pR9epsYEcusQgHzdgYOjD7lkVc+YBXCp0lMOVEPgsN08izh61Ut9nq3LFMF7uarct
         SL7a79EiS1yt08BXNmgQOQ4TYC2rVgiMR2m/ylGCrkGOtmtP9+4T1/icWnVFZKKpNAZ5
         4sIJqzzblPTZdUF8VNyFrMwZ4stQU1DrfIZAxsYLOKIrOlsLzzOGaAvYt0MsKndbHcod
         TQbw==
X-Gm-Message-State: AOJu0Yy0wQXhsmnu8pxpIIKz3KhVar4m/id2c1mRInLbPFmUHakUjHSw
	FcZ33m3kTN3bJpWaTBcK9wIlKkhFtu3rjGo8kfZ4RF0Ld2vSXgUptaIXLg==
X-Google-Smtp-Source: AGHT+IGflwRZyHgNEUqVzlg8jNoautBeSgfnOwky+oztrVY9vNSfWl2VgIGO52wP9FTUVWXyjwUxwg==
X-Received: by 2002:a19:5f19:0:b0:51b:e0f0:e4f8 with SMTP id t25-20020a195f19000000b0051be0f0e4f8mr4518826lfb.31.1714391601304;
        Mon, 29 Apr 2024 04:53:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id p14-20020a05600c1d8e00b0041bab13cd74sm11236149wms.17.2024.04.29.04.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:53:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] libgweather: fix build with gobject-introspection 1.80.0
Date: Mon, 29 Apr 2024 13:53:16 +0200
Message-Id: <20240429115316.3138488-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 11:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110179

gweather build is running a python script build-aux/meson/gen_locations_variant.py
which imports g-i data at build time:

from gi.repository import GLib

Previously this would import the typelib file installed by native
g-i (which would likely not match the cross target, but nvm). New
g-i version no longer installs those files, so the options are:

- run the python script with target python inside qemu
- copy the needed typelib from target sysroot into the native one.

I took the easy way out.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.2.bb b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.2.bb
index acf288528..e0c8724a3 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.2.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.2.bb
@@ -28,3 +28,7 @@ FILES:${PN} += " \
     ${datadir}/libgweather-4 \
     ${libdir}/libgweather-4 \
 "
+
+do_configure:prepend() {
+    cp -f ${STAGING_LIBDIR}/girepository-1.0/GLib*typelib ${STAGING_LIBDIR_NATIVE}/girepository-1.0/
+}
-- 
2.39.2


