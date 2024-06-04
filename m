Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECE2C25B74
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 03:52:48 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.13137.1717473163313744826
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jun 2024 20:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Cu0W5JVu;
 spf=pass (domain: mvista.com, ip: 209.85.160.51, mailfrom: vanusuri@mvista.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-250c0555a63so1011299fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 20:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1717473161; x=1718077961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wze83i8A9b4FmeTLtq3ifQi5MmgtrBgK/4PD4Ltugr0=;
        b=Cu0W5JVuxP8HaBDpGHgLK7Wz/zwmVUYJMECQ94DBtnLXLWmgLJxKjxlQL6s5ROsm9W
         HfdVv0qN3pdZMOn5n2hZT38NaUXHqtBUfmeEkBXTSEkdLVO4sAge022vwHw8Ff+ybDo6
         PkWBtfVHoqCyXU6mqqvQnWMwAvR6/eA6QPKzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717473161; x=1718077961;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wze83i8A9b4FmeTLtq3ifQi5MmgtrBgK/4PD4Ltugr0=;
        b=qn7jMiGWH/Wv276GIzu5By4ec62UJFUe4IcO1Kx1XOgxWN9+ZJBg8+7ImEs8U1RbUs
         XFgHTYvQ4NrPj9xNKt0zzNJK4C7lPuUO4CeU7t0gT5p1KBcbG1WY9v/bYBXcLYuztgpz
         2RsE8xp6IL3mfN1MO8vsKoV+7K/lRUnZuv39AVU3Mvf/A/rBbU1u0rzIdoGeZjJEKs6D
         tXIaprv0EjCUxnwawCXwTkCeO9MZnCJV9Zvkn9VoGy2fHsIesp5axp4QtgjYXYchug/C
         z8KNiyVSc96wQL/1T1eBRR68FeuyllsuILfvxuXAaQB1zy0qyyQTgSuf+d3N+4HV54FZ
         ioQQ==
X-Gm-Message-State: AOJu0Yy7rRyQxtOWDL3hKO095AzVe2day93iEwlREmoyhC2mJb+XMK5A
	9ZTB6JauXHIKO7FRO6weTQm0uZi9HRRd8vEGTCA5hOcO4QIP1tqHAS9LNAQgAPfsziymhDWOkOV
	S
X-Google-Smtp-Source: AGHT+IG/3ZBFJe0pu+hTXnkz3QTtpMsZBss8QoIyynxCaimC0G1zZvs9eBJMS6fiYxMuA597FvwIlw==
X-Received: by 2002:a05:6870:b156:b0:250:febf:3c6a with SMTP id 586e51a60fabf-250febf3ce9mr1776397fac.18.1717473161307;
        Mon, 03 Jun 2024 20:52:41 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882d:b8b3:3ea4:d00d:5abe:5807])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242b09133sm6438248b3a.178.2024.06.03.20.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 20:52:40 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] yajl: backport Debian patch for CVE-2022-24795
Date: Tue,  4 Jun 2024 09:22:31 +0530
Message-Id: <20240604035231.9843-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jun 2024 03:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110684

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2022-24795

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/yajl/tree/debian/patches/?h=ubuntu%2Ffocal-security
Upstream commit
https://github.com/ppisar/yajl/commit/23cea2d7677e396efed78bbf1bf153961fab6bad]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../yajl/yajl/CVE-2022-24795.patch            | 61 +++++++++++++++++++
 meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb   |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch

diff --git a/meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch b/meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch
new file mode 100644
index 000000000..4de46e699
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch
@@ -0,0 +1,61 @@
+From 23cea2d7677e396efed78bbf1bf153961fab6bad Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar@redhat.com>
+Date: Thu, 7 Apr 2022 17:29:54 +0200
+Subject: [PATCH] Fix CVE-2022-24795
+
+There was an integer overflow in yajl_buf_ensure_available() leading
+to allocating less memory than requested. Then data were written past
+the allocated heap buffer in yajl_buf_append(), the only caller of
+yajl_buf_ensure_available(). Another result of the overflow was an
+infinite loop without a return from yajl_buf_ensure_available().
+
+yajl-ruby project, which bundles yajl, fixed it
+<https://github.com/brianmario/yajl-ruby/pull/211> by checking for the
+integer overflow, fortifying buffer allocations, and report the
+failures to a caller. But then the caller yajl_buf_append() skips
+a memory write if yajl_buf_ensure_available() failed leading to a data
+corruption.
+
+A yajl fork mainter recommended calling memory allocation callbacks with
+the large memory request and let them to handle it. But that has the
+problem that it's not possible pass the overely large size to the
+callbacks.
+
+This patch catches the integer overflow and terminates the process
+with abort().
+
+https://github.com/lloyd/yajl/issues/239
+https://github.com/brianmario/yajl-ruby/security/advisories/GHSA-jj47-x69x-mxrm
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/yajl/tree/debian/patches/CVE-2022-24795.patch
+Upstream commit
+https://github.com/ppisar/yajl/commit/23cea2d7677e396efed78bbf1bf153961fab6bad]
+CVE: CVE-2022-24795
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/yajl_buf.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/src/yajl_buf.c b/src/yajl_buf.c
+index 1aeafde0..55c11add 100644
+--- a/src/yajl_buf.c
++++ b/src/yajl_buf.c
+@@ -45,7 +45,17 @@ void yajl_buf_ensure_available(yajl_buf buf, size_t want)
+ 
+     need = buf->len;
+ 
+-    while (want >= (need - buf->used)) need <<= 1;
++    if (((buf->used > want) ? buf->used : want) > (size_t)(buf->used + want)) {
++        /* We cannot allocate more memory than SIZE_MAX. */
++        abort();
++    }
++    while (want >= (need - buf->used)) {
++        if (need >= (size_t)((size_t)(-1)<<1)>>1) {
++            /* need would overflow. */
++            abort();
++        }
++        need <<= 1;
++    }
+ 
+     if (need != buf->len) {
+         buf->data = (unsigned char *) YA_REALLOC(buf->alloc, buf->data, need);
diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
index 697f54d9f..eca709cc1 100644
--- a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
+++ b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=39af6eb42999852bdd3ea00ad120a36d"
 
 SRC_URI = "git://github.com/lloyd/yajl;branch=master;protocol=https \
            file://CVE-2023-33460.patch \
+           file://CVE-2022-24795.patch \
           "
 SRCREV = "a0ecdde0c042b9256170f2f8890dd9451a4240aa"
 
-- 
2.25.1


