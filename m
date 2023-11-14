Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA83C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 11:16:20 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.10454.1699960576865076885
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 03:16:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=BRB/15YB;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4083f61322fso42811355e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 03:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1699960575; x=1700565375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VWTHmpLbsnclEDoP368aIv4RKPFOTc2iTDaThlARPGo=;
        b=BRB/15YBddU0M4lloLXArpsrpZRLS8NkCnorKWSuKPhSjNMWFZB7J6DwTqIU34XXB+
         jSzVkt3L7dCLJthL+9OtfIWk5EJvRPzIg0rhgiD0IF11fL99qG5YVpfk/tPKo6uklNIu
         HbxDn/HlzFAOhQ9aN1ZlIg3tdhblwUvBLmeJVbnWUnZkGqLZ6+XWi6rkNCD4Bal3wn65
         h5MfEWXLRY4F/coo0ZckDn4rbQEIXUJ+n/GCL0sTP1qBdo+3J8T2SscgRdVDopEjl4gO
         mqZSi32ZJl9kjucqH0Z8c6wFhTOLQOI0BQ53Pr1ZruQ4rFFGBtI3k97YUWusDVSAVRn6
         fI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699960575; x=1700565375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWTHmpLbsnclEDoP368aIv4RKPFOTc2iTDaThlARPGo=;
        b=Q9jxT7xGyFjWTSo6EkoTs57W5GOsxWJn16+iWOu9GP7lMa7alK+g2IEnnaBYohnYAq
         R1idrvrkLC1TdRMFCujK8M9LH/c1ETJfpqu+R9WrCLAsm66iSv5Q1Gcdv6ldbtAgnULm
         Q5k3aBVO65i64/yHVaFV80ju2E3sfRQGcKzyp2LKBtn8zCDXIX8AEtoHz8/UDgXKrJfq
         MXmSd1rOZ4R/o8Quq+6FQCbe9qtRHWQ2txgIf/dmiRvejfR4waQO8o+LD2lRSzvNDnS4
         VSt8PH57MiYdNzUn+PV0H4cI0kA75s7DEM6QyuWZe8zUUOdmkzJICkmYW+wzwJUJ+ZYB
         6GvQ==
X-Gm-Message-State: AOJu0Yy8mMErgqFHe1NwhuR82Dz3/C6dIxf94eGLp5UE8gCZOdrrpaKt
	FFroQ8zg3hfaOneOqllozBpjAYQ+cCVPVgxF1pQ=
X-Google-Smtp-Source: AGHT+IGYBkrFF8SvW14uF++gesTxUFWtypq5leaYTNFZ1FbTvT0r026F8H/Bn1XkzQz7LaOQjtvn0g==
X-Received: by 2002:adf:e78d:0:b0:32f:b1ea:db78 with SMTP id n13-20020adfe78d000000b0032fb1eadb78mr7076579wrm.59.1699960574957;
        Tue, 14 Nov 2023 03:16:14 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id w10-20020a5d4b4a000000b003313426f136sm7474714wrs.39.2023.11.14.03.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 03:16:14 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][dunfell][PATCH] libusbmuxd: Add PV
Date: Tue, 14 Nov 2023 12:16:05 +0100
Message-Id: <20231114111605.3284710-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 11:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106708

This is 1.0.10 release with few more commits on top.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
index e9c58bf58..590105784 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libusbmuxd_git.bb
@@ -7,6 +7,7 @@ DEPENDS = "udev libusb1 libplist"
 inherit autotools pkgconfig gitpkgv
 
 PKGV = "${GITPKGVTAG}"
+PV = "1.0.10+git${SRCPV}"
 
 SRCREV = "78df9be5fc8222ed53846cb553de9b5d24c85c6c"
 SRC_URI = "git://github.com/libimobiledevice/libusbmuxd;protocol=https;branch=master"
-- 
2.30.2


