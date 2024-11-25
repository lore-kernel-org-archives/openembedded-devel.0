Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B6DD58D5C
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 14:54:45 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.20357.1732546481270142994
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 06:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CfM6264n;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6eebae6f013so44892457b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 06:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732546480; x=1733151280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2gGcfl+7B6qgrFULou7SnKsnUQgFU8qP0dQKqifexU=;
        b=CfM6264nKAVOEWIULnzm46XlS3LSvU0InoapG/Wm4BLYhy4hnrszsQb6Mw68k01Js+
         V/DdhRSkih2V5HEVrFvbAiq3HMXwup8RCBWM6rKGKm13nq+4cf/1YYOdhxJJgQ5TnFH7
         gRqrI9RevQQlGn+m3zYHgtDJYJUt5pmpTBt3ic0nxaHzn2Op74Z8XxZm9AkKeYep9TA/
         0jg7fXqd8/Uvj3k3ki1IZZk/0kGelrq3+aAwsVex7JiM5GUTwv50Pu730qWIaWnGxZsQ
         39b8G8O8fSfNsebcOFR9wpSNnb52X/iYhZRwGZUV1NJRyY1B90FMHkHnhv6++42b6mHM
         CP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732546480; x=1733151280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2gGcfl+7B6qgrFULou7SnKsnUQgFU8qP0dQKqifexU=;
        b=fk60Xn8F7wYc1Wh2VmyG88T4wHP5mmoVoqj/EsdIJaWJ2jsoveP5Y6hOOiEk2cpKds
         0nBgLk/ZJ1dFixGTGfhyUttpA7/GSetHdM0LcbrnuFf696AK/WZwu6S2UA6HGxSIi5Am
         rg69mEUwx0RN1Z4XuME4rkBh2d5nxJl6WoGE1nWLeFK8nuA0djNnAFjzUxaAFBTufcpm
         QaQ8+edv+Uk9IwcW8U62MMpB43d6A+GBOgtOW8Es5ctslPyTjsyyHSvL3fWDKA/1OjIB
         cYZRFUYfH206NR2xDZ2M6BPa90uGVgvWFZlfKPjVIcU2u6MDnuftVMYj/Zcpx/NbN/Qh
         HZOw==
X-Gm-Message-State: AOJu0Yx3pyjek0NPZiG42qXdIyYILFpt4qJpY9dEV6gSc1z6qiPD9vcN
	7mx5eqED5Kl+SIuDOOJqjtZz18UXgGHKXB7a+q+H9k84MRpgBRFnbOt9kQLx
X-Gm-Gg: ASbGncsq5GZieobTrUfsPhSblKqmdcmL4Qxkl5gXU/+zaKW7s3Cj/93qHDNLOuwTJq4
	kFSKWvwa6Fr0hReiVO17+N5jvO0XJ6VakqjlzwBPYIJVoSirYmQLd6SpApahlC1GCA7Uyz8GcO3
	8SeCYVmeAy+ZQ4gnPvKQ7CEwXz9dNVbS20imfDDphiXg3W7XMGE1eFIM3AlTB+V+vJUOUbXXKT9
	ee6c4xIhXU7MGBgwoDHdFTKxFEQeis4GtVkZImbAMTxY02MRWZarkdK
X-Google-Smtp-Source: AGHT+IGae4b9/Q5R0UE5tNoHKL1uOLJayjtbnZlV+EACWjqaAxk0ChE9mued8bwS8bVpZ1B+JCHUiQ==
X-Received: by 2002:a05:690c:6c13:b0:6ee:a89e:af3b with SMTP id 00721157ae682-6eee0881fd3mr139128167b3.9.1732546479931;
        Mon, 25 Nov 2024 06:54:39 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe152b2sm18073417b3.1.2024.11.25.06.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 06:54:39 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 7/7] xfwm4: Upgrade 4.18.0 -> 4.19.0
Date: Mon, 25 Nov 2024 09:53:07 -0500
Message-ID: <20241125145307.5479-7-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241125145307.5479-1-schonm@gmail.com>
References: <20241125145307.5479-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 14:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114044

Changelog: https://gitlab.xfce.org/xfce/xfwm4/-/tags/xfwm4-4.19.0

- frame: clip title text from drawing behind buttons in stretched theme
- mypixmap: fix origin for tiling in xfwmPixmapFill* functions
- theme: ensure menu icon gets updated when redrawing stretched title
frame
- mypixmap: implement support for the matrix parameter in
xfwmPixmapFillRectangle
- frame: reference stretch theme variants
- mypixmap: update xfwmPixmapFill* signatures to allow cairo_matrix_t
param
- mypixmap: use cairo in xfwmPixmapFillRectangle
- theme: load '-stretch' variants
- build: Bump requirements for Xfce 4.20
- settings-dialogs: Fix string leak
- main: Fix string leak in setupLog
- compositor: also block softpipe for GLX vsync
- focus: Include skip taskbar/pager when passing focus
- build: Fix build with libxfce4ui master
- build: clang: Fix -Wcast-align
- build: clang: Fix -Wsingle-bit-bitfield-constant-conversion
- Prevent division by zero
- Return if `tile` is not valid
- Free `data` before returning
- Fix emptying eventFilterStack
- Allocate memory so that `logfile` can be freed with `g_free()`
- `getWindowHostname` always sets `hostname` to a non-NULL value
- Initialize `wm_command_count` variable
- build: Fix -Werror=format=
- Update bug report address
- add missing break to fix use-after-free when alt-tabbing (#762)
- Fix incorrect ifdef guard for startup notification
- I18n: Update po/LINGUAS list
- Remove usage of XDT_I18N() and intltool
- Eliminate need for pre-processed configure.ac.in
- Add generator for compile_flags.txt
- Added check for working with external compositors
- screen: Fix uninitialized rect in myScreenGetXineramaMonitorGeometry
- stacking: Use WIN_LAYER_FULLSCREEN for focused fullscreen windows
when modifying _NET_WM_STATE_ABOVE.
- menu: Schedule a redraw for all menu options
- screen: myScreenMaxSpaceForGeometry(): drop unused retval
- drop dead code
- drop obsolete prototypes
- moveresize: clientResizeEventFilter(): drop unnecessary call to
myScreenFindMonitorAtPoint
- client: clientGetWMNormalHints(): simplify defaults and constraints
- client: clientToggleMaximizedAtPoint: use clientReconfigure()
- client: clientUpdateFullscreenSize(): use clientReconfigure()
- placement: clientFill() skip unused computation
- client: clientConstrainPos(): drop unneded local vars
- client: getSizeExcludingMargins() return rect as GdkRectangle retval
- client: getSizeExcludingMargins() pass rect as stack value instead of
pointer
- client: clientNewTileSize() pass rect as stack value instead of
pointer
- client: clientNewMaxSize() pass rect as stack value instead of pointer
- client: drop unncessary code
- client: clientConfigureWindows(): drop unncessary parameter
- drop obsolete xfwm4rc
- placement.c: make set_rectangle inline and drop unnecessary checks
- placement.c: clientConstrainPos(): scope and optimize strut rects
- compositor: Ditch the shadowPict
- compositor: Expose just the window area
- main: Fix our compositor selection
- main: Simplify options handlers
- netwm: Fix regular _NET_WM_STRUT
- Corrected invalid use of g_return_val_if_fail for flow-control in
move-to-monitor
- build: Add GLib requirement

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-xfce/xfwm4/{xfwm4_4.18.0.bb => xfwm4_4.19.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.18.0.bb => xfwm4_4.19.0.bb} (93%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.19.0.bb
similarity index 93%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.19.0.bb
index 2770829e9..a11daa58c 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.19.0.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://xfwm4-fix-incompatible-pointer-type-error.patch"
 
-SRC_URI[sha256sum] = "92cd1b889bb25cb4bc06c1c6736c238d96e79c1e706b9f77fad0a89d6e5fc13f"
+SRC_URI[sha256sum] = "73546c60c348bcbe088fd990f7d5d1d6a6eca4226f956c109d3655c00583b9cf"
 
 PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
-- 
2.43.0


