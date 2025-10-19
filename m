Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F1BCCD1A5
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 17:07:49 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.197.1760893661866324302
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 10:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cihhSAe0;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so664589066b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 10:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760893660; x=1761498460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmsSRdKfnbmOTqjseB1cL2U6uCkgqxuSGnIQTwP5CDE=;
        b=cihhSAe014Vb5KIddeZBqG2KkW8KwzH4NS8T76cB24WbXgNln9QY6c1hb+LtzIjpeG
         RUdO/vYKAY4c1kQGLDccxbwGro02zRF1h1ZK9sNT/M3bl2zQ5X1tK2hmxxy5JP2CMQqA
         FcDo2RyO485fu3u/9+PZWHtwzjV6YNgCw12D4zJ+uM6B91XTVgKN5PMLIedIdisiMRIe
         66Z5KBRcfuF23V+WynNlp0dN9vYyHvazHjcGlL4UXPO9gMo36N1P9k0bkTnzqDKi/b5i
         hScyf8W7qO1jq6lCx7pUkuk30Hw4xeiSstBewUqkdllIumASwFMYAzRxpPTKiBdJB0yR
         Pq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760893660; x=1761498460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmsSRdKfnbmOTqjseB1cL2U6uCkgqxuSGnIQTwP5CDE=;
        b=YQqmZIW/IPongy8fMqEp6SQIuukZdH236Z9vMXBrMUqtY9BogWkMHIBo5JxkthEsFA
         pW1CvpRJH5avxXHDCgp8FDIKWsLQ88h2udko3XDzfkoZifrWMKbvM86BOyF2lYp16cq7
         x9VQk52ufi4CDFCfGeFYl7SlfAzx8DetqwGY/sRtvkJnAFs9aa5HBCbI4pQvMcOmUYa5
         plVzyFiDrB9kDKINn+cM72C5Ae7RXcHmAw8rAeSekcvgbJhjkSzMBQw06YQrnMj8+Ha9
         nuvXXYUX/ZciPB32L33UtE4NUvOOkFN+3XJb5Wng3tP5z242e+fLCgEKiNtcFiaCUKfw
         1iRQ==
X-Gm-Message-State: AOJu0YwZAYMqytXu/trFbvPL+A3agK0R/uu+YcEAZhZSiLOoGaJKq5kA
	L7wtYtpUSW9jmRCnCfC8lZA5dKD0E5kzruC5hdlx80q5CZfrl/fLKuzyNqKU3w==
X-Gm-Gg: ASbGncsYVvq9kQ+nlsIiCDlfSWoC2seXSDkUq6mHoJ1SragedyL81DKP5gMMYBn6dtE
	zCPmQ0oyj87rRv0KV/2JDzkPB93hov2Tt60rn8yWPh5Q6PvPhM7VwSQBN/MkDPyOGjr0I/63TSO
	D4aB4GDgUr2uD98hYeSUiuTo68inQZoUQj1VEDcYAvWYkNagURkophp4TZt/XEJ9DEW3XrYdamp
	je3MFFH1fH6D/MJaX7ec2aQQoRNELhkaVHkYfLd2JaI3lJYOR7PdcbKWUUKaWx0nCiOAOPNd4tc
	jig4MoEgj5bHQkMm9mDwjVEZ+LJYcuyzHqxjBhpdssZoY146Xf4SYi+TJ5hhUjgdw8dA3i6DSVv
	WnqpAKnpQd5hzQnMyC/tHlhnBZ7P7gCdqIm7POFz/JpBmdsRlSTBQZL2myrSVGfhB9H6MQ1n8xA
	==
X-Google-Smtp-Source: AGHT+IEeZkzeE7gqtpBxKFP+4hCIx6a71BRqUM1mr+t57vTKHQNWGh1iZQnNb4VSsPgUa8p3Rrn1gw==
X-Received: by 2002:a17:907:1c0a:b0:b40:52:19c2 with SMTP id a640c23a62f3a-b647463a240mr1275932466b.20.1760893660080;
        Sun, 19 Oct 2025 10:07:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebb499dasm556206766b.73.2025.10.19.10.07.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 10:07:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2 3/5] emacs: patch CVE-2024-30204
Date: Sun, 19 Oct 2025 19:07:35 +0200
Message-ID: <20251019170737.1311808-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019170737.1311808-1-skandigraun@gmail.com>
References: <20251019170737.1311808-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 17:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120799

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-30204

Pick the patch that's mentioned in the description.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_29.1.bb   |  1 +
 ...w-Add-protection-when-untrusted-cont.patch | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-latex-preview-Add-protection-when-untrusted-cont.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index c3f36007f8..0af77ef05d 100644
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

