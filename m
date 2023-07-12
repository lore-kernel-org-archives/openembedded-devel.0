Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBDAEB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 23:48:30 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.1788.1689205703461391963
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 16:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZKau6g0B;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-66869feb7d1so98700b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 16:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689205703; x=1691797703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XA2WQel2RT+HsMogaof+N3aZ4rWTjb905XCmgLnOJhs=;
        b=ZKau6g0BsKcpaQAwzZX4E3VbDHAXs+E/v6Um0NPgWfePd5xM8hoC/U2PiiPnTLrGWh
         1Be/f6eLw1TEe0f3RATHR0K73ilGid3XDe9BPf3e0DcKYEq7KuJEHtZGTRZ+uXtPkl4w
         NznhkTi9EbYgqnbjQuFdsue20bBp0ofprQAzRuf3Gc6I3Qig0CeNCW3JGiCmZcgi6Psh
         hWvfgljlusJRDXu9eUbartte4i2ajYyuWuVbgkRYvuQGlfLceaWv50cC9oBOfwGegl50
         GRKj+w4zrlpsZSEDa53asTorlRUSbMV+WaQA2UGbgHpmH0wfFEP0CPnU64NiEDwaMVnz
         lSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689205703; x=1691797703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XA2WQel2RT+HsMogaof+N3aZ4rWTjb905XCmgLnOJhs=;
        b=U2duAYvr8EpU1cyPcp4uppHK79Z3jKy2t53QgwqWbG6DHOByLbpmSyz3LMPyPCzHyC
         1xsNZGzWoXl+DpPKGrzgEFRNv4y0y0rD/Emm5cEvdA/5jub9omUi08RDuCJSp/KLi42v
         PKTf6tpl+f1ce8MKSsqUmy1awVaBd5coc/cfCwFO+CMajlGxAIFTfbXoTZmlb76PoWsF
         YEXl9Q0uZ4uOSOQN4n5Gj3nfs901KREyAj+qc2uLSjdgmY9AmTcjrFO93EO3FhjphFV3
         QVEuhnQEbjQANGzSzFNW0AJ+KQfmFRwtDaiyf0f2vyg6SH9L2K7pyZFkYHXijK73ZX6J
         /OaA==
X-Gm-Message-State: ABy/qLZjHDc5xfjnHld8HhQSs0hb3vvpDc4JWuaAfezCNX4Z6/R6cA+h
	tAMK3ZoU+Fclbh7ZCGRLhYpUJEmZpeU=
X-Google-Smtp-Source: APBJJlHrEntj/boE5e2IpJOcI3vdhMLk/EJDKTQr30oOPrDn3vSwE+m8/RKTGIKa81HdXcJSsMen1Q==
X-Received: by 2002:a05:6a20:26a5:b0:11f:2714:f70d with SMTP id h37-20020a056a2026a500b0011f2714f70dmr14431461pze.9.1689205702639;
        Wed, 12 Jul 2023 16:48:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::9429])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001b9d335223csm4545831pld.26.2023.07.12.16.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 16:48:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] crash: Fix build with glibc 2.38+
Date: Wed, 12 Jul 2023 16:48:18 -0700
Message-ID: <20230712234819.1008911-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712234819.1008911-1-raj.khem@gmail.com>
References: <20230712234819.1008911-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 23:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103849

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-make-src-string-const-in-strlcpy.patch | 43 +++++++++++++++++++
 meta-oe/recipes-kernel/crash/crash_8.0.2.bb   |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/crash/crash/0001-make-src-string-const-in-strlcpy.patch

diff --git a/meta-oe/recipes-kernel/crash/crash/0001-make-src-string-const-in-strlcpy.patch b/meta-oe/recipes-kernel/crash/crash/0001-make-src-string-const-in-strlcpy.patch
new file mode 100644
index 0000000000..ff1c35f5c9
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash/0001-make-src-string-const-in-strlcpy.patch
@@ -0,0 +1,43 @@
+From 7f02a81117a30cc57c8e74c01098af8c9284d64b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Jul 2023 14:47:13 -0700
+Subject: [PATCH] make src string const in strlcpy
+
+This also fixes build with glibc 2.38+ which now implements strlcpy too
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ defs.h  | 2 +-
+ tools.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/defs.h b/defs.h
+index afdcf6c..c108172 100644
+--- a/defs.h
++++ b/defs.h
+@@ -5298,7 +5298,7 @@ uint32_t swap32(uint32_t, int);
+ uint64_t swap64(uint64_t, int);
+ ulong *get_cpumask_buf(void);
+ int make_cpumask(char *, ulong *, int, int *);
+-size_t strlcpy(char *, char *, size_t);
++size_t strlcpy(char *, const char *, size_t);
+ struct rb_node *rb_first(struct rb_root *);
+ struct rb_node *rb_parent(struct rb_node *, struct rb_node *);
+ struct rb_node *rb_right(struct rb_node *, struct rb_node *);
+diff --git a/tools.c b/tools.c
+index 39306c1..bb647e7 100644
+--- a/tools.c
++++ b/tools.c
+@@ -6762,7 +6762,7 @@ make_cpumask_error:
+  * always be NULL-terminated.
+  */
+ size_t 
+-strlcpy(char *dest, char *src, size_t size)
++strlcpy(char *dest, const char *src, size_t size)
+ {
+ 	size_t ret = strlen(src);
+ 
+-- 
+2.41.0
+
diff --git a/meta-oe/recipes-kernel/crash/crash_8.0.2.bb b/meta-oe/recipes-kernel/crash/crash_8.0.2.bb
index f58bb6ef54..f8a460b8ce 100644
--- a/meta-oe/recipes-kernel/crash/crash_8.0.2.bb
+++ b/meta-oe/recipes-kernel/crash/crash_8.0.2.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/crash-utility/${BPN}.git;branch=master;protocol=http
            file://0001-cross_add_configure_option.patch \
            file://donnot-extract-gdb-during-do-compile.patch \
            file://gdb_build_jobs_and_not_write_crash_target.patch \
+           file://0001-make-src-string-const-in-strlcpy.patch \
            "
 SRCREV = "f1cd581d1c4afa5b8ffdfaa6a3ea9f545fe4ec91"
 
-- 
2.41.0


