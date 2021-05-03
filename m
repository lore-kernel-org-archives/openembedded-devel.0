Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web09.1807.1620069139484993363
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VrTxeglw;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id b5-20020a9d5d050000b02902a5883b0f4bso6100291oti.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 12:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bRaL7yXbQrtcbUUUzD7KICXqUlAuLmp52GMUzQR97Gg=;
        b=VrTxeglwX5k7Tg7fBZ+pi44YjUs5DNCwQEfswLlfyEF63xv+B4BZYWo7q0lSiCEBF7
         HCiXL7zZaoR6d+7ZddWlaEZ1clXD1QA5MaO2h2UV2IKXqkQ38F7GTAbSnIb1HGFEoXOl
         QgZBCjPVHjlfCtJIAshRpqpK68HIeVcYUPO3s9nm5SK5BPuinMsSA7snO/Vc4SLM+UJs
         Oj6msLpdKT71z6ZB6oMO0wxaG+40dTC2RM2VL7TNjCJcUHokgXyOSnYA11Sk4cXWD1Xj
         faTDriLyVsXjZ+YH+/6bCj7Giqt9G1niPOCdoiZ2GX+fnc66sPoRpfBdX6DVL/uCDMVS
         FL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bRaL7yXbQrtcbUUUzD7KICXqUlAuLmp52GMUzQR97Gg=;
        b=Q+ysNYwAkPFMkC1dSPEQldAVTmYsDGUkKLfru9ELPfv6ODkf16CdlSNYr5xcCqjdAA
         YZggzjDRsQl7tFHYbUmj8wJeFZlXUB6rdaRJLF/+gaHzU8PAyW6HkHA11qcQAkNRE0xO
         JMyICzQOo7ZnP1zGS/bIFz9xRaSy3hhuGYT9jwEXERbvAPwfzXQ1p/zcGB4rdiunxyq5
         ZWejSHdKPjvueV6kLZx+gcMIbGI220I3fmwKDpNzccbeKdRWTMIy0ivQoXxAzjX+cOGq
         ddyz1YjZCwLAhKgkx3d+6SYgVqSPEX911w5LVq3yPUqqEw3klJFbVTpL7gYfZp8A1GT0
         poCg==
X-Gm-Message-State: AOAM531/DcpMDwy5KwbQPScBf1w478RhsUH4qzjBhsPRbJZUI+lENXXq
	ThFima8mbm9dYO2ccV+LD0kind92Flhncg==
X-Google-Smtp-Source: ABdhPJwVgZXwX+R4SZqTJszjtbiDKC5lrY0TnEOirvWSeGY33q12nC10X6+Q8WUy0pK5rdLiVWIX7w==
X-Received: by 2002:a05:6830:1f27:: with SMTP id e7mr15787874oth.341.1620069138706;
        Mon, 03 May 2021 12:12:18 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:dc35:22d6:72af:c1da])
        by smtp.gmail.com with ESMTPSA id s85sm150047oos.4.2021.05.03.12.12.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:12:18 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 10/14] gvfs: rdepend on gsettings-desktop-schemas
Date: Mon,  3 May 2021 12:12:03 -0700
Message-Id: <88db66c3e12e34dc8126a5ac6d4c7434c6e9e46b.1620069042.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1620069041.git.akuster808@gmail.com>
References: <cover.1620069041.git.akuster808@gmail.com>

From: Yi Zhao <yi.zhao@windriver.com>

The gvfs-udisks2-volume-monitor requires gsettings-desktop-schemas.

Fixes:
gvfs-udisks2-vo[1780]: Settings schema 'org.gnome.desktop.lockdown' is not installed
kernel: show_signal: 26 callbacks suppressed
kernel: traps: gvfs-udisks2-vo[1780] trap int3 ip:7f856be349c7 sp:7ffe34561e60 error:0 in libglib-2.0.so.0.6600.7[7f856bdf8000+88000]
systemd[1637]: gvfs-udisks2-volume-monitor.service: Main process exited, code=killed, status=5/TRAP
systemd[1637]: gvfs-udisks2-volume-monitor.service: Failed with result 'signal'.
systemd[1637]: Failed to start Virtual filesystem service - disk device monitor.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6710d0bba50a3e99f57997f8782835ebe0581458)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb
index ad5dab5ecc..c8c16a3c52 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.44.1.bb
@@ -8,6 +8,8 @@ inherit gnomebase gsettings bash-completion gettext upstream-version-is-even fea
 DEPENDS += "libsecret glib-2.0 glib-2.0-native libgudev shadow-native \
             gsettings-desktop-schemas dbus"
 
+RDEPENDS_${PN} += "gsettings-desktop-schemas"
+
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 SRC_URI[archive.md5sum] = "72383474f52d05c21ef2be96d0b91974"
 SRC_URI[archive.sha256sum] = "50ef3245d1b03666a40455109169a2a1bd51419fd2d51f9fa6cfd4f89f04fb46"
-- 
2.17.1

