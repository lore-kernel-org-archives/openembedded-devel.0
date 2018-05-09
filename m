Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id A52B174F9A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 19:00:23 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id p14so14700964pfh.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 12:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Nc+gMPi/zvF0tIM1ZkVzDDAy/1QQMLABC8Uc5iQoBLw=;
	b=oYoMWYBEuDmd3eM5H1FIMLorO5sCO8UY6dtzgyccCZfyswkgeArNIbTYD2AMMM5emB
	RUaZ9NdZrm7Qg090YQH2A/IgqVs7s8I4zppS1hjjcEKGBgFhHssIDCu0rvhAYa35JEeD
	QVe32QDzjbSdQCH7CRzdX68z4v0eayptuRaPlzm+zIuZ8+EwkqdG8swPL8QDstOTZyn5
	uEkPR7CUW9T2G0aOsQrozCvFej26YpYCWNf5sIZ9BNCg+XoklJcvMf1IWGpK+9fiYZo7
	SiR56m7zpWBOSMic/uL87/RXYl/+ta6tlRBLxs/kG3vRAi9jWEtJJLRX20eS7vFwJVST
	u26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Nc+gMPi/zvF0tIM1ZkVzDDAy/1QQMLABC8Uc5iQoBLw=;
	b=s0Ce+JQ2pdaYx0RUGVQt9F/M3Oi71uCbjlcQM4aPm+BWz3ZlPJNbacGmkXPws20eLO
	/8ox0JeH0LjFHfYIJKoFNjy4oeqo5R+rbnrSeO5z/VVZ4HzNOY1MkvtNeixxvzNkBauP
	50w/ycVGrD84Ask6NsvLngyuap5iEGWVQTukv47ykgm54PPDBxlNmAiVkohjil/ftnpF
	hxM761pZOpdILBii/WF7whi0JbZoUvoiifJdQFkuS2v56ARMZrLV7CbY+qSmkP41Enu+
	3YrTlO9LLj2+wbWDE4iIEJ76g8FmrWcnZEEijM8Mt0JifTatKO53KMmebTimfabE+kAx
	i5dA==
X-Gm-Message-State: ALQs6tAIAxCluo+A1Da+MEYdQoQ0mc+pFaPoxnJ0N6sJfOl3oh+x9+iI
	Ih46lUACTdANm1x5Ry/yC+DQpA==
X-Google-Smtp-Source: AB8JxZpeU9NR0hdcQQDRdhwJizrP39TkQyClB4lfQJFy3t6lcdG0Vm8TSdkXpJR+hvjtx5lfJcQVZQ==
X-Received: by 10.98.156.13 with SMTP id f13mr43511136pfe.15.1525892424093;
	Wed, 09 May 2018 12:00:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	131sm27732437pfa.128.2018.05.09.12.00.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 12:00:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 12:00:00 -0700
Message-Id: <20180509190011.30006-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509190011.30006-1-raj.khem@gmail.com>
References: <20180509190011.30006-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 05/16] openl2tp: Fix build without glibc's rpc/nsl support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2018 19:00:23 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-include-rpc-clnt.h-for-resultproc_t.patch | 31 ----------------
 ...-kernel-headers-assumptions-on-glibc.patch | 36 -------------------
 .../openl2tp/openl2tp_1.8.bb                  | 15 +++-----
 3 files changed, 5 insertions(+), 77 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api.c-include-rpc-clnt.h-for-resultproc_t.patch
 delete mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/0004-Adjust-for-linux-kernel-headers-assumptions-on-glibc.patch

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api.c-include-rpc-clnt.h-for-resultproc_t.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api.c-include-rpc-clnt.h-for-resultproc_t.patch
deleted file mode 100644
index a11a97ebde..0000000000
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api.c-include-rpc-clnt.h-for-resultproc_t.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 8f299df4dd1ca857e34859c377a29b183c630961 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 21 Sep 2017 13:05:03 -0700
-Subject: [PATCH] l2tp_api.c: include rpc/clnt.h for 'resultproc_t'
-
-Fixes
-
-| /mnt/a/oe/build/tmp/work/mips32r2-bec-linux-musl/openl2tp/1.8-r0/recipe-sysroot/usr/include/tirpc/rpc/pmap_clnt.h:81:12: error: unknown type name 'resultproc_t'; did you mean 'rpcproc_t'?                                                 |             resultproc_t);                                                                                                                                                                                                                  |             ^~~~~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- l2tp_api.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/l2tp_api.c b/l2tp_api.c
-index f0946fd..f77881c 100644
---- a/l2tp_api.c
-+++ b/l2tp_api.c
-@@ -26,6 +26,7 @@
- #include <sys/types.h>
- #include <rpc/types.h>
- #include <rpc/xdr.h>
-+#include <rpc/clnt.h>
- #include <rpc/pmap_clnt.h>
- //#include <netinet/in.h>
- 
--- 
-2.14.1
-
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0004-Adjust-for-linux-kernel-headers-assumptions-on-glibc.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0004-Adjust-for-linux-kernel-headers-assumptions-on-glibc.patch
deleted file mode 100644
index 0fcba6546a..0000000000
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp/0004-Adjust-for-linux-kernel-headers-assumptions-on-glibc.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From ede4ae8e25f9fb746a6f4e076d0ef029938d2880 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 28 Mar 2017 11:46:56 -0700
-Subject: [PATCH 4/4] Adjust for linux-kernel headers assumptions on glibc
-
-Fixes build issues e.g.
-
-In file included from /mnt/a/build/tmp-musl/work/cortexa7hf-neon-vfpv4-oe-linux-musleabi/openl2tp/1.8-r0/recipe-sysroot/usr/include/linux/if_pppox.h:24:
-/mnt/a/build/tmp-musl/work/cortexa7hf-neon-vfpv4-oe-linux-musleabi/openl2tp/1.8-r0/recipe-sysroot/usr/include/linux/if.h:97:2: error: expected identifier
-        IFF_LOWER_UP                    = 1<<16, /* __volatile__ */
-        ^
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- plugins/ppp_unix.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/plugins/ppp_unix.c b/plugins/ppp_unix.c
-index 869066f..5c1e44f 100644
---- a/plugins/ppp_unix.c
-+++ b/plugins/ppp_unix.c
-@@ -21,6 +21,11 @@
-  * Plugin to use the standard UNIX pppd
-  */
- 
-+/* hack to make sure kernel headers understand that libc (musl)
-+ * does define IFF_LOWER_UP et al.
-+ */
-+#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
-+
- #include <unistd.h>
- #include <fcntl.h>
- #include <sys/types.h>
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index 1f6b4ded32..e51a101a0d 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9d9259cbbf00945adc25a470c1d3585 \
                     file://usl/LICENSE;md5=9c1387a3c5213aa40671438af3e00793 \
                     "
 
-DEPENDS = "popt flex readline"
+DEPENDS = "popt flex readline rpcsvc-proto-native"
 
 SRC_URI = "ftp://ftp.openl2tp.org/releases/${BP}/${BP}.tar.gz \
            file://Makefile-modify-CFLAGS-to-aviod-build-error.patch \
@@ -34,12 +34,7 @@ SRC_URI = "ftp://ftp.openl2tp.org/releases/${BP}/${BP}.tar.gz \
            file://openl2tpd-enable-tests.patch \
            file://run-ptest \
            file://fix_linux_4.15_compile.patch \
-           "
-
-SRC_URI_append_libc-musl = "\
-           file://0004-Adjust-for-linux-kernel-headers-assumptions-on-glibc.patch \
            file://0002-user-ipv6-structures.patch \
-           file://0001-l2tp_api.c-include-rpc-clnt.h-for-resultproc_t.patch \
            "
 SRC_URI[md5sum] = "e3d08dedfb9e6a9a1e24f6766f6dadd0"
 SRC_URI[sha256sum] = "1c97704d4b963a87fbc0e741668d4530933991515ae9ab0dffd11b5444f4860f"
@@ -49,10 +44,10 @@ inherit autotools-brokensep pkgconfig systemd ptest
 SYSTEMD_SERVICE_${PN} = "openl2tpd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-DEPENDS_append_libc-musl = " libtirpc"
-CPPFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
-CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
-LDFLAGS_append_libc-musl = " -ltirpc"
+DEPENDS += "libtirpc"
+CPPFLAGS += "-I${STAGING_INCDIR}/tirpc"
+CFLAGS += "-I${STAGING_INCDIR}/tirpc"
+LDFLAGS += "-ltirpc"
 
 PARALLEL_MAKE = ""
 EXTRA_OEMAKE = 'CFLAGS="${CFLAGS} -Wno-unused-but-set-variable" CPPFLAGS="${CPPFLAGS}" OPT_CFLAGS="${CFLAGS}"'
-- 
2.17.0


