Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00950C3601E
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 11:02:04 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.26569.1744541042337473869
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Apr 2025 03:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BxF/aEzf;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-223fd89d036so41083285ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 03:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744541041; x=1745145841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q2cv1V/ZcioTHBafwq5ourG5SUmEOZdiknAewLAPCIU=;
        b=BxF/aEzfVdh0jMIzPiIlVN9UYPLLRFLZhaEUibB/WbKB4kKrxYnBmCTG4nimw3Ckkr
         s5Wmcpe91mdFHhk0SuggmRPCAGgB6FgFTrp1/9x1iyBY2Rx21SkbP+FrPXBwsvMvNgU6
         RLxLZZ0lUxrB7XuZnxZWC4DAO2dqXnq76CBILxeluhwLxlMKgb2ATpHa8+UqadLQR5YE
         bKm6tstyiul6TSMfLNKuT5uZV4anZTloiCvyeFXH8rMSmQbFBubOrNJzICWBiBzDxVNI
         m6U8j/tpSks24MaMdvfGb1UDlygNtq09hz9cqRD3I+7VrnwWyKlGw+oHllJgSu9UuXHW
         XEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744541041; x=1745145841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q2cv1V/ZcioTHBafwq5ourG5SUmEOZdiknAewLAPCIU=;
        b=acjNcyByB3FhGw6YPYsjjl0zhbtIOzuV+oB4YK5weVdv8o7qVIru1nUcc7+3wrD2eV
         mOrCh0h/O+p9/bRzoSS+kPKuxA7D+ghC6JDELYhVfSFGlpWl9cxsq+YmiZVrD2iNJ9U/
         Pp1d4bkuwY+CVaFz2++DJwsqyxd22/8ncj4BxBvPVj8UHPGGMCHynz+zSXOxdBk5jN62
         MwLhpVhwL5sEg1cHTcFevamAhbEr1Am15xRCiz1zKes165nsiaDadf6D/4EgVQFlCzBR
         8nYsctTV623WBTK3lc0YU48w9SGvDaya8jvGJYLvR+rOHmqJO0+HtUsl88SogjrJRrbN
         oOfw==
X-Gm-Message-State: AOJu0Yw4jq8tWJzoUMSoftMHgOH+LJ99JWphm5ojzhPTTz6of2on1K8B
	Ji/SC8eUMKXPSk5NM5cfq/mQSdF3Ng2yZ7Y7RtbVEyE3iSjquli5s4Yy092t07I=
X-Gm-Gg: ASbGncvWet0H3JdsylZdQrt/P4jTbLdvzEqQ5HCQeCh+KljJ0ay/ZWP/GBQVZHKEagk
	GJWrl8gbnvMdFRm3gWT99B/aM20H9qr9HJyfxZ8/zb7FXRzyDbr+hi4xDux23DrLtirA1WAEcVZ
	bkon/mf3lktXq4nRcQUwNNzf6UItn/q06doUhXPq9XpJp/dYnnzmsWdcz/HG8iL+VfbLanMC4t9
	2X3/mPKvVbP6/aoZ8rHXuxVp58guqcy9x++ABZMOCk97EBfFQ5hf0g3IrcgUw2NkbAYEvIQbL/7
	K7G+JP0ke1Jm7+m0v7S5H/GCp292uOci9pk5SZGNExOevni2m4hO0VFTFlYhFwZLlSUe
X-Google-Smtp-Source: AGHT+IH+d2ly3dBTSKd8YguTaPCYgSd4SuTzLQJrDWaNTCHiQ/XyNpek3o0z+gliNLSNl2QDMOk+mg==
X-Received: by 2002:a17:902:f688:b0:215:b473:1dc9 with SMTP id d9443c01a7336-22bea502637mr113905335ad.46.1744541040582;
        Sun, 13 Apr 2025 03:44:00 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:90d4:ea0:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f0f8esm4905067b3a.103.2025.04.13.03.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 03:44:00 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] Propose a contribution: "simplelog-topic".
Date: Sun, 13 Apr 2025 17:43:50 +0700
Message-ID: <20250413104350.34628-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Apr 2025 11:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116829

---
 .../libsimplelog/libsimplelog_git.bb          | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb

diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
new file mode 100644
index 000000000..8c403ed88
--- /dev/null
+++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
@@ -0,0 +1,24 @@
+# Recipe created by recipetool
+# This is the basis of a recipe and may need further editing in order to be fully functional.
+# (Feel free to remove these comments when editing.)
+
+# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is
+# your responsibility to verify that the values are complete and correct.
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
+
+SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https"
+
+# Modify these as desired
+PV = "1.0+git"
+SRCREV = "ff30ba71807db1d7e1962dd014c2bb0a060572a3"
+#ff30ba71807db1d7e1962dd014c2bb0a060572a3
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
+EXTRA_OECMAKE += "-DUNIX_LINUX=1"
+
+
-- 
2.47.1


