Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E75C021B2
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 19:10:18 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.5486.1740078612529792576
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Feb 2025 11:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jfxAth6U;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-438a39e659cso8921015e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Feb 2025 11:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740078611; x=1740683411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8kXXchcXHq33tvOsOKrWT5YccU00t5cp7xfXfR7ortE=;
        b=jfxAth6UcUd6MvL1l7jtLwS/WVsk0NGWkL+hfpg9z4Vfthmf9iEkYRMS1VAtSTDeIB
         XgY20uecV40bPElrwJcoOkczTUAayO9d5iHuPLt+khqWYdU9D3h0Z8sEakkD6sUL+ZxL
         kSby0GgTnN2Ht+XPet5GtnUklPgzxhE3QjwhCza5AmccAm/I2T5Ej7jVYEysy2OoZJ5p
         o3FyZ+jj62YJNvDzSzDHoLph9IDEKLlZNyPnJsRUr2+WOsAjkX2AwT6uCtkBKscHlPHO
         dnssSwSd3hzt8Yrviqap/D/11oUXTMucnPTV6WVHDEFCvCP/PXf4hpwZipaSMYd8ezH7
         /oVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740078611; x=1740683411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8kXXchcXHq33tvOsOKrWT5YccU00t5cp7xfXfR7ortE=;
        b=Z95vpoS077h/CV5mC7cC+R3jLFC212V1ohdfnJHnwvPKNI253+jdMMczO1aNgMvGpp
         ItyWEcCTKKJfooCf8h69vTL1us/pp9yhQ/yvwyzg3StJ7z9zT8HKfHgSrXMe3Sg+y+PH
         qamAEyevU8GG3VAXetnq+TO2g9l/RPSFnOG3rqXndZ/i7s/CqtzaWWceMQ/HHJh6g/J2
         n9vKogjL8tVJfS4BCUoHoQKrWobUSvr/hPxTYzloqhcRB/2FVxn610eLJQ8eoV6fvI23
         f9XDW+m/yxYkOK/dGl5XAHFFY0tSZ25XzJQ/K5kKf0RaxbsN5VxdSlSNIrG/6EhUxASk
         3j0w==
X-Gm-Message-State: AOJu0Ywiaby0ggbx2/9nYoex+Z/pafG2f1dMkqYRamSaLXD7Z/7Xh1Tl
	VenbqzWqEUtaauqRS4Hf7Ac6szX7joTcwiRmcks1ir9nG+32WPA0iCE2ig==
X-Gm-Gg: ASbGncs0wZz/pJEhOzkUTWlBGPNTMhGV+QR8tsO7ksRIjxgHpe/bKVYkpk5uSZ6eqIJ
	5oUgjSyK3lvc2VJqR8Gsj9VCP/33JtDv9R38WqnUVH4G7wOHrbUNUt0cd7hCltuqpJnEvpQrN5Q
	GG9C7pVom3naOtzX13aLW9v/ueb1W4u3R5HACuC4nMCcCfJHICtsonOQlA8GQ3Dy9vLbmjiBs0c
	nazW8W6Afc9skAA8fj1nJ9HZIaudgSUzr3qQdbLVVdNyCbJM0I26Dl+urp6qkdVmGoQ03P7VZEW
	+oHnJLzjSsSz3IHdtIQeFl4a72BK3wg=
X-Google-Smtp-Source: AGHT+IGGtcYKHmIMjYBaMjlBU46c4AGWxT2DBDgamygpmS2D+E42qw0W+wX7Ba1jA8eqS3YwJ9aOwA==
X-Received: by 2002:a05:600c:4f4a:b0:439:98ca:e39e with SMTP id 5b1f17b1804b1-439ae2160bfmr3071515e9.24.1740078610664;
        Thu, 20 Feb 2025 11:10:10 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439a416caeasm28770685e9.18.2025.02.20.11.10.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 11:10:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] pcp: update SRC_URI
Date: Thu, 20 Feb 2025 20:10:09 +0100
Message-ID: <20250220191009.3598870-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Feb 2025 19:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115530

The original download location, jfrog's artifactory stopped
providing any kind of free service, and the source code is not
downloadable anymore.

The project however has an official github repository also -
change the SRC_URI to this to make it work again.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/pcp/pcp.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/pcp/pcp.inc b/meta-oe/recipes-support/pcp/pcp.inc
index 4cafa7234b..5ed2d220f0 100644
--- a/meta-oe/recipes-support/pcp/pcp.inc
+++ b/meta-oe/recipes-support/pcp/pcp.inc
@@ -7,12 +7,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=37ab75b580d5aad4ada04260efa3702f \
                     "
 COMPATIBLE_HOST:libc-musl = "null"
 
-SRC_URI = "https://performancecopilot.jfrog.io/artifactory/pcp-source-release/${BP}.src.tar.gz \
+SRC_URI = "git://github.com/performancecopilot/pcp;branch=main;protocol=https \
            file://0001-configure-Limit-the-header-search-to-sysroot.patch \
            file://0001-htop-Change-dependency-order-of-header-and-sourcefil.patch \
            file://config.linux \
 	   "
-SRC_URI[sha256sum] = "dacf92ba195f1f2ea8f40bf0c455d2cd2456273a1e30dcc3ee5b5bfd099a99ee"
+
+SRCREV = "c13558fd0df54438cbb87cf303dc279cb58816c2"
+
+S = "${WORKDIR}/git"
 
 inherit setuptools3-base pkgconfig autotools-brokensep
 

