Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.1882.1621647345064200628
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 May 2021 18:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HQ3ZYwxi;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id et19so25970246ejc.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 May 2021 18:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pWg4gbsClJjlcTjvAONf6cDhnS27R+nV3xpvsdUbHTE=;
        b=HQ3ZYwxiYFerQIFJWjzRTldC0kstjF5BrWAhVaYOu3LJRwdENO5YbuIIWABq3knHCZ
         bXx7uZDuFeUZF1xV8ywoqdjvfumlOeZ9GOiZRFOte9PlGauEiv0d7Eqnsac6KhVWOU31
         SXDPWkoJWSbhBw8SKTwAmMyAET2d9lloB+S8T4atyFP0tBBg7rNLQDktgR/2szRmTXYU
         fGx/e6FqfNKHW0WHXVcUD6mlCORHPXOV/c7OZCfXQWNtEqyaA1ATmP5are5DPZVgmGHL
         eMNxkfn2RmqrBrjJ38eEYVF+m7oGx+eI60ai59WFHHflBdzA9AF/1aB1MbWL6UtWOFlp
         srmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pWg4gbsClJjlcTjvAONf6cDhnS27R+nV3xpvsdUbHTE=;
        b=G4OcfOcFmzdhqoHtl7f5BWAxkN/WRLcS/6JMzFuzfYsAP6XgbOMecGAuTEqMMTXuhq
         Saw5g1wCFKtwnkVBY/BULfv+pU8i/REiuNj/coCkYWVHmgAVrfFeNCoCCQOEkrHy1b7i
         b4WvOz8jFmAViL+yL3qJbvQ2zEux5xrTI7i081hrhdUrIEaiXj0jCgTP9BYcuY2oqTKU
         /+EuxdQUt3IOWPv7jUrOryIw24U5oxboRlBp48ezRZqCW2DMRmD4NazPj2zwRRMYDQ/x
         KB3nwMGSYX769namp5xJWFLavPUmRExLn9FRA+Bb/PAJ43W2wcWOiK+JChLArUnDCQZv
         3LzA==
X-Gm-Message-State: AOAM5329mJ2/Yvu/WQb6fxdO9yUHoAtOQlYIf5rNURIqGSAjftcYFa4Y
	30TYqSeQsw8e+BFB/bRUmGb6M7yyKpI=
X-Google-Smtp-Source: ABdhPJw0iWOSkUNxt5FuyZZXv2KmRKcOPf+h794CJmIwvkx7Ot+hzi1U9ngxRfsOits7w8T+sCzDuQ==
X-Received: by 2002:a17:906:68ca:: with SMTP id y10mr12815067ejr.318.1621647343688;
        Fri, 21 May 2021 18:35:43 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b69456ae2a4ae47bbb1.dip0.t-ipconnect.de. [2003:f0:7f1a:3b69:456a:e2a4:ae47:bbb1])
        by smtp.gmail.com with ESMTPSA id p9sm5361337edu.79.2021.05.21.18.35.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 18:35:43 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 17/17] libgusb: upgrade 0.3.5 -> 0.3.6
Date: Sat, 22 May 2021 03:35:21 +0200
Message-Id: <20210522013521.588774-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210522013521.588774-1-schnitzeltony@gmail.com>
References: <20210522013521.588774-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libgusb/{libgusb_0.3.5.bb => libgusb_0.3.6.bb}           | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/libgusb/{libgusb_0.3.5.bb => libgusb_0.3.6.bb} (68%)

diff --git a/meta-oe/recipes-support/libgusb/libgusb_0.3.5.bb b/meta-oe/recipes-support/libgusb/libgusb_0.3.6.bb
similarity index 68%
rename from meta-oe/recipes-support/libgusb/libgusb_0.3.5.bb
rename to meta-oe/recipes-support/libgusb/libgusb_0.3.6.bb
index c4b0ff372..2f74013ca 100644
--- a/meta-oe/recipes-support/libgusb/libgusb_0.3.5.bb
+++ b/meta-oe/recipes-support/libgusb/libgusb_0.3.6.bb
@@ -6,7 +6,6 @@ DEPENDS = "glib-2.0 libusb"
 
 inherit meson gobject-introspection gtk-doc gettext vala
 
-SRC_URI = "git://github.com/hughsie/libgusb.git \
-           "
-SRCREV = "1f712812327091c42c62b1ab1148d738d1a22b51"
+SRC_URI = "git://github.com/hughsie/libgusb.git"
+SRCREV = "b0464454048cac6779d4d51f12fe7f37ae4bbd57"
 S = "${WORKDIR}/git"
-- 
2.31.1

