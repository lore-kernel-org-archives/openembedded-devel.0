Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81245C48260
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 04:56:09 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web10.8979.1706244962532142001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jan 2024 20:56:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kXkcRdns;
 spf=pass (domain: gmail.com, ip: 209.85.210.49, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6dc20b4595bso247761a34.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jan 2024 20:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706244961; x=1706849761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/0o8GAKzGtqQ/tljWtt1ReG+Gn2Tz+ybJ8WohLqqHhU=;
        b=kXkcRdnshavdvjpccgAoFlh0gsI68tRzaipldQeLbnGL+w4UcZMWi7FdSdKh9Zv/jC
         YSt46dpSOEpKoivH/X6uXhsPRkyf/q+8vd/cjduJZ44piuDjPM/1rQeGhAWpOGECFWZw
         rknXRDTT2oksj58bEGR95UiQNQvXd9AkuRSePXD3S36mS9DEy69Vhfutej8lVzd99DPP
         4mi0Yp/StW3NB4hsHmp6lZOAm6ngpAzIFeHvB1IJQXSfqG/I+BuqzkWi8YdP6rNHk762
         yPV7FesGlBscXYlplywdewVOuYv5QvZ82M0ZBZiqhqV4ydgxJzpw+AJFQWRaWOVtbSzm
         6DYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706244961; x=1706849761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0o8GAKzGtqQ/tljWtt1ReG+Gn2Tz+ybJ8WohLqqHhU=;
        b=wBFukgqJVLGBEc8QEswb8KOilSGqdao309fwQbdDl46v2g2dWhXaLu84cLxaIGbBl6
         khTa0sb+KenxtMQpv3kxCyqj0LlEC2ZUpIvOnDCVhDVBTSu4fTl75qACLCOGXbJkU+jl
         6Hr1xkiC3JhJQOHY9lKLRG2iTscPdAV8PsAOGJmk2iF42jiphlmodceLcsOM180PqScH
         ux3lPspWqNyU8eXrH3SCzXGGasCnLp/w9gJJB7CNCca4sqFGU9V5KNsjcuArljcUDRQC
         xpfJhkO1w3hT+NSCgT4hwZY/NsiK4BYfrXX/43SBqRyTzLwYswioA6U1leGe9SIlV+2c
         5keg==
X-Gm-Message-State: AOJu0YyD3Jj/YUSwNCX+rJy5qUbvP/KTf9JRvMPL4sF9ChHp2coO4z9s
	KB5M5lVDGaNlVovHCrnvJTCsEBF0WGieu8n/vAqn8hy/Z24YyZn6fTNhXRIb8zg=
X-Google-Smtp-Source: AGHT+IHwgmKmheKvPUCPdtbNM2SpaGFVue8cdFwTT2gnmqPjtqBYtAzKXBke1w8Ci1IZSHXtPVwdYA==
X-Received: by 2002:a05:6830:1242:b0:6e0:cb53:5caa with SMTP id s2-20020a056830124200b006e0cb535caamr1019720otp.13.1706244961495;
        Thu, 25 Jan 2024 20:56:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c13b])
        by smtp.gmail.com with ESMTPSA id q21-20020a62e115000000b006ddd22b79f6sm358928pfh.120.2024.01.25.20.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 20:56:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] vk-gl-cts: Disable Werror on amber external module
Date: Thu, 25 Jan 2024 20:55:59 -0800
Message-ID: <20240126045559.2733701-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jan 2024 04:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108456

When compiling with clang-18 it finds more warnings which becomes errors
so disable the warnings as errors in this module for now.

Fixes
/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/opengl-es-cts/3.2.9.3/git/external/amber/src/src/engine.cc:35:3: error: 'switch' missing 'default' label [-Werror,-Wswitch-default]
   35 |   switch (type) {
      |   ^
1 error generated.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 72005636ea..04e4227915 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -41,7 +41,7 @@ SRC_URI:append:toolchain-clang = "\
 	file://fix-clang-private-operator.patch \
 "
 
-EXTRA_OECMAKE:prepend:class-target = "-DCMAKE_CROSSCOMPILING_EMULATOR=${WORKDIR}/qemuwrapper -DWAYLAND_SCANNER=${STAGING_BINDIR_NATIVE}/wayland-scanner -DWAYLAND_PROTOCOLS_DIR=${STAGING_DATADIR}/wayland-protocols"
+EXTRA_OECMAKE:prepend:class-target = "-DCMAKE_CROSSCOMPILING_EMULATOR=${WORKDIR}/qemuwrapper -DWAYLAND_SCANNER=${STAGING_BINDIR_NATIVE}/wayland-scanner -DWAYLAND_PROTOCOLS_DIR=${STAGING_DATADIR}/wayland-protocols -DAMBER_DISABLE_WERROR=ON"
 
 # The best thing for the user to do is to not specify any of the following
 # PACKAGECONFIGs (i.e. leave it blank) which tells the project to do its own
-- 
2.43.0


