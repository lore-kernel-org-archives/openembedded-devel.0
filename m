Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE96CCD1A7
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 17:07:49 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.191.1760893663145442235
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 10:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jbUUiN4x;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b64cdbb949cso535443766b.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 10:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760893661; x=1761498461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFLFMsSWpeDkPquvW/ycWTWMvJZ+2BtY+RXjfy4VFnU=;
        b=jbUUiN4xCz1IevEzv0KJzLdnKNXaCL9LqVyAgGV5gCgOihCp2hsfx0qWBJxZJ8UWFQ
         LUSy1uoN5zt+SRU7qFfHw2ymWXvsSOQEvyVGiFvMLuAXaeAht07Jec1iqBN5zK/p/Us0
         0rzyJFSV4uTNE7G9HygesVNZjMwL1SSOTE7UBRCIlc2RZRnVptaKgH5LGJb2GBfnwPwQ
         MQ4KpLDFTUeV3DzcbZuIF7Dau6cueW+6EVYmFoppNrlyDP2VKk41ZeS3YyMgTxfnoBdQ
         GwbtgZaXo8YQHNAujgCRq1bgeV+Ix7UYTNQQ4+FGqcGhyMnuUEbUwNrLTIG2TpLuLP+k
         Z3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760893661; x=1761498461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFLFMsSWpeDkPquvW/ycWTWMvJZ+2BtY+RXjfy4VFnU=;
        b=cGhio2+ytOAtQJFlI0ZT4+yvozRnSVaxPFl4+ZGrQF4LgBQ6DcxxWtmSa6UalJBTs/
         zBMaDQR8Ird8nVLOt+ZCw+eA7V2DfIzRXhhNs/Eo78eO5sBMhlYcWMZDqARE+ZcqQbue
         4ufwqGZ9Fp2kfu8uvOi5SfjyOLTb3XGgMreEq4G+MGyDL91CKt2HF9mcxq6IwWt68MZE
         Qv7ZQQz5OB/74+jwLdS/gmHPPGEE/pNUw0e1li3YlkQt0aQieBdCbn8hoWcMJhPDTowg
         Dz1maG7gMTq/T0n/8AC8kVG/xjOiyy0vVZ85bp+RpdX8Mhz/RIFAJXuyFeo+CBVQ0G56
         Kz8A==
X-Gm-Message-State: AOJu0YyFXgZMSiMxke6mnnTWsmhmIn4jNah8hkon8YhMRzoDSJIGQw4h
	L84hXpKcyi7DN5Df3hu3nyLtC1O4YNxZuiXGFoMHN74Gl0ZPrJHmhQfquWgJWg==
X-Gm-Gg: ASbGnctuxRM2Y4EiOdAm93H1+9jIDnaoWP/m7QFlgXvaxoiQZsG3mDTV3qDLGw8Vo8N
	OjtJqxCGASyF3v8JeoNkBNMhznqirxScTgM/m7p2EaBXUMysvbI1JFeDd3spwNuaVQiFgRtBMLe
	zp4ZZht77flfZ96Ks6QReaRwKI9H33Ku3IHNAgg6YgiD8/os9S/KxN6d+yJl10iY6OjPFZ485Xt
	8JK8SkFOTK5Xoyy9f3tNvYxpuBTJlsr/xa8gdhNhxAU0lQjCHVJ0onZ6yKdVEGl63A+FvmlLKlL
	8WZtYj1vibdv6g0iJ4Ustt8rCOpxJCbG5PgPbEY0zDVE56UdV+or9a35sRjiTeYB+vUVviYebik
	0OWnI6Z7xXKI18d6S/8BgpCOqFUnT3op4HNSwma0VKzAmIyZpWwUebtYq1e6CvMXCIniTUNWb8g
	==
X-Google-Smtp-Source: AGHT+IGjl3SOUdtGmih+6/cUtDra4+4xyPgVwn6bV2sT8KPzchq6SkJv7F/m7jheKJLtjYKCvfJbKw==
X-Received: by 2002:a17:906:794e:b0:ad5:d597:561e with SMTP id a640c23a62f3a-b6475708a50mr1248626166b.56.1760893661349;
        Sun, 19 Oct 2025 10:07:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebb499dasm556206766b.73.2025.10.19.10.07.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 10:07:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2 5/5] emacs: patch CVE-2024-39331
Date: Sun, 19 Oct 2025 19:07:37 +0200
Message-ID: <20251019170737.1311808-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019170737.1311808-1-skandigraun@gmail.com>
References: <20251019170737.1311808-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 17:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120801

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-39331

Pick the patch that's mentioned in thee details.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_29.1.bb   |  1 +
 ...abbrev-Do-not-evaluate-arbitrary-uns.patch | 71 +++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index 0a88b0282a..438029f83b 100644
--- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz \
            file://0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch \
            file://0001-org-latex-preview-Add-protection-when-untrusted-cont.patch \
            file://0001-org-file-contents-Consider-all-remote-files-unsafe.patch \
+           file://0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch \
           "
 SRC_URI:append:class-target = " \
     file://use-emacs-native-tools-for-cross-compiling.patch \
diff --git a/meta-oe/recipes-support/emacs/files/0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch b/meta-oe/recipes-support/emacs/files/0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch
new file mode 100644
index 0000000000..88fdaaf22d
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/files/0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch
@@ -0,0 +1,71 @@
+From 8b8866eb94c7b7140ba94eb2b4e6ead14c0d986d Mon Sep 17 00:00:00 2001
+From: Ihor Radchenko <yantar92@posteo.net>
+Date: Fri, 21 Jun 2024 15:45:25 +0200
+Subject: [PATCH] org-link-expand-abbrev: Do not evaluate arbitrary unsafe
+ Elisp code
+
+* lisp/org/ol.el (org-link-expand-abbrev): Refuse expanding %(...)
+link abbrevs that specify unsafe function.  Instead, display a
+warning, and do not expand the abbrev.  Clear all the text properties
+from the returned link, to avoid any potential vulnerabilities caused
+by properties that may contain arbitrary Elisp.
+
+CVE: CVE-2024-39331
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/emacs.git/commit/?id=c645e1d8205f0f0663ec4a2d27575b238c646c7c]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ lisp/org/ol.el | 40 +++++++++++++++++++++++++++++-----------
+ 1 file changed, 29 insertions(+), 11 deletions(-)
+
+diff --git a/lisp/org/ol.el b/lisp/org/ol.el
+index 9ad191c..c15128f 100644
+--- a/lisp/org/ol.el
++++ b/lisp/org/ol.el
+@@ -1063,17 +1063,35 @@ Abbreviations are defined in `org-link-abbrev-alist'."
+       (if (not as)
+ 	  link
+ 	(setq rpl (cdr as))
+-	(cond
+-	 ((symbolp rpl) (funcall rpl tag))
+-	 ((string-match "%(\\([^)]+\\))" rpl)
+-	  (replace-match
+-	   (save-match-data
+-	     (funcall (intern-soft (match-string 1 rpl)) tag))
+-	   t t rpl))
+-	 ((string-match "%s" rpl) (replace-match (or tag "") t t rpl))
+-	 ((string-match "%h" rpl)
+-	  (replace-match (url-hexify-string (or tag "")) t t rpl))
+-	 (t (concat rpl tag)))))))
++        ;; Drop any potentially dangerous text properties like
++        ;; `modification-hooks' that may be used as an attack vector.
++        (substring-no-properties
++	 (cond
++	  ((symbolp rpl) (funcall rpl tag))
++	  ((string-match "%(\\([^)]+\\))" rpl)
++           (let ((rpl-fun-symbol (intern-soft (match-string 1 rpl))))
++             ;; Using `unsafep-function' is not quite enough because
++             ;; Emacs considers functions like `genenv' safe, while
++             ;; they can potentially be used to expose private system
++             ;; data to attacker if abbreviated link is clicked.
++             (if (or (eq t (get rpl-fun-symbol 'org-link-abbrev-safe))
++                     (eq t (get rpl-fun-symbol 'pure)))
++                 (replace-match
++	          (save-match-data
++	            (funcall (intern-soft (match-string 1 rpl)) tag))
++	          t t rpl)
++               (org-display-warning
++                (format "Disabling unsafe link abbrev: %s
++You may mark function safe via (put '%s 'org-link-abbrev-safe t)"
++                        rpl (match-string 1 rpl)))
++               (setq org-link-abbrev-alist-local (delete as org-link-abbrev-alist-local)
++                     org-link-abbrev-alist (delete as org-link-abbrev-alist))
++               link
++	       )))
++	  ((string-match "%s" rpl) (replace-match (or tag "") t t rpl))
++	  ((string-match "%h" rpl)
++	   (replace-match (url-hexify-string (or tag "")) t t rpl))
++	  (t (concat rpl tag))))))))
+ 
+ (defun org-link-open (link &optional arg)
+   "Open a link object LINK.

