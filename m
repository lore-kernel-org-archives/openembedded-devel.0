Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DCB7C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 05:48:55 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.15601.1705643333341373138
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jan 2024 21:48:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LHm0uvdd;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-554fe147ddeso480092a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jan 2024 21:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705643331; x=1706248131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p3tixldEFITKIobrzJwh6SM7YF6lZkbyHCI32MKN27k=;
        b=LHm0uvddzIoTDQibHbEC3ImUZLZuIz/GlqIHMv2PZrk+9sQ4VUlNMaw4FKxz35lovK
         tw3PbjFj2+qnay2Rmps/o6BrPUCxgxJ3OAlsFqn6K+qmian7pYCrzIoIth+baGYY1qxQ
         GDkTIWOpxWA7C+q2+Q+l+PJnb8HRpEQxbDDPwASlSLQK6PfHBjpKuDCx3u60frlcR+Ze
         JT2B0xCCryQI15AnSnpA3Z35S4bHz0k2l1Vxd5wHqhtOtzSFHGCTpUHLkCejWYFRgEVi
         ww5+P4beIsUAJCBRZ/5IOH/h1C6NeOM8i//wV4dIEoHWzlQ7pgL4izTrzfi0nLiNhPJJ
         +Pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705643331; x=1706248131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3tixldEFITKIobrzJwh6SM7YF6lZkbyHCI32MKN27k=;
        b=CJ/PZ/coKET26JND021qSeQzJ2cqhuQO3ISnwLTEeMxld1zkkWAs2XqFrRmTHo7hW1
         C7hqnPqyurEvTW/oPvR+ou6T9Vi82V22jNU++JawTmTEoYQObbTN59mqIKgFWqhPICp5
         0dh8NjVkTEo+2gdTd9dSe4eENvH4fg5yjRi3pOWupxDkRVcqcWRBQ+fixerfHMjBSpCk
         sASJSN5Drcyd0Tl+U/7t54LQj2qYKtHoucDRLZmBowwM25q+u/YRJjsT8qAVijdmxRs6
         9gIr3faPIxuIItyAjQHYK6BEqJEQtPT1bVhM6H0EDvMRwE+zANMqxyN9mMEp6xUGKzNA
         Z/Og==
X-Gm-Message-State: AOJu0Yw8W20u5jxFbz02Y8k/y1wG9D5d+5IQKQuLBvX+UMWdQGnbKV2M
	mcjipsiDfk/m4UiKqyJnHSbMjlKpNYeTG4lA3PEKSHDgeOxf1eTUcN7G0r1hNlI=
X-Google-Smtp-Source: AGHT+IE0H+IM2Xv6gsA8AHrdMOwesoDGqKt4I4EslM3Mfk9Ag+AnGmh3yUYTF0NujGeendzhX33d9g==
X-Received: by 2002:aa7:d481:0:b0:559:eec3:a90e with SMTP id b1-20020aa7d481000000b00559eec3a90emr598494edr.46.1705643330715;
        Thu, 18 Jan 2024 21:48:50 -0800 (PST)
Received: from localhost.localdomain ([176.33.66.82])
        by smtp.gmail.com with ESMTPSA id g2-20020a056402428200b00558a3268bbcsm10205901edc.53.2024.01.18.21.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 21:48:50 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] icewm: upgrade 3.4.4 -> 3.4.5
Date: Fri, 19 Jan 2024 08:48:47 +0300
Message-Id: <20240119054847.630444-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jan 2024 05:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108355

Changelog:

Fixes

	Fix for centering the clock LED digits vertically.
	Fix the KeyWinTile commands for multi-monitor setups.
	Fix the workspace buttons for right-to-left languages.

Changes

	Let KeySysTile only tile the windows on the active monitor.
	Update the 'Hibernate' command and add two new hibernate icons.
	When pasting into the addressbar, replace newlines with spaces.
	When focusing with RaiseOnFocus, release the button grab.
	After raising a focused window, release its button grab.
	Avoid calls to fstat to circumvent a glibc inefficiency.
	Prefer localtime_r over localtime to evade a glibc inefficiency.
	Update the copyright notice in the about window.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-extended/icewm/{icewm_3.4.4.bb => icewm_3.4.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/icewm/{icewm_3.4.4.bb => icewm_3.4.5.bb} (91%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_3.4.4.bb b/meta-oe/recipes-extended/icewm/icewm_3.4.5.bb
similarity index 91%
rename from meta-oe/recipes-extended/icewm/icewm_3.4.4.bb
rename to meta-oe/recipes-extended/icewm/icewm_3.4.5.bb
index 8a150f5a9..6e50231c8 100644
--- a/meta-oe/recipes-extended/icewm/icewm_3.4.4.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_3.4.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "1bca9a0b5f959c1f715f5e49d2e0036b5ef3ca07d049529bc88cb7429a58ba31"
+SRC_URI[sha256sum] = "8d1afe9a2d5e28e88261b68906337449307e53f06c08218e1a6409083998a5f1"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 
@@ -19,7 +19,7 @@ EXTRA_OECONF += "--with-libdir=${datadir}/icewm \
                 --enable-xinerama \
                 --enable-shape"
 
-DEPENDS = "asciidoc-native fontconfig fribidi gdk-pixbuf imlib2	libxft libxpm libxrandr \
+DEPENDS = "asciidoc-native fontconfig fribidi gdk-pixbuf imlib2 libxft libxpm libxrandr \
     libxinerama libice libsm libx11 libxext libxrender libxcomposite libxdamage \
     libxfixes"
 DEPENDS:append = " qemu-native"
-- 
2.25.1


