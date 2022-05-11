Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C33C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 15:23:48 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.808.1652282626803845245
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 08:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=dwOk1ML8;
 spf=pass (domain: baylibre.com, ip: 209.85.167.45,
 mailfrom: jstephan@baylibre.com)
Received: by mail-lf1-f45.google.com with SMTP id d15so4193134lfk.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 08:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6BS+RguKhCQzt8VqUJ+mq/Msyl/ab+enCGadumrLB2k=;
        b=dwOk1ML83tsKPMbJL85xpHUOgMnclX6oAC9cFSte+fDv/2LS08wKcf+78cqVyrr/fs
         mOVL9EzF52i+s37bvqI9JQi+p/j+kS2iEIWLY1Re3vsJCsl1gNxB+FixtWkZCd+TOdRa
         JLYh1XzGMpNXwt6w9SjuAFj4NsOyq2Mxg6f+5LPHYxM8OyBGE9yL7+80eMFyQSk7XA3Z
         x1czn3JdD1tVkKXTIIxcpX7iwPVt4HaWhUIhI/rzSt7faCio2rxp9g9L1FmDcM3ughOH
         6ieF1A9Jib62+KkMnBNmKfIC0ZeMfsd0EYDzKiiyHRJ8UGOGozGDbM3VgChWn+ILpKzs
         dAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6BS+RguKhCQzt8VqUJ+mq/Msyl/ab+enCGadumrLB2k=;
        b=2gjeyOLtQs4F4jAupW3kXM+20V/IDAnhhdGPnwSGqrUen2D2z4M9pz8tFyij4XEMBX
         8lOb2fflENGybTvgRyetT5pc6UaXEFbmgbUlmgZ0+bqgddYH4LWfXcmto5eSO7+ckyWF
         vUU2SpALM26n8Ld78AI4GdUhI32r61HJy6yM17omneSdBwVdAp/tNSIXuzDAN1Gc7kk1
         oskFezL9XDk+MlHpTFMnyMGrKbjea9iycwEnTMAcfVNtUPPrU+X7NnV0uWRoyuW3r/a8
         vnhdoV2qU96VtalnvhTGZJvnyOZsxOr0LtBR7R5yYxXicGuf091LxdYwBYY4X3K7YCOU
         0Jsw==
X-Gm-Message-State: AOAM533xL2aks3KLli4x8sUraTNRiRBrzpfpdNw6uZqSr3cbZGxvV7bD
	oao3sEVcYMMyk/PzX0B/X3zSlO2eKdBRCXe3mEINTw==
X-Google-Smtp-Source: 
 ABdhPJx8axMpLaep8gPuaIE47QYTsawntBbMGKw8Ka4B8jjT1yyzD+ffChaY61xBXym+9rg2OexxTZXVhueOSkTjTbw=
X-Received: by 2002:a05:6512:3f82:b0:474:200a:7fb3 with SMTP id
 x2-20020a0565123f8200b00474200a7fb3mr13208362lfa.669.1652282624859; Wed, 11
 May 2022 08:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220511081409.3437145-1-jstephan@baylibre.com>
 <CAMKF1sqmA_UF7zQtFQqdr46hqt+jsHYJbK2xCJJ=yEvy1s2RXA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqmA_UF7zQtFQqdr46hqt+jsHYJbK2xCJJ=yEvy1s2RXA@mail.gmail.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 11 May 2022 17:21:50 +0200
Message-ID: 
 <CAEHHSvaSVd0U2RZLHJtO3sHoCSDHciPnw-U0sbdDEzz0AsbDxQ@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][kirkstone][PATCH] libcamera: fix packaging
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ec84c605debe0659"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 May 2022 15:23:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97040

--000000000000ec84c605debe0659
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yes I think it should be also ported on master

Le mer. 11 mai 2022 =C3=A0 17:05, Khem Raj <raj.khem@gmail.com> a =C3=A9cri=
t :

> Is this needed on master as well ?
>
> On Wed, May 11, 2022 at 1:16 AM Julien STEPHAN <jstephan@baylibre.com>
> wrote:
>
>> libcamera.so.0 and libcamera-base.so.0 are packaged in ${PN}-dev althoug=
h
>> they should be packaged in ${PN}. See poky/meta/conf/bitbake.conf.
>> This trigger the following error when trying to run the `cam` utility
>> (packaged inside ${PN}):
>>
>> $ cam -l
>> cam: error while loading shared libraries: libcamera.so.0: cannot open
>> shared object file: No such file or directory
>>
>> $ read-elf -d /usr/bin/cam
>> Dynamic section at offset 0x2c740 contains 37 entries:
>>   Tag        Type                         Name/Value
>>  0x0000000000000001 (NEEDED)             Shared library: [libcamera.so.0=
]
>>  0x0000000000000001 (NEEDED)             Shared library:
>> [libcamera-base.so.0]
>> [...]
>>
>> So package libcamera is broken and need to be installed along with
>> libcamera-dev to be functionnal. Fix it by packaging libcamera.so.0 and
>> libcamera-base.so.0 into ${PN}
>>
>> Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
>> ---
>>  meta-multimedia/recipes-multimedia/libcamera/libcamera.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>> b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>> index 713626069..0b9f3f7a5 100644
>> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
>> @@ -64,10 +64,10 @@ do_recalculate_ipa_signatures_package() {
>>
>>  FILES:${PN}-dev =3D "${includedir} ${libdir}/pkgconfig"
>>  FILES:${PN}-dev +=3D " ${libdir}/libcamera.so"
>> -FILES:${PN}-dev +=3D " ${libdir}/libcamera.so.0"
>> +FILES:${PN} +=3D " ${libdir}/libcamera.so.0"
>>  FILES:${PN} +=3D " ${libdir}/libcamera.so.0.0.0"
>>  FILES:${PN}-dev +=3D " ${libdir}/libcamera-base.so"
>> -FILES:${PN}-dev +=3D " ${libdir}/libcamera-base.so.0"
>> +FILES:${PN} +=3D " ${libdir}/libcamera-base.so.0"
>>  FILES:${PN} +=3D " ${libdir}/libcamera-base.so.0.0.0"
>>  FILES:${PN} +=3D " ${libdir}/v4l2-compat.so"
>>  FILES:${PN}-gst =3D "${libdir}/gstreamer-1.0/libgstlibcamera.so"
>> --
>> 2.35.2
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#97034):
>> https://lists.openembedded.org/g/openembedded-devel/message/97034
>> Mute This Topic: https://lists.openembedded.org/mt/91031240/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000ec84c605debe0659
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">yes I think it should be also ported on master<br></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0=
mer. 11 mai 2022 =C3=A0=C2=A017:05, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">Is this needed=
 on master as well ?</div><div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, May 11, 2022 at 1:16 AM Julien STEPHAN &lt=
;<a href=3D"mailto:jstephan@baylibre.com" target=3D"_blank">jstephan@baylib=
re.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">libcamera.so.0 and libcamera-base.so.0 are packaged in ${PN}-dev alth=
ough<br>
they should be packaged in ${PN}. See poky/meta/conf/bitbake.conf.<br>
This trigger the following error when trying to run the `cam` utility<br>
(packaged inside ${PN}):<br>
<br>
$ cam -l<br>
cam: error while loading shared libraries: libcamera.so.0: cannot open shar=
ed object file: No such file or directory<br>
<br>
$ read-elf -d /usr/bin/cam<br>
Dynamic section at offset 0x2c740 contains 37 entries:<br>
=C2=A0 Tag=C2=A0 =C2=A0 =C2=A0 =C2=A0 Type=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Name/Value<br>
=C2=A00x0000000000000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Shared library: [libcamera.so.0]<br>
=C2=A00x0000000000000001 (NEEDED)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Shared library: [libcamera-base.so.0]<br>
[...]<br>
<br>
So package libcamera is broken and need to be installed along with<br>
libcamera-dev to be functionnal. Fix it by packaging libcamera.so.0 and<br>
libcamera-base.so.0 into ${PN}<br>
<br>
Signed-off-by: Julien STEPHAN &lt;<a href=3D"mailto:jstephan@baylibre.com" =
target=3D"_blank">jstephan@baylibre.com</a>&gt;<br>
---<br>
=C2=A0meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http://libcam=
era.bb" rel=3D"noreferrer" target=3D"_blank">libcamera.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http:/=
/libcamera.bb" rel=3D"noreferrer" target=3D"_blank">libcamera.bb</a> b/meta=
-multimedia/recipes-multimedia/libcamera/<a href=3D"http://libcamera.bb" re=
l=3D"noreferrer" target=3D"_blank">libcamera.bb</a><br>
index 713626069..0b9f3f7a5 100644<br>
--- a/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http://libcam=
era.bb" rel=3D"noreferrer" target=3D"_blank">libcamera.bb</a><br>
+++ b/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http://libcam=
era.bb" rel=3D"noreferrer" target=3D"_blank">libcamera.bb</a><br>
@@ -64,10 +64,10 @@ do_recalculate_ipa_signatures_package() {<br>
<br>
=C2=A0FILES:${PN}-dev =3D &quot;${includedir} ${libdir}/pkgconfig&quot;<br>
=C2=A0FILES:${PN}-dev +=3D &quot; ${libdir}/libcamera.so&quot;<br>
-FILES:${PN}-dev +=3D &quot; ${libdir}/libcamera.so.0&quot;<br>
+FILES:${PN} +=3D &quot; ${libdir}/libcamera.so.0&quot;<br>
=C2=A0FILES:${PN} +=3D &quot; ${libdir}/libcamera.so.0.0.0&quot;<br>
=C2=A0FILES:${PN}-dev +=3D &quot; ${libdir}/libcamera-base.so&quot;<br>
-FILES:${PN}-dev +=3D &quot; ${libdir}/libcamera-base.so.0&quot;<br>
+FILES:${PN} +=3D &quot; ${libdir}/libcamera-base.so.0&quot;<br>
=C2=A0FILES:${PN} +=3D &quot; ${libdir}/libcamera-base.so.0.0.0&quot;<br>
=C2=A0FILES:${PN} +=3D &quot; ${libdir}/v4l2-compat.so&quot;<br>
=C2=A0FILES:${PN}-gst =3D &quot;${libdir}/gstreamer-1.0/libgstlibcamera.so&=
quot;<br>
-- <br>
2.35.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#97034): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/97034" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/97034</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91031240/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91031240/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div>

--000000000000ec84c605debe0659--

