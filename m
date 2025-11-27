Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D76D116E2
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 14:24:07 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19394.1764253437515364146
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Nov 2025 06:23:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eOf21SPu;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779a637712so5489965e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 06:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764253436; x=1764858236; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0KNgMbmIwjv5hygq0k7YnByIVsRghRZdEU1xWgaAyF4=;
        b=eOf21SPu3504wYOMqgG0wRRC0P84b9x42rLbolWnMWPB7cAQiPEL0niPtmXwXfUJ1J
         sblJuty8/qfSLhvU253eJmmY+bM57SHDLjmxngu9rq1tdryMG55FiMmQklkbNKFIcpEh
         KotEJtIQRa8ONOt4HMYolrjWx1MCmmULm6N3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764253436; x=1764858236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KNgMbmIwjv5hygq0k7YnByIVsRghRZdEU1xWgaAyF4=;
        b=p7jm2iEGSSVnH3aQoLJJ99FXL4+2x9gEPxU8JHvPPa4nSJ4Hb9KjsR2bQrtkY1hMPk
         hbWHexalmJaY9XQeySQ6KorS5ds6DZKgZdOTWHWQm2qvuoBdh9kRlheCCt50jcsLP3Xn
         jIzED9JN+dVKqqY6R+MlC19kGNkgVCpX3pUCMAGVlzfibDp3myb0ziaIq7KLYNEvULxF
         oz5gAL/wUZsmgvhdgMshke+UwrRoGaH/BfwQim64AbOL7Gn94w7nIM57C5JtTyVTocMF
         iYqMX34aCbEY2RwneSahWUHuCQ7UxJR9Py6eXWQ1xCaOfMwfXGh/lbty2+Se9mo37eX6
         Flww==
X-Gm-Message-State: AOJu0Yx5mLg90Ze4wtD4gKT7XTdN17M5f7iZ0Z9Q6PjlWJrOV71s0KaR
	zOFJ037A9ZSgBST67xpFNva+MWxuTHEyjAS5OGFRYemFuO+BV4YlvjRvfv+muNAQdcmub6hGA49
	R1vn8qJRYbBWMDDsvzwzjBQwkcCwc4ddOUjBCb+6EZg==
X-Gm-Gg: ASbGncuSFPCZvAkkmbJA+56YI5NFpx5QqgK8OFIceITuHw+0PRd/gRn6/UylFA/jgsF
	LPdC3ms2w20OjH62pHkT9KpM3s1gniNFm3BIiJd3mFly8O1ikNNQN/A+ycvtitki/VJu3m2IeK6
	5db4KBYIIIrcbN/KAR2v27C65+iQTyh7pj866VXriz9LuNwu7Uqu57uCOIM3A6i3ZGaIaDdOXzo
	LK9eoEaYSQHesbVliF1O8rJwTHrlW5u/mo3IGBDdrnIjZ/cUHXVEzuxLfx4ntj8Y5vXNGVCDrie
	olvZu5R46+uUY10kKZAL5EeGtYyQ
X-Google-Smtp-Source: AGHT+IF2ggT/QXOzEQw7de3Pgrs6GRf4SUk2U5/ZD3CURB1j+os2xso28dTwn0+q1KdoVF4cYRnhuEW8qFXORzB8TDo=
X-Received: by 2002:a05:600c:1f8f:b0:477:3e0b:c0e3 with SMTP id
 5b1f17b1804b1-477c01eba39mr218535235e9.32.1764253435634; Thu, 27 Nov 2025
 06:23:55 -0800 (PST)
MIME-Version: 1.0
References: <20251124115258.3337453-1-leon.anavi@konsulko.com>
 <20251124115258.3337453-2-leon.anavi@konsulko.com> <CAMSfU+70YVWOWjQBVZyoK8QXvekbJ52WoF5A9Q8jBwyijauCVw@mail.gmail.com>
 <8ac90e7d-9cda-4b32-b75c-0aeecab746e8@konsulko.com>
In-Reply-To: <8ac90e7d-9cda-4b32-b75c-0aeecab746e8@konsulko.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 27 Nov 2025 15:23:28 +0100
X-Gm-Features: AWmQ_bn6tTAJ6Rwa8d2Cxrb-D4alsMPayDtgAmO2aFcEsYnCzqqwribMNbTQiWQ
Message-ID: <CAMSfU+6f=OoOckrWUpg0vPGh7Sn6aND0msNyJNoDGNuFuwEqFQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-pikepdf: Add recipe
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005335af0644944301"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 14:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122109

--0000000000005335af0644944301
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 27 nov. 2025 =C3=A0 14:22, Leon Anavi <leon.anavi@konsulko.com> a =
=C3=A9crit :

> Hi Yoann,
> On 11/26/25 12:18, Yoann Congal wrote:
>
> Le lun. 24 nov. 2025 =C3=A0 12:53, Leon Anavi via lists.openembedded.org
> <leon.anavi=3Dkonsulko.com@lists.openembedded.org> a =C3=A9crit :
>
>> Add recipe for v10.0.2:
>>
>> - Fixed presentation of strings using unparse_content_stream -
>>   if the stream can be represented using PdfDocEncoding, it is
>>   rendered in that way for ease of reading.
>> - Reformatted C++ source.
>>
>> This work was sponsored by GOVCERT.LU.
>>
>> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>> ---
>>  .../python/python3-pikepdf_10.0.2.bb          | 22 +++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/
>> python3-pikepdf_10.0.2.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/
>> python3-pikepdf_10.0.2.bb b/meta-python/recipes-devtools/python/
>> python3-pikepdf_10.0.2.bb
>> new file mode 100644
>> index 0000000000..4821e273d8
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb
>> @@ -0,0 +1,22 @@
>> +SUMMARY =3D "Read and write PDFs with Python, powered by qpdf"
>> +HOMEPAGE =3D "https://github.com/pikepdf/pikepdf"
>> +LICENSE =3D "MPL-2.0"
>> +LIC_FILES_CHKSUM =3D
>> "file://LICENSE.txt;md5=3D9741c346eef56131163e13b9db1241b3"
>> +
>> +SRC_URI[sha256sum] =3D
>> "7c85a2526253e35575edb2e28cdc740d004be4b7c5fda954f0e721ee1c423a52"
>> +
>> +inherit pypi python_setuptools_build_meta
>> +
>> +PYPI_PACKAGE =3D "pikepdf"
>> +
>> +DEPENDS +=3D " \
>> +       python3-pybind11-native \
>> +       qpdf \
>> +"
>> +
>> +RDEPENDS:${PN} +=3D " \
>> +       python3-pillow \
>> +       python3-lxml \
>> +"
>> +
>> +BBCLASSEXTEND =3D "native nativesdk"
>>
>
> That creates warnings in CI:
>
> stdio: WARNING: Nothing PROVIDES 'nativesdk-qpdf' (but virtual:nativesdk:=
/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-pyt=
hon/recipes-devtools/python/python3-pikepdf_10.0.2.bb DEPENDS on or otherwi=
se requires it). Close matches:
> stdio: WARNING: Nothing PROVIDES 'qpdf-native' (but virtual:native:/srv/p=
okybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/meta-python/re=
cipes-devtools/python/python3-pikepdf_10.0.2.bb DEPENDS on or otherwise req=
uires it). Close matches:
> stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-pillow' (but virtual=
:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedd=
ed/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb RDEPENDS o=
n or otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-pikepdf' (but virtua=
l:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembed=
ded/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb RDEPENDS =
on or otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-pikepdf-dev' (but vi=
rtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-opene=
mbedded/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb RDEPE=
NDS on or otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'python3-pikepdf-native' (but virtual:n=
ative:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedded/me=
ta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb RDEPENDS on or =
otherwise requires it)
> stdio: WARNING: Nothing RPROVIDES 'python3-pikepdf-dev-native' (but virtu=
al:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta-openembedde=
d/meta-python/recipes-devtools/python/python3-pikepdf_10.0.2.bb RDEPENDS on=
 or otherwise requires it)
>
> From
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/82/builds/526/s=
teps/13/logs/stdio
>
> Leon, can you look into it? (I guess some dependencies lack their
> BBCLASSEXTEND)
>
> Yes, thank you for pointing out these warnings. I have just submitted
> three patches that add native and nativesdk to BBCLASSEXTEND of the
> required python3-pikepdf dependencies.
>

Sounds good, thanks!


> Best regards, Leon
>


--=20
Yoann Congal
Smile ECS

--0000000000005335af0644944301
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 27=
 nov. 2025 =C3=A0=C2=A014:22, Leon Anavi &lt;<a href=3D"mailto:leon.anavi@k=
onsulko.com">leon.anavi@konsulko.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
   =20
 =20
  <div>
    <p>Hi=C2=A0Yoann,</p>
    <div>On 11/26/25 12:18, Yoann Congal wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">Le=C2=A0lun. 24 nov. 2025 =C3=A0=C2=A012:53, Leon =
Anavi via <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists=
.openembedded.org</a>
          &lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.openembedde=
d.org" target=3D"_blank">konsulko.com@lists.openembedded.org</a>&gt;
          a =C3=A9crit=C2=A0:</div>
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add
            recipe for v10.0.2:<br>
            <br>
            - Fixed presentation of strings using unparse_content_stream
            -<br>
            =C2=A0 if the stream can be represented using PdfDocEncoding, i=
t
            is<br>
            =C2=A0 rendered in that way for ease of reading.<br>
            - Reformatted C++ source.<br>
            <br>
            This work was sponsored by <a href=3D"http://GOVCERT.LU" rel=3D=
"noreferrer" target=3D"_blank">GOVCERT.LU</a>.<br>
            <br>
            Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@kons=
ulko.com" target=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
            ---<br>
            =C2=A0.../python/<a href=3D"http://python3-pikepdf_10.0.2.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-pikepdf_10.0.2.bb</a>=C2=A0
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 22 +++++++++++++++++++<br>
            =C2=A01 file changed, 22 insertions(+)<br>
            =C2=A0create mode 100644 meta-python/recipes-devtools/python/<a=
 href=3D"http://python3-pikepdf_10.0.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python3-pikepdf_10.0.2.bb</a><br>
            <br>
            diff --git a/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-pikepdf_10.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-pikepdf_10.0.2.bb</a>
            b/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-pikepdf_10.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pikepdf_10=
.0.2.bb</a><br>
            new file mode 100644<br>
            index 0000000000..4821e273d8<br>
            --- /dev/null<br>
            +++ b/meta-python/recipes-devtools/python/<a href=3D"http://pyt=
hon3-pikepdf_10.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pikepd=
f_10.0.2.bb</a><br>
            @@ -0,0 +1,22 @@<br>
            +SUMMARY =3D &quot;Read and write PDFs with Python, powered by
            qpdf&quot;<br>
            +HOMEPAGE =3D &quot;<a href=3D"https://github.com/pikepdf/pikep=
df" rel=3D"noreferrer" target=3D"_blank">https://github.com/pikepdf/pikepdf=
</a>&quot;<br>
            +LICENSE =3D &quot;MPL-2.0&quot;<br>
            +LIC_FILES_CHKSUM =3D
            <a>&quot;file://LICENSE.txt;md5=3D9741c346eef56131163e13b9db124=
1b3&quot;</a><br>
            +<br>
            +SRC_URI[sha256sum] =3D
            &quot;7c85a2526253e35575edb2e28cdc740d004be4b7c5fda954f0e721ee1=
c423a52&quot;<br>
            +<br>
            +inherit pypi python_setuptools_build_meta<br>
            +<br>
            +PYPI_PACKAGE =3D &quot;pikepdf&quot;<br>
            +<br>
            +DEPENDS +=3D &quot; \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-pybind11-native \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0qpdf \<br>
            +&quot;<br>
            +<br>
            +RDEPENDS:${PN} +=3D &quot; \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-pillow \<br>
            +=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-lxml \<br>
            +&quot;<br>
            +<br>
            +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
          </blockquote>
          <div><br>
          </div>
          <div>That creates warnings in CI:</div>
          <div>
            <div>
              <pre><div><span><span>stdio: WARNING: Nothing PROVIDES &#39;n=
ativesdk-qpdf&#39; (but <a>virtual:nativesdk:/srv/pokybuild/yocto-worker/me=
ta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/</=
a><a href=3D"http://python3-pikepdf_10.0.2.bb" target=3D"_blank">python3-pi=
kepdf_10.0.2.bb</a> DEPENDS on or otherwise requires it). Close matches:</s=
pan></span></div><div><span><span>stdio: WARNING: Nothing PROVIDES &#39;qpd=
f-native&#39; (but <a>virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mi=
rror/build/meta-openembedded/meta-python/recipes-devtools/python/</a><a hre=
f=3D"http://python3-pikepdf_10.0.2.bb" target=3D"_blank">python3-pikepdf_10=
.0.2.bb</a> DEPENDS on or otherwise requires it). Close matches:</span></sp=
an></div><div><span><span>stdio: WARNING: Nothing RPROVIDES &#39;nativesdk-=
python3-pillow&#39; (but <a>virtual:nativesdk:/srv/pokybuild/yocto-worker/m=
eta-oe-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/<=
/a><a href=3D"http://python3-pikepdf_10.0.2.bb" target=3D"_blank">python3-p=
ikepdf_10.0.2.bb</a> RDEPENDS on or otherwise requires it)</span></span></d=
iv><div><span><span>stdio: WARNING: Nothing RPROVIDES &#39;nativesdk-python=
3-pikepdf&#39; (but <a>virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-o=
e-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/</a><a=
 href=3D"http://python3-pikepdf_10.0.2.bb" target=3D"_blank">python3-pikepd=
f_10.0.2.bb</a> RDEPENDS on or otherwise requires it)</span></span></div><d=
iv><span><span>stdio: WARNING: Nothing RPROVIDES &#39;nativesdk-python3-pik=
epdf-dev&#39; (but <a>virtual:nativesdk:/srv/pokybuild/yocto-worker/meta-oe=
-mirror/build/meta-openembedded/meta-python/recipes-devtools/python/</a><a =
href=3D"http://python3-pikepdf_10.0.2.bb" target=3D"_blank">python3-pikepdf=
_10.0.2.bb</a> RDEPENDS on or otherwise requires it)</span></span></div><di=
v><span><span>stdio: WARNING: Nothing RPROVIDES &#39;python3-pikepdf-native=
&#39; (but <a>virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/bui=
ld/meta-openembedded/meta-python/recipes-devtools/python/</a><a href=3D"htt=
p://python3-pikepdf_10.0.2.bb" target=3D"_blank">python3-pikepdf_10.0.2.bb<=
/a> RDEPENDS on or otherwise requires it)</span></span></div><div><span><sp=
an>stdio: WARNING: Nothing RPROVIDES &#39;python3-pikepdf-dev-native&#39; (=
but <a>virtual:native:/srv/pokybuild/yocto-worker/meta-oe-mirror/build/meta=
-openembedded/meta-python/recipes-devtools/python/</a><a href=3D"http://pyt=
hon3-pikepdf_10.0.2.bb" target=3D"_blank">python3-pikepdf_10.0.2.bb</a> RDE=
PENDS on or otherwise requires it)</span></span></div></pre>
            </div>
          </div>
          <div>From <a href=3D"https://autobuilder.yoctoproject.org/valkyri=
e/?#/builders/82/builds/526/steps/13/logs/stdio" target=3D"_blank">https://=
autobuilder.yoctoproject.org/valkyrie/?#/builders/82/builds/526/steps/13/lo=
gs/stdio</a></div>
          <div><br>
          </div>
          <div>Leon, can you look into it? (I guess some dependencies
            lack their BBCLASSEXTEND)</div>
        </div>
      </div>
    </blockquote>
    <p>Yes, thank you for pointing out these warnings. I have just
      submitted three patches that add native and nativesdk to
      BBCLASSEXTEND of the required python3-pikepdf dependencies.<br></p></=
div></blockquote><div><br></div><div>Sounds good, thanks!</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div><p>
      Best regards, Leon</p>
  </div>

</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000005335af0644944301--

