Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F95CCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 18:35:16 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.26518.1759862113532222354
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 11:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YPYbBt0+;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3d50882cc2so1243003866b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 11:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759862112; x=1760466912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3lPyYUT7qROE6nMtyYgMhzbV1ecEInM6eDLrChfGArg=;
        b=YPYbBt0+0YY6oe76mev5feEyDL2wuWksCG+6dalyLeeLQR8tUpP1wE1FdENIFxxQUW
         jBE2bib37FyehQtwYqfS2jNYBW9/qjPSOq2CNdAm+7NwQ+HfnENbRIP0wQNGJYV8cdqL
         f20bNBwGnCvLwRhzVl4Yk8wxvbZS1xtgcwau3CdWgGCki/2LEE9QqMdEzYdbMumdVpqA
         6LNj7t4ar2Fg8hWno97l8S03WaK9qG5H3S5NrJ262Eck4RJwZ1xU4oty/KjxY3aOPnh5
         J8SQadCtaz/zXOIFRMPuT/ktWUDZ2gyB+V6+bokonndzOpl+Tn2L5D1EhheYWt4jj8Fl
         D0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759862112; x=1760466912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3lPyYUT7qROE6nMtyYgMhzbV1ecEInM6eDLrChfGArg=;
        b=XcTmfEoTHmTmkNu0LFUM0w2I9EdwYyCBf4rmY3ULPuidsMUkJhb7aUMUWpDZVlRC/V
         miRRa99OpwqgOlxM8soKI4FV2vESc5XPoZsFqiCnFLybKyS0YpYotBUD9RFQ3CkyjDrp
         PA80O2XapqK6Ixf/IB9z9iiCKTMY9Fu2iOpCiguOFpNYRo2zocw8Maus6mCK9QJ6x6iB
         4zsosGY9lOiboNCO7pROU0gBwnLVxUz3Z6k5oOFVGN6xYhwh/ExpdHA2g/KrBxR7vRPb
         7bcd66g23Yq9ZJ4Zz2CgEfv5c/3uhzSeq/qOS7iJlx/XjTpx7ykgpleANVNtUpEIbLBV
         RZ+Q==
X-Gm-Message-State: AOJu0Yys8x1IBSrVCoTIomjI6SPzZ5gJnACgaixwl33Ujw2WRIkxkPHJ
	UED62L/jPR9NHCnflrHHZdqkUQhKo0QiHQZDQqvzQEflPjQDgemraDzkwTo+3g==
X-Gm-Gg: ASbGncstl009Xw0fyDEFJSPXFjpa97udahFYHfQQPgIhIuFwe1KkBYwmxljlWR7YH0p
	R1C5enxU8HbaR6PDqR5i6d/kNvIYQxnRx28vugCmyhqDR4rpWHc1Eiw09ohC07cx1nfYdL/ZrBE
	HienC6MUu+yGvSw1yx4VDnyCqdQ9U746X0HrgESba0WJZnravnHs1xJfwMw6I0ZAAUSRQwXXc8r
	f2MOqNdS5duVy/UoCPMG845RwstRVPyLjj+zHW/8fXhiGudBvCa7OTvC8Xm9LCQxxmaJkJGsZmN
	EsALmpaXd2rV/UYKv8+BFb1gmJP4i/H6HSkFE2MA/jl/+3oK8oC7len9Z6OtItU6DAyMrN5I60W
	+fsAH9YotEdcox5Mv4hfDIMZQMbk9GYLEPG2wBn+Sb7/k
X-Google-Smtp-Source: AGHT+IF5xEBWS85vA4ysnrb/k4oebafRYHkYKxN6bTslVg9fp4b6XK8dEHNg73WF8IwLnC+a7UmLoQ==
X-Received: by 2002:a17:907:d1d:b0:b3e:109c:6377 with SMTP id a640c23a62f3a-b50ac0cc054mr65446766b.35.1759862111541;
        Tue, 07 Oct 2025 11:35:11 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a177c9csm1468891866b.89.2025.10.07.11.35.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:35:11 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][walnascar][PATCH] wireshark: patch CVE-2025-5601
Date: Tue,  7 Oct 2025 20:35:10 +0200
Message-ID: <20251007183510.125424-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 18:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120344

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-5601

Backport the patch from the Gitlab issue linked in the details.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...low-fence-to-go-beyond-column-size-w.patch | 61 +++++++++++++++++++
 .../wireshark/wireshark_4.2.11.bb             |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/0001-column-Do-not-allow-fence-to-go-beyond-column-size-w.patch

diff --git a/meta-networking/recipes-support/wireshark/files/0001-column-Do-not-allow-fence-to-go-beyond-column-size-w.patch b/meta-networking/recipes-support/wireshark/files/0001-column-Do-not-allow-fence-to-go-beyond-column-size-w.patch
new file mode 100644
index 0000000000..0dbb0c2aa6
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/0001-column-Do-not-allow-fence-to-go-beyond-column-size-w.patch
@@ -0,0 +1,61 @@
+From ab395bb857bef8f06ed60eb6a4e091785c38dced Mon Sep 17 00:00:00 2001
+From: John Thacker <johnthacker@gmail.com>
+Date: Sat, 26 Apr 2025 10:01:19 +0000
+Subject: [PATCH] column: Do not allow fence to go beyond column size when
+ prepending
+
+When moving the fence location forward when prepending, ensure
+that it does not go past the end of the buffer.
+
+Also get rid of unnecessary branching and strlen calls.
+
+Fix #20509
+
+(cherry picked from commit 53213086304caa3dfbdd7dc39c2668a3aea1a5c0)
+
+CVE: CVE-2025-5601
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/merge_requests/19684/diffs?commit_id=8c186dbb381cf51064fa8dbff7953468d5ae394c]
+
+Co-authored-by: John Thacker <johnthacker@gmail.com>
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ epan/column-utils.c | 19 ++++++++++++-------
+ 1 file changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/epan/column-utils.c b/epan/column-utils.c
+index 5e5b298..4ebd2b1 100644
+--- a/epan/column-utils.c
++++ b/epan/column-utils.c
+@@ -646,8 +646,13 @@ col_prepend_fstr(column_info *cinfo, const gint el, const gchar *format, ...)
+       /*
+        * Move the fence, unless it's at the beginning of the string.
+        */
+-      if (col_item->col_fence > 0)
+-        col_item->col_fence += (int) strlen(col_item->col_buf);
++      if (col_item->col_fence > 0) {
++        /* pos >= strlen if truncation occurred; this saves on a strlen
++         * call and prevents adding a single byte character later if a
++         * a multibyte character was truncated (good). */
++        col_item->col_fence += (int) pos;
++        col_item->col_fence = MIN((int)(max_len - 1), col_item->col_fence);
++      }
+ 
+       /*
+        * Append the original data.
+@@ -699,11 +704,11 @@ col_prepend_fence_fstr(column_info *cinfo, const gint el, const gchar *format, .
+        * Move the fence if it exists, else create a new fence at the
+        * end of the prepended data.
+        */
+-      if (col_item->col_fence > 0) {
+-        col_item->col_fence += (int) strlen(col_item->col_buf);
+-      } else {
+-        col_item->col_fence = (int) strlen(col_item->col_buf);
+-      }
++      /* pos >= strlen if truncation occurred; this saves on a strlen
++       * call and prevents adding a single byte character later if a
++       * a multibyte character was truncated (good). */
++      col_item->col_fence += (int) pos;
++      col_item->col_fence = MIN((int)(max_len - 1), col_item->col_fence);
+       /*
+        * Append the original data.
+        */
diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.11.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.11.bb
index 62aec8f732..d0bc92ff05 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.11.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.11.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://0002-flex-Remove-line-directives.patch \
            file://0004-lemon-Remove-line-directives.patch \
            file://0001-UseLemon.cmake-do-not-use-lemon-data-from-the-host.patch \
+           file://0001-column-Do-not-allow-fence-to-go-beyond-column-size-w.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"

