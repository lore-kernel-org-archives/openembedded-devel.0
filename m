Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.2313.1584989153295430194
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2020 11:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eVml1GrG;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id d11so16497242qko.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2020 11:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Xa529//rUFM1Bwgkj/PuD7OoOOTcqrJ/BKmqgUKIoo=;
        b=eVml1GrG6P2kUu4N1kczcaGnhsNW/aMDscaG89UOee+/T7OsXH82S2ZH+MN/zznq2L
         Jive5oVTQ4f4bmOi1Ic3QI0xhhAAECrBGeeBIJb2UjOn0XqJH8RbIha7osTMsrbCqrex
         Yy/VC+IH99+qd5Dr/y4S30Asnqm9pIVwBqpiqRRmzuMRv38B1p+8bueowNFj0qnDFPq5
         c3Va6ebwLfmqLEbEENK3mcQEB6O3Pu27Hc/wZVQjkSgKT6wBf6XJPVO6SkRoyn1wGodA
         8D5ataxzuSK2O1kLTh9vF9pgM3WbIe3TCF/s0YjEl1S+aeg44XLQldorryJD23Jpv/yb
         jFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Xa529//rUFM1Bwgkj/PuD7OoOOTcqrJ/BKmqgUKIoo=;
        b=AAyvcNXxqhHq1zIyJyoWyKba47BnRXbOblv+N1VK/orqIlBnOP8VNuRJEJtVVmrES7
         8+CY/Vd44fsX9zI12/LDqicjGT7BADxwccKv74PaIZ3iULuVE5JxCbWwLAIGdyt2pIa5
         lqoq5ger4DwWzh/ZKCE1yYf2+1G9wnthk+kMzZNVutD9ur5ldJ2kAht+DpFN9/C0pgx9
         lRqK9GzTPI+wsyYfDn+Tx1nSux7Fkh7ASmD8KNDveMcrtH10LantEfJWTPnCeFrDC53h
         gKbZvoaidislOsZk4q5bmeK65ewEYNTLUf/vc4I2k2FVCiHeIzCEauWWazX1k6OqCKvz
         U2kA==
X-Gm-Message-State: ANhLgQ3pxfpw9V1bEYYBlod7Etjwukz5/BX7wCq12QMcjUKoRPhBnwcR
	TMTakR1K4OozAXcLs8JfcSdOcOwNghZEMOy3IEA=
X-Google-Smtp-Source: ADFU+vuBRMrt1K16fVWAjg4GQy7h8pV2Ixlexf4YRhMmbYQEiYP9Adbb8csfzhOeb77WeXISLhg940O2jIEF7Wb54NQ=
X-Received: by 2002:a37:8d81:: with SMTP id p123mr9839989qkd.17.1584989152084;
 Mon, 23 Mar 2020 11:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200323183811.67969-1-joe.slater@windriver.com>
In-Reply-To: <20200323183811.67969-1-joe.slater@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 23 Mar 2020 11:45:25 -0700
Message-ID: <CAMKF1srDUmD+0U=jVy=QPsMAUgKeDGzuEjmB5E9m37wT8ktDuA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] nss: suppress unused-function compile error
To: Joe Slater <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"

Perhaps its best to just use something like --disable-werror

On Mon, Mar 23, 2020 at 11:38 AM Joe Slater <joe.slater@windriver.com> wrote:
>
> Allows qemumips64 nss to compile.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../nss/nss/no_unused_function_error.patch             | 18 ++++++++++++++++++
>  meta-oe/recipes-support/nss/nss_3.51.bb                |  1 +
>  2 files changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-support/nss/nss/no_unused_function_error.patch
>
> diff --git a/meta-oe/recipes-support/nss/nss/no_unused_function_error.patch b/meta-oe/recipes-support/nss/nss/no_unused_function_error.patch
> new file mode 100644
> index 0000000..cce748f
> --- /dev/null
> +++ b/meta-oe/recipes-support/nss/nss/no_unused_function_error.patch
> @@ -0,0 +1,18 @@
> +nss: suppress unused-function compile error
> +
> +Upstream-Status: Inappropriate [workaround]
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +
> +--- a/nss/coreconf/Werror.mk
> ++++ b/nss/coreconf/Werror.mk
> +@@ -96,7 +96,7 @@ ifndef WARNING_CFLAGS
> +     endif #ndef NSS_ENABLE_WERROR
> +
> +     ifeq ($(NSS_ENABLE_WERROR),1)
> +-      WARNING_CFLAGS += -Werror
> ++      WARNING_CFLAGS += -Werror -Wno-error=unused-function
> +     else
> +       # Old versions of gcc (< 4.8) don't support #pragma diagnostic in functions.
> +       # Use this to disable use of that #pragma and the warnings it suppresses.
> diff --git a/meta-oe/recipes-support/nss/nss_3.51.bb b/meta-oe/recipes-support/nss/nss_3.51.bb
> index 889967c..73e5150 100644
> --- a/meta-oe/recipes-support/nss/nss_3.51.bb
> +++ b/meta-oe/recipes-support/nss/nss_3.51.bb
> @@ -32,6 +32,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
>             file://system-pkcs11.txt \
>             file://nss-fix-nsinstall-build.patch \
>             file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
> +           file://no_unused_function_error.patch \
>             "
>
>  SRC_URI[md5sum] = "e59dc16965ef7713669c628d2640ebd1"
> --
> 2.7.4
>
> 
