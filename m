Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web08.28269.1615156506560043255
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Mar 2021 14:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GBCCGZ8c;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id p7so5057381eju.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Mar 2021 14:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Ky3xEWw8MKm6rbXryCPWXZLoi8tnh1why/opN3irh3c=;
        b=GBCCGZ8cgKznrnQ11V2HdhBf2JWpo3VXn7gpjRYTt9R3RvdjwwjW494xBNK5hdkd0/
         ggYnc5yVcsrjluihg6PXANrZlq7eoRVYLTbw3zLl7sqR4rgp33OYIA449v0w6BUwTuWK
         haLY9FEf95NMoDFP2am1D8eAWCeliKQ4iGQyvttqNdDLPSU/BWO/GAGk/BTLvur4pQba
         e4GEsVWrgQ18ym37GeJFnafk/Camv5pZNwH7Kmaor2dGK8/Sp0/cgbCHxIWkHv5Jlf3T
         bnAw2YhVdN2wnqbctZiEIEusa2+dQ5uKcPTOZBoTmS9ou60ZH9VxBRWeyjrxVHvV2we8
         xRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ky3xEWw8MKm6rbXryCPWXZLoi8tnh1why/opN3irh3c=;
        b=Ml0Kae2YbCezbUxt9H/KJNA+Vsep9nUeZLKI7ptPPWe0mPt3Q4xG0HWTW7iEu2wqX+
         kvyTM/K9dkLI1ejsKAvc1ZN8t1MOejPuabYSa/rcXXlFGBT5QzFnrylr6u0F4BI6/DPR
         nFodVylCFgvW31tah0GQFXAOUv/voOEhuJY/xsFjTgTRyrjtLhU0rmpt6RU9lSKkiPg2
         64hOvvD0PwSCo+zMWeFyHCgjwHiyMpw3YUAvq4b1gaQrM8GxhMARxvM94XHb8OLm+iZ6
         JkxHkjOwjTzuNdReQnUXoN4xcLMmdASZbV3P2hczbveZILvVSbGWz7vdlyPDzg8MGLIh
         /6yw==
X-Gm-Message-State: AOAM533Re/qIpGNTBkAWt+0ydijeg+yCqrEfrMxx92BCt2LuqZx0LYqe
	HgKFvOBSdiqLM5yIDPbJNOvJrsV7K1Q=
X-Google-Smtp-Source: ABdhPJxYHgYKgaxKwY6ojiLshlzG6uyEoyXbjAU3yoYK35L7a/Uddn/6RSCZDY2ZhKogb8bow93upQ==
X-Received: by 2002:a17:906:644f:: with SMTP id l15mr12607252ejn.229.1615156505234;
        Sun, 07 Mar 2021 14:35:05 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f3c4e6849043cb4c496f775.dip0.t-ipconnect.de. [2003:f0:7f3c:4e68:4904:3cb4:c496:f775])
        by smtp.gmail.com with ESMTPSA id mc2sm5501399ejb.115.2021.03.07.14.35.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 14:35:04 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 9/9] xfce4-taskmanager: upgrade 1.4.0 -> 1.4.2
Date: Sun,  7 Mar 2021 23:34:48 +0100
Message-Id: <20210307223448.1063315-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210307223448.1063315-1-schnitzeltony@gmail.com>
References: <20210307223448.1063315-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.4.2
=======================
- Ellipsize memory and swap labels (Fixes #32)

Release notes for 1.4.1
=======================
- Replace AC_PROG_LIBTOOL with IT_PROG_INTLTOOL
- Simplify "query-tooltip" signal handler
- statusbar: Use better color that works well with both light and dark
  themes (!17)
- Fix tooltip markdown issue
- Create notification area icon only if needed (Bug #25)

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-taskmanager_1.4.0.bb => xfce4-taskmanager_1.4.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/xfce4-taskmanager/{xfce4-taskmanager_1.4.0.bb => xfce4-taskmanager_1.4.2.bb} (70%)

diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.0.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.2.bb
similarity index 70%
rename from meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.0.bb
rename to meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.2.bb
index d41ee894a..8deea105c 100644
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.2.bb
@@ -6,4 +6,4 @@ inherit xfce-app
 
 DEPENDS += "gtk+3 cairo libwnck libxmu xfce4-dev-tools-native"
 
-SRC_URI[sha256sum] = "655684ddfc15fc09071f78f9fce5439d20bbd2d80ecfc5ba0a08fb38313e7d43"
+SRC_URI[sha256sum] = "cd122240e1c195e4e6f159da1bb86b38c41ba27892399ad85a18c37ea20e48f9"
-- 
2.26.2

