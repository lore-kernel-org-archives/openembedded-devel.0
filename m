Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.19843.1609637178631479583
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 17:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ew4G6AcZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id q18so27404178wrn.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Jan 2021 17:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=G0BUQlq65JRLOAmjpmZI0+SSGU/enDJ8ow7Eq+EAEjo=;
        b=Ew4G6AcZKEOrzkkPlwNUK61vebWtXDLwqJOep/P88zBss8LQmDm6NW8k4Uv+Nikr3r
         jFPk0dkmlPTyQc6tsVcc49etRY6ZktQ41l76dE9rlhfJlqawKUJMfpPWZljoREh6yTea
         iaGcNiQXsVPviAHwP2pRnKXkJyZ1sfLlEx1uZ7Gqd8QqgftuFRyjB8B1zVmIu8ob0aee
         yBocjOg9sk5iYDX51CTUiPvXo33L+4HaJdA564GduwFfkWDe8xjhin5umyQh7U7IV1fd
         jnaYRKdrYMZ4Vy2q8EA5SZ3Z9+95ycvPoT/ODNoklo6C4pxFG1+kiOZUgkmkYQ3YZlxq
         FO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G0BUQlq65JRLOAmjpmZI0+SSGU/enDJ8ow7Eq+EAEjo=;
        b=mHqj4A623eBOB7+AcxuB2M/B2ar/FLobYDsMY3pgQxsNa9VVCPRpMwbWcosEHf0sDl
         rc1XRAlImE2RpVbobBjw1Ctr715Jrs2DzNXGms+V6O3Z5iFWxOyXq6vpJswN9/OPSV+U
         73LixY4jsKV0Ggy/89D/klohVX56Xy3rZDaAA2Gxrvt/1KqOdluQA39PgGsd5z+dzgsP
         3tnIew0UoP74NOsdf35mYxsNU0LfSS6dSODciOkc4S4lD9BiaiPP+Dg4xrkSiwPbRBeE
         IWHlFcF4ICTewHAdtrBlRxPbHYJxQ2d05BwBVvGz/ow/zcMHxep6VqwFEHwb4Mx+Mb/p
         8EKg==
X-Gm-Message-State: AOAM533uhNCKIc1z+phmLVFm0yFH/OyDQZkT2Qk5SqMhKauU91M1Z5lN
	Ki7lhI0eEVF1a23YBqieFEQmNDOvlSBdXA==
X-Google-Smtp-Source: ABdhPJwvo9fobXNtxjpMIQHeQSSM7SQtbw9BpPeNPIX/R+8tli1WKO0/Rvz4MWNR+8CczmVCYRyq0g==
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr74409491wrn.300.1609637177335;
        Sat, 02 Jan 2021 17:26:17 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f078d4623796d93462157c3.dip0.t-ipconnect.de. [2003:f0:7f07:8d46:2379:6d93:4621:57c3])
        by smtp.gmail.com with ESMTPSA id o125sm27248539wmo.30.2021.01.02.17.26.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 17:26:16 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/16] xfce4-systemload-plugin: upgrade 1.2.3 -> 1.2.4
Date: Sun,  3 Jan 2021 02:25:52 +0100
Message-Id: <20210103012556.557336-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103012556.557336-1-schnitzeltony@gmail.com>
References: <20210103012556.557336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.2.4
=======================
- Allow compilation with panel 4.15+
- Fix missing-prototypes
- Remove GSourceFunc casts
- Fix the properties dialog and a hidden memory corruption
- Avoid repainting bars if there are no visual changes
- Update copyright year
- Update URLs
- Create README.md and update configure.ac.in
- Add basic GitLab pipeline
- Update URLs from goodies.x.o to docs.x.o (Bug #16178)
- Translation Updates:
  Albanian, Arabic, Basque, Belarusian, Bulgarian, Catalan, Chinese
  (China), Chinese (Taiwan), Croatian, Czech, Danish, Dutch, Eastern
  Armenian, English (Australia), English (Canada), English (United
  Kingdom), Estonian, Finnish, French, Galician, German, Greek, Hebrew,
  Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
  Korean, Latvian, Lithuanian, Malay, Norwegian Bokmål, Occitan (post
  1500), Polish, Portuguese, Portuguese (Brazil), Russian, Serbian,
  Slovak, Slovenian, Spanish, Swedish, Thai, Turkish, Ukrainian, Urdu,
  Urdu (Pakistan), Uyghur

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...mload-plugin_1.2.3.bb => xfce4-systemload-plugin_1.2.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.2.3.bb => xfce4-systemload-plugin_1.2.4.bb} (71%)

diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.3.bb b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.4.bb
similarity index 71%
rename from meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.3.bb
rename to meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.4.bb
index 88d40c495..c19bd8895 100644
--- a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.3.bb
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.4.bb
@@ -7,5 +7,5 @@ inherit xfce-panel-plugin
 
 DEPENDS += "upower"
 
-SRC_URI[md5sum] = "5d75865be699d0b3d36a5fc17ed02d44"
-SRC_URI[sha256sum] = "052407c575203da4de2db6f4a5e997220d95ec655d393dc3875a0d5a20520775"
+SRC_URI[md5sum] = "351c78f8b3fe4e4893755f41de049f40"
+SRC_URI[sha256sum] = "0531b8df923cba3be8d064cb8b638b954df74915e5a447228999517847789835"
-- 
2.26.2

