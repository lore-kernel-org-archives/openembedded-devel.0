Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A985C3DA4A
	for <webhook@archiver.kernel.org>; Sun, 11 Aug 2024 17:13:58 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.28039.1723396428420951370
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Aug 2024 10:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gffTKOFi;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-710e39961f4so860350b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Aug 2024 10:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723396428; x=1724001228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WwwaDqzbAFtzfaGALGDRI3HRWM6PACgBr8uKm77fqWc=;
        b=gffTKOFi8b/vmu8nI/KaYExPZPbFDwvIgKN/luxHR9OIxO3NsUcTCq3WY3/Q26q9B0
         wxhlRb0pRuL3SUZxuD4eCv2Kag5hDkh1UiKHewSEGnLeohWIQugUNse7BBto7pRVzjUz
         0bQLlU/GmuiwOQa8wCf/qfUGnsPVTc6kQrY4RthoFmgv35q4XM+lhes586+jAOZfIqt+
         1BbUIdAwQeEnoEAiUYoGnofa+/mtX6QHKt30LfNF7o/SZyLUoUbdELuCiqQhgGI0uj0d
         Fvd28JfJFZZ+y2RNcffHgW1cNTGl5NME4mOuTvoK/8/BsH2RO3LSf0tfkLvOjYho1BjH
         VbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723396428; x=1724001228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwwaDqzbAFtzfaGALGDRI3HRWM6PACgBr8uKm77fqWc=;
        b=A4KPD5qPw52QlbA46f+MuTskmLplFCz4XTjbcwLuH+c0yL4wLSjZxlyPqQ6KgeV2xV
         HVr4PeczXvqMNR0ZoDT2J9GLsnq1XiPKJ1Csi1NCFx/+mzgKDbDxQHT/CKvQwh2WHU9g
         GRbl+YtKXXDWWa3KQL1zNVI8282H3DVKm/9SqI2Z+8SCbQr7/hjZIXmak+lgayU/0rj5
         YKucsLtTlIKXNJc+xBuBpXbp1QwlKUOmeESmCq8D6us8KAiZwrGk6cLsM4ScEiUOV25y
         5ZdCWwLgU2EN5KBUBgwotEYd/NpmcRL/dnE/fBxhSny4GH6pJVr/S0SwMJHDMqsIzbhz
         x4Ww==
X-Gm-Message-State: AOJu0YwQtS3crbQeVNQGNtnqt6jJRLVMwzvqs2lab24GntkdRbcmteIY
	qQluOMaESarsUZFFcH+kliDtk2P0UHOVh2ikisH/caZa2TCBrRgvL4oklw==
X-Google-Smtp-Source: AGHT+IHXuQDiB73u5TKqJzcqCBckqX7oZoBrRh07gmccRz/zVWK4ZpZUSIkyuXmHb3KsCYXAn8U8SQ==
X-Received: by 2002:a05:6a20:d527:b0:1c2:912f:ca70 with SMTP id adf61e73a8af0-1c89ff77fecmr6696718637.42.1723396427488;
        Sun, 11 Aug 2024 10:13:47 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4c22])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fcfe487esm3313903a91.42.2024.08.11.10.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 10:13:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-filesystems][PATCH] zfs: Upgrade to 2.2.5 release
Date: Sun, 11 Aug 2024 10:13:44 -0700
Message-ID: <20240811171344.3511960-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 11 Aug 2024 17:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111754

Enable linux builtins to fix zfs build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-filesystems/zfs/{zfs_2.2.2.bb => zfs_2.2.5.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-filesystems/zfs/{zfs_2.2.2.bb => zfs_2.2.5.bb} (96%)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
similarity index 96%
rename from meta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb
rename to meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
index d3ea6797e7..504fe28923 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.5.bb
@@ -4,7 +4,7 @@ LICENSE = "CDDL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7087caaf1dc8a2856585619f4a787faa"
 HOMEPAGE ="https://github.com/openzfs/zfs"
 
-SRCREV = "494aaaed89cb9fe9f2da3b6c6f465a4bc9f6a7e1"
+SRCREV = "33174af15112ed5c53299da2d28e763b0163f428"
 SRC_URI = "git://github.com/openzfs/zfs;protocol=https;branch=zfs-2.2-release \
            file://0001-Define-strndupa-if-it-does-not-exist.patch \
            file://aaf28a4630af60496c9d33db1d06a7d7d8983422.patch \
@@ -35,7 +35,7 @@ EXTRA_OECONF:append = " \
     --with-systemdgeneratordir=${nonarch_base_libdir}/systemd/system-generators \
     --with-systemdpresetdir=${nonarch_base_libdir}/systemd/system-preset \
     --with-systemdmodulesloaddir=${sysconfdir}/module-load.d \
-    --without-dracutdir \
+    --without-dracutdir --enable-linux-builtin \
 "
 
 EXTRA_OEMAKE:append = " \

