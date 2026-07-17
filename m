Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E1EC4450F
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 04:13:45 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6623.1784261617324353116
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2026 21:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UHv6144x;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-80c5cb9a888so64748067b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 21:13:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784261616; cv=none;
        d=google.com; s=arc-20260327;
        b=UYo3Px+3ow7FSp4mlJ84ijG+FI733KBtIOM+vxYBb3xnNSEVZLrNfcHY3qb+mCb7On
         XZOCp4jv3yLI5KKiH5253LxlCkJRGLwDgJrSiCbIdhmGR+Pz2Ag0QtnqqwpZF9PcspsP
         8RvU9bJjaHvvvGxo4Jk+88d9DajiII6j0M8reelTW9PmgVu79IfQ2iHgltjIIkTHzOeZ
         4X4HB8cy1EJgzcmABtG5bF5mktJgUrOxV0ta8aa1nuk+knMmnIlHP/biF1PWjzdOYtXJ
         TSOKCWEcz9cijiFShYJrBiZHGweK6/3HX6i/iJmUo2knvCKKHFi/RMQFDb9N5bx/5SHj
         U9jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V6kaPaLVC8WvnYrd4IewavHjuHnlM/60Oe8Vp94UxKU=;
        fh=22pJH0TZwvhXLe2PZQi9BZKg7t+YSJYux8BZayreD8I=;
        b=oxKh0IYK7c2RdQ+lZs2k2ETDnDVoO7umHAnHFjMC5DwU8DKN6MOWgrGC21PIjIzsN3
         qsQphlovml08Mh6cCS9nQ2mcTRgDZNRAsneTACQpzFPNv4+8HCHsMiJHt007Q/AQud2H
         cy14OWMJFM59epMJ6XRdNFZ7Pg56uzLFYxAAiZShnJ9xQCfMMRF88+R2tKcS84It1wb1
         ASag/97PEJ57yaJIUyyZibWJthN//e3n8f24gEQQ5KfrB8Yxfe229N9koMxO78ZzQ4Pm
         UsBKOuGqzyjPpOpVv2+FflFq/TyCeLghGrFtH7YLb66KKszpjTzWPlFn7U/96JqCWjpC
         BiiQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784261616; x=1784866416; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6kaPaLVC8WvnYrd4IewavHjuHnlM/60Oe8Vp94UxKU=;
        b=UHv6144x97Kz22rpIq4S9dpYuF7IatZXOiwkUpoKKSa5y7sdPxxOf6O9OYFMcIUm/U
         cNYaqBwXEET4EPU51VjhT5OdvXOyDEzcxE4XzHbqXNBpS1zRpyiMAkkQCoJlRtxsWNhQ
         d028dFviAODLAYNXcC+LdMk3Ln9OC97nJ1udiis83fImpFEkqBR+UF4vsAa7veVBQqXe
         Db6WAvVA3wF5dF/vNwRYjP9OHuF0OLuQAHGGqV1yvH2Ffp3ASfl64V31AruQ5Zeai4xA
         OAE5PR35TfzgfyT+6H/HWyumfm0xNNXWNjs9W0uQIAnfMeqINkyI+VFnzLmnNEyd6pUl
         Qe0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784261616; x=1784866416;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V6kaPaLVC8WvnYrd4IewavHjuHnlM/60Oe8Vp94UxKU=;
        b=RjH8ULk9mHkE7HnrZC3sg7IWWGryUuiZbCYXryzffpFt3MJu6eKnmQxELzgWKg2AZ1
         5y5NEuMmFKWoFCcYl/nyKjn89p5LPy0VVDPj3cN0rMTsX0vc0qdlLe1NX8wBcruWJD7r
         HFm5lP4GooXxuj9p8WHnxIBfJgicO4namSVOzw7NpiwIAPXuIbi4W9AVSyOsF2lgY0Z7
         m1r4L7rNlIxGLFYHGvEjUxykMOgJ8kQBKWzeecFIdilyz/giEKP8AZgezRw89ldFwuu/
         d8FUmo2dwecV8+k+vKHqpoMaZm/uvBnF9VzIx6whTLuLf9ja5bAxYV2KJ49Hq+3BOzUA
         rsMQ==
X-Gm-Message-State: AOJu0YzvMQo5Y6wHQUABz/74JAiu3B9XTv8eVFjxw27TVozkGwEp/hNG
	Z7JSeXgwarflaeY5nztnjaLs2Pq8V9ue0aWIeN2PNcwZe3EFYk+aKsUBWwhN0jMorBcYGggunlI
	l53o1c+w+xVNWL+U9xgZ0r6GDCvY0Oxg=
X-Gm-Gg: AfdE7clGaXzFeIWDT4y53WGXz2noaoFO0uiKYZmploa70jyb0r0Bg5st9Yb/IANA4ZK
	an3ee4WxumKdkNdsZ7OHpq5XgSb/Y67E/of60XZP9d8dGbfyQbNwr8LVyYu1TLvLJfh9JsAn73O
	s1CKE8UR3CyylXcYng3WseJJ9JpKjKGqlRg3LqYRvEBKIgSJ5wMTfAqRahNxaiPnj78ZUCRs0ym
	Wk/MnY0S6tplcx9P6lC+WoUCv4BPwXsTEfo+b2uo/pyi/3WHK5ZlCZPBs5R+SvEd4WUbpvyliVe
	3jWfIT2CFcyWu05lXCXMMFS+4vxbGfIJCeWXOfZIjOhLaXGJlBsdcFO4AvSXZ4Y6ZGjyYmu2c8W
	UBhaGObCKmYhFbkJXMaIQHBxdRDhGgcnk1XZEN1PmTx21SCuenR3l/8ugg7g=
X-Received: by 2002:a05:690c:6e12:b0:81e:528d:3625 with SMTP id
 00721157ae682-81ef270b4f1mr2391567b3.24.1784261616029; Thu, 16 Jul 2026
 21:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260716080840.19806-1-lianux.wang@processmission.com>
In-Reply-To: <20260716080840.19806-1-lianux.wang@processmission.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Jul 2026 21:13:09 -0700
X-Gm-Features: AUfX_mxTtyzU3XyFOvmZMjZpjM67pPdKklRGl9HNnGAzhDNIq6w0NQbui2yN1uc
Message-ID: <CAMKF1sqjrgGd1wy8YvG5Bx_4drH6DH0apiwwixQeCoV6ceP60g@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] wolfssl: upgrade 5.7.2 -> 5.9.2
To: lianux.mm@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Lian Wang <lianux.wang@processmission.com>
Content-Type: multipart/alternative; boundary="000000000000cf53b80656c6c7ac"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 04:13:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128241

--000000000000cf53b80656c6c7ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please rebase this on top of master or master-next

On Thu, Jul 16, 2026 at 1:08=E2=80=AFAM wang lian via lists.openembedded.or=
g <
lianux.mm=3Dgmail.com@lists.openembedded.org> wrote:

> - Drop 9 CVE patches (CVE-2025-7394, CVE-2025-7395) fixed upstream
> - All security fixes included in 5.9.2 release
>
> Signed-off-by: Lian Wang <lianux.wang@processmission.com>
> ---
>  .../wolfssl/files/CVE-2025-7394-1.patch       |  46 ---
>  .../wolfssl/files/CVE-2025-7394-2.patch       | 275 ------------------
>  .../wolfssl/files/CVE-2025-7394-3.patch       | 125 --------
>  .../wolfssl/files/CVE-2025-7394-4.patch       |  85 ------
>  .../wolfssl/files/CVE-2025-7394-5.patch       |  40 ---
>  .../wolfssl/files/CVE-2025-7394-6.patch       |  48 ---
>  .../wolfssl/files/CVE-2025-7395-1.patch       |  84 ------
>  .../wolfssl/files/CVE-2025-7395-2.patch       |  27 --
>  .../wolfssl/files/CVE-2025-7395-3.patch       |  25 --
>  .../{wolfssl_5.7.2.bb =3D> wolfssl_5.9.2.bb}    |  11 +-
>  10 files changed, 1 insertion(+), 765 deletions(-)
>  delete mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.patch
>  delete mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-2.patch
>  delete mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-3.patch
>  delete mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.patch
>  delete mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-5.patch
>  delete mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-6.patch
>  delete mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch
>  delete mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patch
>  delete mode 100644
> meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patch
>  rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.7.2.bb =
=3D>
> wolfssl_5.9.2.bb} (78%)
>
> diff --git
> a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.patc=
h
> b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.patc=
h
> deleted file mode 100644
> index e561b26..0000000
> ---
> a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.patc=
h
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -From 6d0ee56813d69eee72108e1dc859743e02f70077 Mon Sep 17 00:00:00 2001
> -From: Josh Holtrop <josh@wolfssl.com>
> -Date: Thu, 5 Jun 2025 19:48:34 -0400
> -Subject: [PATCH] Reseed DRBG in RAND_poll()
> -
> -CVE: CVE-2025-7394
> -Upstream-Status: Backport [
> https://github.com/wolfSSL/wolfssl/commit/0c12337194ee6dd082f082f0ccaed27=
fc4ee44f5
> ]
> -(cherry picked from commit 0c12337194ee6dd082f082f0ccaed27fc4ee44f5)
> -Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ----
> - src/ssl.c | 20 +++++++++++++++++---
> - 1 file changed, 17 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/ssl.c b/src/ssl.c
> -index 9ba891d62..a1421d523 100644
> ---- a/src/ssl.c
> -+++ b/src/ssl.c
> -@@ -24159,11 +24159,25 @@ int wolfSSL_RAND_poll(void)
> -         return  WOLFSSL_FAILURE;
> -     }
> -     ret =3D wc_GenerateSeed(&globalRNG.seed, entropy, entropy_sz);
> --    if (ret !=3D 0){
> -+    if (ret !=3D 0) {
> -         WOLFSSL_MSG("Bad wc_RNG_GenerateBlock");
> -         ret =3D WOLFSSL_FAILURE;
> --    }else
> --        ret =3D WOLFSSL_SUCCESS;
> -+    }
> -+    else {
> -+#ifdef HAVE_HASHDRBG
> -+        ret =3D wc_RNG_DRBG_Reseed(&globalRNG, entropy, entropy_sz);
> -+        if (ret !=3D 0) {
> -+            WOLFSSL_MSG("Error reseeding DRBG");
> -+            ret =3D WOLFSSL_FAILURE;
> -+        }
> -+        else {
> -+            ret =3D WOLFSSL_SUCCESS;
> -+        }
> -+#else
> -+        WOLFSSL_MSG("RAND_poll called with HAVE_HASHDRBG not set");
> -+        ret =3D WOLFSSL_FAILURE;
> -+#endif
> -+    }
> -
> -     return ret;
> - }
> diff --git
> a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-2.patc=
h
> b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-2.patc=
h
> deleted file mode 100644
> index 883a5a1..0000000
> ---
> a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-2.patc=
h
> +++ /dev/null
> @@ -1,275 +0,0 @@
> -From b506ed4aeb2c86788422427624a03eb9bda52efc Mon Sep 17 00:00:00 2001
> -From: JacobBarthelmeh <jacob@wolfssl.com>
> -Date: Tue, 10 Jun 2025 12:49:08 -0600
> -Subject: [PATCH] add sanity checks on pid with RNG
> -
> -CVE: CVE-2025-7394
> -Upstream-Status: Backport [
> https://github.com/wolfSSL/wolfssl/commit/31490ab813a5aac096f50800c26c690=
d8ae586d2
> ]
> -Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ----
> - CMakeLists.txt             |   1 +
> - configure.ac               |   4 +-
> - src/ssl.c                  |  40 +++++++++++-
> - wolfcrypt/src/random.c     | 126 ++++++++++++++++++++++---------------
> - wolfssl/wolfcrypt/random.h |   3 +
> - 5 files changed, 118 insertions(+), 56 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 4e6f05fc6..910a36648 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -124,6 +124,7 @@ check_function_exists("memset" HAVE_MEMSET)
> - check_function_exists("socket" HAVE_SOCKET)
> - check_function_exists("strftime" HAVE_STRFTIME)
> - check_function_exists("__atomic_fetch_add" HAVE_C___ATOMIC)
> -+check_function_exists("getpid" HAVE_GETPID)
> -
> - include(CheckTypeSize)
> -
> -diff --git a/configure.ac b/configure.ac
> -index c973b7e39..43ddd4767 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -125,8 +125,8 @@ AC_CHECK_HEADER(stdatomic.h,
> [AM_CPPFLAGS=3D"$AM_CPPFLAGS -DWOLFSSL_HAVE_ATOMIC_H"
> - # check if functions of interest are linkable, but also check if
> - # they're declared by the expected headers, and if not, supersede the
> - # unusable positive from AC_CHECK_FUNCS().
> --AC_CHECK_FUNCS([gethostbyname getaddrinfo gettimeofday gmtime_r gmtime_=
s
> inet_ntoa memset socket strftime atexit])
> --AC_CHECK_DECLS([gethostbyname, getaddrinfo, gettimeofday, gmtime_r,
> gmtime_s, inet_ntoa, memset, socket, strftime, atexit], [], [
> -+AC_CHECK_FUNCS([gethostbyname getaddrinfo gettimeofday gmtime_r gmtime_=
s
> inet_ntoa memset socket strftime atexit getpid])
> -+AC_CHECK_DECLS([gethostbyname, getaddrinfo, gettimeofday, gmtime_r,
> gmtime_s, inet_ntoa, memset, socket, strftime, atexit, getpid], [], [
> - if test "$(eval echo \$"$(eval 'echo ac_cv_func_${as_decl_name}')")" =
=3D
> "yes"
> - then
> -     AC_MSG_NOTICE([    note: earlier check for $(eval 'echo
> ${as_decl_name}') superseded.])
> -diff --git a/src/ssl.c b/src/ssl.c
> -index a1421d523..872aed594 100644
> ---- a/src/ssl.c
> -+++ b/src/ssl.c
> -@@ -23615,6 +23615,10 @@ int wolfSSL_RAND_Init(void)
> -         if (initGlobalRNG =3D=3D 0) {
> -             ret =3D wc_InitRng(&globalRNG);
> -             if (ret =3D=3D 0) {
> -+            #if defined(HAVE_GETPID) && defined(HAVE_FIPS) && \
> -+                FIPS_VERSION3_LT(6,0,0)))
> -+                currentPid =3D getpid();
> -+            #endif
> -                 initGlobalRNG =3D 1;
> -                 ret =3D WOLFSSL_SUCCESS;
> -             }
> -@@ -24045,8 +24049,30 @@ int wolfSSL_RAND_pseudo_bytes(unsigned char*
> buf, int num)
> -     return ret;
> - }
> -
> --/* returns WOLFSSL_SUCCESS if the bytes generated are valid otherwise
> -- * WOLFSSL_FAILURE */
> -+#if defined(HAVE_GETPID) && defined(HAVE_FIPS) &&
> FIPS_VERSION3_LT(6,0,0)))
> -+/* In older FIPS bundles add check for reseed here since it does not
> exist in
> -+ * the older random.c certified files. */
> -+static pid_t currentPid =3D 0;
> -+
> -+/* returns WOLFSSL_SUCCESS on success and WOLFSSL_FAILURE on failure */
> -+static int RandCheckReSeed()
> -+{
> -+    int ret =3D WOLFSSL_SUCCESS;
> -+    pid_t p;
> -+
> -+    p =3D getpid();
> -+    if (p !=3D currentPid) {
> -+        currentPid =3D p;
> -+        if (wolfSSL_RAND_poll() !=3D WOLFSSL_SUCCESS) {
> -+            ret =3D WOLFSSL_FAILURE;
> -+        }
> -+    }
> -+    return ret;
> -+}
> -+#endif
> -+
> -+/* returns WOLFSSL_SUCCESS (1) if the bytes generated are valid
> otherwise 0
> -+ * on failure */
> - int wolfSSL_RAND_bytes(unsigned char* buf, int num)
> - {
> -     int     ret =3D 0;
> -@@ -24089,6 +24115,16 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int
> num)
> -          */
> -         if (initGlobalRNG) {
> -             rng =3D &globalRNG;
> -+
> -+        #if defined(HAVE_GETPID) && defined(HAVE_FIPS) && \
> -+                FIPS_VERSION3_LT(6,0,0)))
> -+            if (RandCheckReSeed() !=3D WOLFSSL_SUCCESS) {
> -+                wc_UnLockMutex(&globalRNGMutex);
> -+                WOLFSSL_MSG("Issue with check pid and reseed");
> -+                return ret;
> -+            }
> -+        #endif
> -+
> -             used_global =3D 1;
> -         }
> -         else {
> -diff --git a/wolfcrypt/src/random.c b/wolfcrypt/src/random.c
> -index 89c7411c9..b440e274b 100644
> ---- a/wolfcrypt/src/random.c
> -+++ b/wolfcrypt/src/random.c
> -@@ -1599,6 +1599,9 @@ static int _InitRng(WC_RNG* rng, byte* nonce,
> word32 nonceSz,
> - #else
> -     rng->heap =3D heap;
> - #endif
> -+#ifdef HAVE_GETPID
> -+    rng->pid =3D getpid();
> -+#endif
> - #if defined(WOLFSSL_ASYNC_CRYPT) || defined(WOLF_CRYPTO_CB)
> -     rng->devId =3D devId;
> -     #if defined(WOLF_CRYPTO_CB)
> -@@ -1849,6 +1852,63 @@ int wc_InitRngNonce_ex(WC_RNG* rng, byte* nonce,
> word32 nonceSz,
> -     return _InitRng(rng, nonce, nonceSz, heap, devId);
> - }
> -
> -+#ifdef HAVE_HASHDRBG
> -+static int PollAndReSeed(WC_RNG* rng)
> -+{
> -+    int ret   =3D DRBG_NEED_RESEED;
> -+    int devId =3D INVALID_DEVID;
> -+#if defined(WOLFSSL_ASYNC_CRYPT) || defined(WOLF_CRYPTO_CB)
> -+    devId =3D rng->devId;
> -+#endif
> -+    if (wc_RNG_HealthTestLocal(1, rng->heap, devId) =3D=3D 0) {
> -+    #ifndef WOLFSSL_SMALL_STACK
> -+        byte newSeed[SEED_SZ + SEED_BLOCK_SZ];
> -+        ret =3D DRBG_SUCCESS;
> -+    #else
> -+        byte* newSeed =3D (byte*)XMALLOC(SEED_SZ + SEED_BLOCK_SZ,
> rng->heap,
> -+            DYNAMIC_TYPE_SEED);
> -+        ret =3D (newSeed =3D=3D NULL) ? MEMORY_E : DRBG_SUCCESS;
> -+    #endif
> -+        if (ret =3D=3D DRBG_SUCCESS) {
> -+        #ifdef WC_RNG_SEED_CB
> -+            if (seedCb =3D=3D NULL) {
> -+                ret =3D DRBG_NO_SEED_CB;
> -+            }
> -+            else {
> -+                ret =3D seedCb(&rng->seed, newSeed, SEED_SZ +
> SEED_BLOCK_SZ);
> -+                if (ret !=3D 0) {
> -+                    ret =3D DRBG_FAILURE;
> -+                }
> -+            }
> -+        #else
> -+            ret =3D wc_GenerateSeed(&rng->seed, newSeed,
> -+                              SEED_SZ + SEED_BLOCK_SZ);
> -+        #endif
> -+            if (ret !=3D 0)
> -+                ret =3D DRBG_FAILURE;
> -+        }
> -+        if (ret =3D=3D DRBG_SUCCESS)
> -+            ret =3D wc_RNG_TestSeed(newSeed, SEED_SZ + SEED_BLOCK_SZ);
> -+
> -+        if (ret =3D=3D DRBG_SUCCESS)
> -+            ret =3D Hash_DRBG_Reseed((DRBG_internal *)rng->drbg,
> -+                                   newSeed + SEED_BLOCK_SZ, SEED_SZ);
> -+    #ifdef WOLFSSL_SMALL_STACK
> -+        if (newSeed !=3D NULL) {
> -+            ForceZero(newSeed, SEED_SZ + SEED_BLOCK_SZ);
> -+        }
> -+        XFREE(newSeed, rng->heap, DYNAMIC_TYPE_SEED);
> -+    #else
> -+        ForceZero(newSeed, sizeof(newSeed));
> -+    #endif
> -+    }
> -+    else {
> -+        ret =3D DRBG_CONT_FAILURE;
> -+    }
> -+
> -+    return ret;
> -+}
> -+#endif
> -
> - /* place a generated block in output */
> - WOLFSSL_ABI
> -@@ -1908,60 +1968,22 @@ int wc_RNG_GenerateBlock(WC_RNG* rng, byte*
> output, word32 sz)
> -     if (rng->status !=3D DRBG_OK)
> -         return RNG_FAILURE_E;
> -
> -+#ifdef HAVE_GETPID
> -+    if (rng->pid !=3D getpid()) {
> -+        rng->pid =3D getpid();
> -+        ret =3D PollAndReSeed(rng);
> -+        if (ret !=3D DRBG_SUCCESS) {
> -+            rng->status =3D DRBG_FAILED;
> -+            return RNG_FAILURE_E;
> -+        }
> -+    }
> -+#endif
> -+
> -     ret =3D Hash_DRBG_Generate((DRBG_internal *)rng->drbg, output, sz);
> -     if (ret =3D=3D DRBG_NEED_RESEED) {
> --        int devId =3D INVALID_DEVID;
> --    #if defined(WOLFSSL_ASYNC_CRYPT) || defined(WOLF_CRYPTO_CB)
> --        devId =3D rng->devId;
> --    #endif
> --        if (wc_RNG_HealthTestLocal(1, rng->heap, devId) =3D=3D 0) {
> --        #ifndef WOLFSSL_SMALL_STACK
> --            byte newSeed[SEED_SZ + SEED_BLOCK_SZ];
> --            ret =3D DRBG_SUCCESS;
> --        #else
> --            byte* newSeed =3D (byte*)XMALLOC(SEED_SZ + SEED_BLOCK_SZ,
> rng->heap,
> --                DYNAMIC_TYPE_SEED);
> --            ret =3D (newSeed =3D=3D NULL) ? MEMORY_E : DRBG_SUCCESS;
> --        #endif
> --            if (ret =3D=3D DRBG_SUCCESS) {
> --            #ifdef WC_RNG_SEED_CB
> --                if (seedCb =3D=3D NULL) {
> --                    ret =3D DRBG_NO_SEED_CB;
> --                }
> --                else {
> --                    ret =3D seedCb(&rng->seed, newSeed, SEED_SZ +
> SEED_BLOCK_SZ);
> --                    if (ret !=3D 0) {
> --                        ret =3D DRBG_FAILURE;
> --                    }
> --                }
> --            #else
> --                ret =3D wc_GenerateSeed(&rng->seed, newSeed,
> --                                  SEED_SZ + SEED_BLOCK_SZ);
> --            #endif
> --                if (ret !=3D 0)
> --                    ret =3D DRBG_FAILURE;
> --            }
> --            if (ret =3D=3D DRBG_SUCCESS)
> --                ret =3D wc_RNG_TestSeed(newSeed, SEED_SZ + SEED_BLOCK_S=
Z);
> --
> --            if (ret =3D=3D DRBG_SUCCESS)
> --                ret =3D Hash_DRBG_Reseed((DRBG_internal *)rng->drbg,
> --                                       newSeed + SEED_BLOCK_SZ, SEED_SZ=
);
> --            if (ret =3D=3D DRBG_SUCCESS)
> --                ret =3D Hash_DRBG_Generate((DRBG_internal *)rng->drbg,
> output, sz);
> --
> --        #ifdef WOLFSSL_SMALL_STACK
> --            if (newSeed !=3D NULL) {
> --                ForceZero(newSeed, SEED_SZ + SEED_BLOCK_SZ);
> --            }
> --            XFREE(newSeed, rng->heap, DYNAMIC_TYPE_SEED);
> --        #else
> --            ForceZero(newSeed, sizeof(newSeed));
> --        #endif
> --        }
> --        else {
> --            ret =3D DRBG_CONT_FAILURE;
> --        }
> -+        ret =3D PollAndReSeed(rng);
> -+        if (ret =3D=3D DRBG_SUCCESS)
> -+            ret =3D Hash_DRBG_Generate((DRBG_internal *)rng->drbg, outp=
ut,
> sz);
> -     }
> -
> -     if (ret =3D=3D DRBG_SUCCESS) {
> -diff --git a/wolfssl/wolfcrypt/random.h b/wolfssl/wolfcrypt/random.h
> -index 9dd616328..f472e1f40 100644
> ---- a/wolfssl/wolfcrypt/random.h
> -+++ b/wolfssl/wolfcrypt/random.h
> -@@ -183,6 +183,9 @@ struct WC_RNG {
> - #endif
> -     byte status;
> - #endif
> -+#ifdef HAVE_GETPID
> -+    pid_t pid;
> -+#endif
> - #ifdef WOLFSSL_ASYNC_CRYPT
> -     WC_ASYNC_DEV asyncDev;
> - #endif
> diff --git
> a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-3.patc=
h
> b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-3.patc=
h
> deleted file mode 100644
> index e70a3fe..0000000
> ---
> a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-3.patc=
h
> +++ /dev/null
> @@ -1,125 +0,0 @@
> -From 62a3a4f0b8b307bdacc34204db44627521de4bf9 Mon Sep 17 00:00:00 2001
> -From: JacobBarthelmeh <jacob@wolfssl.com>
> -Date: Tue, 10 Jun 2025 14:15:38 -0600
> -Subject: [PATCH] add mutex locking and compat layer FIPS case
> -
> -CVE: CVE-2025-7394
> -Upstream-Status: Backport [
> https://github.com/wolfSSL/wolfssl/commit/fbbb6b7707f7f8ae1c38ab68daec0af=
02ee0208a
> ]
> -(cherry picked from commit fbbb6b7707f7f8ae1c38ab68daec0af02ee0208a)
> -Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ----
> - src/ssl.c | 62 +++++++++++++++++++++++++++----------------------------
> - 1 file changed, 31 insertions(+), 31 deletions(-)
> -
> -diff --git a/src/ssl.c b/src/ssl.c
> -index 872aed594..f0186b253 100644
> ---- a/src/ssl.c
> -+++ b/src/ssl.c
> -@@ -23603,6 +23603,12 @@ static int wolfSSL_RAND_InitMutex(void)
> -
> - #ifdef OPENSSL_EXTRA
> -
> -+#if defined(HAVE_GETPID) && defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,=
0)
> -+/* In older FIPS bundles add check for reseed here since it does not
> exist in
> -+ * the older random.c certified files. */
> -+static pid_t currentRandPid =3D 0;
> -+#endif
> -+
> - /* Checks if the global RNG has been created. If not then one is create=
d.
> -  *
> -  * Returns WOLFSSL_SUCCESS when no error is encountered.
> -@@ -23616,8 +23622,8 @@ int wolfSSL_RAND_Init(void)
> -             ret =3D wc_InitRng(&globalRNG);
> -             if (ret =3D=3D 0) {
> -             #if defined(HAVE_GETPID) && defined(HAVE_FIPS) && \
> --                FIPS_VERSION3_LT(6,0,0)))
> --                currentPid =3D getpid();
> -+                FIPS_VERSION3_LT(6,0,0)
> -+                currentRandPid =3D getpid();
> -             #endif
> -                 initGlobalRNG =3D 1;
> -                 ret =3D WOLFSSL_SUCCESS;
> -@@ -24049,28 +24055,6 @@ int wolfSSL_RAND_pseudo_bytes(unsigned char*
> buf, int num)
> -     return ret;
> - }
> -
> --#if defined(HAVE_GETPID) && defined(HAVE_FIPS) &&
> FIPS_VERSION3_LT(6,0,0)))
> --/* In older FIPS bundles add check for reseed here since it does not
> exist in
> -- * the older random.c certified files. */
> --static pid_t currentPid =3D 0;
> --
> --/* returns WOLFSSL_SUCCESS on success and WOLFSSL_FAILURE on failure */
> --static int RandCheckReSeed()
> --{
> --    int ret =3D WOLFSSL_SUCCESS;
> --    pid_t p;
> --
> --    p =3D getpid();
> --    if (p !=3D currentPid) {
> --        currentPid =3D p;
> --        if (wolfSSL_RAND_poll() !=3D WOLFSSL_SUCCESS) {
> --            ret =3D WOLFSSL_FAILURE;
> --        }
> --    }
> --    return ret;
> --}
> --#endif
> --
> - /* returns WOLFSSL_SUCCESS (1) if the bytes generated are valid
> otherwise 0
> -  * on failure */
> - int wolfSSL_RAND_bytes(unsigned char* buf, int num)
> -@@ -24114,17 +24098,27 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int
> num)
> -          * have the lock.
> -          */
> -         if (initGlobalRNG) {
> --            rng =3D &globalRNG;
> --
> -         #if defined(HAVE_GETPID) && defined(HAVE_FIPS) && \
> --                FIPS_VERSION3_LT(6,0,0)))
> --            if (RandCheckReSeed() !=3D WOLFSSL_SUCCESS) {
> -+                FIPS_VERSION3_LT(6,0,0)
> -+            pid_t p;
> -+
> -+            p =3D getpid();
> -+            if (p !=3D currentRandPid) {
> -                 wc_UnLockMutex(&globalRNGMutex);
> --                WOLFSSL_MSG("Issue with check pid and reseed");
> --                return ret;
> -+                if (wolfSSL_RAND_poll() !=3D WOLFSSL_SUCCESS) {
> -+                    WOLFSSL_MSG("Issue with check pid and reseed");
> -+                    ret =3D WOLFSSL_FAILURE;
> -+                }
> -+
> -+                /* reclaim lock after wolfSSL_RAND_poll */
> -+                if (wc_LockMutex(&globalRNGMutex) !=3D 0) {
> -+                    WOLFSSL_MSG("Bad Lock Mutex rng");
> -+                    return ret;
> -+                }
> -+                currentRandPid =3D p;
> -             }
> -         #endif
> --
> -+            rng =3D &globalRNG;
> -             used_global =3D 1;
> -         }
> -         else {
> -@@ -24201,6 +24195,11 @@ int wolfSSL_RAND_poll(void)
> -     }
> -     else {
> - #ifdef HAVE_HASHDRBG
> -+        if (wc_LockMutex(&globalRNGMutex) !=3D 0) {
> -+            WOLFSSL_MSG("Bad Lock Mutex rng");
> -+            return ret;
> -+        }
> -+
> -         ret =3D wc_RNG_DRBG_Reseed(&globalRNG, entropy, entropy_sz);
> -         if (ret !=3D 0) {
> -             WOLFSSL_MSG("Error reseeding DRBG");
> -@@ -24209,6 +24208,7 @@ int wolfSSL_RAND_poll(void)
> -         else {
> -             ret =3D WOLFSSL_SUCCESS;
> -         }
> -+        wc_UnLockMutex(&globalRNGMutex);
> - #else
> -         WOLFSSL_MSG("RAND_poll called with HAVE_HASHDRBG not set");
> -         ret =3D WOLFSSL_FAILURE;
> diff --git
> a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.patc=
h
> b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.patc=
h
> deleted file mode 100644
> index 7d6413f..0000000
> ---
> a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.patc=
h
> +++ /dev/null
> @@ -1,85 +0,0 @@
> -From d7a68e85ebe4705e7345b0e5012c806615cd86c7 Mon Sep 17 00:00:00 2001
> -From: JacobBarthelmeh <jacob@wolfssl.com>
> -Date: Tue, 10 Jun 2025 16:12:09 -0600
> -Subject: [PATCH] add a way to restore previous pid behavior
> -
> -CVE: CVE-2025-7394
> -Upstream-Status: Backport [
> https://github.com/wolfSSL/wolfssl/commit/47cf634965a3aabe82fd97a8feed9ef=
d6688e34a
> ]
> -Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ----
> - src/ssl.c                  | 11 ++++++-----
> - wolfcrypt/src/random.c     |  4 ++--
> - wolfssl/wolfcrypt/random.h |  2 +-
> - 3 files changed, 9 insertions(+), 8 deletions(-)
> -
> -diff --git a/src/ssl.c b/src/ssl.c
> -index f0186b253..e214fa504 100644
> ---- a/src/ssl.c
> -+++ b/src/ssl.c
> -@@ -23603,7 +23603,8 @@ static int wolfSSL_RAND_InitMutex(void)
> -
> - #ifdef OPENSSL_EXTRA
> -
> --#if defined(HAVE_GETPID) && defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,=
0)
> -+#if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
> -+    defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
> - /* In older FIPS bundles add check for reseed here since it does not
> exist in
> -  * the older random.c certified files. */
> - static pid_t currentRandPid =3D 0;
> -@@ -23621,8 +23622,8 @@ int wolfSSL_RAND_Init(void)
> -         if (initGlobalRNG =3D=3D 0) {
> -             ret =3D wc_InitRng(&globalRNG);
> -             if (ret =3D=3D 0) {
> --            #if defined(HAVE_GETPID) && defined(HAVE_FIPS) && \
> --                FIPS_VERSION3_LT(6,0,0)
> -+            #if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && =
\
> -+                defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
> -                 currentRandPid =3D getpid();
> -             #endif
> -                 initGlobalRNG =3D 1;
> -@@ -24098,8 +24099,8 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int
> num)
> -          * have the lock.
> -          */
> -         if (initGlobalRNG) {
> --        #if defined(HAVE_GETPID) && defined(HAVE_FIPS) && \
> --                FIPS_VERSION3_LT(6,0,0)
> -+        #if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
> -+                defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
> -             pid_t p;
> -
> -             p =3D getpid();
> -diff --git a/wolfcrypt/src/random.c b/wolfcrypt/src/random.c
> -index b440e274b..dc89db542 100644
> ---- a/wolfcrypt/src/random.c
> -+++ b/wolfcrypt/src/random.c
> -@@ -1599,7 +1599,7 @@ static int _InitRng(WC_RNG* rng, byte* nonce,
> word32 nonceSz,
> - #else
> -     rng->heap =3D heap;
> - #endif
> --#ifdef HAVE_GETPID
> -+#if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID)
> -     rng->pid =3D getpid();
> - #endif
> - #if defined(WOLFSSL_ASYNC_CRYPT) || defined(WOLF_CRYPTO_CB)
> -@@ -1968,7 +1968,7 @@ int wc_RNG_GenerateBlock(WC_RNG* rng, byte* output=
,
> word32 sz)
> -     if (rng->status !=3D DRBG_OK)
> -         return RNG_FAILURE_E;
> -
> --#ifdef HAVE_GETPID
> -+#if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID)
> -     if (rng->pid !=3D getpid()) {
> -         rng->pid =3D getpid();
> -         ret =3D PollAndReSeed(rng);
> -diff --git a/wolfssl/wolfcrypt/random.h b/wolfssl/wolfcrypt/random.h
> -index f472e1f40..320641548 100644
> ---- a/wolfssl/wolfcrypt/random.h
> -+++ b/wolfssl/wolfcrypt/random.h
> -@@ -183,7 +183,7 @@ struct WC_RNG {
> - #endif
> -     byte status;
> - #endif
> --#ifdef HAVE_GETPID
> -+#if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID)
> -     pid_t pid;
> - #endif
> - #ifdef WOLFSSL_ASYNC_CRYPT
> diff --git
> a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-5.patc=
h
> b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-5.patc=
h
> deleted file mode 100644
> index 6747f24..0000000
> ---
> a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-5.patc=
h
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From 670437d91ae3025b4721eb4f450e5dc31fc3d6ee Mon Sep 17 00:00:00 2001
> -From: Chris Conlon <chris@wolfssl.com>
> -Date: Wed, 18 Jun 2025 16:08:34 -0600
> -Subject: [PATCH] Add HAVE_GETPID to options.h if getpid detected, needed
> for
> - apps to correctly detect size of WC_RNG struct
> -
> -CVE: CVE-2025-7394
> -Upstream-Status: Backport [
> https://github.com/wolfSSL/wolfssl/commit/9c35c0de65e135e621400958f22829c=
0d2555ed4
> ]
> -Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ----
> - configure.ac | 9 +++++++++
> - 1 file changed, 9 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 43ddd4767..636c45aef 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -156,6 +156,9 @@ fi
> - #ifdef HAVE_STDLIB_H
> -     #include <stdlib.h>
> - #endif
> -+#ifdef HAVE_UNISTD_H
> -+    #include <unistd.h>
> -+#endif
> - ]])
> -
> - AC_PROG_INSTALL
> -@@ -9479,6 +9482,12 @@ then
> -     AM_CFLAGS=3D"$AM_CFLAGS -DHAVE___UINT128_T=3D1"
> - fi
> -
> -+# Add HAVE_GETPID to AM_CFLAGS for inclusion in options.h
> -+if test "$ac_cv_func_getpid" =3D "yes"
> -+then
> -+    AM_CFLAGS=3D"$AM_CFLAGS -DHAVE_GETPID=3D1"
> -+fi
> -+
> - LIB_SOCKET_NSL
> - AX_HARDEN_CC_COMPILER_FLAGS
> -
> diff --git
> a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-6.patc=
h
> b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-6.patc=
h
> deleted file mode 100644
> index e86bc8b..0000000
> ---
> a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-6.patc=
h
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From aaad0035e4e795b8b225bd481e3942de015a362d Mon Sep 17 00:00:00 2001
> -From: Chris Conlon <chris@wolfssl.com>
> -Date: Wed, 18 Jun 2025 16:57:02 -0600
> -Subject: [PATCH] Add check for reseed in ssl.c for HAVE_SELFTEST, simila=
r
> to
> - old FIPS bundles that do not have older random.c files
> -
> -CVE: CVE-2025-7394
> -Upstream-Status: Backport [
> https://github.com/wolfSSL/wolfssl/commit/cdd02f9665ef43126503307972e4389=
070a00a73
> -(cherry
> <https://github.com/wolfSSL/wolfssl/commit/cdd02f9665ef43126503307972e438=
9070a00a73-(cherry>
> picked from commit cdd02f9665ef43126503307972e4389070a00a73)
> -Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ----
> - src/ssl.c | 9 ++++++---
> - 1 file changed, 6 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/ssl.c b/src/ssl.c
> -index e214fa504..e538233fc 100644
> ---- a/src/ssl.c
> -+++ b/src/ssl.c
> -@@ -23604,7 +23604,7 @@ static int wolfSSL_RAND_InitMutex(void)
> - #ifdef OPENSSL_EXTRA
> -
> - #if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
> --    defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
> -+    ((defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)) ||
> defined(HAVE_SELFTEST))
> - /* In older FIPS bundles add check for reseed here since it does not
> exist in
> -  * the older random.c certified files. */
> - static pid_t currentRandPid =3D 0;
> -@@ -23623,7 +23623,9 @@ int wolfSSL_RAND_Init(void)
> -             ret =3D wc_InitRng(&globalRNG);
> -             if (ret =3D=3D 0) {
> -             #if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && =
\
> --                defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
> -+                ((defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)) || \
> -+                 defined(HAVE_SELFTEST))
> -+
> -                 currentRandPid =3D getpid();
> -             #endif
> -                 initGlobalRNG =3D 1;
> -@@ -24100,7 +24102,8 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int
> num)
> -          */
> -         if (initGlobalRNG) {
> -         #if defined(HAVE_GETPID) && !defined(WOLFSSL_NO_GETPID) && \
> --                defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)
> -+                ((defined(HAVE_FIPS) && FIPS_VERSION3_LT(6,0,0)) || \
> -+                 defined(HAVE_SELFTEST))
> -             pid_t p;
> -
> -             p =3D getpid();
> diff --git
> a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patc=
h
> b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patc=
h
> deleted file mode 100644
> index 9c661d6..0000000
> ---
> a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patc=
h
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -From e6c0d1ac7b480c0b5e36f660dd3c0f2b45e4c3ab Mon Sep 17 00:00:00 2001
> -From: Ruby Martin <ruby@wolfssl.com>
> -Date: Mon, 2 Jun 2025 16:38:32 -0600
> -Subject: [PATCH] create policy for WOLFSSL_APPLE_NATIVE_CERT_VALIDATION,
> - domain name checking
> -
> -CVE: CVE-2025-7395
> -Upstream-Status: Backport [
> https://github.com/wolfSSL/wolfssl/commit/9864959e41bd9259f258c09171ae2ec=
1c43fbc7f
> ]
> -Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ----
> - src/internal.c | 25 ++++++++++++++++++++-----
> - 1 file changed, 20 insertions(+), 5 deletions(-)
> -
> -diff --git a/src/internal.c b/src/internal.c
> -index 6bbd38fa8..2b090382f 100644
> ---- a/src/internal.c
> -+++ b/src/internal.c
> -@@ -221,7 +221,7 @@ WOLFSSL_CALLBACKS needs LARGE_STATIC_BUFFERS, please
> add LARGE_STATIC_BUFFERS
> - #include <Security/SecCertificate.h>
> - #include <Security/SecTrust.h>
> - #include <Security/SecPolicy.h>
> --static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs=
,
> -+static int DoAppleNativeCertValidation(WOLFSSL* ssl, const
> WOLFSSL_BUFFER_INFO* certs,
> -                                             int totalCerts);
> - #endif /* #if defined(__APPLE__) && defined(WOLFSSL_SYS_CA_CERTS) */
> -
> -@@ -15992,7 +15992,7 @@ int ProcessPeerCerts(WOLFSSL* ssl, byte* input,
> word32* inOutIdx,
> -              * into wolfSSL, try to validate against the system
> certificates
> -              * using Apple's native trust APIs */
> -             if ((ret !=3D 0) &&
> (ssl->ctx->doAppleNativeCertValidationFlag)) {
> --                if (DoAppleNativeCertValidation(args->certs,
> -+                if (DoAppleNativeCertValidation(ssl, args->certs,
> -                                                      args->totalCerts))=
 {
> -                     WOLFSSL_MSG("Apple native cert chain validation
> SUCCESS");
> -                     ret =3D 0;
> -@@ -41246,7 +41246,8 @@ cleanup:
> -  * wolfSSL's built-in certificate validation mechanisms anymore. We
> instead
> -  * must call into the Security Framework APIs to authenticate peer
> certificates
> -  */
> --static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs=
,
> -+static int DoAppleNativeCertValidation(WOLFSSL* ssl,
> -+                                            const WOLFSSL_BUFFER_INFO*
> certs,
> -                                             int totalCerts)
> - {
> -     int i;
> -@@ -41255,7 +41256,8 @@ static int DoAppleNativeCertValidation(const
> WOLFSSL_BUFFER_INFO* certs,
> -     CFMutableArrayRef certArray =3D NULL;
> -     SecCertificateRef secCert   =3D NULL;
> -     SecTrustRef       trust     =3D NULL;
> --    SecPolicyRef      policy    =3D NULL ;
> -+    SecPolicyRef      policy    =3D NULL;
> -+    CFStringRef       hostname  =3D NULL;
> -
> -     WOLFSSL_ENTER("DoAppleNativeCertValidation");
> -
> -@@ -41283,7 +41285,17 @@ static int DoAppleNativeCertValidation(const
> WOLFSSL_BUFFER_INFO* certs,
> -     }
> -
> -     /* Create trust object for SecCertifiate Ref */
> --    policy =3D SecPolicyCreateSSL(true, NULL);
> -+    if (ssl->buffers.domainName.buffer &&
> -+            ssl->buffers.domainName.length > 0) {
> -+        /* Create policy with specified value to require host name matc=
h
> */
> -+        hostname =3D CFStringCreateWithCString(kCFAllocatorDefault,
> -+        (const char*)ssl->buffers.domainName.buffer,
> kCFStringEncodingUTF8);
> -+    }
> -+    if (hostname !=3D NULL) {
> -+        policy =3D SecPolicyCreateSSL(true, hostname);
> -+    } else {
> -+        policy =3D SecPolicyCreateSSL(true, NULL);
> -+    }
> -     status =3D SecTrustCreateWithCertificates(certArray, policy, &trust=
);
> -     if (status !=3D errSecSuccess) {
> -         WOLFSSL_MSG_EX("Error creating trust object, "
> -@@ -41314,6 +41326,9 @@ cleanup:
> -     if (policy) {
> -         CFRelease(policy);
> -     }
> -+    if (hostname) {
> -+        CFRelease(hostname);
> -+    }
> -
> -     WOLFSSL_LEAVE("DoAppleNativeCertValidation", ret);
> -
> diff --git
> a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patc=
h
> b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patc=
h
> deleted file mode 100644
> index 857f6bb..0000000
> ---
> a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patc=
h
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From aad4e7c38f3784942923f4871d61a7e41d3de842 Mon Sep 17 00:00:00 2001
> -From: Brett <bigbrett@users.noreply.github.com>
> -Date: Wed, 4 Jun 2025 15:48:15 -0600
> -Subject: [PATCH] prevent apple native cert validation from overriding
> error
> - codes other than ASN_NO_SIGNER_E
> -
> -CVE: CVE-2025-7395
> -Upstream-Status: Backport [
> https://github.com/wolfSSL/wolfssl/commit/bc8eeea703253bd65d472a9541b54fe=
f326e8050
> ]
> -Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ----
> - src/internal.c | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/internal.c b/src/internal.c
> -index 2b090382f..79f584a0a 100644
> ---- a/src/internal.c
> -+++ b/src/internal.c
> -@@ -15991,7 +15991,8 @@ int ProcessPeerCerts(WOLFSSL* ssl, byte* input,
> word32* inOutIdx,
> -             /* If we can't validate the peer cert chain against the CAs
> loaded
> -              * into wolfSSL, try to validate against the system
> certificates
> -              * using Apple's native trust APIs */
> --            if ((ret !=3D 0) &&
> (ssl->ctx->doAppleNativeCertValidationFlag)) {
> -+            if ((ret =3D=3D ASN_NO_SIGNER_E) &&
> -+                (ssl->ctx->doAppleNativeCertValidationFlag)) {
> -                 if (DoAppleNativeCertValidation(ssl, args->certs,
> -                                                      args->totalCerts))=
 {
> -                     WOLFSSL_MSG("Apple native cert chain validation
> SUCCESS");
> diff --git
> a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patc=
h
> b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patc=
h
> deleted file mode 100644
> index a7e1c33..0000000
> ---
> a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patc=
h
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From f2a85e37e552d8dfafa2cbf32507b2fa545ee593 Mon Sep 17 00:00:00 2001
> -From: Brett <bigbrett@users.noreply.github.com>
> -Date: Wed, 4 Jun 2025 16:56:16 -0600
> -Subject: [PATCH] add missing error trace macro
> -
> -CVE: CVE-2025-7395
> -Upstream-Status: Backport [
> https://github.com/wolfSSL/wolfssl/commit/0e2a3fd0b64bc6ba633aa9227e92eca=
cb42b5b1b
> ]
> -Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ----
> - src/internal.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/internal.c b/src/internal.c
> -index 79f584a0a..5557b5698 100644
> ---- a/src/internal.c
> -+++ b/src/internal.c
> -@@ -15991,7 +15991,7 @@ int ProcessPeerCerts(WOLFSSL* ssl, byte* input,
> word32* inOutIdx,
> -             /* If we can't validate the peer cert chain against the CAs
> loaded
> -              * into wolfSSL, try to validate against the system
> certificates
> -              * using Apple's native trust APIs */
> --            if ((ret =3D=3D ASN_NO_SIGNER_E) &&
> -+            if ((ret =3D=3D WC_NO_ERR_TRACE(ASN_NO_SIGNER_E)) &&
> -                 (ssl->ctx->doAppleNativeCertValidationFlag)) {
> -                 if (DoAppleNativeCertValidation(ssl, args->certs,
> -                                                      args->totalCerts))=
 {
> diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.b=
b
> b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.2.bb
> similarity index 78%
> rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
> rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.2.bb
> index 0dc488d..2600e94 100644
> --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
> +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.2.bb
> @@ -14,17 +14,8 @@ RPROVIDES:${PN} =3D "cyassl"
>
>  SRC_URI =3D "git://
> github.com/wolfSSL/wolfssl.git;protocol=3Dhttps;branch=3Dmaster \
>             file://run-ptest \
> -           file://CVE-2025-7395-1.patch \
> -           file://CVE-2025-7395-2.patch \
> -           file://CVE-2025-7395-3.patch \
> -           file://CVE-2025-7394-1.patch \
> -           file://CVE-2025-7394-2.patch \
> -           file://CVE-2025-7394-3.patch \
> -           file://CVE-2025-7394-4.patch \
> -           file://CVE-2025-7394-5.patch \
> -           file://CVE-2025-7394-6.patch \
>             "
> -SRCREV =3D "00e42151ca061463ba6a95adb2290f678cbca472"
> +SRCREV =3D "ac01707f552c611fbd135cc723b2682b3e7f80f2"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128230):
> https://lists.openembedded.org/g/openembedded-devel/message/128230
> Mute This Topic: https://lists.openembedded.org/mt/120295424/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cf53b80656c6c7ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please rebase this on top of master or master-next=C2=A0</=
div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Thu, Jul 16, 2026 at 1:08=E2=80=AFAM wang lian via <=
a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;<a =
href=3D"http://lianux.mm">lianux.mm</a>=3D<a href=3D"mailto:gmail.com@lists=
.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">- Drop 9 CVE patches (CV=
E-2025-7394, CVE-2025-7395) fixed upstream<br>
- All security fixes included in 5.9.2 release<br>
<br>
Signed-off-by: Lian Wang &lt;<a href=3D"mailto:lianux.wang@processmission.c=
om" target=3D"_blank">lianux.wang@processmission.com</a>&gt;<br>
---<br>
=C2=A0.../wolfssl/files/CVE-2025-7394-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 46 ---<br>
=C2=A0.../wolfssl/files/CVE-2025-7394-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2=
75 ------------------<br>
=C2=A0.../wolfssl/files/CVE-2025-7394-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
25 --------<br>
=C2=A0.../wolfssl/files/CVE-2025-7394-4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 85 ------<br>
=C2=A0.../wolfssl/files/CVE-2025-7394-5.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 40 ---<br>
=C2=A0.../wolfssl/files/CVE-2025-7394-6.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 48 ---<br>
=C2=A0.../wolfssl/files/CVE-2025-7395-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 84 ------<br>
=C2=A0.../wolfssl/files/CVE-2025-7395-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 27 --<br>
=C2=A0.../wolfssl/files/CVE-2025-7395-3.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 25 --<br>
=C2=A0.../{<a href=3D"http://wolfssl_5.7.2.bb" rel=3D"noreferrer" target=3D=
"_blank">wolfssl_5.7.2.bb</a> =3D&gt; <a href=3D"http://wolfssl_5.9.2.bb" r=
el=3D"noreferrer" target=3D"_blank">wolfssl_5.9.2.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 11 +-<br>
=C2=A010 files changed, 1 insertion(+), 765 deletions(-)<br>
=C2=A0delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2025-7394-1.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2025-7394-2.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2025-7394-3.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2025-7394-4.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2025-7394-5.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2025-7394-6.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2025-7395-1.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2025-7395-2.patch<br>
=C2=A0delete mode 100644 meta-networking/recipes-connectivity/wolfssl/files=
/CVE-2025-7395-3.patch<br>
=C2=A0rename meta-networking/recipes-connectivity/wolfssl/{<a href=3D"http:=
//wolfssl_5.7.2.bb" rel=3D"noreferrer" target=3D"_blank">wolfssl_5.7.2.bb</=
a> =3D&gt; <a href=3D"http://wolfssl_5.9.2.bb" rel=3D"noreferrer" target=3D=
"_blank">wolfssl_5.9.2.bb</a>} (78%)<br>
<br>
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-73=
94-1.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-73=
94-1.patch<br>
deleted file mode 100644<br>
index e561b26..0000000<br>
--- a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.pa=
tch<br>
+++ /dev/null<br>
@@ -1,46 +0,0 @@<br>
-From 6d0ee56813d69eee72108e1dc859743e02f70077 Mon Sep 17 00:00:00 2001<br>
-From: Josh Holtrop &lt;<a href=3D"mailto:josh@wolfssl.com" target=3D"_blan=
k">josh@wolfssl.com</a>&gt;<br>
-Date: Thu, 5 Jun 2025 19:48:34 -0400<br>
-Subject: [PATCH] Reseed DRBG in RAND_poll()<br>
-<br>
-CVE: CVE-2025-7394<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/wolfSSL/wolfssl/c=
ommit/0c12337194ee6dd082f082f0ccaed27fc4ee44f5" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/wolfSSL/wolfssl/commit/0c12337194ee6dd082f08=
2f0ccaed27fc4ee44f5</a>]<br>
-(cherry picked from commit 0c12337194ee6dd082f082f0ccaed27fc4ee44f5)<br>
-Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" =
target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
----<br>
- src/ssl.c | 20 +++++++++++++++++---<br>
- 1 file changed, 17 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/src/ssl.c b/src/ssl.c<br>
-index 9ba891d62..a1421d523 100644<br>
---- a/src/ssl.c<br>
-+++ b/src/ssl.c<br>
-@@ -24159,11 +24159,25 @@ int wolfSSL_RAND_poll(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return=C2=A0 WOLFSSL_FAILURE;<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0ret =3D wc_GenerateSeed(&amp;globalRNG.seed, entropy, =
entropy_sz);<br>
--=C2=A0 =C2=A0 if (ret !=3D 0){<br>
-+=C2=A0 =C2=A0 if (ret !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WOLFSSL_MSG(&quot;Bad wc_RNG_GenerateBlo=
ck&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D WOLFSSL_FAILURE;<br>
--=C2=A0 =C2=A0 }else<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D WOLFSSL_SUCCESS;<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 else {<br>
-+#ifdef HAVE_HASHDRBG<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D wc_RNG_DRBG_Reseed(&amp;globalRNG, en=
tropy, entropy_sz);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WOLFSSL_MSG(&quot;Error reseedi=
ng DRBG&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D WOLFSSL_FAILURE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D WOLFSSL_SUCCESS;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+#else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 WOLFSSL_MSG(&quot;RAND_poll called with HAVE_=
HASHDRBG not set&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D WOLFSSL_FAILURE;<br>
-+#endif<br>
-+=C2=A0 =C2=A0 }<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0return ret;<br>
- }<br>
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-73=
94-2.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-73=
94-2.patch<br>
deleted file mode 100644<br>
index 883a5a1..0000000<br>
--- a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-2.pa=
tch<br>
+++ /dev/null<br>
@@ -1,275 +0,0 @@<br>
-From b506ed4aeb2c86788422427624a03eb9bda52efc Mon Sep 17 00:00:00 2001<br>
-From: JacobBarthelmeh &lt;<a href=3D"mailto:jacob@wolfssl.com" target=3D"_=
blank">jacob@wolfssl.com</a>&gt;<br>
-Date: Tue, 10 Jun 2025 12:49:08 -0600<br>
-Subject: [PATCH] add sanity checks on pid with RNG<br>
-<br>
-CVE: CVE-2025-7394<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/wolfSSL/wolfssl/c=
ommit/31490ab813a5aac096f50800c26c690d8ae586d2" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/wolfSSL/wolfssl/commit/31490ab813a5aac096f50=
800c26c690d8ae586d2</a>]<br>
-Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" =
target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
----<br>
- CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A04 +-<br>
- src/ssl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 40 +++++++++++-<br>
- wolfcrypt/src/random.c=C2=A0 =C2=A0 =C2=A0| 126 ++++++++++++++++++++++---=
------------<br>
- wolfssl/wolfcrypt/random.h |=C2=A0 =C2=A03 +<br>
- 5 files changed, 118 insertions(+), 56 deletions(-)<br>
-<br>
-diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
-index 4e6f05fc6..910a36648 100644<br>
---- a/CMakeLists.txt<br>
-+++ b/CMakeLists.txt<br>
-@@ -124,6 +124,7 @@ check_function_exists(&quot;memset&quot; HAVE_MEMSET)<=
br>
- check_function_exists(&quot;socket&quot; HAVE_SOCKET)<br>
- check_function_exists(&quot;strftime&quot; HAVE_STRFTIME)<br>
- check_function_exists(&quot;__atomic_fetch_add&quot; HAVE_C___ATOMIC)<br>
-+check_function_exists(&quot;getpid&quot; HAVE_GETPID)<br>
- <br>
- include(CheckTypeSize)<br>
- <br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index c973b7e39..43ddd4767 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -125,8 +125,8 @@ AC_CHECK_HEADER(stdatomic.h, [AM_CPPFLAGS=3D&quot;$AM_=
CPPFLAGS -DWOLFSSL_HAVE_ATOMIC_H&quot;<br>
- # check if functions of interest are linkable, but also check if<br>
- # they&#39;re declared by the expected headers, and if not, supersede the=
<br>
- # unusable positive from AC_CHECK_FUNCS().<br>
--AC_CHECK_FUNCS([gethostbyname getaddrinfo gettimeofday gmtime_r gmtime_s =
inet_ntoa memset socket strftime atexit])<br>
--AC_CHECK_DECLS([gethostbyname, getaddrinfo, gettimeofday, gmtime_r, gmtim=
e_s, inet_ntoa, memset, socket, strftime, atexit], [], [<br>
-+AC_CHECK_FUNCS([gethostbyname getaddrinfo gettimeofday gmtime_r gmtime_s =
inet_ntoa memset socket strftime atexit getpid])<br>
-+AC_CHECK_DECLS([gethostbyname, getaddrinfo, gettimeofday, gmtime_r, gmtim=
e_s, inet_ntoa, memset, socket, strftime, atexit, getpid], [], [<br>
- if test &quot;$(eval echo \$&quot;$(eval &#39;echo ac_cv_func_${as_decl_n=
ame}&#39;)&quot;)&quot; =3D &quot;yes&quot;<br>
- then<br>
-=C2=A0 =C2=A0 =C2=A0AC_MSG_NOTICE([=C2=A0 =C2=A0 note: earlier check for $=
(eval &#39;echo ${as_decl_name}&#39;) superseded.])<br>
-diff --git a/src/ssl.c b/src/ssl.c<br>
-index a1421d523..872aed594 100644<br>
---- a/src/ssl.c<br>
-+++ b/src/ssl.c<br>
-@@ -23615,6 +23615,10 @@ int wolfSSL_RAND_Init(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (initGlobalRNG =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D wc_InitRng(&amp;gl=
obalRNG);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #if defined(HAVE_GETPID) &amp;&=
amp; defined(HAVE_FIPS) &amp;&amp; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FIPS_VERSION3_LT(=
6,0,0)))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 currentPid =3D ge=
tpid();<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initGlobalRN=
G =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D WOLF=
SSL_SUCCESS;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -24045,8 +24049,30 @@ int wolfSSL_RAND_pseudo_bytes(unsigned char* buf,=
 int num)<br>
-=C2=A0 =C2=A0 =C2=A0return ret;<br>
- }<br>
- <br>
--/* returns WOLFSSL_SUCCESS if the bytes generated are valid otherwise<br>
-- * WOLFSSL_FAILURE */<br>
-+#if defined(HAVE_GETPID) &amp;&amp; defined(HAVE_FIPS) &amp;&amp; FIPS_VE=
RSION3_LT(6,0,0)))<br>
-+/* In older FIPS bundles add check for reseed here since it does not exis=
t in<br>
-+ * the older random.c certified files. */<br>
-+static pid_t currentPid =3D 0;<br>
-+<br>
-+/* returns WOLFSSL_SUCCESS on success and WOLFSSL_FAILURE on failure */<b=
r>
-+static int RandCheckReSeed()<br>
-+{<br>
-+=C2=A0 =C2=A0 int ret =3D WOLFSSL_SUCCESS;<br>
-+=C2=A0 =C2=A0 pid_t p;<br>
-+<br>
-+=C2=A0 =C2=A0 p =3D getpid();<br>
-+=C2=A0 =C2=A0 if (p !=3D currentPid) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 currentPid =3D p;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (wolfSSL_RAND_poll() !=3D WOLFSSL_SUCCESS)=
 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D WOLFSSL_FAILURE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 return ret;<br>
-+}<br>
-+#endif<br>
-+<br>
-+/* returns WOLFSSL_SUCCESS (1) if the bytes generated are valid otherwise=
 0<br>
-+ * on failure */<br>
- int wolfSSL_RAND_bytes(unsigned char* buf, int num)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0ret =3D 0;<br>
-@@ -24089,6 +24115,16 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int nu=
m)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (initGlobalRNG) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rng =3D &amp;globalRNG;<br=
>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #if defined(HAVE_GETPID) &amp;&amp; defined(H=
AVE_FIPS) &amp;&amp; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FIPS_VERSION3_LT(=
6,0,0)))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (RandCheckReSeed() !=3D WOLF=
SSL_SUCCESS) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wc_UnLockMutex(&a=
mp;globalRNGMutex);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WOLFSSL_MSG(&quot=
;Issue with check pid and reseed&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0used_global =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
-diff --git a/wolfcrypt/src/random.c b/wolfcrypt/src/random.c<br>
-index 89c7411c9..b440e274b 100644<br>
---- a/wolfcrypt/src/random.c<br>
-+++ b/wolfcrypt/src/random.c<br>
-@@ -1599,6 +1599,9 @@ static int _InitRng(WC_RNG* rng, byte* nonce, word32=
 nonceSz,<br>
- #else<br>
-=C2=A0 =C2=A0 =C2=A0rng-&gt;heap =3D heap;<br>
- #endif<br>
-+#ifdef HAVE_GETPID<br>
-+=C2=A0 =C2=A0 rng-&gt;pid =3D getpid();<br>
-+#endif<br>
- #if defined(WOLFSSL_ASYNC_CRYPT) || defined(WOLF_CRYPTO_CB)<br>
-=C2=A0 =C2=A0 =C2=A0rng-&gt;devId =3D devId;<br>
-=C2=A0 =C2=A0 =C2=A0#if defined(WOLF_CRYPTO_CB)<br>
-@@ -1849,6 +1852,63 @@ int wc_InitRngNonce_ex(WC_RNG* rng, byte* nonce, wo=
rd32 nonceSz,<br>
-=C2=A0 =C2=A0 =C2=A0return _InitRng(rng, nonce, nonceSz, heap, devId);<br>
- }<br>
- <br>
-+#ifdef HAVE_HASHDRBG<br>
-+static int PollAndReSeed(WC_RNG* rng)<br>
-+{<br>
-+=C2=A0 =C2=A0 int ret=C2=A0 =C2=A0=3D DRBG_NEED_RESEED;<br>
-+=C2=A0 =C2=A0 int devId =3D INVALID_DEVID;<br>
-+#if defined(WOLFSSL_ASYNC_CRYPT) || defined(WOLF_CRYPTO_CB)<br>
-+=C2=A0 =C2=A0 devId =3D rng-&gt;devId;<br>
-+#endif<br>
-+=C2=A0 =C2=A0 if (wc_RNG_HealthTestLocal(1, rng-&gt;heap, devId) =3D=3D 0=
) {<br>
-+=C2=A0 =C2=A0 #ifndef WOLFSSL_SMALL_STACK<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 byte newSeed[SEED_SZ + SEED_BLOCK_SZ];<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D DRBG_SUCCESS;<br>
-+=C2=A0 =C2=A0 #else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 byte* newSeed =3D (byte*)XMALLOC(SEED_SZ + SE=
ED_BLOCK_SZ, rng-&gt;heap,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DYNAMIC_TYPE_SEED);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D (newSeed =3D=3D NULL) ? MEMORY_E : DR=
BG_SUCCESS;<br>
-+=C2=A0 =C2=A0 #endif<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D DRBG_SUCCESS) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #ifdef WC_RNG_SEED_CB<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (seedCb =3D=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D DRBG_NO_S=
EED_CB;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D seedCb(&a=
mp;rng-&gt;seed, newSeed, SEED_SZ + SEED_BLOCK_SZ);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0) {=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
 =3D DRBG_FAILURE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D wc_GenerateSeed(&amp;rn=
g-&gt;seed, newSeed,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SEED_SZ + SEED_BLOCK_SZ);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D DRBG_FAIL=
URE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D DRBG_SUCCESS)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D wc_RNG_TestSeed(newSeed=
, SEED_SZ + SEED_BLOCK_SZ);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D DRBG_SUCCESS)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D Hash_DRBG_Reseed((DRBG_=
internal *)rng-&gt;drbg,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newSeed + SEED_BLOCK_SZ=
, SEED_SZ);<br>
-+=C2=A0 =C2=A0 #ifdef WOLFSSL_SMALL_STACK<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (newSeed !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ForceZero(newSeed, SEED_SZ + SE=
ED_BLOCK_SZ);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 XFREE(newSeed, rng-&gt;heap, DYNAMIC_TYPE_SEE=
D);<br>
-+=C2=A0 =C2=A0 #else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ForceZero(newSeed, sizeof(newSeed));<br>
-+=C2=A0 =C2=A0 #endif<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D DRBG_CONT_FAILURE;<br>
-+=C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 return ret;<br>
-+}<br>
-+#endif<br>
- <br>
- /* place a generated block in output */<br>
- WOLFSSL_ABI<br>
-@@ -1908,60 +1968,22 @@ int wc_RNG_GenerateBlock(WC_RNG* rng, byte* output=
, word32 sz)<br>
-=C2=A0 =C2=A0 =C2=A0if (rng-&gt;status !=3D DRBG_OK)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return RNG_FAILURE_E;<br>
- <br>
-+#ifdef HAVE_GETPID<br>
-+=C2=A0 =C2=A0 if (rng-&gt;pid !=3D getpid()) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rng-&gt;pid =3D getpid();<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D PollAndReSeed(rng);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D DRBG_SUCCESS) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rng-&gt;status =3D DRBG_FAILED;=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return RNG_FAILURE_E;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 }<br>
-+#endif<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0ret =3D Hash_DRBG_Generate((DRBG_internal *)rng-&gt;dr=
bg, output, sz);<br>
-=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D DRBG_NEED_RESEED) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 int devId =3D INVALID_DEVID;<br>
--=C2=A0 =C2=A0 #if defined(WOLFSSL_ASYNC_CRYPT) || defined(WOLF_CRYPTO_CB)=
<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 devId =3D rng-&gt;devId;<br>
--=C2=A0 =C2=A0 #endif<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (wc_RNG_HealthTestLocal(1, rng-&gt;heap, d=
evId) =3D=3D 0) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 #ifndef WOLFSSL_SMALL_STACK<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 byte newSeed[SEED_SZ + SEED_BLO=
CK_SZ];<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D DRBG_SUCCESS;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 byte* newSeed =3D (byte*)XMALLO=
C(SEED_SZ + SEED_BLOCK_SZ, rng-&gt;heap,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DYNAMIC_TYPE_SEED=
);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D (newSeed =3D=3D NULL) ?=
 MEMORY_E : DRBG_SUCCESS;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D DRBG_SUCCESS) {<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #ifdef WC_RNG_SEED_CB<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (seedCb =3D=3D=
 NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
 =3D DRBG_NO_SEED_CB;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
 =3D seedCb(&amp;rng-&gt;seed, newSeed, SEED_SZ + SEED_BLOCK_SZ);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
(ret !=3D 0) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ret =3D DRBG_FAILURE;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D wc_Genera=
teSeed(&amp;rng-&gt;seed, newSeed,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SEED_SZ + SEED_BLOCK_SZ);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D 0)<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
 =3D DRBG_FAILURE;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D DRBG_SUCCESS)<br=
>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D wc_RNG_Te=
stSeed(newSeed, SEED_SZ + SEED_BLOCK_SZ);<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D DRBG_SUCCESS)<br=
>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D Hash_DRBG=
_Reseed((DRBG_internal *)rng-&gt;drbg,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0newSeed +=
 SEED_BLOCK_SZ, SEED_SZ);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D DRBG_SUCCESS)<br=
>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D Hash_DRBG=
_Generate((DRBG_internal *)rng-&gt;drbg, output, sz);<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 #ifdef WOLFSSL_SMALL_STACK<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (newSeed !=3D NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ForceZero(newSeed=
, SEED_SZ + SEED_BLOCK_SZ);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 XFREE(newSeed, rng-&gt;heap, DY=
NAMIC_TYPE_SEED);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ForceZero(newSeed, sizeof(newSe=
ed));<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D DRBG_CONT_FAILURE;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D PollAndReSeed(rng);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D DRBG_SUCCESS)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D Hash_DRBG_Generate((DRB=
G_internal *)rng-&gt;drbg, output, sz);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D DRBG_SUCCESS) {<br>
-diff --git a/wolfssl/wolfcrypt/random.h b/wolfssl/wolfcrypt/random.h<br>
-index 9dd616328..f472e1f40 100644<br>
---- a/wolfssl/wolfcrypt/random.h<br>
-+++ b/wolfssl/wolfcrypt/random.h<br>
-@@ -183,6 +183,9 @@ struct WC_RNG {<br>
- #endif<br>
-=C2=A0 =C2=A0 =C2=A0byte status;<br>
- #endif<br>
-+#ifdef HAVE_GETPID<br>
-+=C2=A0 =C2=A0 pid_t pid;<br>
-+#endif<br>
- #ifdef WOLFSSL_ASYNC_CRYPT<br>
-=C2=A0 =C2=A0 =C2=A0WC_ASYNC_DEV asyncDev;<br>
- #endif<br>
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-73=
94-3.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-73=
94-3.patch<br>
deleted file mode 100644<br>
index e70a3fe..0000000<br>
--- a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-3.pa=
tch<br>
+++ /dev/null<br>
@@ -1,125 +0,0 @@<br>
-From 62a3a4f0b8b307bdacc34204db44627521de4bf9 Mon Sep 17 00:00:00 2001<br>
-From: JacobBarthelmeh &lt;<a href=3D"mailto:jacob@wolfssl.com" target=3D"_=
blank">jacob@wolfssl.com</a>&gt;<br>
-Date: Tue, 10 Jun 2025 14:15:38 -0600<br>
-Subject: [PATCH] add mutex locking and compat layer FIPS case<br>
-<br>
-CVE: CVE-2025-7394<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/wolfSSL/wolfssl/c=
ommit/fbbb6b7707f7f8ae1c38ab68daec0af02ee0208a" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/wolfSSL/wolfssl/commit/fbbb6b7707f7f8ae1c38a=
b68daec0af02ee0208a</a>]<br>
-(cherry picked from commit fbbb6b7707f7f8ae1c38ab68daec0af02ee0208a)<br>
-Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" =
target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
----<br>
- src/ssl.c | 62 +++++++++++++++++++++++++++----------------------------<br=
>
- 1 file changed, 31 insertions(+), 31 deletions(-)<br>
-<br>
-diff --git a/src/ssl.c b/src/ssl.c<br>
-index 872aed594..f0186b253 100644<br>
---- a/src/ssl.c<br>
-+++ b/src/ssl.c<br>
-@@ -23603,6 +23603,12 @@ static int wolfSSL_RAND_InitMutex(void)<br>
- <br>
- #ifdef OPENSSL_EXTRA<br>
- <br>
-+#if defined(HAVE_GETPID) &amp;&amp; defined(HAVE_FIPS) &amp;&amp; FIPS_VE=
RSION3_LT(6,0,0)<br>
-+/* In older FIPS bundles add check for reseed here since it does not exis=
t in<br>
-+ * the older random.c certified files. */<br>
-+static pid_t currentRandPid =3D 0;<br>
-+#endif<br>
-+<br>
- /* Checks if the global RNG has been created. If not then one is created.=
<br>
-=C2=A0 *<br>
-=C2=A0 * Returns WOLFSSL_SUCCESS when no error is encountered.<br>
-@@ -23616,8 +23622,8 @@ int wolfSSL_RAND_Init(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D wc_InitRng(&amp;gl=
obalRNG);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#if defined(HAVE_GETPID) &=
amp;&amp; defined(HAVE_FIPS) &amp;&amp; \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FIPS_VERSION3_LT(=
6,0,0)))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 currentPid =3D ge=
tpid();<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FIPS_VERSION3_LT(=
6,0,0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 currentRandPid =
=3D getpid();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initGlobalRN=
G =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D WOLF=
SSL_SUCCESS;<br>
-@@ -24049,28 +24055,6 @@ int wolfSSL_RAND_pseudo_bytes(unsigned char* buf,=
 int num)<br>
-=C2=A0 =C2=A0 =C2=A0return ret;<br>
- }<br>
- <br>
--#if defined(HAVE_GETPID) &amp;&amp; defined(HAVE_FIPS) &amp;&amp; FIPS_VE=
RSION3_LT(6,0,0)))<br>
--/* In older FIPS bundles add check for reseed here since it does not exis=
t in<br>
-- * the older random.c certified files. */<br>
--static pid_t currentPid =3D 0;<br>
--<br>
--/* returns WOLFSSL_SUCCESS on success and WOLFSSL_FAILURE on failure */<b=
r>
--static int RandCheckReSeed()<br>
--{<br>
--=C2=A0 =C2=A0 int ret =3D WOLFSSL_SUCCESS;<br>
--=C2=A0 =C2=A0 pid_t p;<br>
--<br>
--=C2=A0 =C2=A0 p =3D getpid();<br>
--=C2=A0 =C2=A0 if (p !=3D currentPid) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 currentPid =3D p;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (wolfSSL_RAND_poll() !=3D WOLFSSL_SUCCESS)=
 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D WOLFSSL_FAILURE;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 return ret;<br>
--}<br>
--#endif<br>
--<br>
- /* returns WOLFSSL_SUCCESS (1) if the bytes generated are valid otherwise=
 0<br>
-=C2=A0 * on failure */<br>
- int wolfSSL_RAND_bytes(unsigned char* buf, int num)<br>
-@@ -24114,17 +24098,27 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int n=
um)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * have the lock.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (initGlobalRNG) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rng =3D &amp;globalRNG;<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#if defined(HAVE_GETPID) &amp;&amp; defi=
ned(HAVE_FIPS) &amp;&amp; \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FIPS_VERSION3_LT(=
6,0,0)))<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (RandCheckReSeed() !=3D WOLF=
SSL_SUCCESS) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FIPS_VERSION3_LT(=
6,0,0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pid_t p;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D getpid();<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (p !=3D currentRandPid) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wc_UnLockMut=
ex(&amp;globalRNGMutex);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WOLFSSL_MSG(&quot=
;Issue with check pid and reseed&quot;);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (wolfSSL_RAND_=
poll() !=3D WOLFSSL_SUCCESS) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WOL=
FSSL_MSG(&quot;Issue with check pid and reseed&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
 =3D WOLFSSL_FAILURE;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* reclaim lock a=
fter wolfSSL_RAND_poll */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (wc_LockMutex(=
&amp;globalRNGMutex) !=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WOL=
FSSL_MSG(&quot;Bad Lock Mutex rng&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
urn ret;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 currentRandPid =
=3D p;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#endif<br>
--<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rng =3D &amp;globalRNG;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0used_global =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
-@@ -24201,6 +24195,11 @@ int wolfSSL_RAND_poll(void)<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0else {<br>
- #ifdef HAVE_HASHDRBG<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (wc_LockMutex(&amp;globalRNGMutex) !=3D 0)=
 {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WOLFSSL_MSG(&quot;Bad Lock Mute=
x rng&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D wc_RNG_DRBG_Reseed(&amp;globalRN=
G, entropy, entropy_sz);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret !=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WOLFSSL_MSG(&quot;Error re=
seeding DRBG&quot;);<br>
-@@ -24209,6 +24208,7 @@ int wolfSSL_RAND_poll(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D WOLFSSL_SUCCESS;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 wc_UnLockMutex(&amp;globalRNGMutex);<br>
- #else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WOLFSSL_MSG(&quot;RAND_poll called with =
HAVE_HASHDRBG not set&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D WOLFSSL_FAILURE;<br>
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-73=
94-4.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-73=
94-4.patch<br>
deleted file mode 100644<br>
index 7d6413f..0000000<br>
--- a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.pa=
tch<br>
+++ /dev/null<br>
@@ -1,85 +0,0 @@<br>
-From d7a68e85ebe4705e7345b0e5012c806615cd86c7 Mon Sep 17 00:00:00 2001<br>
-From: JacobBarthelmeh &lt;<a href=3D"mailto:jacob@wolfssl.com" target=3D"_=
blank">jacob@wolfssl.com</a>&gt;<br>
-Date: Tue, 10 Jun 2025 16:12:09 -0600<br>
-Subject: [PATCH] add a way to restore previous pid behavior<br>
-<br>
-CVE: CVE-2025-7394<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/wolfSSL/wolfssl/c=
ommit/47cf634965a3aabe82fd97a8feed9efd6688e34a" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/wolfSSL/wolfssl/commit/47cf634965a3aabe82fd9=
7a8feed9efd6688e34a</a>]<br>
-Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" =
target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
----<br>
- src/ssl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 11 ++++++-----<br>
- wolfcrypt/src/random.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
- wolfssl/wolfcrypt/random.h |=C2=A0 2 +-<br>
- 3 files changed, 9 insertions(+), 8 deletions(-)<br>
-<br>
-diff --git a/src/ssl.c b/src/ssl.c<br>
-index f0186b253..e214fa504 100644<br>
---- a/src/ssl.c<br>
-+++ b/src/ssl.c<br>
-@@ -23603,7 +23603,8 @@ static int wolfSSL_RAND_InitMutex(void)<br>
- <br>
- #ifdef OPENSSL_EXTRA<br>
- <br>
--#if defined(HAVE_GETPID) &amp;&amp; defined(HAVE_FIPS) &amp;&amp; FIPS_VE=
RSION3_LT(6,0,0)<br>
-+#if defined(HAVE_GETPID) &amp;&amp; !defined(WOLFSSL_NO_GETPID) &amp;&amp=
; \<br>
-+=C2=A0 =C2=A0 defined(HAVE_FIPS) &amp;&amp; FIPS_VERSION3_LT(6,0,0)<br>
- /* In older FIPS bundles add check for reseed here since it does not exis=
t in<br>
-=C2=A0 * the older random.c certified files. */<br>
- static pid_t currentRandPid =3D 0;<br>
-@@ -23621,8 +23622,8 @@ int wolfSSL_RAND_Init(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (initGlobalRNG =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D wc_InitRng(&amp;gl=
obalRNG);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #if defined(HAVE_GETPID) &amp;&=
amp; defined(HAVE_FIPS) &amp;&amp; \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FIPS_VERSION3_LT(=
6,0,0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #if defined(HAVE_GETPID) &amp;&=
amp; !defined(WOLFSSL_NO_GETPID) &amp;&amp; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 defined(HAVE_FIPS=
) &amp;&amp; FIPS_VERSION3_LT(6,0,0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0currentRandP=
id =3D getpid();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initGlobalRN=
G =3D 1;<br>
-@@ -24098,8 +24099,8 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int num=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * have the lock.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (initGlobalRNG) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 #if defined(HAVE_GETPID) &amp;&amp; defined(H=
AVE_FIPS) &amp;&amp; \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FIPS_VERSION3_LT(=
6,0,0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #if defined(HAVE_GETPID) &amp;&amp; !defined(=
WOLFSSL_NO_GETPID) &amp;&amp; \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 defined(HAVE_FIPS=
) &amp;&amp; FIPS_VERSION3_LT(6,0,0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pid_t p;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D getpid();<br>
-diff --git a/wolfcrypt/src/random.c b/wolfcrypt/src/random.c<br>
-index b440e274b..dc89db542 100644<br>
---- a/wolfcrypt/src/random.c<br>
-+++ b/wolfcrypt/src/random.c<br>
-@@ -1599,7 +1599,7 @@ static int _InitRng(WC_RNG* rng, byte* nonce, word32=
 nonceSz,<br>
- #else<br>
-=C2=A0 =C2=A0 =C2=A0rng-&gt;heap =3D heap;<br>
- #endif<br>
--#ifdef HAVE_GETPID<br>
-+#if defined(HAVE_GETPID) &amp;&amp; !defined(WOLFSSL_NO_GETPID)<br>
-=C2=A0 =C2=A0 =C2=A0rng-&gt;pid =3D getpid();<br>
- #endif<br>
- #if defined(WOLFSSL_ASYNC_CRYPT) || defined(WOLF_CRYPTO_CB)<br>
-@@ -1968,7 +1968,7 @@ int wc_RNG_GenerateBlock(WC_RNG* rng, byte* output, =
word32 sz)<br>
-=C2=A0 =C2=A0 =C2=A0if (rng-&gt;status !=3D DRBG_OK)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return RNG_FAILURE_E;<br>
- <br>
--#ifdef HAVE_GETPID<br>
-+#if defined(HAVE_GETPID) &amp;&amp; !defined(WOLFSSL_NO_GETPID)<br>
-=C2=A0 =C2=A0 =C2=A0if (rng-&gt;pid !=3D getpid()) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rng-&gt;pid =3D getpid();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D PollAndReSeed(rng);<br>
-diff --git a/wolfssl/wolfcrypt/random.h b/wolfssl/wolfcrypt/random.h<br>
-index f472e1f40..320641548 100644<br>
---- a/wolfssl/wolfcrypt/random.h<br>
-+++ b/wolfssl/wolfcrypt/random.h<br>
-@@ -183,7 +183,7 @@ struct WC_RNG {<br>
- #endif<br>
-=C2=A0 =C2=A0 =C2=A0byte status;<br>
- #endif<br>
--#ifdef HAVE_GETPID<br>
-+#if defined(HAVE_GETPID) &amp;&amp; !defined(WOLFSSL_NO_GETPID)<br>
-=C2=A0 =C2=A0 =C2=A0pid_t pid;<br>
- #endif<br>
- #ifdef WOLFSSL_ASYNC_CRYPT<br>
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-73=
94-5.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-73=
94-5.patch<br>
deleted file mode 100644<br>
index 6747f24..0000000<br>
--- a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-5.pa=
tch<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-From 670437d91ae3025b4721eb4f450e5dc31fc3d6ee Mon Sep 17 00:00:00 2001<br>
-From: Chris Conlon &lt;<a href=3D"mailto:chris@wolfssl.com" target=3D"_bla=
nk">chris@wolfssl.com</a>&gt;<br>
-Date: Wed, 18 Jun 2025 16:08:34 -0600<br>
-Subject: [PATCH] Add HAVE_GETPID to options.h if getpid detected, needed f=
or<br>
- apps to correctly detect size of WC_RNG struct<br>
-<br>
-CVE: CVE-2025-7394<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/wolfSSL/wolfssl/c=
ommit/9c35c0de65e135e621400958f22829c0d2555ed4" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/wolfSSL/wolfssl/commit/9c35c0de65e135e621400=
958f22829c0d2555ed4</a>]<br>
-Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" =
target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 9 +++++++++<br>
- 1 file changed, 9 insertions(+)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 43ddd4767..636c45aef 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -156,6 +156,9 @@ fi<br>
- #ifdef HAVE_STDLIB_H<br>
-=C2=A0 =C2=A0 =C2=A0#include &lt;stdlib.h&gt;<br>
- #endif<br>
-+#ifdef HAVE_UNISTD_H<br>
-+=C2=A0 =C2=A0 #include &lt;unistd.h&gt;<br>
-+#endif<br>
- ]])<br>
- <br>
- AC_PROG_INSTALL<br>
-@@ -9479,6 +9482,12 @@ then<br>
-=C2=A0 =C2=A0 =C2=A0AM_CFLAGS=3D&quot;$AM_CFLAGS -DHAVE___UINT128_T=3D1&qu=
ot;<br>
- fi<br>
- <br>
-+# Add HAVE_GETPID to AM_CFLAGS for inclusion in options.h<br>
-+if test &quot;$ac_cv_func_getpid&quot; =3D &quot;yes&quot;<br>
-+then<br>
-+=C2=A0 =C2=A0 AM_CFLAGS=3D&quot;$AM_CFLAGS -DHAVE_GETPID=3D1&quot;<br>
-+fi<br>
-+<br>
- LIB_SOCKET_NSL<br>
- AX_HARDEN_CC_COMPILER_FLAGS<br>
- <br>
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-73=
94-6.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-73=
94-6.patch<br>
deleted file mode 100644<br>
index e86bc8b..0000000<br>
--- a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-6.pa=
tch<br>
+++ /dev/null<br>
@@ -1,48 +0,0 @@<br>
-From aaad0035e4e795b8b225bd481e3942de015a362d Mon Sep 17 00:00:00 2001<br>
-From: Chris Conlon &lt;<a href=3D"mailto:chris@wolfssl.com" target=3D"_bla=
nk">chris@wolfssl.com</a>&gt;<br>
-Date: Wed, 18 Jun 2025 16:57:02 -0600<br>
-Subject: [PATCH] Add check for reseed in ssl.c for HAVE_SELFTEST, similar =
to<br>
- old FIPS bundles that do not have older random.c files<br>
-<br>
-CVE: CVE-2025-7394<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/wolfSSL/wolfssl/c=
ommit/cdd02f9665ef43126503307972e4389070a00a73-(cherry" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/wolfSSL/wolfssl/commit/cdd02f9665ef431=
26503307972e4389070a00a73<br>
-(cherry</a> picked from commit cdd02f9665ef43126503307972e4389070a00a73)<b=
r>
-Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" =
target=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
----<br>
- src/ssl.c | 9 ++++++---<br>
- 1 file changed, 6 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/src/ssl.c b/src/ssl.c<br>
-index e214fa504..e538233fc 100644<br>
---- a/src/ssl.c<br>
-+++ b/src/ssl.c<br>
-@@ -23604,7 +23604,7 @@ static int wolfSSL_RAND_InitMutex(void)<br>
- #ifdef OPENSSL_EXTRA<br>
- <br>
- #if defined(HAVE_GETPID) &amp;&amp; !defined(WOLFSSL_NO_GETPID) &amp;&amp=
; \<br>
--=C2=A0 =C2=A0 defined(HAVE_FIPS) &amp;&amp; FIPS_VERSION3_LT(6,0,0)<br>
-+=C2=A0 =C2=A0 ((defined(HAVE_FIPS) &amp;&amp; FIPS_VERSION3_LT(6,0,0)) ||=
 defined(HAVE_SELFTEST))<br>
- /* In older FIPS bundles add check for reseed here since it does not exis=
t in<br>
-=C2=A0 * the older random.c certified files. */<br>
- static pid_t currentRandPid =3D 0;<br>
-@@ -23623,7 +23623,9 @@ int wolfSSL_RAND_Init(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D wc_InitRng(&amp;gl=
obalRNG);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#if defined(HAVE_GETPID) &=
amp;&amp; !defined(WOLFSSL_NO_GETPID) &amp;&amp; \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 defined(HAVE_FIPS=
) &amp;&amp; FIPS_VERSION3_LT(6,0,0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((defined(HAVE_FI=
PS) &amp;&amp; FIPS_VERSION3_LT(6,0,0)) || \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0defined(HAV=
E_SELFTEST))<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0currentRandP=
id =3D getpid();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initGlobalRN=
G =3D 1;<br>
-@@ -24100,7 +24102,8 @@ int wolfSSL_RAND_bytes(unsigned char* buf, int num=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (initGlobalRNG) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#if defined(HAVE_GETPID) &amp;&amp; !def=
ined(WOLFSSL_NO_GETPID) &amp;&amp; \<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 defined(HAVE_FIPS=
) &amp;&amp; FIPS_VERSION3_LT(6,0,0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((defined(HAVE_FI=
PS) &amp;&amp; FIPS_VERSION3_LT(6,0,0)) || \<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0defined(HAV=
E_SELFTEST))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pid_t p;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D getpid();<br>
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-73=
95-1.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-73=
95-1.patch<br>
deleted file mode 100644<br>
index 9c661d6..0000000<br>
--- a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.pa=
tch<br>
+++ /dev/null<br>
@@ -1,84 +0,0 @@<br>
-From e6c0d1ac7b480c0b5e36f660dd3c0f2b45e4c3ab Mon Sep 17 00:00:00 2001<br>
-From: Ruby Martin &lt;<a href=3D"mailto:ruby@wolfssl.com" target=3D"_blank=
">ruby@wolfssl.com</a>&gt;<br>
-Date: Mon, 2 Jun 2025 16:38:32 -0600<br>
-Subject: [PATCH] create policy for WOLFSSL_APPLE_NATIVE_CERT_VALIDATION,<b=
r>
- domain name checking<br>
-<br>
-CVE: CVE-2025-7395<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/wolfSSL/wolfssl/c=
ommit/9864959e41bd9259f258c09171ae2ec1c43fbc7f" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/wolfSSL/wolfssl/commit/9864959e41bd9259f258c=
09171ae2ec1c43fbc7f</a>]<br>
-Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
----<br>
- src/internal.c | 25 ++++++++++++++++++++-----<br>
- 1 file changed, 20 insertions(+), 5 deletions(-)<br>
-<br>
-diff --git a/src/internal.c b/src/internal.c<br>
-index 6bbd38fa8..2b090382f 100644<br>
---- a/src/internal.c<br>
-+++ b/src/internal.c<br>
-@@ -221,7 +221,7 @@ WOLFSSL_CALLBACKS needs LARGE_STATIC_BUFFERS, please a=
dd LARGE_STATIC_BUFFERS<br>
- #include &lt;Security/SecCertificate.h&gt;<br>
- #include &lt;Security/SecTrust.h&gt;<br>
- #include &lt;Security/SecPolicy.h&gt;<br>
--static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs,<=
br>
-+static int DoAppleNativeCertValidation(WOLFSSL* ssl, const WOLFSSL_BUFFER=
_INFO* certs,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0int totalCerts);<br>
- #endif /* #if defined(__APPLE__) &amp;&amp; defined(WOLFSSL_SYS_CA_CERTS)=
 */<br>
- <br>
-@@ -15992,7 +15992,7 @@ int ProcessPeerCerts(WOLFSSL* ssl, byte* input, wo=
rd32* inOutIdx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * into wolfSSL, try to va=
lidate against the system certificates<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * using Apple&#39;s nativ=
e trust APIs */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((ret !=3D 0) &amp;&amp=
; (ssl-&gt;ctx-&gt;doAppleNativeCertValidationFlag)) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (DoAppleNative=
CertValidation(args-&gt;certs,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (DoAppleNative=
CertValidation(ssl, args-&gt;certs,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args-&gt;totalCerts)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0WOLFSSL_MSG(&quot;Apple native cert chain validation SUCCESS&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ret =3D 0;<br>
-@@ -41246,7 +41246,8 @@ cleanup:<br>
-=C2=A0 * wolfSSL&#39;s built-in certificate validation mechanisms anymore.=
 We instead<br>
-=C2=A0 * must call into the Security Framework APIs to authenticate peer c=
ertificates<br>
-=C2=A0 */<br>
--static int DoAppleNativeCertValidation(const WOLFSSL_BUFFER_INFO* certs,<=
br>
-+static int DoAppleNativeCertValidation(WOLFSSL* ssl,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 const WOLFSSL_BUFFER_INFO* certs,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0int totalCerts)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0int i;<br>
-@@ -41255,7 +41256,8 @@ static int DoAppleNativeCertValidation(const WOLFS=
SL_BUFFER_INFO* certs,<br>
-=C2=A0 =C2=A0 =C2=A0CFMutableArrayRef certArray =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0SecCertificateRef secCert=C2=A0 =C2=A0=3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0SecTrustRef=C2=A0 =C2=A0 =C2=A0 =C2=A0trust=C2=A0 =C2=
=A0 =C2=A0=3D NULL;<br>
--=C2=A0 =C2=A0 SecPolicyRef=C2=A0 =C2=A0 =C2=A0 policy=C2=A0 =C2=A0 =3D NU=
LL ;<br>
-+=C2=A0 =C2=A0 SecPolicyRef=C2=A0 =C2=A0 =C2=A0 policy=C2=A0 =C2=A0 =3D NU=
LL;<br>
-+=C2=A0 =C2=A0 CFStringRef=C2=A0 =C2=A0 =C2=A0 =C2=A0hostname=C2=A0 =3D NU=
LL;<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0WOLFSSL_ENTER(&quot;DoAppleNativeCertValidation&quot;)=
;<br>
- <br>
-@@ -41283,7 +41285,17 @@ static int DoAppleNativeCertValidation(const WOLF=
SSL_BUFFER_INFO* certs,<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0/* Create trust object for SecCertifiate Ref */<br>
--=C2=A0 =C2=A0 policy =3D SecPolicyCreateSSL(true, NULL);<br>
-+=C2=A0 =C2=A0 if (ssl-&gt;buffers.domainName.buffer &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssl-&gt;buffers.domainName.leng=
th &gt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Create policy with specified value to requ=
ire host name match */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 hostname =3D CFStringCreateWithCString(kCFAll=
ocatorDefault,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (const char*)ssl-&gt;buffers.domainName.buffe=
r, kCFStringEncodingUTF8);<br>
-+=C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 if (hostname !=3D NULL) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 policy =3D SecPolicyCreateSSL(true, hostname)=
;<br>
-+=C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 policy =3D SecPolicyCreateSSL(true, NULL);<br=
>
-+=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0status =3D SecTrustCreateWithCertificates(certArray, p=
olicy, &amp;trust);<br>
-=C2=A0 =C2=A0 =C2=A0if (status !=3D errSecSuccess) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WOLFSSL_MSG_EX(&quot;Error creating trus=
t object, &quot;<br>
-@@ -41314,6 +41326,9 @@ cleanup:<br>
-=C2=A0 =C2=A0 =C2=A0if (policy) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CFRelease(policy);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 if (hostname) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CFRelease(hostname);<br>
-+=C2=A0 =C2=A0 }<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0WOLFSSL_LEAVE(&quot;DoAppleNativeCertValidation&quot;,=
 ret);<br>
- <br>
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-73=
95-2.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-73=
95-2.patch<br>
deleted file mode 100644<br>
index 857f6bb..0000000<br>
--- a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.pa=
tch<br>
+++ /dev/null<br>
@@ -1,27 +0,0 @@<br>
-From aad4e7c38f3784942923f4871d61a7e41d3de842 Mon Sep 17 00:00:00 2001<br>
-From: Brett &lt;<a href=3D"mailto:bigbrett@users.noreply.github.com" targe=
t=3D"_blank">bigbrett@users.noreply.github.com</a>&gt;<br>
-Date: Wed, 4 Jun 2025 15:48:15 -0600<br>
-Subject: [PATCH] prevent apple native cert validation from overriding erro=
r<br>
- codes other than ASN_NO_SIGNER_E<br>
-<br>
-CVE: CVE-2025-7395<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/wolfSSL/wolfssl/c=
ommit/bc8eeea703253bd65d472a9541b54fef326e8050" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/wolfSSL/wolfssl/commit/bc8eeea703253bd65d472=
a9541b54fef326e8050</a>]<br>
-Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
----<br>
- src/internal.c | 3 ++-<br>
- 1 file changed, 2 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/internal.c b/src/internal.c<br>
-index 2b090382f..79f584a0a 100644<br>
---- a/src/internal.c<br>
-+++ b/src/internal.c<br>
-@@ -15991,7 +15991,8 @@ int ProcessPeerCerts(WOLFSSL* ssl, byte* input, wo=
rd32* inOutIdx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we can&#39;t validat=
e the peer cert chain against the CAs loaded<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * into wolfSSL, try to va=
lidate against the system certificates<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * using Apple&#39;s nativ=
e trust APIs */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((ret !=3D 0) &amp;&amp; (ss=
l-&gt;ctx-&gt;doAppleNativeCertValidationFlag)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((ret =3D=3D ASN_NO_SIGNER_E=
) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (ssl-&gt;ctx-&gt;=
doAppleNativeCertValidationFlag)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (DoAppleN=
ativeCertValidation(ssl, args-&gt;certs,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args-&gt;totalCerts)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0WOLFSSL_MSG(&quot;Apple native cert chain validation SUCCESS&quot;);<br>
diff --git a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-73=
95-3.patch b/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-73=
95-3.patch<br>
deleted file mode 100644<br>
index a7e1c33..0000000<br>
--- a/meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.pa=
tch<br>
+++ /dev/null<br>
@@ -1,25 +0,0 @@<br>
-From f2a85e37e552d8dfafa2cbf32507b2fa545ee593 Mon Sep 17 00:00:00 2001<br>
-From: Brett &lt;<a href=3D"mailto:bigbrett@users.noreply.github.com" targe=
t=3D"_blank">bigbrett@users.noreply.github.com</a>&gt;<br>
-Date: Wed, 4 Jun 2025 16:56:16 -0600<br>
-Subject: [PATCH] add missing error trace macro<br>
-<br>
-CVE: CVE-2025-7395<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/wolfSSL/wolfssl/c=
ommit/0e2a3fd0b64bc6ba633aa9227e92ecacb42b5b1b" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/wolfSSL/wolfssl/commit/0e2a3fd0b64bc6ba633aa=
9227e92ecacb42b5b1b</a>]<br>
-Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
----<br>
- src/internal.c | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/internal.c b/src/internal.c<br>
-index 79f584a0a..5557b5698 100644<br>
---- a/src/internal.c<br>
-+++ b/src/internal.c<br>
-@@ -15991,7 +15991,7 @@ int ProcessPeerCerts(WOLFSSL* ssl, byte* input, wo=
rd32* inOutIdx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we can&#39;t validat=
e the peer cert chain against the CAs loaded<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * into wolfSSL, try to va=
lidate against the system certificates<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * using Apple&#39;s nativ=
e trust APIs */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((ret =3D=3D ASN_NO_SIGNER_E=
) &amp;&amp;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((ret =3D=3D WC_NO_ERR_TRACE=
(ASN_NO_SIGNER_E)) &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ssl-&gt;ctx=
-&gt;doAppleNativeCertValidationFlag)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (DoAppleN=
ativeCertValidation(ssl, args-&gt;certs,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 args-&gt;totalCerts)) {<br>
diff --git a/meta-networking/recipes-connectivity/wolfssl/<a href=3D"http:/=
/wolfssl_5.7.2.bb" rel=3D"noreferrer" target=3D"_blank">wolfssl_5.7.2.bb</a=
> b/meta-networking/recipes-connectivity/wolfssl/<a href=3D"http://wolfssl_=
5.9.2.bb" rel=3D"noreferrer" target=3D"_blank">wolfssl_5.9.2.bb</a><br>
similarity index 78%<br>
rename from meta-networking/recipes-connectivity/wolfssl/<a href=3D"http://=
wolfssl_5.7.2.bb" rel=3D"noreferrer" target=3D"_blank">wolfssl_5.7.2.bb</a>=
<br>
rename to meta-networking/recipes-connectivity/wolfssl/<a href=3D"http://wo=
lfssl_5.9.2.bb" rel=3D"noreferrer" target=3D"_blank">wolfssl_5.9.2.bb</a><b=
r>
index 0dc488d..2600e94 100644<br>
--- a/meta-networking/recipes-connectivity/wolfssl/<a href=3D"http://wolfss=
l_5.7.2.bb" rel=3D"noreferrer" target=3D"_blank">wolfssl_5.7.2.bb</a><br>
+++ b/meta-networking/recipes-connectivity/wolfssl/<a href=3D"http://wolfss=
l_5.9.2.bb" rel=3D"noreferrer" target=3D"_blank">wolfssl_5.9.2.bb</a><br>
@@ -14,17 +14,8 @@ RPROVIDES:${PN} =3D &quot;cyassl&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/wolfSSL/wolfssl.=
git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">=
github.com/wolfSSL/wolfssl.git;protocol=3Dhttps;branch=3Dmaster</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-7395-1.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-7395-2.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-7395-3.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-7394-1.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-7394-2.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-7394-3.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-7394-4.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-7394-5.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-7394-6.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRCREV =3D &quot;00e42151ca061463ba6a95adb2290f678cbca472&quot;<br>
+SRCREV =3D &quot;ac01707f552c611fbd135cc723b2682b3e7f80f2&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128230): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128230" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128230</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120295424/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120295424/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000cf53b80656c6c7ac--

