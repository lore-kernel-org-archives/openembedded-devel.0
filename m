Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web12.7883.1594304079405629549
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 07:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YklHKXb9;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id z3so1060597pfn.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2020 07:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=HDmlmfTOi0DHimG7mtBW0uzqjCqFymNPD7SoXMEePAg=;
        b=YklHKXb9fHRwT1q6QvsXZS12MtuXcXhCNOVwKnUj6ASckebNXYumgL6iT4AIrcZUbU
         s9eTPumvaPLg7F/QPxydfTwt2rJorXwssOzX+E1yL+Yjp8ZuhFFTXIad+mQmicRk2C4q
         Tclvf1J8PDQTc6WEcEEmu0EwBWBvfr+1kSAaQXjZ1Kkb5wGW7yj45B75D6uBku41n+mN
         R4bW3jj30PEXYVcwehB5Did7ORBwiwa5H/OzqajRGe/n807PXNGsOiZXQ6YQG0FZWR/e
         kuEhCWOwuCDvykYNnr0eujpVMaMeLmDAtCIF3D8WI3Mu2oCX7elEp1L8JwYkuC7d0YgX
         51tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=HDmlmfTOi0DHimG7mtBW0uzqjCqFymNPD7SoXMEePAg=;
        b=fAevdXroXlhSBvDjZ+BJ2XRpdnmQRjR6UjJ9F6FRfWwiKbcJ3c1OT7YVuNulp1MWo2
         sycOh1yECCs22TVyaNKm+fKHCqK+NubKV2HDb+MYC/crDZ41JCqLhbtEkJmG1iqDyX6p
         0EiTfQy85ODMcMqtLGmgDlZ95/v+iL84iktfjsBRM87LTFY1xbmk7uSW5EtbfNl4lLgR
         qOVU3/mF3AwaVDEYsvzxrebg/xaXtxnR4R/ve+sPcScdYRcYzF9Km3/jTvYD2ohcZ/xA
         AyigHaYmGGHA+Pya8VcDR89LrZodzUpX0kcfNDnnft4CMOQJoIeE5vEBxXVQErS5oo7T
         9tNA==
X-Gm-Message-State: AOAM533PPobwMZZ/jkPRn4YLkxeYp/NdtnZfn3ViNceDMy8RURqNio7u
	aS1WwDHxassHZWtP0+GFhLXtUTywQIU=
X-Google-Smtp-Source: ABdhPJzKceD0yHR/LVseuHWUxLFLRyIU6HbBmhKcyTMfjZ22vGe8mi1AnqgX8BrLPHpOt4GByB9fXw==
X-Received: by 2002:aa7:82c8:: with SMTP id f8mr61704782pfn.165.1594304078523;
        Thu, 09 Jul 2020 07:14:38 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:e0fc:4d03:5c6c:3dcd? ([2601:202:4180:a5c0:e0fc:4d03:5c6c:3dcd])
        by smtp.gmail.com with ESMTPSA id f2sm3120274pfb.184.2020.07.09.07.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 07:14:37 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 09/10] python3-croniter: Upgrade 0.3.33 -> 0.3.34
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
 Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200622103542.27830-1-leon.anavi@konsulko.com>
 <20200622103542.27830-9-leon.anavi@konsulko.com>
 <cd1632ed-d2ee-903a-27f6-917206be356c@windriver.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <cdc9d8d7-25c5-c02b-e307-4e0c5ca5c9f0@gmail.com>
Date: Thu, 9 Jul 2020 07:14:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <cd1632ed-d2ee-903a-27f6-917206be356c@windriver.com>
Content-Type: multipart/alternative;
 boundary="------------467CA50E608BD3CE86F951C2"
Content-Language: en-US

--------------467CA50E608BD3CE86F951C2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 6/26/20 8:22 AM, Trevor Gamblin wrote:
>
>
> On 6/22/20 6:35 AM, Leon Anavi wrote:
>> Upgrade to release 0.3.34:
>>
>> - Add croniter_range(start,end,cron_expr) function
>> - croniter_range: Allow different ret_type/input types
>> - croniter_range: Tweak internals
>> - Simplify datetime type check
>> - Remove croniter_range() timezone safety check
>> - Add cron expression optimizations

This is missing a RDEPENDS for 'natsort'.
https://github.com/kiorky/croniter/commit/6144aeabf1eb36c4f94c6bcabaf261b4=
c8755f0e#diff-7fe11226cff646f5d9f35faa76217059

=C2=A0natsort needs fastnumbers and PyICU. PyICU fails to compile.


I will be staging my work in a contrib will thinks get sorted.

- armin

>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>> ---
>>  .../{python3-croniter_0.3.33.bb =3D> python3-croniter_0.3.34.bb} | 3 +=
+-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>  rename meta-python/recipes-devtools/python/{python3-croniter_0.3.33.bb=
 =3D> python3-croniter_0.3.34.bb} (67%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.3=
3.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
>> similarity index 67%
>> rename from meta-python/recipes-devtools/python/python3-croniter_0.3.33=
.bb
>> rename to meta-python/recipes-devtools/python/python3-croniter_0.3.34.b=
b
>> index 4dd53a67b..0c28948f6 100644
>> --- a/meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb
>> +++ b/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
>> @@ -4,7 +4,8 @@ LICENSE =3D "MIT"
>>  LIC_FILES_CHKSUM =3D "file://docs/LICENSE;md5=3Db8ee59850b882cbf623188=
489ea748e2"
>>  
>>  PYPI_PACKAGE =3D "croniter"
>> -SRC_URI[sha256sum] =3D "03ad19baa220ca8bd105413c9f3bab2e7a1514046c20ae=
b7bf16805c07538eee"
>> +SRC_URI[md5sum] =3D "adfeeb0032ab7aeccba908fa2eb09c33"
>> +SRC_URI[sha256sum] =3D "7186b9b464f45cf3d3c83a18bc2344cc101d7b9fd35a05=
f2878437b14967e964"
>>  
>>  inherit pypi setuptools3
>>  
>>
>
>=20


--------------467CA50E608BD3CE86F951C2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 6/26/20 8:22 AM, Trevor Gamblin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:cd1632ed-d2ee-903a-27f6-917206be356c@windriver.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 6/22/20 6:35 AM, Leon Anavi wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:20200622103542.27830-9-leon.anavi@konsulko.com">
        <pre class="moz-quote-pre" wrap="">Upgrade to release 0.3.34:

- Add croniter_range(start,end,cron_expr) function
- croniter_range: Allow different ret_type/input types
- croniter_range: Tweak internals
- Simplify datetime type check
- Remove croniter_range() timezone safety check
- Add cron expression optimizations</pre>
      </blockquote>
    </blockquote>
    <br>
    This is missing a RDEPENDS for 'natsort'. <br>
<a class="moz-txt-link-freetext" href="https://github.com/kiorky/croniter/commit/6144aeabf1eb36c4f94c6bcabaf261b4c8755f0e#diff-7fe11226cff646f5d9f35faa76217059">https://github.com/kiorky/croniter/commit/6144aeabf1eb36c4f94c6bcabaf261b4c8755f0e#diff-7fe11226cff646f5d9f35faa76217059</a><br>
    <br>
     natsort needs fastnumbers and PyICU. PyICU fails to compile.<br>
    <br>
    <br>
    I will be staging my work in a contrib will thinks get sorted.<br>
    <br>
    - armin<br>
    <br>
    <blockquote type="cite"
      cite="mid:cd1632ed-d2ee-903a-27f6-917206be356c@windriver.com">
      <blockquote type="cite"
        cite="mid:20200622103542.27830-9-leon.anavi@konsulko.com">
        <pre class="moz-quote-pre" wrap="">

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com" moz-do-not-send="true">&lt;leon.anavi@konsulko.com&gt;</a></pre>
      </blockquote>
      Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E"
        href="mailto:trevor.gamblin@windriver.com"
        moz-do-not-send="true">&lt;trevor.gamblin@windriver.com&gt;</a>
      <blockquote type="cite"
        cite="mid:20200622103542.27830-9-leon.anavi@konsulko.com">
        <pre class="moz-quote-pre" wrap="">---
 .../{python3-croniter_0.3.33.bb =&gt; python3-croniter_0.3.34.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_0.3.33.bb =&gt; python3-croniter_0.3.34.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb
rename to meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
index 4dd53a67b..0c28948f6 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_0.3.33.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
@@ -4,7 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2" moz-do-not-send="true">"file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"</a>
 
 PYPI_PACKAGE = "croniter"
-SRC_URI[sha256sum] = "03ad19baa220ca8bd105413c9f3bab2e7a1514046c20aeb7bf16805c07538eee"
+SRC_URI[md5sum] = "adfeeb0032ab7aeccba908fa2eb09c33"
+SRC_URI[sha256sum] = "7186b9b464f45cf3d3c83a18bc2344cc101d7b9fd35a05f2878437b14967e964"
 
 inherit pypi setuptools3
 
</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------467CA50E608BD3CE86F951C2--
