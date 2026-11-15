Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10701.1794762009815114167
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 09:00:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=d68yIvgR;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3ada81853so2331810c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 09:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762009; x=1795366809; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FTRruQDxh3be2Quz9s1zLJFQJ13EDlaqh8deYG2mLFI=;
        b=d68yIvgRG3mHVdRqAef08ndxTjujP8N8uLuY+PIiABewjdtMRlT4M5FnF0eehfjPYM
         jG81v6cnIa/0HU5ACNc/cYsuwFVP2VUD70gziAsXbwQMXZ4ie+a5emOSvy56w9lnPh2X
         n7pGGdJ9atIK/8jOUFifZv7YJ/tCCTBrFWR1aDtI7tkA0ukchFZVhUJwTsnuwtk275yW
         XkjxIRp7hPh7FUnFZ0TnQdRAgdHFvcH6emgVWSyN0432xxEVRw2FNTUzkMN6FixuxrCK
         BSjQeziYfA80LXGZDXpJDKAQ0BFJUCQRr4kJ6GDC6XrEOknFZcRBleuU9wA6V62gIR0o
         /ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762009; x=1795366809;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTRruQDxh3be2Quz9s1zLJFQJ13EDlaqh8deYG2mLFI=;
        b=X1yoh0V1jqaAY4ihJ4bN9YLkBqArf4N1K87wSs1VLSuGOySsXCaQ4SUlPPwjbIrxzq
         lWFIG+FLq2cQ7rB51Ljm3oRx9nBshIYT19HWORfoS0ia8fmGz1CA1glniumA2Qn8pDt3
         ZO0OzBupgdYSs32+cdy3hWbxbKJjJSgHR+KGo83Cc5wKquary68s+iEtWgU691AHy5tZ
         bACytsbbR1dgE5iz8E06dfJP6copJ8VR+i5DoCUm9duMj4/eABDuPtQweHpRi4bx7vgJ
         QBUP/VcftFyX2n3bE1CL/vCM5AJpqJdCFOrSfZx8y/okbwvAVD5JSUsFgryw/HUjB5n7
         rD3g==
X-Gm-Message-State: APuU4Z/MPiZcrxv+dLJ22GPVyYFhOZUIuw3wEN8T5To8LzLJOg8adkwa
	6NW+oLkjmjuO3ChbSm6Mu1/fIfn32TAFQqS0H73HVECyyVkOl2RMcRnYl520bzI5
X-Gm-Gg: AYBFou2TG2FJjZfTvo23BFAKy6G82EXdyjwgyILy3wxIiPHhGmeooFOuHcFs5cWfPPn
	n//6Km59UnQV2ajmGy0s6iC7AlxwqSTbkE7pnKNTg9B5p3fkyQlSkG1oxyYJMO4V5Qsj4lg+E9R
	u1vkFP9mG6y2DYJqbKGBrWUj/g1ALw/Jq077JHDYDD0VmN0ISvOLpV6FvEAW3V1KyCQmnGCAiwW
	PRjHTmsUZpcO1Ha+nKabYGO4mAU30TJa1ifiVves9//5HU2tkpzYkFUq7Y2TPG84VCJ1+/bGflf
	5QNRszFpuqUTn+rMmrRt7RthCsVrzrmRM4hRK+urQ/vi5nztZF2+6IJs4wqPQoBkG2vEdEinO33
	TBquagBu8Um4dto50zRnssxI/z08Ulp17wDArlavoLKJKrLSeq2Wk4gTHDT07wiVqL9YTZoromq
	ScTh6sszlmj1pCgJT0arH6TYsSD3iO0g4lOf+8zixoDqgqhQXnOvIxceb42Km7CBe2svEEW7bHy
	9TSnUxncHCVbw6J8jSvllZ3EeawqIpxIY6yOfDT7ee5X2k3zSL+crzJSIzx3teH3qu3fH4qLfnw
	RWRI0sxAeybk6dEWVFVDzBcm/tVrlFWBzk0gXCN5+RngtfmFnDXYHp6v6DRwUmPUIovPVE2t+Io
	qAPUTeEMRQ5WIStalPM50IZgeaeqB9pE1+8S9OIc4JYw0QduSXrSMhVTHkPv486Q+owVuNGPV8h
	wq7mOCWsudO5vx8EsV9Ql+jSPkdV28c+ZTPbRmCxzJU5VRLugKbrzwvCFigQH5u7Kv4PAor0rV5
	pv1qWu/Zjp6OqZhKh3RJXhlDm2h9tj/FRuJ8wELaM6WLVPQmxJhkQRHJJhAFktEjJltzKeRiIhM
	rXxUKQ==
X-Received: by 2002:a05:7022:7f0f:b0:176:a225:e364 with SMTP id a92af1059eb24-1b50312eb89mr7129714c88.35.1794762008861;
        Sun, 15 Nov 2026 09:00:08 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm29442397c88.5.2026.11.15.09.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:00:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 07/15] libcamera: upgrade 0.7.2 -> 0.8.0
Date: Sun, 15 Nov 2026 08:59:46 -0800
Message-ID: <20261115165955.3485789-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
References: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 17:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132373
Content-Type: text/plain; charset="utf-8"

Drop 0002-libcamera-egl-Don-t-redefine-EGL_NO_X11.patch, merged
upstream.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...camera-egl-Don-t-redefine-EGL_NO_X11.patch | 46 -------------------
 ...{libcamera_0.7.2.bb => libcamera_0.8.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 48 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-egl-Don-t-redefine-EGL_NO_X11.patch
 rename meta-multimedia/recipes-multimedia/libcamera/{libcamera_0.7.2.bb => libcamera_0.8.0.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-egl-Don-t-redefine-EGL_NO_X11.patch b/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-egl-Don-t-redefine-EGL_NO_X11.patch
deleted file mode 100644
index eace529b06..0000000000
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera/0002-libcamera-egl-Don-t-redefine-EGL_NO_X11.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 998b5c7ee5cabd51292ac216ccb390c35f989a78 Mon Sep 17 00:00:00 2001
-From: Joel Winarske <joel.winarske@linux.com>
-Date: Mon, 12 Oct 2026 18:20:01 -0700
-Subject: [PATCH] libcamera: egl: Don't redefine EGL_NO_X11
-
-Mesa built without the X11 platform exports -DEGL_NO_X11 via egl.pc
-Cflags, from mesa!2226 (19.3) until mesa!18848 (22.3) moved Xlib
-inclusion behind USE_X11. This affects non-glvnd builds, where egl.pc
-comes from Mesa rather than libglvnd, e.g. the PowerVR mesa-pvr (22.1)
-used on StarFive JH7110.
-
-The -D defines the macro as 1, so the unconditional empty define in
-egl.h is a redefinition, which is an error with -Werror:
-
-  include/libcamera/internal/egl.h:23:9: error: 'EGL_NO_X11' redefined [-Werror]
-
-The define is still needed for EGL headers predating
-KhronosGroup/EGL-Registry#130, which otherwise pull in Xlib.h, so only
-define it when it isn't already set.
-
-Upstream-Status: Submitted [https://patchwork.libcamera.org/patch/28452/]
-
-Signed-off-by: Joel Winarske <joel.winarske@linux.com>
-Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
-Reviewed-by: Barnabás Pőcze <barnabas.pocze@ideasonboard.com>
----
- include/libcamera/internal/egl.h | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/include/libcamera/internal/egl.h b/include/libcamera/internal/egl.h
-index 1e31d490b..aeb4da80d 100644
---- a/include/libcamera/internal/egl.h
-+++ b/include/libcamera/internal/egl.h
-@@ -20,7 +20,9 @@
-  * Workaround for build issues on Mesa <= 22.2, see
-  * https://github.com/KhronosGroup/EGL-Registry/pull/130
-  */
-+#ifndef EGL_NO_X11
- #define EGL_NO_X11
-+#endif
-
- #define EGL_EGLEXT_PROTOTYPES
- #include <EGL/egl.h>
---
-2.56.0
-
diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.8.0.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.8.0.bb
index 624ca1e33e..adf17d9b40 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.7.2.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.8.0.bb
@@ -12,10 +12,9 @@ LIC_FILES_CHKSUM = "\
 SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master;tag=v${PV} \
         file://0001-ipa_data_serializer-Mark-vector-readPOD-overload-as-m.patch \
-        file://0002-libcamera-egl-Don-t-redefine-EGL_NO_X11.patch \
 "

-SRCREV = "191e202178f02430b5942397c70d215cdd2056fa"
+SRCREV = "df8e348d64b4932a0676256ed24f0da3ee9438bc"

 PE = "1"

