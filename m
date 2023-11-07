Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54E2C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 17:00:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.97.1699376427513583023
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 09:00:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B4141476;
	Tue,  7 Nov 2023 09:01:11 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9C1763F6C4;
	Tue,  7 Nov 2023 09:00:26 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] yajl: fix CVE-2017-16516, CVE-2022-24795, CVE-2023-33460
Date: Tue,  7 Nov 2023 17:00:25 +0000
Message-Id: <20231107170025.38836-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 17:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106459

From: Ross Burton <ross.burton@arm.com>

Take three CVE fixes from Fedora, as the upstream repository is now
dead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../yajl/yajl/CVE-2017-16516.patch            | 37 ++++++++++++
 .../yajl/yajl/CVE-2022-24795.patch            | 59 +++++++++++++++++++
 .../yajl/yajl/CVE-2023-33460.patch            | 35 +++++++++++
 meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb   |  6 +-
 4 files changed, 136 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2017-16516.pat=
ch
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.pat=
ch
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.pat=
ch

diff --git a/meta-oe/recipes-devtools/yajl/yajl/CVE-2017-16516.patch b/me=
ta-oe/recipes-devtools/yajl/yajl/CVE-2017-16516.patch
new file mode 100644
index 0000000000..1241ff9e31
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl/CVE-2017-16516.patch
@@ -0,0 +1,37 @@
+From 0b5e73c4321de0ba1d495fdc0967054b2a77931c Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <berrange@=
redhat.com>
+Date: Mon, 10 Jul 2023 13:36:10 +0100
+Subject: [PATCH] Fix for CVE-2017-16516
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Description: Fix for CVE-2017-16516
+ Potential buffer overread: A JSON file can cause denial of service.
+Origin: https://github.com/brianmario/yajl-ruby/commit/a8ca8f476655adaa1=
87eedc60bdc770fff3c51ce
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
+@@ -139,8 +139,8 @@ void yajl_string_decode(yajl_buf buf, const unsigned=
 char * str,
+                     end+=3D3;
+                     /* check if this is a surrogate */
+                     if ((codepoint & 0xFC00) =3D=3D 0xD800) {
+-                        end++;
+-                        if (str[end] =3D=3D '\\' && str[end + 1] =3D=3D=
 'u') {
++                        if (end + 2 < len && str[end + 1] =3D=3D '\\' &=
& str[end + 2] =3D=3D 'u') {
++                            end++;
+                             unsigned int surrogate =3D 0;
+                             hexToDigit(&surrogate, str + end + 2);
+                             codepoint =3D
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch b/me=
ta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch
new file mode 100644
index 0000000000..0dc859099d
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch
@@ -0,0 +1,59 @@
+From 17de4d15687aa30c49660dc4b792b1fb4d38b569 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Petr=3D20P=3DC3=3DADsa=3DC5=3D99?=3D <ppisar@redhat.co=
m>
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
+@@ -45,7 +45,17 @@ void yajl_buf_ensure_available(yajl_buf buf, size_t w=
ant)
+=20
+     need =3D buf->len;
+=20
+-    while (want >=3D (need - buf->used)) need <<=3D 1;
++    if (((buf->used > want) ? buf->used : want) > (size_t)(buf->used + =
want)) {
++        /* We cannot allocate more memory than SIZE_MAX. */
++        abort();
++    }
++    while (want >=3D (need - buf->used)) {
++        if (need >=3D (size_t)((size_t)(-1)<<1)>>1) {
++            /* need would overflow. */
++            abort();
++        }
++        need <<=3D 1;
++    }
+=20
+     if (need !=3D buf->len) {
+         buf->data =3D (unsigned char *) YA_REALLOC(buf->alloc, buf->dat=
a, need);
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch b/me=
ta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch
new file mode 100644
index 0000000000..47454dc8af
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl/CVE-2023-33460.patch
@@ -0,0 +1,35 @@
+Fix memory leaks.  Taken from the Fedora packaging (https://src.fedorapr=
oject.org/rpms/yajl)
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
+     ctx->stack =3D stack->next;
+=20
+     v =3D stack->value;
+-
++    free (stack->key);
+     free (stack);
+=20
+     return (v);
+@@ -444,7 +444,14 @@ yajl_val yajl_tree_parse (const char *input,
+              snprintf(error_buffer, error_buffer_size, "%s", internal_e=
rr_str);
+              YA_FREE(&(handle->alloc), internal_err_str);
+         }
++        while(ctx.stack !=3D NULL) {
++             yajl_val v =3D context_pop(&ctx);
++             yajl_tree_free(v);
++        }
+         yajl_free (handle);
++	//If the requested memory is not released in time, it will cause memor=
y leakage
++	if(ctx.root)
++	     yajl_tree_free(ctx.root);
+         return NULL;
+     }
+=20
diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb b/meta-oe/recipe=
s-devtools/yajl/yajl_2.1.0.bb
index 33ffa41248..c5b5e60027 100644
--- a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
+++ b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
@@ -8,7 +8,11 @@ HOMEPAGE =3D "https://lloyd.github.io/yajl/"
 LICENSE =3D "ISC"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D39af6eb42999852bdd3ea00ad120a=
36d"
=20
-SRC_URI =3D "git://github.com/lloyd/yajl;branch=3Dmaster;protocol=3Dhttp=
s"
+SRC_URI =3D "git://github.com/lloyd/yajl;branch=3Dmaster;protocol=3Dhttp=
s \
+           file://CVE-2017-16516.patch \
+           file://CVE-2022-24795.patch \
+           file://CVE-2023-33460.patch \
+           "
 SRCREV =3D "a0ecdde0c042b9256170f2f8890dd9451a4240aa"
=20
 S =3D "${WORKDIR}/git"
--=20
2.34.1


