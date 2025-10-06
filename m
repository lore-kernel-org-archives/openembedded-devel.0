Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B9DCCA476
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 12:11:28 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.32405.1759752683744319574
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 05:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E+5yAcb0;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso10007799a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 05:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759752682; x=1760357482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eDMkUpeDUpl2LGuEqmMZ+Wkl88uwo8Gvw7NRf+GG3+A=;
        b=E+5yAcb0VEXQUyNxCtfpH9Fizv+GhgMU6k3FTzF0xnnSyIspC5Z8EUorYC+4y1XBda
         lvR0QQHc2wf83P6GPVxr4Bp2pE4k9aRd/tXqJc553ARvI7PYgHeGxWthpg4YWfjNLtzU
         Cx3oaQwcpRSarHQk/so4iWTDAIf+KF+aWh+jxD8wGEefKDjV1aLWkaKzhchcXs4IIe0z
         ULTdRlGoUU0TzIxzdS3wbw+7vLhsOaIFyEL4vKEvI8yBPG+BT5xPAyuqMT2qIrrkio/Y
         WuD9J6In1Fl11Z71i+/LpbtCU729ZYhzDINYebwvWoexwCXD+nsnMiF03g5bWy4/kMHX
         s/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759752682; x=1760357482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eDMkUpeDUpl2LGuEqmMZ+Wkl88uwo8Gvw7NRf+GG3+A=;
        b=nkbsYebDGdL/9371uh+G92DOSR/3bMv/t4aMs0UOqH90JJCGaomCLXY766WV0qX4g9
         fH06ZkHEP/rB9HkFwp5e4PFB8uOhVyJ4OYMnnQG/6g9XtCWTZmkunNqvszPdpTgqLY7u
         ewjPa8DCS4EtWqmEhP6jmlXfXNFtyDCeDf3+J2vZS+fmDUzG2kCCtRhHWRkb5kKrsb/t
         Zkga0BqA3zCqsV2UITlM4avAntkPezLXZ5QKBDva5LE5qtdiLolA9i0/M03d1Ca584eE
         M4hxVV4Df/LydgbdoY0zNMikvx5AmZkSWzuutXNI1UyxsNLJCVEfnOfbZJT+eHTBxn3N
         8bEA==
X-Gm-Message-State: AOJu0Ywut4hHv1BwaYOF93v5uHzMswbYztcEaiufF48a8KHYCzhqE6/m
	0CkFTwXgxibw6WPGc0IffImZykYudpaDVHOx8WwyRTw+1Bsx3zRwZSdKfsU/Dw==
X-Gm-Gg: ASbGnctJ9a2kfJY3yovBdhcoZx+69tqjidrwMB8VKFV1Rs0fI3s+rlnnqb4UJ3cA0Fp
	sWYh7/UQkykzbGeh1L1xlX0nLJmAz5TOETuD6gTlFMyZ6b1WlhxNaiZ7FaMb921oOoF4po+KgfT
	Lu7ssSPzEkkK6YNQkcTMhO9puGiaGcyAgv5UaiYhg4eZOKY5VqBTV2oOy/4/zPxZEzIMC994AYp
	qMs8cjRDb8chAJQ/n7Ihx7LWWDMGH7OHGlgWirX2anJK60BPX538J89jv5lGx8F+0ieRvqXLNVN
	OGiFLMtLwFeaSbfYU1lAAG+qX/0ZNxQuF76jgCS6fax8p6Xi7LbEoRV8F++ru5qCZ0EbSvtLXbM
	nM3R4KjhrD71GeOXEHBocxhZapL+1c2R6Em1woLK2uh0jkjzp1zjKqg4=
X-Google-Smtp-Source: AGHT+IEjIeDIB26ZXZUa/RM0bNrWhcN7kYLzH2VfxZgyk7awYdCh3nVuNyANCWVabXyHQw39W57N4Q==
X-Received: by 2002:a17:906:4789:b0:b04:1249:2b24 with SMTP id a640c23a62f3a-b49c3933062mr1508782166b.37.1759752681860;
        Mon, 06 Oct 2025 05:11:21 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4fd9esm1134367966b.76.2025.10.06.05.11.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 05:11:21 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/5] emacs: patch CVE-2024-30202
Date: Mon,  6 Oct 2025 14:11:16 +0200
Message-ID: <20251006121120.533142-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 12:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120285

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

