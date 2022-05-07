Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AA5C433FE
	for <webhook@archiver.kernel.org>; Sat,  7 May 2022 11:32:26 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.8978.1651923140043466580
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 May 2022 04:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KxtK+7cq;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id y21so11325455edo.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 May 2022 04:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U32jIOF24eWUiZUu2pzTVPINJHOrxUizWW1khgZYhwg=;
        b=KxtK+7cqf6bda6/emxwDBe/EzlB2Wem2qE4AxAGWCcQt3dpFvbS5XdGCRVvkOWwrtx
         gIh07T43dIfQQAXu+OCpkeCf55q5mKBLJ9jxidFUyVj8bu9EoLOzRTCojP16IZbadDi3
         lyfjlleiRboEAfDgTOf1twza5f+PGizHO+pUWC4FOfXbhR+/whAhr46N5UtLx35YMI77
         pnFwCn3XfmXnMdTulsA0kBcyqse/BFL6hSYkxoHXsu2GhATuOtNT7iXwzrzngYkiltJ0
         uqV84Q+G8Q8XwZoDQhgF38ZYVYqtG15kXryLbPKm/uQTrpXQfRo5bvgJ/mHY2TO4Rq7a
         vtow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U32jIOF24eWUiZUu2pzTVPINJHOrxUizWW1khgZYhwg=;
        b=i5os+OvJoACTzsJAd29AOyN24jy3yaLpm/W0GTemC/EBcSqcCEds+Dnh11ygqFx+dL
         eKCj1eYdDJBfd+weqpzx6GIJ497HuoYbjW2XJv6U+vb0Lknp+wD9DSiDb9FN8Zm6FZ3R
         aOTjZ+o1HCtfkh7lOwRll+erW4Q7eGyVTYmvYT8cSJcDUOhn3Ej97ci65NExnng9qZzh
         MCBVR0M3av3nh/lYJLNe3cvy4n6qQaZV81lTHLARWygMDeakZ5W5TkfZ95pdTIaXhkNs
         3oEcJ+oOPW5xwnGftBi13gv4e/qH/ZYR5gy0+Z890fA5WuC4B42STBIdt1o3oSP6to9Q
         yLsw==
X-Gm-Message-State: AOAM533eonR/moM4Wlq32WGq5NmwT6QQwVAw9bPqz92bKI3aa0PCPGxi
	LCUAdAW7Id7V0Bc1QDcdx+MzTEbASEY=
X-Google-Smtp-Source: 
 ABdhPJyrATMF9q5hFIS5LH0u/l0i5LuxBAJiw0i3ks5OgE4t1U+n4xCW8Qt9CNBETW225bVsqO8L6Q==
X-Received: by 2002:aa7:d6c1:0:b0:426:b7f4:21e8 with SMTP id
 x1-20020aa7d6c1000000b00426b7f421e8mr8200214edr.241.1651923138183;
        Sat, 07 May 2022 04:32:18 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 b21-20020aa7c915000000b0042617ba6380sm3462994edt.10.2022.05.07.04.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 04:32:17 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [meta-networking][PATCH 2/2] libcoap: Add recipe
Date: Sat,  7 May 2022 12:32:04 +0100
Message-Id: <20220507113204.16605-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507113204.16605-1-alex.kiernan@gmail.com>
References: <20220507113204.16605-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 May 2022 11:32:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96978

libcoap implements a lightweight application-protocol for devices that
are constrained their resources such as computing power, RF range,
memory, bandwith, or network packet sizes.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 ...alance-SESSIONS_ADD-and-SESSIONS_DEL.patch | 51 ++++++++++++++++
 ...0001-libcoap-Fix-gnu-configize-error.patch | 44 ++++++++++++++
 .../libcoap/libcoap/run-ptest                 |  7 +++
 .../recipes-devtools/libcoap/libcoap_4.3.0.bb | 58 +++++++++++++++++++
 4 files changed, 160 insertions(+)
 create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch
 create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch
 create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/run-ptest
 create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch b/meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch
new file mode 100644
index 000000000000..c8ac8485a0a1
--- /dev/null
+++ b/meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch
@@ -0,0 +1,51 @@
+From c56a64ff4df7eecb6c88ff929497bcd0d65934f2 Mon Sep 17 00:00:00 2001
+From: Jon Shallow <supjps-libcoap@jpshallow.com>
+Date: Fri, 22 Apr 2022 13:15:39 +0100
+Subject: [PATCH] coap_session.c: Balance SESSIONS_ADD and SESSIONS_DELETE
+ usage
+
+Upstream-Status: Backport [https://github.com/obgm/libcoap/commit/7e20aa9ef17277f39203334404e6c776b1171a7d]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Signed-off-by: Alex Kiernan <alexk@zuma.ai>
+---
+ src/coap_session.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/coap_session.c b/src/coap_session.c
+index 77cae598f0af..536e57573361 100644
+--- a/src/coap_session.c
++++ b/src/coap_session.c
+@@ -813,6 +813,12 @@ coap_session_create_client(
+   return session;
+ 
+ error:
++  /*
++   * Need to add in the session as coap_session_release()
++   * will call SESSIONS_DELETE in coap_session_free().
++   */
++  if (session)
++    SESSIONS_ADD(ctx->sessions, session);
+   coap_session_release(session);
+   return NULL;
+ }
+@@ -1133,11 +1139,17 @@ coap_session_t *coap_new_server_session(
+   if (session) {
+     coap_log(LOG_DEBUG, "***%s: new incoming session\n",
+              coap_session_str(session));
++    /* Returned session may already have been released and is now NULL */
+     session = coap_session_accept(session);
+   }
+   return session;
+ 
+ error:
++  /*
++   * Need to add in the session as coap_session_release()
++   * will call SESSIONS_DELETE in coap_session_free().
++   */
++  SESSIONS_ADD(ep->sessions, session);
+   coap_session_free(session);
+   return NULL;
+ }
+-- 
+2.35.1
+
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch b/meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch
new file mode 100644
index 000000000000..64f8d3acc812
--- /dev/null
+++ b/meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch
@@ -0,0 +1,44 @@
+From 25f1bebf1bc4c8da47f976d24a7a424253744e2e Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Wed, 24 Mar 2021 09:10:17 +0000
+Subject: [PATCH] libcoap: Fix gnu-configize error
+
+Fix:
+
+  autoreconf: running: gnu-configize
+  gnu-configize: 'configure.ac' or 'configure.in' is required
+  autoreconf: gnu-configize failed with exit status: 1
+
+We're not pulling in the ext/tinydtls submodule, so this fails.
+
+Upstream-Status: Inappropriate [oe-specific]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Signed-off-by: Alex Kiernan <alexk@zuma.ai>
+---
+ configure.ac | 13 -------------
+ 1 file changed, 13 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9f51f4c67557..559808e03aa2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -472,19 +472,6 @@ if test "x$build_dtls" = "xyes"; then
+         have_tinydtls="no" # don't confuse AC_MSG_RESULT at the end of the script
+     fi
+ 
+-    # The user wants to use explicit TinyDTLS if '--with-tinydtls was set'.
+-    if test "x$with_tinydtls" = "xyes" ; then
+-        if test -d "$srcdir/ext/tinydtls"; then
+-           AC_CONFIG_SUBDIRS([ext/tinydtls])
+-           have_tinydtls="yes"
+-         else
+-           have_tinydtls="no" # don't confuse AC_MSG_RESULT at the end of the script
+-         fi
+-         have_gnutls="no" # don't confuse AC_MSG_RESULT at the end of the script
+-         have_openssl="no" # don't confuse AC_MSG_RESULT at the end of the script
+-         have_mbedtls="no" # don't confuse AC_MSG_RESULT at the end of the script
+-    fi
+-
+     if test "$TLSCOUNT" -eq 0; then
+       # The user hasn't requested the use of a specific cryptography library
+       # we try first GnuTLS for usability ...
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/run-ptest b/meta-networking/recipes-devtools/libcoap/libcoap/run-ptest
new file mode 100644
index 000000000000..b56ffe68f34c
--- /dev/null
+++ b/meta-networking/recipes-devtools/libcoap/libcoap/run-ptest
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+if /usr/lib/libcoap/ptest/testdriver; then
+	echo "PASS: libcoap"
+else
+	echo "FAIL: libcoap"
+fi
diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb
new file mode 100644
index 000000000000..aba81d126a67
--- /dev/null
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb
@@ -0,0 +1,58 @@
+SUMMARY = "A C implementation of the Constrained Application Protocol"
+DESCRIPTION = "libcoap implements a lightweight application-protocol for \
+devices that are constrained their resources such as computing power, \
+RF range, memory, bandwith, or network packet sizes."
+HOMEPAGE ="https://libcoap.net/"
+
+LICENSE = "BSD-2-Clause & BSD-1-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e44b3af4925ec58e9f49b9ff143b5493"
+
+SRC_URI = "git://github.com/obgm/libcoap.git;branch=main;protocol=https \
+           file://0001-libcoap-Fix-gnu-configize-error.patch \
+           file://0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch \
+           file://run-ptest \
+           "
+SRCREV = "1da37b9abbe871675d5939395b498324ccc8ecfe"
+
+S = "${WORKDIR}/git"
+
+inherit autotools manpages pkgconfig ptest
+
+PACKAGECONFIG ?= "\
+    async openssl tcp \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
+"
+PACKAGECONFIG[async] = "--enable-async,--disable-async"
+PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls,,openssl mbedtls"
+PACKAGECONFIG[manpages] = "--enable-documentation --enable-doxygen --enable-manpages,--disable-documentation,asciidoc-native doxygen-native graphviz-native"
+PACKAGECONFIG[mbedtls] = "--with-mbedtls,--without-mbedtls,mbedtls,,gnutls openssl"
+PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,,gnutls mbedtls"
+PACKAGECONFIG[small-stack] = "--enable-small-stack,--disable-small-stack"
+PACKAGECONFIG[tcp] = "--enable-tcp,--disable-tcp"
+PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,cunit"
+
+EXTRA_OECONF = "\
+    --with-epoll --enable-add-default-names \
+    --without-tinydtls \
+    ${@bb.utils.contains_any('PACKAGECONFIG', 'gnutls openssl mbedtls', '--enable-dtls', '--disable-dtls', d)} \
+"
+
+python () {
+    if d.getVar('PTEST_ENABLED') == "1":
+        d.setVar('DISABLE_STATIC', '')
+}
+
+export SGML_CATALOG_FILES="file://${STAGING_ETCDIR_NATIVE}/xml/catalog"
+
+do_install_ptest () {
+	install -d ${D}${PTEST_PATH}
+	install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
+	install -m 0755 ${B}/tests/testdriver ${D}${PTEST_PATH}/testdriver
+}
+
+PACKAGE_BEFORE_PN += "\
+    ${PN}-bin \
+"
+
+FILES:${PN}-bin = "${bindir}"
+FILES:${PN}-dev += "${datadir}/${BPN}/examples"
-- 
2.35.1


