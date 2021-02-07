Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.24526.1612725016389715155
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 11:10:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NJpepyRi;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id g3so6675478plp.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 11:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Qoyr4huhHoT9xTWJ6MNGqHONHHM5fchsVftEg03uz/Y=;
        b=NJpepyRiE6OQjHkhfs0MT5j0BaOOcsL/WVv38T2U4fY2NuI0rlMLD+h6jz3MDX46Ov
         jb5YcSs7rjcuUts8G1iV0cb1CTK68lngbQTWIdnjHJTR1MPi/GJbnTPLMaGpb0jsdKwK
         9RqgTXgX4MaOj5vzTzK4ULt1tMxaS1SV1+6/XKADCPLE65UsqBm8JG4Wikw+TgFVPii/
         h8tmLBmFDj44el8jP8keL+fXLU8RuoyDTsd9xW1NdGGEWQYDqyfJslwdmwci9rhQzeJf
         EBqNX/uVTFUoBcccJxK92n0TMvBZxC9z3HpPC1luRlZpz+8rLLCzkFOoT21DWuNUEv+V
         njwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Qoyr4huhHoT9xTWJ6MNGqHONHHM5fchsVftEg03uz/Y=;
        b=d6OTRUffcBprmlzbuKbu8s4i7YqC1F8wR5RodDWfX/Olzpl98KJ5a5793J5CEYc6dM
         +w7y/+D4P0LpzyQ2vO6cLRqvYEazfbdV0+i/AxHmn8hBBM2Hp6vvHtkOzb86kTctMjE9
         skihHkRcBUgp2wK3CqLvIqWFaH0nGubawVD5YlSE6AGKRutyVghNOaq6aTNlQzk4Qq0f
         bLGfMJOgkoY2PNiJH6CWDBiosP2b+s5EOzF34wDdRxTkguDafjJiEmH8XbcmwFf9x9A/
         QuCaoykGQ8YRAqj+fqWGdeFfgffRbXydePk2O6We01US1ojaPMQAI5qu9y/eUZUFQsJm
         KkCw==
X-Gm-Message-State: AOAM531G8C5jkyjRUOYCQNDe3pEjvL7anUOgsngX7VSKqrCBuMag11dD
	CItmwJ692uBxNEsmHubhh7W5S4HY6Fx+Qw==
X-Google-Smtp-Source: ABdhPJwl0oowwD7ILnpZS3d5OWvPLi5YlF81/MYG/2m0nyMlnJSIlL9bBF5fIsblb+gPCxw0svPgLg==
X-Received: by 2002:a17:90b:109:: with SMTP id p9mr600519pjz.82.1612725015728;
        Sun, 07 Feb 2021 11:10:15 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:1d07:684d:b210:7d14])
        by smtp.gmail.com with ESMTPSA id 123sm16371911pfd.91.2021.02.07.11.10.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 11:10:15 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 04/10] iscsi-initiator-utils: upgrade 2.1.2 -> 2.1.3
Date: Sun,  7 Feb 2021 11:10:02 -0800
Message-Id: <46ea93dc423140e63257e69ff3da5aea0b72f8be.1612724878.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612724878.git.akuster808@gmail.com>
References: <cover.1612724878.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@cn.fujitsu.com>

0001-libopeniscsiusr-Compare-with-max-int-instead-of-max-.patch
Removed since this is included in 2.1.3

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 46e30569e3b3d0cc66ce05e9accd759f37705feb)
[Bug fix only update. Includes several CVE fixes.
CVE-2020-17437
CVE-2020-17438
CVE-2020-13987
CVE-2020-13988 ]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...Compare-with-max-int-instead-of-max-.patch | 48 -------------------
 ....1.2.bb => iscsi-initiator-utils_2.1.3.bb} |  3 +-
 2 files changed, 1 insertion(+), 50 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-libopeniscsiusr-Compare-with-max-int-instead-of-max-.patch
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.2.bb => iscsi-initiator-utils_2.1.3.bb} (96%)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-libopeniscsiusr-Compare-with-max-int-instead-of-max-.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-libopeniscsiusr-Compare-with-max-int-instead-of-max-.patch
deleted file mode 100644
index c71f01299b..0000000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-libopeniscsiusr-Compare-with-max-int-instead-of-max-.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 7bdaa32c80bb7d37668c1ff6d88bb02428459a0f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 21 Oct 2020 09:11:20 -0700
-Subject: [PATCH] libopeniscsiusr: Compare with max int instead of max long
-
-This compares value member of int_list_tbl struct which is of unsigned
-int type.
-
-struct int_list_tbl {
-const char *name;
-unsigned int value;
-};
-
-Clang compiler reports this comparison when
--Wtautological-constant-out-of-range-compare is enabled
-
-| idbm.c:1042:2: error: result of comparison of constant 18446744073709551615 with expression of type 'unsigned int' is always true [-Werror,-Wtautological-constant-out-of-range-compare]
-|         _rec_int_list(SESSION_CHAP_ALGS, recs, node, session.auth.chap_algs,
-|         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-| idbm.c:263:23: note: expanded from macro '_rec_int_list'
-|                 if (_org->_name[_i] != ~0UL) { \
-|                     ~~~~~~~~~~~~~~~ ^  ~~~~
-
-Since max value for int can be less than unsinged long e.g. on LP64 its
-better to use UINT_MAX here
-
-Upstream-Status: Submitted [https://github.com/open-iscsi/open-iscsi/pull/227]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libopeniscsiusr/idbm.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libopeniscsiusr/idbm.c b/libopeniscsiusr/idbm.c
-index 7bc2381..060196f 100644
---- a/libopeniscsiusr/idbm.c
-+++ b/libopeniscsiusr/idbm.c
-@@ -260,7 +260,7 @@ do {\
- 	_recs[_n].type = TYPE_INT_LIST; \
- 	_strncpy(_recs[_n].name, _key, NAME_MAXVAL); \
- 	for (unsigned int _i = 0; _i < ARRAY_LEN(_org->_name); _i++) { \
--		if (_org->_name[_i] != ~0UL) { \
-+		if (_org->_name[_i] != UINT_MAX) { \
- 			for (unsigned int _j = 0; _j < ARRAY_LEN(_tbl); _j++) { \
- 				if (_tbl[_j].value == _org->_name[_i]) { \
- 					strcat(_recs[_n].value, _tbl[_j].name); \
--- 
-2.29.0
-
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.2.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.3.bb
similarity index 96%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.2.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.3.bb
index dfcd4ee3cb..4a9cf9db40 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.2.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.3.bb
@@ -12,11 +12,10 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV ?= "802688debcd88c48edabe86deb7e7ed47ebadc26"
+SRCREV ?= "34e3ffb194f6fa3028c0eb2ff57e7db2d1026771"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi \
            file://0001-Makefile-Do-not-set-Werror.patch \
-           file://0001-libopeniscsiusr-Compare-with-max-int-instead-of-max-.patch \
            file://initd.debian \
            file://99_iscsi-initiator-utils \
            file://iscsi-initiator \
-- 
2.17.1

