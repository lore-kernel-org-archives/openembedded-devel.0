Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46D0CCD1AA
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 17:37:19 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.713.1760895437335401836
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 10:37:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KTv4Nkre;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3c2db014easo788289566b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 10:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760895436; x=1761500236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzfStEPODpDcRZrAa2DWw1x6BadhhN6KDB6Kg2uFJtg=;
        b=KTv4NkredS1lj49iMDH6hRtQTbhfEV83BZZ2DJZPuJQWaoD8goWGd6ybUtF+CsTjHE
         mYRhpKw8EOLg++pJe/ECwC3salQZfxw9d6IB1OhpNywhFL3JqtzrvAXAzyVqOqsYscEA
         IPRyfmIc7h60k7TFRcemoAzuQ0+6nkzb7I8FDs24kMbyS5+JVQ1PjYiKiJG5VxwH1JGI
         yugHIEk9KQVCADyq08nGJqUrDsHlzLfllO/pS1Mj3yoz9FHQCme+IcWZXMxRqCuiJDEL
         WXTGwyODmMVAdkoWzwawcFpChuni+cND3thLyAlw1vH14t+v4D3r6u1kPSv4ttDr5qKg
         ulUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760895436; x=1761500236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzfStEPODpDcRZrAa2DWw1x6BadhhN6KDB6Kg2uFJtg=;
        b=Wgv6BY8NYhA0uH3AquyIzsgzG9BV3tYhAuA56Fc5opjKzzaWi9UGRO6fB7l1Thj6bu
         y4TPjWh9LKEnqQCRlUc9oX92W4cASnEiV7SRC+s2gwY/yoeNSc5Y6EcLcG2fVDXvHggg
         sACB1TWIZUzJD7iMs22Bv1z9RVUhCfyltKq9+jHRA7GBL9IJ4+yGlfpUAp/Awmjr9RP/
         AtAx9d2w69skkYYmkb4Bl3sI7DMIl2kbC175KHEmkrBvKjQVyMJubluQ8xbqWImdPWOq
         GaEm8LSpi9hK1d9NcKZsfIOOf+q063Mk09HBmL6Nmp1piqGRklwyMskI65Tbq2Kt63IU
         wiWQ==
X-Gm-Message-State: AOJu0Yx3tSN7DsW3cw6IrBIPF0KVb9zOOsZQz9H9D/kAr7PvZtL+bz3w
	KH2UfOyEXCS3ZP4W7nGNc/e4xbifSJVQz6Xwxb45l/Q1GvfhQRm+tScjGjS0rw==
X-Gm-Gg: ASbGncsspzpTQtKEznrA4fdDlzaPJ7BUEkW4IZBJyHK+zBicTBWEbQx3nGnHIvrstmn
	P0gOAGExNH/35Aw8M0fuFCilKEb9K34aC7VxLGiGKgKhuPp/Sxtr3GWLkqOUtS6UC3zqcDBSAVJ
	IFLFKVU/01DTrtDZQopTGgIfd8P6+sRw1aoveSK1FAyV/mJxjGV3pqkflvTxQTtznJ9yEEhkDIE
	JsnhYchMRFmui9DOIrd90In2RClxgUw+Olh2GcsWH3wU9tHG/QsD+fJFt5Xyl5YMvtGdZzYfJy8
	919x9v+6f6WPvXibps28ZKfEAehz0OOM5MjixnaSerW39iGfgPk9gkCheEYLw3wPV6tvdRygB0b
	98CmDxYhQhWKuT1YLf90qzvonSkb+mRFHOwomx/xUk74Yz4edtuiE9HP7mcLCNMN8omA1BzZG3J
	b0e68RVQvr
X-Google-Smtp-Source: AGHT+IHabnhJ9G1KuuMe/0px2flGL6RSs7KSUBuulsd9WGjN07gVKpaUTAxk2W3zdLX8KGg1V5S2tg==
X-Received: by 2002:a17:907:3f11:b0:b41:f155:404b with SMTP id a640c23a62f3a-b64730472aamr1181458966b.17.1760895435445;
        Sun, 19 Oct 2025 10:37:15 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036884sm546101966b.40.2025.10.19.10.37.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 10:37:15 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v3 3/5] emacs: patch CVE-2024-30204
Date: Sun, 19 Oct 2025 19:37:10 +0200
Message-ID: <20251019173712.1460844-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019173712.1460844-1-skandigraun@gmail.com>
References: <20251019173712.1460844-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 17:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120805

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-30204

Pick the patch that's mentioned in the description.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_29.1.bb   |  1 +
 ...w-Add-protection-when-untrusted-cont.patch | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-latex-preview-Add-protection-when-untrusted-cont.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index 7d5b3cd3fb..f0666a41c4 100644
--- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz \
            file://0001-org-macro-set-templates-Prevent-code-evaluation.patch \
            file://0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch \
+           file://0001-org-latex-preview-Add-protection-when-untrusted-cont.patch \
           "
 SRC_URI:append:class-target = " \
     file://use-emacs-native-tools-for-cross-compiling.patch \
diff --git a/meta-oe/recipes-support/emacs/files/0001-org-latex-preview-Add-protection-when-untrusted-cont.patch b/meta-oe/recipes-support/emacs/files/0001-org-latex-preview-Add-protection-when-untrusted-cont.patch
new file mode 100644
index 0000000000..085bc31c17
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/files/0001-org-latex-preview-Add-protection-when-untrusted-cont.patch
@@ -0,0 +1,60 @@
+From c5cc03c196306372e53700553e0fb5135f6105e6 Mon Sep 17 00:00:00 2001
+From: Ihor Radchenko <yantar92@posteo.net>
+Date: Tue, 20 Feb 2024 12:47:24 +0300
+Subject: [PATCH] org-latex-preview: Add protection when `untrusted-content' is
+ non-nil
+
+* lisp/org/org.el (org--latex-preview-when-risky): New variable
+controlling how to handle LaTeX previews in Org files from untrusted
+origin.
+(org-latex-preview): Consult `org--latex-preview-when-risky' before
+generating previews.
+
+This patch adds a layer of protection when LaTeX preview is requested
+for an email attachment, where `untrusted-content' is set to non-nil.
+
+CVE: CVE-2024-30204
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/emacs.git/commit/?h=emacs-29&id=6f9ea396f49cbe38c2173e0a72ba6af3e03b271c]
+Signed-off-by: Gyorgy Sarvari
+---
+ lisp/org/org.el | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/lisp/org/org.el b/lisp/org/org.el
+index d3e14fe..ab58978 100644
+--- a/lisp/org/org.el
++++ b/lisp/org/org.el
+@@ -1140,6 +1140,24 @@ the following lines anywhere in the buffer:
+   :package-version '(Org . "8.0")
+   :type 'boolean)
+ 
++(defvar untrusted-content) ; defined in files.el
++(defvar org--latex-preview-when-risky nil
++  "If non-nil, enable LaTeX preview in Org buffers from unsafe source.
++
++Some specially designed LaTeX code may generate huge pdf or log files
++that may exhaust disk space.
++
++This variable controls how to handle LaTeX preview when rendering LaTeX
++fragments that originate from incoming email messages.  It has no effect
++when Org mode is unable to determine the origin of the Org buffer.
++
++An Org buffer is considered to be from unsafe source when the
++variable `untrusted-content' has a non-nil value in the buffer.
++
++If this variable is non-nil, LaTeX previews are rendered unconditionally.
++
++This variable may be renamed or changed in the future.")
++
+ (defcustom org-insert-mode-line-in-empty-file nil
+   "Non-nil means insert the first line setting Org mode in empty files.
+ When the function `org-mode' is called interactively in an empty file, this
+@@ -15687,6 +15705,7 @@ fragments in the buffer."
+   (interactive "P")
+   (cond
+    ((not (display-graphic-p)) nil)
++   ((and untrusted-content (not org--latex-preview-when-risky)) nil)
+    ;; Clear whole buffer.
+    ((equal arg '(64))
+     (org-clear-latex-preview (point-min) (point-max))

