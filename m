Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9958BCCD185
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 12:06:38 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.32324.1759752394498194549
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 05:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jTDE+R72;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6349e3578adso8679940a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 05:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759752393; x=1760357193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOd8X4hlWb+B6JSU8cMmw8AMqnopnWgR2K0eL9huOOs=;
        b=jTDE+R72UF4E/aAtMsuSUJcPXF9yvVY1q1ZTwbcroWcDRAb74OG0iTEAsOjF4D/T5F
         BWfGvt3mPG2hkL1jlgVhpVy4Bbuz3nXAehTWRQ/TjXfA5iXd39nfX5Wi8fHAk791M8YL
         HB3kmutzTk2yr2ppAe4TBsfDwRB0/4LW2wnb/SOFiBOg9hlgfFVvLVcdeOTQT4MWrOrn
         GxhAlLbbWvKSANZk6CQ9EfegV5LGd7oQuC5GSrw3RiU40SYoE53HE5hHZ7qEdA6JZ2YF
         B8nkN4rDXR3F558yKkQANIfP5aEZKlpoRSmeWTjiTBJR1YakTHJcpC/j/ZmWbypuEryb
         H+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759752393; x=1760357193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOd8X4hlWb+B6JSU8cMmw8AMqnopnWgR2K0eL9huOOs=;
        b=EVKoq/VCT2RPYonIwP48OC/nYdemLdhY7ensz/iDwzYpvUHG4UUN4CikyB0D38+7QY
         1j6hyuUEAsUd67KezYNWc1hNVsR2E0thxxGHXcWOOsCeo4cDVD9ne2VjQ0Ccx20oRwhS
         gSXn3Blw+Xgseo15DbkyU0a2qfRUpdc4nT7MS81ZzKVDXpedL2TPuNKmqduYjiRQP7hJ
         OBrN28uvWKV1p0q5QMleQRj2kpz+W1RC5uSsEIVa04Tn8MFrd0akUh33O/eBBzrjl5pv
         l0nXy8wILAe5LYD2o/c0ObvXZK+5xJ3iqh1pgMBcOarYhkAtcVRAP717JbHppQbUJ9WT
         oGkg==
X-Gm-Message-State: AOJu0YxV17QswbUu6XBIgWA6ZzIrgqtw6jxmSTQgCHysQG9LIXQAAXg6
	xSCK//RcS+jUBlfqOKLQdRnesCaYGp97jtNwJhaclgLdzGhi2Zsv/A4ys7TEBA==
X-Gm-Gg: ASbGncvJE7gOF4xafa+D6leZxESzmPGHZXHW2mylAG8vr3dDfNhVWMUHVWF2V8cTUQm
	FOpCi8K7nfrgA9GxBdBLqXu1vJjMUgEW8RLZil/+iVOvkDGr2cuw2A8EC/+KaLxxY1JbWc62ceU
	bahjWmQ+R+7V6f980W2O45JfnqJqQr2C11B9MSGdJKJMV83YI5CEaUaJyOdN2dLmlW+TQZb3c6u
	7pZ0jifxrAvSjgTLHwM3y+eptl3VHsX/wi2uiAvuuWfKVrleFT0wL10h223zghBtO2e21MHpKCx
	jZzPb96uRRscgfcnHJFLI/GxQnO6AgkEl6vIRG8hjB01MoSUPo7FB42rFZ1CR3dTyM3a78R0e/1
	KWwMvUhSM238a3RZf+Fg7yr20uRrJyX/HZC2701k++Y7i
X-Google-Smtp-Source: AGHT+IG/J719ikr3tzdMJEHRgl++ORRc3MNZEZY4zEC9O9lwm0xVoC+4K6AzKTsFDhlGyEXZ2UqCkg==
X-Received: by 2002:a05:6402:278c:b0:62f:a3ae:ff0d with SMTP id 4fb4d7f45d1cf-639349005f8mr13931552a12.14.1759752392323;
        Mon, 06 Oct 2025 05:06:32 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788110219sm9949748a12.37.2025.10.06.05.06.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 05:06:31 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][walnascar 2/5] emacs: patch CVE-2024-30203
Date: Mon,  6 Oct 2025 14:06:27 +0200
Message-ID: <20251006120630.414259-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006120630.414259-1-skandigraun@gmail.com>
References: <20251006120630.414259-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 12:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120279

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-30203

Pick the patch mentioned in the description.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_29.1.bb   |  1 +
 ...w.el-mm-display-inline-fontify-Mark-.patch | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index 3701e17025..c5318db96e 100644
--- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
@@ -10,6 +10,7 @@ SRC_URI:append:class-target = " \
     file://use-emacs-native-tools-for-cross-compiling.patch \
     file://avoid-running-host-binaries-for-sanity.patch \
     file://0001-org-macro-set-templates-Prevent-code-evaluation.patch \
+    file://0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch \
 "
 
 SRC_URI[sha256sum] = "d2f881a5cc231e2f5a03e86f4584b0438f83edd7598a09d24a21bd8d003e2e01"
diff --git a/meta-oe/recipes-support/emacs/files/0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch b/meta-oe/recipes-support/emacs/files/0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch
new file mode 100644
index 0000000000..d951bf4205
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/files/0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch
@@ -0,0 +1,27 @@
+From 0e7fe7809daa123921faa0bd088931cf8ddfd705 Mon Sep 17 00:00:00 2001
+From: Ihor Radchenko <yantar92@posteo.net>
+Date: Tue, 20 Feb 2024 12:44:30 +0300
+Subject: [PATCH] * lisp/gnus/mm-view.el (mm-display-inline-fontify): Mark
+ contents untrusted.
+
+CVE: CVE-2024-30203
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/emacs.git/commit/?h=emacs-29&id=937b9042ad7426acdcca33e3d931d8f495bdd804]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ lisp/gnus/mm-view.el | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lisp/gnus/mm-view.el b/lisp/gnus/mm-view.el
+index 2c40735..e24f3f3 100644
+--- a/lisp/gnus/mm-view.el
++++ b/lisp/gnus/mm-view.el
+@@ -504,6 +504,7 @@ If MODE is not set, try to find mode automatically."
+ 	  (setq coding-system (mm-find-buffer-file-coding-system)))
+ 	(setq text (buffer-string))))
+     (with-temp-buffer
++      (setq untrusted-content t)
+       (insert (cond ((eq charset 'gnus-decoded)
+ 		     (with-current-buffer (mm-handle-buffer handle)
+ 		       (buffer-string)))

