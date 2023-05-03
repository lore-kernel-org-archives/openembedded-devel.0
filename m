Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38DA9C77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 20:08:32 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.31224.1683144508485175876
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 May 2023 13:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=RXEzITUz;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f1950f5628so55171375e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 13:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683144507; x=1685736507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jFnMjdKHZrQ3dzidaWecklZb5uZ2WxXnRul0G3BsTfQ=;
        b=RXEzITUz6UkNB+CgP6MDY4GMtYxlvX8WMRoB8xUSg5r5pX8S4/H+n/NBgje+/f1fGt
         AisBPeSs9C2dgqiJs7s3lXMcN1YQnLoSBu68go8rj7bsvUKYs0j8Jabt/h+TL/JGesS9
         HcCxF8LlgOIU/LsAcdjRlv/JuZTW6BcuIaZm9cA2oy5UocmlQwtu4ZUubSe7zBVQE5fS
         vu4l5dhhyFFcNI4BddghEu/26HBZKVQbonmafehEiqhfgvIQPVMQ/csC6wKJFnMTMSMb
         h+isaJmv0M6MKd5gDjgOGRvCmQad6f4RXWCY9WAcbpNWcqJ+xtqRbJ+lqn7uvZ+/33if
         hkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683144507; x=1685736507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jFnMjdKHZrQ3dzidaWecklZb5uZ2WxXnRul0G3BsTfQ=;
        b=bfC3fmNdyulfHr//r9IIwuceHX1Eb/P6Ka9J2nwNjkkL0uR/AO7mDJ4aemk9rPwj1D
         rmPqTIXM5yWA50niJ/hTWzFQ61sYlsVTTzOk7GgUe7Bx4mvoLUJKhuH81Kv5UOwc97Zn
         ot+hhN3RPT4Tt08FU90MFgIhv8PqEjQPSZK7FemXy2q56+2ntKwaf7YKPN09GQgEDJ8P
         iOvUlrNW/0RG8rSE5fW7ibA8kUP7uhJQOB3KAZjNSnEKsNVPOCv9H4VPsLFz5zLbHyyX
         Am7qC4ownI/l8SFNlcB0dJ2rFHqdqju9mXpWF9yMEy5uiC+teSKW74KUIezqCKYgIAr+
         YauQ==
X-Gm-Message-State: AC+VfDxXbCHhMO17DRO3Kl+81rpuXvFtfNit+akvEsDVlw3bCQCYeaFu
	g6mQHGr7MIiGkzzPSXi5CUMvr5aKuuk=
X-Google-Smtp-Source: ACHHUZ5NEB063+Cn7354NMmkENjTNq6WkowWfNnSlB4xGrQAVUYlG6MMrDyK2dPZ8/WnMPBvI+ACNA==
X-Received: by 2002:a1c:7917:0:b0:3f1:6942:e024 with SMTP id l23-20020a1c7917000000b003f16942e024mr16476652wme.27.1683144506845;
        Wed, 03 May 2023 13:08:26 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id d19-20020a1c7313000000b003f17b91c3adsm2796430wmb.28.2023.05.03.13.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 13:08:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] cpulimit: fix do_install with multilib
Date: Wed,  3 May 2023 22:08:20 +0200
Message-Id: <20230503200820.1892496-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 20:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102298

* fixes:
  DEBUG: Executing shell function do_install
  install: cannot stat 'TOPDIR/.../lib32-cpulimit/0.2-r0/git/src/lib32-cpulimit': No such file or directory
  WARNING: exit code 1 from a shell command.

* drop strange 'g...@' from SRC_URI

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
index 86a58beda4..58e4fd6e88 100644
--- a/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
+++ b/meta-oe/recipes-support/cpulimit/cpulimit_0.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86c1c0d961a437e529db93aa3bb32dc4"
 SRCREV ?= "f4d2682804931e7aea02a869137344bb5452a3cd"
 
-SRC_URI = "git://g...@github.com/opsengine/cpulimit.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/opsengine/cpulimit.git;protocol=https;branch=master \
            file://0001-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch \
            "
 
@@ -15,7 +15,7 @@ do_compile() {
 }
 do_install() {
     install -d ${D}${sbindir}
-    install -m 0755 ${B}/src/${PN} ${D}${sbindir}/
+    install -m 0755 ${B}/src/${BPN} ${D}${sbindir}/
 }
 
 CFLAGS += "-D_GNU_SOURCE ${LDFLAGS}"
-- 
2.40.1


