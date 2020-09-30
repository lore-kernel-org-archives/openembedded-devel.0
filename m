Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.6629.1601504180291896057
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZhoPYQqK;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: chaoscodecircuits@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id w12so3245288qki.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2020 15:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=x3yUFxkm1Dq1t+vs1jL+6vPdKNdaRU0x02tNWXXBmUE=;
        b=ZhoPYQqKgZ9r7aiczD4Vo0rXANcjf3TkGVclko2dt9RzDZ8jYqjKlrLcPkfjZ+td6i
         HyuaHFQK3Xq06mMWK1S1kfv7oo0MX7d/gN97ZoDXhReRZJG6HQAlRF7Lhhq1o6PgzT1X
         n8lauqlq+OnNo2srC/ivO9BOdPk2Ou9AlJ55dhLPWRFoMRYZ2ZdQs1IhfSPTdME2SjNm
         ui5bhzOS/+3ufETl9jDxJiR4GbBOhVyd72GNBMZmgcxtp/T8JkvX3UvL/Ssg8Me9Y5zy
         +wQzqZ8TfoFyV8hv5LXV/A5fOWeF8HjktE9C0RqcACWgjy1nP0nB7DMErVwgcUBez8fd
         FKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=x3yUFxkm1Dq1t+vs1jL+6vPdKNdaRU0x02tNWXXBmUE=;
        b=fC8Kao6FSMdih/JkCCK0jaeCkHGBwOeRBsrEof2Ao1tc+QttY5PvgyFLH0bmkcQDP2
         8HbKdMxopeTEMtGnUVqW5rp60rz2DV16481iOZxZ+Ns1CqlrP5R8erolly7qdcxw0TF8
         6yTWpb+nFZIE+DAQMMyNE4D55QAp0pyE4U9LwjIAffubE8Z0Bj72vChN0m8gE174WdZM
         W6tiUobqBR/ReDyGXbMxWUfgqmOzunb7Nh3E5Em1aZiYD1mPF1qjXpNSdwAtVmQR6kPl
         mCml3aX/zceoKzA3Xy7/isVRSrwYWkFmLnxOOGNOSQQcHxXyQmXDh1V3gWBiscXrKoi8
         jPXQ==
X-Gm-Message-State: AOAM530KIZOpl2tOPWim9l+SaFEpzNE+qY3UsnWYhiQnYA4VShHgMbJV
	KlLLYAawkdvDr4f0EfjGpXm7V6EPvr1UiA==
X-Google-Smtp-Source: ABdhPJyz4QweVc97xqb76DtcYBsi2LXnXe0zen8MTYfnC3EJ7KHA1C1NLk0ezklHkz9hCV0+tmUHRA==
X-Received: by 2002:a05:620a:683:: with SMTP id f3mr4950493qkh.491.1601504179306;
        Wed, 30 Sep 2020 15:16:19 -0700 (PDT)
Return-Path: <chaoscodecircuits@gmail.com>
Received: from [192.168.0.55] (CPE64777de11593-CM64777de11590.cpe.net.cable.rogers.com. [174.115.236.231])
        by smtp.gmail.com with ESMTPSA id g45sm4277541qtb.60.2020.09.30.15.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 15:16:18 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 3/6] python3-tqdm: Upgrade 4.49.0 -> 4.50.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200928080059.18929-1-leon.anavi@konsulko.com>
 <20200928080059.18929-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <chaoscodecircuits@gmail.com>
Message-ID: <a5723d1b-6323-718c-7bdd-f67301082950@gmail.com>
Date: Wed, 30 Sep 2020 18:16:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200928080059.18929-3-leon.anavi@konsulko.com>
Content-Type: multipart/alternative;
 boundary="------------D19B73F52D9817FEB363CDAE"
Content-Language: en-US

--------------D19B73F52D9817FEB363CDAE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/28/20 4:00 AM, Leon Anavi wrote:
> Upgrade to release 4.50.0:
>
> - add bar colour option
> - for notebook as well as std/CLI
> - plain text as well as hex (e.g. 'green' or '#00ff00')
> - notebook improvements: split bar description into separate
>    widget and improve reset() (handle width and colour)
> - fix exceptions when file is closed
> - add & update tests
> - minor documentation updates
> - move and configure issue/pr templates
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-tqdm_4.49.0.bb => python3-tqdm_4.50.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-tqdm_4.49.0.bb => python3-tqdm_4.50.0.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.49.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.50.0.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-tqdm_4.49.0.bb
> rename to meta-python/recipes-devtools/python/python3-tqdm_4.50.0.bb
> index 26eb1073de..bf0385410e 100644
> --- a/meta-python/recipes-devtools/python/python3-tqdm_4.49.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-tqdm_4.50.0.bb
> @@ -5,8 +5,8 @@ SECTION = "devel/python"
>   LICENSE = "MIT & MPL-2.0"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
>   
> -SRC_URI[md5sum] = "c2afde3f1d5aa108376fdd0f4b20821d"
> -SRC_URI[sha256sum] = "faf9c671bd3fad5ebaeee366949d969dca2b2be32c872a7092a1e1a9048d105b"
> +SRC_URI[md5sum] = "4352d89e2c6d6b017f40f244baddfc51"
> +SRC_URI[sha256sum] = "93b7a6a9129fce904f6df4cf3ae7ff431d779be681a95c3344c26f3e6c09abfa"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------D19B73F52D9817FEB363CDAE
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
      cite="mid:20200928080059.18929-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.50.0:

- add bar colour option
- for notebook as well as std/CLI
- plain text as well as hex (e.g. 'green' or '#00ff00')
- notebook improvements: split bar description into separate
  widget and improve reset() (handle width and colour)
- fix exceptions when file is closed
- add &amp; update tests
- minor documentation updates
- move and configure issue/pr templates

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite"
      cite="mid:20200928080059.18929-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-tqdm_4.49.0.bb =&gt; python3-tqdm_4.50.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.49.0.bb =&gt; python3-tqdm_4.50.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.49.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.50.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.49.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.50.0.bb
index 26eb1073de..bf0385410e 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.49.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.50.0.bb
@@ -5,8 +5,8 @@ SECTION = "devel/python"
 LICENSE = "MIT &amp; MPL-2.0"
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25">"file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"</a>
 
-SRC_URI[md5sum] = "c2afde3f1d5aa108376fdd0f4b20821d"
-SRC_URI[sha256sum] = "faf9c671bd3fad5ebaeee366949d969dca2b2be32c872a7092a1e1a9048d105b"
+SRC_URI[md5sum] = "4352d89e2c6d6b017f40f244baddfc51"
+SRC_URI[sha256sum] = "93b7a6a9129fce904f6df4cf3ae7ff431d779be681a95c3344c26f3e6c09abfa"
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------D19B73F52D9817FEB363CDAE--
