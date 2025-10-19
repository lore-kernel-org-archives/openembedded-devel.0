Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B289CCD184
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 17:07:49 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.190.1760893662456549370
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 10:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H1mE+JwV;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b4aed12cea3so618253366b.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 10:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760893661; x=1761498461; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNWhniv2B+4QOIAgIjkLoSlMjj/5Y62IWbW83+gVBII=;
        b=H1mE+JwVjrsoYtehjgBgaxV7MMFcCil44NulBsgBIZS2yus/vRiRiV4wjXEV5prRwU
         +A7Vgn7ojCb/JJAaAB/Y7EWrRg0NvLSM/iw9ypJqYsOMRIzy6W4jddOPMIw28XXjFJdV
         t+s5qF/C2lu2xuttENcW/gWmcC3m8WpwqoizU1XUNH1EFPBfkfscWJOE/36y4KhFOyMV
         VCEC25MSmPwgBQmEni5eTazb1gzNHLX+ES8lFm+AQLjBuYuiaYqC+V4N/c6w6g7/aV/K
         HM4DRgbjjiA/5ALVpACDJJ2V8zwOWtfQQ9cjXeKnfsK8X/FEXlNfZNGkj9ih5h+nyHhw
         dS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760893661; x=1761498461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNWhniv2B+4QOIAgIjkLoSlMjj/5Y62IWbW83+gVBII=;
        b=Hvolil2EPP6Bb2/xHVTwax5u9UOauBDfwQP4ze2NJPLwAnb9yZgVUMxpHdsSoR1ZQa
         wK9fpxJDJxYvsTiIpdVaSv0AVJs34AWKJemO2Hvk+1zej/LCN868ENjR4YoZNL0YchZz
         Y6yAEsZsLBADqgxitksrIO48FQssKXSf/K/Y2sR4MLymsFt9M3c1ugaZUcGt7oPPjsLp
         TWQYG4+Ai/Qfv1YI8GhuucRQXJ08IW881tMUGe4bMyy3KJlZgDUsUFkrlwEwGDEzTbnp
         A3lr5X87Wa8TwACg0K8a9QXVUxq+XWZnoLSEbNDcEPPBrCWONqxF0TjjhbFu1Ocn1amJ
         k14g==
X-Gm-Message-State: AOJu0YxGBS56QGi/ZqCCz/pobjzqmMs/0PCRLZMYQU4Mi8ueEqBKWbC0
	ue06Hk1mR5EuN0AlvccR071u4TVesXNbQpD6zHqi0T7tyQvGqDtMBWkWAsmUmw==
X-Gm-Gg: ASbGncvWTTekmcYI6f1BmPLzzj8Et+SbRNCtAmWeRk/1gdr4lp/qg9pZre7TOlZNcyy
	8A/vnfuPUpzlRgbhs1/4sZRMaSu59nLjSnFL1kCNVCQ1jXpcHlr2CKFu/wIJt+QXnxrClMH6gHo
	TpWvqQk8WNf7SY7+fKYsJ2guca/vDyOhmkxEodEBxN0WoT0njIwzoTkME0b+qA4RtwvKVE2vN1C
	5QaqFwfdwZV4VgfU1jbHmCVL75SMcvXM8IDH01hnqeysQ/Ycpia1eRY8zp/+Fn1Gd32F/1J4fSC
	nz50GD2cX6cHwqxXqopl1mHO/mqTmq7EwvfTCJKZbqM28hE1+ZoYxp/XIWFVuVVxaZBWLuBFbjt
	50poHI3Pj2196vxWMqu47zjSXQ80BNOICH8FuAcZzEkqFC0+iN0i+6vLG1OlTt6NlGwGgCNVLCA
	==
X-Google-Smtp-Source: AGHT+IGabjR7B6LxqQVfDaOFu5tH2qcPej3J/EaAmLvxcqGYlFfq4DQjNgKdMAkhlf1RFlWcMaox0A==
X-Received: by 2002:a17:906:f5a1:b0:b57:2d81:41f with SMTP id a640c23a62f3a-b6474b3602bmr1232003966b.40.1760893660688;
        Sun, 19 Oct 2025 10:07:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebb499dasm556206766b.73.2025.10.19.10.07.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 10:07:40 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2 4/5] emacs: patch CVE-2024-30205
Date: Sun, 19 Oct 2025 19:07:36 +0200
Message-ID: <20251019170737.1311808-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019170737.1311808-1-skandigraun@gmail.com>
References: <20251019170737.1311808-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 17:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120800

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-30205

Pick the patch that's in the description.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_29.1.bb   |  1 +
 ...nts-Consider-all-remote-files-unsafe.patch | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-file-contents-Consider-all-remote-files-unsafe.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index 0af77ef05d..0a88b0282a 100644
--- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
@@ -8,6 +8,7 @@ SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz \
            file://0001-org-macro-set-templates-Prevent-code-evaluation.patch \
            file://0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch \
            file://0001-org-latex-preview-Add-protection-when-untrusted-cont.patch \
+           file://0001-org-file-contents-Consider-all-remote-files-unsafe.patch \
           "
 SRC_URI:append:class-target = " \
     file://use-emacs-native-tools-for-cross-compiling.patch \
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

