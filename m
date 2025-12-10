Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF59DD3C543
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 12:47:42 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14854.1765370859838305780
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 04:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=glBdge5r;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-340a5c58bf1so4673215a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 04:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765370859; x=1765975659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExLm3ML04H0J3KhGsUwdSblioDLF2hk/KaNc9gePdh4=;
        b=glBdge5rVCrIOgW1qXQ0mjinvewu9UTTtowfkCFBbLXfSvcYUS29kYGSPNLMcaaqA5
         sOUDcS5zLpEhbSjOXw4/z140mINCJG08dvwyYa4X6caFWVJo3pLK98sAoddhKInZNOy5
         u9lbgLb7AbN1SRdMVhT8YHfUq2i+udaBLy5HhkPSg/OzK63/n0qRH6bHI5R/UpOzesp8
         3ibEaYHieZ13xAfp+pAL53fX6aDot0emDcT2P7PI0PkCuHKwwwfFS8IZz/Ul+GV72yNd
         9cqxwsbxHdm8HaWI5mgJx0KrkLuy6qyC8tkGhBs1lFdDz49WJL2qV2HBanKh/qOvvMmU
         Uk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765370859; x=1765975659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ExLm3ML04H0J3KhGsUwdSblioDLF2hk/KaNc9gePdh4=;
        b=Z4iOK6sLIQ3fwxk3/CigrUqG6/s3d50AhXT5m25Z4yMdNAPyuQOYE+t2UFW6SdTZjU
         NPPZ1D1zcdYsrg2Klf/1vZTpoiRzh/oMHFIsBFY8PsA2DGI+wHY+A+9Rv2Y8QMgajcM2
         v+vWnidCdM2GCKBgKTMPAj7kHHBfvzYCyKtjj8LdGy39YwL+O3tiiFpNnKZCIEN4IL+P
         /aXS0eRcnpUUeSm5zfA++KiZ5fVrDvZTE0h0x/59xK3dm450bRrEVXoNIP10EWqxFq0J
         jUpax5LXeft4tTki8XXSmEK3DkP7MGJUO9FdNQI0V0it1oP5Y71FRJWn9FjpoIUhipc8
         gCAw==
X-Gm-Message-State: AOJu0YwaDIazJy7oclIZWlIqN26r0tCBjT94OhkmliLxvVD20yMPD+TI
	iXAY0ed3CmHNxRudzKu4zra95dYllQaiY9q99zn2XWEJp6Mr4iJHRBHrWpi6gg==
X-Gm-Gg: AY/fxX7P30NbKI2guGXMJDgwpfpzuGq3Q5ti9VPCEYbFwdfm6tSh90hYTzYUaK0WHj+
	+S6nWLQJ4Y/BeVCpOKENeNVr24zCQMnhunduGH01qrYe7tGct1cR5ifIrhcELVYlBqA0+IIxTGX
	3XSP9v91Jrw3gJfrhSLj8F5414KNDWM8uFw/evSr+hiezAjN3K7F70ahPb26CvcZweKjLPa7oOp
	j8xR/TLjdy1FImYKryxvHHmJKUebGKxK8OeWTDdEkn201WCVi21iwEwTeLAGmdjZFxq/89YYA+W
	U8uvi5HUQmAe1usjZ3x8RVWxn/Rolo0/nqeenoD4BO6ZUruGVw/kSo0bWJW8yimvwuyHWysHoJF
	9iR/OisAHb2mI3ogqazvr2vEK2YER5O+HSVX94VT4SXczO/dAX7T+iIxageDtpMNpro8cHcv+nm
	N2Sj03m8tpscGL7ded6OYkzw==
X-Google-Smtp-Source: AGHT+IE0QFKzHyntiU7QRbwrBs79xZHOdYq4p057pYxiY3M0TV8FXoW6X4ePw7erxRTBpv4BfgNxrA==
X-Received: by 2002:a17:90b:1d8e:b0:32e:3829:a71c with SMTP id 98e67ed59e1d1-34a7281ec83mr2247396a91.16.1765370858840;
        Wed, 10 Dec 2025 04:47:38 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.251.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6875cc8eesm17748421a12.16.2025.12.10.04.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:47:38 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 12/43] librelp: Upgrade to 1.12.0
Date: Wed, 10 Dec 2025 18:14:56 +0530
Message-ID: <20251210124528.10696-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210124528.10696-1-ankur.tyagi85@gmail.com>
References: <20251210124528.10696-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 12:47:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122516

From: Randy MacLeod <Randy.MacLeod@windriver.com>

This upgrade is mostly bug fixes according to:
   https://github.com/rsyslog/librelp/blob/master/ChangeLog
but there is one new API:
   add ability to communicate source port back to caller

Drop the backported patch:
   0001-Fix-function-inline-errors-in-debug-optimization-Og.patch
Drop patches merged upstream:
   0001-tests-Include-missing-sys-time.h.patch
   ->  8c96857 tests: Include missing sys/time.h
   0001-relp-fix-build-against-upcoming-gcc-14-Werror-calloc.patch
   -> baf992f relp: fix build against upcoming `gcc-14` ...
   0001-tests-Fix-callback-prototype.patch
   -> a4cb0bd tests: Fix callback prototype
   0001-tcp-fix-some-compiler-warnings-with-enable-tls-opens.patch
   -> 6e9b27f tcp: fix some compiler warnings with enable-tls-openssl

Ptest for qemux86-64, qemuarm64 with glibc and musl:
 TOTAL: 30
 PASS:  27
 SKIP:  3
 XFAIL: 0
 FAIL:  0
 XPASS: 0
 ERROR: 0

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bd5202a0a0c9400e452ccea8b6d9237ea8593571)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...line-errors-in-debug-optimization-Og.patch | 34 -------
 ...gainst-upcoming-gcc-14-Werror-calloc.patch | 37 --------
 ...piler-warnings-with-enable-tls-opens.patch | 88 -------------------
 .../0001-tests-Fix-callback-prototype.patch   | 49 -----------
 ...001-tests-Include-missing-sys-time.h.patch | 41 ---------
 .../{librelp_1.11.0.bb => librelp_1.12.0.bb}  |  8 +-
 6 files changed, 1 insertion(+), 256 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-Fix-function-inline-errors-in-debug-optimization-Og.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-relp-fix-build-against-upcoming-gcc-14-Werror-calloc.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-tcp-fix-some-compiler-warnings-with-enable-tls-opens.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Fix-callback-prototype.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Include-missing-sys-time.h.patch
 rename meta-oe/recipes-extended/rsyslog/{librelp_1.11.0.bb => librelp_1.12.0.bb} (87%)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-Fix-function-inline-errors-in-debug-optimization-Og.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-Fix-function-inline-errors-in-debug-optimization-Og.patch
deleted file mode 100644
index 10e2b564cc..0000000000
--- a/meta-oe/recipes-extended/rsyslog/librelp/0001-Fix-function-inline-errors-in-debug-optimization-Og.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6d575d98565ce3119a14359eecb11ccdff92a303 Mon Sep 17 00:00:00 2001
-From: Yash Shinde <53660251+Yashinde145@users.noreply.github.com>
-Date: Thu, 29 Jun 2023 18:10:15 +0530
-Subject: [PATCH] Fix function inline errors in debug optimization (-Og)
-
-Compiler does not inline any functions when using debug optimization (-Og).
-Hence, remove -Winline flag when compiling with debug optimization.
-
-Signed-off-by: Nicolas Marguet <nicolas.marguet@windriver.com>
----
-Upstream-Status: Backport [https://github.com/rsyslog/librelp/commit/6d575d9]
-
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 21c1fde..1204c4e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -230,6 +230,12 @@ if test "$enable_debug" = "no"; then
-         AC_DEFINE(NDEBUG, 1, [Defined if debug mode is disabled.])
- fi
-
-+#Compiler does not inline any functions when not optimizing(-Og).
-+#Hence, remove -Winline flag when DEBUG is enabled.
-+#ifdef DEBUG
-+WARN_CFLAGS="$(echo "$WARN_CFLAGS" | sed s/-Winline//g)"
-+#endif
-+
- # valgrind
- AC_ARG_ENABLE(valgrind,
-         [AS_HELP_STRING([--enable-valgrind],[Enable valgrind tests@<:@default=yes@:>@])],
---
-2.39.0
diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-relp-fix-build-against-upcoming-gcc-14-Werror-calloc.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-relp-fix-build-against-upcoming-gcc-14-Werror-calloc.patch
deleted file mode 100644
index cf4f4080a6..0000000000
--- a/meta-oe/recipes-extended/rsyslog/librelp/0001-relp-fix-build-against-upcoming-gcc-14-Werror-calloc.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From baf992f82aa987c608731866876adb856847ea45 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 6 May 2024 18:03:40 -0700
-Subject: [PATCH] relp: fix build against upcoming `gcc-14`
- (`-Werror=calloc-transposed-args`)
-
-`gcc-14` added a new `-Wcalloc-transposed-args` warning recently. It
-   detected minor infelicity in `calloc()` API usage
-
-Fixes
-../../git/src/relp.c: In function 'addToEpollSet':
-../../git/src/relp.c:101:39: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
-  101 |         CHKmalloc(epd = calloc(sizeof(epolld_t), 1));
-      |                                       ^~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/rsyslog/librelp/pull/264]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/relp.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/relp.c b/src/relp.c
-index eadda36..6268f1d 100644
---- a/src/relp.c
-+++ b/src/relp.c
-@@ -98,7 +98,7 @@ addToEpollSet(relpEngine_t *const pThis, epolld_type_t typ, void *ptr, int sock,
- 	epolld_t *epd = NULL;
- 	ENTER_RELPFUNC;
- 
--	CHKmalloc(epd = calloc(sizeof(epolld_t), 1));
-+	CHKmalloc(epd = calloc(1, sizeof(epolld_t)));
- 	epd->typ = typ;
- 	epd->ptr = ptr;
- 	epd->sock = sock;
--- 
-2.45.0
-
diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-tcp-fix-some-compiler-warnings-with-enable-tls-opens.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-tcp-fix-some-compiler-warnings-with-enable-tls-opens.patch
deleted file mode 100644
index 3ce5926333..0000000000
--- a/meta-oe/recipes-extended/rsyslog/librelp/0001-tcp-fix-some-compiler-warnings-with-enable-tls-opens.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 6e9b27f04132287463c89d3be0ce4f506944920d Mon Sep 17 00:00:00 2001
-From: Patrick Williams <patrick@stwcx.xyz>
-Date: Fri, 3 Feb 2023 16:11:29 -0600
-Subject: [PATCH] tcp: fix some compiler warnings with enable-tls-openssl
-
-When --enable-tls=no and --enable-tls-openssl=yes, the following
-compiler errors are reported:
-
-```
-| ../../git/src/tcp.c:3765:1: error: no previous declaration for 'relpTcpGetRtryDirection_gtls' [-Werror=missing-declarations]
-|  3765 | relpTcpGetRtryDirection_gtls(LIBRELP_ATTR_UNUSED relpTcp_t *const pThis)
-|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
-| ../../git/src/tcp.c:3583:1: error: 'relpTcpChkPeerName' defined but not used [-Werror=unused-function]
-|  3583 | relpTcpChkPeerName(NOTLS_UNUSED relpTcp_t *const pThis, NOTLS_UNUSED void* cert)
-|       | ^~~~~~~~~~~~~~~~~~
-```
-
-Fix these by:
-    1. Add static on the openssl path for relpTcpGetRtryDirection_gtls.
-    2. Move the relpTcpChkPeerName forward declaration to another ifdef
-       leg.
-    3. Wrap relpTcpChkPeerName in gnutls-based ifdef.
-    4. Remove relpTcpChkPeerName_gtls from openssl path.
-
-Upstream-Status: Backport [https://github.com/rsyslog/librelp/pull/255]
-Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
----
- src/tcp.c | 11 ++++-------
- 1 file changed, 4 insertions(+), 7 deletions(-)
-
-diff --git a/src/tcp.c b/src/tcp.c
-index 7a75cc4..18cffda 100644
---- a/src/tcp.c
-+++ b/src/tcp.c
-@@ -132,12 +132,12 @@ callOnErr(const relpTcp_t *__restrict__ const pThis,
- static int LIBRELP_ATTR_NONNULL() relpTcpGetCN(char *const namebuf, const size_t lenNamebuf, const char *const szDN);
- #ifdef HAVE_GNUTLS_CERTIFICATE_SET_VERIFY_FUNCTION
- static int relpTcpVerifyCertificateCallback(gnutls_session_t session);
-+static int relpTcpChkPeerName(relpTcp_t *const pThis, void* cert);
- #endif /* #ifdef HAVE_GNUTLS_CERTIFICATE_SET_VERIFY_FUNCTION */
- #if defined(HAVE_GNUTLS_CERTIFICATE_SET_VERIFY_FUNCTION) || defined(ENABLE_TLS_OPENSSL)
- static void relpTcpChkOnePeerName(relpTcp_t *const pThis, char *peername, int *pbFoundPositiveMatch);
- static int relpTcpAddToCertNamesBuffer(relpTcp_t *const pThis, char *const buf,
- 	const size_t buflen, int *p_currIdx, const char *const certName);
--static int relpTcpChkPeerName(relpTcp_t *const pThis, void* cert);
- #endif /* defined(HAVE_GNUTLS_CERTIFICATE_SET_VERIFY_FUNCTION) || defined(ENABLE_TLS_OPENSSL) */
- 
- 
-@@ -2820,11 +2820,6 @@ relpTcpLstnInitTLS_gtls(LIBRELP_ATTR_UNUSED relpTcp_t *const pThis)
- {
- 	return RELP_RET_ERR_INTERNAL;
- }
--static int
--relpTcpChkPeerName_gtls(LIBRELP_ATTR_UNUSED relpTcp_t *const pThis, LIBRELP_ATTR_UNUSED void *vcert)
--{
--	return RELP_RET_ERR_INTERNAL;
--}
- #endif /* defined(ENABLE_TLS)*/
- 
- 
-@@ -3579,6 +3574,7 @@ finalize_it:
- 
- }
- 
-+#ifdef HAVE_GNUTLS_CERTIFICATE_SET_VERIFY_FUNCTION
- static int
- relpTcpChkPeerName(NOTLS_UNUSED relpTcp_t *const pThis, NOTLS_UNUSED void* cert)
- {
-@@ -3592,6 +3588,7 @@ relpTcpChkPeerName(NOTLS_UNUSED relpTcp_t *const pThis, NOTLS_UNUSED void* cert)
- 	#endif /* #ifdef  WITH_TLS*/
- 	LEAVE_RELPFUNC;
- }
-+#endif
- 
- static relpRetVal LIBRELP_ATTR_NONNULL()
- relpTcpAcceptConnReqInitTLS(NOTLS_UNUSED relpTcp_t *const pThis, NOTLS_UNUSED relpSrv_t *const pSrv)
-@@ -3761,7 +3758,7 @@ relpTcpGetRtryDirection_gtls(relpTcp_t *const pThis)
- 	return gnutls_record_get_direction(pThis->session);
- }
- #else /* #ifdef ENABLE_TLS */
--relpRetVal LIBRELP_ATTR_NONNULL()
-+static relpRetVal LIBRELP_ATTR_NONNULL()
- relpTcpGetRtryDirection_gtls(LIBRELP_ATTR_UNUSED relpTcp_t *const pThis)
- {
- 	return RELP_RET_ERR_INTERNAL;
--- 
-2.41.0
-
diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Fix-callback-prototype.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Fix-callback-prototype.patch
deleted file mode 100644
index ba081926e1..0000000000
--- a/meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Fix-callback-prototype.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 2a7e26510cf9276b7e640ca8282cc1c5e46075d0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 15 Aug 2023 11:59:40 -0700
-Subject: [PATCH] tests: Fix callback prototype
-
-clang errors about it
-
-| ../../git/tests/receive.c:71:34: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
-|    71 | hdlr_enable(int sig, void (*hdlr)())
-|       |                                  ^
-|       |                                   void
-| 1 error generated.
-
-Upstream-Status: Submitted [https://github.com/rsyslog/librelp/pull/260]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/receive.c | 2 +-
- tests/send.c    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tests/receive.c b/tests/receive.c
-index f376cb4..c12e911 100644
---- a/tests/receive.c
-+++ b/tests/receive.c
-@@ -68,7 +68,7 @@ doSleep(int iSeconds, const int iuSeconds)
- }
- 
- static void
--hdlr_enable(int sig, void (*hdlr)())
-+hdlr_enable(int sig, void (*hdlr)(const int))
- {
- 	struct sigaction sigAct;
- 	memset(&sigAct, 0, sizeof (sigAct));
-diff --git a/tests/send.c b/tests/send.c
-index d7e90f0..1b1df4f 100644
---- a/tests/send.c
-+++ b/tests/send.c
-@@ -57,7 +57,7 @@ struct usrdata { /* used for testing user pointer pass-back */
- struct usrdata *userdata = NULL;
- 
- static void
--hdlr_enable(int sig, void (*hdlr)())
-+hdlr_enable(int sig, void (*hdlr)(const int))
- {
- 	struct sigaction sigAct;
- 	memset(&sigAct, 0, sizeof (sigAct));
--- 
-2.41.0
-
diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Include-missing-sys-time.h.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Include-missing-sys-time.h.patch
deleted file mode 100644
index 6fed23c1d1..0000000000
--- a/meta-oe/recipes-extended/rsyslog/librelp/0001-tests-Include-missing-sys-time.h.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 5c32487a9c127f37141488d416cdb5d5bec6aca1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 19 Aug 2023 10:24:40 -0700
-Subject: [PATCH] tests: Include missing sys/time.h
-
-This is found when building for musl C library systems where sys/time.h
-is not included indirectly and select() and timeval structs are used
-
-Fixes
-
-../../git/tests/receive.c:64:17: error: variable has incomplete type 'struct timeval'
-   64 |         struct timeval tvSelectTimeout;
-      |                        ^
-../../git/tests/receive.c:64:9: note: forward declaration of 'struct timeval'
-   64 |         struct timeval tvSelectTimeout;
-      |                ^
-../../git/tests/receive.c:67:2: error: call to undeclared function 'select'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-   67 |         select(0, NULL, NULL, NULL, &tvSelectTimeout);
-      |         ^
-
-Upstream-Status: Submitted [https://github.com/rsyslog/librelp/pull/261]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/receive.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/tests/receive.c b/tests/receive.c
-index f376cb4..e20861e 100644
---- a/tests/receive.c
-+++ b/tests/receive.c
-@@ -33,6 +33,7 @@
- #include <limits.h>
- #include <errno.h>
- #include <signal.h>
-+#include <sys/time.h>
- #include "librelp.h"
- 
- #define TRY(f) { const int TRY_r = f; if(TRY_r != RELP_RET_OK) { \
--- 
-2.41.0
-
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
similarity index 87%
rename from meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
rename to meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
index 3ccb87a9c5..6bad112e5a 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
@@ -7,16 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1fb9c10ed9fd6826757615455ca893a9"
 DEPENDS = "gmp libidn zlib"
 
 SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https;branch=stable \
-           file://0001-Fix-function-inline-errors-in-debug-optimization-Og.patch \
-           file://0001-tests-Fix-callback-prototype.patch \
-           file://0001-tcp-fix-some-compiler-warnings-with-enable-tls-opens.patch \
-           file://0001-tests-Include-missing-sys-time.h.patch \
-           file://0001-relp-fix-build-against-upcoming-gcc-14-Werror-calloc.patch \
            file://run-ptest \
 "
 
-SRCREV = "b421f56d9ee31a966058d23bd23c966221c91396"
-
+SRCREV = "dab30db5108ef4bb5b6f9135e0428b57be7c4085"
 
 CVE_PRODUCT = "rsyslog:librelp"
 

