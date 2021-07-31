Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.5176.1627747613696956928
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Jul 2021 09:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ro3sJv9O;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id a4-20020a17090aa504b0290176a0d2b67aso25287773pjq.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Jul 2021 09:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XBMTrwr3KZ7efyytj/HxQ45CYjcG7d+I6st1U+KEOqg=;
        b=Ro3sJv9OSVNpqJ5AryxOyxw8PwRSCc8/XSnLT1N5uYmiPqUgsUPejpHIdL/Hcp1pkh
         6sBmkw+nLBEDsWrGXnLKhH8PRxJUWRv2UexNU6ndVo7iLepcXbTuxZ3Bg36slYwjuZWN
         BN5FYv6xijLfA2WUeLPYifw5Hc+yJ0r8bVjEIR7keyWMog/20MC1FqKgkagjrSZMNp/m
         tcaFsxEr/zI4P7ZbEXO5dC1bnJ8VrM7fY5wKmLsINlRfV8/2bGiVnEBYumtCbi8DGWDW
         pDkmtO6znVz0N8L55rc8K4/9nrWTUDizixT7bkw+FkhOiC33iAhL/YsXxC5AindbCmwx
         2Qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XBMTrwr3KZ7efyytj/HxQ45CYjcG7d+I6st1U+KEOqg=;
        b=Z5O09PCs3Z43yBgZ7MOFCvkuGqToDTQdhWNTFFjJP9kyqd6gt/iuSYZP2obNdGiC3H
         3dDNdmJRp0MfDSNKbil0cFY1C06RvvHtTyrZ97L+OMsl1XR+jPi6vqRcwdBN4ESyQod2
         tTMaBbFpTGgPHihcxCmL9DeshjvkLdV4K4f1bcheBSJ+0x6e/ZTfkQGuCV7X1QuXZgrF
         HjHuaHV08pDW8UwX0neEclNpC7w1hA8md2Wr5thctDRD1sNSAC3Pmyr8Gpo2VYqCBgOz
         6Cr5mohC58Z9DIgC+wqoZdOqWanh6EwSCxwuARHTvCvGh9xY0EBImVarYN55SbTqdfJV
         qSSw==
X-Gm-Message-State: AOAM533qgnMJg6RBYIjb+EYqkuWxCMRZkEE3QvZrcvLUe2Xu57vw3lhy
	owiGpVuHrWnXbcV2AHWOpALwXpk6X9/deg==
X-Google-Smtp-Source: ABdhPJzHej9WU+u+kz9irmKqBLmUT/3n3UO1IJ7/p8L6YyfXZx2vZLy6EjpWv3fAI2+dRYeCQKf5ug==
X-Received: by 2002:a62:7c4d:0:b029:3b0:b284:fd9c with SMTP id x74-20020a627c4d0000b02903b0b284fd9cmr6438518pfc.11.1627747612829;
        Sat, 31 Jul 2021 09:06:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id w22sm6007518pfn.188.2021.07.31.09.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 09:06:52 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] addcli: check for ns_get16 and ns_get32
Date: Sat, 31 Jul 2021 09:06:50 -0700
Message-Id: <20210731160650.3544476-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes build with glibc 2.34+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/adcli/adcli_0.9.0.bb |  3 +-
 ...ck-for-ns_get16-and-ns_get32-as-well.patch | 39 +++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/adcli/files/0001-configure-check-for-ns_get16-and-ns_get32-as-well.patch

diff --git a/meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb b/meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb
index 76df27851b..074292b43b 100644
--- a/meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb
+++ b/meta-networking/recipes-connectivity/adcli/adcli_0.9.0.bb
@@ -8,6 +8,7 @@ SRCREV = "1b1528038e084a9f81ea108cffca9c2707623b9c"

 SRC_URI = "git://gitlab.freedesktop.org/realmd/adcli;branch=master \
            file://Fixed-build-error-on-musl.patch \
+           file://0001-configure-check-for-ns_get16-and-ns_get32-as-well.patch \
 	   "

 S = "${WORKDIR}/git"
@@ -15,7 +16,7 @@ S = "${WORKDIR}/git"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"

-inherit autotools xmlcatalog
+inherit autotools xmlcatalog

 DEPENDS += "virtual/crypt krb5 openldap gettext libxslt xmlto libxml2-native \
             cyrus-sasl libxslt-native xmlto-native coreutils-native\
diff --git a/meta-networking/recipes-connectivity/adcli/files/0001-configure-check-for-ns_get16-and-ns_get32-as-well.patch b/meta-networking/recipes-connectivity/adcli/files/0001-configure-check-for-ns_get16-and-ns_get32-as-well.patch
new file mode 100644
index 0000000000..8cc859318c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/adcli/files/0001-configure-check-for-ns_get16-and-ns_get32-as-well.patch
@@ -0,0 +1,39 @@
+From 98660f57a98f45dbf55414cfde46338019adcc33 Mon Sep 17 00:00:00 2001
+From: Sumit Bose <sbose@redhat.com>
+Date: Wed, 28 Jul 2021 12:55:16 +0200
+Subject: [PATCH] configure: check for ns_get16 and ns_get32 as well
+
+With newer versions of glibc res_query() might ba already available in
+glibc with ns_get16() and ns_get32() still requires libresolv.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/realmd/adcli/-/commit/e841ba7513f3f8b6393183d2dea9adcbf7ba2e44]
+Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1984891
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ebc6cb4..e8775d0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -98,13 +98,15 @@ AC_SUBST(LDAP_CFLAGS)
+ # -------------------------------------------------------------------
+ # resolv
+
+-AC_MSG_CHECKING(for which library has res_query)
++AC_MSG_CHECKING([for which library has res_query, ns_get16 and ns_get32])
+ for lib in "" "-lresolv"; do
+ 	saved_LIBS="$LIBS"
+ 	LIBS="$LIBS $lib"
+ 	AC_LINK_IFELSE([
+ 		AC_LANG_PROGRAM([#include <resolv.h>],
+-		                [res_query (0, 0, 0, 0, 0)])
++		                [res_query (0, 0, 0, 0, 0);
++		                 ns_get32 (NULL);
++		                 ns_get16 (NULL);])
+ 	],
+ 	[ AC_MSG_RESULT(${lib:-libc}); have_res_query="yes"; break; ],
+ 	[ LIBS="$saved_LIBS" ])
+--
+2.32.0
--
2.32.0
