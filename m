Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D412EF36BAC
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 05:15:31 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.149869.1775798123205233599
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 22:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AuP0xnyb;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b6b0500e06so2463831eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 22:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775798122; x=1776402922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e2J25CxyM7zHgvDYAvziSRjVldGpiaIro/jbeCvP/hg=;
        b=AuP0xnybN4yyrnpt2BJMDHVV/wxRxatJQmiePgllla0IFzkUOYtMNV03tBLPUtRC/Z
         5BiOnrkYxrwYZTpq5Ag7zfp9znskElwA/FepdY6rFoi50mDdnAlp4gPo3s6seBo2Ipd0
         MYQOPzPjXz1B7kMaDLxHMeMCQKQeA16u7lml6x5zgViu122/Wut2c7f4MVqWbqzlLeya
         ZKe0WEgm+XauZ/LmlDZNTbML4P8ylaUhTs5+1HcAbYbcymix6ecY24SB2ofrV2Kc0p1D
         QgzcfkI1ajJt6Bp0t4ONMuCxT1vREfhFH2z5Zqad4Zx+RY7bSaGbr9K3In/LfmQ8QzEW
         Pjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775798122; x=1776402922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2J25CxyM7zHgvDYAvziSRjVldGpiaIro/jbeCvP/hg=;
        b=QB9M0KmiVg7nwwTKZ1Z+ZwKLEpSk2dRqHETmv+Hb1E4j+J7icvMgQNk6dTmNPB2BOV
         mu303DJmfnk17D51rqs8UpQgkswnS3wHcIS82XP5bhc5JkOTCVKMel0erZ7qXFotQhv/
         Kd8IDa70h9+Rh4VZbn899vUMglWFdWRxNyr+HwUo9M5QbYHJh/fMPkMdwDAHwbEV0RZF
         SCA2aE7AIVFLLiEq/XnYDB2KsGkx2g+w0Uv7Ns8u9Jo1QC2XcCQWZa16toHyxyegPfeh
         7Si7y8RBk7Pf+Q5l6GbScGrtxw3SqLuz2Lqd0Xqb3bVN4O0ts8XRP+zRVtvee9dxNbwM
         44vQ==
X-Gm-Message-State: AOJu0YwPf6EOYZS4L+/KDieCxou2CLGpGJ181lqqOjh3ffEKaQhZKG0V
	Jt80rAlemZ6FZPXTFJu8F87ednivO0J/erRaMzL1n25EACjePbxDE9uiE+asHw==
X-Gm-Gg: AeBDievzL49JG+veS4WM5xC+qyO08fO+5T6o7crwauifQqOi8qShR3Rm0siRA3nMylP
	lO0h059A+PJXcLJYlNPgrhY5YTlQLYP4eU5T75KpBeCFan+UJjIjCyXFFxnxp2Wf5dZ5AHiu3Y4
	mGnLl7PPcsvK/mHrlriQolR3EvyISVCmUcCjTIsu22ogZ67THFrq3y9iARSI864skQwq8t8+UiA
	dag2dMEW/ojmnAL6ps3WOGfrkn6pBx9XD79JyeVc3Wo3FF+W1j5KH2vfGkwfT6LLN09sz+O5YC1
	YVZ72FagoLFejGy9HFsHbM8ehfcyM6+Gv8i/TIs2kyJU5fDs7qiGHoumdxGKKQ9g9+0ceYxEQxe
	ByVRGCcypIqXgE6rGr79JXDuo38zG1uiDD4DRuTOVVOyHYEz9+YdM56eW8go7pJOlJWNy0/ALaT
	CTl6KdfN/r5EHVS6+4qDyputIT0Sf6bvcE/fnLFIxX05rhtBE0Kx2Xc2Ln4m9gmCnbmuy5cNS+/
	tXayTlIRZVQMkuRIe6UDrjN08K7P9sl8vCzpAA0v3/fgLscTJRD5qmAxdkV
X-Received: by 2002:a05:7022:128e:b0:128:d786:8ac8 with SMTP id a92af1059eb24-12c34dd5b55mr940261c88.0.1775798121726;
        Thu, 09 Apr 2026 22:15:21 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55f5c69casm3360339eec.2.2026.04.09.22.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 22:15:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH] freeradium: Update to latest on 3.2 release
Date: Thu,  9 Apr 2026 22:15:18 -0700
Message-ID: <20260410051518.425767-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 05:15:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126212

Drop backports which are already in this SHA update

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...y-provider-on-enable-fips-workaround.patch |  62 -------
 ...y-provider-on-enable-fips-workaround.patch | 104 -----------
 ...r-for-expansion-of-macro-in-thread.h.patch |  61 ------
 .../files/0018-update-license-1.patch         | 175 ------------------
 .../files/0019-update-license-2.patch         |  52 ------
 .../files/0020-update-license-3.patch         | 101 ----------
 .../freeradius/freeradius_3.2.8.bb            |  12 +-
 7 files changed, 4 insertions(+), 563 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-don-t-load-legacy-provider-on-enable-fips-workaround.patch
 delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/0002-don-t-load-legacy-provider-on-enable-fips-workaround.patch
 delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/0010-fix-error-for-expansion-of-macro-in-thread.h.patch
 delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/0018-update-license-1.patch
 delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/0019-update-license-2.patch
 delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/0020-update-license-3.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-don-t-load-legacy-provider-on-enable-fips-workaround.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-don-t-load-legacy-provider-on-enable-fips-workaround.patch
deleted file mode 100644
index 594286cdcf..0000000000
--- a/meta-networking/recipes-connectivity/freeradius/files/0001-don-t-load-legacy-provider-on-enable-fips-workaround.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 2c2c6a460ae8cc655df83c8964595581389676c1 Mon Sep 17 00:00:00 2001
-From: "Alan T. DeKok" <aland@freeradius.org>
-Date: Tue, 9 Sep 2025 07:03:21 -0400
-Subject: [PATCH] don't load legacy provider on --enable-fips-workaround.
- Fixes #5644
-
-Upstream-Status: Backport
-[https://github.com/FreeRADIUS/freeradius-server/commit/2c2c6a460ae8cc655df83c8964595581389676c1]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/main/tls.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/src/main/tls.c b/src/main/tls.c
-index ba267983b1..c04f3228e4 100644
---- a/src/main/tls.c
-+++ b/src/main/tls.c
-@@ -64,8 +64,11 @@ USES_APPLE_DEPRECATED_API	/* OpenSSL API has been deprecated by Apple */
- #  include <openssl/provider.h>
-
- static OSSL_PROVIDER *openssl_default_provider = NULL;
-+
-+#ifndef WITH_FIPS
- static OSSL_PROVIDER *openssl_legacy_provider = NULL;
- #endif
-+#endif
-
- #define LOG_PREFIX "tls"
-
-@@ -3693,6 +3696,7 @@ int tls_global_init(TLS_UNUSED bool spawn_flag, TLS_UNUSED bool check)
- 		return -1;
- 	}
-
-+#ifndef WITH_FIPS
- 	/*
- 	 *	Needed for MD4
- 	 *
-@@ -3703,6 +3707,7 @@ int tls_global_init(TLS_UNUSED bool spawn_flag, TLS_UNUSED bool check)
- 		ERROR("(TLS) Failed loading legacy provider");
- 		return -1;
- 	}
-+#endif
- #endif
-
- 	return 0;
-@@ -3777,10 +3782,12 @@ void tls_global_cleanup(void)
- 	}
- 	openssl_default_provider = NULL;
-
-+#ifndef WITH_FIPS
- 	if (openssl_legacy_provider && !OSSL_PROVIDER_unload(openssl_legacy_provider)) {
- 		ERROR("Failed unloading legacy provider");
- 	}
- 	openssl_legacy_provider = NULL;
-+#endif
- #endif
-
- 	CONF_modules_unload(1);
---
-2.43.0
-
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0002-don-t-load-legacy-provider-on-enable-fips-workaround.patch b/meta-networking/recipes-connectivity/freeradius/files/0002-don-t-load-legacy-provider-on-enable-fips-workaround.patch
deleted file mode 100644
index 84b78320c4..0000000000
--- a/meta-networking/recipes-connectivity/freeradius/files/0002-don-t-load-legacy-provider-on-enable-fips-workaround.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 2ff8eb44bb626e9e63f9bf06c3bcf3b34291c335 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Tue, 31 Mar 2026 07:45:16 -0400
-Subject: [PATCH] don't load legacy provider on --enable-fips-workaround. Fixes
- #5775
-
-Upstream-Status: Backport
-[https://github.com/FreeRADIUS/freeradius-server/commit/2ff8eb44bb626e9e63f9bf06c3bcf3b34291c335]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/main/radclient.c                | 6 ++++++
- src/modules/rlm_mschap/smbencrypt.c | 6 ++++++
- 2 files changed, 12 insertions(+)
-
-diff --git a/src/main/radclient.c b/src/main/radclient.c
-index ea64486dcf..52555603e1 100644
---- a/src/main/radclient.c
-+++ b/src/main/radclient.c
-@@ -168,7 +168,9 @@ static int _rc_request_free(rc_request_t *request)
- #  include <openssl/provider.h>
-
- static OSSL_PROVIDER *openssl_default_provider = NULL;
-+#ifndef WITH_FIPS
- static OSSL_PROVIDER *openssl_legacy_provider = NULL;
-+#endif
-
- static int openssl3_init(void)
- {
-@@ -181,6 +183,7 @@ static int openssl3_init(void)
- 		return -1;
- 	}
-
-+#ifndef WITH_FIPS
- 	/*
- 	 *	Needed for MD4
- 	 *
-@@ -191,6 +194,7 @@ static int openssl3_init(void)
- 		ERROR("(TLS) Failed loading legacy provider");
- 		return -1;
- 	}
-+#endif
-
- 	return 0;
- }
-@@ -202,10 +206,12 @@ static void openssl3_free(void)
- 	}
- 	openssl_default_provider = NULL;
-
-+#ifndef WITH_FIPS
- 	if (openssl_legacy_provider && !OSSL_PROVIDER_unload(openssl_legacy_provider)) {
- 		ERROR("Failed unloading legacy provider");
- 	}
- 	openssl_legacy_provider = NULL;
-+#endif
- }
- #else
- #define openssl3_init()
-diff --git a/src/modules/rlm_mschap/smbencrypt.c b/src/modules/rlm_mschap/smbencrypt.c
-index 9a8a5ab777..531c40ec26 100644
---- a/src/modules/rlm_mschap/smbencrypt.c
-+++ b/src/modules/rlm_mschap/smbencrypt.c
-@@ -43,7 +43,9 @@ static char const hex[] = "0123456789ABCDEF";
- #  include <openssl/provider.h>
-
- static OSSL_PROVIDER *openssl_default_provider = NULL;
-+#ifndef WITH_FIPS
- static OSSL_PROVIDER *openssl_legacy_provider = NULL;
-+#endif
-
- #define ERROR(_x) fprintf(stderr, _x)
-
-@@ -58,6 +60,7 @@ static int openssl3_init(void)
- 		return -1;
- 	}
-
-+#ifndef WITH_FIPS
- 	/*
- 	 *	Needed for MD4
- 	 *
-@@ -68,6 +71,7 @@ static int openssl3_init(void)
- 		ERROR("(TLS) Failed loading legacy provider");
- 		return -1;
- 	}
-+#endif
-
- 	return 0;
- }
-@@ -79,10 +83,12 @@ static void openssl3_free(void)
- 	}
- 	openssl_default_provider = NULL;
-
-+#ifndef WITH_FIPS
- 	if (openssl_legacy_provider && !OSSL_PROVIDER_unload(openssl_legacy_provider)) {
- 		ERROR("Failed unloading legacy provider");
- 	}
- 	openssl_legacy_provider = NULL;
-+#endif
- }
- #else
- #define openssl3_init()
---
-2.43.0
-
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0010-fix-error-for-expansion-of-macro-in-thread.h.patch b/meta-networking/recipes-connectivity/freeradius/files/0010-fix-error-for-expansion-of-macro-in-thread.h.patch
deleted file mode 100644
index cae27ad3a4..0000000000
--- a/meta-networking/recipes-connectivity/freeradius/files/0010-fix-error-for-expansion-of-macro-in-thread.h.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 0475d948ceab91b22172f0fae3bc01e0a1502ae8 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Wed, 18 Jan 2017 14:59:39 +0800
-Subject: [PATCH] fix error for expansion of macro in thread.h
-
-The parameter declaration is missing in expansion of macro
-which cause the build error:
-| In file included from src/freeradius-devel/libradius.h:80:0,
-|                  from src/lib/log.c:26:
-| src/lib/log.c: In function '__fr_thread_local_destroy_fr_strerror_buffer':
-| src/lib/log.c:37:31: error: 'fr_strerror_buffer' undeclared (first use in this function)
-|  fr_thread_local_setup(char *, fr_strerror_buffer) /* macro */
-|                                ^
-
-Add the missing declaration in macro.
-
-Upstream-Status: Pending
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/include/threads.h | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/include/threads.h b/src/include/threads.h
-index f2aea776d6..1c4e526797 100644
---- a/src/include/threads.h
-+++ b/src/include/threads.h
-@@ -92,7 +92,7 @@ static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
- #  define fr_thread_local_get(_n) _n
- #elif defined(HAVE_PTHREAD_H)
- #  include <pthread.h>
--#  define fr_thread_local_setup(_t, _n) \
-+#  define fr_thread_local_setup(_t, _n) static __thread _t _n;\
- static pthread_key_t __fr_thread_local_key_##_n;\
- static pthread_once_t __fr_thread_local_once_##_n = PTHREAD_ONCE_INIT;\
- static pthread_destructor_t __fr_thread_local_destructor_##_n = NULL;\
-@@ -103,17 +103,17 @@ static void __fr_thread_local_destroy_##_n(UNUSED void *unused)\
- static void __fr_thread_local_key_init_##_n(void)\
- {\
- 	(void) pthread_key_create(&__fr_thread_local_key_##_n, __fr_thread_local_destroy_##_n);\
--	(void) pthread_setspecific(__fr_thread_local_key_##_n, &(_n));\
- }\
- static _t __fr_thread_local_init_##_n(pthread_destructor_t func)\
- {\
- 	__fr_thread_local_destructor_##_n = func;\
- 	if (_n) return _n; \
- 	(void) pthread_once(&__fr_thread_local_once_##_n, __fr_thread_local_key_init_##_n);\
-+	(void) pthread_setspecific(__fr_thread_local_key_##_n, &(_n));\
- 	return _n;\
- }
--#  define fr_thread_local_init(_n, _f)			__fr_thread_local_init_##_n(_f)
--#  define fr_thread_local_set(_n, _v)			__fr_thread_local_set_##_n(_v)
--#  define fr_thread_local_get(_n)			__fr_thread_local_get_##_n()
-+#  define fr_thread_local_init(_n, _f)	__fr_thread_local_init_##_n(_f)
-+#  define fr_thread_local_set(_n, _v) ((int)!((_n = _v) || 1))
-+#  define fr_thread_local_get(_n) _n
- #endif
- #endif
---
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0018-update-license-1.patch b/meta-networking/recipes-connectivity/freeradius/files/0018-update-license-1.patch
deleted file mode 100644
index 8647c389ab..0000000000
--- a/meta-networking/recipes-connectivity/freeradius/files/0018-update-license-1.patch
+++ /dev/null
@@ -1,175 +0,0 @@
-From 82d874c638c80fbbf1eca7c51aca095fbbf40024 Mon Sep 17 00:00:00 2001
-From: "Alan T. DeKok" <aland@freeradius.org>
-Date: Mon, 27 Oct 2025 06:31:22 -0400
-Subject: [PATCH] update license
-
-Upstream-Status: Backport
-[https://github.com/FreeRADIUS/freeradius-server/commit/82d874c638c80fbbf1eca7c51aca095fbbf40024]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/modules/rlm_dpsk/rlm_dpsk.c               | 25 +++++++---------
- .../rlm_eap/types/rlm_eap_teap/eap_teap.c     | 29 +++++++------------
- .../rlm_eap/types/rlm_eap_teap/eap_teap.h     | 29 +++++++------------
- .../rlm_eap/types/rlm_eap_teap/rlm_eap_teap.c | 29 +++++++------------
- 4 files changed, 44 insertions(+), 68 deletions(-)
-
-diff --git a/src/modules/rlm_dpsk/rlm_dpsk.c b/src/modules/rlm_dpsk/rlm_dpsk.c
-index 4b818d08a5..aa07415540 100644
---- a/src/modules/rlm_dpsk/rlm_dpsk.c
-+++ b/src/modules/rlm_dpsk/rlm_dpsk.c
-@@ -1,20 +1,17 @@
- /*
-- * Copyright (C) 2023 Network RADIUS SARL (legal@networkradius.com)
-+ *   This program is is free software; you can redistribute it and/or modify
-+ *   it under the terms of the GNU General Public License as published by
-+ *   the Free Software Foundation; either version 2 of the License, or (at
-+ *   your option) any later version.
-  *
-- * This software may not be redistributed in any form without the prior
-- * written consent of Network RADIUS.
-+ *   This program is distributed in the hope that it will be useful,
-+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ *   GNU General Public License for more details.
-  *
-- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
-- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-- * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
-- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
-- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
-- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
-- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-- * SUCH DAMAGE.
-+ *   You should have received a copy of the GNU General Public License
-+ *   along with this program; if not, write to the Free Software
-+ *   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
-  */
-
- /**
-diff --git a/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap.c b/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap.c
-index 20646c5ba1..33512788c2 100644
---- a/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap.c
-+++ b/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap.c
-@@ -1,24 +1,17 @@
- /*
-- * eap_teap.c  contains the interfaces that are called from the main handler
-+ *   This program is is free software; you can redistribute it and/or modify
-+ *   it under the terms of the GNU General Public License as published by
-+ *   the Free Software Foundation; either version 2 of the License, or (at
-+ *   your option) any later version.
-  *
-- * Version:     $Id$
-+ *   This program is distributed in the hope that it will be useful,
-+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ *   GNU General Public License for more details.
-  *
-- * Copyright (C) 2022 Network RADIUS SARL <legal@networkradius.com>
-- *
-- * This software may not be redistributed in any form without the prior
-- * written consent of Network RADIUS.
-- *
-- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
-- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-- * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
-- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
-- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
-- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
-- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-- * SUCH DAMAGE.
-+ *   You should have received a copy of the GNU General Public License
-+ *   along with this program; if not, write to the Free Software
-+ *   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
-  */
-
- RCSID("$Id$")
-diff --git a/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap.h b/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap.h
-index 59f7835a26..69f4b1ebba 100644
---- a/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap.h
-+++ b/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap.h
-@@ -1,24 +1,17 @@
- /*
-- * eap_teap.h
-+ *   This program is is free software; you can redistribute it and/or modify
-+ *   it under the terms of the GNU General Public License as published by
-+ *   the Free Software Foundation; either version 2 of the License, or (at
-+ *   your option) any later version.
-  *
-- * Version:     $Id$
-+ *   This program is distributed in the hope that it will be useful,
-+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ *   GNU General Public License for more details.
-  *
-- * Copyright (C) 2022 Network RADIUS SARL <legal@networkradius.com>
-- *
-- * This software may not be redistributed in any form without the prior
-- * written consent of Network RADIUS.
-- *
-- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
-- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-- * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
-- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
-- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
-- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
-- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-- * SUCH DAMAGE.
-+ *   You should have received a copy of the GNU General Public License
-+ *   along with this program; if not, write to the Free Software
-+ *   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
-  */
- #ifndef _EAP_TEAP_H
- #define _EAP_TEAP_H
-diff --git a/src/modules/rlm_eap/types/rlm_eap_teap/rlm_eap_teap.c b/src/modules/rlm_eap/types/rlm_eap_teap/rlm_eap_teap.c
-index fcf9717257..13c709b287 100644
---- a/src/modules/rlm_eap/types/rlm_eap_teap/rlm_eap_teap.c
-+++ b/src/modules/rlm_eap/types/rlm_eap_teap/rlm_eap_teap.c
-@@ -1,24 +1,17 @@
- /*
-- * rlm_eap_teap.c  contains the interfaces that are called from eap
-+ *   This program is is free software; you can redistribute it and/or modify
-+ *   it under the terms of the GNU General Public License as published by
-+ *   the Free Software Foundation; either version 2 of the License, or (at
-+ *   your option) any later version.
-  *
-- * Version:     $Id$
-+ *   This program is distributed in the hope that it will be useful,
-+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ *   GNU General Public License for more details.
-  *
-- * Copyright (C) 2022 Network RADIUS SARL <legal@networkradius.com>
-- *
-- * This software may not be redistributed in any form without the prior
-- * written consent of Network RADIUS.
-- *
-- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
-- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-- * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
-- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
-- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
-- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
-- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-- * SUCH DAMAGE.
-+ *   You should have received a copy of the GNU General Public License
-+ *   along with this program; if not, write to the Free Software
-+ *   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
-  */
-
- RCSID("$Id$")
---
-2.43.0
-
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0019-update-license-2.patch b/meta-networking/recipes-connectivity/freeradius/files/0019-update-license-2.patch
deleted file mode 100644
index 4fa3ecd265..0000000000
--- a/meta-networking/recipes-connectivity/freeradius/files/0019-update-license-2.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From a46e81a7764b57983ce6724524f745a06222dc0a Mon Sep 17 00:00:00 2001
-From: "Alan T. DeKok" <aland@freeradius.org>
-Date: Tue, 28 Oct 2025 11:33:44 -0400
-Subject: [PATCH] update license
-
-Upstream-Status: Backport
-[https://github.com/FreeRADIUS/freeradius-server/commit/a46e81a7764b57983ce6724524f745a06222dc0a]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- .../rlm_proxy_rate_limit.c                    | 25 ++++++++-----------
- 1 file changed, 11 insertions(+), 14 deletions(-)
-
-diff --git a/src/modules/rlm_proxy_rate_limit/rlm_proxy_rate_limit.c b/src/modules/rlm_proxy_rate_limit/rlm_proxy_rate_limit.c
-index 744b14a448..a855273784 100644
---- a/src/modules/rlm_proxy_rate_limit/rlm_proxy_rate_limit.c
-+++ b/src/modules/rlm_proxy_rate_limit/rlm_proxy_rate_limit.c
-@@ -1,20 +1,17 @@
- /*
-- * Copyright (C) 2024 Network RADIUS SAS (legal@networkradius.com)
-+ *   This program is is free software; you can redistribute it and/or modify
-+ *   it under the terms of the GNU General Public License as published by
-+ *   the Free Software Foundation; either version 2 of the License, or (at
-+ *   your option) any later version.
-  *
-- * This software may not be redistributed in any form without the prior
-- * written consent of Network RADIUS.
-+ *   This program is distributed in the hope that it will be useful,
-+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ *   GNU General Public License for more details.
-  *
-- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
-- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-- * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
-- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
-- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
-- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
-- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-- * SUCH DAMAGE.
-+ *   You should have received a copy of the GNU General Public License
-+ *   along with this program; if not, write to the Free Software
-+ *   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
-  */
-
- /**
---
-2.43.0
-
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0020-update-license-3.patch b/meta-networking/recipes-connectivity/freeradius/files/0020-update-license-3.patch
deleted file mode 100644
index f77c585bda..0000000000
--- a/meta-networking/recipes-connectivity/freeradius/files/0020-update-license-3.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From d00440f3290871aef667f80e15f256c64f9b7cd6 Mon Sep 17 00:00:00 2001
-From: "Alan T. DeKok" <aland@freeradius.org>
-Date: Wed, 29 Oct 2025 09:45:17 -0400
-Subject: [PATCH] update license
-
-Upstream-Status: Backport
-[https://github.com/FreeRADIUS/freeradius-server/commit/d00440f3290871aef667f80e15f256c64f9b7cd6]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- .../types/rlm_eap_teap/eap_teap_crypto.c      | 30 +++++++------------
- .../types/rlm_eap_teap/eap_teap_crypto.h      | 30 +++++++------------
- 2 files changed, 22 insertions(+), 38 deletions(-)
-
-diff --git a/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap_crypto.c b/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap_crypto.c
-index 17f49f9dfc..aaa74837a9 100644
---- a/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap_crypto.c
-+++ b/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap_crypto.c
-@@ -1,26 +1,18 @@
- /*
-- * teap-crypto.c  Cryptographic functions for EAP-TEAP.
-+ *   This program is is free software; you can redistribute it and/or modify
-+ *   it under the terms of the GNU General Public License as published by
-+ *   the Free Software Foundation; either version 2 of the License, or (at
-+ *   your option) any later version.
-  *
-- * Version:     $Id$
-+ *   This program is distributed in the hope that it will be useful,
-+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ *   GNU General Public License for more details.
-  *
-- * Copyright (C) 2022 Network RADIUS SARL <legal@networkradius.com>
-- *
-- * This software may not be redistributed in any form without the prior
-- * written consent of Network RADIUS.
-- *
-- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
-- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-- * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
-- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
-- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
-- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
-- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-- * SUCH DAMAGE.
-+ *   You should have received a copy of the GNU General Public License
-+ *   along with this program; if not, write to the Free Software
-+ *   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
-  */
--
- RCSID("$Id$")
- USES_APPLE_DEPRECATED_API	/* OpenSSL API has been deprecated by Apple */
-
-diff --git a/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap_crypto.h b/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap_crypto.h
-index b02f2b9083..f9403dcf93 100644
---- a/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap_crypto.h
-+++ b/src/modules/rlm_eap/types/rlm_eap_teap/eap_teap_crypto.h
-@@ -1,26 +1,18 @@
- /*
-- * eap_teap_crypto.h
-+ *   This program is is free software; you can redistribute it and/or modify
-+ *   it under the terms of the GNU General Public License as published by
-+ *   the Free Software Foundation; either version 2 of the License, or (at
-+ *   your option) any later version.
-  *
-- * Version:     $Id$
-+ *   This program is distributed in the hope that it will be useful,
-+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ *   GNU General Public License for more details.
-  *
-- * Copyright (C) 2022 Network RADIUS SARL <legal@networkradius.com>
-- *
-- * This software may not be redistributed in any form without the prior
-- * written consent of Network RADIUS.
-- *
-- * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
-- * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-- * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
-- * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
-- * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-- * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
-- * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
-- * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
-- * SUCH DAMAGE.
-+ *   You should have received a copy of the GNU General Public License
-+ *   along with this program; if not, write to the Free Software
-+ *   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
-  */
--
- #ifndef _EAP_TEAP_CRYPTO_H
- #define _EAP_TEAP_CRYPTO_H
-
---
-2.43.0
-
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb
index 4be127209b..a0e0292c3e 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.8.bb
@@ -15,7 +15,7 @@ DEPENDS = "openssl-native openssl libidn libtool libpcap libtalloc"

 PATCHTOOL = "git"

-SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;lfs=0;;protocol=https \
+SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;lfs=0;protocol=https \
     file://freeradius \
     file://volatiles.58_radiusd \
     file://radiusd.service \
@@ -29,7 +29,6 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;lfs=0
     file://0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch \
     file://0008-libtool-do-not-use-jlibtool.patch \
     file://0009-Fix-quoting-for-BUILD_WITH.patch \
-    file://0010-fix-error-for-expansion-of-macro-in-thread.h.patch \
     file://0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch \
     file://0012-raddb-certs-Makefile-fix-the-existed-certificate-err.patch \
     file://0013-raddb-certs-Makefile-fix-the-occasional-verification.patch \
@@ -37,16 +36,13 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;lfs=0
     file://0015-bootstrap-check-commands-of-openssl-exist.patch \
     file://0016-version.c-don-t-print-build-flags.patch \
     file://0017-Add-acinclude.m4-to-include-required-macros.patch \
-    file://0018-update-license-1.patch \
-    file://0019-update-license-2.patch \
-    file://0020-update-license-3.patch \
-    file://0001-don-t-load-legacy-provider-on-enable-fips-workaround.patch \
-    file://0002-don-t-load-legacy-provider-on-enable-fips-workaround.patch \
 "

 raddbdir = "${sysconfdir}/${MLPREFIX}raddb"

-SRCREV = "032be31bb52646171099617928ec1703335bcf73"
+SRCREV = "4e4cbbd93ff3b469a773c964c7b5b6f53d01457a"
+
+PV .= "+git"

 UPSTREAM_CHECK_GITTAGREGEX = "release_(?P<pver>\d+(\_\d+)+)"


