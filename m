Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930BFCCD182
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 12:06:38 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.32325.1759752394901426284
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 05:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YmbIu4qt;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62f24b7be4fso8752464a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 05:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759752393; x=1760357193; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYZVxGlTl0+DSff4UNw9iceKwlDH97VKpf3mwiOA6a0=;
        b=YmbIu4qtgZsg0T5HFu6EANQ013CtJtGRJOtAEjWKfM2S2s6bBknwQVD4KHpgotsJ+b
         OAU4xd+kCvaVIV80kxz6zBqpC7NPPpGRTkPc8EnNJiDXxPuRr1xi5fWT1fwYwanmC32O
         sWO9tzhwn2BD23Zt2PNetz+4/Awz9Uk3pcr49425+2+Uyt62y8eLC9qAN7na3Q2LRwoP
         PsT4+MP8zPhlgosZBCHjZCEurgOOrRZkHXXIi3A42QVbCkMnRXzJDdskqkellx3EV8ng
         Ger8i5JpGjqdV8MWxu0iJj8Jtid6+vz0qO707U1cpWYIcjD37dKPH58ZbLz1x/GKtmkY
         Cy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759752393; x=1760357193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYZVxGlTl0+DSff4UNw9iceKwlDH97VKpf3mwiOA6a0=;
        b=DyW8xM/SOYQ8VW3IqaO3ovABUOCh56VkXgst8I2EUqEssoS/7Q+gLBVf7cDF/XDPVH
         GusExlxsJ9X5uYnhbMnaKwhyItTdJHt2zibn/fp1RYexJ4m7w7JXUDoob0RLChlhg97Z
         vuPyjyStaEhYJumQOsJmBIZVS26Gq2O8lBdbwk2pcpEsBBT7FE/LH7ILXQWHufoXJY0C
         Xui/JJDDNvKgvquBwb/30OFoA/UsMe5F+u1zwHxrKuZ4oLuVZ4IxHhC34akw50nn/aSO
         LZ6H4rKZqEzrC5K4in/u5CNn2u2a4BqQbsheF8GlXW3PKmrE+P+dWU/igdZBLSkunkWF
         /Smw==
X-Gm-Message-State: AOJu0Yxwxl6EhCrO7b7eq1N+aUzXqQMXrrMEm6pG+Nlw/OAao0AE2UDu
	Mshgu+rifz4H437jmxzYHMypPKfepW+gnJDhuMPebN9QlIpVxXRWt+fJCDxlPA==
X-Gm-Gg: ASbGncsiDcdunQyOfgxRUDyVk9W6zFMNPUxzZimuGbHIRuWSAEYMlKA+LlP5bRJYX2n
	qWvVKzwFHEgWbBtWaR28lFggNL9qZjc2L09q0ZHlGm1DNWf3nhSDVvgJy78ASM0SWSnJFGmrdSS
	N6eBJ53TCVnQnVO1+Lsovay7AnJkjCRgngmV4fKZYDt36MghMCNu7DgKKbhqOUryDsMocWX9j3/
	k7B1ssCZP2QgAIjfHk8p/xE0zvbSdC5s4MxxOePHVYCK1QbnfyLuaKysfjy3n01qI9Krsg36SuN
	rpJRIymShuDCCy57KCZxKIG4wXin2jqzF2g8qkQRg0eVBKAZvYqsJtZq1Ta4TTqz8paviE9rX1H
	oR9WamDmxYaDmh0KuN2DTnYXM4p2kipkAkqjBxJ1+oaZtHb7QnM6+s/k=
X-Google-Smtp-Source: AGHT+IEeu4/DfOX/rkATZ5nH0kk+p1k4/IAqOJ7Bm/MQdYTq2vk+X9A1JupD1YSi8dDcB68OI9mwOA==
X-Received: by 2002:a05:6402:34d5:b0:637:ea39:d73f with SMTP id 4fb4d7f45d1cf-63939c233c5mr13013670a12.18.1759752393061;
        Mon, 06 Oct 2025 05:06:33 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788110219sm9949748a12.37.2025.10.06.05.06.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 05:06:32 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][walnascar 3/5] emacs: patch CVE-2024-30204
Date: Mon,  6 Oct 2025 14:06:28 +0200
Message-ID: <20251006120630.414259-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006120630.414259-1-skandigraun@gmail.com>
References: <20251006120630.414259-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 12:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120280

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

