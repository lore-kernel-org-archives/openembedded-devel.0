Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.24710.1619986217435662278
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 May 2021 13:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kasoWU2B;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id w3so4864675ejc.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 May 2021 13:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=o/rHtRXS/73zE7TOJvbH42qXhqI//vL0rXOhpExLZbc=;
        b=kasoWU2B7JpCcyd1X8PSImfeI9IhPahiMzPIhcfiPVpI/GpfjT7wC0eHrjNvLkIQ8B
         tu5zElCV86GvwYRuU/wvYQaL39edxATsrNZdB+5o+ReKPqWaXQeOXV+8ykD4LQ0RAGEu
         CX4o9fPMs6K/rsirFzZpXfKtNoBQx4HwSgnQWP53r24swOqyZWQS9A4MidyJCTTbCZMb
         ImiSe98HMnhhKIrLFRJT5E/007Wn2TeqQYgePmht9oPrZfB6lzhhWhftZWYlR0ll+wgz
         c6PQj6e2Hmndv+qkrPhQglUo/Ol52QwQjghmO5MpkAhQTpBUDOEYm8HHptb4BObH+Cvf
         kjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o/rHtRXS/73zE7TOJvbH42qXhqI//vL0rXOhpExLZbc=;
        b=JDqOXjo9TP8FCkOzuB3yXhsI6qWci17ul92vSdSR8yJuNGKh2xPD6FRuvx3o+V5FBD
         RQTISHwAtU4iLMDdArGFyqkR8F1gkzN/f22mpwzZ4X+9ywcRtfv467AIy7w87g7EP+sr
         r2D4KtlOIwaQvgL3Wbi/uNX/eTmmGmP6bFHRYKepCfWKcIt15SsPGX2MBOwp/PFiAuMu
         ZWV74vRnYzebj6C2SqPQvtfMlZpmEa+afZHr8/8JudRuiGFlYXTv3+szZOL4TfgAXbA7
         P0NU/YPQ0hEDr5b24hGq1xtOS2v/3M/FWodpBLTbZGxM/o66/QFhQiT4h6Po2fTOpbdN
         n4EQ==
X-Gm-Message-State: AOAM530BLO5cbRXckSLFaz8oCd5IcwBDzOhY9WaiGZOFC0xKsrur4eGB
	IZ36eIq9dNKXidFT4Gi3JU8NbK1x0nc=
X-Google-Smtp-Source: ABdhPJwadXwt2aGyYPW9PKZWnp7ZF0IlSPPFF/MG7VDTB5Al8foaKxz7IbFuXcEnmDmXxGX0B9EkLw==
X-Received: by 2002:a17:906:a155:: with SMTP id bu21mr13902850ejb.400.1619986216026;
        Sun, 02 May 2021 13:10:16 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f3e2e361c96f36d2ea84abd.dip0.t-ipconnect.de. [2003:f0:7f3e:2e36:1c96:f36d:2ea8:4abd])
        by smtp.gmail.com with ESMTPSA id i6sm10920132eds.83.2021.05.02.13.10.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 13:10:15 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] mutter/wayland: replace xserver-xorg-xwayland by xwayland in rdep
Date: Sun,  2 May 2021 22:10:07 +0200
Message-Id: <20210502201007.1044139-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210502201007.1044139-1-schnitzeltony@gmail.com>
References: <20210502201007.1044139-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* xwayland is in better condition than xserver-xorg-xwayland
* by default xserver-xorg does not set PACKAGECONFIG xwayland any more. So
  xserver-xorg-xwayland turns into an empty package and that causes trouble
  in do_rootfs.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb b/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
index a3e479869..adbfcd6d7 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
@@ -57,7 +57,7 @@ PACKAGECONFIG[remote-desktop] = "-Dremote_desktop=true, -Dremote_desktop=false,
 PACKAGECONFIG[sm] = "-Dsm=true, -Dsm=false, libsm"
 PACKAGECONFIG[profiler] = "-Dprofiler=true,-Dprofiler=false,sysprof"
 PACKAGECONFIG[startup-notification] = "-Dstartup_notification=true, -Dstartup_notification=false, startup-notification, startup-notification"
-PACKAGECONFIG[wayland] = "-Dwayland=true,-Dwayland=false,wayland wayland-native, xserver-xorg-xwayland"
+PACKAGECONFIG[wayland] = "-Dwayland=true,-Dwayland=false,wayland wayland-native, xwayland"
 PACKAGECONFIG[wayland-eglstream] = "-Dwayland_eglstream=true,-Dwayland_eglstream=false"
 
 # yes they changed from mutter-4 -> mutter-5 recently so be perpared
-- 
2.30.2

