Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web11.11840.1591798614551029658
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 07:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=geS4Ja93;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id d66so1164520pfd.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2020 07:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=eB8MPsLar6JwY1axWirxvhNUXamZ0jG/TleJNHb/5eY=;
        b=geS4Ja93jl48eAx7Sx9RMQPcb2XO2R8XMMPJd/Ynp0CEOB7JvsnYl4MhBVjT7VLbEk
         QKP+o+HPtva6iu6Dflpy67ih3TaWHvnvJ0des4nOPw66z7WpsS9CRglsHsmZqF0akWDN
         EMp9DQalXR08d00D1ZAEP+EfKAnecrAaLMfZI5PN1xsGlTpJ8znp9SLBAw1qiiKEqNry
         MeispOG+V1e7M9mraCCUQkYHHdscAMkt/zh2CBgZAu3IyM2j15+GGyO+KjG2L6X/+dQ0
         I5BB1LupsMb75BNkrCIwEy4jCAllzP1d/EsGRbdLHATHET4Kqn4X1NbXz16JHBNvW3+q
         t9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=eB8MPsLar6JwY1axWirxvhNUXamZ0jG/TleJNHb/5eY=;
        b=aKSRKlxrTwVPtTyz+NxpjBFiQazipfVkSgt7D1Z6FnHGC4ExGyAxErQ88HeiSHkLxE
         U3VGu67ZI0Fs+AcqY0vFosnexC1bIDsTs6LVkjwOgypV6YG5+KaG6mE0tnCFdcsUMgBs
         kuWxnCJShDeKjnFAwpi1smdWL2LXewEdMBg5hLPHRGqRQ2ZrjoDWCBIcGCyE4+9rb7W3
         87YLPb8NVDuUyoBWjbBqGrOJ+N3x9iAXigJi2cTdvSNXMP5X5CbPhYKWXdBuVusropiq
         ch/OLgzYXgktBSuph/zyzLi5Zl9VHzkoOPFS5h5A7RF8IlgS8IPpLkJ4Ecdq2Ev7O0d3
         XTjQ==
X-Gm-Message-State: AOAM5318h++aAbVUYz1jWICuVe0BUBI0ifiNFXwuLGlwcFvyjtHnh8yw
	2YnmHaddiFbPpUeSrHfjvBqmL9qZ
X-Google-Smtp-Source: ABdhPJwoWGY5/GMN20hPNOH6tszMEMweZTowVtFcUSSn8GvvxFy/Ejy0Qwqy9ZQmNW6vokqaDzY2UQ==
X-Received: by 2002:a62:3382:: with SMTP id z124mr2931870pfz.263.1591798613817;
        Wed, 10 Jun 2020 07:16:53 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:254a:4327:67e1:d5be? ([2601:202:4180:a5c0:254a:4327:67e1:d5be])
        by smtp.gmail.com with ESMTPSA id i7sm67405pgr.86.2020.06.10.07.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 07:16:53 -0700 (PDT)
Subject: Re: [oe] [meta-oe][dunfell][PATCH] qpdf: fix typo in RDEPENDS
To: Adrian Bunk <bunk@stusta.de>, openembedded-devel@lists.openembedded.org
References: <20200610070254.9851-3-bunk@stusta.de>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <123e4d1f-d840-6a86-4a3f-c376ab1b8173@gmail.com>
Date: Wed, 10 Jun 2020 07:16:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610070254.9851-3-bunk@stusta.de>
Content-Type: multipart/alternative;
 boundary="------------81CA73533F8EF5EF2D645AF9"
Content-Language: en-US

--------------81CA73533F8EF5EF2D645AF9
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 6/10/20 12:02 AM, Adrian Bunk wrote:
> From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
>
> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
> index 3883a8dcf..600508097 100644
> --- a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
> +++ b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
> @@ -32,4 +32,4 @@ DEBIAN_NOAUTONAME_libqpdf = "1"
>  PACKAGES =+ "libqpdf"
>  FILES_libqpdf = "${libdir}/libqpdf.so.*"
>  
> -RDEPEND_${PN} = "libqpdf"
> +RDEPENDS_${PN} = "libqpdf"
Ah, now I see it.

thanks,
armin
>
> 


--------------81CA73533F8EF5EF2D645AF9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 6/10/20 12:02 AM, Adrian Bunk wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200610070254.9851-3-bunk@stusta.de">
      <pre class="moz-quote-pre" wrap="">From: Maciej Pijanowski <a class="moz-txt-link-rfc2396E" href="mailto:maciej.pijanowski@3mdeb.com">&lt;maciej.pijanowski@3mdeb.com&gt;</a>

Signed-off-by: Maciej Pijanowski <a class="moz-txt-link-rfc2396E" href="mailto:maciej.pijanowski@3mdeb.com">&lt;maciej.pijanowski@3mdeb.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
Signed-off-by: Adrian Bunk <a class="moz-txt-link-rfc2396E" href="mailto:bunk@stusta.de">&lt;bunk@stusta.de&gt;</a>
---
 meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
index 3883a8dcf..600508097 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
@@ -32,4 +32,4 @@ DEBIAN_NOAUTONAME_libqpdf = "1"
 PACKAGES =+ "libqpdf"
 FILES_libqpdf = "${libdir}/libqpdf.so.*"
 
-RDEPEND_${PN} = "libqpdf"
+RDEPENDS_${PN} = "libqpdf"</pre>
    </blockquote>
    Ah, now I see it.<br>
    <br>
    thanks,<br>
    armin<br>
    <blockquote type="cite"
      cite="mid:20200610070254.9851-3-bunk@stusta.de">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------81CA73533F8EF5EF2D645AF9--
