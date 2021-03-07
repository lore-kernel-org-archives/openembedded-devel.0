Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.28268.1615156503984149205
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Mar 2021 14:35:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h5XFjATT;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id mm21so16422024ejb.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Mar 2021 14:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Fek29aFVNK8R//8kpMez85F8630juJ3GQmCstNMFiG8=;
        b=h5XFjATTjZ6eq82ovUOos8iBeqU0dx3DUL+VI4bsknvLwb842EJUGC9+yvEKI+XV8m
         y+wVplMDMeV1NSrj5+32dbcJZkV3Z5RGETrB5u0O34CnfcKg9/BFdYeA2ocitpIEFqXq
         MBaGA3fUXfw/zx/yU33hyEE8l1Ay7DJdhdaHTjiU0KEpOJ2VFyJH7NLkZewf8rA4J9Et
         gXCx7G6pmLVRrdCR4Xf4K/AZKzNp6UOF6YUSEWCnRquD0umpG7CwCHXY2Iz6iUTHhERh
         0HvSU/B/FV5We90IfOKAVEpzSUzx+1tskOzmIiXK2igqMTqd+xBPgUP84mOErT1wT3pR
         xMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fek29aFVNK8R//8kpMez85F8630juJ3GQmCstNMFiG8=;
        b=WJetynZ9qrYbwNWSFkT0PuA3Au8jUnhBaNCsuzR6gPAlJTg3RX0JSvYp58CC6pk0r0
         BrfPgrGH+Q/fsioFTSdvcYrYzRFR5wv065uGjlyQpXdnqZ0rC5bmdBcnIk0JsVlWaNyH
         TyxayCHdYKDc0c1HierXpNB6QcCN+1eXkwyQOkAFMbwVfZ4qtGR0HZfYGOKJ4sjo4y4N
         QnyQeIURVyzo1MSxwWCxEsWbfoVpH5XmC3W+wZfNfEidMCt+APYRB+QXPufKY/otaLSv
         HYn7CUOGYG6SuUlBkxyFUCjEly4HI2zpWY3ZQaS0QuKV1Nbop83aqYGzCD7CdDODLuf3
         mxNg==
X-Gm-Message-State: AOAM530jcxQPb0O5pcVr+H3pxeN9zmOqyOxNEk7W+CJ7lPYmdFutWFFn
	939N+uAWNpM+e3otW2X53BMwvEwU3TQ=
X-Google-Smtp-Source: ABdhPJwpA5CI4Tkm6LEUH4jPwYrLXsF0BB7d0W0phNSJqvpgIHH1PSeiArGlBr9KAHb8dEW+oj7JEQ==
X-Received: by 2002:a17:907:aa2:: with SMTP id bz2mr12430948ejc.239.1615156502521;
        Sun, 07 Mar 2021 14:35:02 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f3c4e6849043cb4c496f775.dip0.t-ipconnect.de. [2003:f0:7f3c:4e68:4904:3cb4:c496:f775])
        by smtp.gmail.com with ESMTPSA id mc2sm5501399ejb.115.2021.03.07.14.35.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 14:35:02 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/9] xfce4-time-out-plugin: upgrade 1.1.1 -> 1.1.2
Date: Sun,  7 Mar 2021 23:34:44 +0100
Message-Id: <20210307223448.1063315-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210307223448.1063315-1-schnitzeltony@gmail.com>
References: <20210307223448.1063315-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.1.2
=======================
- Check whether the seat exists before ungrabbing it
- Create README.md. Update configure.ac.in
- Fix compilation warnings
- autoconf: Some updates
- fix for no dialog after screenlock issue (#13)
- Remove GSourceFunc casts (!2)
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...time-out-plugin_1.1.1.bb => xfce4-time-out-plugin_1.1.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/time-out/{xfce4-time-out-plugin_1.1.1.bb => xfce4-time-out-plugin_1.1.2.bb} (67%)

diff --git a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.1.bb b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.2.bb
similarity index 67%
rename from meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.1.bb
rename to meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.2.bb
index f4ef3f626..185e9bca0 100644
--- a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.1.bb
+++ b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.2.bb
@@ -6,5 +6,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "3087b3248e427822613e5583784b0ac0"
-SRC_URI[sha256sum] = "194dbeb8751d8aaedf3850a7a9c770f09d32316a99683cde34d7d0fc5bdba31d"
+SRC_URI[sha256sum] = "3dd8eba694ff3ba5c25bd7f5cd70dc22175fb2c0a759213f05ab8f0e629d82d4"
-- 
2.26.2

