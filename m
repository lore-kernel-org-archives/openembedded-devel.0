Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B6BCCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 12:11:28 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.32407.1759752686845985344
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 05:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=at6spTEF;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso733886766b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 05:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759752685; x=1760357485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDHBXfgeEIZbSiJlGa2OVG3tnRx3AQObA/VA0qL6Kjw=;
        b=at6spTEFBgLfQGZ41V9A0NbvzHcZf40RYyzPFs3/5Vpu5fqxju2xJEgCvpLKwuz67n
         iV2m3rY4B+kTuhkYdyh3Y4A5abPVgvCcNF1nO7wRcFSVV7y1l/9glwanNeZXnKXH9Atv
         bQNPx+tMRz+IQ7gxqLRZZmQPp2dCtEw6GM3SxkQ5xFV7b/0XgeCplprmeARyHuFUfNqg
         mWiUqRM1Qxi1Ijrk05zl0uwu8+Qe+6O7KXjAltvIqmWe8+7wdvDEEci9qtORdsPgkFal
         UOehgDI6OsD7rVCUrZMJ/2su4oo5O+C+Kdo38GCMflRGnY/0zJDNTLcrqC0+vC4Yt2fV
         C6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759752685; x=1760357485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDHBXfgeEIZbSiJlGa2OVG3tnRx3AQObA/VA0qL6Kjw=;
        b=lm/M5szR+sO3EpXKQOrI+WVRDm9RBAFi8HlCSoYdw/TVeAdpQZ93o7f92b4PPF0rcW
         bW9BEDPiuHXNZ7vnzhgffeuZjigCBhdTv3eGL+C8pemC4KDxjqkaeFp7RyOLLpCkb0qw
         KPply3JjUU3BrHwOPDpYrQMtMUypfBhof1aYchAkT7UFy/wUdg/gMOLwneaYJpMB/qVw
         DELRfy8W/7z30CvTuqRsHN85lZIJ0tipFF5m6n/EQpg+ykor2xQYXVhKrjChQoHuLkxE
         VvAECxcvB2pUrpltWGhGW19pJRsZqKwT8UW7Oa5VtkYXpkDJ5F2NT7X1B30d/cTevjIz
         HS6g==
X-Gm-Message-State: AOJu0YxYabgQaa5a9ejFBR73xAGymvRZd1GvtIMej94am5IeLZWVFlnz
	+KQwfsDYEPS4arey1XWsrxgIR49yXUHFb0dw/62qaBxEsd0XWLMQs0MgbFkaCg==
X-Gm-Gg: ASbGncsPc0fFYuDDV77VgzpaAfIKup/Ncg0HsvDJpu7dyKxrRQF2CMCJU4ZWtxV4Eaj
	Z/sL3HK7P5TPd1CSKyy4OsBC4JsCX0t+sOZxOwCMXd24quk+QJBrBHhq/SIZ8+tzA0Ibq+AQnGg
	uyxJjVCuNDQyMgE3d1zIcwpflXcWWhSR1jO/GfHauCjVm5xWx6XOSHxFEi5KpB7ClIt3mWPUoiS
	YamoMqeo9BqyVtgYPIltzOJMyBNbDTRyVsxjr0VFSrwD4jgFC3H1RD6lmDmKkQRH4T9BfaINrF4
	nk5wvj1TlNbPrT0yQBNiPU6QGYi1jnsCsdN8X9EXK4Zlw+Q4a3MuB72ImxaOIMXJ9bNHSljovtL
	ptp87qcFwl7T15Q/Mho2cgasvQOvZ281wrKjEz5awKqmLeX9t0ylwyng=
X-Google-Smtp-Source: AGHT+IEQOAtJZSrBMILQ4I83Ls1dDkgfRC+Cjw94o0SNFTwu2p2yIPOVw0bnzKqI4Y2BocCfE8Vrng==
X-Received: by 2002:a17:907:3f91:b0:b41:660:13b8 with SMTP id a640c23a62f3a-b49c3445274mr1684687366b.31.1759752685073;
        Mon, 06 Oct 2025 05:11:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4fd9esm1134367966b.76.2025.10.06.05.11.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 05:11:24 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 5/5] emacs: patch CVE-2024-39331
Date: Mon,  6 Oct 2025 14:11:20 +0200
Message-ID: <20251006121120.533142-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006121120.533142-1-skandigraun@gmail.com>
References: <20251006121120.533142-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 12:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120289

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-39331

Pick the patch that's mentioned in thee details.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_29.1.bb   |  1 +
 ...abbrev-Do-not-evaluate-arbitrary-uns.patch | 71 +++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index 704a8210a1..10c148b216 100644
--- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
@@ -13,6 +13,7 @@ SRC_URI:append:class-target = " \
     file://0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch \
     file://0001-org-latex-preview-Add-protection-when-untrusted-cont.patch \
     file://0001-org-file-contents-Consider-all-remote-files-unsafe.patch \
+    file://0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch \
 "
 
 SRC_URI[sha256sum] = "d2f881a5cc231e2f5a03e86f4584b0438f83edd7598a09d24a21bd8d003e2e01"
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

