Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F68CCD1AB
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 17:07:49 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.195.1760893661135131776
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 10:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mvgCAisP;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3e9d633b78so876702566b.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 10:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760893659; x=1761498459; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xnG4PhdZvzQB5rN4dfICF0h2ooGh3vYfTfk6YB6TJWw=;
        b=mvgCAisPqmcJO6uBQxFy3Rk126b1T/YuA8jKPuuGLZF2DXI80XUStzvCiSx+lCxzdX
         oOkl2jBG+UiGQ834PpHqdDe0FEI+xmSkS8xYM0o89g3rewQlwWYZknmuT3gXqZe9aVTO
         XJgOKs7Eyu3x9bYUXyqx+tzz7q2IugE7iihMIyMhndjv17oNfpvz9titIo/N7ohCay/B
         0gjJWvEk1IlwwLxLud9izGDvldzx0RZn60tSyEh6g2E8rWTqlCBE7GKlyHNrFXFNHhSu
         YLo5Evrtx4uCAE3QCLs4uF7XjvNeCiBxLk0KEtECcMVk+Ya835/ahT5Q+eNm5ZTybYV9
         nyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760893659; x=1761498459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xnG4PhdZvzQB5rN4dfICF0h2ooGh3vYfTfk6YB6TJWw=;
        b=u9D9m0OB6YWGibQFCe31UEtaKPHYhPIIlMuxp+Y21+785xuQyv+xIZPfssGh8uIqsW
         qEuA/Da0xHKVBcqlEIEEoBfXgclOhNh1c4XbzAcrL5M/89eEqX20eH5Dy5YLB0atgJNW
         up5Lee1pA/ZzZCne2h7FrH1cKOGE9IEGhAooyCKi8b1S0CdIel67XBgAI+8EFzBt+5Ly
         uWV4ce2OFr4T/onMVM+Q5mNmp+oJelEvC8uvqhhsC4LQjU+/LXoiQqcmLuxtOuDUZv8c
         VLfbPnPW9hFLlGrgVDMMNCtS2ygL4a+fCSzP4OWmWH3Xhfao37SleCtHGyk8cq1kJLBk
         5FNQ==
X-Gm-Message-State: AOJu0YzBpmhIsVHBnRtpdZPfzpP5Emkhq2FzLHU2N7zx1sEyTDUqy/dw
	ry+4TZBL9eXOmBjFKkhjsey6FTRD7cOMUdEJA4G0psSB9M3ClA3TMEa5DFFohw==
X-Gm-Gg: ASbGncvXxfCxmE4H8zi1m4OQmMi6SpI1aKdRVwr/5MEpfGVZCK7Nxs6/ZlVTBmf488o
	YEL6nEc6apPoHKr4Q3qUf9msRqlkfHqIEQp/KT3Ae2uJyqfmW7qgQVgIEoQF05B8zZJKvryn1Hu
	qTB4jhHPufzC1l9EUi0MTXLl8uO3LPru3l5rihelsMBd9xmzpnO4B7ycpOX6TRjXeBsHemKET3H
	WSAi+r+6JPrg/9xWIkCw/5tYFF8td9vyYNBiqnAQacYvGeXUJ/5VaXmWi6vWWFWuGPwxCQFsFh7
	AI1/+YB4km3IehG+xetPWccxccGdWJwlRwXugfSh8/IpaAxWgN3o4XRJ5A/Kbsy3QkWvc7BuoIv
	UIxYkeVwUEzs1oEN08cC9MYydCXjMEFtKHF10kNNVoXR6IY3JVAeqbMo4HLYH3mYJZeSJQxZpy+
	CA560N7Tnh
X-Google-Smtp-Source: AGHT+IH8FIIOCbCM7b9gjzCoZygyFoddbdg6W+PRisH0OziJ36lHrq9G0WOXD+TfYFISf16hAtr9CQ==
X-Received: by 2002:a17:907:c786:b0:b4f:6d1c:6f4d with SMTP id a640c23a62f3a-b6051dc37f8mr1574692666b.5.1760893659476;
        Sun, 19 Oct 2025 10:07:39 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebb499dasm556206766b.73.2025.10.19.10.07.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 10:07:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2 2/5] emacs: patch CVE-2024-30203
Date: Sun, 19 Oct 2025 19:07:34 +0200
Message-ID: <20251019170737.1311808-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019170737.1311808-1-skandigraun@gmail.com>
References: <20251019170737.1311808-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 17:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120798

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-30203

Pick the patch mentioned in the description.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_29.1.bb   |  1 +
 ...w.el-mm-display-inline-fontify-Mark-.patch | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index b1b795dace..c3f36007f8 100644
--- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz \
            file://0001-org-macro-set-templates-Prevent-code-evaluation.patch \
+           file://0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch \
           "
 SRC_URI:append:class-target = " \
     file://use-emacs-native-tools-for-cross-compiling.patch \
diff --git a/meta-oe/recipes-support/emacs/files/0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch b/meta-oe/recipes-support/emacs/files/0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch
new file mode 100644
index 0000000000..d951bf4205
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/files/0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch
@@ -0,0 +1,27 @@
+From 0e7fe7809daa123921faa0bd088931cf8ddfd705 Mon Sep 17 00:00:00 2001
+From: Ihor Radchenko <yantar92@posteo.net>
+Date: Tue, 20 Feb 2024 12:44:30 +0300
+Subject: [PATCH] * lisp/gnus/mm-view.el (mm-display-inline-fontify): Mark
+ contents untrusted.
+
+CVE: CVE-2024-30203
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/emacs.git/commit/?h=emacs-29&id=937b9042ad7426acdcca33e3d931d8f495bdd804]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ lisp/gnus/mm-view.el | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lisp/gnus/mm-view.el b/lisp/gnus/mm-view.el
+index 2c40735..e24f3f3 100644
+--- a/lisp/gnus/mm-view.el
++++ b/lisp/gnus/mm-view.el
+@@ -504,6 +504,7 @@ If MODE is not set, try to find mode automatically."
+ 	  (setq coding-system (mm-find-buffer-file-coding-system)))
+ 	(setq text (buffer-string))))
+     (with-temp-buffer
++      (setq untrusted-content t)
+       (insert (cond ((eq charset 'gnus-decoded)
+ 		     (with-current-buffer (mm-handle-buffer handle)
+ 		       (buffer-string)))

