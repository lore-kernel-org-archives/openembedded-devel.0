Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.4373.1594267771649507867
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2020 21:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QkVSJLqe;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id k5so506698pjg.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2020 21:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=YZx+TzU5lfV3scykfWhRpdaXkZo5Gvvbwduvzhy1Vz8=;
        b=QkVSJLqer/xZUxdUf6bndqxP/MtU4wzt0qW/GgL7aVysFoffRsPDXJQiRhWQvGdXUt
         c9nRFp2sy6w3rMyB6I+1pD4EIvymMpAXfUVsxE4gGWdwFHcJ/ehVZBo5DcnaMH5qzq7S
         SyvjAIbcl8DTmts/QAklYm00BXQkcrO29cZi9px2CVm/0XqKqcwoqI8SPTt6T7jhztUp
         3uxaKXGyho+mAr9CMP4UVosa+YiN7iHzg/NPQpG5zB8am2eLA9E2HBY0XarTWq0aBxBs
         CKbgadgNgR0xG/nf5gsV89JUFBCSaq0W9D5qkFebadDiIAAS7vgc+fpRevQ33vvwx2ZX
         KBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=YZx+TzU5lfV3scykfWhRpdaXkZo5Gvvbwduvzhy1Vz8=;
        b=sEZeYKXDIKh3wPGRYSeoQ5lin3rcXq0t4t3Don+OsRsaqBSPOav6FbqOCNMZbxJBMf
         JnFKAY2WAJEBnWgJvWVcXHPax9LcQhkVyQNcbZqLT5tatRhMUe8ruMPPbDzYtt0caOTe
         h9hqeQ8jslzqFC7t6Rx5KPm++kz/yPiK1WQTvAKpU3pPuDE+I4KAHdOlNBSSJDwbgK+s
         qp0hclKIsr17fVa5TSJkmk6q1UgvDFPMYfq+IhMscnFzXyvMEbU8l3UT6jwSCYRqzmyG
         2HtX3P51QE3DfapV2MQsHC/6zR/hS4CkdzimZYJfWdbKs1T+SLeWLRuid0LzK2GoqmZu
         BMCA==
X-Gm-Message-State: AOAM531+l0CbnKXiHR/KjAQwXUz1DpDYMSywBRdgTKvzIQ3D4V0HYjqn
	7a2OKSFmkaJ9sKzfNh3h/+wUTnbwvRc=
X-Google-Smtp-Source: ABdhPJw0L0lFHo8SaeuUUusdjDkv4pjgrTGC8rpafMYBHBQzBHA6usQ0srl2ECwNwecTEJxsbs9xXg==
X-Received: by 2002:a17:90b:4a4e:: with SMTP id lb14mr3944457pjb.196.1594267770963;
        Wed, 08 Jul 2020 21:09:30 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:e0fc:4d03:5c6c:3dcd? ([2601:202:4180:a5c0:e0fc:4d03:5c6c:3dcd])
        by smtp.gmail.com with ESMTPSA id a9sm1140430pfr.103.2020.07.08.21.09.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 21:09:30 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH] wireshark: Update to 3.2.5
To: openembedded-devel@lists.openembedded.org
References: <161FF9FDDACCB434.28661@lists.openembedded.org>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <9c64f730-e0cd-49a8-f2d1-88e7885a4191@gmail.com>
Date: Wed, 8 Jul 2020 21:09:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <161FF9FDDACCB434.28661@lists.openembedded.org>
Content-Type: multipart/alternative;
 boundary="------------E88C21ADAB69D9A3B0746653"
Content-Language: en-US

--------------E88C21ADAB69D9A3B0746653
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

ignore this one.

miss fire, forgot to apply a patch before sending

-armin

On 7/8/20 9:07 PM, akuster via lists.openembedded.org wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> Source: wireshark.org
> MR: 104620
> Type: Security Fix
> Disposition: Backport from wireshark.org
> ChangeID: 64e3701e4d6bd53972c22c49d655556e6f37e461
> Description:
>
> Affects: 3.2.0 to 3.2.4
>
> Includes:
> CVE-2020-15466
>
> For more info see: https://www.wireshark.org/docs/relnotes/wireshark-3.2.5.html
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../wireshark/{wireshark_3.2.4.bb => wireshark_3.2.5.bb}       | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta-networking/recipes-support/wireshark/{wireshark_3.2.4.bb => wireshark_3.2.5.bb} (95%)
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
> similarity index 95%
> rename from meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb
> rename to meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
> index c3caaefde9..a6c09d47ba 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
> @@ -12,8 +12,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
>  
>  UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
>  
> -SRC_URI[md5sum] = "4bbee1bdd5b88343733590fabfffddf3"
> -SRC_URI[sha256sum] = "d17d461e849e2d0b033431c45f71d8ee8ec3c8faa232a6ad63069a47927db8aa"
> +SRC_URI[sha256sum] = "bd89052a5766cce08b1090df49628567e48cdd24bbaa47667c851bac6aaac940"
>  
>  PE = "1"
>  
>
> 


--------------E88C21ADAB69D9A3B0746653
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    ignore this one. <br>
    <br>
    miss fire, forgot to apply a patch before sending<br>
    <br>
    -armin<br>
    <br>
    <div class="moz-cite-prefix">On 7/8/20 9:07 PM, akuster via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:161FF9FDDACCB434.28661@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster@mvista.com">&lt;akuster@mvista.com&gt;</a>

Source: wireshark.org
MR: 104620
Type: Security Fix
Disposition: Backport from wireshark.org
ChangeID: 64e3701e4d6bd53972c22c49d655556e6f37e461
Description:

Affects: 3.2.0 to 3.2.4

Includes:
CVE-2020-15466

For more info see: <a class="moz-txt-link-freetext" href="https://www.wireshark.org/docs/relnotes/wireshark-3.2.5.html">https://www.wireshark.org/docs/relnotes/wireshark-3.2.5.html</a>

Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster@mvista.com">&lt;akuster@mvista.com&gt;</a>
---
 .../wireshark/{wireshark_3.2.4.bb =&gt; wireshark_3.2.5.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.2.4.bb =&gt; wireshark_3.2.5.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
index c3caaefde9..a6c09d47ba 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.4.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.5.bb
@@ -12,8 +12,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xzUPSTREAM_CHECK_URI=">"https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "</a>https://1.as.dl.wireshark.org/src"
 
-SRC_URI[md5sum] = "4bbee1bdd5b88343733590fabfffddf3"
-SRC_URI[sha256sum] = "d17d461e849e2d0b033431c45f71d8ee8ec3c8faa232a6ad63069a47927db8aa"
+SRC_URI[sha256sum] = "bd89052a5766cce08b1090df49628567e48cdd24bbaa47667c851bac6aaac940"
 
 PE = "1"
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------E88C21ADAB69D9A3B0746653--
