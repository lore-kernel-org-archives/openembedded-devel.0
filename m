Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web12.6601.1601504154156439107
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M65UbTvZ;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: chaoscodecircuits@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id z18so1818535qvp.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2020 15:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=EBChBYe5XjJQ/OrEhzDaQtsX3s616WJq3RSO4nGyxcY=;
        b=M65UbTvZZrrTO+wnQJJLGR15OOtOtPb2HXzyC26DqWg77XgZYI7z/VF7Q+NxLe3V4k
         oEugfy35xeZ3lizpK7NffWoiUQ5/gPbV17ulVyD7zkbS5RNszpQnA9HODQS8OzUor0z/
         Q8sQ5A1HE3SoYzm5SdiWGa3ty3pbt2tj/zH6Hqv5KqlcLBEm8yUueEiq57YgbGIavEKK
         U2n+u+njUvPv6bJ47QVhBBOE89W5TBLyM7i4J3EzBxpCrkxwy9mGVrf46l34Is00tRtR
         +2iIiEcfs5UWhf6pYEhzefJvabJaLdC/pcKDnU+FHjgHA4jYt1CkX87eymLdFcuNL/Yl
         KpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=EBChBYe5XjJQ/OrEhzDaQtsX3s616WJq3RSO4nGyxcY=;
        b=FlxCzyHa5LGKFnx7/a9FgnL8AV8DQPUJ3GnCpfUsuveYylp3xbxpvLvxbZN8hRAViz
         gLB0kIrXNmy6NA/QdM3WAOCvk6te5zZSt/0nBb5gG0/9Zuiu2UjgcfvZ8YX5BcB/OhnW
         qUi9vM5B3dplPy3mQ3kXXgyaFUaDN72JAd6ykNyPcU+YamYB+pYp9W3aE0OxIjxT3yEo
         ltBRuE2UzWeNssbR21+0XwEizeuZtyo57p/2l10J3Kl2CKpE618k+7VqYc0PQsKhPykn
         gY3suQA5HvwS9GgGy6wItIy94xydvodPhrbfeP0PIZx2MjHqI97prOU2BMF5fIxGLlDW
         5pJg==
X-Gm-Message-State: AOAM531YSfn0lDhMMOuU/oANN40EIoo7lwmDfLg06R90iLdr1Xsufj6U
	GhzbPiLWJxHZpVaO/1NKTSOHfRAozJlcKQ==
X-Google-Smtp-Source: ABdhPJwhsYvO7lmgKlgv7JNK5w0uMII3G3KL9Brqq0UeTLpx4uOs9tdV3ivB6h9VCRi2juvg3P+79w==
X-Received: by 2002:a05:6214:bd1:: with SMTP id ff17mr4590919qvb.59.1601504153054;
        Wed, 30 Sep 2020 15:15:53 -0700 (PDT)
Return-Path: <chaoscodecircuits@gmail.com>
Received: from [192.168.0.55] (CPE64777de11593-CM64777de11590.cpe.net.cable.rogers.com. [174.115.236.231])
        by smtp.gmail.com with ESMTPSA id h18sm3827314qkl.12.2020.09.30.15.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 15:15:52 -0700 (PDT)
Subject: Re: [oe] [meta-python][PATCH 1/6] python3-pychromecast: Upgrade 7.3.0 -> 7.5.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200928080059.18929-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <chaoscodecircuits@gmail.com>
Message-ID: <3d911798-f9bf-1961-8ec0-37e9234f2458@gmail.com>
Date: Wed, 30 Sep 2020 18:15:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200928080059.18929-1-leon.anavi@konsulko.com>
Content-Type: multipart/alternative;
 boundary="------------5E48B3D47D84EB6E575315C7"
Content-Language: en-US

--------------5E48B3D47D84EB6E575315C7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/28/20 4:00 AM, Leon Anavi wrote:
> Upgrade to release 7.5.0:
>
> - Allow passing additional media information through to play_media
> - Add support for lists, playQueues, and playlists on Plex
>    controller
> - Misc spelling changes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...n3-pychromecast_7.3.0.bb => python3-pychromecast_7.5.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pychromecast_7.3.0.bb => python3-pychromecast_7.5.0.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.3.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.5.0.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-pychromecast_7.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-pychromecast_7.5.0.bb
> index b444df05d8..adfdbb17b8 100644
> --- a/meta-python/recipes-devtools/python/python3-pychromecast_7.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.5.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
>   
> -SRC_URI[md5sum] = "7ab862743ff33dafc93206c1435abc5e"
> -SRC_URI[sha256sum] = "f594231efb34b86eeb463611662bca21a6962793885d3ad68195286940f7473d"
> +SRC_URI[md5sum] = "d35c610f57cae909348ff6c60e5e9256"
> +SRC_URI[sha256sum] = "2f346a88ddc27a19cc68bc2d3e8929d89276298cb1c11871b82a87fbdafb95a8"
>   
>   PYPI_PACKAGE = "PyChromecast"
>   
>
> 
>

--------------5E48B3D47D84EB6E575315C7
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
      cite="mid:20200928080059.18929-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 7.5.0:

- Allow passing additional media information through to play_media
- Add support for lists, playQueues, and playlists on Plex
  controller
- Misc spelling changes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite"
      cite="mid:20200928080059.18929-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...n3-pychromecast_7.3.0.bb =&gt; python3-pychromecast_7.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.3.0.bb =&gt; python3-pychromecast_7.5.0.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.3.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.5.0.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.5.0.bb
index b444df05d8..adfdbb17b8 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.5.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/balloob/pychromecast">"https://github.com/balloob/pychromecast"</a>
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5">"file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"</a>
 
-SRC_URI[md5sum] = "7ab862743ff33dafc93206c1435abc5e"
-SRC_URI[sha256sum] = "f594231efb34b86eeb463611662bca21a6962793885d3ad68195286940f7473d"
+SRC_URI[md5sum] = "d35c610f57cae909348ff6c60e5e9256"
+SRC_URI[sha256sum] = "2f346a88ddc27a19cc68bc2d3e8929d89276298cb1c11871b82a87fbdafb95a8"
 
 PYPI_PACKAGE = "PyChromecast"
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------5E48B3D47D84EB6E575315C7--
