Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E61CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 12:06:38 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.32268.1759752396623713571
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 05:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ROWcacWf;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b07d4d24d09so905868766b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 05:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759752395; x=1760357195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDHBXfgeEIZbSiJlGa2OVG3tnRx3AQObA/VA0qL6Kjw=;
        b=ROWcacWfo/ZNNmqDgpNYXof0zwV3/DjWqk/dDXhPVhQI2pSSJOR9ycjDQkb+KO5Pwh
         WFrpzb6n9oIa028xB8iDdTT5nd6/Wt5rRDIi88EGUwPMtQBxTeUCVOKOzC4l2OLf+Ril
         kRzhEhj9l52guewT0YsXu0DKI3xaK5ZDWjlQsjXIiYxGK6/FIBI58huXuWMDq4n1ygWq
         CzE2nnmicKGQc2c/yIu2VAywbFLCqwqPw4vEFtp4VMf+/C+30th2NsqKqgnZ65rtK7pI
         GEn6I6jOG+2iud9p9O6/TzlOIOSjM+6dl6CZoWd/z7d1iUpUHikOwGBfLTq7xb9MuMwl
         +rIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759752395; x=1760357195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDHBXfgeEIZbSiJlGa2OVG3tnRx3AQObA/VA0qL6Kjw=;
        b=FqI9wSyvF78JFHrtS0eLsue+CMCHErZ7sNfIHRiBrNhYsqE86ySvh1RtSHlGSzE5Pw
         ZISHF22ZR+NBm+AIuQOI+eua1Cj/lWjN2VRAfVX6oCAI8dTXF3CRlGM93aHwkBbNhOlO
         Z+Bs2o2gPSm0YQYHnm/ckwzxtJf3NNRhRDoygokCvnlANpiaBaO7mLb3rzEOxX6OCu7b
         Zpt5zejBnUIVivAwynrqpVg7TFXHJUrbj+PQB3GYCzHZSGiOpBzKsdI4oimXl3idDOrx
         ogVwir/OM7SPGNrvtCWJcnEWqiDVn+dlQiKqBolUvQIZY+Wr/wzKwy9Dx27zoKhICJz3
         Em0g==
X-Gm-Message-State: AOJu0YwYqKrbpWw3lHazBjjgvezBk1tgRySJliAlLx34LHgBJ6Nu4mVa
	yc75mWujyqgUjt21bGJEBVniEjai5Fe4yFyhGjhe+kDawV64hFgbemSvRYYPLw==
X-Gm-Gg: ASbGncu/oosFgVqp9Ap6raTbn0QR50gEvMF5+52Hxfvl7UZwYBVMb+RHykMJqeUHN2Z
	1pC2j30FRuYVa2tbY5fp2GsZnNTroR7bECwgUHl7rEIBS2Jo/YQsy3H5AAjXw1ndVi49r9GHD8L
	Zz2GqT6fCuA7VP1br/6xMon3Oyf1LnRmhSLk8R4hMBGAHlVYdfH6hYjmijEjaQFYMROrSPHby/H
	DZsF9IHm9FRRjQj+sr83PfnMlRw0h4HrcNRIAGiFN1YvfFZWQBsZibucE2OFrG5eb28+qaBJ7H7
	9Yc44rlDncQjxbk6IQgFNPWnfMLSNiDVi69nFM7zbnHsV5ZSH4aSfPqpSA1cgkGgzMLg7Fy51mB
	7HIezLRRL+H9qoYh3OD4MjJYPyy1u1vJOo+sW+Ndd/Vkp
X-Google-Smtp-Source: AGHT+IF9civpNHdzgHEMoa1IQeCBAk7Nl3F7Qj6I7VBJ7LprP5Fs3YF7LLj1M4e4WT+XYw48iWwtHg==
X-Received: by 2002:a17:907:3f0a:b0:b33:671:8a58 with SMTP id a640c23a62f3a-b49c374019dmr1498516866b.37.1759752394623;
        Mon, 06 Oct 2025 05:06:34 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788110219sm9949748a12.37.2025.10.06.05.06.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 05:06:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][walnascar 5/5] emacs: patch CVE-2024-39331
Date: Mon,  6 Oct 2025 14:06:30 +0200
Message-ID: <20251006120630.414259-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006120630.414259-1-skandigraun@gmail.com>
References: <20251006120630.414259-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 12:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120282

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-39331

Pick the patch that's mentioned in thee details.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_29.1.bb   |  1 +
 ...abbrev-Do-not-evaluate-arbitrary-uns.patch | 71 +++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index 704a8210a1..10c148b216 100644
--- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
@@ -13,6 +13,7 @@ SRC_URI:append:class-target = " \
     file://0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch \
     file://0001-org-latex-preview-Add-protection-when-untrusted-cont.patch \
     file://0001-org-file-contents-Consider-all-remote-files-unsafe.patch \
+    file://0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch \
 "
 
 SRC_URI[sha256sum] = "d2f881a5cc231e2f5a03e86f4584b0438f83edd7598a09d24a21bd8d003e2e01"
diff --git a/meta-oe/recipes-support/emacs/files/0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch b/meta-oe/recipes-support/emacs/files/0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch
new file mode 100644
index 0000000000..88fdaaf22d
--- /dev/null
+++ b/meta-oe/recipes-support/emacs/files/0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch
@@ -0,0 +1,71 @@
+From 8b8866eb94c7b7140ba94eb2b4e6ead14c0d986d Mon Sep 17 00:00:00 2001
+From: Ihor Radchenko <yantar92@posteo.net>
+Date: Fri, 21 Jun 2024 15:45:25 +0200
+Subject: [PATCH] org-link-expand-abbrev: Do not evaluate arbitrary unsafe
+ Elisp code
+
+* lisp/org/ol.el (org-link-expand-abbrev): Refuse expanding %(...)
+link abbrevs that specify unsafe function.  Instead, display a
+warning, and do not expand the abbrev.  Clear all the text properties
+from the returned link, to avoid any potential vulnerabilities caused
+by properties that may contain arbitrary Elisp.
+
+CVE: CVE-2024-39331
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/emacs.git/commit/?id=c645e1d8205f0f0663ec4a2d27575b238c646c7c]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ lisp/org/ol.el | 40 +++++++++++++++++++++++++++++-----------
+ 1 file changed, 29 insertions(+), 11 deletions(-)
+
+diff --git a/lisp/org/ol.el b/lisp/org/ol.el
+index 9ad191c..c15128f 100644
+--- a/lisp/org/ol.el
++++ b/lisp/org/ol.el
+@@ -1063,17 +1063,35 @@ Abbreviations are defined in `org-link-abbrev-alist'."
+       (if (not as)
+ 	  link
+ 	(setq rpl (cdr as))
+-	(cond
+-	 ((symbolp rpl) (funcall rpl tag))
+-	 ((string-match "%(\\([^)]+\\))" rpl)
+-	  (replace-match
+-	   (save-match-data
+-	     (funcall (intern-soft (match-string 1 rpl)) tag))
+-	   t t rpl))
+-	 ((string-match "%s" rpl) (replace-match (or tag "") t t rpl))
+-	 ((string-match "%h" rpl)
+-	  (replace-match (url-hexify-string (or tag "")) t t rpl))
+-	 (t (concat rpl tag)))))))
++        ;; Drop any potentially dangerous text properties like
++        ;; `modification-hooks' that may be used as an attack vector.
++        (substring-no-properties
++	 (cond
++	  ((symbolp rpl) (funcall rpl tag))
++	  ((string-match "%(\\([^)]+\\))" rpl)
++           (let ((rpl-fun-symbol (intern-soft (match-string 1 rpl))))
++             ;; Using `unsafep-function' is not quite enough because
++             ;; Emacs considers functions like `genenv' safe, while
++             ;; they can potentially be used to expose private system
++             ;; data to attacker if abbreviated link is clicked.
++             (if (or (eq t (get rpl-fun-symbol 'org-link-abbrev-safe))
++                     (eq t (get rpl-fun-symbol 'pure)))
++                 (replace-match
++	          (save-match-data
++	            (funcall (intern-soft (match-string 1 rpl)) tag))
++	          t t rpl)
++               (org-display-warning
++                (format "Disabling unsafe link abbrev: %s
++You may mark function safe via (put '%s 'org-link-abbrev-safe t)"
++                        rpl (match-string 1 rpl)))
++               (setq org-link-abbrev-alist-local (delete as org-link-abbrev-alist-local)
++                     org-link-abbrev-alist (delete as org-link-abbrev-alist))
++               link
++	       )))
++	  ((string-match "%s" rpl) (replace-match (or tag "") t t rpl))
++	  ((string-match "%h" rpl)
++	   (replace-match (url-hexify-string (or tag "")) t t rpl))
++	  (t (concat rpl tag))))))))
+ 
+ (defun org-link-open (link &optional arg)
+   "Open a link object LINK.

