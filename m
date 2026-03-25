Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA1AFEA813
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 06:44:10 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16501.1774421045103566478
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 23:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cb8qIMvB;
 spf=pass (domain: mvista.com, ip: 209.85.216.49, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so270836a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 23:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774421044; x=1775025844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MUNPzf4xi1bVspxJfVQpTaO9Iicr8ruIqiwJU8MjSN0=;
        b=cb8qIMvBYUJjnarQmuqgFdNnAy91QHu992YshBZzbB3bk2UjxF6khLKIK9eBg4N475
         iB99JTw7dJ/M8YH4o/LvMX+YB/tCCrk3dS+uxVH1O2jCaJ/vDD9r8kBI5Lv2grSl/Ge2
         CjunoIuSJfeisWdXMAEp7bCmQYlx4/glCZ850=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774421044; x=1775025844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUNPzf4xi1bVspxJfVQpTaO9Iicr8ruIqiwJU8MjSN0=;
        b=kyIj96wFSWTEkdB96EvBN6iseXVEjIPIBmchwVP/lGEPzAtfkAPXos07QMAhzpwa+M
         nkfbZAYVjvmIMWJnsF+czsFH2IO041U/+xyBx4fF72hqVlnYVOmR7yNMSPbK8h5Ejy2+
         ZYOq+MLFyMKIqtX3NKbiVveKKosFQY76q6uckhaO+a3d9MaOc6mv2nK9lsR15CX6udPM
         x56frhfCM6chSdPDt/2grZLLaLEdm/2B23lMlbfk1nHOoJGqhVt0qNrIx6ypjEzsBee0
         TZZSxwagnsRxzkP3f6HeV5vr3ZMrFLTYQkshuZ5xh9ytA5fykpV82ldhJXCmPzCbyBeM
         mygQ==
X-Gm-Message-State: AOJu0Yxu+ByFGFPsuC59ma8bFO9p5HrS2NW6BDkEEnOw7JfNNPSCIa7B
	6/HM9qDCqUjxM1DAJUkBYJRYMn2qjMOVskMk91X/7bcasPPF6duSkkpixb06w8rug5sIMqEeJH+
	AOCMF8gE=
X-Gm-Gg: ATEYQzxWaNZN58mpAn1W4Jvsma4kf0SwuMsQr6BiEDQ0T6ciq/UwMbLdfBNqzpPsM4/
	XNUgkLTUtyXF/utqHHR2bnA+1DqbS+BSJacFyQy4wrwzwxCh87ld5djkEWvid9TmEXGubeZkXq3
	X1ApidvZNUQOOKVviYCwdNCDEX+dk4kuEoEWMunzcW+NKFu/qF+wqMOLiVPFuYX/k0M/hG8mOIZ
	21X3+WQGJmY79gGIA+jA1nMw3lp9bSpZ9OTTBRD3dI7apTRO8vRXmrMcIVHvpWvSl8Ns0Jos26s
	E1ziyeypwSIqcaiJlflSojkxgD5J+y/HgedZfwJxK6ktS/eF4qrgQXCKer9z71gIyTqvdYVcDIG
	yrLsUs+m9IuMiB9eAKaPwJEHJykE6gAWGsDlgdfDJcdA6d1RpG2d0WFwG6RBXkO3qNaweDGr6Lc
	vXcmbElilZnNjlh+1G5e4xcMs=
X-Received: by 2002:a17:902:c70c:b0:2b0:b258:2a57 with SMTP id d9443c01a7336-2b0b2582ccbmr11233355ad.27.1774421044284;
        Tue, 24 Mar 2026 23:44:04 -0700 (PDT)
Received: from MVIN00013 ([2409:40c1:4104:a84c:2a4a:be48:601:ad71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516eacsm209939805ad.15.2026.03.24.23.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 23:44:03 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][kirkstone][PATCH] wireshark: fix CVE-2025-5601
Date: Wed, 25 Mar 2026 12:13:54 +0530
Message-ID: <20260325064354.10268-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 06:44:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125602

Pick patch from [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-5601
[2] https://gitlab.com/wireshark/wireshark/-/issues/20509

More details :
https://nvd.nist.gov/vuln/detail/CVE-2025-5601

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2025-5601.patch       | 68 +++++++++++++++++++
 .../wireshark/wireshark_3.4.16.bb             |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2025-5601.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2025-5601.patch b/meta-networking/recipes-support/wireshark/files/CVE-2025-5601.patch
new file mode 100644
index 0000000000..622664f182
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2025-5601.patch
@@ -0,0 +1,68 @@
+From 8c186dbb381cf51064fa8dbff7953468d5ae394c Mon Sep 17 00:00:00 2001
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
+Co-authored-by: John Thacker <johnthacker@gmail.com>
+
+origin: https://gitlab.com/wireshark/wireshark/-/merge_requests/18076/diffs?commit_id=8c186dbb381cf51064fa8dbff7953468d5ae394c
+
+CVE: CVE-2025-5601
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/8c186dbb381cf51064fa8dbff7953468d5ae394c]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/column-utils.c | 20 ++++++++++++++------
+ 1 file changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/epan/column-utils.c b/epan/column-utils.c
+index ad34cff..15e15fc 100644
+--- a/epan/column-utils.c
++++ b/epan/column-utils.c
+@@ -577,8 +577,13 @@ col_prepend_fstr(column_info *cinfo, const gint el, const gchar *format, ...)
+       /*
+        * Move the fence, unless it's at the beginning of the string.
+        */
+-      if (col_item->col_fence > 0)
++      if (col_item->col_fence > 0) {
++        /* pos >= strlen if truncation occurred; this saves on a strlen
++         * call and prevents adding a single byte character later if a
++         * a multibyte character was truncated (good). */
+         col_item->col_fence += (int) strlen(col_item->col_buf);
++        col_item->col_fence = MIN((int)(max_len - 1), col_item->col_fence);
++      }
+ 
+       g_strlcat(col_item->col_buf, orig, max_len);
+       col_item->col_data = col_item->col_buf;
+@@ -621,11 +626,14 @@ col_prepend_fence_fstr(column_info *cinfo, const gint el, const gchar *format, .
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
++      col_item->col_fence += (int) strlen(col_item->col_buf);
++      col_item->col_fence = MIN((int)(max_len - 1), col_item->col_fence);
++      /*
++       * Append the original data.
++       */
+       g_strlcat(col_item->col_buf, orig, max_len);
+       col_item->col_data = col_item->col_buf;
+     }
+-- 
+2.50.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.16.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.16.bb
index 7502234d47..1e6d764d2a 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.16.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.16.bb
@@ -35,6 +35,7 @@ SRC_URI += " \
     file://CVE-2024-8645.patch \
     file://CVE-2026-0960.patch \
     file://CVE-2025-13945.patch \
+    file://CVE-2025-5601.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.50.1


