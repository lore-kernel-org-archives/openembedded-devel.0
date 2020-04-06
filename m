Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.7327.1586164846819751476
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UglDKRFb;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id y20so3058697wma.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2020 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0nfH6kGhwYWLCcOck1BepdJoNMg4h1gofHDdJCv7Nws=;
        b=UglDKRFb17Bh1dboULYO1foFwsNeyvdeI9cQ7KByOunXcosNNj0VEXdpJCifA9/LNd
         0kLYLct08HA3Y+WwZGrsWiOyduHWcIQ/YHNPzXNaHgtDrO6s8h1rprEK74YYP7EWfx6C
         mb/WxSF5qsU3ocJWEi51bOAb1DXH7j79BW/x4wS0CSKpB/208rjsFE48dLqzgnyEu9tR
         BUa+Cl1hsjERthQZxkgcH0LEb4oh0FYgyjlZ3tx9J1pGxqc8Q8yfJq4aUMI5a9CiFkIS
         3JOgtwPyw5NPLJLxkD5Z0OHLzbJzh8E0OL4AV6ERJE1HC2APPlI+2avM5s6KBcRls+Tt
         Pa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0nfH6kGhwYWLCcOck1BepdJoNMg4h1gofHDdJCv7Nws=;
        b=r734gAfzRK5FDqt7WuXtQylNVo1oPZXRXGS1K62nqBiI/JFsIwjUkSNw5IMBzDyjRD
         6R+V837BsdL1GUsOrorJQy5bPKa40dLheh8LvwtySCz/j7+YTle4gxFaSClgsk0jveoN
         LbqI2d57KP315my8foSU7K/V/wnAa3JOukbG57f0L6nSDRHvdwgcaqV8B91NEUzngJid
         6Yg9DOe5SbdBdBDMKL2rIwFe8kF3aYF5n0IufAvOYgtNvETUiEzGSikLUouM0FTnetpw
         KPIeTeAnpnBBIKRV2HgD8PbBYkgDF17+xo/ajKK3NgiKI3ZPp6H7pEz0524/rWaWFTG/
         MWbw==
X-Gm-Message-State: AGi0PubRlqyp88DUnJ8gaayz6WW9GBySa76W9pDjPMG73elF0OMjc7Io
	dMyFvIXutYhncBYJRB2KsP8c69rsXis=
X-Google-Smtp-Source: APiQypLD9LfxFNLdNqvRc6LjmYv7zsIogjI8MdX7DHdykr6ny+vplJyNAMDPHxjsp0HHUhEAEalL+Q==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr20325076wmj.12.1586164845083;
        Mon, 06 Apr 2020 02:20:45 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F295D58AB00388BFE597C49.dip0.t-ipconnect.de. [2003:f0:7f29:5d58:ab00:388b:fe59:7c49])
        by smtp.gmail.com with ESMTPSA id h13sm207075wru.64.2020.04.06.02.20.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 02:20:44 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/14] gnome-control-center: upgrade 3.34.4 -> 3.34.5
Date: Mon,  6 Apr 2020 11:20:22 +0200
Message-Id: <20200406092032.3574-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406092032.3574-1-schnitzeltony@gmail.com>
References: <20200406092032.3574-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

================
Version 3.34.5
================

- Updated translations
- Remove some dead code

Display
- Fix resolution options getting stuck in a low resolution

Network
- Print warning if failed to save to libsecret
- Handle security combo box being not selected correctly
- Fix small memory leaks

Sharing:
- Fix small memory leak

User Accounts
- Fix uninitialized variable
- Fix small memory leak

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ontrol-center_3.34.4.bb => gnome-control-center_3.34.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_3.34.4.bb => gnome-control-center_3.34.5.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.4.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.5.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.4.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.5.bb
index 253322063..bf8ec3355 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_3.34.5.bb
@@ -30,8 +30,8 @@ DEPENDS = " \
 
 REQUIRED_DISTRO_FEATURES += "polkit pulseaudio systemd x11"
 
-SRC_URI[archive.md5sum] = "4a783c45d6775185a683f143a14d460e"
-SRC_URI[archive.sha256sum] = "17ea6db4b9cee75e99e77f0161a0e5209a3b86444ae775c2068ec192aba6272e"
+SRC_URI[archive.md5sum] = "ca92151a2a58cc3e0a73e88379e96ce2"
+SRC_URI[archive.sha256sum] = "b30d0afb99252f150e37d5ca4bc83b89bf4aa6d18c5d367230053278634e0c47"
 SRC_URI += "file://0001-Add-meson-option-to-pass-sysroot.patch"
 
 PACKAGECONFIG ??= "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
-- 
2.21.1

