Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.1022.1630777511242774283
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Sep 2021 10:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bTGizTHk;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id mj9-20020a17090b368900b001965618d019so1668705pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Sep 2021 10:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Buy6bFgy2+vPsCxFvh02B2izaK9bL5kHeEaKN49PPFo=;
        b=bTGizTHkCmxNVVrqdIyjxBcY7yNemXFAZ6Lp8Jlg3iw+WNmwyiu0fdUzP+j32vEKbu
         R768h9m0mKN7o7GFyBZducN8QWN9Wwhi5s9d2ZrEffsbTWw1Ec5VAeVk5R60LfLexWP6
         N+SKlfB2rb2P3CKm+YuLm3N6RbLwrDvrn94UdHg1Z7qS5V9ADGXhgS6uDOsZ3hv2iBXf
         0KA7nTLzmFqtYbO2Izl04BbtXl/KtGeANhXvytH83G57R8hM5YwNPTIrWErJJ+y2JAny
         VPVHVb2nEbnihjeiY138+ijmpB52oCRR5lynqCav2PlPIjyNAZIlRSaVyOk6GBC93sZT
         VnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Buy6bFgy2+vPsCxFvh02B2izaK9bL5kHeEaKN49PPFo=;
        b=HeyuUjzQ/8eUKMTkAtsPIwWNfd8Ogv9eFsBSkvc/04Cyeof7X8TArlXgKPuMrLfx7R
         EdMYRrmIWfyUfNUtDVMo32fO6PAgBKXjBEsNpwm+TfobDlLt+VLrhzxOPP+P47GKh0ac
         pNG4MsBEIHqNQoJcRlvyoEf2lwIYS91GIdkh0rTeVpSqTmiwwgrs0Bp4O2gfzdnsQnUT
         FZHkpY+LxA9k4opisfyARBMy//L0SrWgbNG6FdTnSteNjz34sBSbl+N6HzPH0ZP+yJ+l
         myFv2hL36pZaTxfj6VJ/mI37IuafM0fuL1hrg+0dj0bzPQOZOVfKpg2MTeJvZhIK5/Nm
         nmlw==
X-Gm-Message-State: AOAM532bwrlay66O05s8uxcF6V7WkPhPpnBpaxdKvCQkbkl+hTWOsQen
	y7YJzVMlWvNIMZwSQ+p86IlEWK1I/UnoBQ==
X-Google-Smtp-Source: ABdhPJxxIRafBbOoHtA82jlEdIil70EzppzpkJFF+WHpQjXstY6FwcwFUD1PG0+2F1WDfRh5gHcMWA==
X-Received: by 2002:a17:90b:128a:: with SMTP id fw10mr5173648pjb.212.1630777510438;
        Sat, 04 Sep 2021 10:45:10 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id w4sm3052250pjj.15.2021.09.04.10.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 10:45:10 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	William Huang <whuang8933@gmail.com>
Subject: [meta-python][PATCH 2/3] python3-kivy: Check for x11 and opengl before enabling the recipe
Date: Sat,  4 Sep 2021 10:45:05 -0700
Message-Id: <20210904174506.2263139-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210904174506.2263139-1-raj.khem@gmail.com>
References: <20210904174506.2263139-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes

ERROR: Nothing PROVIDES 'libsdl2-ttf' (but meta-openembedded/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb DEPENDS on or otherwise requires it)
libsdl2-ttf was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
ERROR: Nothing RPROVIDES 'python3-kivy-dev' (but meta-openembedded/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'python3-kivy-dev'
NOTE: Runtime target 'python3-kivy-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-kivy-dev']
ERROR: Nothing RPROVIDES 'python3-kivy' (but meta-openembedded/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'python3-kivy'
NOTE: Runtime target 'python3-kivy' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-kivy']

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Cc: William Huang <whuang8933@gmail.com>
---
 meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
index 63c2ae7334..29a050a891 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.0.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://kivy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0c851d60495c7e27225a819e179208a"

-inherit setuptools3
+inherit setuptools3 pkgconfig distro_features_check

 SRC_URI = "\
     git://github.com/kivy/kivy.git;protocol=git;\
@@ -42,6 +42,8 @@ export KIVY_GRAPHICS
 KIVY_CROSS_SYSROOT="${RECIPE_SYSROOT}"
 export KIVY_CROSS_SYSROOT

+REQUIRED_DISTRO_FEATURES += "x11 opengl"
+
 DEPENDS += " \
     gstreamer1.0 \
     gstreamer1.0-python \
--
2.33.0
