Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.6828.1616722658976590709
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 18:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sYicGNIi;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id g15so3824240pfq.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Mar 2021 18:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S4OsozrayboVVsmDtxXMpxc6YQbSjXEIYQ+RSSGtWTk=;
        b=sYicGNIi1hH1RVNfqjzD059ulPjzqPGLrnkxdIFNmLSYvenplLrGl1lTFFj5JxXqiA
         dw8ouPSg1KHsjHIWQXuA6sSKF4sd8ga9B1RiIqZR9TVu/i0WFs+yIIU11n+MzGcQbLMB
         O0Kv1iivL4sFAG8S7LG+dG6MfrrUya/QmLswsMy8Ze2EBrcSqRSCVrn9YKF+v0Ba9Bvq
         795VEOr13MVV+m9JmHXpwmivA3HsdbYPtJThKPVwQY19A28jsbbTPxbPCP2m0Oxt4Kqr
         Wvsrf6pEeEo6Gh8z4GcH4wIT/33uXTZ1xazDgzjf9bfyR2QC8QLmHIQl7CGT80cCNQ2F
         SJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S4OsozrayboVVsmDtxXMpxc6YQbSjXEIYQ+RSSGtWTk=;
        b=F11tNIrFSogoZwQEOSKkPcTBlKYEpkajnx79S6oGIxEWM7UaNpMBL5Hbsa/QqZvli/
         A8GGe5VqbQj+vS9KsBPKGGi6AAIUOFKfBiM1tgfB4lzzsH5xAaYEPqBCdRoTeFdlzcof
         QlqIujgEzw3v23YTYtx9OEJ/Cw/KSBTx22qWODHroBNB18O9sd3MMMgzvhoKxVTAoO2j
         Kb+CVn+XuoaxtPIR8lsHHijvnSdIIzr7VcnCZZXZLz0MS4U4862JL17N4P3vImfOAf6V
         HsOHppjXC6Ix0eVobpdo/LCgnSdOJ7LU/SBtzl18S6Nv1Z4Ey/eH3Es780elJm+u1Gv2
         EVpQ==
X-Gm-Message-State: AOAM5332+uFH7Xr0NBM2x0Kharvb07mb00wRPqFtBtPzwrF/oEeOBNRV
	ZdBon1untcce2zn08HNKIqR5RHPTMBSJBw==
X-Google-Smtp-Source: ABdhPJwMaLP4Z89vT9nf4PIPmCMACvm5TEf33CQTdntdEpceWMKpTzW1fYlPZNchxYH3OIA2XKmSlA==
X-Received: by 2002:a63:1452:: with SMTP id 18mr9585448pgu.269.1616722658185;
        Thu, 25 Mar 2021 18:37:38 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::aebb])
        by smtp.gmail.com with ESMTPSA id s7sm6523453pjr.18.2021.03.25.18.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 18:37:37 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH] sox: Remove LICENSE_FLAGS = "commercial"
Date: Thu, 25 Mar 2021 18:37:36 -0700
Message-Id: <20210326013736.1079621-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Its not needed bitbake gives a better diagnostics when included
in image deps without accepting commercial license

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 4c3f37913a..2d6e913d87 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -6,9 +6,6 @@ SECTION = "audio"
 
 DEPENDS = "libpng ffmpeg libsndfile1"
 
-# While this item does not require it, it depends on ffmpeg which does
-LICENSE_FLAGS = "commercial"
-
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)} \
                    magic \
 "
@@ -40,4 +37,3 @@ SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3b
 inherit autotools pkgconfig
 
 EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "0", "1", d)}"
-
-- 
2.31.0

