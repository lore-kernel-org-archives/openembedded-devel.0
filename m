Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.6580.1601504215846422639
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dhKZNydU;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: chaoscodecircuits@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id w12so3246876qki.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2020 15:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=dDNxp5KeUTRLqUMpPQDdQeRk8a7k5WDO2O7Z608lncg=;
        b=dhKZNydULkTkJFzQDW2DQUiBkt4XjzEjMsxWh+Ghewnbm9oIRDAtE+gVHBd9F17T0H
         tqv7Vnb3vZDAA4ugSRGIOXOnCWgSHI2NdSMMc7fE12WpyPL3637fj8+Ke5rOpzWqLlsZ
         ZxfUvmnAnOVBK2X1SD8V+uGHTh/GOfnzbVGq5L8KkEsxz5IDe2sVfGsAqKdbJ4LP+1S/
         wPoJ+aT9yoCM7J2p8dHAEozBU5OtEAZXyfJ9oJnPUHevuDxGn2fb5OhJv1hNUzPxVhdB
         XEKANMU8H4BiW6QaULgBJUihnC8jg8IsQPaMfz+CiuFTYu5CpYJ85MRAHZDjgbhh+DuB
         h9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=dDNxp5KeUTRLqUMpPQDdQeRk8a7k5WDO2O7Z608lncg=;
        b=kzp0gL9nC0XLm0etlC5mvqr/uew6ZV8PFAevA9z4hSfiAIzGuFfONJc97dM8SYD3XC
         QNimC4AfSt/yA6G81s4X6hxBdT6mmvhSH0d3ZmtM1yblRf46CSc74qIOM3MoOxkDpb/B
         GzRoJ8Lm/c4DI9iMrk1yoWZawKhPeSM2T+k4jE5KhW2GS4sE/Bbv/wuwWjqxMk4V1KzM
         HsYSYgUCLyWS+wLL/IDLRqU60aMiYfgvXbSrGGAtUoF7k1zMlRDlSFSx0PnudhJuHZqY
         1xorqEHSELXrtZS1nSkqshfkOI8Vz+ozs0uUIK5U1FNqgUPUkeAX8KRBHrb7reI8ZGvk
         OOpg==
X-Gm-Message-State: AOAM530/6Q1MBl+rcbw3Wk5/cavszaKtdrCrx6hhDCCnVFQZFOkTrbOX
	xmpQnWd4ZLURLtKmpiu05CmIAlHPTYZ4rg==
X-Google-Smtp-Source: ABdhPJzp7ojZ2kpNn1EbBH4ikqr87xUPZuB6dj7D0N+CuhOqV0bFbUe/gOy9Hj/sswLGhDg3f29+Jg==
X-Received: by 2002:a05:620a:1104:: with SMTP id o4mr4629417qkk.462.1601504214779;
        Wed, 30 Sep 2020 15:16:54 -0700 (PDT)
Return-Path: <chaoscodecircuits@gmail.com>
Received: from [192.168.0.55] (CPE64777de11593-CM64777de11590.cpe.net.cable.rogers.com. [174.115.236.231])
        by smtp.gmail.com with ESMTPSA id s5sm4064734qtj.25.2020.09.30.15.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 15:16:54 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 5/6] python3-luma-core: Upgrade 1.16.2 -> 1.17.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200928080059.18929-1-leon.anavi@konsulko.com>
 <20200928080059.18929-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <chaoscodecircuits@gmail.com>
Message-ID: <a81a0f76-9622-457e-5ae9-58dbabcbe124@gmail.com>
Date: Wed, 30 Sep 2020 18:16:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200928080059.18929-5-leon.anavi@konsulko.com>
Content-Type: multipart/alternative;
 boundary="------------3491190EB23C711B876AEF98"
Content-Language: en-US

--------------3491190EB23C711B876AEF98
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/28/20 4:00 AM, Leon Anavi wrote:
> Upgrade to release 1.17.1:
>
> - Add cmdline opt: "pcf8574" and "bitbang_6800" interfaces
> - Added --inverse option for ST7735 to cmdline opt
> - Allow SPI interface to define reset duration
> - Change bitmap_font to be compatible with Pillow < 7.0
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-luma-core_1.16.2.bb => python3-luma-core_1.17.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-luma-core_1.16.2.bb => python3-luma-core_1.17.1.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.16.2.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.17.1.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-luma-core_1.16.2.bb
> rename to meta-python/recipes-devtools/python/python3-luma-core_1.17.1.bb
> index e8a61ad062..9246d1b3a6 100644
> --- a/meta-python/recipes-devtools/python/python3-luma-core_1.16.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-luma-core_1.17.1.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "8889ee9eb95c3441ee65b4b5f4a022eb"
> -SRC_URI[sha256sum] = "518fe4e3286a4e2a75788713a58de403e6bba6d4c909fa5ce0fe14aceb05b85e"
> +SRC_URI[md5sum] = "dea76a83c7130f59b7e807c3b2f1b3b5"
> +SRC_URI[sha256sum] = "b4a9f934f4dbf9b1d5c74259f871b4187aaa754b139964153f7702badaaccffd"
>   
>   CLEANBROKEN = "1"
>   
>
> 
>

--------------3491190EB23C711B876AEF98
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/28/20 4:00 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200928080059.18929-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.17.1:

- Add cmdline opt: "pcf8574" and "bitbang_6800" interfaces
- Added --inverse option for ST7735 to cmdline opt
- Allow SPI interface to define reset duration
- Change bitmap_font to be compatible with Pillow &lt; 7.0

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite"
      cite="mid:20200928080059.18929-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-luma-core_1.16.2.bb =&gt; python3-luma-core_1.17.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.16.2.bb =&gt; python3-luma-core_1.17.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.16.2.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.17.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.16.2.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_1.17.1.bb
index e8a61ad062..9246d1b3a6 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_1.17.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7">"file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "8889ee9eb95c3441ee65b4b5f4a022eb"
-SRC_URI[sha256sum] = "518fe4e3286a4e2a75788713a58de403e6bba6d4c909fa5ce0fe14aceb05b85e"
+SRC_URI[md5sum] = "dea76a83c7130f59b7e807c3b2f1b3b5"
+SRC_URI[sha256sum] = "b4a9f934f4dbf9b1d5c74259f871b4187aaa754b139964153f7702badaaccffd"
 
 CLEANBROKEN = "1"
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------3491190EB23C711B876AEF98--
