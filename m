Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53898C433EF
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:49:30 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.16867.1652622568455582669
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I7SwnMYN;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id l11so11755885pgt.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xLvbVjb9oOhmisISdU8m2htg30NPZYdKZK6pTzbcv1c=;
        b=I7SwnMYNjW5lhxePb5pBrlqXR6w9CFxC4GpvIaHp1O+Ci/yVjsZ2DlUj5z6G414h8b
         KmiHt9MoPj4IW4PcTm+j+NHME5TC+mZmACrjdGL1XVxeA+62X6P7kjNCrVGJU0QF2c4q
         bMoYD7TADBJ99PYl5A4v+Yk+IGUgf7fu922jj48a06ChjJRuyCTFq6S0EfaYk2y/0LkF
         yMszXqtZhugEl+eU2D8CIOZWN9bvGcErocH55iWzQe00jkRAPsz+bRK7BgHrYbAm7iCj
         7xR0QqIwuvckyF+jATYWtE/xat2Dz8DCy3Iar8BmaLRYqTVOLkLPGmsJphzSgUm13egB
         gMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xLvbVjb9oOhmisISdU8m2htg30NPZYdKZK6pTzbcv1c=;
        b=5qMHQTFBEqwrSToyO6ityVGCThzWZIca6VUKgNiAL4pOdDf0EoEhL4WWp83pVd7Rxg
         zFeO4gHFu4bhM8s2vbN1fFeRWH0HFIxFB/D78hULnT8EV3DqtZXbr/kpz9wlTvBa2rmp
         kz9gt6i17RtpGFfFI6v50qck8q/SzCo49L4COLaCd2TqJvG1a6WRqR/3ZyiUJCbaGi0/
         fIblGu8dMF49FkIQAsxqNIgGKQybjZN1RB40Oflt7L+ofXw14aYDvT0goo6OAuDolE5t
         e8OnuTcIrqQTqTBKhxLJiF+IcOhnPlNmcebuq01GYdOUj8WRuwkqoWwp5/bDI/vxyN7o
         EIpw==
X-Gm-Message-State: AOAM530+bP5Ep6cPtc+PEcVOf3a060TQNnkntkGVCOHzxaxIK6+Sl4vg
	0+cLZk2tVHpyM0kacBKy8K05JfLtaI0G9Q==
X-Google-Smtp-Source: 
 ABdhPJwssE7draxR36WapaxCMabWbbllGc3V2YNH9YVdQ3Accffd6m9YSmUXYoA2Nfbvml04NDkXqw==
X-Received: by 2002:a63:9043:0:b0:3c6:3550:6467 with SMTP id
 a64-20020a639043000000b003c635506467mr11696777pge.521.1652622567674;
        Sun, 15 May 2022 06:49:27 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 01/22] meta-oe-image: fix build depends
Date: Sun, 15 May 2022 06:49:01 -0700
Message-Id: 
 <93f6bcc7945363986a4dc3bd26296ed925811aea.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:49:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97098

add only when various DISTRO_FEATURES are enabled

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 73d50d2b4b61b44266e03722db295d0da7866d2d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-oe.bb    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index bc3d4fefeb..765edc5c5f 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -96,7 +96,7 @@ RDEPENDS:packagegroup-meta-oe-bsp ="\
     acpitool \
     cpufrequtils \
     edac-utils \
-    firmwared \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "firmwared", "", d)} \
     flashrom \
     fwupd \
     fwupd-efi \
@@ -611,12 +611,12 @@ RDEPENDS:packagegroup-meta-oe-graphics ="\
     surf \
     tesseract-lang \
     tesseract \
-    tigervnc \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "tigervnc", "", d)} \
     tslib \
     unclutter-xfixes \
     libvdpau \
     xcursorgen \
-    xscreensaver \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xscreensaver", "", d)} \
     yad \
     parallel-deqp-runner \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
@@ -729,7 +729,7 @@ RDEPENDS:packagegroup-meta-oe-support ="\
     anthy \
     atop \
     ace-cloud-editor \
-    driverctl \
+    ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "driverctl", "", d)} \
     frame \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geis", "", d)} \
     grail \
-- 
2.25.1


