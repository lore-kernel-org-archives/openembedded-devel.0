Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web12.9535.1596455473417229927
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 04:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=ohV/PJ9N;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.50, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f50.google.com with SMTP id s9so20323614lfs.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2020 04:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=NRpfmoAp7SBzOBRfewdcCtlbtcT/+aGcTOGBqEosGgc=;
        b=ohV/PJ9NmmpoZSfGQptEkP0CbbiNG7OYaRAl3oD2JiIEsCC0w4qOSajFw+XEJDF/eR
         wNiledgWtpbjRyfIJRx5PkH+7cHS+A0ZW2I7tedh1bRvHfBI/MxAYGjNXeZrilZvK1mD
         wjQLDKuLX7KM538OeXNlnezjE0mIWDFA+gvNhOfOxvQ20yFJgRm8wx0J4HZbTl3tkl7R
         WuSIpCryZFnRMeXsme0EwnvjheldM9Qor31DoEEfsbfZTIzeCinVHNVfcWh/rH/ub2xG
         /OhA5GKoOx8/02ZcMkYlDkz+KEa+hVWGQwnkg/uawcHI+5tjz/MWQV0x2jELjimrF9v/
         OcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=NRpfmoAp7SBzOBRfewdcCtlbtcT/+aGcTOGBqEosGgc=;
        b=QUQpRa384feO7+pgvfOXkkCBIpcYwAHUUfLJtcqFr4Z4BPwaW6fPaHOj8F008kQc99
         LKIA8nzE2cqaMPlC1rJfMZgK5fJHTv+aa57WL0Y3dVyncabuPbTiDaUD7UEdWH8pQFV4
         QP1vZSrI9tO/agV38EIkq3wyCGmUA+07BKI6vIdmLzOiNJEFttMFBl6ylCGEKkdqv4RL
         yMQi317qlYmUdnmsTT6KCyCVDI9rX2VKIGusyfTUpp9MK7SRYylCzrNVB4Ook0BiYjV4
         s+9piufv+4DfM5W7jtDBdDx4Fak362RzkLs7YeUyq5E6Wb8q4xSgbQCCjxjnaLWmuwv8
         m1Fw==
X-Gm-Message-State: AOAM532e4GuOvvQbtIFCfEJWiE7pW7BZ5uCxHI1Ova5HDmZD6dFos+Gk
	XcbbKbhoc9HoixSqCamCGblougkMuXQ=
X-Google-Smtp-Source: ABdhPJwB5IZ/gmlGfCWp2tmLeyUxs2sDoxkFecy0UP8M4rzCOv/MQW7gOKyA/m1Wb5ctYo/F+uog3w==
X-Received: by 2002:a19:7710:: with SMTP id s16mr8376959lfc.162.1596455470914;
        Mon, 03 Aug 2020 04:51:10 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from [192.168.0.8] (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id h7sm1735816ljc.75.2020.08.03.04.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2020 04:51:10 -0700 (PDT)
Subject: Re: [oe] [PATCH][meta-oe] valijson: update to 0.3
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <20200726130737.57830-1-open.source@oleksandr-kravchuk.com>
 <CA+chaQfFzhLFHYX0BY9-HwBhnk8kmmv2cRULaONWqXzTtwh=rw@mail.gmail.com>
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
Message-ID: <9e1e222e-d467-9fb7-f028-9902315876a7@oleksandr-kravchuk.com>
Date: Mon, 3 Aug 2020 13:51:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfFzhLFHYX0BY9-HwBhnk8kmmv2cRULaONWqXzTtwh=rw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------124B0E1C40721A8F837AD502"
Content-Language: en-US

--------------124B0E1C40721A8F837AD502
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Oh, I was not aware those layers cannot depend on each other. I'll see 
what can be done.

On 02/08/2020 22:03, Martin Jansa wrote:
> Hi,
>
> new dependency curlpp is only available in meta-networking, so this 
> recipe in meta-oe cannot depend on it, either move it to 
> meta-networking as well, or make it optional with PACKAGECONFIG if 
> possible.
>
> Now it causes:
> ERROR: Nothing PROVIDES 'curlpp' (but 
> meta-openembedded/meta-oe/recipes-devtools/valijson/valijson_0.3.bb 
> <http://valijson_0.3.bb> DEPENDS on or otherwise requires it). Close 
> matches:
>
> Regards,
>
> On Sun, Jul 26, 2020 at 3:09 PM Oleksandr Kravchuk 
> <open.source@oleksandr-kravchuk.com 
> <mailto:open.source@oleksandr-kravchuk.com>> wrote:
>
>     Signed-off-by: Oleksandr Kravchuk
>     <open.source@oleksandr-kravchuk.com
>     <mailto:open.source@oleksandr-kravchuk.com>>
>     ---
>      .../recipes-devtools/valijson/valijson_0.3.bb
>     <http://valijson_0.3.bb> | 36 +++++++++++++++++++
>      .../recipes-devtools/valijson/valijson_git.bb
>     <http://valijson_git.bb> | 21 -----------
>      2 files changed, 36 insertions(+), 21 deletions(-)
>      create mode 100644
>     meta-oe/recipes-devtools/valijson/valijson_0.3.bb
>     <http://valijson_0.3.bb>
>      delete mode 100644
>     meta-oe/recipes-devtools/valijson/valijson_git.bb
>     <http://valijson_git.bb>
>
>     diff --git a/meta-oe/recipes-devtools/valijson/valijson_0.3.bb
>     <http://valijson_0.3.bb>
>     b/meta-oe/recipes-devtools/valijson/valijson_0.3.bb
>     <http://valijson_0.3.bb>
>     new file mode 100644
>     index 0000000000..049cdeffc0
>     --- /dev/null
>     +++ b/meta-oe/recipes-devtools/valijson/valijson_0.3.bb
>     <http://valijson_0.3.bb>
>     @@ -0,0 +1,36 @@
>     +SUMMARY = "Header-only C++ library for JSON Schema validation"
>     +HOMEPAGE = "https://github.com/tristanpenman/valijson"
>     +LICENSE = "BSD-2-Clause"
>     +LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=015106c62262b2383f6c72063f0998f2"
>     +
>     +SRC_URI = "git://github.com/tristanpenman/valijson.git
>     <http://github.com/tristanpenman/valijson.git>"
>     +SRCREV = "7a52fc88cdffd6678c009ca2fad700151f7363c6"
>     +
>     +S = "${WORKDIR}/git"
>     +
>     +inherit cmake
>     +
>     +EXTRA_OECMAKE = "-DINSTALL_HEADERS=1 -DBUILD_TESTS=0"
>     +
>     +DEPENDS = "curlpp"
>     +
>     +# valijson is a header only C++ library, so the main package will
>     be empty.
>     +RDEPENDS_${PN}-dev = ""
>     +
>     +BBCLASSEXTEND = "native nativesdk"
>     +
>     +do_install() {
>     +    install -d ${D}${includedir}/compat
>     +    install -d ${D}${includedir}/valijson
>     +    install -d ${D}${includedir}/valijson/adapters
>     +    install -d ${D}${includedir}/valijson/constraints
>     +    install -d ${D}${includedir}/valijson/internal
>     +    install -d ${D}${includedir}/valijson/utils
>     +
>     +    install -m 0644 ${S}/include/compat/* ${D}${includedir}/compat
>     +    install -D -m 0644 ${S}/include/valijson/*.hpp -t
>     ${D}${includedir}/valijson
>     +    install -D -m 0644 ${S}/include/valijson/adapters/*.hpp -t
>     ${D}${includedir}/valijson/adapters
>     +    install -D -m 0644 ${S}/include/valijson/constraints/*.hpp -t
>     ${D}${includedir}/valijson/constraints
>     +    install -D -m 0644 ${S}/include/valijson/internal/*.hpp -t
>     ${D}${includedir}/valijson/internal
>     +    install -D -m 0644 ${S}/include/valijson/utils/*.hpp -t
>     ${D}${includedir}/valijson/utils
>     +}
>     diff --git a/meta-oe/recipes-devtools/valijson/valijson_git.bb
>     <http://valijson_git.bb>
>     b/meta-oe/recipes-devtools/valijson/valijson_git.bb
>     <http://valijson_git.bb>
>     deleted file mode 100644
>     index c3254d16e7..0000000000
>     --- a/meta-oe/recipes-devtools/valijson/valijson_git.bb
>     <http://valijson_git.bb>
>     +++ /dev/null
>     @@ -1,21 +0,0 @@
>     -SUMMARY = "Header-only C++ library for JSON Schema validation"
>     -HOMEPAGE = "https://github.com/tristanpenman/valijson"
>     -LICENSE = "BSD-2-Clause"
>     -LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=015106c62262b2383f6c72063f0998f2"
>     -
>     -SRC_URI = "git://github.com/tristanpenman/valijson.git
>     <http://github.com/tristanpenman/valijson.git>"
>     -PV = "0.1+git${SRCPV}"
>     -
>     -SRCREV = "c2f22fddf599d04dc33fcd7ed257c698a05345d9"
>     -
>     -S = "${WORKDIR}/git"
>     -
>     -inherit cmake
>     -
>     -EXTRA_OECMAKE = "-DINSTALL_HEADERS=1 -DBUILD_TESTS=0"
>     -
>     -# valijson is a header only C++ library, so the main package will
>     be empty.
>     -RDEPENDS_${PN}-dev = ""
>     -
>     -BBCLASSEXTEND = "native nativesdk"
>     -
>     -- 
>     2.25.1
>
>     
>

--------------124B0E1C40721A8F837AD502
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Hi,</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">Oh, I was not aware those layers cannot
      depend on each other. I'll see what can be done.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 02/08/2020 22:03, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CA+chaQfFzhLFHYX0BY9-HwBhnk8kmmv2cRULaONWqXzTtwh=rw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Hi,
        <div><br>
        </div>
        <div>new dependency curlpp is only available in meta-networking,
          so this recipe in meta-oe cannot depend on it, either move it
          to meta-networking as well, or make it optional with
          PACKAGECONFIG if possible.</div>
        <div><br>
        </div>
        <div>Now it causes:</div>
        <div>ERROR: Nothing PROVIDES 'curlpp' (but
          meta-openembedded/meta-oe/recipes-devtools/valijson/<a
            href="http://valijson_0.3.bb" moz-do-not-send="true">valijson_0.3.bb</a>
          DEPENDS on or otherwise requires it). Close matches:<br>
        </div>
        <div><br>
        </div>
        <div>Regards,</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Sun, Jul 26, 2020 at 3:09
          PM Oleksandr Kravchuk &lt;<a
            href="mailto:open.source@oleksandr-kravchuk.com"
            target="_blank" moz-do-not-send="true">open.source@oleksandr-kravchuk.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by:
          Oleksandr Kravchuk &lt;<a
            href="mailto:open.source@oleksandr-kravchuk.com"
            target="_blank" moz-do-not-send="true">open.source@oleksandr-kravchuk.com</a>&gt;<br>
          ---<br>
           .../recipes-devtools/valijson/<a
            href="http://valijson_0.3.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">valijson_0.3.bb</a> |
          36 +++++++++++++++++++<br>
           .../recipes-devtools/valijson/<a
            href="http://valijson_git.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">valijson_git.bb</a> |
          21 -----------<br>
           2 files changed, 36 insertions(+), 21 deletions(-)<br>
           create mode 100644 meta-oe/recipes-devtools/valijson/<a
            href="http://valijson_0.3.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">valijson_0.3.bb</a><br>
           delete mode 100644 meta-oe/recipes-devtools/valijson/<a
            href="http://valijson_git.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">valijson_git.bb</a><br>
          <br>
          diff --git a/meta-oe/recipes-devtools/valijson/<a
            href="http://valijson_0.3.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">valijson_0.3.bb</a>
          b/meta-oe/recipes-devtools/valijson/<a
            href="http://valijson_0.3.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">valijson_0.3.bb</a><br>
          new file mode 100644<br>
          index 0000000000..049cdeffc0<br>
          --- /dev/null<br>
          +++ b/meta-oe/recipes-devtools/valijson/<a
            href="http://valijson_0.3.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">valijson_0.3.bb</a><br>
          @@ -0,0 +1,36 @@<br>
          +SUMMARY = "Header-only C++ library for JSON Schema
          validation"<br>
          +HOMEPAGE = "<a
            href="https://github.com/tristanpenman/valijson"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/tristanpenman/valijson</a>"<br>
          +LICENSE = "BSD-2-Clause"<br>
          +LIC_FILES_CHKSUM =
          <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=015106c62262b2383f6c72063f0998f2">"file://LICENSE;md5=015106c62262b2383f6c72063f0998f2"</a><br>
          +<br>
          +SRC_URI = "git://<a
            href="http://github.com/tristanpenman/valijson.git"
            rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/tristanpenman/valijson.git</a>"<br>
          +SRCREV = "7a52fc88cdffd6678c009ca2fad700151f7363c6"<br>
          +<br>
          +S = "${WORKDIR}/git"<br>
          +<br>
          +inherit cmake<br>
          +<br>
          +EXTRA_OECMAKE = "-DINSTALL_HEADERS=1 -DBUILD_TESTS=0"<br>
          +<br>
          +DEPENDS = "curlpp"<br>
          +<br>
          +# valijson is a header only C++ library, so the main package
          will be empty.<br>
          +RDEPENDS_${PN}-dev = ""<br>
          +<br>
          +BBCLASSEXTEND = "native nativesdk"<br>
          +<br>
          +do_install() {<br>
          +    install -d ${D}${includedir}/compat<br>
          +    install -d ${D}${includedir}/valijson<br>
          +    install -d ${D}${includedir}/valijson/adapters<br>
          +    install -d ${D}${includedir}/valijson/constraints<br>
          +    install -d ${D}${includedir}/valijson/internal<br>
          +    install -d ${D}${includedir}/valijson/utils<br>
          +<br>
          +    install -m 0644 ${S}/include/compat/*
          ${D}${includedir}/compat<br>
          +    install -D -m 0644 ${S}/include/valijson/*.hpp -t
          ${D}${includedir}/valijson<br>
          +    install -D -m 0644 ${S}/include/valijson/adapters/*.hpp
          -t ${D}${includedir}/valijson/adapters<br>
          +    install -D -m 0644
          ${S}/include/valijson/constraints/*.hpp -t
          ${D}${includedir}/valijson/constraints<br>
          +    install -D -m 0644 ${S}/include/valijson/internal/*.hpp
          -t ${D}${includedir}/valijson/internal<br>
          +    install -D -m 0644 ${S}/include/valijson/utils/*.hpp -t
          ${D}${includedir}/valijson/utils<br>
          +}<br>
          diff --git a/meta-oe/recipes-devtools/valijson/<a
            href="http://valijson_git.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">valijson_git.bb</a>
          b/meta-oe/recipes-devtools/valijson/<a
            href="http://valijson_git.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">valijson_git.bb</a><br>
          deleted file mode 100644<br>
          index c3254d16e7..0000000000<br>
          --- a/meta-oe/recipes-devtools/valijson/<a
            href="http://valijson_git.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">valijson_git.bb</a><br>
          +++ /dev/null<br>
          @@ -1,21 +0,0 @@<br>
          -SUMMARY = "Header-only C++ library for JSON Schema
          validation"<br>
          -HOMEPAGE = "<a
            href="https://github.com/tristanpenman/valijson"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/tristanpenman/valijson</a>"<br>
          -LICENSE = "BSD-2-Clause"<br>
          -LIC_FILES_CHKSUM =
          <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=015106c62262b2383f6c72063f0998f2">"file://LICENSE;md5=015106c62262b2383f6c72063f0998f2"</a><br>
          -<br>
          -SRC_URI = "git://<a
            href="http://github.com/tristanpenman/valijson.git"
            rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/tristanpenman/valijson.git</a>"<br>
          -PV = "0.1+git${SRCPV}"<br>
          -<br>
          -SRCREV = "c2f22fddf599d04dc33fcd7ed257c698a05345d9"<br>
          -<br>
          -S = "${WORKDIR}/git"<br>
          -<br>
          -inherit cmake<br>
          -<br>
          -EXTRA_OECMAKE = "-DINSTALL_HEADERS=1 -DBUILD_TESTS=0"<br>
          -<br>
          -# valijson is a header only C++ library, so the main package
          will be empty.<br>
          -RDEPENDS_${PN}-dev = ""<br>
          -<br>
          -BBCLASSEXTEND = "native nativesdk"<br>
          -<br>
          -- <br>
          2.25.1<br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------124B0E1C40721A8F837AD502--
