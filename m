Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8FBCCCD1A7
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 17:37:19 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.714.1760895437812323455
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 10:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eiHikviP;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b456d2dc440so573296766b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 10:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760895436; x=1761500236; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYoCXOumnYELXiTKxkvBrQSAUPNxHqbkZJ4/VvMw4R4=;
        b=eiHikviPM6wZAXs4y2E9ZZ4dZ4WOTK528sUAhaK54qm6jWetvKsULFCtT71ovu/Aha
         SCIhBQBKTx3eHBbKWLlZCz07Li5l/0G66guqi+NPmjehPPK8x3AqX7DDE5zk/T/SFlkZ
         kEyDO9leEPmumQdV9Sw2PV2tx2hr6esJdiCxwgxLqLmOGhpRbabtNbo6ZuYexhSF5zb5
         SZ6Duq2ZFxiD4811GwIlOg4DJZEmrY+cV12Q0ICXIZ7rPwg700Ic/jEJA0Hfky3/+4lb
         ZWeod3/bqmM517e7lPC79yYOAritgLm3Jtbce5GA65D8+sDfVhkjOBeScUKi1dDsNfy5
         ttSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760895436; x=1761500236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYoCXOumnYELXiTKxkvBrQSAUPNxHqbkZJ4/VvMw4R4=;
        b=f3hetEJOPJQMc6jUtxySJipJaKd4xGaM3CNS3kUqTTk7hkXCT7hIpVqnwEbdd7cQuq
         kqcreT7tG/VGAaswLljxRsr41v6Pd0d8ZBn2X4k59/myuLpGz3avlqnCy6Au6uoaDmT0
         PHOtjIbW6J02kUg2/s3qUuao8RPnYldUSDIN/V36sZ8bloN8VeDMKiIXkq3TVSUpskhk
         /4rq8yyvm/jWUA8doHfNxbSAGusH4pLHKC6J2EeA/9kCJqMe9zWYqG/YWoiPLz1bAPMm
         l86b7UIySzCw/JPjhwILAU6WOnP8ivyQ6tI31Pe6O+G6I1Kv3yupZjnWTQbcMzJ0gx9x
         nCOg==
X-Gm-Message-State: AOJu0YxSXfpnJ2Xg3ncdZn1cyKu0UPnWUjZfXTynf1Dq3FYJsfyqMMpi
	bDIcVDotbsB7teRtR8DkP0mh5DF1ASfPEfbpV0uKNHrWVmucIAzW4KCAJ7Prjw==
X-Gm-Gg: ASbGncv1SLZEmWwjp0Bvoltk7ypnt616GkdsdBbcgU+6bvc15uSbjRrhFtKd5SHjPkV
	0Lid7Dcgvs94YnV6KZXLHvLB31lAX77EJf33FSUusGRo0E3vgNtrc92yW8Hr+8FPb1x+4rLR0MA
	sRUqzUKj5QeEfqDFqzZB1OeEmm7WhiPpb/zjSkhIb9zv+HQrL/gWrmwLgoJ92j5lpSpAvgD+Ptu
	vJpthPcl50STMtV0ShpkvkFdBwjMDgEVfsciohXspJ9k5mXLfZcgsqCsnEGz4TpqApydm2nRC2v
	DuSf7TzM8K9rZ0S4WGDZB0BMxd20NRzN4veivVp7Dw+HfDLwXOoTWuqx4HGNJvcZivDxDHVAEdU
	Mg4+t1G7oOt7QDam5W1vGfYAq4rd5MZaxSoI1sFbkYfu+X5CZqzK7Q1EYjId4jPo4Ce1hFzvYbI
	s1NCwxfWGk
X-Google-Smtp-Source: AGHT+IGcA8tv0N0Sn9vakzyJ82juu63X6DCA94+lIvDOPvRcpGkmZSI68MdIcNx6YxcmXWNrC3w6UA==
X-Received: by 2002:a17:907:26c1:b0:b45:60ad:daff with SMTP id a640c23a62f3a-b6473631232mr1118892166b.28.1760895436042;
        Sun, 19 Oct 2025 10:37:16 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036884sm546101966b.40.2025.10.19.10.37.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 10:37:15 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v3 4/5] emacs: patch CVE-2024-30205
Date: Sun, 19 Oct 2025 19:37:11 +0200
Message-ID: <20251019173712.1460844-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019173712.1460844-1-skandigraun@gmail.com>
References: <20251019173712.1460844-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 17:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120806

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-30205

Pick the patch that's in the description.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_29.1.bb   |  1 +
 ...nts-Consider-all-remote-files-unsafe.patch | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-file-contents-Consider-all-remote-files-unsafe.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index f0666a41c4..abc99d3e08 100644
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

