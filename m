Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86868CCA476
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 12:06:38 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.32264.1759752395658363031
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 05:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UKt4/FL+;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62fca216e4aso11664446a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 05:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759752394; x=1760357194; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u48Y38JTCtbqBUijPbBEtWv8/S4cp7Nx8P9jYozjMks=;
        b=UKt4/FL+lvnS4wM6HbuoqrjpeRFLelVicx415blnQ2y9LTVGiJAit/9msqiF2Tw+fk
         oWU+kN+HC31+iFWrHn/qE+TcBlJ7bLqaBXnl6wysL/1nUuEJDiecqh1hCEsRzTX8OqIp
         HgwjX43N1CMObCuTUSDf6JRt6C8xM7stcWzINne/9pc5kX2prQXGO6FcWN/OlGba40Jm
         QeClHIb8ATFC3bLoCbm3ADLMJ5lkdB+X+lELrWnUlqzdZl31e7C9h2lZxQRvkZfLrlwO
         Kl7Vi6DSdVb90orGO9+1ASCGdaBzVKUlFdaYiPxBkM0ILESIYJqlxpq5lG5xoPZmBJPe
         OO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759752394; x=1760357194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u48Y38JTCtbqBUijPbBEtWv8/S4cp7Nx8P9jYozjMks=;
        b=gEN3PGxBHEnTxfhEGfvtw5zp03fxc9C/qun8O9za1tKVRLAYKP8H2+sOQdH1U4G8oK
         KS4SU23XaC/SyJnJ1cVHCi2S9fMdiRkwJHBAUZLfUXR2ysvlYsQsKQF4TBds8iyPOTUE
         IAjUDEmc5vXBVVF5PxfbKtm+q1BqRR/7SX3nBLSMRYTc+x1/exo8z3AtuCQ6dzWDKrdN
         4LxQaaG3i9YdZ6yp+Nj02LCnGevE8ZrHgKm+88DgS9d/0SSb2DHUCnnLXeEyDwOk1aAM
         ASQq5kk8xG1FpBrkAzUu1t/J8Q6XNNIv6covA0EWkAqPHUKdzDiIxSScZFW9a973AJB3
         j9hg==
X-Gm-Message-State: AOJu0YxiK1s8L593xtLlxIq7rxniTt+TzGzyjKL5NMSvgLvnxuaiNuII
	VoPnT5wFBlioaSJ8mOTIVU/BGcbuLEKDo5fMH+ndHkkm5vx3mESawwJtMg8CuQ==
X-Gm-Gg: ASbGncsBxLE8slzf9XA0QRBR5pKimcZw4fnGRjZzPTFrd9e0KUE8K2v/AcM6+Rnrzmi
	wwrIpz9D2pDguHoicAf76d3kyB3D/Z3xsD0Q/4n9lSmCiBZTLY1pz6fR0h2notZFdXtReoxOd+p
	YB1JVLUx1UfZD+F5s4A2j1BZIWeCmKY9JKCpk6bF/xyMTG4aVm8Xb9C2iy5hSl9KU8cuMnsu+MG
	eiM9NZ3rj4+0FqWCDUBqd5mj2lp5lQdlB8bLfSB1K4iNCzpsBBmXEn3dITzQLmJfmiOk9sHrrTx
	NcMYySF3lOJzdRinSS4g8d+hP7n+8oW5WxZOGnShBGquVAHo8haTQO3L0E15QSCc12ibEi3sjsY
	FqTFHjwaOJ7fmO0P2bPyY9aZWYQIWpDRMcuXmjILXP66BoPJ2vHrwQiQ=
X-Google-Smtp-Source: AGHT+IG7PN8IcQDXcAAFmK7vc2aoWA/qxidsrnBFF6S29ypw5+ebatJkgI3vckf+Utl93KDIEbeKKw==
X-Received: by 2002:a05:6402:13d6:b0:636:6e11:2fd1 with SMTP id 4fb4d7f45d1cf-638fcb65499mr15445653a12.4.1759752393813;
        Mon, 06 Oct 2025 05:06:33 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788110219sm9949748a12.37.2025.10.06.05.06.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 05:06:33 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][walnascar 4/5] emacs: patch CVE-2024-30205
Date: Mon,  6 Oct 2025 14:06:29 +0200
Message-ID: <20251006120630.414259-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006120630.414259-1-skandigraun@gmail.com>
References: <20251006120630.414259-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 12:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120281

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-30205

Pick the patch that's in the description.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_29.1.bb   |  1 +
 ...nts-Consider-all-remote-files-unsafe.patch | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-file-contents-Consider-all-remote-files-unsafe.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index c4ae7be6d8..704a8210a1 100644
--- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
@@ -12,6 +12,7 @@ SRC_URI:append:class-target = " \
     file://0001-org-macro-set-templates-Prevent-code-evaluation.patch \
     file://0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch \
     file://0001-org-latex-preview-Add-protection-when-untrusted-cont.patch \
+    file://0001-org-file-contents-Consider-all-remote-files-unsafe.patch \
 "
 
 SRC_URI[sha256sum] = "d2f881a5cc231e2f5a03e86f4584b0438f83edd7598a09d24a21bd8d003e2e01"
diff --git a/meta-oe/recipes-support/emacs/files/0001-org-file-contents-Consider-all-remote-files-unsafe.patch b/meta-oe/recipes-support/emacs/files/0001-org-file-contents-Consider-all-remote-files-unsafe.patch
new file mode 100644
index 0000000000..7408f0e404
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/files/0001-org-file-contents-Consider-all-remote-files-unsafe.patch
@@ -0,0 +1,38 @@
+From 3a3bc6df4295ff7d5ea7193dfe0492cd858e1664 Mon Sep 17 00:00:00 2001
+From: Ihor Radchenko <yantar92@posteo.net>
+Date: Tue, 20 Feb 2024 14:59:20 +0300
+Subject: [PATCH] org-file-contents: Consider all remote files unsafe
+
+* lisp/org/org.el (org-file-contents): When loading files, consider all
+remote files (like TRAMP-fetched files) unsafe, in addition to URLs.
+
+CVE: CVE-2024-30205
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/emacs.git/commit/?h=emacs-29&id=2bc865ace050ff118db43f01457f95f95112b877]
+
+Signed-off-by: Gyorgy Sarvari
+---
+ lisp/org/org.el | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lisp/org/org.el b/lisp/org/org.el
+index ab58978..03140bd 100644
+--- a/lisp/org/org.el
++++ b/lisp/org/org.el
+@@ -4576,12 +4576,16 @@ from file or URL, and return nil.
+ If NOCACHE is non-nil, do a fresh fetch of FILE even if cached version
+ is available.  This option applies only if FILE is a URL."
+   (let* ((is-url (org-url-p file))
++         (is-remote (condition-case nil
++                        (file-remote-p file)
++                      ;; In case of error, be safe.
++                      (t t)))
+          (cache (and is-url
+                      (not nocache)
+                      (gethash file org--file-cache))))
+     (cond
+      (cache)
+-     (is-url
++     ((or is-url is-remote)
+       (if (org--should-fetch-remote-resource-p file)
+           (condition-case error
+               (with-current-buffer (url-retrieve-synchronously file)

