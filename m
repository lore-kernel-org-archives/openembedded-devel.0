Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.8760.1612035471465429446
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jan 2021 11:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iBipRO/i;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id w14so8822348pfi.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Jan 2021 11:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6U9S+Vo+GBUY02nR+tMpwzTcY9s8pN/CmnMv66dcyfc=;
        b=iBipRO/icFsk/2fK9QGkVUkYLHbpF1IBSh0GPuyjTt7n7BbWFH63lUmKxmYOUOkFJ4
         GIeB6RR7CM7npC/Ki8wrVQqj1/oyF+Dy8A3HPg7gFaknAIst9DBuFL07hmnGKzXV151k
         ycS4W67QgHN19FjBqEg32mQRaEguGbAwZZiSMSLXXLq7Ne4UW6I2fkiDyRclQT2N0Q1o
         BnmkapOjlDV94KCHZ2oCda4EWLgZZfTWoKRGDzK+bVYQYtzaT4JLaCnXD1viUW5mYrR/
         5sx2ZpU781Eny8SIDK/u1tO20LnQQO0OGbtsX313zrs/rJkLWtIMq9OAJJz/0AMBSlwM
         L5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6U9S+Vo+GBUY02nR+tMpwzTcY9s8pN/CmnMv66dcyfc=;
        b=r2QMel9GMoN6sfcoUt/dv+FqTA1UJTbjo2liiMnSmjTVy3DRuUVzseGQwZxhaD+FhR
         y5xzBwNS2uVTNvNqzq17hcvNKmcYru7HjCJ9zELY90h8UT7cEX1k3nfqdKYmSMjABbil
         OUbRwPfqwDz5Tc0AAcD/nfAwF8XVBH+Vwtt4pmCNrkxi3xwOOfYunWnUaRcwb20r2Up0
         6lTQRicw//1p0GIGOLzveDFtyvTCn3QnkAAURuAFy5mlGiTzOY4hijZULOu5dsXptFGX
         KroJB0a8ztcluCrQQVJiej580Ln/2TZ300EK9uXtNRKYa0ELc+tP39i6P6dY5Tphr536
         WANA==
X-Gm-Message-State: AOAM533lCQNCt2UOyn6ozUCDVIoT22TQ2ankvOM5o+1kyRjJME/a27GX
	520Q+XFVP2kB+TIQ1sScWUQEBrNQjh6++w==
X-Google-Smtp-Source: ABdhPJwBOWPOSJLFPbWoOTIsjl+MWf5dmf60GM6dpi5hlwTUahvBqI3mN+KcZ9ub1qfI73LYNsALUw==
X-Received: by 2002:a63:a301:: with SMTP id s1mr10099487pge.325.1612035470695;
        Sat, 30 Jan 2021 11:37:50 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:315d:c5e7:1295:54a9])
        by smtp.gmail.com with ESMTPSA id q197sm12518096pfc.155.2021.01.30.11.37.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 11:37:50 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 05/13] iscsi-initiator-utils: upgrade 2.1.2 -> 2.1.3
Date: Sat, 30 Jan 2021 11:37:30 -0800
Message-Id: <bed52e2112d494d3177fa3a161a26af85addbc58.1612035229.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612035229.git.akuster808@gmail.com>
References: <cover.1612035229.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@cn.fujitsu.com>

Source: git.openembedded.org
MR: 108115, 108125, 108095, 108105
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/meta-openembedded/commit/meta-networking/recipes-daemons/iscsi-initiator-utils?id=46e30569e3b3d0cc66ce05e9accd759f37705feb
ChangeID: 46e30569e3b3d0cc66ce05e9accd759f37705feb
Description:

0001-libopeniscsiusr-Compare-with-max-int-instead-of-max-.patch
Removed since this is included in 2.1.3

Bugfix only update.  Also includes these CVE fixes:
CVE-2020-13988
CVE-2020-13987
CVE-2020-17438
CVE-2020-17437

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster@mvista.com>
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

