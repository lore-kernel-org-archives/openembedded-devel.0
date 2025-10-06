Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C541DCCD184
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 12:11:28 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.32348.1759752685196381677
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 05:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ep5FKCpd;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3b27b50090so889676466b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 05:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759752683; x=1760357483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYZVxGlTl0+DSff4UNw9iceKwlDH97VKpf3mwiOA6a0=;
        b=ep5FKCpd9rkCm4GqUCI7rR4O5pOoEwG+82nGCidVHLWCBKnb5nhl06xOhTotbhm90l
         YtjH+IuHHgYi5m5wcfSGU/NqzPkbdpm9JPu1eCrozKqQbNF1J85wj+6IOa6/GYKpv55n
         utnHqXphTOoAGcnoSlijTo8CQndvHCbwe2qdiNEjctcvsVlrRWJAcH7TshOKrfjkSewM
         okB7zXUhqxjXps5bHKZGsZuBHFBATrt7XWLv5650TTxbPbqjXINt8iKSiYoTN+FwoTVb
         aWIWjxwwarS2yKaTxTvwz6VT28/ayY07SD+MfSh8QBKHRI9ByyZzOjoCJlwEwWFyiQnU
         zTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759752683; x=1760357483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYZVxGlTl0+DSff4UNw9iceKwlDH97VKpf3mwiOA6a0=;
        b=Dcb5vAjy7EeNgzLtBIFI8j8D3m0U62kCEuTVfF3tXw3D9uXQNitqYnoBBvnBgJBGws
         YwK10mWxZDpl8/f1l2Fq5fac4pdsE+dEq+RIIWvcw6yWe4VgE+xhIq0BL2YGXtZ07BT5
         qWuz6VKxNRqJBPsViUs6q9zgpSXRLHAcrcmvhoh4ZgRy1vYR8OgtSIbVWIBL9THQjC1r
         pA/OTOOFl8AWLPXOyL+nkfLGNyDglvzWcCeN9z1bfQHbvGFCgTFbkfFulCvq7MI3p+B3
         y8XkYuKEPVYFwOT+WuOFt5hsIoiAL8C62J3bS+8MC0o87oVD4HuKljiDvb3b9wWc5+zy
         LA3w==
X-Gm-Message-State: AOJu0Yx8b4PC5bEcYnuxEa6LFcn0nFrCiQZ0KD6GdbRCJXpL8lWUj0p1
	AXBjHEgOYdqCQl9oBUcZEpGChqKWN/QmabJ10ZjtW2vajNKhdNLjTMn+DvyJfw==
X-Gm-Gg: ASbGnctHx6xs+ZK1d/OcIOzCmSMxKXfTj9xGz12xMeZMco0lgxhKz/BpwpIdpXYIydQ
	Yo+QBAFHnGfIC3C13/mGPRrTUUaRYGpCk8XcvsyvLPLZxxPBncJ3zfvD20wHierPD4cns0y+wXu
	hdSqkJ+LtZx59lDQhfDoiRHcc8qqZR366UhXlpSPfku0EK9XOkPQ+ahrbY8c/F6/pMeB+zJpjaj
	icmiKJwQ5ohNCK0jZzO0azF2xKxW6BRz6xb7L59Z99SXAq/qiiLsHbLhfF9xZiHS1uKkn/t9uAg
	yI5e4LQiqtufXYjA0z1K+xIs9KAJFhbbKnFlJnJlzGCjvFmoWl6xG2WFdNNRuUt6ivVkEqdukYu
	RJ06THHdSRk5FSH/9v8NB5NK7sgnKkLV9S13uAssEAtmtjqfdL5e3bZ4=
X-Google-Smtp-Source: AGHT+IEUzonsba6f/bIERCQ/UmVaRy26giurwzazZTJGuDSBeqGMfGFqH6II/Acxw5N8DsD2BmoIcA==
X-Received: by 2002:a17:907:da6:b0:b3e:d492:d7b8 with SMTP id a640c23a62f3a-b49c45addbfmr1543593266b.64.1759752683367;
        Mon, 06 Oct 2025 05:11:23 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4fd9esm1134367966b.76.2025.10.06.05.11.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 05:11:22 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 3/5] emacs: patch CVE-2024-30204
Date: Mon,  6 Oct 2025 14:11:18 +0200
Message-ID: <20251006121120.533142-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006121120.533142-1-skandigraun@gmail.com>
References: <20251006121120.533142-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 12:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120287

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-30204

Pick the patch that's mentioned in the description.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_29.1.bb   |  1 +
 ...w-Add-protection-when-untrusted-cont.patch | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-latex-preview-Add-protection-when-untrusted-cont.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index c5318db96e..c4ae7be6d8 100644
--- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
@@ -11,6 +11,7 @@ SRC_URI:append:class-target = " \
     file://avoid-running-host-binaries-for-sanity.patch \
     file://0001-org-macro-set-templates-Prevent-code-evaluation.patch \
     file://0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch \
+    file://0001-org-latex-preview-Add-protection-when-untrusted-cont.patch \
 "
 
 SRC_URI[sha256sum] = "d2f881a5cc231e2f5a03e86f4584b0438f83edd7598a09d24a21bd8d003e2e01"
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

