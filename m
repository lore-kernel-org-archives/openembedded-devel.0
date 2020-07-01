Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.10733.1593562053223287923
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZicryD34;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id b92so10230366pjc.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=NwLH7hcTvJER+4VdCYBKLnwoqvge/uAknI88M9bCm3E=;
        b=ZicryD34g1U3sbOsdP9Sciatxy3hlhPEPQD6PeM5CJ4WeG6hD5h0XqAYWFyWhJthLr
         842nmgoW3Tc2g4gUIgqdMP1C27I0FtEPVd/GOEL/v+Tk162y1BGpfUXfpAXh/hejNIvA
         k2ryp6OGiSKl/KMmHYuFd0GON8858Mwi2TfvmHGEPvovWRK0/VtXmInbZe5lRa7fYsCw
         XqzmGrdMwz1gxesfnXS1UHnftdTqPKzzlT1gKi0w+wWTWoZTp9G+3nowkDclOObw8T0+
         1+n/uAMixKI/W9ZX3j3y6il5ih6gjrwnHkU0AbQsFG/YKjoGQSrIywJYmtNKsTmAA6xd
         YmCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=NwLH7hcTvJER+4VdCYBKLnwoqvge/uAknI88M9bCm3E=;
        b=HW2IAQQhQbXVjdN+M4jIp2S0V811XFfvnTgup1M5KlniMVWdDNyYUCfgPGM19EZcNW
         pPvFOmAftnj5oQmiGLNqYtJr923osTtY/RMh+cReNT8f3tDbKIIKDuzn/uiQWi8nR0/E
         KokvgQE1KtRvbT7MagVpF/Mri0kS0l518vrP4WPcqpsPITY1N7SHM0pFg/2AYfQ4oCYi
         KeoaPiewaqX/ZXio+0JT08K9Kw0IRsysoKKa8cn5J4fQBQd4VXHd+XsVrjD/rdtVlO2F
         YC45nuARNfvQLoPdhayC5KJz7za5dENM38y8GdbJ/IuHAcuo+tsTep6slW1Q38k0bl2B
         qboA==
X-Gm-Message-State: AOAM532k9k++pWo6fa3isWfvolLSibGTxOly/36dFiJR3LNVB2sHVhR5
	OABeGNCbyRFCHPeIfFY/ybmyQ89V/+s=
X-Google-Smtp-Source: ABdhPJwA52W9zEVWpEAVBfI0+ISTJCb1RX5pa5tmgyjo4sfLVVd4ZTKvzzilgnO1R9tSHN/d/bgodw==
X-Received: by 2002:a17:902:9f93:: with SMTP id g19mr19047974plq.314.1593562052504;
        Tue, 30 Jun 2020 17:07:32 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:31 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 10/32] libvpx: upgrade 1.8.1 -> 1.8.2
Date: Tue, 30 Jun 2020 17:06:55 -0700
Message-Id: <706019dc1fdc25626150ca825410d2740de83c3a.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 91b30560e4a4e5a40744d01dfa1339ad8ba96a7e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../webm/{libvpx_1.8.1.bb => libvpx_1.8.2.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.8.1.bb => libvpx_1.8.2.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.8.1.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.8.2.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/webm/libvpx_1.8.1.bb
rename to meta-oe/recipes-multimedia/webm/libvpx_1.8.2.bb
index 006e73af46..4a98ec17dd 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.8.1.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.8.2.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 
-SRCREV = "8ae686757b708cd8df1d10c71586aff5355cfe1e"
+SRCREV = "7ec7a33a081aeeb53fed1a8d87e4cbd189152527"
 SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https \
             file://libvpx-configure-support-blank-prefix.patch \
            "
-- 
2.17.1

