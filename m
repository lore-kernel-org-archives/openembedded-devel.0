Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A298C433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 22:57:05 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.84609.1638313024220808687
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 14:57:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kNz0Iq1T;
 spf=pass (domain: gmail.com, ip: 209.85.216.45,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so19442437pjc.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Nov 2021 14:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GBm3Wmvv29XeJ+XVAAWfPBeGR6giZ1L7yd7q02wfPCE=;
        b=kNz0Iq1TcFYJmecs6DGG1vowo8PAp+TgIF6tf3tSkZtBnzvUoXKrkBMCgMgA3IaIkm
         ZOSaM8SBUMbkglFqoRB9no7wR5i76ETN5NWWVvDajXfGG1GMFElrQM7VF632KE/yQ9yR
         CJ5awZn8Ux4IrNB1IayYzv5vYyAmXLOFSENkmFcrDrL0GsKdZaJjVyRLTEf5upS+Y2Bt
         sGW0c96Te8Xm+xiQx3bMBT/QOGR4RV5bwpCIIL/7mM7QVlDPVvFmo3OEQywJ8jdAGq61
         7OfzlVwoOl2WocZJu8UPMfnRdQZf5k+EUhdMUMNhRjOedMr5FGJQjTKyK5My9G06/za5
         2gZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GBm3Wmvv29XeJ+XVAAWfPBeGR6giZ1L7yd7q02wfPCE=;
        b=1OUuKRJrppn1deXUjG18OXbJgzYyI+3ik910GM5KPlJUbcUiFgQx5vYyVDe9umvVBT
         1N3kWz4wgiTCCzfPMH5cPg9+feVoaxH8DPbP6MuXA1ueCAoLGbA3NTaLWs1ekmrI265w
         GJ6i1L3yV+84M5roFVjQdDg2tNo0sL2mk/iO1/muxLIdXqNx7/yhWHWGW4Z3gcSJrvTf
         Kpr+ZP95K9wjDRS+5CJvFd4QQBy1pIk7bDwzBlMrvoySBHd9uwLwiYrqugjmIA0UCmJA
         FO6ECnMl73P8Vq8PhCVp3nSjVEJPVuInLF3n1AJ8EtM+meszOMKWbYI67On8aE/9dohv
         N14A==
X-Gm-Message-State: AOAM533xeJkC0n5JjxEeJV9aL4V3MG4T4A2ICRerGp8V3WzIqSGL7iYn
	OBLps4ZjGttCeXNA31DODIA1EEeIGRM=
X-Google-Smtp-Source: 
 ABdhPJwnTqKjgt66VQ/WygzjszooYqSsj++s1ju5jrpSiP8oBq2MJrMsBEXkRGpSZza0/azMxqE6GA==
X-Received: by 2002:a17:90a:c58f:: with SMTP id
 l15mr2512164pjt.75.1638313023539;
        Tue, 30 Nov 2021 14:57:03 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7839:c9c5:3df1:81ad])
        by smtp.gmail.com with ESMTPSA id
 p16sm23373028pfh.97.2021.11.30.14.57.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 14:57:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 6/6] sdbus-c++-libsystemd: Avoid hard dependency on rsync
Date: Tue, 30 Nov 2021 14:56:55 -0800
Message-Id: 
 <4932616b69b957e3a876541a579b79cb3f83306f.1638312940.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638312940.git.akuster808@gmail.com>
References: <cover.1638312940.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Nov 2021 22:57:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94160

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


