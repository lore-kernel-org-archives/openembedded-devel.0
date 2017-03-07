Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 027067756F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Mar 2017 07:14:09 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 77so9357013pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 23:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GKbvAhFsNcPfsN7wcjq1vGOyVRU4tPu3tLi6Z+NJwjo=;
	b=hhBi3YHZPYCT2jmoX3tMvWH9IG6rZsD5DcSsp0Xyy955/QhzxFbP07KD+vrxhArMAE
	bmn+phl2fsUgbMG/h2KSBkAjOMw+EdVJyMMu1esITtMy41H7pYfki17p7hTv49HL0KNm
	tYRNeK6n1Kg+T2NCvtC99jzZojGyZO+Jti4FXYeKZdXOhfkeic6e0n/N+rKYJRuGEJzX
	jGOeWABkdp3JGNrZSpMG2x5aDuk4l1+ADmdT8/Uzx8ZHfVxFE/hgjljg3GAMuhJXMqPi
	DWa9YstuFzEmUHIEgHRdUsGrGm208u3VCLY+c8+5Spc3pysv/OTLtjbkGTr+7QJm75CY
	81ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GKbvAhFsNcPfsN7wcjq1vGOyVRU4tPu3tLi6Z+NJwjo=;
	b=a+E13DFH21vldpGCE0vopY2BPGrJYhGuSy/FvbB5nHfCA6/EY1lcdXVBUUukZqnU6W
	jDHAfaxS/cUvVSmVEnhGg3HQuaxBB7W2O1RNkuH+ZNx2aTBDZ1j/wMZTMl8HUuKsbcdk
	w3rMkHxU7WnIH6Cu3cCNOJFU/PLVBXNioMf/5ZZBsYUgbS/1QYchoQQpWfNgjc7SH0HB
	7ixiNnBJhzM/QFNblwGYgWAdcqGTnj9HdxvexuPsT3LPLNt25Ubuy4BBSP2TNQZMlpN8
	vM+Cvn9p7LMfOsIsjJwasktFy8whfzbihMV8trIQR3p2w/n5FXRGdY4J5+KgBX6FBNMw
	22vw==
X-Gm-Message-State: AMke39nReFFWUN1v7C7NYMC43irH9SG+TucdjqCNut+NJdgPTG54PbdkMAzp2lQ3rslReA==
X-Received: by 10.99.115.12 with SMTP id o12mr25455429pgc.165.1488870850406;
	Mon, 06 Mar 2017 23:14:10 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r134sm43530858pfr.83.2017.03.06.23.14.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 23:14:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 23:13:47 -0800
Message-Id: <20170307071349.16444-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170307071349.16444-1-raj.khem@gmail.com>
References: <20170307071349.16444-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 12/14] ltrace: Fix build with aarch64 and bump to latest
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Mar 2017 07:14:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ltrace/ltrace/0001-Use-correct-enum-type.patch | 28 ++++++++
 .../ltrace/0002-Fix-const-qualifier-error.patch    | 76 ++++++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |  6 +-
 3 files changed, 108 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-Use-correct-enum-type.patch
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0002-Fix-const-qualifier-error.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-Use-correct-enum-type.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-Use-correct-enum-type.patch
new file mode 100644
index 000000000..01a35842c
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-Use-correct-enum-type.patch
@@ -0,0 +1,28 @@
+From df490528d1e81a98ba2991c700c92a8e6c969083 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Mar 2017 21:32:22 -0800
+Subject: [PATCH 1/2] Use correct enum type
+
+Clang warns about wrong enum initializtion
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/linux-gnu/aarch64/fetch.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysdeps/linux-gnu/aarch64/fetch.c b/sysdeps/linux-gnu/aarch64/fetch.c
+index 2744df0..1dcf7cc 100644
+--- a/sysdeps/linux-gnu/aarch64/fetch.c
++++ b/sysdeps/linux-gnu/aarch64/fetch.c
+@@ -173,7 +173,7 @@ static struct fetch_script
+ pass_arg(struct fetch_context const *context,
+ 	 struct process *proc, struct arg_type_info *info)
+ {
+-	enum fetch_method cvt = CVT_NOP;
++	enum convert_method cvt = CVT_NOP;
+ 
+ 	size_t sz = type_sizeof(proc, info);
+ 	if (sz == (size_t) -1)
+-- 
+2.12.0
+
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0002-Fix-const-qualifier-error.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0002-Fix-const-qualifier-error.patch
new file mode 100644
index 000000000..c15277192
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0002-Fix-const-qualifier-error.patch
@@ -0,0 +1,76 @@
+From 4d3ec1a514f9b1df8ce3a1b04c8a2823d977377f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Mar 2017 21:34:01 -0800
+Subject: [PATCH 2/2] Fix const qualifier error
+
+Fixes clang warning
+error: duplicate 'const' declaration specifier [-Werror,-Wduplicate-decl-specifier]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ dict.h    | 2 +-
+ library.c | 2 +-
+ vect.h    | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+Index: git/dict.h
+===================================================================
+--- git.orig/dict.h
++++ git/dict.h
+@@ -90,7 +90,7 @@ int dict_clone(struct dict *target, cons
+ 		assert(_source_d->values.elt_size == sizeof(VALUE_TYPE)); \
+ 		/* Check that callbacks are typed properly.  */		\
+ 		void (*_key_dtor_cb)(KEY_TYPE *, void *) = DTOR_KEY;	\
+-		int (*_key_clone_cb)(KEY_TYPE *, const KEY_TYPE *,	\
++		int (*_key_clone_cb)(KEY_TYPE *, KEY_TYPE *,	\
+ 				     void *) = CLONE_KEY;		\
+ 		void (*_value_dtor_cb)(VALUE_TYPE *, void *) = DTOR_VALUE; \
+ 		int (*_value_clone_cb)(VALUE_TYPE *, const VALUE_TYPE *, \
+Index: git/library.c
+===================================================================
+--- git.orig/library.c
++++ git/library.c
+@@ -353,7 +353,7 @@ static void
+ library_exported_names_init(struct library_exported_names *names)
+ {
+ 	DICT_INIT(&names->names,
+-		  const char*, uint64_t,
++		  char*, uint64_t,
+ 		  dict_hash_string, dict_eq_string, NULL);
+ 	DICT_INIT(&names->addrs,
+ 		  uint64_t, struct vect*,
+Index: git/vect.h
+===================================================================
+--- git.orig/vect.h
++++ git/vect.h
+@@ -66,7 +66,7 @@ int vect_clone(struct vect *target, cons
+ 		assert(_source_vec->elt_size == sizeof(ELT_TYPE));	\
+ 		/* Check that callbacks are typed properly.  */		\
+ 		void (*_dtor_callback)(ELT_TYPE *, void *) = DTOR;	\
+-		int (*_clone_callback)(ELT_TYPE *, const ELT_TYPE *,	\
++		int (*_clone_callback)(ELT_TYPE *, ELT_TYPE *,	\
+ 				       void *) = CLONE;			\
+ 		vect_clone((TGT_VEC), _source_vec,			\
+ 			   (int (*)(void *, const void *,		\
+Index: git/value_dict.c
+===================================================================
+--- git.orig/value_dict.c
++++ git/value_dict.c
+@@ -40,7 +40,7 @@ val_dict_init(struct value_dict *dict)
+ }
+ 
+ static int
+-value_clone_cb(struct value *tgt, const struct value *src, void *data)
++value_clone_cb(struct value *tgt, struct value *src, void *data)
+ {
+ 	return value_clone(tgt, src);
+ }
+@@ -53,7 +53,7 @@ value_dtor(struct value *val, void *data
+ 
+ static int
+ named_value_clone(struct named_value *tgt,
+-		  const struct named_value *src, void *data)
++		  struct named_value *src, void *data)
+ {
+ 	tgt->name = strdup(src->name);
+ 	if (tgt->name == NULL)
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 8ae018503..60068ae96 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -10,14 +10,16 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 PE = "1"
-PV = "7.3+git${SRCPV}"
-SRCREV = "01b10e191e99d8cb147e5a2b7da8196e0ec6fb94"
+PV = "7.91+git${SRCPV}"
+SRCREV = "c22d359433b333937ee3d803450dc41998115685"
 
 DEPENDS = "elfutils"
 RDEPENDS_${PN} = "elfutils"
 SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git;branch=master \
            file://configure-allow-to-disable-selinux-support.patch \
            file://0001-replace-readdir_r-with-readdir.patch \
+           file://0001-Use-correct-enum-type.patch \
+           file://0002-Fix-const-qualifier-error.patch \
           "
 S = "${WORKDIR}/git"
 
-- 
2.12.0


