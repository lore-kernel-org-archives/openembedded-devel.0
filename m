Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.693.1794955399420007267
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 14:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aBvW6dDm;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49412eb1474so142474f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 14:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794955398; x=1795560198; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZtDBTGjK2xs5kr5i5LasMN8/jvOT0JgPxGY1XhzzHc=;
        b=aBvW6dDmb8mekUlQa1hAlRPAdbWIT1TKyO2UGNdx/do8z8g8a148FOXngskc6wSwrg
         OLR5CW345OC4t5GtvgwnHW3d+6OifoWD/j8ZZlLbuxN6eW2ttJIKISMQVypE/XZ+2dar
         Z8Q30SCLosyvw3GPqZXAVREnA0VJO7PWTqleM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955398; x=1795560198;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TZtDBTGjK2xs5kr5i5LasMN8/jvOT0JgPxGY1XhzzHc=;
        b=sIm0DakzYSjf1YaRllxOuU3qxiApijahaAr5jIP2UgbSV6Gs1ummxSuKxA45IeFhll
         CaPAtN/ORThSuktJLeZxDbTj3Zq0v6kYDoYJmxEZp2Bgm6p5woRnXwf095ZHni8sYOIf
         Sgz2sMVZIVSl1hA7/8fmHZBK4uC/r1JVuzbrQwTI7XFBIZAmFIo30I6Sr9KASIa3Fm97
         mFPAf7LWrYYPl1j7HxwMU+enwoyBWd61grrXgrMofVVbfy26ZTE3QeHFzbJKorrIkTDQ
         p9cfaufHveBEgR2QNHxbEWgoWkX59sqPLQh0LxA1Dtu5KKYPSNAKgOVtTNhlioKTS4MX
         LtUw==
X-Gm-Message-State: APuU4Z/DeRPu9a5DDi75x4/mHh4+5Ls6nJe3ZPkzgWXk1N6AUMUeHwoY
	gqLtb/XWpyq6CcSmdR7nnFzswdWm4f5CgtNmd7rL5cclREHLdlea3HZMPcx2WhhngGGKyIB+1Th
	RKR/5
X-Gm-Gg: AZFdTZcNYlMkug4yVJdbKBa79UFH3Ncx3nYG+uK09VhqJtuDKniVd0kOAn9PQIoeX+n
	fONFqDlubpBKD0pIxqpkSm+e/IW7NPr4w4TBwqMzw2JD6dPu9zXhRZgOgv86RPoAGLZd10SeCaq
	Mni/qxjvw14BEe+Cnbd44HwJfuQYL1fRxNnLBK/Kl9kvt1sj9TpsldtJO2b2IRlllNTSyL47dgB
	LxnIvQYh0HiVEn1IzM1i8W8irM3n5tZFm00UfNsH34askg5V8X0Uj3vTgj4fsNZMDofre6n/EWE
	0DaXsfQFJIsYH/ik3t0/Z9751KmLTQ1G2imXntDJFzgF3EjmqHpX35ETKAkFoUxp9QgMVL+UAYv
	bT6k+tBK7LuqWeFz+Gpj0S/Cm9+3ILQay2PIlCCS/iVRqNSUCRY7kH3bof1rpwtpNh3E8qWXa6F
	077N0Tk48e23+YOQy63UJz/wb57PDQQK4DYFY6ZhhxqMnHCyQYf2yDm2NIeEIKKXU4WpeZ4TGft
	/WHA2DKle+cJXl8cq0qLLr0yhAwA6YoMvrU9XFWzsEW+sJKcmj+gkQyJ7+1LVl61FdZNjD0F+8n
	/YIyIeu4H8bWcSE3yUExZa2G6wFaiXC800LVlcvbG7+NjJPhTB7f+PfHqXx1ghvxb7ATyNOpmRe
	ahdoLef6fHvS29Oice54M5K2DA3SjZOeCBdrSE5ujLD8KYjtAEKYvFg==
X-Received: by 2002:adf:e014:0:10b0:492:20e0:f200 with SMTP id ffacd0b85a97d-4a63ae56927mr1318639f8f.14.1794955397686;
        Tue, 17 Nov 2026 14:43:17 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095f21sm1107711f8f.38.2026.11.17.14.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:43:17 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] xterm: Upgrade 411 -> 412
Date: Wed, 18 Nov 2026 00:43:13 +0200
Message-ID: <20261117224313.4181713-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 22:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132590
Content-Type: text/plain; charset="utf-8"

Upgrade to release 412:

- improve fix for regex-selection of a wrapped line (adapted from
  patch by Albert Flügel, Redhat #2479962).
- fix some cppcheck warnings.
- improve a special case where an exposure event happens to cause a
  hidden character to be drawn at the beginning of a string.
- correct limits for a partial screen clear operation (Debian
  #1149533).
- amend response for DECRQM 1046 to return “set” when titeInhibit
  is set rather than the reverse (report by Vladislav Korikhin).
- update tables in wcwidth.c based on Unicode 18.0.0
- update config.guess, config.sub

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-include-missing-pty.h-header-for-openpty.patch     | 6 ++++--
 .../xorg-app/{xterm_411.bb => xterm_412.bb}                 | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_411.bb => xterm_412.bb} (95%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm/0001-include-missing-pty.h-header-for-openpty.patch b/meta-oe/recipes-graphics/xorg-app/xterm/0001-include-missing-pty.h-header-for-openpty.patch
index 0c9d64c82c..6fac6328d9 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm/0001-include-missing-pty.h-header-for-openpty.patch
+++ b/meta-oe/recipes-graphics/xorg-app/xterm/0001-include-missing-pty.h-header-for-openpty.patch
@@ -1,4 +1,4 @@
-From e30ab2d73a21bc55511cbedbb9ae603246dbfcd1 Mon Sep 17 00:00:00 2001
+From 5e34d71052f1ea63363fe7937859dfa8d46dfb4c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 16 May 2024 23:10:00 -0700
 Subject: [PATCH] include missing pty.h header for openpty()
@@ -18,9 +18,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  main.c | 1 +
  1 file changed, 1 insertion(+)
 
+diff --git a/main.c b/main.c
+index f9d0d14..dac48d7 100644
 --- a/main.c
 +++ b/main.c
-@@ -89,6 +89,7 @@
+@@ -68,6 +68,7 @@
  
  #define RES_OFFSET(field)	XtOffsetOf(XTERM_RESOURCE, field)
  
diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_411.bb b/meta-oe/recipes-graphics/xorg-app/xterm_412.bb
similarity index 95%
rename from meta-oe/recipes-graphics/xorg-app/xterm_411.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_412.bb
index 5398bfbe05..c0e4e8c95d 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_411.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_412.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=413ff95100710d7a81
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-include-missing-pty.h-header-for-openpty.patch \
           "
-SRC_URI[sha256sum] = "969be283670deadd66934865c4de6c5ab045e3a3facc2b228decf91a20d8c36c"
+SRC_URI[sha256sum] = "b48bc780c1cbc14f6d89269f7e593712af6095876960d650be28b55e5dad65a6"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.47.3

