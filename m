Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.11549.1591798154189473250
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 07:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hpawbjbt;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id d6so932679pjs.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2020 07:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=uJfZaGuKS/u1ITJFKlqvn5CA9oG0hqshA8ZXNzQvnnE=;
        b=hpawbjbtFpFvUsdtW30wgldp9zu2fNFerTs3ERfpJ9A6maCJoyDaUVRR+8yCJshdRx
         KBY3OPzBxds431t0F3D0gryO/UE2G7TrWFOlMcNta4FudxGzPDb681q8ENt6qobn2gf1
         st0n0Q/HFSorjNuzbmjSYJ2UsyLKiIWwkBaPmnihibNx+cRAvwPJqXy8B+0AzXsxYMv4
         7m2dm5K9j55vS8REl3Qtc5+V0gKocPR37Xe5Zw79c3kWAWmBJ71B6qII6if1VfUTZrBg
         7tSMAxIShai3AFw2MpJBolSouYX+81rAnZUK4xRzrMEfOcXT5anKsyz2lpPt5U71CYqV
         pPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=uJfZaGuKS/u1ITJFKlqvn5CA9oG0hqshA8ZXNzQvnnE=;
        b=i4kLQXPHN8AI6yNl8yHnZevZgyb+1+gtNzQHnVPfKF/0wWsrD3NAdM0EGdh04stcMB
         cYH3ZmooPSN0jYrzV81MtH3Fyz9JBKYWxdF2WMts94zFIs3EgWB9sptv/r5cqnHXpPxh
         TRmn7P34P0xQwx6Ebsi3We+hYi6srLL4nnDM+CMQXisiTNOrTqFSpCZ+H8dq5cbhsB25
         GAgpqPMF4cj/LlWf8UnBUmf1qODNLu65kRJ2oGvXUMDh90kIkKG4UrAmJLsiHa9MzAuG
         bmeYwUtEGik2ECAdhZTTWAlLWB9TiLXFVR4y6XQWFkYvkdjULbdV/hY48Wjs5+wuUyJM
         WLgA==
X-Gm-Message-State: AOAM531/LAQH2E7XxIkb2gL/UJmuXkRH7KQ/jrVlsZ7taGzhNzjfPBeh
	wNKEI6CTLWiXOUClXsflWlofJfWe
X-Google-Smtp-Source: ABdhPJwlr1RhfBeSbkXtUfB6JCJL8uFuoDE0RaYaBB8Yb65U3J2oicrkyqiLpspZop+Ilcz4mXfZsg==
X-Received: by 2002:a17:902:6b01:: with SMTP id o1mr3216920plk.266.1591798153268;
        Wed, 10 Jun 2020 07:09:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:254a:4327:67e1:d5be? ([2601:202:4180:a5c0:254a:4327:67e1:d5be])
        by smtp.gmail.com with ESMTPSA id 205sm67501pfc.206.2020.06.10.07.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 07:09:12 -0700 (PDT)
Subject: Re: [oe] [meta-oe][dunfell][PATCH] uftrace: add PV to update the package version
To: Adrian Bunk <bunk@stusta.de>, openembedded-devel@lists.openembedded.org
References: <20200610070254.9851-1-bunk@stusta.de>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <bf52e942-c934-6767-d000-1d81cb42265e@gmail.com>
Date: Wed, 10 Jun 2020 07:09:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610070254.9851-1-bunk@stusta.de>
Content-Type: multipart/alternative;
 boundary="------------4E780CC2CB1CD106AC63FE67"
Content-Language: en-US

--------------4E780CC2CB1CD106AC63FE67
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 6/10/20 12:02 AM, Adrian Bunk wrote:
> From: Honggyu Kim <honggyu.kp@gmail.com>
>
> uftrace_0.9.4.bb now doesn't actually use exact 0.9.4 version, so it has
> to add a PV value to update the package version.

I remember looking at this one. As I could not see how this had any
bearing on the function of the package I skipped it.

Why does it have merit?

-armin


>
> Signed-off-by: Honggyu Kim <honggyu.kp@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb b/meta-oe=
/recipes-devtools/uftrace/uftrace_0.9.4.bb
> index c33fa048c..a3d060218 100644
> --- a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
> +++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
> @@ -10,7 +10,7 @@ DEPENDS_append_libc-musl =3D " argp-standalone"
>  
>  inherit autotools
>  
> -# v0.9.4
> +PV .=3D "+git${SRCPV}"
>  SRCREV =3D "d648bbffedef529220896283fb59e35531c13804"
>  SRC_URI =3D "git://github.com/namhyung/${BPN} \
>             "
>
>=20


--------------4E780CC2CB1CD106AC63FE67
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

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
      cite="mid:20200610070254.9851-1-bunk@stusta.de">
      <pre class="moz-quote-pre" wrap="">From: Honggyu Kim <a class="moz-txt-link-rfc2396E" href="mailto:honggyu.kp@gmail.com">&lt;honggyu.kp@gmail.com&gt;</a>

uftrace_0.9.4.bb now doesn't actually use exact 0.9.4 version, so it has
to add a PV value to update the package version.</pre>
    </blockquote>
    <br>
    I remember looking at this one. As I could not see how this had any
    bearing on the function of the package I skipped it.<br>
    <br>
    Why does it have merit?<br>
    <br>
    -armin<br>
    <br>
    <br>
    <blockquote type="cite"
      cite="mid:20200610070254.9851-1-bunk@stusta.de">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Honggyu Kim <a class="moz-txt-link-rfc2396E" href="mailto:honggyu.kp@gmail.com">&lt;honggyu.kp@gmail.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
Signed-off-by: Adrian Bunk <a class="moz-txt-link-rfc2396E" href="mailto:bunk@stusta.de">&lt;bunk@stusta.de&gt;</a>
---
 meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
index c33fa048c..a3d060218 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.9.4.bb
@@ -10,7 +10,7 @@ DEPENDS_append_libc-musl = " argp-standalone"
 
 inherit autotools
 
-# v0.9.4
+PV .= "+git${SRCPV}"
 SRCREV = "d648bbffedef529220896283fb59e35531c13804"
 SRC_URI = "git://github.com/namhyung/${BPN} \
            "
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------4E780CC2CB1CD106AC63FE67--
