Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE80FD45F2
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 20:40:35 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55365.1772052031570355805
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 12:40:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bZTydMHM;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48374014a77so1632235e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 12:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772052030; x=1772656830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8E9/kVcY9Y46TPXTbkKyhy1EE/ZVhkcmsMj1pu6DHbU=;
        b=bZTydMHMqgAPZn24EELvuzyGJdzskRUp07jEYX3aMGMEkr/b0ZlzHRkDrfCwlMk//D
         xlmdxdniWjAUaBh4nI7mCAQ0R5mTmv4AbLS7Tr42V+rF0tA+TtbJ0VYp6b3KCHS2V6XE
         Z2MbkPR6+yiyrvRLLFL9fckagBp5T17G6CPlzeq2Du6caoKOQ/nJ09dJ3v0gVieXej+x
         amCg5/KcH68yGjF3tbp+rBoYrh+bXCyGnrYHwiVpqF/PT2Pr/F2uoaMo2ZGClg5pVDd9
         0HKYIwVutbGfYztLM9dSmBz9QBA9q8MqwtJdcE8uCDmapPIxeQrpXAlkicQA+DbNdElK
         +2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772052030; x=1772656830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8E9/kVcY9Y46TPXTbkKyhy1EE/ZVhkcmsMj1pu6DHbU=;
        b=I0e45vtDstw/j4lUbsnvRkD2SSy4U68y/KEoRpDXyYxIMPff8XdFrvtWFdGdHkGbUL
         dYVVtd3xFQozDOvQnr6vbQXUqBBlLnk0cC5d1dGvkR6ePd2U5rYP5CVex4NjWRVSmAF6
         xiZzLgk81VivpIc89v3wIVkGQVYrxrnoV9FgilxozsAFgIELoiVwqwPjZKW+vjplKMsC
         6fl6GAWMbrwc2gCOsOwWxJNA7JIr3O8br2jw1ynL9iCSGLWXtwo6AYX37oNADRdkk6aD
         L+WX8wUyiiPcb4VPUifdK4DYBy8Ch4RXmAmYRkgmT8TkJ66V7okBKsKaWNKeLkMOLT8s
         grig==
X-Gm-Message-State: AOJu0YyqsUKGCGCvCfyqSGQ2HO31PAjNPkxa4HcLS1paV5LHCf1ZjE2p
	ljiOQJxiHBOCNYl0qjv2UMLQdGH6UEWYWYTSSwC3Huksg9t0L51oGQTiCIgV4g==
X-Gm-Gg: ATEYQzzm7Tky6tIvn8ioXuC+NTi4auNEsmhwbd0fJ5983fDCrYpp0ECNfupFSvbCpmC
	ZHnjgG61HJwdmW1EZji+zOk2M1MscwPP+HiW60pNLGKW5nkuvNmGs5ICKhO34D729xUvhgweO95
	VQsYyWLGhyLsMcMukWQzS5KDAvorGl+BugriLf4rXpEMAS8UVDcli63U/2uo6DnKa/TY3QU9z3Y
	1xLFyGg8xCOj6w32dYWXRH9e8S93tz52t457bqvNC9eMolxN2051cynqGOKAxLi0ad/ZkI2KLyJ
	juKOR63xYb1HiYpQAtauTM7hRlXsu33l7c7SXxLX8oSwwpnwMdE/PVgAJ+fcxBqYO4w8X8+GoqF
	Mlns2BGlrtTZ9snJukOQ/jRDMFWEr4l/28GFpbI0Bi1iKnizXqCDSrmPg19BzYn6xG33+Z891gR
	kFO5nG7KLBj9aPuV5d0sj+
X-Received: by 2002:a05:600c:37cc:b0:47e:e20e:bbbe with SMTP id 5b1f17b1804b1-483a95e9b65mr285781465e9.25.1772052029663;
        Wed, 25 Feb 2026 12:40:29 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd68826asm146260505e9.0.2026.02.25.12.40.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 12:40:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH] ifuse: upgrade 1.1.4 -> 1.2.0
Date: Wed, 25 Feb 2026 21:40:28 +0100
Message-ID: <20260225204028.745881-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 20:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124662

Changes:
 - Switch to libfuse 3
 - Require libimobiledevice 1.4.0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../ifuse/{ifuse_1.1.4.bb => ifuse_1.2.0.bb}               | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-filesystems/recipes-filesystems/ifuse/{ifuse_1.1.4.bb => ifuse_1.2.0.bb} (66%)

diff --git a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.4.bb b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.0.bb
similarity index 66%
rename from meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.4.bb
rename to meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.0.bb
index 5fbeab53d8..daeb5b9be2 100644
--- a/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.1.4.bb
+++ b/meta-filesystems/recipes-filesystems/ifuse/ifuse_1.2.0.bb
@@ -3,11 +3,12 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ab17b41640564434dda85c06b7124f7"
 HOMEPAGE = "http://www.libimobiledevice.org/"
 
-DEPENDS = "fuse libimobiledevice"
+DEPENDS = "fuse3 libimobiledevice"
 
 SRC_URI = "https://github.com/libimobiledevice/ifuse/releases/download/${PV}/ifuse-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "cd31fbd0ea945b2ff1e39eac8d198fdd"
-SRC_URI[sha256sum] = "3550702ef94b2f5f16c7db91c6b3282b2aed1340665834a03e47458e09d98d87"
+SRC_URI[sha256sum] = "5c584ae999ed52b386b0d2d1af8f8dcba451cddf31d7cd24367b18db0a9a5a9e"
 
 inherit autotools pkgconfig
+
+EXTRA_OECONF = "PACKAGE_VERSION=${PV}"

