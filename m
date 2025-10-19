Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6436CCD184
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 17:37:19 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.711.1760895435937531580
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 10:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UC3eKFCE;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b5b823b4f3dso686451066b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 10:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760895434; x=1761500234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vg1TyhERvugyxnaEQUtX2rIbGFG38ArvytCi9V8rws=;
        b=UC3eKFCE+hTuvKtt8tPLH/2pZww5NbtDx1nDoeNTB+0i9GpVVHBfZoNzm48EvsBkkR
         cpzrhxz8TS9iASdiQLFpwllnT345Cl5ZiE0xdzt63sYAy0wbpJUQRbF9jbWSaysC6uPQ
         l/5kl2m1dfvz+cwTA20wE/+BX/rVhAUIcvypAEFGVn9Yv3STw+PuGOCABY3bB44xt/aP
         zHUZeXJ3e8xctqU8Sh+CxmYlNEiYIxfcHPd01tZjBA9xCpPY/7jdchg6xLPC3oUDjRT/
         Ggzn2YQ6/E5WF5qNKkNPJhpBOI95ZTX6CI6hkNUFi1qnzhAWp8AG/q4oB72N+C3Kufap
         6Fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760895434; x=1761500234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vg1TyhERvugyxnaEQUtX2rIbGFG38ArvytCi9V8rws=;
        b=cqn7MdFZr4hyjO/1bB6/FA8uX4vZopm2mnttWXCuNetaJ1kRlcxP89Gk8BihYjiBKh
         CEMZ5QCUozUZeUUWryV6N5CoKlR20j+RDn/BmfLVnhiUuBvBbvkJsly6DIOXyxX2NtFN
         F/+QYQTTbXujgTEb1ctfIZjGrrkL71BKh3/4/dVjsrRDMwhFDirZPE8D5SKAuhq8JD6E
         K618k7njQ7TihepuwpEjyWsO2nsZx1JvK0x5uFEd2e/jxWW6CO7QttA4CPVHiTIGFnVT
         TWPSAyTZapPz2TmfEtHZkTVWkzas+NDFi6ObhWaZlh5jxv5II6bwUDKfZjWzx79nr8qL
         dgqg==
X-Gm-Message-State: AOJu0YznVDM+H1hx0Y3LrfigVen2/52NwHERf3RIBXI5+5VkH0G/Ap2W
	0ZRJTlkydBzWolhlxa34OjT6Z5ZVHP3wCyFrX+l3m3czVsketMwfwEU+PkpTFg==
X-Gm-Gg: ASbGncuIOfsyrpujK5TQyqFHQgjCjMIq12cdn60yoi/EMQdqlZ1rQjeEx3sgg/eKyJ0
	fIT/MvCEE6Xcvm8LG6Qy5kcXJtTd0yv8jvXE+rNpLh/2iwmz+sblJNpAeHa/lFuv4Bp5lQiw6PG
	YnbcC6Y84sGqw0zkQ6pYwsDUE+34mjKUFhOZVhm/Os9m7+wW4yTdA5rSwB/URuh8MKTODXnIHZ0
	al4EFfEJofm3UPIX5sZXF88KtyErbbOsq+5v0ASe5mh0ws/l2M8v+MnF/fRQUf3WkPhgkVzlzny
	FRLQN/VQTTzB6wouMLhlFQNHneR3+XDkOk26UtNm/IvpLK320DIhEObd8hPte10alFxMk13r3v2
	LUeTXRgd/OVrFq2/L5omt7OhrDAWv+gw88/Ed9Z+jeUE61RF9XYA0uMHXaeMcDklNtq6dfl45WU
	gEutY3AQVVxYaDUxryJBY=
X-Google-Smtp-Source: AGHT+IFNbBotqI/N1yvtT2je4LZUoI5mHQgcs3B4fuMGnC0QqAp3ktd4PimURPMM/DnRTu7HJI1Mng==
X-Received: by 2002:a17:906:2c0c:b0:b64:8464:68cb with SMTP id a640c23a62f3a-b64846468f0mr908853466b.10.1760895434187;
        Sun, 19 Oct 2025 10:37:14 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036884sm546101966b.40.2025.10.19.10.37.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 10:37:13 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v3 1/5] emacs: patch CVE-2024-30202
Date: Sun, 19 Oct 2025 19:37:08 +0200
Message-ID: <20251019173712.1460844-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019173712.1460844-1-skandigraun@gmail.com>
References: <20251019173712.1460844-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 17:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120803

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-30202

Backport the patch mentioned in the details of the link.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_29.1.bb   |  1 +
 ...et-templates-Prevent-code-evaluation.patch | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-macro-set-templates-Prevent-code-evaluation.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index 5cbe4551c0..5375c17f30 100644
--- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
@@ -5,6 +5,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz \
+           file://0001-org-macro-set-templates-Prevent-code-evaluation.patch \
           "
 SRC_URI:append:class-target = " \
     file://use-emacs-native-tools-for-cross-compiling.patch \
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

