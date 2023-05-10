Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF34C77B75
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 03:25:16 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.8125.1683689107663324737
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 20:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=A/9PgRer;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1aaebed5bd6so47843725ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 20:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683689107; x=1686281107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OQzbd/JQW1YBPgsCg6/wWTO4tvMWJU9dD44HTJnPgi0=;
        b=A/9PgRerY+5gcgcA79GGoaFT0nhumqWVRQ38euT4WSftRAHUeS3ln+jfW2FkGGVlDb
         XyZM3GfSqVoqPv06TAf3Qtxts386/jr9/HOzYQpOXeIUTwKz+/g0o4qYPHQzJ256BDlH
         4mOFIyOEiw116ceSIqPa2v2YSKsBKR+akfcycrGBN13fEefeaJFJct5rInJVPLXEKxXV
         oAyGgpFSrOropWqpvoEeMoR/qLYaY7yH6+K4G5XN4+fKPN0zJR67gOaczZXY+c0zFERX
         a49c5mWKyObfURKyXWPhI2/gas0Ck35k7KzJwROej7spfXRb9eOv4/MPncgeNIwbkB7z
         JXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683689107; x=1686281107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQzbd/JQW1YBPgsCg6/wWTO4tvMWJU9dD44HTJnPgi0=;
        b=MnyCm+ngNh8cLBxl88gl76yWKa2Ok3Gw6wulyLwE2oTVMGTNeka2itHI5ZamGICahi
         YddnD1owwwYFoAghr9Tx3ZTz55rcVECFt5lrfMz0VF6o4gL7DkiNw/ocRuyFLvJUhB68
         GC/X+7yrTiPXSfxUg+Jmc7W5IEPH3CYrZxHfWEr/bxjdP8Qx6VrTE3wtUZ4Jq+iC7q8X
         xgEMnf2JcyCmua/uZ0nIN4BhmoETUBK2AdoFMIV72WzI3WAQudF8x1wEt7Jv5blB8YoT
         4qwvifp+xPk4mtOdEhxDVb3vgks4oOQlbCvL/+AnuyBtqHUFD56DAMaJkYGBoquUzB9B
         uuhg==
X-Gm-Message-State: AC+VfDwCyhgBPOEh+0o+QXAlnHm2NhAsPS8ZgG9ZSnUXJL8hzhGzu3WA
	BwpSvvNKy9OUCMR724qvjgjwoGBD2dC5Bw==
X-Google-Smtp-Source: ACHHUZ6zIidG6ydbFVKO+3MkCb+y7pkrjB51LEoJZ2fRfdmk1ms9UUvbZMqastKbWeRC6K/5ajc2Lw==
X-Received: by 2002:a17:903:182:b0:1ac:8be5:8787 with SMTP id z2-20020a170903018200b001ac8be58787mr8390804plg.21.1683689106774;
        Tue, 09 May 2023 20:25:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id t24-20020a170902b21800b001a505f04a06sm2446100plr.190.2023.05.09.20.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 20:25:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/5] packagegroup-meta-oe: Add kpatch for glibc + x86_64 only
Date: Tue,  9 May 2023 20:25:00 -0700
Message-Id: <20230510032504.457574-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 03:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102522

Its not supported on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 4dcee089dc..92b15137ba 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -641,7 +641,8 @@ RDEPENDS:packagegroup-meta-oe-kernel ="\
     usbip-tools \
 "
 RDEPENDS:packagegroup-meta-oe-kernel:append:x86 = " intel-speed-select ipmiutil pm-graph turbostat"
-RDEPENDS:packagegroup-meta-oe-kernel:append:x86-64 = " intel-speed-select ipmiutil kpatch pm-graph turbostat bpftool"
+RDEPENDS:packagegroup-meta-oe-kernel:append:x86-64 = " intel-speed-select ipmiutil pm-graph turbostat bpftool"
+RDEPENDS:packagegroup-meta-oe-kernel:append:x86-64:libc-glibc = " kpatch"
 RDEPENDS:packagegroup-meta-oe-kernel:append:powerpc64 = " libpfm4"
 
 # Kernel-selftest does not build with 5.8 and its exluded from build too so until its fixed remove it
-- 
2.40.1


