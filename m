Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E4CC2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 19:12:04 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.5934.1719861118235878248
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jul 2024 12:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TvOGdzGf;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4256eec963eso24111815e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 12:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719861116; x=1720465916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PBCYTBLwZqwRuCsjrUvZtsESEJoj4tdAwX7ryeGRFbc=;
        b=TvOGdzGfg94Mv35SlV/HV74g4g1SACZngw43YvkkoJHqA2Xzob4ee4SwN21GEZoeRQ
         o4RuKbZeuIXomVi8Xn2POGiTiQXVFncdPX8qi/lS23ksqV9svvyaz68kBCkXA6G4U3oi
         RJLda2+BAYnu7zZhw4GmYUHPBelXiVvnNb8ebyaQx9PSFm9jxBTRDCRyYFXqUIsox/0X
         Hew8kRC3gsS6gOQJKIYAFj0Zo9yofhaLl0zuCYWQ4KD2gxXUVjbEsdatPTFbdSrSkFEk
         nIOMIhuZup6XNR+3AiKWUjHuVvAX1IcHuaKajXTTeqw0ehDzUwJIvH9P86MuWdXwlxZj
         tPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719861116; x=1720465916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBCYTBLwZqwRuCsjrUvZtsESEJoj4tdAwX7ryeGRFbc=;
        b=DBILDRN7ziM51yqrKddANG1tVhDLUqNvPFzgkPIx0MiS8mjJAZYdOu+IY9xne4t82f
         P23VR60q3dDyLPqr3qRFw48hPrn8psaRkkLRSIaI/SkW87I7VLOY5IAj4kPWOVq1e/4k
         zpwfcdz2WxySrTF3FpLzQj7yhSVO8UQZRxBlVYI6hwfu1yvh84pRQwKDHKtc4VgxI9UY
         837a/SMUY0yGkLO2kaQqN49MqysCraV0m+mOhSYRNrir8zRon6cWXTU82jhioIWQo1x1
         twZH2sGzhoVAiAgDUpnpAzMcjC7UmKybJBukkpR7MpErcbVB9oVmT2oWY4llUiUAivIq
         VG8A==
X-Gm-Message-State: AOJu0YxDqJ4v+KpQ7mU315olReHkXf1Ag3L61IJYYbEvIzpkb0Nze8h2
	2x4irnetPyN1JxM1Nr/7aMHnnClJdse/OQBBce7JvUPFOq6Xhth1UphuSNIY
X-Google-Smtp-Source: AGHT+IEFFIoL2mq7R7JeaG0Yil11l7ua5IDNm/7k9raHzNW676C/NATKbkNXAbplVTseHR7ALuCtNg==
X-Received: by 2002:a5d:6890:0:b0:360:9436:b928 with SMTP id ffacd0b85a97d-367756aae29mr4486982f8f.27.1719861116074;
        Mon, 01 Jul 2024 12:11:56 -0700 (PDT)
Received: from localhost.localdomain (dslb-002-205-007-136.002.205.pools.vodafone-ip.de. [2.205.7.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e1430sm10886230f8f.52.2024.07.01.12.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 12:11:55 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [meta-filesystems][PATCH v2] overlayfs: Use explicit version
Date: Mon,  1 Jul 2024 21:11:44 +0200
Message-Id: <20240701191144.3589092-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 19:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111210

The upstream project now has a version scheme and migrated to meson.
A weak dependency on musl has been upstreamed too.
Adjust the recipe accordingly.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 .../overlayfs/overlayfs-tools_git.bb          | 28 -------------------
 .../overlayfs/overlayfs-tools_v2024.07.bb     | 16 +++++++++++
 2 files changed, 16 insertions(+), 28 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
 create mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb

diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
deleted file mode 100644
index 47613207a..000000000
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_git.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Maintenance tools for OverlayFS"
-HOMEPAGE = "https://github.com/kmxz/overlayfs-tools"
-LICENSE = "WTFPL"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f312a7c4d02230e8f2b537295d375c69"
-
-SRC_URI = "\
-    git://github.com/kmxz/overlayfs-tools.git;protocol=https;branch=master \
-"
-
-PV = "1.0+git"
-SRCREV = "b5e5a829895ac98ccfe4629fbfbd8b819262bd00"
-
-S = "${WORKDIR}/git"
-B = "${S}"
-
-# Required to have the fts.h header for musl
-DEPENDS:append:libc-musl = " fts"
-
-EXTRA_OEMAKE += "'CC=${CC} -O2'"
-# Fix the missing fts libs when using musl
-EXTRA_OEMAKE:append:libc-musl = " LDLIBS=-lfts"
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_install () {
-    install -d ${D}${bindir}
-    install -m 0755 ${B}/overlay ${D}${bindir}
-    install -m 0755 ${B}/fsck.overlay ${D}${bindir}
-}
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb
new file mode 100644
index 000000000..0ca6477f4
--- /dev/null
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2024.07.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Maintenance tools for OverlayFS"
+HOMEPAGE = "https://github.com/kmxz/overlayfs-tools"
+LICENSE = "WTFPL"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f312a7c4d02230e8f2b537295d375c69"
+
+SRC_URI = "\
+    git://github.com/kmxz/overlayfs-tools.git;protocol=https;branch=master \
+"
+
+SRCREV = "7a4a0c4f2c6c86aa46a40e3468e394fd4a237491"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+DEPENDS:append:libc-musl = " fts"
-- 
2.25.1


