Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2C3CE7A8B
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 14:40:53 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.40957.1695566444917637400
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Sep 2023 07:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a6vFoU1l;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-59f7f46b326so1041007b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 07:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695566444; x=1696171244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aCNZclvP0XuOH3Xf75vA1sJDdYOGkcm/QfGR9rdHp8=;
        b=a6vFoU1lLI0JaNJGMAdPm6OcZCD5p4Fzee+dzRF/CqVnk2fH2Eg7qxywoKfJ2xJ1JS
         5ZOrWhsPAr7mSiNkSGTxuMc2m9s2WsgnV2IkV5Yv4A2Lzu6xm0sXXsWh3xPn73fYzXt+
         BKt5xqMDPmtIcLqFgI1bSy1oyzw7KejWtSRTmcI1LgGv1VYfcQAFt2MZ4a7Ay6Eyhbxz
         XyBb+D1X4mw0jNFV+5yijy/8zXODnHre5wF6OakhsJpNyrEhsi9KqB8cBDEWw5GbNF+j
         1FXup2HH37FMSfPg+AlV+gzL5HQqNy5dmFXgBsQjDxYIvP05UMuzrvlzLoimexM72Oyw
         t7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695566444; x=1696171244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aCNZclvP0XuOH3Xf75vA1sJDdYOGkcm/QfGR9rdHp8=;
        b=W6WEKjRXZNxfBRnUppamp0cnhZY0hB9LoV5BjmmVZkWXE5YiBLj3faXp7zS4BhflqL
         klX9bfLmubjZ96Q8VQRUY1QRKuUCKZhu8NMPkgfGMpqDrURyeYKjr3nx8qzL+EMhkqh2
         LG2f10CDBUDhzMK6IlGG/154QDbPDGBj0Gwl0UmD3vbYsEPJK5NU0pmTy6xXlTia6PNI
         LdSl0ui6tqObZnsmrwrJoGUCSi1V3ovLdZofkgJnIaihB8xd8ZAsCVpn/YzuvOu5f5LX
         Kpk5wAVDTpBv3+Bb8cm4FQH7HfDBHfPlEP/mDqtDYxwi8v8XXTDpVNxUVKYsf2njFA44
         RchQ==
X-Gm-Message-State: AOJu0YzzNJPHna5LULtPbxLFHiqMfkB0gmjXb6byZi+ipKz8WxjyJiFQ
	bqDgFj6K+Sip0ZZGxyJpPdElgynCGqc=
X-Google-Smtp-Source: AGHT+IGYDM7wAKMmZthlJMka9rE7kzLnLmc2bL0VjG4uK3BIi/M8Lo7PAVFIrIXUYDiB0GKI0lWxFg==
X-Received: by 2002:a81:a090:0:b0:58c:53ad:ee3f with SMTP id x138-20020a81a090000000b0058c53adee3fmr3975136ywg.34.1695566443918;
        Sun, 24 Sep 2023 07:40:43 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10::29])
        by smtp.gmail.com with ESMTPSA id r76-20020a0de84f000000b0059beb468cb4sm1929350ywe.1.2023.09.24.07.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 07:40:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Lee Chee Yang <chee.yang.lee@intel.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 2/2] x11vnc: Fix CVE-2020-29074
Date: Sun, 24 Sep 2023 10:40:42 -0400
Message-Id: <20230924144042.983178-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230924144042.983178-1-akuster808@gmail.com>
References: <20230924144042.983178-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 24 Sep 2023 14:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105108

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dbdea59838054f9c908533d486cf3c0c2897c791)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../x11vnc/files/CVE-2020-29074.patch         | 27 +++++++++++++++++++
 .../recipes-graphics/x11vnc/x11vnc_0.9.16.bb  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch

diff --git a/meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch b/meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch
new file mode 100644
index 0000000000..fbdb9123cc
--- /dev/null
+++ b/meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch
@@ -0,0 +1,27 @@
+CVE: CVE-2020-29074
+Upstream-Status: Backport [https://github.com/LibVNC/x11vnc/commit/69eeb9f7baa14ca03b16c9de821f9876def7a36a ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+
+From 69eeb9f7baa14ca03b16c9de821f9876def7a36a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Gu=C3=A9nal=20DAVALAN?= <guenal.davalan@uca.fr>
+Date: Wed, 18 Nov 2020 08:40:45 +0100
+Subject: [PATCH] scan: limit access to shared memory segments to current user
+
+---
+ src/scan.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/scan.c b/src/scan.c
+index 43e00d20..12994d52 100644
+--- a/src/scan.c
++++ b/src/scan.c
+@@ -320,7 +320,7 @@ static int shm_create(XShmSegmentInfo *shm, XImage **ximg_ptr, int w, int h,
+ 
+ #if HAVE_XSHM
+ 	shm->shmid = shmget(IPC_PRIVATE,
+-	    xim->bytes_per_line * xim->height, IPC_CREAT | 0777);
++	    xim->bytes_per_line * xim->height, IPC_CREAT | 0600);
+ 
+ 	if (shm->shmid == -1) {
+ 		rfbErr("shmget(%s) failed.\n", name);
diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
index 5f7c0beb66..be9ef3cbaa 100644
--- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
+++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
@@ -12,6 +12,7 @@ PV .= "+git${SRCPV}"
 
 SRC_URI = "git://github.com/LibVNC/x11vnc;branch=master;protocol=https \
            file://starting-fix.patch \
+           file://CVE-2020-29074.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.34.1


