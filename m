Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.19521.1596954895207431493
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Aug 2020 23:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JSgW9tMp;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id u10so3220618plr.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Aug 2020 23:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V0ouYU4IyecRC5AjoCiPPiSGwm7VKaMjdDdlIqZ636E=;
        b=JSgW9tMpwBRCzo9sqvLhdIhfu/vBwzW0GK7CVTn6wdC1HPdIlSbBUHgADHpnZWyHzo
         D6tTTHjNRZDWtx6r+HQXdT6DfoDso7SKsSNTN9GaB8Fb4k+cAuyxas28QtWzPiH9dDFy
         cw/b7rc+5H0n34c9hKbuRoR6W1wcade9gS7idUekbRmn4K8dr5xAq4ONHapgN5IWdljT
         agqRhnUSYkVA1mSBnie4gtmSN0XTgNNb+2alrqRqFIc4l6HteT7OEzgVuj0JdZPS79ME
         t93vofGc/0qxyVSzMR8SrrL4HE3OcJpU8f4yBZWe0/CdPnjPyu6actPcWcaoJ7MdDaWd
         NMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V0ouYU4IyecRC5AjoCiPPiSGwm7VKaMjdDdlIqZ636E=;
        b=RWEbKgq414FpzJ+tr2+5eZKovGpYNFHNfyqqnaGA/lK1vcIXW1da0CEXHlglfHiI8b
         dpo6l7/arMH9umKSCrxDA3CdTDfepeE/96mkj2Ekt6IrsoKnLUgeG7eOqgXV+PF4VvpD
         ArusZyNYIUYmu2zAlBPVvlGAc4czeYXdcvQ9+9UB5cZuBUmyl8Dv30+/SyIyblc3HB57
         EwoA4PHB1PLisfQ+D+xA9jbEW215GQ5qfFGpS0pfnjnJPbKezLnF7nntmQT5b9X9c7ou
         dTkKKV29SJhY1bV/HFJQr8gZF2ySVEmhXrR7ojEJeaiiovyFJ8M9DzZHfH2ZX+PxcbkP
         ktZw==
X-Gm-Message-State: AOAM533QM29ljVt2BCgq+fvVvpd6CbuplXE/FSMjN0lHptk4iXP5Rzhz
	BRc1abGdqWdEe7lQzbBFqOf4vPZKQqE=
X-Google-Smtp-Source: ABdhPJzJua2hZ9dLCh/AwUoK1E24qVtdIaDGmkeL+jXeUEkI/NiA4JrJGu8uUmqZn8qBP2Jf8ReVwQ==
X-Received: by 2002:a17:90a:e292:: with SMTP id d18mr21692363pjz.181.1596954894462;
        Sat, 08 Aug 2020 23:34:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id c207sm17796017pfc.64.2020.08.08.23.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 23:34:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] iwd: Module load dir should be relative to root_dir
Date: Sat,  8 Aug 2020 23:34:51 -0700
Message-Id: <20200809063451.3326500-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is autodetected by configure from systemd.pc and it depends on
value of root_dir ( usrmerge ) and not /usr being hardcoded eg. in
nonarch_libdir this has been fixed in systemd [1]

Fixes
ERROR: iwd-1.8-r0 do_package: QA Issue: iwd: Files/directories were installed but not shipped in any package:
/lib/modules-load.d
/lib/modules-load.d/pkcs8.conf

[1] https://github.com/systemd/systemd/commit/4a56315a990b802860170ecd1bbd3eb68e14a38b

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/iwd/iwd_1.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
index bfbf3c7fa6..b1e6fea2ff 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.8.bb
@@ -41,7 +41,7 @@ do_install_append() {
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-    ${nonarch_libdir}/modules-load.d \
+    ${nonarch_base_libdir}/modules-load.d \
     ${systemd_unitdir}/network \
 "
 
-- 
2.28.0

