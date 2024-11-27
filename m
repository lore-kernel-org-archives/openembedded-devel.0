Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8036BD66BA5
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 00:56:16 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.62040.1732668968486087430
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Nov 2024 16:56:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IPy9MLwM;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e3873c7c9b4so7169359276.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 16:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732668967; x=1733273767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/L9525Fb7rEbqxzMA58ewcnjFRSkPKmy/50YeX6hmV0=;
        b=IPy9MLwMi3KKEiHhCAqjpNDOvEgyCJ+P39SNkhsCvzCxgCTWk4XkAcTkIUc+2PmDOF
         va8n/Yq9dq1d7QV+ALq9ojngEOpGw5VmFR6aLlpoVv67/nklBgJlQpKQGnblUNB9g62+
         M+Q4nvJAw0mNlVO9U9k7jU1dMrQ2yEY81qqPHADRnZXS8+XunsYITpkI+0gds0VNPdcb
         PV/7tVa6gSbgQtO2eLHcYAUnwdc3wkBs2eCINkYd91Wnxa/NJx80JHe/Pvrrhxg0STae
         GuUFGHnXGmD9TWZpLMJh0rM+9drm1hLvJiPD99RqoHgFj4OBYEF7COjGpWxZjB3faMqC
         S0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732668967; x=1733273767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/L9525Fb7rEbqxzMA58ewcnjFRSkPKmy/50YeX6hmV0=;
        b=UG+urvXLno0T2KwJiU09Zwt+AJJ3Zfsu+YeXVAr4s3eLr9ZLqqbShEhqSdg1flsXRo
         CnQZQDuZ09MFSslElJ6iUOUlq4bGA13s4CICcP724+qT/+IfBALwO+Vege/ELk1q2lmv
         FyFwsoE9xZlROPFQAQ8v6Ft6js1CWzXnx7t1gwzM8p1jyB30Byl9BaFKgtGYk703qZJd
         J7YTDkbx0j7t6oHdGeqYrucYdPqH31gPwBdlnZnMOgvCQ7kZPWID1mtvRBAU3jVEXnPC
         Uxai6m0MVd2LkEFARmQ8kpVoWx9qgcCLkPCommsdjwc1C9sBHD1zN2isoRy+wRH7qcvH
         GpZA==
X-Gm-Message-State: AOJu0YwpZfXGL9V1YO08Bwn72ngYekGcQViQCbfhuv+JRmrSzZ1LDlxJ
	rpn3+eS7u/9SDUBJTmP4R5aIGp78VxCwWZ9tBYBmmiF0RzxOECRQBf2pl4QQ
X-Gm-Gg: ASbGnctDjsm1ptBwH0bft0Tzw/UifjSbvYesaeNTMB3EFXoCTg4IGhWyq9GtHsc4G/r
	tGTbv55PxdFowabzM7rJiTrLSlaNuqOFI5kfpxrR9fvC5C5Spe9ronC/Ol6KWajOPL6psphqf/r
	bNnl34e30nxUmikJigGpY4q64IC0L31YJpMGSq+I7FSrO2HlT+/8PG/XiT1UGA7a60ejmk3O/1d
	b6yZzNTdaBRSIyjSEBPm1jdwnsvfegG1xmifgVsXG1cWCrdvsx5JjGy
X-Google-Smtp-Source: AGHT+IF4xwzJXZqYNwl2VgEgxvpr+y5kxey7N/a4NgnluQlx50gblKzXQIp49yNLRSZux+/SflKHYQ==
X-Received: by 2002:a05:6902:c13:b0:e33:67d8:654e with SMTP id 3f1490d57ef6-e395b9548f7mr1179441276.49.1732668966959;
        Tue, 26 Nov 2024 16:56:06 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e39585e3d9asm332134276.59.2024.11.26.16.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 16:56:06 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-settings: Document the need for compiler flags.
Date: Tue, 26 Nov 2024 19:55:45 -0500
Message-ID: <20241127005545.86128-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 00:56:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114080

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../xfce4-settings/xfce4-settings_4.18.3.bb       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb
index f9620d85d..bc34c4cee 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.18.3.bb
@@ -11,7 +11,22 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI += "file://0001-xsettings.xml-Set-default-themes.patch"
 SRC_URI[sha256sum] = "2db9e99be503280739a08779503bdf11db8b9db9851c3a981deb449002f3f1a1"
 
+#| ../../../xfce4-settings-4.18.3/dialogs/keyboard-settings/command-dialog.c:113:3: warning: 'xfce_titled_dialog_create_action_area' is deprecated [-Wdeprecated-declarations]
+#|   113 |   xfce_titled_dialog_create_action_area (XFCE_TITLED_DIALOG (dialog));
+#|       |   ^
+#| /home/jason/yocto/poky/build/tmp/work/cortexa76-poky-linux/xfce4-settings/4.18.3/recipe-sysroot/usr/include/xfce4/libxfce4ui-2/libxfce4ui/xfce-titled-dialog.h:90:73: note: 'xfce_titled_dialog_create_action_area' has been explicitly marked deprecated here
+#|    90 | xfce_titled_dialog_create_action_area (XfceTitledDialog *titled_dialog) G_GNUC_DEPRECATED;
+#|       |                                                                         ^
+#| /home/jason/yocto/poky/build/tmp/work/cortexa76-poky-linux/xfce4-settings/4.18.3/recipe-sysroot/usr/include/glib-2.0/glib/gmacros.h:709:42: note: expanded from macro 'G_GNUC_DEPRECATED'
+#|   709 | #define G_GNUC_DEPRECATED __attribute__((__deprecated__))
+#|       |                                          ^
+#| 1 warning generated.
+#| ../../../xfce4-settings-4.18.3/dialogs/keyboard-settings/xfce-keyboard-settings.c:806:18: error: call to undeclared function 'xfce_shortcut_conflict_dialog'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+#|   806 |       response = xfce_shortcut_conflict_dialog (GTK_WINDOW (dialog),
+#|       |                  ^
+#| 1 error generated.
 CFLAGS += " -Wno-deprecated-declarations -Wno-implicit-function-declaration"
+
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
 PACKAGECONFIG ??= " \
-- 
2.43.0


