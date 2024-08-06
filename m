Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A367CC3DA64
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 13:23:20 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.7117.1722950595486194042
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 06:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mlhWDxAw;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-66c7aeac627so5202937b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 06:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722950594; x=1723555394; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7bK7IOCChwl/2mMMBjbUiuGUZhTWUg5Rx/b+QiZWqtA=;
        b=mlhWDxAwrTpTupRZLqzQvpY2Ioi1HgjxcwwGVXFIMXe35tRI5Rz6k2ThOq4M1MW6Qi
         Vhe6PUc+0jX0okVJ/uB3rEwCJWIRzb4aWMtXWEBKZOPWF2rr6kh9RseZh+usLn1+ht2w
         6oUC69vvFtZrQg6KU014eh12wPHZSoyWW2dZkyBS11X6FsBT5wh8kk/0SysAcyEj6Owh
         rVbDGaX8KV1jcn10cASXaty3w1JTqS8HcuxlQXGBcj00coECTXBgbtOsbZb0CdknfPXk
         YMuDA66hO3lpB9Z49Chz2TPF/R4pBhVZxebbUe+S5OTLQG3R1+dihIeSzy5LcVc7sfCd
         oDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722950594; x=1723555394;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bK7IOCChwl/2mMMBjbUiuGUZhTWUg5Rx/b+QiZWqtA=;
        b=KhBCyhwV8q1EiUrUcw9REZAgYyJ3SaG5S+lmDqy7YQAyEElttwcdPtG2uufFP5ws14
         US++nInXvSefmrNFDApG+WgewqQo6KjI19412ceffEAmE1HMGJTDL0HXqQDxDeF77Vgq
         lDvVUBu0ekCugaoDg4JHX4JV/Q4qYVPbY6hij14TOJpwKUwHmedqEynt2XbGCbxAzCZI
         94FTT9xHe2iS9cIitJ4W5bFB5+vFVmwG5k/L5V5PJckPA2J8TyefpX6nytAfcEFNBJxh
         8nI0e7zy/84GVtEWfUqOuMOVDlefNtu0+O1o6r6BsUJ7yIipLxcRoZrdHyJ5CMp/fl+p
         2XdA==
X-Forwarded-Encrypted: i=1; AJvYcCUgEeQ/hBpNwB9rm3sg93RXMPb2AaIZrfft1nCAUHSU/PfLV6JXElNYTjp4zUWH0WywU6w+69StupKBbizAc6bANjQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxvKf4bLDvpOpq6koBaJUiKeG4vQlMfGVFe0hyVtq2KPeiSBaDW
	tPaMM01hP/Tcj/Z2PcOBvp8Lk1nO7GiRYO3qvp+vM2DouE6TjzPCf9DCBQ==
X-Google-Smtp-Source: AGHT+IHVJoH/RGb6DHhT/NQYeA1ko12ZgksAkURmX+jTofcqEVx88ORb4Nn/CVmBrfzYAjln/Z1scw==
X-Received: by 2002:a0d:e5c1:0:b0:615:22ff:b57d with SMTP id 00721157ae682-689641a58eemr164922187b3.42.1722950594159;
        Tue, 06 Aug 2024 06:23:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:4300:30cd:ed94:a289? ([2600:1700:45dd:7000:4300:30cd:ed94:a289])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-68a12d138aasm15401597b3.78.2024.08.06.06.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 06:23:13 -0700 (PDT)
Message-ID: <4b2a8bb2-c67e-4233-be35-605e8a946bde@gmail.com>
Date: Tue, 6 Aug 2024 09:23:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][kirkstone][PATCH] opensc: Fix CVE CVE-2023-5992
To: nikhil.r@kpit.com, openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com
References: <20240806063939.527656-1-nikhil.r@kpit.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <20240806063939.527656-1-nikhil.r@kpit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 13:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111582



On 8/6/24 2:39 AM, Nikhil via lists.openembedded.org wrote:
> A vulnerability was found in OpenSC where PKCS#1
> encryption padding removal is not implemented as
> side-channel resistant. This issue may result in
> the potential leak of private data.
>
> Links: https://github.com/OpenSC/OpenSC/pull/2948/commits
> https://github.com/OpenSC/OpenSC/pull/3016
>
> Link: https://github.com/xhanulik/OpenSC/commit/bb9bd627462af4d61943a33d6e54308e103618f0
> Add the above commit to fix the below error
> Error:
> | ../../../git/src/pkcs11/mechanism.c: In function 'sc_pkcs11_decrypt':
> | ../../../git/src/pkcs11/mechanism.c:1093:24: error: 'rv' undeclared (first use in this function)

Is this a v2 or just a resend?

- armin
>
> The below commits were not added as they are part
> of unittests
> https://github.com/OpenSC/OpenSC/pull/2948/commits/708ce24c6b9f92a9f39bb7accda601b2891304a3
> https://github.com/OpenSC/OpenSC/pull/3016/commits/7309b37eb82496e7324671283a39f9291be09830
>
> Signed-off-by: Nikhil R <nikhil.r@kpit.com>
> ---
>   ...lement-the-C_DecryptFinalize-and-C_D.patch | 110 ++++++
>   .../opensc/opensc/CVE-2023-5992-1.patch       | 357 ++++++++++++++++++
>   .../opensc/opensc/CVE-2023-5992-2.patch       |  39 ++
>   .../opensc/opensc/CVE-2023-5992-3.patch       | 105 ++++++
>   .../opensc/opensc/CVE-2023-5992-4.patch       |  47 +++
>   .../opensc/opensc/CVE-2023-5992-5.patch       | 115 ++++++
>   .../opensc/opensc/CVE-2023-5992-6.patch       |  47 +++
>   .../opensc/opensc/CVE-2023-5992-7.patch       |  33 ++
>   .../opensc/opensc/CVE-2023-5992-8.patch       |  71 ++++
>   .../recipes-support/opensc/opensc_0.22.0.bb   |   9 +
>   10 files changed, 933 insertions(+)
>   create mode 100644 meta-oe/recipes-support/opensc/opensc/0001-Preparing-to-implement-the-C_DecryptFinalize-and-C_D.patch
>   create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.patch
>   create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.patch
>   create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.patch
>   create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.patch
>   create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.patch
>   create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.patch
>   create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.patch
>   create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.patch
>
> diff --git a/meta-oe/recipes-support/opensc/opensc/0001-Preparing-to-implement-the-C_DecryptFinalize-and-C_D.patch b/meta-oe/recipes-support/opensc/opensc/0001-Preparing-to-implement-the-C_DecryptFinalize-and-C_D.patch
> new file mode 100644
> index 000000000..619ab522e
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/0001-Preparing-to-implement-the-C_DecryptFinalize-and-C_D.patch
> @@ -0,0 +1,110 @@
> +From bb9bd627462af4d61943a33d6e54308e103618f0 Mon Sep 17 00:00:00 2001
> +From: Peter Popovec <popovec.peter@gmail.com>
> +Date: Mon, 20 Dec 2021 08:43:49 +0100
> +Subject: [PATCH] Preparing to implement the C_DecryptFinalize and
> + C_DecryptUpdate functions.
> +
> +The C_Decrypt() and pkcs15_prkey_decrypt() functions have been changed to
> +allow pkcs15_prkey_decrypt() to be called from C_DecryptInit(),
> +C_DecryptUpdate() and C_DecryptFinalize().
> +
> +CVE: CVE-2023-5992
> +Upstream-Status: Backport [https://github.com/xhanulik/OpenSC/commit/bb9bd627462af4d61943a33d6e54308e103618f0]
> +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> +Comment: Refreshed hunk to match latest kirkstone
> +---
> + src/pkcs11/framework-pkcs15.c | 15 +++++++++++++
> + src/pkcs11/mechanism.c        | 42 ++++++++++++++++++++++++++++++-----
> + 2 files changed, 51 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/pkcs11/framework-pkcs15.c b/src/pkcs11/framework-pkcs15.c
> +index 688cd84fdc..18f94271ed 100644
> +--- a/src/pkcs11/framework-pkcs15.c
> ++++ b/src/pkcs11/framework-pkcs15.c
> +@@ -4345,6 +4345,21 @@ pkcs15_prkey_decrypt(struct sc_pkcs11_se
> +       int rv, flags = 0, prkey_has_path = 0;
> +       CK_ULONG mask, good, rv_pkcs11;
> +
> ++      if (pulDataLen == NULL) {
> ++              /* This is call from the C_DecyptInit function */
> ++              sc_log(context, "C_DecryptInit...");
> ++              return CKR_OK;
> ++      }
> ++      if (pEncryptedData == NULL && ulEncryptedDataLen == 0) {
> ++              /* This is call from the C_DecryptFinalize function */
> ++              sc_log(context, "C_DecryptFinalize...");
> ++              *pulDataLen = 0;
> ++              return CKR_OK;
> ++      }
> ++      /* DecryptUpdate: we assume this code is called only once per session, either
> ++       * from the C_Decrypt function or from an application using the C_DecryptUpdate call
> ++       */
> ++
> +       sc_log(context, "Initiating decryption.");
> +
> +       if (!p11card)
> +diff --git a/src/pkcs11/mechanism.c b/src/pkcs11/mechanism.c
> +index 3035e8a763..a81b58fea6 100644
> +--- a/src/pkcs11/mechanism.c
> ++++ b/src/pkcs11/mechanism.c
> +@@ -1072,9 +1072,11 @@ sc_pkcs11_decrypt_init(sc_pkcs11_operati
> +                       LOG_FUNC_RETURN(context, (int) rv);
> +               }
> +       }
> +-
> +       operation->priv_data = data;
> +-      return CKR_OK;
> ++
> ++      /* The last parameter is NULL - this is call to INIT code in underlying functions */
> ++      return key->ops->decrypt(operation->session,
> ++                      key, &operation->mechanism, NULL, 0, NULL, NULL);
> + }
> +
> + static CK_RV
> +@@ -1084,14 +1086,42 @@ sc_pkcs11_decrypt(sc_pkcs11_operation_t
> + {
> +       struct signature_data *data;
> +       struct sc_pkcs11_object *key;
> ++      CK_RV rv;
> ++      CK_ULONG ulDataLen, ulLastDataLen;
> ++
> ++      /* PKCS#11: If pBuf is not NULL_PTR, then *pulBufLen must contain the size in bytes.. */
> ++      if (pData && !pulDataLen)
> ++              return CKR_ARGUMENTS_BAD;
> ++
> ++      ulDataLen = pulDataLen ? *pulDataLen : 0;
> ++      ulLastDataLen = ulDataLen;
> +
> +       data = (struct signature_data*) operation->priv_data;
> +
> +       key = data->key;
> +-      return key->ops->decrypt(operation->session,
> +-                              key, &operation->mechanism,
> +-                              pEncryptedData, ulEncryptedDataLen,
> +-                              pData, pulDataLen);
> ++
> ++      /* Decrypt */
> ++      rv = key->ops->decrypt(operation->session, key, &operation->mechanism,
> ++                      pEncryptedData, ulEncryptedDataLen, pData, &ulDataLen);
> ++
> ++      if (pulDataLen)
> ++              *pulDataLen = ulDataLen;
> ++
> ++      if (rv != CKR_OK)
> ++              return rv;
> ++
> ++      /* recalculate buffer space */
> ++      if (ulDataLen <= ulLastDataLen)
> ++              ulLastDataLen -= ulDataLen;
> ++      else
> ++              ulLastDataLen = 0;
> ++
> ++      /* DecryptFinalize */
> ++      rv = key->ops->decrypt(operation->session, key, &operation->mechanism,
> ++                      NULL, 0, pData + ulDataLen, &ulLastDataLen);
> ++      if (pulDataLen)
> ++              *pulDataLen = ulDataLen + ulLastDataLen;
> ++      return rv;
> + }
> +
> + static CK_RV
> diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.patch
> new file mode 100644
> index 000000000..8450ed010
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.patch
> @@ -0,0 +1,357 @@
> +From b9e1d344df1f850a9b15bce6294f72c1620d0b45 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
> +Date: Mon, 13 Nov 2023 13:54:54 +0100
> +Subject: [PATCH] Reimplement removing of PKCS#1 v1.5 padding to be time
> + constant
> +
> +CVE: CVE-2023-5992
> +Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948/commits/b9e1d344df1f850a9b15bce6294f72c1620d0b45]
> +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> +Comment: Refreshed hunks to match latest kirkstone
> +---
> + src/common/Makefile.am      |   6 +-
> + src/common/constant-time.h  | 128 ++++++++++++++++++++++++++++++++++++
> + src/libopensc/internal.h    |   4 +-
> + src/libopensc/padding.c     | 102 +++++++++++++++++++---------
> + src/libopensc/pkcs15-sec.c  |   5 +-
> + src/minidriver/minidriver.c |   4 +-
> + 6 files changed, 210 insertions(+), 39 deletions(-)
> + create mode 100644 src/common/constant-time.h
> +
> +diff --git a/src/common/Makefile.am b/src/common/Makefile.am
> +index 5153428dce..9ecbffe8fd 100644
> +--- a/src/common/Makefile.am
> ++++ b/src/common/Makefile.am
> +@@ -8,7 +8,8 @@ dist_noinst_DATA = \
> +       LICENSE.compat_getopt compat_getopt.txt \
> +       compat_getopt_main.c \
> +       README.compat_strlcpy compat_strlcpy.3
> +-noinst_HEADERS = compat_strlcat.h compat_strlcpy.h compat_strnlen.h compat_getpass.h compat_getopt.h simclist.h libpkcs11.h libscdl.h
> ++noinst_HEADERS = compat_strlcat.h compat_strlcpy.h compat_strnlen.h compat_getpass.h \
> ++      compat_getopt.h simclist.h libpkcs11.h libscdl.h constant-time.h
> +
> + AM_CPPFLAGS = -I$(top_srcdir)/src
> +
> +@@ -40,7 +41,8 @@ TIDY_FILES = \
> +       compat_report_rangecheckfailure.c \
> +       compat___iob_func.c \
> +       simclist.c simclist.h \
> +-      libpkcs11.c libscdl.c
> ++      libpkcs11.c libscdl.c \
> ++      constant-time.h
> +
> + check-local:
> +       if [ -x "$(CLANGTIDY)" ]; then clang-tidy -config='' --checks='$(TIDY_CHECKS)' -header-filter=.* $(addprefix $(srcdir)/,$(TIDY_FILES)) -- $(TIDY_FLAGS); fi
> +diff --git a/src/common/constant-time.h b/src/common/constant-time.h
> +new file mode 100644
> +index 0000000000..40c3e500c2
> +--- /dev/null
> ++++ b/src/common/constant-time.h
> +@@ -0,0 +1,128 @@
> ++/* Original source: https://github.com/openssl/openssl/blob/9890cc42daff5e2d0cad01ac4bf78c391f599a6e/include/internal/constant_time.h */
> ++
> ++#ifndef CONSTANT_TIME_H
> ++#define CONSTANT_TIME_H
> ++
> ++#include <stdlib.h>
> ++#include <string.h>
> ++
> ++#if !defined(inline)
> ++#if defined(__STDC_VERSION__) && __STDC_VERSION__ >= 199901L
> ++#define constant_inline inline
> ++#elif defined(__GNUC__) && __GNUC__ >= 2
> ++#elif defined(__GNUC__) && __GNUC__ >= 2
> ++#elif defined(_MSC_VER)
> ++#define constant_inline __inline
> ++#else
> ++#define constant_inline
> ++#endif
> ++#else                        /* use what caller wants as inline  may be from config.h */
> ++#define constant_inline inline /* inline */
> ++#endif
> ++
> ++/*-
> ++ * The boolean methods return a bitmask of all ones (0xff...f) for true
> ++ * and 0 for false. For example,
> ++ *      if (a < b) {
> ++ *        c = a;
> ++ *      } else {
> ++ *        c = b;
> ++ *      }
> ++ * can be written as
> ++ *      unsigned int lt = constant_time_lt(a, b);
> ++ *      c = constant_time_select(lt, a, b);
> ++ */
> ++
> ++static constant_inline unsigned int
> ++value_barrier(unsigned int a)
> ++{
> ++      volatile unsigned int r = a;
> ++      return r;
> ++}
> ++
> ++static constant_inline size_t
> ++value_barrier_s(size_t a)
> ++{
> ++      volatile size_t r = a;
> ++      return r;
> ++}
> ++
> ++/* MSB */
> ++static constant_inline size_t
> ++constant_time_msb_s(size_t a)
> ++{
> ++      return 0 - (a >> (sizeof(a) * 8 - 1));
> ++}
> ++
> ++static constant_inline unsigned int
> ++constant_time_msb(unsigned int a)
> ++{
> ++      return 0 - (a >> (sizeof(a) * 8 - 1));
> ++}
> ++
> ++/* Select */
> ++static constant_inline unsigned int
> ++constant_time_select(unsigned int mask, unsigned int a, unsigned int b)
> ++{
> ++      return (value_barrier(mask) & a) | (value_barrier(~mask) & b);
> ++}
> ++
> ++static constant_inline unsigned char
> ++constant_time_select_8(unsigned char mask, unsigned char a, unsigned char b)
> ++{
> ++      return (unsigned char)constant_time_select(mask, a, b);
> ++}
> ++
> ++static constant_inline size_t
> ++constant_time_select_s(size_t mask, size_t a, size_t b)
> ++{
> ++      return (value_barrier_s(mask) & a) | (value_barrier_s(~mask) & b);
> ++}
> ++
> ++/* Zero */
> ++static constant_inline unsigned int
> ++constant_time_is_zero(unsigned int a)
> ++{
> ++      return constant_time_msb(~a & (a - 1));
> ++}
> ++
> ++static constant_inline size_t
> ++constant_time_is_zero_s(size_t a)
> ++{
> ++      return constant_time_msb_s(~a & (a - 1));
> ++}
> ++
> ++/* Comparison*/
> ++static constant_inline size_t
> ++constant_time_lt_s(size_t a, size_t b)
> ++{
> ++      return constant_time_msb_s(a ^ ((a ^ b) | ((a - b) ^ b)));
> ++}
> ++
> ++static constant_inline unsigned int
> ++constant_time_lt(unsigned int a, unsigned int b)
> ++{
> ++      return constant_time_msb(a ^ ((a ^ b) | ((a - b) ^ b)));
> ++}
> ++
> ++static constant_inline unsigned int
> ++constant_time_ge(unsigned int a, unsigned int b)
> ++{
> ++      return ~constant_time_lt(a, b);
> ++}
> ++
> ++/* Equality*/
> ++
> ++static constant_inline unsigned int
> ++constant_time_eq(unsigned int a, unsigned int b)
> ++{
> ++      return constant_time_is_zero(a ^ b);
> ++}
> ++
> ++static constant_inline size_t
> ++constant_time_eq_s(size_t a, size_t b)
> ++{
> ++      return constant_time_is_zero_s(a ^ b);
> ++}
> ++
> ++#endif /* CONSTANT_TIME_H */
> +diff --git a/src/libopensc/internal.h b/src/libopensc/internal.h
> +index 7531260c14..2a98f0e966 100644
> +--- a/src/libopensc/internal.h
> ++++ b/src/libopensc/internal.h
> +@@ -166,8 +166,8 @@ int _sc_card_add_xeddsa_alg(struct sc_ca
> +
> + int sc_pkcs1_strip_01_padding(struct sc_context *ctx, const u8 *in_dat, size_t in_len,
> +               u8 *out_dat, size_t *out_len);
> +-int sc_pkcs1_strip_02_padding(struct sc_context *ctx, const u8 *data, size_t len,
> +-              u8 *out_dat, size_t *out_len);
> ++int sc_pkcs1_strip_02_padding_constant_time(sc_context_t *ctx, unsigned int n, const u8 *data,
> ++              unsigned int data_len, u8 *out, unsigned int *out_len);
> + int sc_pkcs1_strip_digest_info_prefix(unsigned int *algorithm,
> +               const u8 *in_dat, size_t in_len, u8 *out_dat, size_t *out_len);
> +
> +diff --git a/src/libopensc/padding.c b/src/libopensc/padding.c
> +index ca47733a4e..ddb3061134 100644
> +--- a/src/libopensc/padding.c
> ++++ b/src/libopensc/padding.c
> +@@ -32,10 +32,13 @@
> + #include <string.h>
> + #include <stdlib.h>
> +
> ++#include "common/constant-time.h"
> + #include "internal.h"
> +
> + /* TODO doxygen comments */
> +
> ++#define SC_PKCS1_PADDING_MIN_SIZE 11
> ++
> + /*
> +  * Prefixes for pkcs-v1 signatures
> +  */
> +@@ -143,45 +146,82 @@ sc_pkcs1_strip_01_padding(struct sc_context *ctx, const u8 *in_dat, size_t in_le
> +       return SC_SUCCESS;
> + }
> +
> +-
> +-/* remove pkcs1 BT02 padding (adding BT02 padding is currently not
> +- * needed/implemented) */
> ++/* Remove pkcs1 BT02 padding (adding BT02 padding is currently not
> ++ * needed/implemented) in constant-time.
> ++ * Original source: https://github.com/openssl/openssl/blob/9890cc42daff5e2d0cad01ac4bf78c391f599a6e/crypto/rsa/rsa_pk1.c#L171 */
> + int
> +-sc_pkcs1_strip_02_padding(sc_context_t *ctx, const u8 *data, size_t len, u8 *out, size_t *out_len)
> ++sc_pkcs1_strip_02_padding_constant_time(sc_context_t *ctx, unsigned int n, const u8 *data, unsigned int data_len, u8 *out, unsigned int *out_len)
> + {
> +-      unsigned int    n = 0;
> +-
> ++      unsigned int i = 0;
> ++      u8 *msg, *msg_orig = NULL;
> ++      unsigned int good, found_zero_byte, mask;
> ++      unsigned int zero_index = 0, msg_index, mlen = -1, len = 0;
> +       LOG_FUNC_CALLED(ctx);
> +-      if (data == NULL || len < 3)
> ++
> ++      if (data == NULL || data_len <= 0 || data_len > n || n < SC_PKCS1_PADDING_MIN_SIZE)
> +               LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);
> +
> +-      /* skip leading zero byte */
> +-      if (*data == 0) {
> +-              data++;
> +-              len--;
> ++      msg = msg_orig = calloc(n, sizeof(u8));
> ++      if (msg == NULL)
> ++              LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);
> ++
> ++      /*
> ++       * We can not check length of input data straight away and still we need to read
> ++       * from input even when the input is not as long as needed to keep the time constant.
> ++       * If data has wrong size, it is padded by zeroes from left and the following checks
> ++       * do not pass.
> ++       */
> ++      len = data_len;
> ++      for (data += len, msg += n, i = 0; i < n; i++) {
> ++              mask = ~constant_time_is_zero(len);
> ++              len -= 1 & mask;
> ++              data -= 1 & mask;
> ++              *--msg = *data & mask;
> ++      }
> ++      // check first byte to be 0x00
> ++      good = constant_time_is_zero(msg[0]);
> ++      // check second byte to be 0x02
> ++      good &= constant_time_eq(msg[1], 2);
> ++
> ++      // find zero byte after random data in padding
> ++      found_zero_byte = 0;
> ++      for (i = 2; i < n; i++) {
> ++              unsigned int equals0 = constant_time_is_zero(msg[i]);
> ++              zero_index = constant_time_select(~found_zero_byte & equals0, i, zero_index);
> ++              found_zero_byte |= equals0;
> +       }
> +-      if (data[0] != 0x02)
> +-              LOG_FUNC_RETURN(ctx, SC_ERROR_WRONG_PADDING);
> +-      /* skip over padding bytes */
> +-      for (n = 1; n < len && data[n]; n++)
> +-              ;
> +-      /* Must be at least 8 pad bytes */
> +-      if (n >= len || n < 9)
> +-              LOG_FUNC_RETURN(ctx, SC_ERROR_WRONG_PADDING);
> +-      n++;
> +-      if (out == NULL)
> +-              /* just check the padding */
> +-              LOG_FUNC_RETURN(ctx, SC_SUCCESS);
> +
> +-      /* Now move decrypted contents to head of buffer */
> +-      if (*out_len < len - n)
> +-              LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);
> +-      *out_len = len - n;
> +-      memmove(out, data + n, *out_len);
> ++      // zero_index stands for index of last found zero
> ++      good &= constant_time_ge(zero_index, 2 + 8);
> ++
> ++      // start of the actual message in data
> ++      msg_index = zero_index + 1;
> ++
> ++      // length of message
> ++      mlen = data_len - msg_index;
> ++
> ++      // check that message fits into out buffer
> ++      good &= constant_time_ge(*out_len, mlen);
> ++
> ++      // move the result in-place by |num|-SC_PKCS1_PADDING_MIN_SIZE-|mlen| bytes to the left.
> ++      *out_len = constant_time_select(constant_time_lt(n - SC_PKCS1_PADDING_MIN_SIZE, *out_len),
> ++                      n - SC_PKCS1_PADDING_MIN_SIZE, *out_len);
> ++      for (msg_index = 1; msg_index < n - SC_PKCS1_PADDING_MIN_SIZE; msg_index <<= 1) {
> ++              mask = ~constant_time_eq(msg_index & (n - SC_PKCS1_PADDING_MIN_SIZE - mlen), 0);
> ++              for (i = SC_PKCS1_PADDING_MIN_SIZE; i < n - msg_index; i++)
> ++                      msg[i] = constant_time_select_8(mask, msg[i + msg_index], msg[i]);
> ++      }
> ++      // move message into out buffer, if good
> ++      for (i = 0; i < *out_len; i++) {
> ++              unsigned int msg_index;
> ++              // when out is longer than message in data, use some bogus index in msg
> ++              mask = good & constant_time_lt(i, mlen);
> ++              msg_index = constant_time_select(mask, i + SC_PKCS1_PADDING_MIN_SIZE, 0); // to now overflow msg buffer
> ++              out[i] = constant_time_select_8(mask, msg[msg_index], out[i]);
> ++      }
> +
> +-      sc_log(ctx, "stripped output(%"SC_FORMAT_LEN_SIZE_T"u): %s", len - n,
> +-             sc_dump_hex(out, len - n));
> +-      LOG_FUNC_RETURN(ctx, len - n);
> ++      free(msg_orig);
> ++      return constant_time_select(good, mlen, SC_ERROR_WRONG_PADDING);
> + }
> +
> + /* add/remove DigestInfo prefix */
> +diff --git a/src/libopensc/pkcs15-sec.c b/src/libopensc/pkcs15-sec.c
> +index 2ac6ca7ddf..a019af460f 100644
> +--- a/src/libopensc/pkcs15-sec.c
> ++++ b/src/libopensc/pkcs15-sec.c
> +@@ -308,8 +308,9 @@ int sc_pkcs15_decipher(struct sc_pkcs15_
> +
> +       /* Strip any padding */
> +       if (pad_flags & SC_ALGORITHM_RSA_PAD_PKCS1) {
> +-              size_t s = r;
> +-              r = sc_pkcs1_strip_02_padding(ctx, out, s, out, &s);
> ++              int s = r;
> ++              int key_size = alg_info->key_length;
> ++              r = sc_pkcs1_strip_02_padding_constant_time(ctx, key_size / 8, out, s, out, &s);
> +               LOG_TEST_RET(ctx, r, "Invalid PKCS#1 padding");
> +       }
> +
> +diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.c
> +index 3391994abe..5248d9758a 100644
> +--- a/src/minidriver/minidriver.c
> ++++ b/src/minidriver/minidriver.c
> +@@ -4582,9 +4582,9 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
> +                                         "sc_pkcs15_decipher: DECRYPT-INFO dwVersion=%lu\n",
> +                                         (unsigned long)pInfo->dwVersion);
> +                               if (pInfo->dwPaddingType == CARD_PADDING_PKCS1)   {
> +-                                      size_t temp = pInfo->cbData;
> ++                                      unsigned int temp = pInfo->cbData;
> +                                       logprintf(pCardData, 2, "sc_pkcs15_decipher: stripping PKCS1 padding\n");
> +-                                      r = sc_pkcs1_strip_02_padding(vs->ctx, pbuf2, pInfo->cbData, pbuf2, &temp);
> ++                                      r = sc_pkcs1_strip_02_padding_constant_time(vs->ctx, prkey_info->modulus_length / 8, pbuf2, pInfo->cbData, pbuf2, &temp);
> +                                       pInfo->cbData = (DWORD) temp;
> +                                       if (r < 0)   {
> +                                               logprintf(pCardData, 2, "Cannot strip PKCS1 padding: %i\n", r);
> diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.patch
> new file mode 100644
> index 000000000..1d8bc1259
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.patch
> @@ -0,0 +1,39 @@
> +From 1a6a18c51a1d6239850b61d19aed6424afd4912f Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
> +Date: Thu, 16 Nov 2023 10:38:12 +0100
> +Subject: [PATCH] pkcs15-sec: Remove logging after PKCS#1 v1.5 depadding
> +
> +To prevent Marvin attack on RSA PKCS#1 v1.5 padding
> +when logging the return value, signaling the padding error.
> +
> +CVE: CVE-2023-5992
> +Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948/commits/1a6a18c51a1d6239850b61d19aed6424afd4912f]
> +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> +Comment: Refreshed hunk to match latest kirkstone
> +---
> + src/libopensc/pkcs15-sec.c | 9 +++++----
> + 1 file changed, 5 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/libopensc/pkcs15-sec.c b/src/libopensc/pkcs15-sec.c
> +index a019af460f..f7ee819d65 100644
> +--- a/src/libopensc/pkcs15-sec.c
> ++++ b/src/libopensc/pkcs15-sec.c
> +@@ -308,13 +308,14 @@ int sc_pkcs15_decipher(struct sc_pkcs15_
> +
> +       /* Strip any padding */
> +       if (pad_flags & SC_ALGORITHM_RSA_PAD_PKCS1) {
> +-              int s = r;
> +-              int key_size = alg_info->key_length;
> ++              unsigned int s = r;
> ++              unsigned int key_size = (unsigned int)alg_info->key_length;
> +               r = sc_pkcs1_strip_02_padding_constant_time(ctx, key_size / 8, out, s, out, &s);
> +-              LOG_TEST_RET(ctx, r, "Invalid PKCS#1 padding");
> ++              /* for keeping PKCS#1 v1.5 depadding constant-time, do not log error here */
> +       }
> +
> +-      LOG_FUNC_RETURN(ctx, r);
> ++      /* do not log error code to prevent side channel attack */
> ++      return r;
> + }
> +
> + /* derive one key from another. RSA can use decipher, so this is for only ECDH
> diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.patch
> new file mode 100644
> index 000000000..d3846e5da
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.patch
> @@ -0,0 +1,105 @@
> +From a8ac5930ab8f2da5cb93793d05389761c342f995 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
> +Date: Thu, 16 Nov 2023 15:49:15 +0100
> +Subject: [PATCH] framework-pkcs15.c: Handle PKCS#1 v1.5 depadding
> + constant-time
> +
> +In order to not disclose time side-channel when the depadding
> +fails, do the same operations as for case when depadding ends
> +with success.
> +
> +CVE: CVE-2023-5992
> +Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948/commits/a8ac5930ab8f2da5cb93793d05389761c342f995]
> +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> +Comment: Refreshed hunks to match latest kirkstone
> +---
> + src/pkcs11/framework-pkcs15.c | 54 ++++++++++++++++++++++++++---------
> + 1 file changed, 41 insertions(+), 13 deletions(-)
> +
> +diff --git a/src/pkcs11/framework-pkcs15.c b/src/pkcs11/framework-pkcs15.c
> +index f75a3dbaec..632681df63 100644
> +--- a/src/pkcs11/framework-pkcs15.c
> ++++ b/src/pkcs11/framework-pkcs15.c
> +@@ -18,6 +18,7 @@
> +  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
> +  */
> +
> ++#include "common/constant-time.h"
> + #include "config.h"
> + #include <stdlib.h>
> + #include <string.h>
> +@@ -4341,7 +4342,8 @@
> +       struct pkcs15_fw_data *fw_data = NULL;
> +       struct pkcs15_prkey_object *prkey;
> +       unsigned char decrypted[512]; /* FIXME: Will not work for keys above 4096 bits */
> +-      int     buff_too_small, rv, flags = 0, prkey_has_path = 0;
> ++      int rv, flags = 0, prkey_has_path = 0;
> ++      CK_ULONG mask, good, rv_pkcs11;
> +
> +       sc_log(context, "Initiating decryption.");
> +
> +@@ -4415,27 +4417,53 @@
> +       rv = sc_pkcs15_decipher(fw_data->p15_card, prkey->prv_p15obj, flags,
> +                       pEncryptedData, ulEncryptedDataLen, decrypted, sizeof(decrypted));
> +
> +-      if (rv < 0 && !sc_pkcs11_conf.lock_login && !prkey_has_path)
> ++      /* skip for PKCS#1 v1.5 padding prevent side channel attack */
> ++      if (!(flags & SC_ALGORITHM_RSA_PAD_PKCS1) &&
> ++                      rv < 0 && !sc_pkcs11_conf.lock_login && !prkey_has_path)
> +               if (reselect_app_df(fw_data->p15_card) == SC_SUCCESS)
> +                       rv = sc_pkcs15_decipher(fw_data->p15_card, prkey->prv_p15obj, flags,
> +                                       pEncryptedData, ulEncryptedDataLen, decrypted, sizeof(decrypted));
> +
> +       sc_unlock(p11card->card);
> +
> +-      sc_log(context, "Decryption complete. Result %d.", rv);
> ++      sc_log(context, "Decryption complete.");
> +
> +-      if (rv < 0)
> +-              return sc_to_cryptoki_error(rv, "C_Decrypt");
> ++      /* Handle following code in constant-time
> ++       * to prevent Marvin attack for PKCS#1 v1.5 padding. */
> +
> +-      buff_too_small = (*pulDataLen < (CK_ULONG)rv);
> +-      *pulDataLen = rv;
> +-      if (pData == NULL_PTR)
> +-              return CKR_OK;
> +-      if (buff_too_small)
> +-              return CKR_BUFFER_TOO_SMALL;
> +-      memcpy(pData, decrypted, *pulDataLen);
> ++      /* only padding error must be handled in constant-time way,
> ++       * other error can be returned straight away */
> ++      if ((~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING) & constant_time_lt_s(sizeof(decrypted), rv)))
> ++              return sc_to_cryptoki_error(rv, "C_Decrypt");
> +
> +-      return CKR_OK;
> ++      /* check rv for padding error */
> ++      good = ~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING);
> ++      rv_pkcs11 = sc_to_cryptoki_error(SC_ERROR_WRONG_PADDING, "C_Decrypt");
> ++      rv_pkcs11 = constant_time_select_s(good, CKR_OK, rv_pkcs11);
> ++
> ++      if (pData == NULL_PTR) {
> ++              /* set length only if no error */
> ++              *pulDataLen = constant_time_select_s(good, rv, *pulDataLen);
> ++              /* return error only if original rv < 0 */
> ++              return rv_pkcs11;
> ++      }
> ++
> ++      /* check whether *pulDataLen < rv and set return value for small output buffer */
> ++      mask = good & constant_time_lt_s(*pulDataLen, rv);
> ++      rv_pkcs11 = constant_time_select_s(mask, CKR_BUFFER_TOO_SMALL, rv_pkcs11);
> ++      good &= ~mask;
> ++
> ++      /* move everything from decrypted into out buffer constant-time, if rv is ok */
> ++      for (CK_ULONG i = 0; i < *pulDataLen; i++) { /* iterate over whole pData to not disclose real depadded length */
> ++              CK_ULONG msg_index;
> ++              mask = good & constant_time_lt_s(i, sizeof(decrypted));             /* i should be in the bounds of decrypted */
> ++              mask &= constant_time_lt_s(i, constant_time_select_s(good, rv, 0)); /* check that is in bounds of depadded message */
> ++              msg_index = constant_time_select_s(mask, i, 0);
> ++              pData[i] = constant_time_select_8(mask, decrypted[msg_index], pData[i]);
> ++      }
> ++      *pulDataLen = constant_time_select_s(good, rv, *pulDataLen);
> ++      /* do not log error code to prevent side channel attack */
> ++      return rv_pkcs11;
> + }
> +
> diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.patch
> new file mode 100644
> index 000000000..e113df7c4
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.patch
> @@ -0,0 +1,47 @@
> +From 32cdab44f6b1e6343f029879a8ab32de4f32743f Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
> +Date: Mon, 8 Jan 2024 14:59:22 +0100
> +Subject: [PATCH] mechanism: Handle PKCS#1 v1.5 depadding constant-time
> +
> +CVE: CVE-2023-5992
> +Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948/commits/32cdab44f6b1e6343f029879a8ab32de4f32743f]
> +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> +Comment: 1 hunk removed and refreshed hunks to match latest kirkstone
> +---
> + src/pkcs11/mechanism.c | 19 ++++++++++++++-----
> + 1 file changed, 14 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/pkcs11/mechanism.c b/src/pkcs11/mechanism.c
> +index 03495265a4..d3f0434231 100644
> +--- a/src/pkcs11/mechanism.c
> ++++ b/src/pkcs11/mechanism.c
> +@@ -23,6 +23,7 @@
> + #include <stdlib.h>
> + #include <string.h>
> +
> ++#include "common/constant-time.h"
> + #include "sc-pkcs11.h"
> +
> + /* Also used for verification data */
> +@@ -844,7 +845,9 @@ sc_pkcs11_decr(struct sc_pkcs11_session
> +       rv = op->type->decrypt(op, pEncryptedData, ulEncryptedDataLen,
> +                              pData, pulDataLen);
> +
> +-      if (rv != CKR_BUFFER_TOO_SMALL && pData != NULL)
> ++      /* terminate session for any return value except CKR_BUFFER_TOO_SMALL,
> ++       * perform check in time side-channel free way to prevent Marvin attack */
> ++      if (!constant_time_eq_s(rv, CKR_BUFFER_TOO_SMALL) && pData != NULL)
> +               session_stop_operation(session, SC_PKCS11_OPERATION_DECRYPT);
> +
> +       return rv;
> +@@ -1107,6 +1107,10 @@ sc_pkcs11_decrypt(sc_pkcs11_operation_t
> +       if (pulDataLen)
> +               *pulDataLen = ulDataLen;
> +
> ++      /* Skip DecryptFinalize for PKCS#1 v1.5 padding to prevent time side-channel leakage */
> ++      if (((CK_MECHANISM_PTR)&operation->mechanism)->mechanism == CKM_RSA_PKCS)
> ++              return rv;
> ++
> +       if (rv != CKR_OK)
> +               return rv;
> +
> diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.patch
> new file mode 100644
> index 000000000..7bb862194
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.patch
> @@ -0,0 +1,115 @@
> +From 1fe1a78610b00b9db83a03396762c72c1371bd02 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
> +Date: Wed, 22 Nov 2023 15:02:57 +0100
> +Subject: [PATCH] minidriver: Make CardRSADecrypt constant-time
> +
> +CVE: CVE-2023-5992
> +Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948/commits/1fe1a78610b00b9db83a03396762c72c1371bd02]
> +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> +Comment: Refreshed hunks to match latest kirkstone
> +---
> + src/minidriver/minidriver.c | 37 +++++++++++++++++++++++--------------
> + 1 file changed, 23 insertions(+), 14 deletions(-)
> +
> +diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.c
> +index 5248d9758a..b99b6cff89 100644
> +--- a/src/minidriver/minidriver.c
> ++++ b/src/minidriver/minidriver.c
> +@@ -41,6 +41,7 @@
> + #include "cardmod.h"
> +
> + #include "common/compat_strlcpy.h"
> ++#include "common/constant-time.h"
> + #include "libopensc/asn1.h"
> + #include "libopensc/cardctl.h"
> + #include "libopensc/opensc.h"
> +@@ -4463,13 +4464,15 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
> +
> + {
> +       DWORD dwret;
> +-      int r, opt_crypt_flags = 0;
> ++      int r, opt_crypt_flags = 0, good = 0;
> +       unsigned ui;
> +       VENDOR_SPECIFIC *vs;
> +       struct sc_pkcs15_prkey_info *prkey_info;
> +       BYTE *pbuf = NULL, *pbuf2 = NULL;
> +       struct sc_pkcs15_object *pkey = NULL;
> +       struct sc_algorithm_info *alg_info = NULL;
> ++      unsigned int wrong_padding = 0;
> ++      unsigned int pbufLen = 0;
> +
> +       MD_FUNC_CALLED(pCardData, 1);
> +
> +@@ -4570,11 +4573,11 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
> +               goto err;
> +       }
> +
> ++      pbufLen = pInfo->cbData;
> +       if (alg_info->flags & SC_ALGORITHM_RSA_RAW)   {
> +               logprintf(pCardData, 2, "sc_pkcs15_decipher: using RSA-RAW mechanism\n");
> +               r = sc_pkcs15_decipher(vs->p15card, pkey, opt_crypt_flags, pbuf, pInfo->cbData, pbuf2, pInfo->cbData);
> +-              logprintf(pCardData, 2, "sc_pkcs15_decipher returned %d\n", r);
> +-
> ++              /* do not log return value to not leak it */
> +               if (r > 0) {
> +                       /* Need to handle padding */
> +                       if (pInfo->dwVersion >= CARD_RSA_KEY_DECRYPT_INFO_VERSION_TWO) {
> +@@ -4586,13 +4589,9 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
> +                                       logprintf(pCardData, 2, "sc_pkcs15_decipher: stripping PKCS1 padding\n");
> +                                       r = sc_pkcs1_strip_02_padding_constant_time(vs->ctx, prkey_info->modulus_length / 8, pbuf2, pInfo->cbData, pbuf2, &temp);
> +                                       pInfo->cbData = (DWORD) temp;
> +-                                      if (r < 0)   {
> +-                                              logprintf(pCardData, 2, "Cannot strip PKCS1 padding: %i\n", r);
> +-                                              pCardData->pfnCspFree(pbuf);
> +-                                              pCardData->pfnCspFree(pbuf2);
> +-                                              dwret = SCARD_F_INTERNAL_ERROR;
> +-                                              goto err;
> +-                                      }
> ++                                      wrong_padding = constant_time_eq_s(r, SC_ERROR_WRONG_PADDING);
> ++                                      /* continue without returning error to not leak that padding is wrong
> ++                                         to prevent time side-channel leak for Marvin attack*/
> +                               }
> +                               else if (pInfo->dwPaddingType == CARD_PADDING_OAEP)   {
> +                                       /* TODO: Handle OAEP padding if present - can call PFN_CSP_UNPAD_DATA */
> +@@ -4640,28 +4639,38 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
> +               goto err;
> +       }
> +
> +-      if ( r < 0)   {
> ++      good = constant_time_eq_s(r, 0);
> ++      /* if no error or padding error, do not return here to prevent Marvin attack */
> ++      if (!(good | wrong_padding) && r < 0)   {
> +               logprintf(pCardData, 2, "sc_pkcs15_decipher error(%i): %s\n", r, sc_strerror(r));
> +               pCardData->pfnCspFree(pbuf);
> +               pCardData->pfnCspFree(pbuf2);
> +               dwret = md_translate_OpenSC_to_Windows_error(r, SCARD_E_INVALID_VALUE);
> +               goto err;
> +       }
> ++      dwret = constant_time_select_s(good, SCARD_S_SUCCESS, SCARD_F_INTERNAL_ERROR);
> +
> +       logprintf(pCardData, 2, "decrypted data(%lu):\n",
> +                 (unsigned long)pInfo->cbData);
> +       loghex(pCardData, 7, pbuf2, pInfo->cbData);
> +
> +       /*inversion donnees */
> +-      for(ui = 0; ui < pInfo->cbData; ui++)
> +-              pInfo->pbData[ui] = pbuf2[pInfo->cbData-ui-1];
> ++      /* copy data in constant-time way to prevent leak */
> ++      for (ui = 0; ui < pbufLen; ui++) {
> ++              unsigned int mask, msg_index, inv_ui;
> ++              mask = good & constant_time_lt_s(ui, pInfo->cbData); /* ui should be in the bounds of pbuf2 */
> ++              inv_ui = pInfo->cbData - ui - 1;
> ++              msg_index = constant_time_select_s(mask, inv_ui, 0);
> ++              pInfo->pbData[ui] = constant_time_select_8(mask, pbuf2[msg_index], pInfo->pbData[ui]);
> ++      }
> +
> +       pCardData->pfnCspFree(pbuf);
> +       pCardData->pfnCspFree(pbuf2);
> +
> + err:
> +       unlock(pCardData);
> +-      MD_FUNC_RETURN(pCardData, 1, dwret);
> ++      /* do not log return value to not leak it */
> ++      return dwret;
> + }
> +
> diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.patch
> new file mode 100644
> index 000000000..5deeacc25
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.patch
> @@ -0,0 +1,47 @@
> +From 306dc92bd4d2d74203f53cf3d9ea68c223115375 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
> +Date: Fri, 24 Nov 2023 20:59:07 +0100
> +Subject: [PATCH] pkcs11-object: Remove return value logging
> +
> +To prevent Marvin attack on RSA PKCS#1 v1.5 padding
> +when logging the return value, signaling the padding error.
> +
> +CVE: CVE-2023-5992
> +Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948/commits/306dc92bd4d2d74203f53cf3d9ea68c223115375]
> +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> +Comment: Two hunks removed from pkcs11-object.c and refreshed sc-pkcs11.h
> +---
> + src/pkcs11/pkcs11-object.c | 9 ++++++---
> + src/pkcs11/sc-pkcs11.h     | 5 +++++
> + 2 files changed, 11 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/pkcs11/pkcs11-object.c b/src/pkcs11/pkcs11-object.c
> +index f04c0b4c56..b023911213 100644
> +--- a/src/pkcs11/pkcs11-object.c
> ++++ b/src/pkcs11/pkcs11-object.c
> +@@ -930,7 +930,8 @@ CK_RV C_Decrypt(CK_SESSION_HANDLE hSessi
> +               rv = reset_login_state(session->slot, rv);
> +       }
> +
> +-      sc_log(context, "C_Decrypt() = %s", lookup_enum ( RV_T, rv ));
> ++      /* do not log error code to prevent side channel attack */
> ++      SC_LOG("C_Decrypt()");
> +       sc_pkcs11_unlock();
> +       return rv;
> + }
> +diff --git a/src/pkcs11/sc-pkcs11.h b/src/pkcs11/sc-pkcs11.h
> +index 66dfcdde67..510017ed2a 100644
> +--- a/src/pkcs11/sc-pkcs11.h
> ++++ b/src/pkcs11/sc-pkcs11.h
> +@@ -226,6 +226,11 @@
> + };
> + typedef struct sc_pkcs11_slot sc_pkcs11_slot_t;
> +
> ++#define SC_LOG(fmt) \
> ++      do { \
> ++              sc_log(context, (fmt)); \
> ++      } while (0)
> ++
> + /* Debug virtual slots. S is slot to be highlighted or NULL
> +  * C is a comment format string and args It will be preceded by "VSS " */
> + #define DEBUG_VSS(S, ...) do { sc_log(context,"VSS " __VA_ARGS__); _debug_virtual_slots(S); } while (0)
> diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.patch
> new file mode 100644
> index 000000000..7b41abc0e
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.patch
> @@ -0,0 +1,33 @@
> +From aa6bf2b65fe432e8f234a132268b79ea54d5d74b Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
> +Date: Fri, 24 Nov 2023 21:00:23 +0100
> +Subject: [PATCH] misc: Compare return value constant-time
> +
> +CVE: CVE-2023-5992
> +Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2948/commits/aa6bf2b65fe432e8f234a132268b79ea54d5d74b]
> +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> +---
> + src/pkcs11/misc.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/pkcs11/misc.c b/src/pkcs11/misc.c
> +index 5ca1176b1d..1d893d6181 100644
> +--- a/src/pkcs11/misc.c
> ++++ b/src/pkcs11/misc.c
> +@@ -23,6 +23,7 @@
> + #include <stdlib.h>
> + #include <string.h>
> +
> ++#include "common/constant-time.h"
> + #include "sc-pkcs11.h"
> +
> + #define DUMP_TEMPLATE_MAX     32
> +@@ -174,7 +175,7 @@ CK_RV reset_login_state(struct sc_pkcs11_slot *slot, CK_RV rv)
> +                       slot->p11card->framework->logout(slot);
> +               }
> +
> +-              if (rv == CKR_USER_NOT_LOGGED_IN) {
> ++              if (constant_time_eq_s(rv, CKR_USER_NOT_LOGGED_IN)) {
> +                       slot->login_user = -1;
> +                       pop_all_login_states(slot);
> +               }
> diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.patch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.patch
> new file mode 100644
> index 000000000..3ad681ecb
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.patch
> @@ -0,0 +1,71 @@
> +From fd80ba7c00bb87f52a63f628509955ccee5b09e4 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
> +Date: Mon, 5 Feb 2024 13:33:05 +0100
> +Subject: [PATCH] Fix constant-time comparison of negative values
> +
> +Thanks Coverity CID 414687
> +
> +CVE: CVE-2023-5992
> +Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/3016/commits/fd80ba7c00bb87f52a63f628509955ccee5b09e4]
> +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> +---
> + src/common/constant-time.h    | 6 ++++++
> + src/minidriver/minidriver.c   | 4 ++--
> + src/pkcs11/framework-pkcs15.c | 4 ++--
> + 3 files changed, 10 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/common/constant-time.h b/src/common/constant-time.h
> +index 40c3e500c2..3f4446d4d8 100644
> +--- a/src/common/constant-time.h
> ++++ b/src/common/constant-time.h
> +@@ -125,4 +125,10 @@ constant_time_eq_s(size_t a, size_t b)
> +       return constant_time_is_zero_s(a ^ b);
> + }
> +
> ++static constant_inline unsigned int
> ++constant_time_eq_i(int a, int b)
> ++{
> ++      return constant_time_eq((unsigned int)a, (unsigned int)b);
> ++}
> ++
> + #endif /* CONSTANT_TIME_H */
> +diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.c
> +index a3c738966b..d146b42549 100644
> +--- a/src/minidriver/minidriver.c
> ++++ b/src/minidriver/minidriver.c
> +@@ -4660,7 +4660,7 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA pCardData,
> +                                       logprintf(pCardData, 2, "sc_pkcs15_decipher: stripping PKCS1 padding\n");
> +                                       r = sc_pkcs1_strip_02_padding_constant_time(vs->ctx, prkey_info->modulus_length / 8, pbuf2, pInfo->cbData, pbuf2, &temp);
> +                                       pInfo->cbData = (DWORD) temp;
> +-                                      wrong_padding = constant_time_eq_s(r, SC_ERROR_WRONG_PADDING);
> ++                                      wrong_padding = constant_time_eq_i(r, SC_ERROR_WRONG_PADDING);
> +                                       /* continue without returning error to not leak that padding is wrong
> +                                          to prevent time side-channel leak for Marvin attack*/
> +                               }
> +@@ -4710,7 +4710,7 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA pCardData,
> +               goto err;
> +       }
> +
> +-      good = constant_time_eq_s(r, 0);
> ++      good = constant_time_eq_i(r, 0);
> +       /* if no error or padding error, do not return here to prevent Marvin attack */
> +       if (!(good | wrong_padding) && r < 0)   {
> +               logprintf(pCardData, 2, "sc_pkcs15_decipher error(%i): %s\n", r, sc_strerror(r));
> +diff --git a/src/pkcs11/framework-pkcs15.c b/src/pkcs11/framework-pkcs15.c
> +index cb4df7a64f..11cfc51273 100644
> +--- a/src/pkcs11/framework-pkcs15.c
> ++++ b/src/pkcs11/framework-pkcs15.c
> +@@ -4627,11 +4627,11 @@ pkcs15_prkey_decrypt(struct sc_pkcs11_session *session, void *obj,
> +
> +       /* only padding error must be handled in constant-time way,
> +        * other error can be returned straight away */
> +-      if ((~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING) & constant_time_lt_s(sizeof(decrypted), rv)))
> ++      if ((~constant_time_eq_i(rv, SC_ERROR_WRONG_PADDING) & constant_time_lt_s(sizeof(decrypted), (size_t)rv)))
> +               return sc_to_cryptoki_error(rv, "C_Decrypt");
> +
> +       /* check rv for padding error */
> +-      good = ~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING);
> ++      good = ~constant_time_eq_i(rv, SC_ERROR_WRONG_PADDING);
> +       rv_pkcs11 = sc_to_cryptoki_error(SC_ERROR_WRONG_PADDING, "C_Decrypt");
> +       rv_pkcs11 = constant_time_select_s(good, CKR_OK, rv_pkcs11);
> +
> diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
> index 770c2d686..16b3ec292 100644
> --- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
> +++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
> @@ -23,6 +23,15 @@ SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
>              file://CVE-2023-40661-5.patch \
>              file://CVE-2023-40661-6.patch \
>              file://CVE-2023-40661-7.patch \
> +           file://CVE-2023-5992-1.patch \
> +           file://CVE-2023-5992-2.patch \
> +           file://CVE-2023-5992-3.patch \
> +           file://0001-Preparing-to-implement-the-C_DecryptFinalize-and-C_D.patch \
> +           file://CVE-2023-5992-4.patch \
> +           file://CVE-2023-5992-5.patch \
> +           file://CVE-2023-5992-6.patch \
> +           file://CVE-2023-5992-7.patch \
> +           file://CVE-2023-5992-8.patch \
>             "
>
>   # CVE-2021-34193 is a duplicate CVE covering the 5 individual
> --
> 2.25.1
>
> This message contains information that may be privileged or confidential and is the property of the KPIT Technologies Ltd. It is intended only for the person to whom it is addressed. If you are not the intended recipient, you are not authorized to read, print, retain copy, disseminate, distribute, or use this message or any part thereof. If you receive this message in error, please notify the sender immediately and delete all copies of this message. KPIT Technologies Ltd. does not accept any liability for virus infected mails.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111517): https://lists.openembedded.org/g/openembedded-devel/message/111517
> Mute This Topic: https://lists.openembedded.org/mt/107747046/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


