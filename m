Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328E6C47086
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:36 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web12.7655.1649432511768829937
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 08:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZxwpZbtA;
 spf=pass (domain: konsulko.com, ip: 209.85.166.172,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-il1-f172.google.com with SMTP id d4so6080579iln.6
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 08:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N+Ji5uuGoLLikm9VjomEqEBL6EEMrKchbEVcMvzu6so=;
        b=ZxwpZbtAMOqM0EPqRwBONZXCmFJPVYt6mmBlv4wnkIcqSU0SiTjk1S/4dI6j4zj+RR
         9w/QmFXKYe0c7gzuSF0f8x+ZrFXyvj5UR+aqE3Geykk0UCdaVlxcvlj6JtSA66JPwqZK
         cQGZ0RjY7dn8HLQ7E+n5xaqqbY3V4ad9GhtG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N+Ji5uuGoLLikm9VjomEqEBL6EEMrKchbEVcMvzu6so=;
        b=ZjArrcfwgU1q6u8d9WBYxZv0/oV/O5ZnWXy/xxv6UWF7pFUcNrrZWMvagaewf4mqg6
         Y6Qspv24YGZj8IOYqU+TCHUtO9Y0Oe/9F0YBxan/n7CyntJazyWo8b3tswugW3FKSogc
         w0wgAgGF5uYIhua2hDeZxAe4IbboD+EQGU8AO0sSvmSrZYIzHqAH2fFkjMge1DvUcYOr
         Vnyn/ZMTVflzwcY31+Cicbbr6sKgvy5XhgKfbB4TbaY0xrNxvx/C6LqNk0YI4jQKlkET
         LSrd2GWhkNe4bGzgswEkThUgUZM9QcppFE+cfdtCAMZU3RUeLQO5bGcnat5cTmVo3fYD
         3PMw==
X-Gm-Message-State: AOAM531ojR3WtPk6sggk78NMNuzE9+Nh/3ePdVcg5IcrfmJCcYfpJs71
	pF7xif/IWjnjQpu/DHWuZPOWsAq7guyxDA==
X-Google-Smtp-Source: 
 ABdhPJzuVBH1kX3r/htYzaupAVmOgujgS8dqSH4PtIrTONCUxWyRLfX3kRV86qj5WHeQwqOVQ23xAg==
X-Received: by 2002:a92:130b:0:b0:2c5:66a6:cad8 with SMTP id
 11-20020a92130b000000b002c566a6cad8mr8311578ilt.285.1649432510455;
        Fri, 08 Apr 2022 08:41:50 -0700 (PDT)
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com.
 [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 o7-20020a92c047000000b002ca30fcc954sm10470029ilf.36.2022.04.08.08.41.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 08:41:49 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] wxwidgets: Fix building without x11
Date: Fri,  8 Apr 2022 11:41:46 -0400
Message-Id: <20220408154146.1214503-1-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96479

Building with wayland and opengl in DISTRO_FEATURES without x11 as
well was giving the error:

wxwidgets: PACKAGECONFIG[no_gui] Conflict package config 'opengl' set in PACKAGECONFIG.

Upon some investigation, it looks like wxwidgets now supports building
against Gtk's Wayland support, so we can also enable it if wayland is
in DISTRO_FEATURES.  For OpenGL, however, wxwidgets seems to have a
dependency on libglu, so the DISTRO_FEATURES check has been changed
to only enable it by default if both x11 and opengl are configured.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
index e82143040..e7e89d64a 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
@@ -43,9 +43,9 @@ EXTRA_OECMAKE:append:libc-musl = " \
     -DHAVE_LOCALE_T=OFF \
 "
 
-# All toolkit-configs except 'no_gui' require x11 explicitly (see toolkit.cmake)
-PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', 'no_gui', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
+# OpenGL support currently seems tied to using libglu, which requires x11
+PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'gtk', 'no_gui', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
 "
 
 PACKAGECONFIG:remove:class-native = "opengl"
-- 
2.35.1


