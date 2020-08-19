Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.97599.1597872245877691585
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2020 14:24:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MfM0NPKR;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id g19so121705ejc.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2020 14:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JMqnP0mhaBKnpznV3HD31gcy+K6kJ9e6LD6zY83nK7A=;
        b=MfM0NPKRC8gpA7vD8rvO8u6h5BXFUrXT5Zfk5LYzDcriUK1w/orHtYxjy89CSXoaQO
         2/OX+hdIChMd0JK3nm9BwQvhKvt41l5pEF/o4P8q54uLi7yVtnxhJ2v5miLHl5sEK2CD
         82UdhOcU9iwgxbFEw4+QJVdyCExFF5Y3nVn53HRnpQcpmCEGMuCR4rRXDhLxzSTi8Mrq
         RCT703k48sWIh0Ld0I9UuIauOC/GsSH9V/6P+srb7h/hB4oU2F2ANRE4PPOuCnM6p2KE
         NQ17v0l3lgmvehaVMtIWES09nx3NFTx4vTax0rszVuA6AhJk+HF/0HIgBnakSWhe7vUj
         3ZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JMqnP0mhaBKnpznV3HD31gcy+K6kJ9e6LD6zY83nK7A=;
        b=cY/qehCNn+EcsHB5nx6xqosEysMbZ1zkBVlivcoEMxsiIrl3mDSmjt79UB1yzovhZa
         SigBjwOj/n+vXWj5QuGSt0+qZb5PDEIWytJo9qX1Ix8LEUAm0guL3y4+f89flMExKTRD
         k+qM+0MFRsHiXEoui434mFurp5T736eOwpCJak9HoXMVtALUJy9M3OdlW/d0RcAPc3jF
         T66QJFMzmwH0TBQfP7knAXjJc/XU/hvZuUUW9RpBrAkUdR0xDDd7R1KXbOvdvFa9yeaB
         NQoB/aA1Wabtn1W0icH73EhBd3J9bNyR+VM0/g//QLfNbF/llU9SU8MFWMGIdIpGgC+P
         G9NA==
X-Gm-Message-State: AOAM533x5Zj8pi0S8p+OaYOiCI6oQBQe4g7w1mVDslJl6r7cugc+Iw4a
	pgNqW5qDLTDWF1m1gmc390uOXtvb0tAfdn5kQJQ=
X-Google-Smtp-Source: ABdhPJz20mgEMCdDUj2NNqqFJBo/MTlPZTWABrofdsMoQRTIb2ndXG6zF1qYzoMA/HNOJmvK5zZD4R5XVggZlGxpAHQ=
X-Received: by 2002:a17:907:11dd:: with SMTP id va29mr271862ejb.470.1597872244239;
 Wed, 19 Aug 2020 14:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200726130737.57830-1-open.source@oleksandr-kravchuk.com>
 <CA+chaQfFzhLFHYX0BY9-HwBhnk8kmmv2cRULaONWqXzTtwh=rw@mail.gmail.com> <9e1e222e-d467-9fb7-f028-9902315876a7@oleksandr-kravchuk.com>
In-Reply-To: <9e1e222e-d467-9fb7-f028-9902315876a7@oleksandr-kravchuk.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 19 Aug 2020 23:23:53 +0200
Message-ID: <CA+chaQd4dEhhZm3Z51o0tcOcMaeY88YJPBxWOouTVd_xGyEicg@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-oe] valijson: update to 0.3
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000083b25a05ad419fdf"

--00000000000083b25a05ad419fdf
Content-Type: text/plain; charset="UTF-8"

Any update on this?

Can we revert the upgrade until you figure it out?

On Mon, Aug 3, 2020 at 1:51 PM Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> Hi,
>
> Oh, I was not aware those layers cannot depend on each other. I'll see
> what can be done.
>
> On 02/08/2020 22:03, Martin Jansa wrote:
>
> Hi,
>
> new dependency curlpp is only available in meta-networking, so this recipe
> in meta-oe cannot depend on it, either move it to meta-networking as well,
> or make it optional with PACKAGECONFIG if possible.
>
> Now it causes:
> ERROR: Nothing PROVIDES 'curlpp' (but
> meta-openembedded/meta-oe/recipes-devtools/valijson/valijson_0.3.bb
> DEPENDS on or otherwise requires it). Close matches:
>
> Regards,
>
> On Sun, Jul 26, 2020 at 3:09 PM Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com> wrote:
>
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>  .../recipes-devtools/valijson/valijson_0.3.bb | 36 +++++++++++++++++++
>>  .../recipes-devtools/valijson/valijson_git.bb | 21 -----------
>>  2 files changed, 36 insertions(+), 21 deletions(-)
>>  create mode 100644 meta-oe/recipes-devtools/valijson/valijson_0.3.bb
>>  delete mode 100644 meta-oe/recipes-devtools/valijson/valijson_git.bb
>>
>> diff --git a/meta-oe/recipes-devtools/valijson/valijson_0.3.bb
>> b/meta-oe/recipes-devtools/valijson/valijson_0.3.bb
>> new file mode 100644
>> index 0000000000..049cdeffc0
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/valijson/valijson_0.3.bb
>> @@ -0,0 +1,36 @@
>> +SUMMARY = "Header-only C++ library for JSON Schema validation"
>> +HOMEPAGE = "https://github.com/tristanpenman/valijson"
>> +LICENSE = "BSD-2-Clause"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=015106c62262b2383f6c72063f0998f2"
>> +
>> +SRC_URI = "git://github.com/tristanpenman/valijson.git"
>> +SRCREV = "7a52fc88cdffd6678c009ca2fad700151f7363c6"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit cmake
>> +
>> +EXTRA_OECMAKE = "-DINSTALL_HEADERS=1 -DBUILD_TESTS=0"
>> +
>> +DEPENDS = "curlpp"
>> +
>> +# valijson is a header only C++ library, so the main package will be
>> empty.
>> +RDEPENDS_${PN}-dev = ""
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> +
>> +do_install() {
>> +    install -d ${D}${includedir}/compat
>> +    install -d ${D}${includedir}/valijson
>> +    install -d ${D}${includedir}/valijson/adapters
>> +    install -d ${D}${includedir}/valijson/constraints
>> +    install -d ${D}${includedir}/valijson/internal
>> +    install -d ${D}${includedir}/valijson/utils
>> +
>> +    install -m 0644 ${S}/include/compat/* ${D}${includedir}/compat
>> +    install -D -m 0644 ${S}/include/valijson/*.hpp -t
>> ${D}${includedir}/valijson
>> +    install -D -m 0644 ${S}/include/valijson/adapters/*.hpp -t
>> ${D}${includedir}/valijson/adapters
>> +    install -D -m 0644 ${S}/include/valijson/constraints/*.hpp -t
>> ${D}${includedir}/valijson/constraints
>> +    install -D -m 0644 ${S}/include/valijson/internal/*.hpp -t
>> ${D}${includedir}/valijson/internal
>> +    install -D -m 0644 ${S}/include/valijson/utils/*.hpp -t
>> ${D}${includedir}/valijson/utils
>> +}
>> diff --git a/meta-oe/recipes-devtools/valijson/valijson_git.bb
>> b/meta-oe/recipes-devtools/valijson/valijson_git.bb
>> deleted file mode 100644
>> index c3254d16e7..0000000000
>> --- a/meta-oe/recipes-devtools/valijson/valijson_git.bb
>> +++ /dev/null
>> @@ -1,21 +0,0 @@
>> -SUMMARY = "Header-only C++ library for JSON Schema validation"
>> -HOMEPAGE = "https://github.com/tristanpenman/valijson"
>> -LICENSE = "BSD-2-Clause"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=015106c62262b2383f6c72063f0998f2"
>> -
>> -SRC_URI = "git://github.com/tristanpenman/valijson.git"
>> -PV = "0.1+git${SRCPV}"
>> -
>> -SRCREV = "c2f22fddf599d04dc33fcd7ed257c698a05345d9"
>> -
>> -S = "${WORKDIR}/git"
>> -
>> -inherit cmake
>> -
>> -EXTRA_OECMAKE = "-DINSTALL_HEADERS=1 -DBUILD_TESTS=0"
>> -
>> -# valijson is a header only C++ library, so the main package will be
>> empty.
>> -RDEPENDS_${PN}-dev = ""
>> -
>> -BBCLASSEXTEND = "native nativesdk"
>> -
>> --
>> 2.25.1
>>
>> 
>>
>

--00000000000083b25a05ad419fdf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Any update on this?<div><br></div><div>Can we revert the u=
pgrade until you figure it out?</div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 3, 2020 at 1:51 PM Oleksan=
dr Kravchuk &lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com">open.=
source@oleksandr-kravchuk.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
  
    
  
  <div>
    <div>Hi,</div>
    <div><br>
    </div>
    <div>Oh, I was not aware those layers cannot
      depend on each other. I&#39;ll see what can be done.<br>
    </div>
    <div><br>
    </div>
    <div>On 02/08/2020 22:03, Martin Jansa
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      
      <div dir=3D"ltr">Hi,
        <div><br>
        </div>
        <div>new dependency curlpp is only available in meta-networking,
          so this recipe in meta-oe cannot depend on it, either move it
          to meta-networking as well, or make it optional with
          PACKAGECONFIG if possible.</div>
        <div><br>
        </div>
        <div>Now it causes:</div>
        <div>ERROR: Nothing PROVIDES &#39;curlpp&#39; (but
          meta-openembedded/meta-oe/recipes-devtools/valijson/<a href=3D"h=
ttp://valijson_0.3.bb" target=3D"_blank">valijson_0.3.bb</a>
          DEPENDS on or otherwise requires it). Close matches:<br>
        </div>
        <div><br>
        </div>
        <div>Regards,</div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 26, 2020 at 3:09
          PM Oleksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksand=
r-kravchuk.com" target=3D"_blank">open.source@oleksandr-kravchuk.com</a>&gt=
;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by:
          Oleksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksandr-k=
ravchuk.com" target=3D"_blank">open.source@oleksandr-kravchuk.com</a>&gt;<b=
r>
          ---<br>
          =C2=A0.../recipes-devtools/valijson/<a href=3D"http://valijson_0=
.3.bb" rel=3D"noreferrer" target=3D"_blank">valijson_0.3.bb</a> |
          36 +++++++++++++++++++<br>
          =C2=A0.../recipes-devtools/valijson/<a href=3D"http://valijson_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">valijson_git.bb</a> |
          21 -----------<br>
          =C2=A02 files changed, 36 insertions(+), 21 deletions(-)<br>
          =C2=A0create mode 100644 meta-oe/recipes-devtools/valijson/<a hr=
ef=3D"http://valijson_0.3.bb" rel=3D"noreferrer" target=3D"_blank">valijson=
_0.3.bb</a><br>
          =C2=A0delete mode 100644 meta-oe/recipes-devtools/valijson/<a hr=
ef=3D"http://valijson_git.bb" rel=3D"noreferrer" target=3D"_blank">valijson=
_git.bb</a><br>
          <br>
          diff --git a/meta-oe/recipes-devtools/valijson/<a href=3D"http:/=
/valijson_0.3.bb" rel=3D"noreferrer" target=3D"_blank">valijson_0.3.bb</a>
          b/meta-oe/recipes-devtools/valijson/<a href=3D"http://valijson_0=
.3.bb" rel=3D"noreferrer" target=3D"_blank">valijson_0.3.bb</a><br>
          new file mode 100644<br>
          index 0000000000..049cdeffc0<br>
          --- /dev/null<br>
          +++ b/meta-oe/recipes-devtools/valijson/<a href=3D"http://valijs=
on_0.3.bb" rel=3D"noreferrer" target=3D"_blank">valijson_0.3.bb</a><br>
          @@ -0,0 +1,36 @@<br>
          +SUMMARY =3D &quot;Header-only C++ library for JSON Schema
          validation&quot;<br>
          +HOMEPAGE =3D &quot;<a href=3D"https://github.com/tristanpenman/=
valijson" rel=3D"noreferrer" target=3D"_blank">https://github.com/tristanpe=
nman/valijson</a>&quot;<br>
          +LICENSE =3D &quot;BSD-2-Clause&quot;<br>
          +LIC_FILES_CHKSUM =3D
          <a>&quot;file://LICENSE;md5=3D015106c62262b2383f6c72063f0998f2&q=
uot;</a><br>
          +<br>
          +SRC_URI =3D &quot;git://<a href=3D"http://github.com/tristanpen=
man/valijson.git" rel=3D"noreferrer" target=3D"_blank">github.com/tristanpe=
nman/valijson.git</a>&quot;<br>
          +SRCREV =3D &quot;7a52fc88cdffd6678c009ca2fad700151f7363c6&quot;=
<br>
          +<br>
          +S =3D &quot;${WORKDIR}/git&quot;<br>
          +<br>
          +inherit cmake<br>
          +<br>
          +EXTRA_OECMAKE =3D &quot;-DINSTALL_HEADERS=3D1 -DBUILD_TESTS=3D0=
&quot;<br>
          +<br>
          +DEPENDS =3D &quot;curlpp&quot;<br>
          +<br>
          +# valijson is a header only C++ library, so the main package
          will be empty.<br>
          +RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
          +<br>
          +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
          +<br>
          +do_install() {<br>
          +=C2=A0 =C2=A0 install -d ${D}${includedir}/compat<br>
          +=C2=A0 =C2=A0 install -d ${D}${includedir}/valijson<br>
          +=C2=A0 =C2=A0 install -d ${D}${includedir}/valijson/adapters<br=
>
          +=C2=A0 =C2=A0 install -d ${D}${includedir}/valijson/constraints=
<br>
          +=C2=A0 =C2=A0 install -d ${D}${includedir}/valijson/internal<br=
>
          +=C2=A0 =C2=A0 install -d ${D}${includedir}/valijson/utils<br>
          +<br>
          +=C2=A0 =C2=A0 install -m 0644 ${S}/include/compat/*
          ${D}${includedir}/compat<br>
          +=C2=A0 =C2=A0 install -D -m 0644 ${S}/include/valijson/*.hpp -t
          ${D}${includedir}/valijson<br>
          +=C2=A0 =C2=A0 install -D -m 0644 ${S}/include/valijson/adapters=
/*.hpp
          -t ${D}${includedir}/valijson/adapters<br>
          +=C2=A0 =C2=A0 install -D -m 0644
          ${S}/include/valijson/constraints/*.hpp -t
          ${D}${includedir}/valijson/constraints<br>
          +=C2=A0 =C2=A0 install -D -m 0644 ${S}/include/valijson/internal=
/*.hpp
          -t ${D}${includedir}/valijson/internal<br>
          +=C2=A0 =C2=A0 install -D -m 0644 ${S}/include/valijson/utils/*.=
hpp -t
          ${D}${includedir}/valijson/utils<br>
          +}<br>
          diff --git a/meta-oe/recipes-devtools/valijson/<a href=3D"http:/=
/valijson_git.bb" rel=3D"noreferrer" target=3D"_blank">valijson_git.bb</a>
          b/meta-oe/recipes-devtools/valijson/<a href=3D"http://valijson_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">valijson_git.bb</a><br>
          deleted file mode 100644<br>
          index c3254d16e7..0000000000<br>
          --- a/meta-oe/recipes-devtools/valijson/<a href=3D"http://valijs=
on_git.bb" rel=3D"noreferrer" target=3D"_blank">valijson_git.bb</a><br>
          +++ /dev/null<br>
          @@ -1,21 +0,0 @@<br>
          -SUMMARY =3D &quot;Header-only C++ library for JSON Schema
          validation&quot;<br>
          -HOMEPAGE =3D &quot;<a href=3D"https://github.com/tristanpenman/=
valijson" rel=3D"noreferrer" target=3D"_blank">https://github.com/tristanpe=
nman/valijson</a>&quot;<br>
          -LICENSE =3D &quot;BSD-2-Clause&quot;<br>
          -LIC_FILES_CHKSUM =3D
          <a>&quot;file://LICENSE;md5=3D015106c62262b2383f6c72063f0998f2&q=
uot;</a><br>
          -<br>
          -SRC_URI =3D &quot;git://<a href=3D"http://github.com/tristanpen=
man/valijson.git" rel=3D"noreferrer" target=3D"_blank">github.com/tristanpe=
nman/valijson.git</a>&quot;<br>
          -PV =3D &quot;0.1+git${SRCPV}&quot;<br>
          -<br>
          -SRCREV =3D &quot;c2f22fddf599d04dc33fcd7ed257c698a05345d9&quot;=
<br>
          -<br>
          -S =3D &quot;${WORKDIR}/git&quot;<br>
          -<br>
          -inherit cmake<br>
          -<br>
          -EXTRA_OECMAKE =3D &quot;-DINSTALL_HEADERS=3D1 -DBUILD_TESTS=3D0=
&quot;<br>
          -<br>
          -# valijson is a header only C++ library, so the main package
          will be empty.<br>
          -RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
          -<br>
          -BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
          -<br>
          -- <br>
          2.25.1<br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </div>

</blockquote></div>

--00000000000083b25a05ad419fdf--
