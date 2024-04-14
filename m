Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC21C4345F
	for <webhook@archiver.kernel.org>; Sun, 14 Apr 2024 15:24:37 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.559.1713108271127647311
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Apr 2024 08:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ji6HLiSJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e3ca4fe4cfso14558725ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Apr 2024 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713108270; x=1713713070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rBARxPyBG7z+3wfI1iT38+CrXJ0peZNJBk0RKEo220I=;
        b=Ji6HLiSJLR50zw5R9KUFaT6B8CeJw/7l8xmY7T5IpK32MX6YePCoCb8ZZqxEB7ZnjR
         qXjhow10F8dQcouvmiKh+3kYjbcoZptEObGDOznpfsMNKIX3REyfwJt/j4ki6cnF4Rdv
         CX7Bdcgy0v3J2NTI0iSnPoJz4ikkhM5nzHbGwuMNn2bOcDCTVuElBy9WjzBLeqsdjoFc
         GPH84IFQ46mdz+WrijeV7kNNP+3cC1c6IzoRZ4CZkwOKlJSp/sfef7ciAR3xBNmeNb6t
         3002V7dcobzy6TnhL5mPJnV75pg1zxe37xeRg1UJ66vgv3aHeFwB5fqsUROlMYRIn/7R
         Xx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713108270; x=1713713070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rBARxPyBG7z+3wfI1iT38+CrXJ0peZNJBk0RKEo220I=;
        b=UCOHQ+XDg/rrGAE4XWHsUXQYjy5x06J1uSuzP/6ADGKQa+vcZBLVzUrdP1gEWefHoR
         LTvcqCKdVD1ucbG7s7hmNxHcUUfQ69xuqh1o+4FgPZeAPe+gfewLF54gxhERjf0TV9PT
         z0ID2EvuJ4duKhhHau5LsuvhVFMG60u6DNT/PivTP4cPP2Wi7udyHzzke9HGNWCRbUyg
         8062Pq87c/N/1NYKr23fxw0e7lIDedQewpInwpv8wyI4hAIB0GElx4LwbcWS2kQlSSbV
         YZcAlM4xDNMHL9pVBQKbopXTltRkII04debCromM8/ZBn8XHD9U0A3ZLhFrSFf6Jp5/9
         qCyg==
X-Gm-Message-State: AOJu0Yy4sT9nHzicHGehh8dSY5CSi3uwgT4PFTvClfWmm12ylRTF1C/Z
	VFnKGdyUQqmnaz78zrk0EkN3OEE/gM5guGjx1OCBd3oMeCZpDm1AFC55sGxQ
X-Google-Smtp-Source: AGHT+IEK7iBhZyg22g3cUJVA8hVgVFQo3ri/qGx0iCfz1kEaPoIYiai9Y/2Thb4T8lPj0i1HZGNHRA==
X-Received: by 2002:a17:902:f68f:b0:1e2:a449:da15 with SMTP id l15-20020a170902f68f00b001e2a449da15mr8804244plg.15.1713108270106;
        Sun, 14 Apr 2024 08:24:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d35b])
        by smtp.gmail.com with ESMTPSA id w19-20020a170902c79300b001e27462b97fsm6118965pla.293.2024.04.14.08.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 08:24:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] freediameter: Upgrade to latest on master 1.5.0+
Date: Sun, 14 Apr 2024 08:24:27 -0700
Message-ID: <20240414152427.3449544-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Apr 2024 15:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109951

This also fixes all ptests, therefore move freediameter
out of PTESTS_PROBLEMS_META_NETWORKING to PTESTS_FAST_META_NETWORKING

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ptest-packagelists-meta-networking.inc    |  2 +-
 ...sctp.c-update-the-old-sctp-api-check.patch | 97 -------------------
 .../freediameter/files/run-ptest              |  6 +-
 ...iameter_1.4.0.bb => freediameter_1.5.0.bb} | 16 +--
 4 files changed, 14 insertions(+), 107 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/freediameter/files/0001-libfdcore-sctp.c-update-the-old-sctp-api-check.patch
 rename meta-networking/recipes-protocols/freediameter/{freediameter_1.4.0.bb => freediameter_1.5.0.bb} (89%)

diff --git a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
index 574e3a0aa1..7ec6f9063d 100644
--- a/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
+++ b/meta-networking/conf/include/ptest-packagelists-meta-networking.inc
@@ -7,6 +7,7 @@
 # ptests which take less than ~30s each
 
 PTESTS_FAST_META_NETWORKING = "\
+    freediameter \
     geoip \
     libcoap \
     libldb \
@@ -27,7 +28,6 @@ PTESTS_SLOW_META_NETWORKING = "\
 "
 
 PTESTS_PROBLEMS_META_NETWORKING = "\
-    freediameter \
     geoip-perl \
     libtevent \
     lksctp-tools \
diff --git a/meta-networking/recipes-protocols/freediameter/files/0001-libfdcore-sctp.c-update-the-old-sctp-api-check.patch b/meta-networking/recipes-protocols/freediameter/files/0001-libfdcore-sctp.c-update-the-old-sctp-api-check.patch
deleted file mode 100644
index d5e242ac21..0000000000
--- a/meta-networking/recipes-protocols/freediameter/files/0001-libfdcore-sctp.c-update-the-old-sctp-api-check.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From d527a0b7b63e43263384540b5525714484bb089f Mon Sep 17 00:00:00 2001
-From: Mingli Yu <Mingli.Yu@windriver.com>
-Date: Mon, 3 Sep 2018 14:40:56 +0800
-Subject: [PATCH] libfdcore/sctp.c: update the old sctp api check
-
-The initial sctp api check for freediameter as below:
- ===
- commit d3c5e991cb532ea09684d69fb4d0d58e9bc39a0c
-  Author: Sebastien Decugis <sdecugis@freediameter.net>
-  Date:   Mon Jun 3 12:05:37 2013 +0800
-    
-    Add some compliancy to RFC6458. Not tested however as Ubuntu does not support this yet
-    
-    [snip]
-    +/* Use old draft-ietf-tsvwg-sctpsocket-17 API ? If not defined, RFC6458 API will be used */
-    +/* #define OLD_SCTP_SOCKET_API */
-    +
-    +/* Automatically fallback to old API if some of the new symbols are not defined */
-    +#if (!defined(SCTP_CONNECTX_4_ARGS) || (!defined(SCTP_RECVRCVINFO)) || (!defined(SCTP_SNDINFO)))
-    +# define OLD_SCTP_SOCKET_API
-    +#endif
- ===
-
-SCTP_RECVRCVINFO is defined in <linux/sctp.h>,
-but <linux/sctp.h> is't included in the source code
-previouly. So defined(SCTP_RECVRCVINFO) can be 0 
-and it make old sctp socket api definiton in effect 
-as below:
- # define OLD_SCTP_SOCKET_API
-
-After lksctp-tools upgrade to 1.0.18, there is below
-commit introduced:
-===
-commit 3c8bd0d26b64611c690f33f5802c734b0642c1d8
-Author: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
-Date:   Tue Apr 17 20:17:14 2018 -0300
-
-    sctp.h: make use kernel UAPI header
-
-    and with that, remove tons of duplicated declarations. These were
-    lagging behind the kernel header, which is always the most updated one,
-    and as the library is intended to be run only on Linux, there is no
-    reason that we cannot re-use what is in there.
-
-    That said, this patch drops all duplicated declarations and includes
-    linux/sctp.h to bring them into lksctp-tools.
-
-    Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
-
- [snip]
- #include <stdint.h>
- #include <linux/types.h>
- #include <sys/socket.h>
-+#include <linux/sctp.h>
- [snip]
-===
-
-And above logic make defined(SCTP_RECVRCVINFO) to
-be 1 and the old sctp socket api macro as below
-won't be defined.
- # define OLD_SCTP_SOCKET_API
-
-And it encouters below build error:
-| /build/freediameter/1.2.1-r0/freeDiameter-1.2.1/libfdcore/sctp.c:1262:9: error: 'SCTP_SEND_FAILED_EVENT' undeclared (first use in this function); did you mean 'SCTP_SEND_FAILED'?
-    case SCTP_SEND_FAILED_EVENT:
-         ^~~~~~~~~~~~~~~~~~~~~~
-         SCTP_SEND_FAILED
-| /build/freediameter/1.2.1-r0/freeDiameter-1.2.1/libfdcore/sctp.c:1262:9: note: each undeclared identifier is reported only once for each function it appears in
-| /build/freediameter/1.2.1-r0/freeDiameter-1.2.1/libfdcore/sctp.c:1274:9: error: 'SCTP_NOTIFICATIONS_STOPPED_EVENT' undeclared (first use in this function); did you mean 'SCTP_AUTHENTICATION_EVENT'?
-    case SCTP_NOTIFICATIONS_STOPPED_EVENT:
-
-Update the old sctp socket api check to fix
-the above build error.
-
-Upstream-Status: Pending
-
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- libfdcore/sctp.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libfdcore/sctp.c b/libfdcore/sctp.c
-index c80a497..83440c7 100644
---- a/libfdcore/sctp.c
-+++ b/libfdcore/sctp.c
-@@ -48,7 +48,7 @@
- /* #define OLD_SCTP_SOCKET_API */
- 
- /* Automatically fallback to old API if some of the new symbols are not defined */
--#if (!defined(SCTP_CONNECTX_4_ARGS) || (!defined(SCTP_RECVRCVINFO)) || (!defined(SCTP_SNDINFO))) 
-+#if (!defined(SCTP_CONNECTX_4_ARGS) || (!defined(SCTP_NOTIFICATIONS_STOPPED_EVENT)) || (!defined(SCTP_SNDINFO)))
- # define OLD_SCTP_SOCKET_API
- #endif
- 
--- 
-2.7.4
-
diff --git a/meta-networking/recipes-protocols/freediameter/files/run-ptest b/meta-networking/recipes-protocols/freediameter/files/run-ptest
index 3c841644b7..7d0648935c 100644
--- a/meta-networking/recipes-protocols/freediameter/files/run-ptest
+++ b/meta-networking/recipes-protocols/freediameter/files/run-ptest
@@ -7,4 +7,8 @@ if ! lsmod | grep -q sctp && ! modprobe sctp 2>/dev/null; then
 fi
 
 cmake  -E cmake_echo_color --cyan "Running tests..."
-ctest --force-new-ctest-process
+if ctest --force-new-ctest-process ; then
+        echo "PASS: freediameter"
+else
+        echo "FAIL: freediameter"
+fi
diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
similarity index 89%
rename from meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
rename to meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
index 44fc46e3a8..0407384aae 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.4.0.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
@@ -13,22 +13,22 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 fd_pkgname = "freeDiameter"
 
-SRC_URI = "\
-    http://www.freediameter.net/hg/${fd_pkgname}/archive/${PV}.tar.gz;downloadfilename=${fd_pkgname}-${PV}.tar.gz \
+SRCPV .= "+git"
+SRCREV = "f9f1e464e6c675d222b3be4cab9c13408d544c83"
+SRC_URI = "git://github.com/freeDiameter/freeDiameter;protocol=https;branch=master \
     file://Replace-murmurhash-algorithm-with-Robert-Jenkin-s-ha.patch \
+    file://run-ptest \
     file://freediameter.service \
     file://freediameter.init \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://install_test.patch file://run-ptest file://0001-tests-use-EXTENSIONS_DIR.patch', '', d)} \
     file://freeDiameter.conf \
-    file://0001-libfdcore-sctp.c-update-the-old-sctp-api-check.patch \
+    file://install_test.patch \
+    file://0001-tests-use-EXTENSIONS_DIR.patch \
     "
 
-SRC_URI[sha256sum] = "7a537401bd110c606594b7c6be71b993f0ccc73ae151ad68040979286ba4e50e"
-
-S = "${WORKDIR}/${fd_pkgname}-${PV}"
+S = "${WORKDIR}/git"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=69bdc1d97648a2d35914563fcbbb361a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=868c059b6147748b1d621e500feeac4f"
 
 PTEST_PATH = "${libdir}/${fd_pkgname}/ptest"
 
-- 
2.44.0


