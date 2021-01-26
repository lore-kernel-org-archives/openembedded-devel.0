Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web11.8446.1611637902555427902
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 21:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MG4XvRpS;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: akuster808@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id 16so840505ioz.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Jan 2021 21:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6U9S+Vo+GBUY02nR+tMpwzTcY9s8pN/CmnMv66dcyfc=;
        b=MG4XvRpSmTCfJJyQNZaOAqhmjIrtotLIUoFcJTEv8FmWyzfgKBGa6U+EHqcThRFYXL
         H/Cp8kNMXg60NlsdOTmaGS3wYChQjyDEWC9b6PKZ3OAiV7WJAKY1Kc9vGHDzxRhw2is5
         x+NxpPEOleMujkC5d54/B6XI+wrTNAmxpmogejojdZfuYFTYkfga2ItNCg1CpQG7htya
         vvaA22NQZ3oef2ze69IkKgSvnFc27H2hrB9s6lsB3/PlyrcwAqVJcG15baSqQMK1/VpA
         uDEyXyp7mw48iz6t5BShbd9roaiyYKacP+buNOqVx1tWVvTtmQIIbNEJ41g+/YLD1Unc
         P2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6U9S+Vo+GBUY02nR+tMpwzTcY9s8pN/CmnMv66dcyfc=;
        b=SI1Of+srm8DXwoj1Nh4W/Ms82maL9R7avZVEBiEuz+/MUJPlp56jOL7PvFi4w4FBYP
         uoplGYIK13g3NXBsDibvqu8td//bAOzvd0CuVRfTTfsXgvuHhviOinWzkwG1KaPHeAvw
         9urQyIoAX6niKq9mb66HQpo+0K7vbBEaqRjmwMLNqzx4/lp+G+SX/9gGLhgTUfQSfRe0
         MnmX4VHgmqHQP4KFe/Vqwg61NrChMJJYC0IbUIz4nSatdpulpMxUSGVIdanJvbkk84dA
         NzQQl2kfCrQkQdiySc4zDJxSkeDkssvy+snxGa0UQEJIFd1Qr6j3SzdrwGwJMJlwAZHk
         4YUg==
X-Gm-Message-State: AOAM5332WYCrDdy2iM3jgBr9KCIROewhBKvW89eUCqRjgf5x0D4KobZL
	gGzur4UEuSpbY8K5KsQIYQzfHE8mDTO++A==
X-Google-Smtp-Source: ABdhPJzYu+F5QiR+IA9m8RYYZOa88NFavCYkFA3VektLxE+Yo3+cfFyTAP6h1ijVl1V+6wPorR7slA==
X-Received: by 2002:a02:c76b:: with SMTP id k11mr3429283jao.57.1611637901816;
        Mon, 25 Jan 2021 21:11:41 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:5442:4b7c:f358:5471])
        by smtp.gmail.com with ESMTPSA id l7sm12039974iln.74.2021.01.25.21.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 21:11:41 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: zangrc <zangrc.fnst@cn.fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [meta-networking][dunfell][PATCH 3/3] iscsi-initiator-utils: upgrade 2.1.2 -> 2.1.3
Date: Mon, 25 Jan 2021 21:11:38 -0800
Message-Id: <20210126051138.15194-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210126051138.15194-1-akuster808@gmail.com>
References: <20210126051138.15194-1-akuster808@gmail.com>

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

