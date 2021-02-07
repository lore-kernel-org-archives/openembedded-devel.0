Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web12.15986.1612666526311396213
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 18:55:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=hyfs7Q0r;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.67, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f67.google.com with SMTP id f1so16885013lfu.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 18:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=85782QazjeDq7Pz7MTDZqFen+irZhiV8XsVWI8caEIM=;
        b=hyfs7Q0rZ2s/G9HHL8sFI8TcEdL8oujwxuQovbIQhegJfX6Gc9XwbK3kJ0lRF5PzGG
         xmL0QZJH0vMeku8Jjb6O06ARsBFxe+VP5JifD1KGDVGL0mSbQhSF/Qmj3csH7Q8s29HG
         8h1O5Wn9cNVuIIOppaIJVEUPLe/UGRL+QMpW3S5Rhm3T/c1SAZCE8NqEoXh+mWhEPnUl
         TNGdKS0Qvlne9h7X/g/tODa7tDIywX8ORuKkNGE9L8Lcs18O07bKWLB23H+1I5R5oVar
         pL6FqMfCBTO4jqrD/pkZO6WQMVII7xdQB3fYTsE4QXHiikjLlE/zLgPXUC1TId8RX3u4
         6ziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=85782QazjeDq7Pz7MTDZqFen+irZhiV8XsVWI8caEIM=;
        b=hXUl0QsLLAy867hxmxpylavq1jaSLvwR3qFcXQyhOnwTCwgHp0JmxUKvFtCxyUQWlQ
         osvgEb9ZTw6ohuLDegqfVqEsX2fZX1K6fIDYqKj3vMi/fwlO5PaLMDBXxQnkpYvdg0oK
         l2x735LxT7G8UdFgFw00DzS+29SGbHm3jJK3SM6KkCdRKsbVVUMEDXQ5oA9g06+reNmF
         gq2Uq4BEQhgtJY5fQ8yu/FJY+19dA8Xqqk0rm8aDHH7Uf87wYIlI3AwLQmRfxApucxwU
         bT4OkejtDLWlWsB6soTNd+1mInH1Fsg/3n4F/QxB5I3l0LjTZ+s1IDNYaEybOwLxnbTP
         3qpA==
X-Gm-Message-State: AOAM531kf7JeyqeoBXqx33xdrHFPhxQAui6Z6PrkDnHOsNzMa3Nrc2AV
	pwjiPgta6tWcF4bo9fbP5/BKQpF4k+mKNFWq
X-Google-Smtp-Source: ABdhPJzC5JOrinMYPLkGTUMeKKvcypL655HI1jC/M7QBIdeXEqLRUEinbzuJ1Koc9N0bp/lvaaQeoQ==
X-Received: by 2002:a05:6512:6cc:: with SMTP id u12mr6659472lff.381.1612666523492;
        Sat, 06 Feb 2021 18:55:23 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from [192.168.0.8] (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id f29sm1530691lfj.47.2021.02.06.18.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Feb 2021 18:55:22 -0800 (PST)
Subject: Re: [oe] [PATCH][meta-oe] cereal: update to 1.3.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20210206174155.2670243-1-open.source@oleksandr-kravchuk.com>
 <CAMKF1sqmbanbwmvYMtff1R6N0P8TpjEHeyhiDPX4RbzXYiajuA@mail.gmail.com>
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
Message-ID: <28cd3b22-fe90-17e2-cbf5-754114933c45@oleksandr-kravchuk.com>
Date: Sun, 7 Feb 2021 03:55:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqmbanbwmvYMtff1R6N0P8TpjEHeyhiDPX4RbzXYiajuA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------132F22800FFFDF401D5CB5D0"
Content-Language: en-US

--------------132F22800FFFDF401D5CB5D0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Absolutely. What should the recipe actually be called?

On 06/02/2021 19:04, Khem Raj wrote:
> Thanks for patch we also have libcereal in meta-Oe can you merge 
> changes from that recipe here as well and then delete the other 
> libcereal recipe
>
> On Sat, Feb 6, 2021 at 9:42 AM Oleksandr Kravchuk 
> <open.source@oleksandr-kravchuk.com 
> <mailto:open.source@oleksandr-kravchuk.com>> wrote:
>
>     Signed-off-by: Oleksandr Kravchuk
>     <open.source@oleksandr-kravchuk.com
>     <mailto:open.source@oleksandr-kravchuk.com>>
>     ---
>      .../cereal/{cereal_1.0.bb <http://cereal_1.0.bb> =>
>     cereal_1.3.0.bb <http://cereal_1.3.0.bb>}                | 4 ++--
>      1 file changed, 2 insertions(+), 2 deletions(-)
>      rename meta-oe/recipes-devtools/cereal/{cereal_1.0.bb
>     <http://cereal_1.0.bb> => cereal_1.3.0.bb
>     <http://cereal_1.3.0.bb>} (92%)
>
>     diff --git a/meta-oe/recipes-devtools/cereal/cereal_1.0.bb
>     <http://cereal_1.0.bb>
>     b/meta-oe/recipes-devtools/cereal/cereal_1.3.0.bb
>     <http://cereal_1.3.0.bb>
>     similarity index 92%
>     rename from meta-oe/recipes-devtools/cereal/cereal_1.0.bb
>     <http://cereal_1.0.bb>
>     rename to meta-oe/recipes-devtools/cereal/cereal_1.3.0.bb
>     <http://cereal_1.3.0.bb>
>     index dd3dc189d..a4b7f3432 100644
>     --- a/meta-oe/recipes-devtools/cereal/cereal_1.0.bb
>     <http://cereal_1.0.bb>
>     +++ b/meta-oe/recipes-devtools/cereal/cereal_1.3.0.bb
>     <http://cereal_1.3.0.bb>
>     @@ -18,7 +18,7 @@ SRC_URI = " \
>      file://0001-add-license-files-for-components-of-cereal.patch \
>      "
>
>     -SRCREV = "48fda3f0a6b58f9a9278ec15c15e7b7c3dceeceb"
>     +SRCREV = "02eace19a99ce3cd564ca4e379753d69af08c2c8"
>
>      EXTRA_OECMAKE += "\
>          -DCEREAL_INSTALL=TRUE \
>     @@ -32,5 +32,5 @@ PROVIDES += "${PN}-dev"
>      FILES_${PN}-dev = " \
>          ${includedir} \
>          ${libdir} \
>     +    ${datadir}/cmake \
>      "
>     -
>     -- 
>     2.25.1
>
>
>     
>

--------------132F22800FFFDF401D5CB5D0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Absolutely. What should the recipe actually be called?<br>
    </p>
    <div class="moz-cite-prefix">On 06/02/2021 19:04, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1sqmbanbwmvYMtff1R6N0P8TpjEHeyhiDPX4RbzXYiajuA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="auto">Thanks for patch we also have libcereal in meta-Oe
        can you merge changes from that recipe here as well and then
        delete the other libcereal recipe </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Sat, Feb 6, 2021 at 9:42
            AM Oleksandr Kravchuk &lt;<a
              href="mailto:open.source@oleksandr-kravchuk.com"
              moz-do-not-send="true">open.source@oleksandr-kravchuk.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by:
            Oleksandr Kravchuk &lt;<a
              href="mailto:open.source@oleksandr-kravchuk.com"
              target="_blank" moz-do-not-send="true">open.source@oleksandr-kravchuk.com</a>&gt;<br>
            ---<br>
             .../cereal/{<a href="http://cereal_1.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">cereal_1.0.bb</a>
            =&gt; <a href="http://cereal_1.3.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">cereal_1.3.0.bb</a>} 
                           | 4 ++--<br>
             1 file changed, 2 insertions(+), 2 deletions(-)<br>
             rename meta-oe/recipes-devtools/cereal/{<a
              href="http://cereal_1.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">cereal_1.0.bb</a>
            =&gt; <a href="http://cereal_1.3.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">cereal_1.3.0.bb</a>}
            (92%)<br>
            <br>
            diff --git a/meta-oe/recipes-devtools/cereal/<a
              href="http://cereal_1.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">cereal_1.0.bb</a>
            b/meta-oe/recipes-devtools/cereal/<a
              href="http://cereal_1.3.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">cereal_1.3.0.bb</a><br>
            similarity index 92%<br>
            rename from meta-oe/recipes-devtools/cereal/<a
              href="http://cereal_1.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">cereal_1.0.bb</a><br>
            rename to meta-oe/recipes-devtools/cereal/<a
              href="http://cereal_1.3.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">cereal_1.3.0.bb</a><br>
            index dd3dc189d..a4b7f3432 100644<br>
            --- a/meta-oe/recipes-devtools/cereal/<a
              href="http://cereal_1.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">cereal_1.0.bb</a><br>
            +++ b/meta-oe/recipes-devtools/cereal/<a
              href="http://cereal_1.3.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">cereal_1.3.0.bb</a><br>
            @@ -18,7 +18,7 @@ SRC_URI = " \<br>
               
             <a class="moz-txt-link-freetext" href="file://0001-add-license-files-for-components-of-cereal.patch">file://0001-add-license-files-for-components-of-cereal.patch</a>
            \<br>
             "<br>
            <br>
            -SRCREV = "48fda3f0a6b58f9a9278ec15c15e7b7c3dceeceb"<br>
            +SRCREV = "02eace19a99ce3cd564ca4e379753d69af08c2c8"<br>
            <br>
             EXTRA_OECMAKE += "\<br>
                 -DCEREAL_INSTALL=TRUE \<br>
            @@ -32,5 +32,5 @@ PROVIDES += "${PN}-dev"<br>
             FILES_${PN}-dev = " \<br>
                 ${includedir} \<br>
                 ${libdir} \<br>
            +    ${datadir}/cmake \<br>
             "<br>
            -<br>
            -- <br>
            2.25.1<br>
            <br>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------132F22800FFFDF401D5CB5D0--
