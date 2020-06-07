Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.1328.1591500282766200550
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GGNigZmo;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id d6so4529806pjs.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=0uaIuunGRkR2uOfEBK1jvM0IGXh7P2fY9Ft8+NRiISA=;
        b=GGNigZmoTbyINO9ongm/0FDDloT5cgvbWSui8SKvCXQCjj6x1e6LEIFynW+JkFDrET
         AA3M0kB+SsyKzHrsifR/wX22EGxJ9tgjqcpZXF+NQ/mWn3sGMxpyPiT4HghKCPlRnR8z
         Pn3yOyx/EfD61tacuWpDIcGbBDsBc+Spq6+44mtEZbTAOoz86DaxdhFfBVO4NqVYiH8+
         Q107K91xbxvU5tg7lUbqsVNn/kTexlx5RfeXCnjFa2pRBRdSiV9RLqCzqwdlFZnBg4gQ
         EARQ+3Mpnd3YJho5dQEqeVy6HEX4jRYEH2pSAk7XC5RUAji+Hp3qEgCeWkKcdbaT/6fo
         BIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=0uaIuunGRkR2uOfEBK1jvM0IGXh7P2fY9Ft8+NRiISA=;
        b=r66d4/eiug9Az8bXZ4FM0ZT76MOlQYr7sEc6WfzsSzC6m3r0rsTZjmD/2xv7h9eTL4
         MhGA8/YcrXJ3Nk92RrSGkEyHMsN5rSJnJ2mlyzdqxw+Zpv+LhNUWMe4OBOi+XhWk8luI
         4SG/kGuEK+jkJrppaLjqtOpDydDtmNCOj/GfHjKKrrX7wkX6p5XyaMTeuUFm0Z408czM
         e7yF4+//7P77eE0QnOgn0s4h/oiNsSP3dCk/Ni49Mu56hA2ToGiZS8yKNvd6bfr78CSu
         MYMlfEusiC0g24dlGBtZTEt6h6E46zbOR/C18HpvdcNze5q0bzkoNW3Xh+tKLYO8z8LG
         ht4Q==
X-Gm-Message-State: AOAM532VZ58wbQUJbaLVc3+D5SV8qHJSqOHgGYw1QQ266igudZq00hnb
	EtsR/dHaxbMc1mC3hlFeTHm8baOj
X-Google-Smtp-Source: ABdhPJyorNx0FX+5LKtzrso6AREwDKNiyxtLDoJwlRYAkGbh4n6/y0Jsq9f+Y6Gt3o8Tym5MDXarbg==
X-Received: by 2002:a17:90a:4eca:: with SMTP id v10mr11302120pjl.170.1591500282121;
        Sat, 06 Jun 2020 20:24:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.24.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:24:41 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 01/26] plymouth: disable systemd-integration for sysvinit
Date: Sat,  6 Jun 2020 20:24:11 -0700
Message-Id: <09b52ab6bacbbd201eeeed92b55fb39ffc075ac9.1591500139.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Kai Kang <kai.kang@windriver.com>

It fails to build plymouth for sysvinit:

| ERROR: plymouth-0.9.4-r0 do_package: QA Issue: plymouth:
   Files/directories were installed but not shipped in any package:
|   /poweroff.target.wants
|   ...
|   /halt.target.wants/plymouth-halt.service
| Please set FILES such that these items are packaged. Alternatively if
   they are unneeded, avoid installing them or delete them within do_install.
| plymouth: 17 installed and not shipped files. [installed-vs-shipped]

Because systemd is not installed for sysvinit, the value of variable
'SYSTEMD_UNIT_DIR' is empty and causes the failures.

Disable systemd-integration if 'systemd' not in DISTRO_FEATURES.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 30b04053469415879a48ace9dec0f06aae92a1d8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
index 8b71c2bd6c..78c1cb4440 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.4.bb
@@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "4a197a4f1a05785d7453dd829b231352fb2d09171bd86c5ffaafbb2dd6
 
 EXTRA_OECONF += " --enable-shared --disable-static --disable-gtk --disable-documentation \
     --with-logo=${LOGO} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd-integration --with-systemd-tty-ask-password-agent=${base_bindir}/systemd-tty-ask-password-agent', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd-integration --with-systemd-tty-ask-password-agent=${base_bindir}/systemd-tty-ask-password-agent', '--disable-systemd-integration', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge','--without-system-root-install','--with-system-root-install',d)} \
 "
 
-- 
2.17.1

