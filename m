Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3F9C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 13:34:42 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.18647.1713792877856380099
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 06:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dei739i4;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: marc.ferland@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4196c62bb4eso20388265e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 06:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713792875; x=1714397675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GQMofiAtbCyRgQjAKxBm3ezu5LJLiqq8SFST1ViGFLI=;
        b=dei739i43KvSUoFKOvb0BcWCNA3/jHB8WitmbJfew1J8xXXh7/MeHFpOOK7u4U9Dag
         1H3w2w8Cy6ZCxL/oS+VSjm+DEIyRZ+edgQSN+xeW/DcQ+JHutL0wg4vygfo9a5Fjkgeo
         Ehv8u8QVxNMB0mBHNkoOiHBIQzy6EOO8ORgrJO1GaBmDHqJzYK4Msz5VWFi/zQg/YCp0
         wU8KDTD0592NrM/sNevLIMVtDo0QuT0AtEvRhavuvOs/rHLxzlmdG87tCtebUNokLxm0
         776Srih+9Szi9sTXWX7Zw/1posLwgQxNJsPgfmq/hd7a2535Z0qKQE/sa7CWGTnQu2Hk
         rITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713792875; x=1714397675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQMofiAtbCyRgQjAKxBm3ezu5LJLiqq8SFST1ViGFLI=;
        b=Sxtxrx6JmYsaujQnEUOQ9C+c7qPi3zxTfjjWp5O465EUOKZoUXFxVzclb0hqljgiGY
         cRnNRkibBAri9MmEmqTVSvFrv+zPqcoHo6cZVf4XIMVuaGHa+46FmhBEuwzk1K2xakmE
         dugdllv4DF8SMDy9oNKKIsx5BQFrKOWTtaZuF1+63s+fs8E/QvvNFaVXqh+5cggJGsD2
         Hn8JqRi6+9Qnd0lXDxJrTl0ccdSxlIwG93281tEtLAR2eLNqbQX7E3efJWSTRUYImMhX
         7pilOs5eA00ZsDr4EloF4QyUwEupPINdn3F6IsDOJh0tmCUDS0wKhN6H9ePlk5bjgwiC
         OE9A==
X-Gm-Message-State: AOJu0YwXHg0ym3DzkTD6ySnyEqrIMGoMsv4H1TvvECLp8b9EVS0B06A4
	cZAYWZD8Kvd2sbsRcWTb5q2KotTvYvQHS2m8APoBYkixOJHjnIHOTUVkvA==
X-Google-Smtp-Source: AGHT+IFicqY2fjCx+wk6F8YyvpBNwjh73MwnE2Qn1hFjczIdOJEKr0jpiblhJdU8H0bCGYfY+Xh1UQ==
X-Received: by 2002:a05:600c:34cb:b0:41a:5d49:6143 with SMTP id d11-20020a05600c34cb00b0041a5d496143mr2022283wmq.12.1713792875222;
        Mon, 22 Apr 2024 06:34:35 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id p6-20020a05600c468600b0041563096e15sm20735892wmo.5.2024.04.22.06.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 06:34:34 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-devel@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>
Subject: [PATCH] libinput: fix building with debug-gui option
Date: Mon, 22 Apr 2024 09:34:31 -0400
Message-Id: <20240422133431.3205647-1-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 13:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110102

From: Marc Ferland <marc.ferland@sonatest.com>

When building libinput with the 'gui' PACKAGECONFIG option, it fails
with:

| Run-time dependency x11 found: YES 1.8.9
| Run-time dependency wayland-client found: YES 1.22.0
| Run-time dependency wayland-protocols found: YES 1.34
| Program wayland-scanner found: NO
|
| ../git/meson.build:578:20: ERROR: Program 'wayland-scanner' not found or not executable
|
| A full log can be found at /home/marc/mnt/yocto-latest/build/tmp/work/core2-64-poky-linux/libinput/1.25.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: exit code 1 from a shell command.

Adding a build dependency on wayland-native fixes the issue.

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
---
 meta/recipes-graphics/wayland/libinput_1.25.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/libinput_1.25.0.bb b/meta/recipes-graphics/wayland/libinput_1.25.0.bb
index 517b247fed..894858e361 100644
--- a/meta/recipes-graphics/wayland/libinput_1.25.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.25.0.bb
@@ -32,7 +32,7 @@ do_configure:append() {
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[libwacom] = "-Dlibwacom=true,-Dlibwacom=false,libwacom"
-PACKAGECONFIG[gui] = "-Ddebug-gui=true,-Ddebug-gui=false,cairo gtk+3"
+PACKAGECONFIG[gui] = "-Ddebug-gui=true,-Ddebug-gui=false,cairo gtk+3 wayland-native"
 PACKAGECONFIG[tests] = "-Dtests=true -Dinstall-tests=true,-Dtests=false -Dinstall-tests=false,libcheck"
 
 UDEVDIR = "`pkg-config --variable=udevdir udev`"
-- 
2.34.1


