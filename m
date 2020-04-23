Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.6926.1587651090262773991
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2020 07:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vh2bw/Xy;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id fu13so1964249pjb.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2020 07:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=FebRiCOruPhyWsv1N9ddvukgHKINWcEymV4iGe6oLM8=;
        b=Vh2bw/Xym4X7pq2ckU2yGSM05L7zG16VCD0dymjOjesoXMQ0b53BrUFJ0mBIRnQZzE
         VVzSKwArjRdCssL2pt3ds0yFmhdl5EwV8qZsWQugCNlVweWxd+9/QZxZyR+wkng3jbUK
         Zcud5QBc7UaUgmkBki9X0FZmqlKhYIHfxfdFVtRktjqDHAkgvkHlDgf92m3c5Eu4gYni
         Z4sECTqZI24cYEF+BcW5bkTJIG903YOyTBpNorJtVDkYD0mVf7PzFhONPKYhM0W3YAX1
         E62ZydXYXJkcQDMrMhDHpF90K0xB4JBtReQlLlCVyhQYjg/nrivvAPuerRnadfGpQEjN
         6w+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=FebRiCOruPhyWsv1N9ddvukgHKINWcEymV4iGe6oLM8=;
        b=tS+LnGqcqH3xy4FxTOidgU68EAV8qsV8IGQXOZJt9uAfkI72s/7TqDSR0X1YcHbkG9
         Pioajbd60fWv0BUGofHuPW2QSqdPGNUDdtPz8J8S7rTJ0kj+IIxH5kr0Kf9eBx9jXoEd
         jrkJaW9BOMuiufIgUcgn1hsuxMdY+wAwIJzxGBofm8rzgroRa944xp0DnrK5O0p/0ja0
         rBFOOURsgMVffPZqT+L2CpUAabMBVgzSK355vZhk5MOAu8qHEEaajQ+7cF4H9GSCmVo4
         T60NlBdJ6kb9kUxMGzyh1Q5jGbhGLGgrMRVbsGrWhzbGiUfR4j73s/WyJ1Rus7fEaKj8
         jCsw==
X-Gm-Message-State: AGi0PuaO2pZOzPYfd4F5deUJyMmm0Jxd+g7FAfrrflviJquMc8655N6+
	INU8nW8/ENHtEvN0ctXuNEqC8QRG
X-Google-Smtp-Source: APiQypKCMaV+Ok8LNVr2RRHiPNx643qHklf7NxiN1uwsPXr85c1kNkP304O8h27OIE9PM3kiyJXRLw==
X-Received: by 2002:a17:902:7148:: with SMTP id u8mr3737989plm.13.1587651089596;
        Thu, 23 Apr 2020 07:11:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:8d22:745c:c29a:aa00? ([2601:202:4180:a5c0:8d22:745c:c29a:aa00])
        by smtp.gmail.com with ESMTPSA id m189sm2637812pfm.60.2020.04.23.07.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2020 07:11:28 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH V2] nss: Fix build on riscv64
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200422222031.1014636-1-raj.khem@gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <fb220cce-0e85-d708-28bc-0236f1fe8e31@gmail.com>
Date: Thu, 23 Apr 2020 07:11:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422222031.1014636-1-raj.khem@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------2D6CC9169093BF2E193DA2B2"
Content-Language: en-US

--------------2D6CC9169093BF2E193DA2B2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 4/22/20 3:20 PM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Drop pinning to gcc alone
>
>  meta-oe/recipes-support/nss/nss/riscv.patch | 36 +++++++++++++++++++++
>  meta-oe/recipes-support/nss/nss_3.51.1.bb   |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta-oe/recipes-support/nss/nss/riscv.patch

Cool. I am seeing the same error message for mips64. Will have to try
the same.


- armin 
>
> diff --git a/meta-oe/recipes-support/nss/nss/riscv.patch b/meta-oe/recipes-support/nss/nss/riscv.patch
> new file mode 100644
> index 0000000000..aef91a7c37
> --- /dev/null
> +++ b/meta-oe/recipes-support/nss/nss/riscv.patch
> @@ -0,0 +1,36 @@
> +Enable uint128 on riscv64
> +
> +Fixes
> +| verified/kremlin/kremlib/dist/minimal/LowStar_Endianness.h:29:37: error: 'load128_be' declared 'static' but never defined [-Werror=unused-function]
> +|    29 | inline static FStar_UInt128_uint128 load128_be(uint8_t *x0);
> +|       |                                     ^~~~~~~~~~
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +--- a/nss/lib/freebl/verified/kremlin/include/kremlin/internal/types.h
> ++++ b/nss/lib/freebl/verified/kremlin/include/kremlin/internal/types.h
> +@@ -56,7 +56,8 @@ typedef const char *Prims_string;
> + #include <emmintrin.h>
> + typedef __m128i FStar_UInt128_uint128;
> + #elif !defined(KRML_VERIFIED_UINT128) && !defined(_MSC_VER) && \
> +-    (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__))
> ++    (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__) || \
> ++     (defined(__riscv) && __riscv_xlen == 64))
> + typedef unsigned __int128 FStar_UInt128_uint128;
> + #else
> + typedef struct FStar_UInt128_uint128_s {
> +--- a/nss/lib/freebl/verified/kremlin/kremlib/dist/minimal/fstar_uint128_gcc64.h
> ++++ b/nss/lib/freebl/verified/kremlin/kremlib/dist/minimal/fstar_uint128_gcc64.h
> +@@ -23,9 +23,10 @@
> + #include "FStar_UInt128.h"
> + #include "FStar_UInt_8_16_32_64.h"
> + #include "LowStar_Endianness.h"
> +-
> ++#include <stdint.h>
> + #if !defined(KRML_VERIFIED_UINT128) && !defined(_MSC_VER) && \
> +-    (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__))
> ++    (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__) || \
> ++     (defined(__riscv) && __riscv_xlen == 64))
> + 
> + /* GCC + using native unsigned __int128 support */
> + 
> diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-support/nss/nss_3.51.1.bb
> index 755eb76585..001124011e 100644
> --- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
> +++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
> @@ -32,6 +32,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
>             file://system-pkcs11.txt \
>             file://nss-fix-nsinstall-build.patch \
>             file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
> +           file://riscv.patch \
>             "
>  
>  SRC_URI[md5sum] = "6acaf1ddff69306ae30a908881c6f233"
>
> 


--------------2D6CC9169093BF2E193DA2B2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 4/22/20 3:20 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200422222031.1014636-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
v2: Drop pinning to gcc alone

 meta-oe/recipes-support/nss/nss/riscv.patch | 36 +++++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb   |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/riscv.patch</pre>
    </blockquote>
    <br>
    Cool. I am seeing the same error message for mips64. Will have to
    try the same.<br>
    <br>
    <br>
    - armin  <br>
    <blockquote type="cite"
      cite="mid:20200422222031.1014636-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">

diff --git a/meta-oe/recipes-support/nss/nss/riscv.patch b/meta-oe/recipes-support/nss/nss/riscv.patch
new file mode 100644
index 0000000000..aef91a7c37
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/riscv.patch
@@ -0,0 +1,36 @@
+Enable uint128 on riscv64
+
+Fixes
+| verified/kremlin/kremlib/dist/minimal/LowStar_Endianness.h:29:37: error: 'load128_be' declared 'static' but never defined [-Werror=unused-function]
+|    29 | inline static FStar_UInt128_uint128 load128_be(uint8_t *x0);
+|       |                                     ^~~~~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
+--- a/nss/lib/freebl/verified/kremlin/include/kremlin/internal/types.h
++++ b/nss/lib/freebl/verified/kremlin/include/kremlin/internal/types.h
+@@ -56,7 +56,8 @@ typedef const char *Prims_string;
+ #include &lt;emmintrin.h&gt;
+ typedef __m128i FStar_UInt128_uint128;
+ #elif !defined(KRML_VERIFIED_UINT128) &amp;&amp; !defined(_MSC_VER) &amp;&amp; \
+-    (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__))
++    (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__) || \
++     (defined(__riscv) &amp;&amp; __riscv_xlen == 64))
+ typedef unsigned __int128 FStar_UInt128_uint128;
+ #else
+ typedef struct FStar_UInt128_uint128_s {
+--- a/nss/lib/freebl/verified/kremlin/kremlib/dist/minimal/fstar_uint128_gcc64.h
++++ b/nss/lib/freebl/verified/kremlin/kremlib/dist/minimal/fstar_uint128_gcc64.h
+@@ -23,9 +23,10 @@
+ #include "FStar_UInt128.h"
+ #include "FStar_UInt_8_16_32_64.h"
+ #include "LowStar_Endianness.h"
+-
++#include &lt;stdint.h&gt;
+ #if !defined(KRML_VERIFIED_UINT128) &amp;&amp; !defined(_MSC_VER) &amp;&amp; \
+-    (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__))
++    (defined(__x86_64__) || defined(__x86_64) || defined(__aarch64__) || \
++     (defined(__riscv) &amp;&amp; __riscv_xlen == 64))
+ 
+ /* GCC + using native unsigned __int128 support */
+ 
diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-support/nss/nss_3.51.1.bb
index 755eb76585..001124011e 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -32,6 +32,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIOfile://system-pkcs11.txt\file://nss-fix-nsinstall-build.patch\file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch\+file://riscv.patch\">"http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://system-pkcs11.txt \
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
+           file://riscv.patch \
            "</a>
 
 SRC_URI[md5sum] = "6acaf1ddff69306ae30a908881c6f233"
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------2D6CC9169093BF2E193DA2B2--
