Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web11.8445.1611637901548849204
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 21:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HvIsocR9;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: akuster808@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id z22so31327584ioh.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Jan 2021 21:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=RsXvca1pH5wDkl4rgesuw0AB5k3dKj44LEW8mtJ0a84=;
        b=HvIsocR9PMxyt95tt3Okx+JrL7JqvQ3R8OAkyE2LP7aMSNF/9uj8gvQvhOooE39/k0
         nUP9zvw/zDNDynF7TJmUGq/uIzlsM4TiKEJ4ZZrB9rIeftQn6GBBA9Xdw7+YZS9jCs9E
         em+vYPfKrrO0rQnV/ItC02josCSPY8Hqkrg9HJ2kOgTWYhLzzHIz3DDQPaChLblDvMmO
         9JqhoNqbeP/o0nn6z7+2Wt48eee9bOk9a4cnrz+2MmhA8KrmVV5CT5zKFQFTuI/4YFP1
         e/RcDV7VCulLQa9CB6GnUcEmJLWKQPlOgO0yME2TxEHiV0zXHNx00gU9IzG1BDmFukgL
         kvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=RsXvca1pH5wDkl4rgesuw0AB5k3dKj44LEW8mtJ0a84=;
        b=k2TI0IECsK3BwtZd4JEWieNBT3O/aElOz8F66GgGNTcyTixLKy1dQkPsgdBB5lFO2T
         2iW2aHIfv59B5p+gYTTajH/a4cpAclPHXL24urSHre2tbRqmM4WqcMZ8cqEQ8tapPOyl
         JV14iM0wwmlNnF0cRAZNfa+e6dWGiddPP8HM0NR5F4hYr6kzj6T34bvt/VpXSYLjtMQi
         BU3PmZtAQFCzPyhEUuekrRQHTl59PPjNZS6hoWD+0PBVw1SBlJG4LnZJfioE1Od23aSP
         xHms12a6OuaMgO194f2QxzmammoYXNP1sbobJQ0/IJV4ZSVXYhyrw8a8c4r4VypcACdM
         M4Vg==
X-Gm-Message-State: AOAM53089XYqiLUW/JRC16q+cRXeING0roD9esmlsJcdBrAd6zbKiX47
	azgmbyT5VqTdfGyoL4zcrZ9UduAdbse7VQ==
X-Google-Smtp-Source: ABdhPJydHm22Mp8fquktlx9z4mpqzcPInJOPrd2Y/ntmaIfC7On43xTqfjke4F2K+UWmhosFpLM0Pg==
X-Received: by 2002:a05:6602:2dcd:: with SMTP id l13mr2927826iow.40.1611637900876;
        Mon, 25 Jan 2021 21:11:40 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:5442:4b7c:f358:5471])
        by smtp.gmail.com with ESMTPSA id l7sm12039974iln.74.2021.01.25.21.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 21:11:40 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][dunfell][PATCH 2/3] iscsi-initiator-utils: Silence a clang warning on 64bit systems
Date: Mon, 25 Jan 2021 21:11:37 -0800
Message-Id: <20210126051138.15194-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210126051138.15194-1-akuster808@gmail.com>
References: <20210126051138.15194-1-akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

This unbreaks the build with clang as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 409032dcc59bed5051cca454f7344b3cd207cebf)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...Compare-with-max-int-instead-of-max-.patch | 48 +++++++++++++++++++
 .../iscsi-initiator-utils_2.1.2.bb            |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-libopeniscsiusr-Compare-with-max-int-instead-of-max-.patch

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-libopeniscsiusr-Compare-with-max-int-instead-of-max-.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-libopeniscsiusr-Compare-with-max-int-instead-of-max-.patch
new file mode 100644
index 0000000000..c71f01299b
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-libopeniscsiusr-Compare-with-max-int-instead-of-max-.patch
@@ -0,0 +1,48 @@
+From 7bdaa32c80bb7d37668c1ff6d88bb02428459a0f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 21 Oct 2020 09:11:20 -0700
+Subject: [PATCH] libopeniscsiusr: Compare with max int instead of max long
+
+This compares value member of int_list_tbl struct which is of unsigned
+int type.
+
+struct int_list_tbl {
+const char *name;
+unsigned int value;
+};
+
+Clang compiler reports this comparison when
+-Wtautological-constant-out-of-range-compare is enabled
+
+| idbm.c:1042:2: error: result of comparison of constant 18446744073709551615 with expression of type 'unsigned int' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
+|         _rec_int_list(SESSION_CHAP_ALGS, recs, node, session.auth.chap_algs,
+|         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+| idbm.c:263:23: note: expanded from macro '_rec_int_list'
+|                 if (_org->_name[_i] != ~0UL) { \
+|                     ~~~~~~~~~~~~~~~ ^  ~~~~
+
+Since max value for int can be less than unsinged long e.g. on LP64 its
+better to use UINT_MAX here
+
+Upstream-Status: Submitted [https://github.com/open-iscsi/open-iscsi/pull/227]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libopeniscsiusr/idbm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libopeniscsiusr/idbm.c b/libopeniscsiusr/idbm.c
+index 7bc2381..060196f 100644
+--- a/libopeniscsiusr/idbm.c
++++ b/libopeniscsiusr/idbm.c
+@@ -260,7 +260,7 @@ do {\
+ 	_recs[_n].type = TYPE_INT_LIST; \
+ 	_strncpy(_recs[_n].name, _key, NAME_MAXVAL); \
+ 	for (unsigned int _i = 0; _i < ARRAY_LEN(_org->_name); _i++) { \
+-		if (_org->_name[_i] != ~0UL) { \
++		if (_org->_name[_i] != UINT_MAX) { \
+ 			for (unsigned int _j = 0; _j < ARRAY_LEN(_tbl); _j++) { \
+ 				if (_tbl[_j].value == _org->_name[_i]) { \
+ 					strcat(_recs[_n].value, _tbl[_j].name); \
+-- 
+2.29.0
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.2.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.2.bb
index 254362881b..dfcd4ee3cb 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.2.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.2.bb
@@ -16,6 +16,7 @@ SRCREV ?= "802688debcd88c48edabe86deb7e7ed47ebadc26"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi \
            file://0001-Makefile-Do-not-set-Werror.patch \
+           file://0001-libopeniscsiusr-Compare-with-max-int-instead-of-max-.patch \
            file://initd.debian \
            file://99_iscsi-initiator-utils \
            file://iscsi-initiator \
-- 
2.17.1

