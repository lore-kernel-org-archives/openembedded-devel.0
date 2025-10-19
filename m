Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76183CCD1AD
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 17:07:49 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.193.1760893660625165096
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 10:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZFqSmgu7;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso633065966b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 10:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760893659; x=1761498459; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKMX3BVsKhYeP38y7aiQFRPzaRF9pggxY6KjUU+Ac1o=;
        b=ZFqSmgu7ffD06H/FLo6fiAZxd94nQQ7pfSONGwlL4/bB7RW2oyVhvQspwMvfCHutMo
         gLLAiR4HKAOu/KJ00TXzygw9Hgf7FSjT00LZl+xkv/0nhJLFZNOaiFoVYqiu4vDzgqRn
         CGJmGpf34Y0EPi0NeYUyMJzH0rZXMFaRn1ucKpa26Q7qKr/Qq9ZLOCnYTgJuUyEc4ap2
         R+ifXBefyN/MqWIZWHP9wDr+YOS4+TN2UspkakQAGFSGUMPRIm61soFMjrH4mV+9uSBO
         9hMVs3hk+BLYFG6DYAjttUDuMUA2FjWj1d7uRxWHul7nkIIM1RHD+tQIDIZIoKoBNlz0
         KhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760893659; x=1761498459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKMX3BVsKhYeP38y7aiQFRPzaRF9pggxY6KjUU+Ac1o=;
        b=n/96zTiBEEc7adqPoQ4DKrDd1XO+FkjZv1W82RNrYVkVrnsQ9HXZXvCYRqbILhV4f1
         XsG3nXMcbyQUbgg2o/+PURCYeiUG2MpgpxsvMt/xx+nDVmthYshdDKjQm6bkKR87tgZs
         wAMYD3/zMEVYa+XnNyOHP20C+5RJJRUxdC6gfj9411dTn1h96pz+S0ujOMrkzP9GxxDs
         miRhn14zdiUyBzJZLMypQ4ldBEcseR1nR0IqtSKFJUt+XWuH3eQqR4LeaeVdOBCAiEJW
         WuiROAqIjINmCjmm2rD5dX20ZOj+fD56WQiK4C41eRRjJFnxyk2mgZZ5lVdgfm1nhVuA
         NUPw==
X-Gm-Message-State: AOJu0Yx41BiKrdxzJePjbV4r2gIPGeKtjsvtkCASe2lgUI0TA3KZxXMC
	xhW4SEJMdnxJgiIQ8hcLiQ7bfRn21DTWsb5Etn8EGh7VQqm2va6Vp/QqyNG+hg==
X-Gm-Gg: ASbGncvNMdYHHYK55he9ePZDtca1BvhqV/YMJNJiiVyoO3DTFNPGzFv+9VYf0Fkbopu
	flSPBd4mlcL+S8zPp131VxhAWlVXoqIsl2yOD6IixK33QAR5BMF9Lm5RA2oKyBDOePwGT/JzmWA
	xvgaKR+9L6AHzUg8IuTnqsFCam/yMt/8L6gLnilWSadz+l8+ax29VkC/QZatemWXbLtVKXn6cK1
	VSPvbY4woYhps5JoFJiv8VqqAqEb8aipBtJC8MH6SL44zdXonHlO+Xq7UAY1TKxuorYwoY2T4j+
	hfWnspl81uWM26UsYMXdOdieNaItGG5OxHbJYFGz9jL+8Gm9p1/EwFXKiPGhL6YoRqtlRGAT1Mr
	270CdxecGE81jqe83uoa22IbRySvn3kGybhccncx9qtoiAbNKrrEmLnmp1wL8+54wqlaCmarGjm
	4S/BV10mZr
X-Google-Smtp-Source: AGHT+IG5Z+DmC9h5BCW2GYX69WkSafC9Eg5v5bo1w2DY+I1bGgzt97mDsdk+re3oh7feSCCI+qKF1A==
X-Received: by 2002:a17:907:3daa:b0:b3d:656b:9088 with SMTP id a640c23a62f3a-b64749416admr1356290066b.54.1760893658819;
        Sun, 19 Oct 2025 10:07:38 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebb499dasm556206766b.73.2025.10.19.10.07.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 10:07:38 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2 1/5] emacs: patch CVE-2024-30202
Date: Sun, 19 Oct 2025 19:07:33 +0200
Message-ID: <20251019170737.1311808-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019170737.1311808-1-skandigraun@gmail.com>
References: <20251019170737.1311808-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 17:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120797

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-30202

Backport the patch mentioned in the details of the link.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_29.1.bb   |  6 +++
 ...et-templates-Prevent-code-evaluation.patch | 47 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-macro-set-templates-Prevent-code-evaluation.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index 5cbe4551c0..b1b795dace 100644
--- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
@@ -5,10 +5,16 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz \
+           file://0001-org-macro-set-templates-Prevent-code-evaluation.patch \
           "
 SRC_URI:append:class-target = " \
     file://use-emacs-native-tools-for-cross-compiling.patch \
     file://avoid-running-host-binaries-for-sanity.patch \
+    file://0001-org-macro-set-templates-Prevent-code-evaluation.patch \
+    file://0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch \
+    file://0001-org-latex-preview-Add-protection-when-untrusted-cont.patch \
+    file://0001-org-file-contents-Consider-all-remote-files-unsafe.patch \
+    file://0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch \
 "
 
 SRC_URI[sha256sum] = "d2f881a5cc231e2f5a03e86f4584b0438f83edd7598a09d24a21bd8d003e2e01"
diff --git a/meta-oe/recipes-support/emacs/files/0001-org-macro-set-templates-Prevent-code-evaluation.patch b/meta-oe/recipes-support/emacs/files/0001-org-macro-set-templates-Prevent-code-evaluation.patch
new file mode 100644
index 0000000000..c88843da59
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/files/0001-org-macro-set-templates-Prevent-code-evaluation.patch
@@ -0,0 +1,47 @@
+From 7b1f10c152e69a32155c0291b9c8e83a8e28ebff Mon Sep 17 00:00:00 2001
+From: Ihor Radchenko <yantar92@posteo.net>
+Date: Tue, 20 Feb 2024 12:19:46 +0300
+Subject: [PATCH] org-macro--set-templates: Prevent code evaluation
+
+* lisp/org/org-macro.el (org-macro--set-templates): Get rid of any
+risk to evaluate code when `org-macro--set-templates' is called as a
+part of major mode initialization.  This way, no code evaluation is
+ever triggered when user merely opens the file or when
+`mm-display-org-inline' invokes Org major mode to fontify mime part
+preview in email messages.
+
+CVE: CVE-2024-30202
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/emacs.git/commit/?h=emacs-29&id=befa9fcaae29a6c9a283ba371c3c5234c7f644eb]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ lisp/org/org-macro.el | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/lisp/org/org-macro.el b/lisp/org/org-macro.el
+index 481e431..a3b5c6e 100644
+--- a/lisp/org/org-macro.el
++++ b/lisp/org/org-macro.el
+@@ -109,6 +109,13 @@ previous one, unless VALUE is nil.  Return the updated list."
+   (let ((new-templates nil))
+     (pcase-dolist (`(,name . ,value) templates)
+       (let ((old-definition (assoc name new-templates)))
++        ;; This code can be evaluated unconditionally, as a part of
++        ;; loading Org mode.  We *must not* evaluate any code present
++        ;; inside the Org buffer while loading.  Org buffers may come
++        ;; from various sources, like received email messages from
++        ;; potentially malicious senders.  Org mode might be used to
++        ;; preview such messages and no code evaluation from inside the
++        ;; received Org text should ever happen without user consent.
+         (when (and (stringp value) (string-match-p "\\`(eval\\>" value))
+           ;; Pre-process the evaluation form for faster macro expansion.
+           (let* ((args (org-macro--makeargs value))
+@@ -121,7 +128,7 @@ previous one, unless VALUE is nil.  Return the updated list."
+ 		      (cadr (read value))
+ 		    (error
+                      (user-error "Invalid definition for macro %S" name)))))
+-	    (setq value (eval (macroexpand-all `(lambda ,args ,body)) t))))
++	    (setq value `(lambda ,args ,body))))
+         (cond ((and value old-definition) (setcdr old-definition value))
+ 	      (old-definition)
+ 	      (t (push (cons name (or value "")) new-templates)))))

