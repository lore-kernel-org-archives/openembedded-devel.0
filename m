Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34427C4332F
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:31 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.26127.1651346368452195125
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GYnkts40;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id bo5so9480648pfb.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KJOJQMPKAZI46vCF3hD0NVUpxlDDCvSRlvQU9j0uWQ8=;
        b=GYnkts40KqxGDmSgnhfNmXldcAt1Nu/DxiiBv19rhiBhwdToEbghqLK190wcgNHeGy
         +pSTO7xi0TgofBxfPjCVjAhVWQ4T+U3R4UmQMrZbv/kubGjn0xHUjyITwwDBauv5shk4
         QZZleyvAtCIpWAYqzvCGNPszyHKr/gq6o7VJ3+559WgRcoTZOqVkvdG5iE58JmNRckJA
         kVS0sNqKnWXmk9PAtsWQjudKqmgaBg3wxUzoeHcC4GxKfemwv1dpkRi2AurZp9O+mmE+
         IgtZGz7L+ZgQ/vicUqs7ZusBwQAFb5RZNF/NfwAANj3OFglh78duKkK6zSkBlMZWqRfq
         IIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KJOJQMPKAZI46vCF3hD0NVUpxlDDCvSRlvQU9j0uWQ8=;
        b=kOpbf3CP9IEHcd3T6F12b1CwP7+4IHP/sX9Ej4HLIylPesnXIqyQliW2MEbGbXcCnO
         rWISrfPwYNzV8HLOtUEsc3JoejCyKqtjqx2gHn7uUO4zCyLbzdAo6LOhtCGjDOMabAcH
         HBJKd1e17IMCjkgYcB6I3/4qqehHtjTgHFqgbxJsePm24mFXeq9FYA+gN+U+WAeG6SsF
         9NaV1vneQnKPWvD61tiRRZlBulpw946Qx+UnmvBODw5utbKiEnxZXV734UXhzdDkw0Zg
         VXLVnWJILqqoBuTKiFHTk0z355HYMhzkpEh6kEk8w35SxRiJPla/qn81tSTzDyrtakcI
         71lg==
X-Gm-Message-State: AOAM533dgDKdnfiq2jVuVdzJ7oZABetN10skLlkTHhUQ0VwxuNWYK4oL
	tVzLjAFACEUXQARPYK0fx/nI+E7e5dxkZg==
X-Google-Smtp-Source: 
 ABdhPJw81JWb1QlCDXyEDjUEUslBVmlfVfaMWPmpyPgNHw+IuMIEkfINHYM6Ova3M7lGU04K/6CBbA==
X-Received: by 2002:a63:81c6:0:b0:3ab:6167:74b5 with SMTP id
 t189-20020a6381c6000000b003ab616774b5mr3935542pgd.527.1651346367474;
        Sat, 30 Apr 2022 12:19:27 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.19.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:19:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 38/39] pipewire: Upgrade to version 0.3.50
Date: Sat, 30 Apr 2022 12:18:18 -0700
Message-Id: 
 <718849eb7c077771fae71960470dd493b2c6b7c9.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96905

From: Carlos Rafael Giani <crg7475@mailbox.org>

This is a bugfix release. Notably, this makes pw-dot work again - it
required workarounds via pw-dump to output a non-empty dot graph in 0.3.49.

Full changelog:

https://gitlab.freedesktop.org/pipewire/pipewire/-/releases/0.3.50

0001-meson-Add-option-to-enable-disable-legacy-RTKit-modu.patch
is no no longer needed since it has been merged and is part of 0.3.50.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9754901bb0bc85b4a41f0944a4dd18fddcd87d8e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-to-enable-disable-legacy-RTKit-modu.patch | 44 -------------------
 ...{pipewire_0.3.49.bb => pipewire_0.3.50.bb} |  6 +--
 2 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/files/0001-meson-Add-option-to-enable-disable-legacy-RTKit-modu.patch
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.49.bb => pipewire_0.3.50.bb} (98%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/files/0001-meson-Add-option-to-enable-disable-legacy-RTKit-modu.patch b/meta-multimedia/recipes-multimedia/pipewire/files/0001-meson-Add-option-to-enable-disable-legacy-RTKit-modu.patch
deleted file mode 100644
index 61bcdb3dd4..0000000000
--- a/meta-multimedia/recipes-multimedia/pipewire/files/0001-meson-Add-option-to-enable-disable-legacy-RTKit-modu.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From b311f9e75f13205fd0738f7e89fd2062b9e7b237 Mon Sep 17 00:00:00 2001
-From: Carlos Rafael Giani <crg7475@mailbox.org>
-Date: Wed, 30 Mar 2022 19:44:38 +0200
-Subject: [PATCH] meson: Add option to enable/disable legacy RTKit module
-
-The RTKit module is being replaced by the RT module. Currently, it is
-always built if D-Bus is present. For packagers, it can be beneficial to
-be able to disable the legacy module. Add a Meson option to allow for
-exactly that. Make it enabled by default to not change default behavior.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/1204]
----
- meson_options.txt       | 4 ++++
- src/modules/meson.build | 2 +-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/meson_options.txt b/meson_options.txt
-index 49d5b2203..2687bfe7e 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -237,3 +237,7 @@ option('libcanberra',
-        description: 'Enable code that depends on libcanberra',
-        type: 'feature',
-        value: 'auto')
-+option('legacy-rtkit',
-+       description: 'Build legacy rtkit module',
-+       type: 'boolean',
-+       value: 'true')
-diff --git a/src/modules/meson.build b/src/modules/meson.build
-index ee724bf52..2d26cc459 100644
---- a/src/modules/meson.build
-+++ b/src/modules/meson.build
-@@ -139,7 +139,7 @@ pipewire_module_rt = shared_library('pipewire-module-rt', [ 'module-rt.c' ],
-   dependencies : [dbus_dep, mathlib, dl_lib, pipewire_dep],
- )
- 
--build_module_rtkit = dbus_dep.found()
-+build_module_rtkit = dbus_dep.found() and (get_option('legacy-rtkit') == true)
- if build_module_rtkit
- # TODO: This serves as a temporary alias to prevent breaking existing setups
- #       while `module-rtkit` is being migrated to `module-rt`
--- 
-2.32.0
-
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.49.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
similarity index 98%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.49.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
index b821f4400b..0d725b9ee2 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.49.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
@@ -13,10 +13,8 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "dbus ncurses"
 
-SRCREV = "075e7b266876802eab0077afd13ea8e1cee5e1fd"
-SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https \
-           file://0001-meson-Add-option-to-enable-disable-legacy-RTKit-modu.patch \
-           "
+SRCREV = "64cf5e80e6240284e6b757907b900507fe56f1b5"
+SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


