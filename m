Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854BACCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 12:06:38 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.32263.1759752393658066695
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 05:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BlHwzUG3;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b41870fef44so957781366b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 05:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759752392; x=1760357192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eDMkUpeDUpl2LGuEqmMZ+Wkl88uwo8Gvw7NRf+GG3+A=;
        b=BlHwzUG3LH8twRslgsbkFvDKsdp2wr4aOt1ANiMRttSvkylF9QcP8Bx0zOJub2XQe3
         eiZJpV7+Z+A2+rN3dv1jOLJcEnAW9VTNmceAJk6pnTbYVO5oVe1YMKdtQrXP4JYv1fHw
         elpOb7o0qSR7InD+2g05FXks3VEgq1tAvdyZ5i9w7G+9kLffkN/m+jcnNEF9al9XZidc
         pIWTdrU4CMIkrSyzLPc9ExqB55NgIV12BwIHoj34rFUYMB+06Qj5WME59y3ewVZRQWJC
         xlBeHGeAhBLHPGG11JVEyRL17gnMPLfYBRGzAMWWUo5Bnh/iqBAKZa+x645IXZsJ186+
         kzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759752392; x=1760357192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eDMkUpeDUpl2LGuEqmMZ+Wkl88uwo8Gvw7NRf+GG3+A=;
        b=vJ2vTjmhFkZd+QmXoib51z/o2RtrhMwIQAAHMFpS5buYyafbPmkeydnCSr72qu0uMH
         lvnS7z9fG4WbwWrN11yLyIGYtYKEIgDMsJ5OCoa9ntdPBfNxLY5L9QzQNEOz6bXjL57S
         FFiQGfPW+0z8bV3+9lOC+ffd+yk7UNY7ljGJ5dSCKELotaqAXBKUc0aZRYkg9Kwkd3QQ
         CWU/6SzstVa7DkbNEO5II5wFkMDQlPjZ+7cwtbBRRD/A4EhH4vYRCt6SXMqRdJ6VnXBB
         H0NtaKCs7LPcuo6XvArwWLqDgdR45yitsGsI20ZUAK5WmADBZzc8Gky4T8AJQfwz5HSQ
         BZCw==
X-Gm-Message-State: AOJu0YxUCtskg4N9kLYxo6wy4zsPEvpDOBPhl8h70bIhLZo1y69AnQYs
	5B04JTpExQF6zmXW/8WX1WMT46TJLTVxNtgAWCnNNc85qgHqHq88QGYGGdC2Yw==
X-Gm-Gg: ASbGncu0Ie24ipTvYbfVZhXYSp4sUhwnPhj9vW+70hSHXMs2RWdObMgyxMK2Pj53LRL
	PjEY1xrxetGzz/Hwu9GjHQGvNUtPUQP8IoRYBwxmKl/y7yOKc4HQmS4khQZYjRmVr/bi+ZGLPPW
	3nyQfKBjsqDX9XYcuUGmt1GXkqE1PXUzqQ7VSNm6ZdqRXWyb6hTqbfbQXIZ+YdOarnggpnBEj7Q
	tv4JIKSL/LRV4rWAS4nuQ9+5ogX9OQRQiys4yhCbxVekvPcgyudwUf1zIkva4cIdLV79beUUIXG
	4mP67w/NkK1gqzMSIp4LKsbFXOJvq6tGeOe+uB/xQdC+UFssHCiSQbOzgeQmAW/042Y+i0nqDYN
	j6JWE0X2Dh97gb6jwl4YXtbdhhtdY94T4Rtqu2OJ386qX
X-Google-Smtp-Source: AGHT+IEXO2dNbbu0LUxcRoUKpZ4XJzS0SW61eowtRrKcf2brB35W3hqyaxhWI/Qor/YM3Wox/w51vw==
X-Received: by 2002:a17:907:868f:b0:b40:2134:a877 with SMTP id a640c23a62f3a-b49c4292adcmr1488700666b.59.1759752391629;
        Mon, 06 Oct 2025 05:06:31 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788110219sm9949748a12.37.2025.10.06.05.06.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 05:06:31 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][walnascar 1/5] emacs: patch CVE-2024-30202
Date: Mon,  6 Oct 2025 14:06:26 +0200
Message-ID: <20251006120630.414259-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 12:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120278

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-30202

Backport the patch mentioned in the details of the link.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_29.1.bb   |  1 +
 ...et-templates-Prevent-code-evaluation.patch | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-macro-set-templates-Prevent-code-evaluation.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index 5cbe4551c0..3701e17025 100644
--- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz \
 SRC_URI:append:class-target = " \
     file://use-emacs-native-tools-for-cross-compiling.patch \
     file://avoid-running-host-binaries-for-sanity.patch \
+    file://0001-org-macro-set-templates-Prevent-code-evaluation.patch \
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

