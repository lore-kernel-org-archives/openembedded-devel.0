Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.6603.1601504279323207098
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q/Gh0wUQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: chaoscodecircuits@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id x201so3235865qkb.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2020 15:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=jsbsYisQcdr3aCw/Sxh0Tu44ShBO+I+pmov/sxiO2Dg=;
        b=Q/Gh0wUQQOAFqABu4PZGJzDZEQ7bPjWgsEgKqDKIL/wxGBadfq+KcwhS8wj9h0QUee
         BAJgMF0ofDg98n3xAa994nnpy0U5lKytdwFzRMZONNeZZJyg52vNpjCXzF6CGMGBv0bu
         l9SxKNFDMXBRUrWpKg7wNvCYp0PchMTMvmSyiqX/7BBB8RRxHy4QabClrP7fSiQwkBcK
         BoyImsBZdhKtIRP6QgXOC33Vo0tbTkS6tsWfAJmFLUjJjroxXsWYcYxKJFmcTFhCbmIc
         jaiMtHq3GBPqhzvZADM1irpFF09GuEDZkYORp488rypx9xDxQKV/ewLnqtOHZtgIFXHY
         xYMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=jsbsYisQcdr3aCw/Sxh0Tu44ShBO+I+pmov/sxiO2Dg=;
        b=PfsB4r5ZPTrEH0FVrzAwpu12X9OKHE5iKNQ3ke3GOj1pFAFI1VATzU7olTqWiY+XSW
         SukxywiZtVG0Bg0tBY8wsyuCGz1UAB8uZtC5DYNmNvqO4Y+uL+Q/utOymXoO12O2/xvn
         BWC3muesFkZ9gohTPmBmed0zwKyuwLDb9ItuxgLBL+EX635KqO+34N45LnkBZ5B3JuRB
         x9Omo+0VReTYRCZ7u4O9MpEZVga3GQn1vEZICI3U8BChnciRo9GB3Ntav5Qr/Blx8IK3
         XedMRFJ5FNHJ4vJg3DvQ0oiw77ZAiZLP55GJ1108BVQTLrqMGODV7j15LtPM5Kx8WdN/
         +C9w==
X-Gm-Message-State: AOAM530gPQcdvwRI6AxLXMSeX0cK1q/wxBkc1Es56oQfuBHJvDFujH1F
	DlOpx6IdzIKZhhY8Ckse8aEkYM6Uh4OICQ==
X-Google-Smtp-Source: ABdhPJyd5IwF67x+kEdKifIeZpZEczGnibFZPFaDv6TgtarvEUHc+HCEnkBGEOKjjgI3peV2h6ST2Q==
X-Received: by 2002:a37:a354:: with SMTP id m81mr4950750qke.307.1601504278309;
        Wed, 30 Sep 2020 15:17:58 -0700 (PDT)
Return-Path: <chaoscodecircuits@gmail.com>
Received: from [192.168.0.55] (CPE64777de11593-CM64777de11590.cpe.net.cable.rogers.com. [174.115.236.231])
        by smtp.gmail.com with ESMTPSA id k5sm3666751qkc.45.2020.09.30.15.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 15:17:57 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-regex: Upgrade 2020.7.14 -> 2020.9.27
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200929082645.32560-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <chaoscodecircuits@gmail.com>
Message-ID: <e158caf8-0b38-9d67-ca1e-3158ce1fba8a@gmail.com>
Date: Wed, 30 Sep 2020 18:17:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200929082645.32560-1-leon.anavi@konsulko.com>
Content-Type: multipart/alternative;
 boundary="------------CA5EA431C7C0B5064BD9EFF4"
Content-Language: en-US

--------------CA5EA431C7C0B5064BD9EFF4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/29/20 4:26 AM, Leon Anavi wrote:
> Upgrade to release 2020.9.27:
>
> - Fix Memory Error - regex.findall. The problem was caused by a
>    lazy repeat looping forever, growing the backtracking stack.
>    Greedy repeats were OK.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-regex_2020.7.14.bb => python3-regex_2020.9.27.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-regex_2020.7.14.bb => python3-regex_2020.9.27.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.7.14.bb b/meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-regex_2020.7.14.bb
> rename to meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb
> index 5c608c989f..fb891f8716 100644
> --- a/meta-python/recipes-devtools/python/python3-regex_2020.7.14.bb
> +++ b/meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=ee7987010dadc17745
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "c3a53929c3797289566368be4b6b964a"
> -SRC_URI[sha256sum] = "3a3af27a8d23143c49a3420efe5b3f8cf1a48c6fc8bc6856b03f638abc1833bb"
> +SRC_URI[md5sum] = "195f5e867e9f87a39f921ad0e5761a61"
> +SRC_URI[sha256sum] = "a6f32aea4260dfe0e55dc9733ea162ea38f0ea86aa7d0f77b15beac5bf7b369d"
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 
>

--------------CA5EA431C7C0B5064BD9EFF4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/29/20 4:26 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200929082645.32560-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2020.9.27:

- Fix Memory Error - regex.findall. The problem was caused by a
  lazy repeat looping forever, growing the backtracking stack.
  Greedy repeats were OK.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite"
      cite="mid:20200929082645.32560-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-regex_2020.7.14.bb =&gt; python3-regex_2020.9.27.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2020.7.14.bb =&gt; python3-regex_2020.9.27.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2020.7.14.bb b/meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-regex_2020.7.14.bb
rename to meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb
index 5c608c989f..fb891f8716 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2020.7.14.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2020.9.27.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=ee7987010dadc17745inheritpypisetuptools3-SRC_URI[md5sum]=">"file://PKG-INFO;beginline=8;endline=8;md5=ee7987010dadc17745
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "</a>c3a53929c3797289566368be4b6b964a"
-SRC_URI[sha256sum] = "3a3af27a8d23143c49a3420efe5b3f8cf1a48c6fc8bc6856b03f638abc1833bb"
+SRC_URI[md5sum] = "195f5e867e9f87a39f921ad0e5761a61"
+SRC_URI[sha256sum] = "a6f32aea4260dfe0e55dc9733ea162ea38f0ea86aa7d0f77b15beac5bf7b369d"
 
 BBCLASSEXTEND = "native nativesdk"
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------CA5EA431C7C0B5064BD9EFF4--
