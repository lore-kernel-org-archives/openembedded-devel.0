Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF167CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 12:11:28 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.32349.1759752685897001809
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 05:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SZyk3z06;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so855150266b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 05:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759752684; x=1760357484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u48Y38JTCtbqBUijPbBEtWv8/S4cp7Nx8P9jYozjMks=;
        b=SZyk3z06lolio//Z+S5VE5y2js9ZdUBTX3fwSGazG1ZOCI9WFTCcf5p+kcQkjq2L2l
         a49vYZHiqMY2rb5dSJGBeck7XIV/+cipXkd0b7JwG78WOZIYHP66p0iKayMB+Q9oUYLL
         JUJzjESYN0oBWLkkIroi6FcsesurFqQMPNbBQEIM/Y8j2XCQmGibetH/A47ZSxrOZufS
         8/rgCbZo80V74ZZln3w616UkSD8qHIH1ZSkdE4RY/lstv9tUldQWqBGGRgd7ymYOyTqG
         7jcF8nkMw4DkxrKao5aTWSNJ2/qKvX02s5ln/DXsYjCJ9y6BPMSVEIkSv9cOEOrWKM9J
         638Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759752684; x=1760357484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u48Y38JTCtbqBUijPbBEtWv8/S4cp7Nx8P9jYozjMks=;
        b=h+ZEafsSazXqykkHib09ncdtRpbMN5TYkFMgd71zuqiBDWFRF3iMRXLV/yCD4cqM/9
         LMWkwkhJdNVkIsm9ox8x49BZRDEFxW8qWhjyA2ghCrD1AG/MQgEt78f3C3nxX+ClwGjE
         GftIHiA/K0H3ZY/3GG0o/DH6LiHka5CXrskb8oeGpr8VBM+stwpWc/bHIIvNCl/gKCes
         GbeidFK4yv4FjwHCKTUSJ4zqXT7kHM0LyW1Sr30CxTsLYvUzX3DqzK/f/p/N/0C6P5GY
         0y6544wkhMkSPFoQEUA8u3GQglsdWz8CIcQIVxYbyn+YnltfSNP1sCVi1l0ODnwm/Jnk
         Lokw==
X-Gm-Message-State: AOJu0YxlmphcwQa6j6xHlPbRmGaV5trpUwG4lFriReslsdbsbh6JgZ5/
	oGDvBoOF3r9XS5+Mvaq8fEQHsXcFQ1qOzuI3Ob5WTkWFUfEPigp7K2RYFRDeMQ==
X-Gm-Gg: ASbGncsF7yiZ+WLPLhUvjw9afoqfvucNafku9lZFC20+W+YISeIiZHelKdR5V8EuyzL
	XN+csR2Zl+ockE8vL7r5fpRl+pJZett6bqBOFgzeQzbh2yw1Qs6dML4illnf6jpEjD3VgVFZgR1
	Baf9epoayRGCj41klZMtDJr1HfW7jsQA1FvchsIdc4pYZLN5iysZayq/m0PVCoJ711dZqhSgcEU
	uX6Q+W0K35ULU3yQI7r0ocbOT2DG6MQqMBROLnp2bQqzNALxYMtHGmtku4rToA0FLzK7QUbi/PF
	Jn+vJod04HfEK9Kuk4OJH2rYyRSGs3wYQqi5By/gQzpitbEEAHivwUR45jboywZBf8pmIpyIOmP
	h4c1BFyQaiiNfFYThONVQa3WgqwriLP/Xu2yKdZZPwDWmeHJBX4K+S0o=
X-Google-Smtp-Source: AGHT+IG+qlKecHaaSXpxAmYTaPcDDcLYWsbsUX9RdmwpGQhkqoxPliUZ/PnK3Bl4/DRsYWpFGWJxug==
X-Received: by 2002:a17:907:a4c:b0:b3f:1028:a86a with SMTP id a640c23a62f3a-b49c157e0b2mr1561394666b.3.1759752684081;
        Mon, 06 Oct 2025 05:11:24 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4fd9esm1134367966b.76.2025.10.06.05.11.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 05:11:23 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 4/5] emacs: patch CVE-2024-30205
Date: Mon,  6 Oct 2025 14:11:19 +0200
Message-ID: <20251006121120.533142-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006121120.533142-1-skandigraun@gmail.com>
References: <20251006121120.533142-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 12:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120288

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

