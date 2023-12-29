Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF10C47258
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:02:50 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.156013.1703876563057849252
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kWZQ8hrc;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5e778e484dbso60934337b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703876562; x=1704481362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=is8JpcKYAzdTQ794LG6jInZjAM/E2G1qskZekKk7/C4=;
        b=kWZQ8hrcc6VRbazV2myyFGxxMsPPhje6Uc0dYAR+ZnXdJpj63fgw6Uu5eGZ2C8hchD
         oIGxjx8Fgo5eBn/FxakATI0eIiGweaoMODvPUbTj4bUUs4ltbmxtxGruf08tuzPSmZWL
         9TBRx1Wia/MYPRaFdgcmQZrIzFBiCFrMl5HVjflTPp1YyEyglNgfveI8YdKkNJiToDto
         m1u3Vm7a03etRkFco9i4FXEhqC5UV3tWwmuWLpIWMKSTTyMTPpRcqqddqlQNYz7vnfLD
         EFIkNL+VpO/QzaUeSCWynjm6FfonFiC1fCp68hXsMTocMyN3rpZR/CrvYGIhI0nsl8VU
         NIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703876562; x=1704481362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=is8JpcKYAzdTQ794LG6jInZjAM/E2G1qskZekKk7/C4=;
        b=jSEQO5pjkeIXSC4/ckpdn/mXpimczvmZaI4wTH96HuyAoIgy28lVq4K8NU5En50ZnT
         8J5AOtUe8j7f7zXHGdqR+1vxI7rFq8e+132mi7sH52Zf3PF9E6STrc3NaAMw/FTtN0Bk
         7BIPJ2I1r86C+Rsfrm5AyblnuPVgr0IJCa5L8PpxVKC14lXCeLYoKkctFHs9Trs0B/Ut
         3ZurOIkoY7vw3Fm7Fk0HcSwkM82eWIua3J9N+bMzAEfuC/3YGZ4tRZO37u1Z84V2Vgg3
         0Elfwz+UKE2Xfbwb/CxQlrNTEQdf0Y46MIucALef7Jmc4LW+QevuPl9Hio7t/J1ErCa7
         1ANw==
X-Gm-Message-State: AOJu0Yx9AplBOp9AUsv7fhYbRlC2xiPDRooH4K/OZlFSxwYkF4+OGjXj
	jyA3I7G7kvOImcEAklp7i9ukqTnvg6O0GA==
X-Google-Smtp-Source: AGHT+IGlLZtvo4FZWzxUqWhgQPBU0AG9FUknqja+lHeTNXFm/0XL4cfnQjKP1RpsRU1c3rG9+h4wxw==
X-Received: by 2002:a05:690c:a04:b0:5ed:3555:f932 with SMTP id cg4-20020a05690c0a0400b005ed3555f932mr3837017ywb.25.1703876561861;
        Fri, 29 Dec 2023 11:02:41 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:2080:c728:4a66:97cc])
        by smtp.gmail.com with ESMTPSA id d13-20020a81ab4d000000b005e71fbbc661sm8570683ywk.143.2023.12.29.11.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:02:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 10/17] yajl: fix CVE-2017-16516, CVE-2022-24795, CVE-2023-33460
Date: Fri, 29 Dec 2023 14:02:23 -0500
Message-Id: <20231229190230.135480-11-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229190230.135480-1-akuster808@gmail.com>
References: <20231229190230.135480-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107892

From: Ross Burton <ross.burton@arm.com>

Take three CVE fixes from Fedora, as the upstream repository is now
dead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 458fd00233a73d75d43b21b86b1425d75947b154)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../yajl/yajl/CVE-2017-16516.patch            | 37 ++++++++++++
 .../yajl/yajl/CVE-2022-24795.patch            | 59 +++++++++++++++++++
 .../yajl/yajl/CVE-2023-33460.patch            | 35 +++++++++++
 meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb   |  6 +-
 4 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2017-16516.patch
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch

diff --git a/meta-oe/recipes-devtools/yajl/yajl/CVE-2017-16516.patch b/meta-oe/recipes-devtools/yajl/yajl/CVE-2017-16516.patch
new file mode 100644
index 0000000000..1241ff9e31
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl/CVE-2017-16516.patch
@@ -0,0 +1,37 @@
+From 0b5e73c4321de0ba1d495fdc0967054b2a77931c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
+Date: Mon, 10 Jul 2023 13:36:10 +0100
+Subject: [PATCH] Fix for CVE-2017-16516
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Description: Fix for CVE-2017-16516
+ Potential buffer overread: A JSON file can cause denial of service.
+Origin: https://github.com/brianmario/yajl-ruby/commit/a8ca8f476655adaa187eedc60bdc770fff3c51ce
+
+CVE: CVE-2017-16516
+Upstream-Status: Submitted [https://github.com/lloyd/yajl/issues/248]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/yajl_encode.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/yajl_encode.c b/src/yajl_encode.c
+index fd08258..0d97cc5 100644
+--- a/src/yajl_encode.c
++++ b/src/yajl_encode.c
+@@ -139,8 +139,8 @@ void yajl_string_decode(yajl_buf buf, const unsigned char * str,
+                     end+=3;
+                     /* check if this is a surrogate */
+                     if ((codepoint & 0xFC00) == 0xD800) {
+-                        end++;
+-                        if (str[end] == '\\' && str[end + 1] == 'u') {
++                        if (end + 2 < len && str[end + 1] == '\\' && str[end + 2] == 'u') {
++                            end++;
+                             unsigned int surrogate = 0;
+                             hexToDigit(&surrogate, str + end + 2);
+                             codepoint =
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch b/meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch
new file mode 100644
index 0000000000..0dc859099d
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch
@@ -0,0 +1,59 @@
+From 17de4d15687aa30c49660dc4b792b1fb4d38b569 Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2022-24795
+Upstream-Status: Submitted [https://github.com/lloyd/yajl/issues/239]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/yajl_buf.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/src/yajl_buf.c b/src/yajl_buf.c
+index 1aeafde..55c11ad 100644
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
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch b/meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch
new file mode 100644
index 0000000000..47454dc8af
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch
@@ -0,0 +1,35 @@
+Fix memory leaks.  Taken from the Fedora packaging (https://src.fedoraproject.org/rpms/yajl)
+where it was backported from openEuler.
+
+CVE: CVE-2023-33460
+Upstream-Status: Submitted [https://github.com/lloyd/yajl/issues/250]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/src/yajl_tree.c b/src/yajl_tree.c
+index 3d357a3..56c7012 100644
+--- a/src/yajl_tree.c
++++ b/src/yajl_tree.c
+@@ -143,7 +143,7 @@ static yajl_val context_pop(context_t *ctx)
+     ctx->stack = stack->next;
+ 
+     v = stack->value;
+-
++    free (stack->key);
+     free (stack);
+ 
+     return (v);
+@@ -444,7 +444,14 @@ yajl_val yajl_tree_parse (const char *input,
+              snprintf(error_buffer, error_buffer_size, "%s", internal_err_str);
+              YA_FREE(&(handle->alloc), internal_err_str);
+         }
++        while(ctx.stack != NULL) {
++             yajl_val v = context_pop(&ctx);
++             yajl_tree_free(v);
++        }
+         yajl_free (handle);
++	//If the requested memory is not released in time, it will cause memory leakage
++	if(ctx.root)
++	     yajl_tree_free(ctx.root);
+         return NULL;
+     }
+ 
diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
index cf8dbb183e..2a34210f3c 100644
--- a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
+++ b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
@@ -8,7 +8,11 @@ HOMEPAGE = "http://lloyd.github.com/yajl/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=39af6eb42999852bdd3ea00ad120a36d"
 
-SRC_URI = "git://github.com/lloyd/yajl;branch=master;protocol=https"
+SRC_URI = "git://github.com/lloyd/yajl;branch=master;protocol=https \
+           file://CVE-2017-16516.patch \
+           file://CVE-2022-24795.patch \
+           file://CVE-2023-33460.patch \
+           "
 SRCREV = "a0ecdde0c042b9256170f2f8890dd9451a4240aa"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


