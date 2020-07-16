Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.20354.1594919369457735241
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2020 10:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=J4Flhenv;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.214.179, mailfrom: akuster@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id k4so4128301pld.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2020 10:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=It1F3rzRGDuNCwNPY002H31/3nQ6LNW2yPh7T7V8iX0=;
        b=J4Flhenv8FGpINVRKt82L8c9H7NwarpUFPzGbsdcxfvnNZb32D9e2KSQ3OHZx1fQDI
         oAaTgdF6YupG92/osI+Wi+2rrOlJ8aToF2XJ93yoMQQP1iF38WJDZ0nNJHhA/64xMEE1
         r62MWgIOpn5A8OG7FVOC6AmUHcI2T53Ynetl+wNcXi5+SCp+Fs0JFIQ9Nb5ooCDQHlLd
         l9Jxfaldgdyq/mqKH1+5GTLzF8uOSjB3kImXX7SlkDJqzCEggfIPon8CZAYNQdOSlXN0
         izTResM+jR8f0+6Ov6cqZFnDVlc6u3xug3ya/RdgdlJwIjPG2lPwqC/trUwwtY5fQxf4
         mj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language;
        bh=It1F3rzRGDuNCwNPY002H31/3nQ6LNW2yPh7T7V8iX0=;
        b=ZPobbpRNXnaNqaAIqBk7cQLyuqC7RQT8rKMKiOpTZ1OLZ9MnWRuBv8qfb7zYF64mwC
         yNr3Fb6Gu/xqNxqNuMq+E9POUp4nR9vmB1c/nC+XFXPxhZ4lHxXAzzfAo1dkbPDrP0uK
         UFgyUGOxzMgOJLM2RBRwkOwYMT4xCB5ioCe0Q1X3hNSdCa1OD4ENul2+WMM681AvFhH/
         H01d2ywz+G61trfq0Z9CmQAXbNnR8Up/EvGDJjUeRKf1W+0TRnQUjuhr4KUMd2+5IAOw
         Sv4iBF04AdRkX/NAWmibIOOeHsA4E3GKFCgiFvkKEDnv0r6Q4XkMi45q+u2GdoahRfeR
         OfNQ==
X-Gm-Message-State: AOAM5302e4tibrWleBgcSf4oKw2Z8f3spbtnsydB7I4ctctSntdaHsQ5
	wiNljksA10FLbufo86kpNl568CGKUok=
X-Google-Smtp-Source: ABdhPJx26iFSxw1n62pMyqMeQI2loEQt1UVOWmAiCUSRRFOzO3SQM7D2UvBMTjHGVfjFZY4JEFfRLQ==
X-Received: by 2002:a17:902:8ec7:: with SMTP id x7mr4328029plo.111.1594919368511;
        Thu, 16 Jul 2020 10:09:28 -0700 (PDT)
Return-Path: <akuster@mvista.com>
Received: from ?IPv6:2601:202:4180:a5c0:7df4:7f73:717d:af68? ([2601:202:4180:a5c0:7df4:7f73:717d:af68])
        by smtp.gmail.com with ESMTPSA id q6sm5448333pfg.76.2020.07.16.10.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2020 10:09:27 -0700 (PDT)
Subject: Re: [oe] [PATCH] net-snmp, openjpeg: add proper CVE tags to patches
To: Matthew <matthew.zeng@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20200715174339.20901-1-matthew.zeng@windriver.com>
From: "Armin Kuster" <akuster@mvista.com>
Autocrypt: addr=akuster@mvista.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <7b3af388-7100-a068-73fc-060c9e03e89c@mvista.com>
Date: Thu, 16 Jul 2020 10:09:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715174339.20901-1-matthew.zeng@windriver.com>
Content-Type: multipart/alternative;
 boundary="------------BAB89D456057B0706A8EECC8"
Content-Language: en-US

--------------BAB89D456057B0706A8EECC8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 7/15/20 10:43 AM, Matthew wrote:
> Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
> ---
>  .../recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch  | 4 +++-
>  .../recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch    | 4 ++++
>  .../recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch    | 4 ++++
>  3 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch
> index 3e2637eaa..ec1b6de8f 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch
> @@ -8,9 +8,11 @@ This patch fixes https://sourceforge.net/p/net-snmp/bugs/2956/.
>
>  Upstream-Status: Backport
>  [ak: fixup for 5.8 context, changes to library/snmpusm.h]
> -CVE:CVE-2019-20892
> +
> +CVE: CVE-2019-20892

Thanks for fixing this.
>
>  Signed-off-by: Armin Kuster <akuster@mvista.com>
> +Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
>
>  ---
>   snmplib/snmp_client.c | 22 +++----------
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
> index 9f2fc901f..1e14149c8 100644
> --- a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
> +++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
> @@ -4,6 +4,10 @@ Date: Sat, 11 Jan 2020 01:51:19 +0100
>  Subject: [PATCH] opj_j2k_update_image_dimensions(): reject images whose
>   coordinates are beyond INT_MAX (fixes #1228)
>
> +CVE: CVE-2020-6851
> +
> +Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
> +
>  ---
>   src/lib/openjp2/j2k.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch
> index cb250530e..6158601af 100644
> --- a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch
> +++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch
> @@ -6,6 +6,10 @@ Subject: [PATCH] opj_tcd_init_tile(): avoid integer overflow
>  That could lead to later assertion failures.
>
>  Fixes #1231 / CVE-2020-8112
> +
> +CVE: CVE-2020-8112
> +
> +Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
>  ---
>   src/lib/openjp2/tcd.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)
> --
> 2.27.0
>
> 


--------------BAB89D456057B0706A8EECC8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 7/15/20 10:43 AM, Matthew wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200715174339.20901-1-matthew.zeng@windriver.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Mingde (Matthew) Zeng <a class="moz-txt-link-rfc2396E" href="mailto:matthew.zeng@windriver.com">&lt;matthew.zeng@windriver.com&gt;</a>
---
 .../recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch  | 4 +++-
 .../recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch    | 4 ++++
 .../recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch    | 4 ++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch
index 3e2637eaa..ec1b6de8f 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2019-20892.patch
@@ -8,9 +8,11 @@ This patch fixes <a class="moz-txt-link-freetext" href="https://sourceforge.net/p/net-snmp/bugs/2956/">https://sourceforge.net/p/net-snmp/bugs/2956/</a>.

 Upstream-Status: Backport
 [ak: fixup for 5.8 context, changes to library/snmpusm.h]
-CVE:CVE-2019-20892
+
+CVE: CVE-2019-20892</pre>
    </blockquote>
    <br>
    Thanks for fixing this.<br>
    <blockquote type="cite"
      cite="mid:20200715174339.20901-1-matthew.zeng@windriver.com">
      <pre class="moz-quote-pre" wrap="">

 Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster@mvista.com">&lt;akuster@mvista.com&gt;</a>
+Signed-off-by: Mingde (Matthew) Zeng <a class="moz-txt-link-rfc2396E" href="mailto:matthew.zeng@windriver.com">&lt;matthew.zeng@windriver.com&gt;</a>

 ---
  snmplib/snmp_client.c | 22 +++----------
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
index 9f2fc901f..1e14149c8 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-6851.patch
@@ -4,6 +4,10 @@ Date: Sat, 11 Jan 2020 01:51:19 +0100
 Subject: [PATCH] opj_j2k_update_image_dimensions(): reject images whose
  coordinates are beyond INT_MAX (fixes #1228)

+CVE: CVE-2020-6851
+
+Signed-off-by: Mingde (Matthew) Zeng <a class="moz-txt-link-rfc2396E" href="mailto:matthew.zeng@windriver.com">&lt;matthew.zeng@windriver.com&gt;</a>
+
 ---
  src/lib/openjp2/j2k.c | 8 ++++++++
  1 file changed, 8 insertions(+)
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch
index cb250530e..6158601af 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch
@@ -6,6 +6,10 @@ Subject: [PATCH] opj_tcd_init_tile(): avoid integer overflow
 That could lead to later assertion failures.

 Fixes #1231 / CVE-2020-8112
+
+CVE: CVE-2020-8112
+
+Signed-off-by: Mingde (Matthew) Zeng <a class="moz-txt-link-rfc2396E" href="mailto:matthew.zeng@windriver.com">&lt;matthew.zeng@windriver.com&gt;</a>
 ---
  src/lib/openjp2/tcd.c | 20 ++++++++++++++++++--
  1 file changed, 18 insertions(+), 2 deletions(-)
--
2.27.0
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------BAB89D456057B0706A8EECC8--
