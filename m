Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.2667.1614745014220441761
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 20:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EahLYfTi;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id p21so15362888pgl.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Mar 2021 20:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iTQEaTCNGWJqTIR4+sQ7vFgZPNYXnuZBwGtlB3QDRIs=;
        b=EahLYfTiFP6U/gsNR7k/Jf6VJ7gh03a06CJQOzVFEsq32vPiGbbOQIDQUCOtu93oGF
         Coe1SGDI823Ahh+F1WWvhjaM2lKoq+zm+NZ26CUs7JMEh/29us8pEKoddsdSOQh2p+Xz
         CPzV8fdDlCKEfKlg04QLWgSK8/VZ46qmdXCw38CSUZ9jhdC71UgxJUif0Jk2fRudouSg
         zSlMNLmlnJlYUvlxYpyagdPLs7LhFo04ZdRSHbIFG9rhyPN0/UHUjmmo7uJcmaKms22N
         PBb+72B5FsSZyGbOriYjhAs/tAWf4wZu6Mmi2bWPJLYJTs7Uu6sEBqClgUHoeDEyCkkc
         MM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iTQEaTCNGWJqTIR4+sQ7vFgZPNYXnuZBwGtlB3QDRIs=;
        b=gg4G5unqUPHoF9Ppfr+kM5w2AI+M+MIGEp8/ne3TcWZesT0jY+luMHxFkPh42QH6Aq
         tCm6RttRhY8h9wjwntyMMTksKFyha9aiXaW2IjrkNYD3S9YTpNdbUjsbnrXRJBAsJc4Q
         mWQMjz5WvSaWBLiylm0lHLC+6rw49qRL/RL5s+0FKaeRXJHxufyqsK/Eph12Dn3ND2yK
         AiyI2utcKDcasdILd1zFeWV1ij8lfuaYfOakzIXMRkUnygTt1S309cgLQfIzQ8Bfs5eT
         ggmCjqZcz00vQpFx4uB12qxQ5SQNi+3mjYiNcYFwbm+wXs5Ifh45z5cAr/OWZBix+YGa
         VUpQ==
X-Gm-Message-State: AOAM532X9Ifs6Zt57F5QSOZBLQmOuigxJNT6XC8UKUgwXxfz2Ad9nQSh
	V146N4vYde9z2/Xkg1jaOoUgDBUpRhtx5g==
X-Google-Smtp-Source: ABdhPJxF86WHDVrFV106hyfbj5792zX/PpsUW3SVj6/lmC2DFTrQJaUYGaExg0Gf/mELH51xgHkstQ==
X-Received: by 2002:aa7:940a:0:b029:1ee:39f8:766b with SMTP id x10-20020aa7940a0000b02901ee39f8766bmr6376229pfo.29.1614745013055;
        Tue, 02 Mar 2021 20:16:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id m9sm4824631pjl.4.2021.03.02.20.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 20:16:52 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/4] squid: Include <limits> for using std::numeric_limits
Date: Tue,  2 Mar 2021 20:16:47 -0800
Message-Id: <20210303041650.2457462-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Fix-build-on-Fedora-Rawhide-772.patch | 105 ++++++++++++++++++
 .../squid/{squid_4.13.bb => squid_4.14.bb}    |   6 +-
 2 files changed, 108 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/squid/files/0001-Fix-build-on-Fedora-Rawhide-772.patch
 rename meta-networking/recipes-daemons/squid/{squid_4.13.bb => squid_4.14.bb} (95%)

diff --git a/meta-networking/recipes-daemons/squid/files/0001-Fix-build-on-Fedora-Rawhide-772.patch b/meta-networking/recipes-daemons/squid/files/0001-Fix-build-on-Fedora-Rawhide-772.patch
new file mode 100644
index 0000000000..28a410c26f
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/0001-Fix-build-on-Fedora-Rawhide-772.patch
@@ -0,0 +1,105 @@
+From 1f8b5f0e1cc27634a7310be4c9674112f919d974 Mon Sep 17 00:00:00 2001
+From: uhliarik <luhliari@redhat.com>
+Date: Thu, 18 Feb 2021 01:08:40 +0000
+Subject: [PATCH] Fix build on Fedora Rawhide (#772)
+
+* add SYSTEMD_LIBS to all binaries using client_side.cc, fixing linking
+* add `<limits>` to all sources using std::numeric_limits, fixing gcc-11
+  builds
+---
+Upstream-Status: Backport [https://github.com/kraj/squid/commit/1f8b5f0e1cc27634a7310be4c9674112f919d974]
+ src/Makefile.am               | 4 ++++
+ src/ip/QosConfig.cc           | 1 +
+ src/ipc/mem/PageStack.cc      | 1 +
+ src/proxyp/Parser.cc          | 1 +
+ src/security/ServerOptions.cc | 2 ++
+ src/ssl/helper.cc             | 2 ++
+ 6 files changed, 11 insertions(+)
+
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -2320,6 +2320,7 @@ tests_test_http_range_LDADD = \
+ 	$(SSLLIB) \
+ 	$(KRB5LIBS) \
+ 	$(LIBCPPUNIT_LIBS) \
++	$(SYSTEMD_LIBS) \
+ 	$(COMPAT_LIB) \
+ 	$(XTRA_LIBS)
+ tests_test_http_range_LDFLAGS = $(LIBADD_DL)
+@@ -2624,6 +2625,7 @@ tests_testHttpRequest_LDADD = \
+ 	$(SSLLIB) \
+ 	$(KRB5LIBS) \
+ 	$(LIBCPPUNIT_LIBS) \
++	$(SYSTEMD_LIBS) \
+ 	$(COMPAT_LIB) \
+ 	$(XTRA_LIBS)
+ tests_testHttpRequest_LDFLAGS = $(LIBADD_DL)
+@@ -3487,6 +3489,7 @@ tests_testURL_LDADD = \
+ 	$(SSLLIB) \
+ 	$(KRB5LIBS) \
+ 	$(LIBCPPUNIT_LIBS) \
++	$(SYSTEMD_LIBS) \
+ 	$(COMPAT_LIB) \
+ 	$(XTRA_LIBS)
+ tests_testURL_LDFLAGS = $(LIBADD_DL)
+@@ -3646,6 +3649,7 @@ nodist_tests_testYesNoNone_SOURCES = \
+ tests_testYesNoNone_LDADD= \
+ 	base/libbase.la \
+ 	$(LIBCPPUNIT_LIBS) \
++	$(SYSTEMD_LIBS) \
+ 	$(COMPAT_LIB) \
+ 	$(XTRA_LIBS)
+ tests_testYesNoNone_LDFLAGS = $(LIBADD_DL)
+--- a/src/ip/QosConfig.cc
++++ b/src/ip/QosConfig.cc
+@@ -21,6 +21,7 @@
+ #include "Parsing.h"
+ 
+ #include <cerrno>
++#include <limits>
+ 
+ CBDATA_CLASS_INIT(acl_tos);
+ 
+--- a/src/ipc/mem/PageStack.cc
++++ b/src/ipc/mem/PageStack.cc
+@@ -14,6 +14,7 @@
+ #include "Debug.h"
+ #include "ipc/mem/Page.h"
+ #include "ipc/mem/PageStack.h"
++#include <limits>
+ 
+ /// used to mark a stack slot available for storing free page offsets
+ const Ipc::Mem::PageStack::Value Writable = 0;
+--- a/src/security/ServerOptions.cc
++++ b/src/security/ServerOptions.cc
+@@ -24,6 +24,8 @@
+ #endif
+ #endif
+ 
++#include <limits>
++
+ Security::ServerOptions &
+ Security::ServerOptions::operator =(const Security::ServerOptions &old) {
+     if (this != &old) {
+--- a/src/ssl/helper.cc
++++ b/src/ssl/helper.cc
+@@ -19,6 +19,8 @@
+ #include "ssl/helper.h"
+ #include "wordlist.h"
+ 
++#include <limits>
++
+ Ssl::CertValidationHelper::LruCache *Ssl::CertValidationHelper::HelperCache = nullptr;
+ 
+ #if USE_SSL_CRTD
+--- a/src/acl/ConnMark.cc
++++ b/src/acl/ConnMark.cc
+@@ -16,6 +16,8 @@
+ #include "http/Stream.h"
+ #include "sbuf/Stream.h"
+ 
++#include <limits>
++
+ bool
+ Acl::ConnMark::empty() const
+ {
diff --git a/meta-networking/recipes-daemons/squid/squid_4.13.bb b/meta-networking/recipes-daemons/squid/squid_4.14.bb
similarity index 95%
rename from meta-networking/recipes-daemons/squid/squid_4.13.bb
rename to meta-networking/recipes-daemons/squid/squid_4.14.bb
index 873d09344d..6d154c87e0 100644
--- a/meta-networking/recipes-daemons/squid/squid_4.13.bb
+++ b/meta-networking/recipes-daemons/squid/squid_4.14.bb
@@ -24,15 +24,15 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
            file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch \
            file://0001-tools.cc-fixed-unused-result-warning.patch \
            file://0001-splay.cc-fix-bind-is-not-a-member-of-std.patch \
+           file://0001-Fix-build-on-Fedora-Rawhide-772.patch \
            "
 
 SRC_URI_remove_toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
 
-SRC_URI[md5sum] = "31e524a416715d6bfef30e072d2ca076"
-SRC_URI[sha256sum] = "d09d3c31e3a7d158bda75501e763bd1cd3c3a99f5af6781ec1fd30eed2f771ed"
+SRC_URI[sha256sum] = "4ad08884f065f8e1dac166aa13db6a872cde419a1717dff4c82c2c5337ee5756"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://errors/COPYRIGHT;md5=4c3268f394af77fbbf541875cef96a6c \
+                    file://errors/COPYRIGHT;md5=0e03cd976052c45697ad5d96e7dff8dc \
                     "
 DEPENDS = "libtool krb5 openldap db cyrus-sasl"
 
-- 
2.30.1

