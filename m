Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.8537.1612035470602364538
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Jan 2021 11:37:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XG7jYbYd;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id u15so7730196plf.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Jan 2021 11:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=RsXvca1pH5wDkl4rgesuw0AB5k3dKj44LEW8mtJ0a84=;
        b=XG7jYbYdReT8njeruoowpBWiy5i8JNaMPYVb58SxomEXJ6XTObXQJuCOI+7VNDiY6W
         85Uwx27oexDV2XggJHIIgNDIv7kOaVaiXy2MMYVPcWsESsaP36btqi2ESkPbLHTdTCio
         ehJ04+6cBOphuGVD8GJ98qOjKESaYgBiFXeEY0GYu2Oirz5ditF/roD0/GZVBBtO4mae
         y5vRl1QO5MC2DguBEZu3dvWwN2Yw8knx1R+4YYy0YuMyUKOLz+NjdkOoi6PhkETyvUA/
         iUjgTYbJynBrO7Uv7y8/v+9/ekmS+J+JjU6V3wPBPranC+YnhhwZ0NPT8MAWaRUAebr/
         PLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=RsXvca1pH5wDkl4rgesuw0AB5k3dKj44LEW8mtJ0a84=;
        b=M8tKCl/+6aAd2tp0+ScIvrj4IzRoO1m72E1gcIEdpnVfAFDWdX/uZGUXwjT28LgO15
         ZzIAjU6/vWbz+FcSAwuM9m15FfOK2rAivbbYCvCdkzL8ST4Qd2kemOjBwu7BRVaKkbkx
         39HfirWUaLWNwqYYfGAGj9C/sn5QWpw7pkcIyb8tQe/jLL38aw7Gy0oBMfAn8hGcpas7
         YROCYe5wBcEBYsHt3CXbn5t8d4HwuimTdI7FB6/kCti8F4V+bZjjZdO7Zso6IFYFFknu
         Qhu2Qs09zSOYWTo41l8YvoesGeNbl4fSeTo2vbbuFNT4/boos2+3XfObVKhKDHvzt7Ll
         bnSw==
X-Gm-Message-State: AOAM530/cZUVEt+5C92czYi0t3AQdB+BRksmciSzTU/MzNY15S6XuPHU
	LveQWiiCyJnIV+omdtoH4vMd+x7msgRkvA==
X-Google-Smtp-Source: ABdhPJwRM8ZjSapaRO93LVkxL7dlpjRBJMDkBsgIpZakDLkR1taK64RIj0ZaBEtCQAh6cDcVEyJNuQ==
X-Received: by 2002:a17:902:d506:b029:e1:17f4:37c0 with SMTP id b6-20020a170902d506b02900e117f437c0mr11125586plg.24.1612035469955;
        Sat, 30 Jan 2021 11:37:49 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:315d:c5e7:1295:54a9])
        by smtp.gmail.com with ESMTPSA id q197sm12518096pfc.155.2021.01.30.11.37.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jan 2021 11:37:49 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 04/13] iscsi-initiator-utils: Silence a clang warning on 64bit systems
Date: Sat, 30 Jan 2021 11:37:29 -0800
Message-Id: <f371ec5c245224730cbbfe6ce29d6bedfa3e530d.1612035229.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1612035229.git.akuster808@gmail.com>
References: <cover.1612035229.git.akuster808@gmail.com>

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

