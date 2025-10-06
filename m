Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8364CCD182
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 12:11:28 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.32347.1759752684531553271
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 05:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IBG2mfjW;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b4539dddd99so638929766b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 05:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759752683; x=1760357483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOd8X4hlWb+B6JSU8cMmw8AMqnopnWgR2K0eL9huOOs=;
        b=IBG2mfjWxINpu/pj8NqwTSoqVytRC/qhbXBKsUMTQMUc3DfMXeKa9oC+io80rQyZ0Z
         udWBm25PAqDoXOnB1fZglytl6WNAlboj8lRr+SC/KYM6a+26c2SF1IvrRIoTNFVudtSs
         4/hh4k5yQ3xZdn4U83sapdn9hqztYti2mpN95aOinyVN+lB/HiXkl3tfW+KGgJ4+qWx+
         7cuqCMA6W/C+AhD6BT7mc6SJMJwvJISMtR23g6RZRju8/spU4MWf/UBilsUG37MZr0hZ
         s6MPSSSz0UJ/A41v+lk8Hqqtm2INzEZBl0gp623srdC1gSXYbssQCS2XfJUy82CbmEgI
         Gzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759752683; x=1760357483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOd8X4hlWb+B6JSU8cMmw8AMqnopnWgR2K0eL9huOOs=;
        b=oRattByYePMMT3mJyGUOFKQpsgtBhA021kXTeDvnqqLEch0PXYtnkhWZOge62KYmjz
         jXaBTsrkl1ChmaD6dg5HXUQHPMoSFOEJMe5ZaltIYXtcfWHKZ5zNpKIYIenHSnRSGkfR
         lJwz/zaiI/s8bhB/yOBk6Bo7R5Ou/EKeBtHOz6oSkj9/Snwz+GoXcbgFn8w1OoBaGL3N
         DReDUyJcmKzVye5YhMlecAAUJ+Fi0WwhRH1qYEfSPj0ACkuxDjxn/WIIpuID0xzotGVf
         ngHoFG09O5DsnObYkpScfsEoUWN1eg5RCYKncRqi7Pebegz0qgJQa1mxjWwf3Wtqrabg
         A0XA==
X-Gm-Message-State: AOJu0Yxoh1i/DavTxWcKaYvHOz7wcpUD1u335c+aXNLdN7wYUKmehke9
	optW0mBh2Oq3gdYAzPMfRVj8VzwCdCjFnnSagWmJsA/2cTozLRqN1pMd9tZKGA==
X-Gm-Gg: ASbGncv4LR+8YPleEZQ7+xV581DVszl49MXc9bvOF6b8sPWCuKmi4lHI8K30CpBFwdS
	1a1uqt904L0AeeoHMuaxvDB1Ir1NZWnYduitiRT9/Wn/GuC4rVgrWwWVaOcoH/AqaH39MF8H0UB
	vE3RIoO7b0RSgqHFY+hJx58R2X3L/eh1XzJ10TPmKDf5ZDh/vGiTSWiFlqmpQDT4+ZDnK1VGHxl
	3e0xjv1GPxDvLj457hf3NEewdLTO4l+4/YvaqujX01VHCJsW8HIn2UTiC+eUo0f8IYAq/K7m8ec
	CDM9XiiRa1kI/Ab70lIxoIbZAxlbjHgeUoMNeLwodp8CQ9RIrdg2JohWN7vyeZL8trLg9OMg4Kp
	CWu4VfRvCqGfLIpTKDmdou1PsUhGD0gx5WpHPQH0HYG1K
X-Google-Smtp-Source: AGHT+IHmfT+8T1uqlIlSlzPSOfSVECkxf3DRbodiOAqJ8uNN5M/EIdiuXnUBGNAJC0UVqYt+KRKcfQ==
X-Received: by 2002:a17:907:7f23:b0:b40:e7ee:b5ec with SMTP id a640c23a62f3a-b49c3255f48mr1481874166b.59.1759752682671;
        Mon, 06 Oct 2025 05:11:22 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4fd9esm1134367966b.76.2025.10.06.05.11.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 05:11:22 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/5] emacs: patch CVE-2024-30203
Date: Mon,  6 Oct 2025 14:11:17 +0200
Message-ID: <20251006121120.533142-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006121120.533142-1-skandigraun@gmail.com>
References: <20251006121120.533142-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 12:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120286

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-30203

Pick the patch mentioned in the description.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_29.1.bb   |  1 +
 ...w.el-mm-display-inline-fontify-Mark-.patch | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index 3701e17025..c5318db96e 100644
--- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
@@ -10,6 +10,7 @@ SRC_URI:append:class-target = " \
     file://use-emacs-native-tools-for-cross-compiling.patch \
     file://avoid-running-host-binaries-for-sanity.patch \
     file://0001-org-macro-set-templates-Prevent-code-evaluation.patch \
+    file://0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch \
 "
 
 SRC_URI[sha256sum] = "d2f881a5cc231e2f5a03e86f4584b0438f83edd7598a09d24a21bd8d003e2e01"
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

