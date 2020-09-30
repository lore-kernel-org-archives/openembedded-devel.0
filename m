Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web12.6632.1601504228424640061
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RpDT6A2R;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: chaoscodecircuits@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id w16so3250823qkj.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2020 15:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=iWjXkP/wMTPsSNvljfkEZz3Uiqxq748HHlsELEU5uc8=;
        b=RpDT6A2RDwauamzmfIr+d6mg6K48BG/r4/EFFSnK9hCZec+RCZmX3g1vGLDVdUJxpg
         SC9JesejUlu4co6/+j6LLV5TE2WE7sbz0dPPBFgKO2T4XpkybZVLr/2++Xgze8wrmmsA
         E/FcWm6y7DbyiIZ/a6UTQsML/FXh/czsixESMpAranbcU/S0rmCINTFba20L0en2bw8w
         H9CggY/8HmKTD73nAAxzSrA9x/OIHLwpv9t2sQOIbAhoPGb0BZUFQBNgLQ7CG25TgK0L
         71O8wpMJo3eW2a1qfWUKyHRsMZMyKkdCsJs/MUB/PzxwVTrhdfdDbOTPz+xHFyKrtfIK
         GL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=iWjXkP/wMTPsSNvljfkEZz3Uiqxq748HHlsELEU5uc8=;
        b=GQ6poIYBahJ9VIPnjAHab4oZvCYJgRoHXcOLbD8Ed3qa0xSyrYLjv2epcBPBe9lQob
         GvT2Y7Jxgnr0Xe1BXwJq2qWIsLLyEEd/cyLJ3RVj7ZZUfaiGLsyJ21PznfFJnnhzezbM
         r+Tnl6jtjF9mpIYiKt0y+zsU4QodpJXqAL4DtWOasBhnV0fXD7uaCpH+5dgBwrp5DONj
         UQNzrorDk58/9aq5YEut7G6XSfFumPoDGk2AKHksAd+nVVq9tHQGs5KAXFHxQBqrCvlO
         XqXtpOnUh/x23xtaucCf37wZnpSaPjbcdPcTwGBqa/GQ16wv0XctK9PKzGKyocgG19kD
         S+Vg==
X-Gm-Message-State: AOAM532z2Eje7IlX/rC84RUMBTFjoMh71UabXxH3LmbO46m5h5MNK6R9
	ZxCXezOUIMyHaU7BLKRXjTUc+c6plo500A==
X-Google-Smtp-Source: ABdhPJzhGoyVhRgqw4EeQgaHXOi9FiDSa2fzKdMaBHkGDyvxW3rTOUB31wYVTzLp6w+sgu3Nkxiecg==
X-Received: by 2002:a37:cc7:: with SMTP id 190mr4868818qkm.388.1601504227291;
        Wed, 30 Sep 2020 15:17:07 -0700 (PDT)
Return-Path: <chaoscodecircuits@gmail.com>
Received: from [192.168.0.55] (CPE64777de11593-CM64777de11590.cpe.net.cable.rogers.com. [174.115.236.231])
        by smtp.gmail.com with ESMTPSA id y29sm4243670qtj.20.2020.09.30.15.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 15:17:06 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 6/6] python3-luma-oled: Upgrade 3.5.0 -> 3.6.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200928080059.18929-1-leon.anavi@konsulko.com>
 <20200928080059.18929-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <chaoscodecircuits@gmail.com>
Message-ID: <2b21e642-482e-4996-c7c3-62ace515e72a@gmail.com>
Date: Wed, 30 Sep 2020 18:17:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200928080059.18929-6-leon.anavi@konsulko.com>
Content-Type: multipart/alternative;
 boundary="------------29A48B84FD367E4B7A27B137"
Content-Language: en-US

--------------29A48B84FD367E4B7A27B137
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/28/20 4:00 AM, Leon Anavi wrote:
> Upgrade to release 3.6.0:
>
> - Add support for Winstar OLED displays
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-luma-oled_3.5.0.bb => python3-luma-oled_3.6.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-luma-oled_3.5.0.bb => python3-luma-oled_3.6.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.5.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.6.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-luma-oled_3.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-luma-oled_3.6.0.bb
> index 39bc37fda1..ae14aff366 100644
> --- a/meta-python/recipes-devtools/python/python3-luma-oled_3.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.6.0.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "64436aaa7a05a205430b38d2f9a9bec7"
> -SRC_URI[sha256sum] = "ca62fd7337ee9780b32a8cdc10bcd69879f2cfd97720ab2e17e254a160f6c24f"
> +SRC_URI[md5sum] = "ff45a3067658434339da2586a97e526b"
> +SRC_URI[sha256sum] = "dbd8ebce1c0b10feabb725b321d4a7f9f7353fe16878c8145ca332a173c193c9"
>   
>   CLEANBROKEN = "1"
>   
>
> 
>

--------------29A48B84FD367E4B7A27B137
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
      cite="mid:20200928080059.18929-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.6.0:

- Add support for Winstar OLED displays

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite"
      cite="mid:20200928080059.18929-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-luma-oled_3.5.0.bb =&gt; python3-luma-oled_3.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-oled_3.5.0.bb =&gt; python3-luma-oled_3.6.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.5.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.6.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-luma-oled_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-oled_3.6.0.bb
index 39bc37fda1..ae14aff366 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.6.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249">"file://LICENSE.rst;md5=c328c862c3335ad464e1c9a3ba574249"</a>
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "64436aaa7a05a205430b38d2f9a9bec7"
-SRC_URI[sha256sum] = "ca62fd7337ee9780b32a8cdc10bcd69879f2cfd97720ab2e17e254a160f6c24f"
+SRC_URI[md5sum] = "ff45a3067658434339da2586a97e526b"
+SRC_URI[sha256sum] = "dbd8ebce1c0b10feabb725b321d4a7f9f7353fe16878c8145ca332a173c193c9"
 
 CLEANBROKEN = "1"
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------29A48B84FD367E4B7A27B137--
