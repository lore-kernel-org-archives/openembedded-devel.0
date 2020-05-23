Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.1880.1590201834777191726
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 19:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qQejhfqa;
 spf=pass (domain: gmail.com, ip: 209.85.216.68, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f68.google.com with SMTP id 5so5847534pjd.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 19:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=f3jUZip1ss19H0oB4UIfianoX1A0xPRp76EaMWFe6Sk=;
        b=qQejhfqaytmDRH2PHaKJZZvvb6yuiPw718X0A57m2vLK56bka5dUWpiNtJJpLOwhJa
         q4/B/mkOLW5SRz0kEZWh8UTzusEcGmvHIZtuQp+VvrNM2/amYX/YFWti6mZa9dYZ0w9c
         wJCKQZN+fJJUZW61PtcodYaaiZ/1a7dgv2qrKeYV9Z2xFfoxmxPFDgAaZoFOFgKn93Ku
         X51+TZ+XHGNr7BLEaFeWgwwdRdbdYP1I25BZGXfCO53PSEX4dIkRxxWdQ9CwHGnXoolI
         lVLFJZWw5Zn7Q9ULm0y5ed1e4Tqg8hawblmxUTnvEKOyemeUtbGQ6Ziirp0uJDvVlrUD
         JL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=f3jUZip1ss19H0oB4UIfianoX1A0xPRp76EaMWFe6Sk=;
        b=lrkiCKJnzllDM1L2AzToB5Vs1Z3lYFhJXa8wTItUlc84GiIKpJr54G0kk7WMnL+uQF
         IPg6Yybk0/vc272x+gFG0dQX6RKeaM1bt1ghWZlFo/T72901CCdLUUm+WHdIp4xIpsl+
         1JGb2wi0uOKsZoIiyjkiiNzgk/o5xKql0FFc2u6o01sSR1JmprQIyaBOhD445YQ9iM8e
         BeiPHpftmWggZVXH/Y72OLAC1MIWd0KOdv0wPxCZs/RAoyCOsoAWk2yifRsAnWVaK7dW
         xXhvr6BWPmq4zg+GQExxFD4i8CHUYN/xwmY2AS4DA3dj11kFnEb7+2oj960ljFAoawUm
         UqJg==
X-Gm-Message-State: AOAM530JIHUDvZaZL6PbdIEUjjyWAGB8JyvevnPVuNhXIz94NMQUffig
	/zSliv7wbaJk+8wZJPkcot7PL2yY
X-Google-Smtp-Source: ABdhPJx86uhya0CNuTZP+KLdD6t2QoNPZL2YDjEqtGUx9hoUDlgNUC2iV0iykLkKS8igEHNoNAcapA==
X-Received: by 2002:a17:90a:7087:: with SMTP id g7mr8331350pjk.70.1590201834070;
        Fri, 22 May 2020 19:43:54 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:2019:1800:ef81:a76f? ([2601:202:4180:a5c0:2019:1800:ef81:a76f])
        by smtp.gmail.com with ESMTPSA id k27sm7035050pgb.30.2020.05.22.19.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 19:43:53 -0700 (PDT)
Subject: Re: [oe] [master][dunfell][PATCH] tremor: update SRC_URI as project moved to gitlab
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20200523013827.3218-1-akuster808@gmail.com>
 <CAMKF1somJV53JeyRWNpCBvYwOoh7S3-Fms4dGJ9-CGOMB8eWPQ@mail.gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <cb571262-18b9-3924-7e63-c372b6a5b375@gmail.com>
Date: Fri, 22 May 2020 19:43:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1somJV53JeyRWNpCBvYwOoh7S3-Fms4dGJ9-CGOMB8eWPQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------59679027D62B98902D81BC4A"
Content-Language: en-US

--------------59679027D62B98902D81BC4A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 5/22/20 7:21 PM, Khem Raj wrote:
>
>
> On Fri, May 22, 2020 at 6:38 PM akuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     It appears Xiph.Org is not on gitlab
>
>
> Typo not should be now I guess
I ordered more of those letters today.

v2 shortly.

-armin

>
>
>     https://gitlab.xiph.org/xiph
>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>      meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
>     <http://tremor_20180319.bb> | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git
>     a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
>     <http://tremor_20180319.bb>
>     b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
>     <http://tremor_20180319.bb>
>     index 28bb5d924..6abf6080b 100644
>     --- a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
>     <http://tremor_20180319.bb>
>     +++ b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
>     <http://tremor_20180319.bb>
>     @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =
>     "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
>                        
>      file://os.h;beginline=3;endline=14;md5=5c0af5e1bedef3ce8178c89f48cd6f1f"
>      DEPENDS = "libogg"
>
>     -SRC_URI = "git://git.xiph.org/tremor.git;protocol=https
>     <http://git.xiph.org/tremor.git;protocol=https> \
>     +SRC_URI = "git://gitlab.xiph.org/xiph/tremor.git;protocol=https
>     <http://gitlab.xiph.org/xiph/tremor.git;protocol=https> \
>                 file://obsolete_automake_macros.patch;striplevel=0 \
>                 file://tremor-arm-thumb2.patch \
>      "
>     -- 
>     2.17.1
>
>     
>


--------------59679027D62B98902D81BC4A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 5/22/20 7:21 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAMKF1somJV53JeyRWNpCBvYwOoh7S3-Fms4dGJ9-CGOMB8eWPQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div><br>
      </div>
      <div><br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Fri, May 22, 2020 at 6:38
            PM akuster &lt;<a href="mailto:akuster808@gmail.com"
              moz-do-not-send="true">akuster808@gmail.com</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">It appears
            Xiph.Org is not on gitlab</blockquote>
          <div dir="auto"><br>
          </div>
          <div dir="auto">Typo not should be now I guess <br>
          </div>
        </div>
      </div>
    </blockquote>
    I ordered more of those letters today.<br>
    <br>
    v2 shortly.<br>
    <br>
    -armin<br>
    <br>
    <blockquote type="cite"
cite="mid:CAMKF1somJV53JeyRWNpCBvYwOoh7S3-Fms4dGJ9-CGOMB8eWPQ@mail.gmail.com">
      <div>
        <div class="gmail_quote">
          <div dir="auto"><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
            <a href="https://gitlab.xiph.org/xiph" rel="noreferrer"
              target="_blank" moz-do-not-send="true">https://gitlab.xiph.org/xiph</a><br>
            <br>
            Signed-off-by: Armin Kuster &lt;<a
              href="mailto:akuster808@gmail.com" target="_blank"
              moz-do-not-send="true">akuster808@gmail.com</a>&gt;<br>
            ---<br>
             meta-multimedia/recipes-multimedia/tremor/<a
              href="http://tremor_20180319.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">tremor_20180319.bb</a>
            | 2 +-<br>
             1 file changed, 1 insertion(+), 1 deletion(-)<br>
            <br>
            diff --git a/meta-multimedia/recipes-multimedia/tremor/<a
              href="http://tremor_20180319.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">tremor_20180319.bb</a>
            b/meta-multimedia/recipes-multimedia/tremor/<a
              href="http://tremor_20180319.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">tremor_20180319.bb</a><br>
            index 28bb5d924..6abf6080b 100644<br>
            --- a/meta-multimedia/recipes-multimedia/tremor/<a
              href="http://tremor_20180319.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">tremor_20180319.bb</a><br>
            +++ b/meta-multimedia/recipes-multimedia/tremor/<a
              href="http://tremor_20180319.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">tremor_20180319.bb</a><br>
            @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =
            "<a class="moz-txt-link-freetext" href="file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555">file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555</a> \<br>
                               
 <a class="moz-txt-link-freetext" href="file://os.h;beginline=3;endline=14;md5=5c0af5e1bedef3ce8178c89f48cd6f1f">file://os.h;beginline=3;endline=14;md5=5c0af5e1bedef3ce8178c89f48cd6f1f</a>"<br>
             DEPENDS = "libogg"<br>
            <br>
            -SRC_URI = "git://<a
              href="http://git.xiph.org/tremor.git;protocol=https"
              rel="noreferrer" target="_blank" moz-do-not-send="true">git.xiph.org/tremor.git;protocol=https</a>
            \<br>
            +SRC_URI = "git://<a
              href="http://gitlab.xiph.org/xiph/tremor.git;protocol=https"
              rel="noreferrer" target="_blank" moz-do-not-send="true">gitlab.xiph.org/xiph/tremor.git;protocol=https</a>
            \<br>
                       
            <a class="moz-txt-link-freetext" href="file://obsolete_automake_macros.patch;striplevel=0">file://obsolete_automake_macros.patch;striplevel=0</a> \<br>
                        <a class="moz-txt-link-freetext" href="file://tremor-arm-thumb2.patch">file://tremor-arm-thumb2.patch</a> \<br>
             "<br>
            -- <br>
            2.17.1<br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------59679027D62B98902D81BC4A--
