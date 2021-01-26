Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.8271.1611637857128579840
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 21:10:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oHwfbgOO;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: akuster808@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id 16so838224ioz.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Jan 2021 21:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Qoyr4huhHoT9xTWJ6MNGqHONHHM5fchsVftEg03uz/Y=;
        b=oHwfbgOOrTTd0lcADJ65mnkdhvt+1NIth9f93e8Yv0qZT6Vylefx0rdCgjzwTiYEIl
         xhLTM9/TbH+T3rxKCKJCa7MX7Do0KuPZ7BtnWUNi6lXlbeAtErhc1PhNNWKXhXXmvkuH
         ke8m5m9MQxg82n9K3TnlJ4IdVMERirN3DGjUx+/uAS9+DLQJeqwqapuBnuWay+RGdTq5
         QSw/2mHyacoEmnjBtUa7GS9atHzsZ+HtJkbdEjuE6TfUab8Icz054snnwRvyFEoHZTOp
         v4YpsP2X4nClPOeDcpWMgNHDTc3fbL3fLfkuhwNrrxPLvxHt8123mQp2x+bcr4RCnpxy
         mwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Qoyr4huhHoT9xTWJ6MNGqHONHHM5fchsVftEg03uz/Y=;
        b=qFrlovoRVayscCv6AAgdUK6WjMflSE9ytae+04N2IZOlath9p8DM2/hBkzMLaMk1h7
         BQGEHYzBb9BJQdEfrwoSWPpG1eqyrrDMHIjCyFT8eHf/mCuSTcAdA1qDypiyFR4H3Szl
         6nD5Fgd3t0O/r5tDQ9XSxijNd8rHfdiphN4t+BY9Qwx/FFRArBVUq8nok5ASl2LrlyRO
         NKEXXPkwDezQSA9U+ng42sct0kvJR1aLQ0xsbsDwMnOnRqCGZLfs/H7eXi9TjQeUz8wX
         abBI6Q8hXg7vXeyzAg4vRJocPq6vLjXs9XCSuraxCulhm1AjdNnE0LsdRcjh4KRzAMEy
         xb8Q==
X-Gm-Message-State: AOAM530K78r5pzrFMuZZGqpY8UjATbVgGIqVNCiXPEgmEcDBikz9lZwb
	+yQd8M1hPcIcGvfXKmO1dKZahw5/XSf0/A==
X-Google-Smtp-Source: ABdhPJwn6rWPETDQV61KKYp3LKy/dQ/PG341cgdcEZsf4rh+gqgJmixAhEfAebSXF9H65qgtgYXo5A==
X-Received: by 2002:a92:48d2:: with SMTP id j79mr3145260ilg.201.1611637856321;
        Mon, 25 Jan 2021 21:10:56 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:5442:4b7c:f358:5471])
        by smtp.gmail.com with ESMTPSA id u8sm11079265iom.12.2021.01.25.21.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 21:10:55 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: zangrc <zangrc.fnst@cn.fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][gatesgarth][PATCH] iscsi-initiator-utils: upgrade 2.1.2 -> 2.1.3
Date: Mon, 25 Jan 2021 21:10:54 -0800
Message-Id: <20210126051054.15107-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

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

