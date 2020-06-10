Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.12139.1591799429575625650
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 07:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W2wrsqEX;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id n2so1011957pld.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2020 07:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=FKJg22haYMs+dM0f4PvaAXqB+cvlOC5Ci65Wei1ZEHg=;
        b=W2wrsqEXa0KVzt6r4sDqftbWNkqMVsbiMZFCdd4gaCbYU96ka/j1dAhUvrDcF9V6lg
         hiAyPpDxykNT5e214E4JQlgnj9BowRtlReEONxAExxgQANcqWa4R5us3szQclGluwEOo
         TEYMfe122QJB0sTxm/UknY2JMV2vG5YD91a6r5hz7mo6rz+gBPFSKPdt4OqHgkSsYMDw
         Ad2KNYPtX9kqjuDmYxbcvG6x0YXTDGKFHFZx8BlMr6xjxWZ66xOjBuAZWpNAv8cXSN/x
         0rRzheKEpldryKoTdZJz7cGISX/xEDfRcA+LWwY56OrnQj80pEnDh0Y5hU1uchhu2jVl
         kvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=FKJg22haYMs+dM0f4PvaAXqB+cvlOC5Ci65Wei1ZEHg=;
        b=UISuEW8BF0YtqoQD99iWhIaLJfDIjDEd+fSeLwytyyA7rCp0jeIVYcee8uSgS3t0kD
         rfrF+o7TrTH+OROfm8/zfoO0BFkllHORqAJt6hCV7PEJiv/fElmkwYNXh+qFG+aS91SK
         DvqYp0YgIpHUT2t4ImaJIYHYCpj4elZn8lsvHA4ntTkUgjnINU8SH2vrra75s2uaPWLV
         8dfMKK3tx9Gc0BjIueyiXiwq/cSLHN9opYhDyOYXXZTYR3r9UPwlMmM9qV1o7IG9zyoP
         C/jnXLFLyx5jh0ZQS1xObI3bdazkfS+ddUk/lVUvgXfiXxSZTxF4HvKUL1cVmqHauL7/
         VVOw==
X-Gm-Message-State: AOAM53023sI73wM9LwMU2W4TmwV89dKvKDA4mvc12xzbZ4W2mhLXJXR/
	akpq9CCPMNk7tPIAo2jnr1dJfu4e
X-Google-Smtp-Source: ABdhPJzi0oGx/Qf/X6nrmaLIzQKDVM2hds/+/ozbvRl2BJi1UugRteFC2VMYRxHibWJcnr13uNIAzg==
X-Received: by 2002:a17:902:9693:: with SMTP id n19mr3181233plp.93.1591799428660;
        Wed, 10 Jun 2020 07:30:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:254a:4327:67e1:d5be? ([2601:202:4180:a5c0:254a:4327:67e1:d5be])
        by smtp.gmail.com with ESMTPSA id n65sm162350pfn.17.2020.06.10.07.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 07:30:28 -0700 (PDT)
Subject: Re: [oe] [meta-python][dunfell][PATCH] python3-docutils: Remove, moved to OE-core
To: Adrian Bunk <bunk@stusta.de>, openembedded-devel@lists.openembedded.org
References: <20200610070458.10008-1-bunk@stusta.de>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 xsFNBFnlUP4BEADpKf+FQdLykenQXKk8i6xJNxDow+ypFeVAy8iFJp7Dsev+BtwUFo8VG7hx
 Jmd71vHMw+coBetWC3lk+IKjX815Ox0puYXQVRRtI+yMCgd6ib3oGxoQ8tCMwhf9c9/aKjaz
 mP97lWgGHbiEVsDpjzmMZGlJ6pDVZzxykkJExKaosE46AcA8KvfhRQg5zRyYBtinzs8Zu8AP
 aquZVHNXxPwjKPaSEEYqQjFeiNgFTavV+AhM2dmPmGUWCX9RZisrqA4slGwEB0srMdFf12Zg
 mD35Y9jZ80qpu5LPtJCFcsaAlebqR+dg36pIpiRR+olhN1wmC6LYP1vw6uMEYBjkTa2Rnb6+
 C4FDzCJD4UCrUvLMNeTW810DY0bjMMj3SfmSGSfQUssaaaTXCVlLGuGxyCr/kza1rHaXMKum
 Ek4EFj1fyn7AfkSLEHfJfY4sO1tpgigvs4eD/4ZSQEXSu/TjVvyKx4EvUbhlGMRyH2CPwD/H
 7DFF8tcVtJvCwUUW+zKtjxjSSLrhniNMXAOQJZ6CdaqCe4OyJQT5aRdr+FWbBRjpaRCCf5nf
 dTc88NMU9PrBT3vu0QJ5WNPO6MJpnb+d8iMNLZAz8tv8JMm2l+sMcNKSJ6lhX8peoBsfMVqc
 FgiykEO0fUt7DCbUYR5tLjM/3E5tHvTjMooVJyOxoufVLYtTtQARAQABzSFha3VzdGVyODA4
 IDxha3VzdGVyODA4QGdtYWlsLmNvbT7CwX0EEwEIACcFAlnlUP4CGyMFCQlmAYAFCwkIBwIG
 FQgJCgsCBBYCAwECHgECF4AACgkQ7ou0mfRW5/kuhRAAlR2FTq5572jrX5nnPR7AqI2bvSVb
 vqGLlvv739WhghvagbC+tu05QguopAhWW1/DcHK2+QtfIoC9UZrSW4RaO0CCo5sPjqK7l1KT
 ngWX/rGjF6xTF2QN0U/btcpMyVN2CNtVLwsDF9e+GHKoUcnFkP+JP8vHGokN9k6E/c97hLaL
 IJPeKl8LZXc2Efk+MaW1NXkfDJdcp/p+voajbihSQO6OZ/o+x9d2I3ZybKfTZ71+ek5Hxzjz
 g6KkMOI7KJjlmBlrQFAtVbS+CFAKrwkYznE6ggkcmGv3N7DeUBTUR78hf+EZEAM+ajeLMtrG
 rXE00pIb+gLGYPZxba5pCdQ+qWUW38qi9UnIRPm6fq7Ypx1r6XwJvbgCOkhbxo3D4YUdyC0b
 FE9lgrg8htbc9in4j2+hVI6ALswNjLprzXdzdKrd+T3Egx36o3Z/qrYsW2o5/A5sVvvASVKi
 wRPuEKhEhfmiHUPLvuKqhMoymHaz3fg5D2Q8G0gSDkLgeEpAjiWqf4+AGLx+MSDai7DSOsmI
 t61kWxs7cFTB32UrB/TDoVNn3Fm88ZFQpA/bngikE9jgEm045mSY86fNlbFj2mcCd0Ha1i1n
 aYc97RpgfjNMWyHDVHOGrNg/hJjkGa5RsAXkfyBwltHRw0Hj4urUQ3rr8um8PLe43SezPwXA
 oRoyDxDOwU0EWeVQ/gEQALNHwj5VSPdnvXy1RXUuH+rclMx4x8zaqDyY0YqHfA7b/d8Y0VAt
 Y6YpzDeFTwD8A0Wfb7kZ2mlDIE6ODCB71uT/E3C6b+FiiN+lgzslznjUW+9l8ddDhRrC8HMG
 37vrXF5h++PTXUKEKUlkDib1w093tu3mlJXUvIAzl8CEHkptF6Br0L9XxFwuWoNUfjT9IorQ
 0SVIhvq5PhVAITXUD5fD7/N8B4TYegmHFRo1UaaKSnSHwlJJkzKpeWOH8QTYrP0RHxX86Obv
 IZuwbAo3F3oojcvLJt9NxWnbEmEALkleklLZnukgu7q5Wp1VDwhUbMFTLb6qmnBa/Xi30uOk
 0l1TMHDbeQswvQDOZBAMukSRqyBetKxQ3iTfZ/3z1ubQRcVDbVlMDScSHQq0LK3F9yMOMM/6
 0QPqJjl13xn/+Bn7WJiAIXXwzAV7uo6i0khFfjDtCDQ40aeffqOLxp1yMLkc3EKJGcQ5F6O2
 ycEf4QXCYUbMXjxB0EJB8y7z+xOi5Mmd/pPlVmZ2gQK84NAL90p7n7jRlyf3gOUY+JOl4c5e
 UFiIhOzmuqNrvPOiZ02GXh6SGUU5y7IgSoIKvXSFgHAn2OG/tcspBmkyv6IuNVpmbmEgYn4I
 Rnt40UXVQkxTh0dENFhk2cjunMYozV/OqYCgmZLFSeJd8kAo4yn+yOtNABEBAAHCwWUEGAEI
 AA8FAlnlUP4CGwwFCQlmAYAACgkQ7ou0mfRW5/nNcg//R63cbOS6zLtvdnPub3Ssp1Ft8Wmv
 mni+kccuNApuDV7d63QckYxjAfUv2zYMLpbh87gVbLyCq9ASn552EbfRhTvHdk44CgbHBVcI
 ZBEdZWgRR5ViJakQSYHpP2e5AGNFnx9gSIuRTaa5rvZM+4xeoZ2vJiq93TtaYPr7UFNfK+c4
 vv4C66lkt9l95/I10eSc3RqbOKZW47emlg4X3ygEoB9k2lPrpspyf6sUuSEi0WrlSxoLAr6p
 JG8rTUErYNeXe6JCdL31odDx1Dh5sdKIj2RicUYZNilxu9f1M7jZwf2ra1FGAlKj2ybqmgpZ
 EFteaiCinEYsvDyZyOiWHjAFI+RZIPQQL3AnVp4l7wYD3r9hnqYPww0slyMDcb9262RoFkHq
 dDwxPYarrNjWUpOzxB6bFxOgNRdCTgvQl8Ftk8a/yXB6vHeUSm1vPFCBxQPZytyfOLhEWm0J
 /mkVL0Z6iRK3p1LKnpLYCS4/esL2u7RrhPyCs2SsL58YcQF/g+PpeT9geZ+oyZ/4IQ+TWJoU
 PNHndk8VBTpzrmOaJxrebNL/W6C8JCmbLM11TAUMmHYi9JDytN8Au78hWpDbIdKwg1LeSxpw
 ZZD/OqOc0DBvHOpQhzkSrtR1lVlDV/+9E8J1T4uDhrGmZwYV+4xQetypHax8aAHisYbjXdVa
 8CS2NxU=
Message-ID: <bf2018b2-a404-0880-2c29-01b44a127db7@gmail.com>
Date: Wed, 10 Jun 2020 07:30:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610070458.10008-1-bunk@stusta.de>
Content-Type: multipart/alternative;
 boundary="------------C089B4F6084CC167A0183112"
Content-Language: en-US

--------------C089B4F6084CC167A0183112
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 6/10/20 12:04 AM, Adrian Bunk wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> [ python3-docutils was already in the Yocto 3.1 release of OE-core ]
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---

I am fast tracking this one. its in dunfell-next with my next bundle of
changes.

-armin
>  .../python/python3-docutils_0.15.2.bb             | 15 ---------------
>  1 file changed, 15 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb b/meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb
> deleted file mode 100644
> index 321f55572..000000000
> --- a/meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY = "Text processing system for documentation"
> -HOMEPAGE = "http://docutils.sourceforge.net"
> -SECTION = "devel/python"
> -LICENSE = "PSF & BSD-2-Clause & GPLv3"
> -LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
> -
> -inherit pypi setuptools3
> -
> -PYPI_PACKAGE = "docutils"
> -
> -SRC_URI[md5sum] = "e26a308d8000b0bed7416a633217c676"
> -SRC_URI[sha256sum] = "a2aeea129088da402665e92e0b25b04b073c04b2dce4ab65caaa38b7ce2e1a99"
> -
> -BBCLASSEXTEND = "native"
> -
>
> 


--------------C089B4F6084CC167A0183112
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 6/10/20 12:04 AM, Adrian Bunk wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200610070458.10008-1-bunk@stusta.de">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
[ python3-docutils was already in the Yocto 3.1 release of OE-core ]
Signed-off-by: Adrian Bunk <a class="moz-txt-link-rfc2396E" href="mailto:bunk@stusta.de">&lt;bunk@stusta.de&gt;</a>
---</pre>
    </blockquote>
    <br>
    I am fast tracking this one. its in dunfell-next with my next bundle
    of changes.<br>
    <br>
    -armin<br>
    <blockquote type="cite"
      cite="mid:20200610070458.10008-1-bunk@stusta.de">
      <pre class="moz-quote-pre" wrap="">
 .../python/python3-docutils_0.15.2.bb             | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb b/meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb
deleted file mode 100644
index 321f55572..000000000
--- a/meta-python/recipes-devtools/python/python3-docutils_0.15.2.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Text processing system for documentation"
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://docutils.sourceforge.net">"http://docutils.sourceforge.net"</a>
-SECTION = "devel/python"
-LICENSE = "PSF &amp; BSD-2-Clause &amp; GPLv3"
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106">"file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"</a>
-
-inherit pypi setuptools3
-
-PYPI_PACKAGE = "docutils"
-
-SRC_URI[md5sum] = "e26a308d8000b0bed7416a633217c676"
-SRC_URI[sha256sum] = "a2aeea129088da402665e92e0b25b04b073c04b2dce4ab65caaa38b7ce2e1a99"
-
-BBCLASSEXTEND = "native"
-
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------C089B4F6084CC167A0183112--
