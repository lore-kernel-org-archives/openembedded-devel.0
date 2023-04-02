Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C59C7619A
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 04:57:16 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.39056.1680411433777351579
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Apr 2023 21:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X6JLSgUr;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so29472591pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Apr 2023 21:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680411433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i6V348kPZZ1cmelnrajvgJefC6uhpJSVxQd9XPSoFuY=;
        b=X6JLSgUrdHr/hrYMQCfT8w6lrCoPM0/4IxzdsZNqIhbdlfjwUPIy44mPgA8NVtoE1i
         SJEucGMOk4sJLQY+oc0Kg8oI1AAF1tIjfHowMLp0dThHrmQgLt295Z/r5ZXZ5zddUA/A
         dSRq5pApb8RaNTsmC60hqkVfXDblsRo2nbXFvAcKnYAV+Jpl0uSBphkKhMCYYZHy30q4
         DzW1nJuwXIWmlmrR9O4zs+2ZCxbnjm4Bqdk5e38fR7eS8xHu48+soRAECpbxJU22WbJk
         KfiG18qXG4n9k/ZTJ0vHEc9Ke3Aeg0bkcz4c4HHHr6bGs5ECj1lWYDtxfyWBHJPwBxO8
         8Neg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680411433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i6V348kPZZ1cmelnrajvgJefC6uhpJSVxQd9XPSoFuY=;
        b=qdZ9rP+j0IjkveuAbez53JBygdAIfexupIvL0d2dJUfiRv9ggqCB/DWDu8HwjK5xwo
         XJBv+AUgRAGkH92X/Eyl5R6QAOFovnFohvDp177XLdpB/Gfp8HNnt+pnNVRFHsBRSwr4
         n3iglN0akRrJUhCctWOncs404pki3y/Pj2mJUkZvphy2JiumhWoYCSPwJKg8lj2eyQs8
         uL2J4v0xz8Px0L2rJqFNR2PckiHxLHHNqR2qY+GSztKZ5Dp9l2cA7K0/gK5iENI+dsuv
         UGVXiNSwrirAMkqnu5BmRiaDlO95RvngSEXJuFHyDX1O5JEyOlS15YIVZIGemIypxVdC
         InIA==
X-Gm-Message-State: AAQBX9d5g0NnV9RbjbbsQWA+W0XaKV8yw7+ofqnK5LEJZ0RU7DNiufMU
	jEa0y74YCiLCoVKEs0/0ALn+QPQm7U8Glw==
X-Google-Smtp-Source: AKy350bkQdu9bfzEgC5LA+e3iynA8Y9OsFS72xv6D/ptUBPM9nqy2rvhUWjHLw16Ipr457UQK/VaWA==
X-Received: by 2002:a17:902:db03:b0:1a1:b15a:d916 with SMTP id m3-20020a170902db0300b001a1b15ad916mr41413235plx.3.1680411432603;
        Sat, 01 Apr 2023 21:57:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::17e4])
        by smtp.gmail.com with ESMTPSA id u6-20020a17090282c600b001a1abc93eabsm4097772plz.226.2023.04.01.21.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 21:57:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mpv: Upgrade to 0.35.1
Date: Sat,  1 Apr 2023 21:57:10 -0700
Message-Id: <20230402045710.319530-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Apr 2023 04:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101873

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mplayer/{mpv_0.34.1.bb => mpv_0.35.1.bb}    | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-multimedia/mplayer/{mpv_0.34.1.bb => mpv_0.35.1.bb} (88%)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.34.1.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
similarity index 88%
rename from meta-oe/recipes-multimedia/mplayer/mpv_0.34.1.bb
rename to meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
index c600e88f88..cfb461a4c3 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.34.1.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.35.1.bb
@@ -11,18 +11,14 @@ DEPENDS = " \
     libass \
 "
 
-DEPENDS += " \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', ' virtual/libx11 xsp libxv libxscrnsaver libxinerama', '', d)} \
-"
-
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV_mpv = "349e437466163cb52f7d0aa227d4606edd9db501"
-SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/0.34;protocol=https \
-           https://waf.io/waf-2.0.20;name=waf;subdir=git \
+SRCREV_mpv = "140ec21c89d671d392877a7f3b91d67e7d7b9239"
+SRC_URI = "git://github.com/mpv-player/mpv;name=mpv;branch=release/0.35;protocol=https \
+           https://waf.io/waf-2.0.25;name=waf;subdir=git \
            "
-SRC_URI[waf.sha256sum] = "bf971e98edc2414968a262c6aa6b88541a26c3cd248689c89f4c57370955ee7f"
+SRC_URI[waf.sha256sum] = "21199cd220ccf60434133e1fd2ab8c8e5217c3799199c82722543970dc8e38d5"
 
 S = "${WORKDIR}/git"
 
@@ -46,7 +42,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
 "
 
-PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11"
+PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11 xsp libxv libxscrnsaver libxinerama libxpresent libxext"
 PACKAGECONFIG[xv] = "--enable-xv,--disable-xv,libxv"
 PACKAGECONFIG[opengl] = "--enable-gl,--disable-gl,virtual/libgl"
 PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,virtual/egl"
@@ -103,7 +99,7 @@ EXTRA_OECONF = " \
 "
 
 link_waf() {
-    ln -s waf-2.0.20 ${S}/waf
+    ln -s waf-2.0.25 ${S}/waf
 }
 do_unpack[postfuncs] += "link_waf"
 
@@ -111,5 +107,6 @@ FILES:${PN} += " \
     ${datadir}/icons \
     ${datadir}/zsh \
     ${datadir}/bash-completion \
+    ${datadir}/metainfo \
     "
 EXCLUDE_FROM_WORLD = "${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "0", "1", d)}"
-- 
2.40.0


