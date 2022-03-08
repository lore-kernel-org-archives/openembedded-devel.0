Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C27DC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 16:02:13 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.9552.1646755332590121938
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 08:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MHqFa3Kk;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id cx5so17612993pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Mar 2022 08:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RJ/uUq8gnbN3SdBjC5rUg/tQcjizyToX3ii64S3FG0I=;
        b=MHqFa3KkIsnXad5cCBfaXRXx0Y+c6trQ5ardLQnHsvgOvSVP+SoBKSkGKZBndciY4q
         +z6HVGQ7++iCjbCrl6MshjEjb8vzuEe+q/PFnGqRNujl+S9J8Uj1AHRcv7lqIRM2QXTd
         n6f6MpX1MNBp1jSlh0rMIKHJfN5/anRgF4UEwC3quTkWQqs+rTbnZjKaYGF3pqONTg8A
         kMEB6uewGEnHX3ORm8z6B2QMfYBQ/58nwDRpFz45ZQGVFJjqGs2GM4VD4i0bL7ztjDsd
         JFi4E7T5ShhrFfW+xlkZm+n8xrczRNy55ix72PnmWxfPcKLVBVyxQfOHWtWRqWBixQu0
         TYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RJ/uUq8gnbN3SdBjC5rUg/tQcjizyToX3ii64S3FG0I=;
        b=lFhAlogWMXxKhLX2UW5+Yve6TomvA7eSDTGuwGaFfkHHga84WFhMWYh7rruiQdGgDw
         kujogHroPa6AFe87dv/k+ZEGo0x+M7dL1O8z43jrR2t/c2hAJxWpTRugRIu/fCMH7yUi
         i6AE5d976ImkzMH1o92nk/V1aTOTmP2iTTyYcA64Xytd3tVhFv9sVZwUcn1rG/p351Tr
         mJt/Yhi9yE89MLRx4TMqGK171PgUjWHwMa1cUSeLgaS+l3CGsvmRssFaJPnUXyrhCZQ2
         duHxXOiy7pT3qhgJh629JQQBLYNqP+iRaTerDsH8TWixcu+bOtr1h7DOdfVw+03gQ4f3
         2Fvw==
X-Gm-Message-State: AOAM533L5vYajNHUBhzyPDbty1a7zkzK8ML9FW5gLN7z1F/RbvVZnO4T
	OQlprUbif/7xS7cEYnUD4ZmwKkYCvoy6vQ==
X-Google-Smtp-Source: 
 ABdhPJx6smtbe7HxhoerifD/cG+hZhqcYkbQ5kNXcWsC5LnAAYZ2k6+b3n04OBczNJrrkVt+Na5ngA==
X-Received: by 2002:a17:90b:17ca:b0:1bf:6188:cc00 with SMTP id
 me10-20020a17090b17ca00b001bf6188cc00mr5526765pjb.2.1646755331747;
        Tue, 08 Mar 2022 08:02:11 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 r1-20020a17090a560100b001bf72b5af97sm3533737pjf.13.2022.03.08.08.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 08:02:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 1/3] libdc1394: Change dependency from
 virtual/libgl to virtual/egl
Date: Tue,  8 Mar 2022 08:02:07 -0800
Message-Id: <20220308160209.2585680-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Mar 2022 16:02:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95883

virtual/libgl is not provided by some graphic stacks

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb
index d5e189dcb6..952ba603ba 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_2.2.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c848e78d9a4a5cc69906178e4d6fbd64"
 # libsdl to provide sdl.m4 with AM_PATH_SDL
 DEPENDS += "libusb1 libraw1394 libsdl \
             ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxv virtual/libx11', '', d)} \
-            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
+            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/egl', '', d)} \
             ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'libglu', '', d)} \
 "
 
-- 
2.35.1


