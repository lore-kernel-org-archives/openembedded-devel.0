Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65CECCD195
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 17:37:19 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.715.1760895438440604076
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 10:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OHF4/bjn;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b4539dddd99so619038866b.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 10:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760895437; x=1761500237; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Lheu6bPPG+S403mzNgtAohmHDjdgMFRvgS2vhKCS6E=;
        b=OHF4/bjntX79bB/WVrAycETN8+RSCaB2N23Y+pNl0A+n6CbxL5GQs3Yy4Yt01/JNic
         qnvun6AiM5cx0HA1bMYHghI1EyNNayo/JsMkJXSvXOEeGKDa+aLTnDhyu781wsfsz1vG
         WmOKer4AQWlwtoo/4A2cYetQY0Vxj0wInh/qbqwWR7Qxxt/Q7fEEgi1nUXrsWUMGh8Tj
         GtP8YDRQId8WT2zKFcDzSRyz3z0/ndt2xkwcItZfbnMM8BorHFi331XcIqMdRMKBQE+M
         DnqbNz5rqF79QXLufMhqs0Nxr3Z/bTo9g4deEvilL9nDEAk2pkyBdodTVzQT8EzUUXY5
         UFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760895437; x=1761500237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Lheu6bPPG+S403mzNgtAohmHDjdgMFRvgS2vhKCS6E=;
        b=qO9r9n7WRyVT4D+/ak5xDkSel1EyredXHHJaL8ojp6dLDGP4DinYA+v6VjOnu5hdzw
         xmc12gK4IekLLaDgUOtPocNOZLdeNmuApVo8O1VDsCukKYFUX78zAdNHonq96sCCYYRT
         ayeH+v7CqkxaAZGwc8YMoWxKi6SNP8v8BU95FIw/RiqlIeIVB/Tu7y+u0O/nqbJc4+UV
         UF53WMnvddFl8MLDki3E0+OYGb6h3ZFA3V9XZC751l6DNDCtr1LNnCy9V8XgFW3/o+M4
         eJGtqOwLMlgtpo3g/g7kkp1W+2hyVJaEwY0MHNGx9+rIsGkFVLsfzoOSgTKlpla6pu9W
         3GJA==
X-Gm-Message-State: AOJu0YwjXgHY7u4ID3bWSuQhEaQ/7Nb8vGStFbUTXJMTHVZsoN+sD/Ej
	gcNOufcQgvZlZ4kD76eahI2CCoDL3VaqeI5MNcLl0azVIqpH308wDZMyoz5otA==
X-Gm-Gg: ASbGncuutMgddN6A/jeT/qowuZiKlZ0eOCkt8rgp+ibkVuE0we3T5HXOhd+8esQDb9d
	+0zdafv4AjkEIn1AuNYd3Z6uG+ZEBtvQm0wHX3YLjgOgcqYtgUXYLSQMZkw0+wGYiY33RnDh0cW
	qUFJYL/wcczxZ4V8miZOgrCuuycMfAonPDZ9sDQJuSbQDah8HhomtbN1laGPebb3+pe+DHKcl17
	aUV6Or4u2JrYftGCe8b4jYhSmG2lvp8fFJe4fUCg2dk4kJlzz8gQLBV1mz18f3Bf70gy/FMJKBx
	EkCHP2rxc85nGKpJDCRU10oNLwQe734wA0mBI3sW5W/52X9c19i9sK0v2032JY/yCqrBBCIlBfd
	HJdr2/mNUJHiL4DKL7NuJbwau3/Zuh+QWSsZGpGJ6Ws1CLgB6hd75fCCsRUcKV9CSL3wJizGtIA
	==
X-Google-Smtp-Source: AGHT+IFdgBawcLEKsnJLM9owJEE+DHjg//i3DU6cANqzPaWHVoSp0ASHtX7OF/FaxThn6JRqB8SQjg==
X-Received: by 2002:a17:907:72c6:b0:b2d:9286:506d with SMTP id a640c23a62f3a-b6474940b7dmr1219235266b.38.1760895436726;
        Sun, 19 Oct 2025 10:37:16 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036884sm546101966b.40.2025.10.19.10.37.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 10:37:16 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v3 5/5] emacs: patch CVE-2024-39331
Date: Sun, 19 Oct 2025 19:37:12 +0200
Message-ID: <20251019173712.1460844-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019173712.1460844-1-skandigraun@gmail.com>
References: <20251019173712.1460844-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 17:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120807

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-39331

Pick the patch that's mentioned in thee details.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs_29.1.bb   |  1 +
 ...abbrev-Do-not-evaluate-arbitrary-uns.patch | 71 +++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta-oe/recipes-support/emacs/files/0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch

diff --git a/meta-oe/recipes-support/emacs/emacs_29.1.bb b/meta-oe/recipes-support/emacs/emacs_29.1.bb
index abc99d3e08..23388f309b 100644
--- a/meta-oe/recipes-support/emacs/emacs_29.1.bb
+++ b/meta-oe/recipes-support/emacs/emacs_29.1.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz \
            file://0001-lisp-gnus-mm-view.el-mm-display-inline-fontify-Mark-.patch \
            file://0001-org-latex-preview-Add-protection-when-untrusted-cont.patch \
            file://0001-org-file-contents-Consider-all-remote-files-unsafe.patch \
+           file://0001-org-link-expand-abbrev-Do-not-evaluate-arbitrary-uns.patch \
           "
 SRC_URI:append:class-target = " \
     file://use-emacs-native-tools-for-cross-compiling.patch \
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

