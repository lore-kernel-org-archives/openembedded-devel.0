Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.7978.1588332954166522668
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 04:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IVaFFSQJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id y24so6045787wma.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 04:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=K9JbqNyMla6YApITXq4i9JX97VHbGZK0J/wPU+Z++Ic=;
        b=IVaFFSQJ8qTLeKsEFEPq3BFAl1Cdthk18/qSwJ3gv8/EOt805JwiLPEF+lvuhTU03+
         4rKtSRBKBAcOH7wOIGX+gFR1Lva5OAJSm8LlVU82ute1suhfk9Nx62MR1zfN9EBuZAzB
         y+k5JF6Q7VTyQVRmOKG+d9jeeAMBnV7iNriTZDqiWDWM/NCLs7jvaTiGJIkJb1jO+yiK
         KtTVtsHNFpXcJOQn43kQW4fg2Tbt4jXyoBkgLK+YEqQYB+P/FlGSsREyW90gh8QUhQhy
         CoMSYVa93iTPqX+74N0BG4KIDnS42j6b2nNXF0tW6v35mkYwCg807DbJ0fDAM5FkSoZb
         OHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K9JbqNyMla6YApITXq4i9JX97VHbGZK0J/wPU+Z++Ic=;
        b=muWFY/qMYVdzqCq9G4qlzLP2ffM6XJkv2xEXliR1rqnVZMIunqrypGBM6emv0DP2bW
         bo4CTt6YTOVyB27atsNG3L6MvYqZ4HaPtVnHx5amEx3LiDBP4hoDFElMOjx8ADQoz6ij
         d+52koDK6xIUINjbugm8Aos0d/l+OBRfGXbJPaw8AMfXT7QrEeLkikfaMPwbV+LwLELN
         y6Lc1qzPGZwcln1bCM7+zYw0vdoYUuEvCfBzoV+UCN3RU66ni1bYyPyToQ3eWBvfGAHL
         F/b9b0OY77Vys+upeamECgIeasen+bn4/tfNfxIldrNoibRo7WUuN/5DQKLi69iWTrwb
         sfVA==
X-Gm-Message-State: AGi0PuY8wa2UJ4DbTpHX9prIsG91FLAn+pao3cCK0cZauUCcw8lfn/kw
	XVZRKYYN3BBl8hVkEq6n0YGkGhvu
X-Google-Smtp-Source: APiQypIxOgxuzdnD1jERvIOj0h8C7DD/zOp2wlQXvVQRhP4+i9otiYlCLNF8ha7YllQQuYLffMyfhg==
X-Received: by 2002:a1c:5448:: with SMTP id p8mr3462142wmi.173.1588332952515;
        Fri, 01 May 2020 04:35:52 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F0ED437E74431DA4B53FAAD.dip0.t-ipconnect.de. [2003:f0:7f0e:d437:e744:31da:4b53:faad])
        by smtp.gmail.com with ESMTPSA id q10sm3960004wrv.95.2020.05.01.04.35.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 04:35:50 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/10] nautilus: upgrade 3.34.2 -> 3.34.3
Date: Fri,  1 May 2020 13:35:27 +0200
Message-Id: <20200501113534.16030-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200501113534.16030-1-schnitzeltony@gmail.com>
References: <20200501113534.16030-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Major changes in 3.34.3:
* Revert icon emblem fixes in order to prevent performance issues (AntÃ³nio Fernandes)
* Fix crashes often happening when searching (Ondrej Holy)
* Fix crashes after conflict dialog response (Ondrej Holy)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../nautilus/{nautilus_3.34.2.bb => nautilus_3.34.3.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_3.34.2.bb => nautilus_3.34.3.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.3.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_3.34.2.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_3.34.3.bb
index 10dea944e..e7541664a 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.3.bb
@@ -17,8 +17,8 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check upstream-version-is-even mime-xdg
 
-SRC_URI[archive.md5sum] = "88573061544040c0ff960f934aa83719"
-SRC_URI[archive.sha256sum] = "bb06e226b965f479a0b8668c19c8e1762b9d8f039af6817961cc7a8f09e6f8a7"
+SRC_URI[archive.md5sum] = "769053f14bb993605a2b60085c47b4cd"
+SRC_URI[archive.sha256sum] = "02d984b794f3a34a7aa66bf5c70cc2a7780de55bd900504fb1014931781db36d"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.1

