Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB2FC4708C
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 20:01:25 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.22822.1669838483511334930
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Nov 2022 12:01:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O06Srg31;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id 4so17796170pli.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 12:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rl3+sPiuy3lhU6d8bg36cNOu2p9A/ju/VNTYEGIait8=;
        b=O06Srg31OJGhtyXgXsP1SdFWnS0dxRvY8TuNe1ZV6UJWcTiKorTUzUtvcJch5nE41P
         6Nt557BNDFYEYAaGOXswstBFdTzu1brv33kDTerMu1tIrZdJhVP/pIssW6+ZJuIuuxOA
         attmyDqeIIWKdyXhHwVQSZA8VlyuKAsw6fIjpVRiGJV966DA4gIOz22k0yYA4Qc60+4r
         piG79AA3BqAseKNqNzIRJuJXL2PoRFD0vjHmkHp4RoyUd6A8tLyLlexBAs8V07XoERvM
         RhRNTc84Zi2lZJhQy4gjymPHvdUxeWmDU6ET/kXr9CtGsiTWPkga6ZrTQvKHsoC6+8mL
         RRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rl3+sPiuy3lhU6d8bg36cNOu2p9A/ju/VNTYEGIait8=;
        b=HMM/NW2H4PjwewzCSKFJNz2bFFWHoUQFo/NmvMQSE3Y1SiY5vXcX/rq6Y7/A9z3jTY
         oHQbo6v8JjrQ0sKRyf5Dd6hIc20ZzvhLBD4MdcKMy4E3WS42WumYqrOChHSdUp9bU9Hw
         4cJw8b8yYnVRW0oa3iGUf45rJ8bN0ktKgw50nk4ta0h7BOveGFG0Diy8jwLyQ4kVkJAn
         DP/Dcg6rq9ExiqbrDA971Q7+gFLMhgkvwq/LPKQMScyU9hqxeDWM/DKqyof2mvWJ6tuT
         2ArIAlOEvdLRBD2T/pdGRNDXMyJ5fErn+zVasSfrXUUVjMuTEIuGZRJiKYbEZrXycEXY
         c96A==
X-Gm-Message-State: ANoB5pm3EpgV0HS6WGpyyd1LbztHeazmzcqy/31OO2jzm3TaN4GZu7b7
	B5+Te402CZqn8j18V0yxJcyZ4aRKpSo=
X-Google-Smtp-Source: AA0mqf6s9ArNbYRZtwU5uo6rKOSEALo7RasegjSylDF9W6ievagNhazbw69nEroKgsXjkgzJ0Gt0CA==
X-Received: by 2002:a17:902:7683:b0:186:9fc8:6672 with SMTP id m3-20020a170902768300b001869fc86672mr42676319pll.65.1669838482683;
        Wed, 30 Nov 2022 12:01:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id ij22-20020a170902ab5600b001893a002107sm1916026plb.0.2022.11.30.12.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 12:01:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 7/7] libgweather: Remove 40.0
Date: Wed, 30 Nov 2022 12:01:15 -0800
Message-Id: <20221130200115.1954308-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130200115.1954308-1-raj.khem@gmail.com>
References: <20221130200115.1954308-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 20:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99877

Its not used by anything in gnome layer, moreover this helps drop soup2
dependency

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libgweather/libgweather_40.0.bb           | 24 -------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb

diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb b/meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb
deleted file mode 100644
index 771fc62e1e..0000000000
--- a/meta-gnome/recipes-gnome/libgweather/libgweather_40.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "A library to access weather information from online services"
-
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-GNOMEBASEBUILDCLASS = "meson"
-
-inherit gnomebase gsettings gobject-introspection gettext gtk-doc vala features_check upstream-version-is-even
-
-SRC_URI[archive.sha256sum] = "ca4e8f2a4baaa9fc6d75d8856adb57056ef1cd6e55c775ba878ae141b6276ee6"
-
-# gobject-introspection is mandatory and cannot be configured
-REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-GIR_MESON_OPTION = ""
-
-GTKDOC_MESON_OPTION = "gtk_doc"
-
-DEPENDS = " \
-    geocode-glib \
-    gtk+3 \
-    json-glib \
-    libsoup-2.4 \
-    python3-pygobject-native \
-"
-- 
2.38.1


