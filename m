Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.6522.1601504043082143294
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SP4afTX+;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: chaoscodecircuits@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id c62so3254846qke.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2020 15:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=Aqi3/tdp9b/vbtk4ozJ01XUrxkzemtwDm1J4MliYgfs=;
        b=SP4afTX+5VhhUj3tKhR4fgId59JEZF34d8AYpZVGV7aeh0FhX3M6g9KCGPB4xsHqP+
         r7aY4d9wF8CliBgGylTGKfe3N2KNI8zibDUQ6Y1qbJ+3aJcN/J2gpUiAPY73efoG6jIT
         jencRVo8TSXMRclfK6OHFImzgV0DjKj8iCcIx0qk1cln1uneiSX3wiHow9H85WUTdzHy
         jfGGfpOqlSZ5vCMqKzba6fEnCAGsLjDN5sTH7ysQldAhs2al3QaROkpjfPMZCaJQx/L4
         OFV7WPAkLh+yvaqILQqbE/FMCHAwqJxgfKf7Hcg/cC/MbXzlOMFfQ7YQl/UYJzqROa+v
         TLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=Aqi3/tdp9b/vbtk4ozJ01XUrxkzemtwDm1J4MliYgfs=;
        b=E8uhe7lKsj2ci6Bcjbm1fcWyhzrQzuhUt0tzPjaqefUdFdUyqb8PTjyZRT5jjb+kzE
         WzkoA1HgLjFVsG6Ysrgq7QNWP9p/47Zj2BT4ocPcnpFIqRYEbLx3009ToHeVbcbE9GNu
         lSvb+17myM00Ae1h+TPgdmyl9iDPuzuZ/LqZzDKKTAlCm6sd4qLozG3bSB1wdm8rwLyG
         ug6m5ds1pIODGQ6jpFu8CIPEwKQKKN4NJzf5oJRV0tVdBBaxqXihACzG83OMp5mV+8Gp
         1INwVoZtGS/YKkusDTEW374oMmT6Iav605ICU8+v8e60Xw4xKdItvA0GiTsmnEjbU0Qr
         eJsw==
X-Gm-Message-State: AOAM532sSlwqK5gH/KJA1W7G3eVUcCYOQJwY4RERL2Kg2ZwMoPm7YXS9
	sEkCDPKCylb/Wydy50kZH1Q=
X-Google-Smtp-Source: ABdhPJzyW9I6PVWa0c0ZQVBdpkUU3QAULUEuPyOhtALsQJTUgMQ7pSMZMd2xqYZSOWQl7UF1Gfq2zw==
X-Received: by 2002:a37:a187:: with SMTP id k129mr4828354qke.147.1601504042241;
        Wed, 30 Sep 2020 15:14:02 -0700 (PDT)
Return-Path: <chaoscodecircuits@gmail.com>
Received: from [192.168.0.55] (CPE64777de11593-CM64777de11590.cpe.net.cable.rogers.com. [174.115.236.231])
        by smtp.gmail.com with ESMTPSA id g45sm4270810qtb.60.2020.09.30.15.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 15:14:01 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH v2 1/2] python3-iniconfig: add recipe
To: kai <kai.kang@windriver.com>, raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org, ticotimo@gmail.com
References: <20200927084320.17334-1-kai.kang@windriver.com>
 <20200927084320.17334-2-kai.kang@windriver.com>
From: chaoscodecircuits@gmail.com
Message-ID: <86400718-b6c8-97ab-a9cf-3c7067a12d26@gmail.com>
Date: Wed, 30 Sep 2020 18:14:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200927084320.17334-2-kai.kang@windriver.com>
Content-Type: multipart/alternative;
 boundary="------------E866A8D997EF72C719BE3FD6"
Content-Language: en-US

--------------E866A8D997EF72C719BE3FD6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/27/20 4:43 AM, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> python3-iniconfig is required by pytest 6.1.0. And add it to
> packagegroup-meta-python.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../packagegroups/packagegroup-meta-python.bb             | 1 +
>   .../recipes-devtools/python/python3-iniconfig_1.0.1.bb    | 8 ++++++++
>   2 files changed, 9 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 582037be5..0f032e65e 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -302,6 +302,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>       python3-sdnotify \
>       python3-pycodestyle \
>       python3-pytest \
> +    python3-iniconfig \
>       python3-speaklater \
>       python3-wtforms \
>       python3-speedtest-cli \
> diff --git a/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb b/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
> new file mode 100644
> index 000000000..9ed0e033b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
> @@ -0,0 +1,8 @@
> +SUMMARY = "A small and simple INI-file parser module"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
> +
> +SRC_URI[sha256sum] = "e5f92f89355a67de0595932a6c6c02ab4afddc6fcdc0bfc5becd0d60884d3f69"
> +
> +inherit pypi setuptools3
>
> 
>

--------------E866A8D997EF72C719BE3FD6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/27/20 4:43 AM, kai wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200927084320.17334-2-kai.kang@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

python3-iniconfig is required by pytest 6.1.0. And add it to
packagegroup-meta-python.

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite"
      cite="mid:20200927084320.17334-2-kai.kang@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../packagegroups/packagegroup-meta-python.bb             | 1 +
 .../recipes-devtools/python/python3-iniconfig_1.0.1.bb    | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 582037be5..0f032e65e 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -302,6 +302,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-sdnotify \
     python3-pycodestyle \
     python3-pytest \
+    python3-iniconfig \
     python3-speaklater \
     python3-wtforms \
     python3-speedtest-cli \
diff --git a/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb b/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
new file mode 100644
index 000000000..9ed0e033b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
@@ -0,0 +1,8 @@
+SUMMARY = "A small and simple INI-file parser module"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9">"file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"</a>
+
+SRC_URI[sha256sum] = "e5f92f89355a67de0595932a6c6c02ab4afddc6fcdc0bfc5becd0d60884d3f69"
+
+inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------E866A8D997EF72C719BE3FD6--
