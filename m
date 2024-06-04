Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C8FC25B74
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 03:55:48 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.13324.1717473344860686653
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jun 2024 20:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=irM1zw9W;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f61f775738so36158235ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 20:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1717473343; x=1718078143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wze83i8A9b4FmeTLtq3ifQi5MmgtrBgK/4PD4Ltugr0=;
        b=irM1zw9WQbIeRKCwF4kfAXQDOx+2IimKex7l4GTvoNRXd1BFNa1HBvFxFSV5wFH3wt
         M/f1CS8aRDuyQP29nFKf2vIyOxUjleIhek6y8m+qn/75RyTsMSWcAAlOBjEUYLNNCen1
         LvADiKmShoimlnNYATOlcDWGFpcW1yRvx8cB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717473343; x=1718078143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wze83i8A9b4FmeTLtq3ifQi5MmgtrBgK/4PD4Ltugr0=;
        b=d2YA2aOctdSJfjKEodOvLZJw2q25+GLWMPPWZ6rD0+UGSIpY2tLvutL17UyuYNpw7i
         nOQ6+D2/5nSOdRl/TBzUhyNdeqpE+tG9h2B/z+qQNmFxKkcApUCxOM916T5FN7WS7Dgj
         8yp6ZYyJ8QpglK0hTU+qnGH0gDYJSNwfwIs9Vij7rDpfEVBk02A8xGrFi0idJjidrquE
         cphjovdLfP447iUCqolVfakc3tmwNmfF8AZeUb2AkijLd1xU3BZOumFvVQxbO02qjCqX
         jQYqjrapI78tGUZRBfh734YdasVEnJQo7oFF3jR9KQYs+Ag/2lKna5KWmp97DHhJNPsx
         woEg==
X-Gm-Message-State: AOJu0YzKzB1nRvSJEugju3VlYoycYv03Lvza48serITT+phKYuFtXbpz
	cNTYfhwQNyzFqCNDgtVLdT/q/TEbAEz+B8YkwZO4d10Y/teLnCn7w0sh+7iuX3SoUsBQadSvr8y
	l
X-Google-Smtp-Source: AGHT+IH+wQj0Cx69EW2OPDbjj3VTQq8AXC4dwTctpMJ3/iYkaMZh1xnVhLufnh/1oLvWhVqs3igwEA==
X-Received: by 2002:a17:902:ce82:b0:1f4:6948:1d49 with SMTP id d9443c01a7336-1f6371294ddmr101942155ad.33.1717473342747;
        Mon, 03 Jun 2024 20:55:42 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882d:b8b3:3ea4:d00d:5abe:5807])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63232ddabsm72346505ad.28.2024.06.03.20.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 20:55:42 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-oe][kirkstone][PATCH v2] yajl: backport Debian patch for CVE-2022-24795
Date: Tue,  4 Jun 2024 09:25:27 +0530
Message-Id: <20240604035527.9937-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jun 2024 03:55:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110685

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


