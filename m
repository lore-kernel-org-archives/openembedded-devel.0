Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.6636.1601504199006365438
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ocmj5K+W;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: chaoscodecircuits@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id k25so2678972qtu.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2020 15:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=wW6wYIeJy7tyZLU1AXD6iXk+CvWa75FwGdPH8vwCcW8=;
        b=Ocmj5K+W8aPukUoHttGiCBkgTtZlCmNA70rG0MGd+TQt9rI1LYZYAIgromRvZAqp6R
         tpYkDAUn1goJq+5L+EIq7kpwWkYiQduUrPq8ZcLozkkq0+NQH/DynDXTbt9dqEFYNFbs
         WOJ7uZ8Y4u40WYi5ADkyBb9CjVnEXNu6vAmwR2K32D7fiwoQHzT4GbTcnxNX+5HQsG0Q
         ScF269YDyaNdkI8l69dpBAnhHJeZheTsFKa7Ka30QgpU/tCAnWMkWeuU39WhOfrEelfj
         erLCHM0Gok0EGcpubObjec/NM2x4eju4IpzSbH3xQKVR4ATqINxhCnNI+9AGJmoTfKe0
         VZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=wW6wYIeJy7tyZLU1AXD6iXk+CvWa75FwGdPH8vwCcW8=;
        b=H8e2euSoEvzK2Gr/ndCoPSMKFjQ0oo3WJGNmImdzFlHPRXACQ/kMV5GHV9ed/stEss
         GqDz/o6UKr3WaTxnpUSV0LOGlLy13Z17807FkaY1/QSHjuCltJK9/P5T6EQfSEpM8uUe
         0HW6NlQBOPJ9/Y3+xcmNI8QUGJCIk7SYIWbiDt1bW7eJRxzpDUU2wcuPDik2ykb5j/cg
         mJ/LKVoMfv0tp8CyEiK6w5zb2r1etjNdtZcu7u6L5FplAPV4QXasfAgPXSgDau+Jvvsr
         8usbLaVZtVsr8+8z4p9p53Cou/JKKOpvtEj7MwH3zgoh9Us64Sy6nD91F3UKGdDqt4VV
         Dfjg==
X-Gm-Message-State: AOAM533qMV+NYCX4fyTbYWRrNunHVr0AkvZPVkYeRAK7j9nF5CETISKw
	XXTQ099rFpVcmI5vF6VevVCCJtzqZJ1Eqg==
X-Google-Smtp-Source: ABdhPJw2IsSUbRPVKExHoHFRyZqQiLTPRiuV/DLbhfCBw7g+G5xaNVB2LDWYXRoQj4E3QGuvzUoogw==
X-Received: by 2002:ac8:2f12:: with SMTP id j18mr4464763qta.10.1601504198033;
        Wed, 30 Sep 2020 15:16:38 -0700 (PDT)
Return-Path: <chaoscodecircuits@gmail.com>
Received: from [192.168.0.55] (CPE64777de11593-CM64777de11590.cpe.net.cable.rogers.com. [174.115.236.231])
        by smtp.gmail.com with ESMTPSA id b12sm3813570qtj.12.2020.09.30.15.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 15:16:37 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 4/6] python3-argcomplete: Upgrade 1.12.0 -> 1.12.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200928080059.18929-1-leon.anavi@konsulko.com>
 <20200928080059.18929-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <chaoscodecircuits@gmail.com>
Message-ID: <2113b017-f1bf-4a2f-5d2b-dfa1084e8570@gmail.com>
Date: Wed, 30 Sep 2020 18:16:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200928080059.18929-4-leon.anavi@konsulko.com>
Content-Type: multipart/alternative;
 boundary="------------DE8E29B396837813E7C1D2A9"
Content-Language: en-US

--------------DE8E29B396837813E7C1D2A9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/28/20 4:00 AM, Leon Anavi wrote:
> Upgrade to release 1.12.1:
>
> - Update importlib-metadata dependency version range
> - Bash nounset mode fixes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...n3-argcomplete_1.12.0.bb => python3-argcomplete_1.12.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-argcomplete_1.12.0.bb => python3-argcomplete_1.12.1.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.1.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb
> rename to meta-python/recipes-devtools/python/python3-argcomplete_1.12.1.bb
> index dd749dd9eb..c14a7eba12 100644
> --- a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
>   
> -SRC_URI[md5sum] = "47e2a3db821f57165be8f3d3ec1e5259"
> -SRC_URI[sha256sum] = "2fbe5ed09fd2c1d727d4199feca96569a5b50d44c71b16da9c742201f7cc295c"
> +SRC_URI[md5sum] = "2262d0466a40d42267b424bba5010a0b"
> +SRC_URI[sha256sum] = "849c2444c35bb2175aea74100ca5f644c29bf716429399c0f2203bb5d9a8e4e6"
>   
>   PYPI_PACKAGE = "argcomplete"
>   
>
> 
>

--------------DE8E29B396837813E7C1D2A9
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
      cite="mid:20200928080059.18929-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.12.1:

- Update importlib-metadata dependency version range
- Bash nounset mode fixes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite"
      cite="mid:20200928080059.18929-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...n3-argcomplete_1.12.0.bb =&gt; python3-argcomplete_1.12.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_1.12.0.bb =&gt; python3-argcomplete_1.12.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_1.12.1.bb
index dd749dd9eb..c14a7eba12 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_1.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_1.12.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/kislyuk/argcomplete">"https://github.com/kislyuk/argcomplete"</a>
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93">"file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"</a>
 
-SRC_URI[md5sum] = "47e2a3db821f57165be8f3d3ec1e5259"
-SRC_URI[sha256sum] = "2fbe5ed09fd2c1d727d4199feca96569a5b50d44c71b16da9c742201f7cc295c"
+SRC_URI[md5sum] = "2262d0466a40d42267b424bba5010a0b"
+SRC_URI[sha256sum] = "849c2444c35bb2175aea74100ca5f644c29bf716429399c0f2203bb5d9a8e4e6"
 
 PYPI_PACKAGE = "argcomplete"
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------DE8E29B396837813E7C1D2A9--
