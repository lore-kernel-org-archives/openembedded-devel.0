Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27850C433FE
	for <webhook@archiver.kernel.org>; Sat, 18 Dec 2021 19:00:12 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.8367.1639854011395404290
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Dec 2021 11:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ocqbTxRv;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id mj19so5331042pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Dec 2021 11:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GBm3Wmvv29XeJ+XVAAWfPBeGR6giZ1L7yd7q02wfPCE=;
        b=ocqbTxRvCiO4UnyRU8hO2aYXpuqG6B4QRx4NBy1Y707WALFqHtRjwvdS9xvYYMZXPS
         1lJ83nq623SSg9aTPCPk4hGIwAe00kzzTXGoTHds3wWlSv678Ga08uHlQ6AMx8WZWNw7
         7VcaLOdq8wSN16UK7d0Je355FAQPrJpkuCHWFyejxUgJ4rQSzR3sv2W9Q/np9YJT1DUy
         bJyzFaFeeiB63aWQSeQ1oGl813RmwDIzLZXyq/WH9c6sNjI7WJyu42eq7m+vCCc+K/11
         OHJ3jAkuRGSVaR8BxSNWz7xogvchdNmP4Zru3+VhH1oniQ/rIlvLuBqgWvYlxeJJt1gV
         O99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GBm3Wmvv29XeJ+XVAAWfPBeGR6giZ1L7yd7q02wfPCE=;
        b=G5ntjawlgkskHSLxgmEVWjj5kiZ6RkoPxI4R4iy0CtLMvEAPuegmFGZXwt8dqyYpVu
         mGR8nSQDye63U8RjqQyTotYJKnjod/Xg5sG/y37wjFu4kynRSzsRYcsxYE4+luI5EvDj
         /6gjyasXpyb4F/Sd8fW7NkhCnZQx7wWRGMUBix83ZvsvfY6exr7VCNxI6MgtU9u62mNf
         9DXRBxD366mgPnCYMfy/FZPDdGZS/X4ugtRVqKf5yMicKB1hYObEnS/mJkZf+qC7jmIz
         uQA129kAVGStbYNFQTsAve4HBrrb2JK2mXk9UkwuFyQanexYDUyS7eleYFl+PFXY7Gf8
         qApA==
X-Gm-Message-State: AOAM532Gu/0A1FOK85qkrAv2HJlkm4oyYz8lWsdZ63aTn0CQZvYJCHBa
	PnAqRZBpLhzehKa/wJJMevVCOQhIJ5g=
X-Google-Smtp-Source: 
 ABdhPJzUa3wA+Td5T0VayDDYiTNVCRhKv3wqz77j4BEbPlqvVqP6Ghln+TewRK2YkOTJskvnkw2iqQ==
X-Received: by 2002:a17:90b:1bd2:: with SMTP id
 oa18mr9222468pjb.4.1639854010752;
        Sat, 18 Dec 2021 11:00:10 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:8259:344d:2281:ae46])
        by smtp.gmail.com with ESMTPSA id
 j6sm10371127pjv.35.2021.12.18.11.00.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 11:00:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 6/9] sdbus-c++-libsystemd: Avoid hard dependency on rsync
Date: Sat, 18 Dec 2021 10:59:59 -0800
Message-Id: 
 <4932616b69b957e3a876541a579b79cb3f83306f.1639853918.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639853918.git.akuster808@gmail.com>
References: <cover.1639853918.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Dec 2021 19:00:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94434

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dcb8ab6169bd93440137bbd4703171987ecd3a15)
[Fixup for hardknott context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...d25119a495009ea62f79e5daec34cc464628.patch | 53 +++++++++++++++++++
 .../sdbus-c++/sdbus-c++-libsystemd_243.bb     |  7 +--
 2 files changed, 57 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/7c5fd25119a495009ea62f79e5daec34cc464628.patch

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/7c5fd25119a495009ea62f79e5daec34cc464628.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/7c5fd25119a495009ea62f79e5daec34cc464628.patch
new file mode 100644
index 0000000000..ae449791f1
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/7c5fd25119a495009ea62f79e5daec34cc464628.patch
@@ -0,0 +1,53 @@
+From 7c5fd25119a495009ea62f79e5daec34cc464628 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Mon, 12 Apr 2021 14:03:32 +0200
+Subject: [PATCH] meson: do not fail if rsync is not installed with meson
+ 0.57.2
+
+https://github.com/mesonbuild/meson/issues/8641
+
+Our CI started to fail. Even if the change is reverted in meson,
+we need a quick workaround here.
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ man/meson.build | 25 ++++++++++++++-----------
+ 1 file changed, 14 insertions(+), 11 deletions(-)
+
+diff --git a/man/meson.build b/man/meson.build
+index 3cae8446cda..f9c4b83dc81 100644
+--- a/man/meson.build
++++ b/man/meson.build
+@@ -184,17 +184,20 @@ html = custom_target(
+         depends : html_pages,
+         command : ['echo'])
+ 
+-run_target(
+-        'doc-sync',
+-        depends : man_pages + html_pages,
+-        command : ['rsync', '-rlv',
+-                   '--delete-excluded',
+-                   '--include=man',
+-                   '--include=*.html',
+-                   '--exclude=*',
+-                   '--omit-dir-times',
+-                   meson.current_build_dir(),
+-                   get_option('www-target')])
++rsync = find_program('rsync', required : false)
++if rsync.found()
++        run_target(
++                'doc-sync',
++                depends : man_pages + html_pages,
++                command : [rsync, '-rlv',
++                           '--delete-excluded',
++                           '--include=man',
++                           '--include=*.html',
++                           '--exclude=*',
++                           '--omit-dir-times',
++                           meson.current_build_dir(),
++                           get_option('www-target')])
++endif
+ 
+ ############################################################
+ 
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
index c52024130e..59d6f352c8 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
@@ -12,9 +12,10 @@ DEPENDS += "gperf-native gettext-native util-linux libcap"
 
 SRCREV = "efb536d0cbe2e58f80e501d19999928c75e08f6a"
 SRCBRANCH = "v243-stable"
-SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
-
-SRC_URI += "file://static-libsystemd-pkgconfig.patch"
+SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
+           file://static-libsystemd-pkgconfig.patch \
+           file://7c5fd25119a495009ea62f79e5daec34cc464628.patch \
+           "
 
 # patches needed by musl
 SRC_URI_append_libc-musl = " ${SRC_URI_MUSL}"
-- 
2.25.1


