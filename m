Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B497CCCD1AB
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 17:37:19 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.712.1760895436537911080
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 10:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S5TZW30l;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b463f986f80so716982466b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 10:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760895435; x=1761500235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ugs74biWZY1Xs4z+kn1cxfoaJ8uCjPc4IfZMw/T6Mjs=;
        b=S5TZW30l0+rtwxWr2HBD8j82GBywJaHb61ZHpVuFMBF3+AX0spsVyzDgDakenkdbPq
         3mLNMOw50w05juqPatYCqI1qlbafXGQ62gVutACH2xfFJbbNQ2cmgPsek5TPjBXVOUkI
         VEnxuaqhYPwxjXEwe5qQfswM4J0RioXdy8oVHjUnkD6YsyojFw662tLMCu9hUOTbuyGc
         8nox4Ts7yQByKrqEd4f6rgX6CG3U0meSIjMfev7FrGfGkras14Q5/OPxmicwYvWBytav
         aEo1OoE4SYzAIQtr6BzpOwOiByhlovwHRK5pG9F7yehb7FTpwqpv5zhGcflB6TLlqRIf
         Dksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760895435; x=1761500235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ugs74biWZY1Xs4z+kn1cxfoaJ8uCjPc4IfZMw/T6Mjs=;
        b=G/tYRCqzE0QlOPJXFc7R9nAklogynq/jciKw9CcCfwtYu6NUMYLwG2zRJ4sOt8g12Q
         qH0eAkpPa5vKzbhwAGEmcH15yZ/FDiGTaUmAUMURWbMea6tw18CCYpivuabzsS+FX/So
         f+G5M9uhkdI/ChUNjxFi5vqFXBk/5LQ7IrGI34TKifoSuy+DYaKTSKGttcGzhT37VfXF
         sNJZtXHA5esfDK9URDpNrd3xTlt7R6RyewnoE1MXvAkBACDA8DInMe/Kw0dSpXCEaH2J
         YQGPuDXh3huGUs1t/9bF8l3yb+HC2rJldPiovhyEeJ6EseXwl1yQ8S3aPxWbNOV2aPPH
         ToxQ==
X-Gm-Message-State: AOJu0YyWcjdZMGUhvVKVSJD/GXj/qJLn61mql2X+SlrLxZs4PJMaReQM
	/oI/PCxaYjsQPvt80agKT5ZR6Fb2Y55Brl31bwrHZa5QmkGsJWvjnGz2x/s8kg==
X-Gm-Gg: ASbGncuy8dmGsQthYP8wgL+zY1RyMJd5hs+zWvGVNUkyNSvTQ0sb8bPimdAkOS0v6On
	igFRcHmWxJt0bXtIJpHyFQBG991GpTlKBd6H8fENAIBmF91AjArfo/jb6v9Eunmcj6FeFRqOtCo
	H1CC6mo5BG91iysV4zc3kTwVlVwJVrWT4wM7zRsgoexkcJZj09tbCF9nwfoh6kCLuKEy7RbL+CT
	bR6qqEEPChTNJv+oo98fZjooVGcAFGwoexk48GG28/Y/hlyl5StE8Vtlyw10UND493pEzCeq8wH
	4/v1xhaTtLu6C6dVDBGweAmNav1teolH4nl4UwjTCbfIeLzCiRtbQtwbM/K8fKsW0THNEiD0MuQ
	EIo6uq+BX4yGAUt/RFxvgLzbWe974K7If5ZMHwxku7JuhfftYJoZqVZgoYtcTUNgawB+lXmlsrV
	qM/h6t5qH5
X-Google-Smtp-Source: AGHT+IFXmJHcymRwKB77zfXpR3u4BJ+t/ArccajlKAHTYFVPTWzRr6cKkv1aZBP5nqvYdpuwmRsTiQ==
X-Received: by 2002:a17:907:3e24:b0:b04:25e6:2ddc with SMTP id a640c23a62f3a-b6472b5f33fmr1136973766b.8.1760895434812;
        Sun, 19 Oct 2025 10:37:14 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036884sm546101966b.40.2025.10.19.10.37.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 10:37:14 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v3 2/5] emacs: patch CVE-2024-30203
Date: Sun, 19 Oct 2025 19:37:09 +0200
Message-ID: <20251019173712.1460844-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019173712.1460844-1-skandigraun@gmail.com>
References: <20251019173712.1460844-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 17:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120804

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-30203

Pick the patch mentioned in the description.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_29.1.bb   |  1 +
 ...w.el-mm-display-inline-fontify-Mark-.patch | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index 5375c17f30..7d5b3cd3fb 100644
--- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz \
            file://0001-org-macro-set-templates-Prevent-code-evaluation.patch \
+           file://0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch \
           "
 SRC_URI:append:class-target = " \
     file://use-emacs-native-tools-for-cross-compiling.patch \
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

