Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web10.11683.1591798490834941540
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 07:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eHBjHQIl;
 spf=pass (domain: gmail.com, ip: 209.85.215.194, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f194.google.com with SMTP id e18so1045793pgn.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2020 07:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=b3TM8EwQzmZBOF0w4wrcBUyEU9CP6lpIRo81DNOO918=;
        b=eHBjHQIlHwuQNFjd5aG7BJi4n5VIH+ddGY3P3fFSWQH3tXU7IZpfyPcWhnHbpJM9dk
         W5caw9yU8mqhR/f33uHI9zN7OrZZZHlTn35tsMfGXieoXveZi+DoojeqGmV1CQRs2Qhw
         wT2+SXjMRFu2YGFTpHisfXNnwrZ4scLh3FtYOwmB+naQhpXowXOHdlRKyTJjfbsBgEUh
         S8aNTBWz2dGw5phQ0AHenjr8w0hChcZVB6CT0hjC62QAZflyFngAUvav84D0V4MYmSLL
         vR4+gGmH0/uqN7y8RNBCRor8q6d6ZId9TpWRNHa2igx/XjizJ0qk7Xppn5aoviT+43n1
         arhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=b3TM8EwQzmZBOF0w4wrcBUyEU9CP6lpIRo81DNOO918=;
        b=J2bS1oLDS72CzMqm3veQU4OFl400ESq+AE+luu5MKNi1OoxlyHxDYmCk/ftG171VVT
         5rfGb2v1Y0XFVTwa8JcrWijFc2O5cwJpcX4F8HDHWoWMU23gTvyCSPjCRPisMKr5g1uN
         eoa3CLTzMwa71QFAFSennqfybIqTFt0p1oPG3xJ9yFQIK/Q8kGzc/Z6FZWyA5nnWkeA6
         NNkts1fRwoIqdb/ubuPSOeVFzqZZrbfBiivlCTkzcTCb9DFJJ43zG4k5KAMeqiLVdk7s
         U9UfF3AAw43aMYyly4WLqWZh6I/wg73JVnlcE+ykk88/QlZdyP6oX6VXT5YZE/CXozc9
         X7sQ==
X-Gm-Message-State: AOAM53155yLWJXtBWHZAkQp77SleCtcUccr0+/smXXEN/H1pCZfjPT5u
	eDFueBeYLR4u9fJRj8I6X2A8SWYk
X-Google-Smtp-Source: ABdhPJys2NXW0J3M2gtk28xObLikmkpNAVRZoqv/1QoWwr68EjSUEk47XltNK0U+ZTTxUatFr8WwBw==
X-Received: by 2002:a63:a19:: with SMTP id 25mr2749852pgk.98.1591798490023;
        Wed, 10 Jun 2020 07:14:50 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:254a:4327:67e1:d5be? ([2601:202:4180:a5c0:254a:4327:67e1:d5be])
        by smtp.gmail.com with ESMTPSA id a3sm106317pfi.77.2020.06.10.07.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 07:14:49 -0700 (PDT)
Subject: Re: [oe] [meta-oe][dunfell][PATCH] gpsd: mark CLEANBROKEN
To: Adrian Bunk <bunk@stusta.de>, openembedded-devel@lists.openembedded.org
References: <20200610070254.9851-2-bunk@stusta.de>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <28d6cdd6-fdbb-9351-da8f-0abf83318a6b@gmail.com>
Date: Wed, 10 Jun 2020 07:14:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610070254.9851-2-bunk@stusta.de>
Content-Type: multipart/alternative;
 boundary="------------D6321A342ED754B1EE03BFF5"
Content-Language: en-US

--------------D6321A342ED754B1EE03BFF5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 6/10/20 12:02 AM, Adrian Bunk wrote:
> From: Sean Nyekjaer <sean@geanix.com>
>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
> index f74ebda5f..05fbed622 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
> @@ -23,6 +23,8 @@ SYSTEMD_OESCONS = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'f
>  export STAGING_INCDIR
>  export STAGING_LIBDIR
>  
> +CLEANBROKEN = "1"

So this affects the version in dunfell?
> +
>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} usb"
>  PACKAGECONFIG[bluez] = "bluez='true',bluez='false',bluez5"
>  PACKAGECONFIG[qt] = "qt='yes' qt_versioned=5,qt='no',qtbase"
>
> 


--------------D6321A342ED754B1EE03BFF5
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
      cite="mid:20200610070254.9851-2-bunk@stusta.de">
      <pre class="moz-quote-pre" wrap="">From: Sean Nyekjaer <a class="moz-txt-link-rfc2396E" href="mailto:sean@geanix.com">&lt;sean@geanix.com&gt;</a>

Signed-off-by: Sean Nyekjaer <a class="moz-txt-link-rfc2396E" href="mailto:sean@geanix.com">&lt;sean@geanix.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
Signed-off-by: Adrian Bunk <a class="moz-txt-link-rfc2396E" href="mailto:bunk@stusta.de">&lt;bunk@stusta.de&gt;</a>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
index f74ebda5f..05fbed622 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.19.bb
@@ -23,6 +23,8 @@ SYSTEMD_OESCONS = <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('DISTRO_FEATURES','systemd','true','fexportSTAGING_INCDIRexportSTAGING_LIBDIR+CLEANBROKEN=">"${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'f
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
+CLEANBROKEN = "</a>1"</pre>
    </blockquote>
    <br>
    So this affects the version in dunfell?<br>
    <blockquote type="cite"
      cite="mid:20200610070254.9851-2-bunk@stusta.de">
      <pre class="moz-quote-pre" wrap="">
+
 PACKAGECONFIG ??= <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('DISTRO_FEATURES','bluetooth','bluez','',d)}usb">"${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} usb"</a>
 PACKAGECONFIG[bluez] = "bluez='true',bluez='false',bluez5"
 PACKAGECONFIG[qt] = "qt='yes' qt_versioned=5,qt='no',qtbase"
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------D6321A342ED754B1EE03BFF5--
