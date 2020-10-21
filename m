Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web09.14382.1603297355546624683
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 09:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UnzCB5ht;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id e7so1752346pfn.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2020 09:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hHys1kADT+oxdWV9d7v8g7a62tqAo3BwEhaNV4k+s4g=;
        b=UnzCB5htzEoqDpT6QsmDD+Q7AL0Sezk3vAJPUvyQiK2KhDJdJrdN3dDMHbrOJtcqxu
         FQ8En8/pyklQHQQXb9Ms4+UzREUWK1SWpGBj59i8HE4hoNKeZAzxaqMlqPq0RmjkEV5s
         Qyu5DtbIkDlVcaD0y3IOcteEiv9Ad4kQQC4qjTHVrfPrSAYkQD5Zq6yr9gcbmUW097SS
         +cPcUVaTwWg2iNjUzLRifWl3D+HCYfqJ7Y+/avHSDvmkju8VtO4rd9u4tLNQIcNcx8hv
         OxNsLXxZBt06GWL+BIQYa5A53hCYIYZE3FuIChYwCXFKSwoNuPvQckkONDPCZ2z2rux1
         4S4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hHys1kADT+oxdWV9d7v8g7a62tqAo3BwEhaNV4k+s4g=;
        b=rFIEqrzqmZs/Cw//bpF1Aw/EW3USjalAUanvZOX/+QYt8R03lQRkwIBToRkDAz5T4B
         aKjjxmVHhBFyxM4WNuDLNPRn262IkVIL1nf9TSnS6Y0AKb9dy9NMRKl0Hdfalu+OCJW/
         aFdWDHJttU4v+ZnuUTOlKm7PK7HDJG7ZSloQhgRpUXsnFBco8keSbwMhPYzGs9Aq/dJt
         cXoV8A3AA+nbMS1fqklfMLWQPo4MFszzJ0lvk8Gmq7peowyp4NdX99fQjpZPkYRifJYn
         keAdbfEZ4XAxRIV4g9C2yUMJoasD3yZJt+UU+kZkGqo2IS67EsUFQxD1AmK06CTLUGxR
         E3Zg==
X-Gm-Message-State: AOAM533yT+tiLJWndwURKR5BmJzUpHAAmMLQrADUUv3Nt/rVVDkbRj9Z
	HyR7rg8duTGqv7H0Ga9ZWyTo6Kn3XvoSVA==
X-Google-Smtp-Source: ABdhPJzyfU7G9n8hsgUPNWaJVneSBddhZNZmrdlnzdltuiw3gYtAtDidpxc+6nvWWw/fT+NRFGOerw==
X-Received: by 2002:a63:3543:: with SMTP id c64mr4097268pga.380.1603297351566;
        Wed, 21 Oct 2020 09:22:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::3958])
        by smtp.gmail.com with ESMTPSA id s23sm2902875pgl.47.2020.10.21.09.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 09:22:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] iscsi-initiator-utils: Silence a clang warning on 64bit systems
Date: Wed, 21 Oct 2020 09:22:28 -0700
Message-Id: <20201021162228.2028438-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This unbreaks the build with clang as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.29.0

