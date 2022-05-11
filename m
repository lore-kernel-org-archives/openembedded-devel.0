Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317B0C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 15:05:48 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web09.495.1652281540998473097
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 08:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hOBxVOyV;
 spf=pass (domain: gmail.com, ip: 209.85.219.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id j2so4664637ybu.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 May 2022 08:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DkhhQWcUpp02K5XakI7nB2qrEno1RiPXPy3S+QfUg0A=;
        b=hOBxVOyVs1uzsuLjFQ7T/Xe/go2SUx7noGncE7nhBEh+N/PPYOUToMrQj9C/B4J1tz
         5xBvmy9aNtuufFxD4KLJU7WxWR0H/1f0DvbyVcwp0y0hEsxUjREwjmXIfm1dg4bR4VLC
         9DL7B54wr2omG8zQoa/E8WRUIk9fOo+NRmT4ZcMuVX5fwmlxMCHuYu7Pk4C9J0xgN0rG
         BTUbjj9SZjPcnOnWEYB+A78NC0Ja8tIJihvQ47QGIFCbwKHyZmTjq6yHg7/aSw+8geVk
         pbZJhB4yNnZap8Hqjp9K5dXvFJCbD9TqQ/mTJ2F3FDcGO6ggsG2kedCMoQpqa8tej5nI
         wn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DkhhQWcUpp02K5XakI7nB2qrEno1RiPXPy3S+QfUg0A=;
        b=1tajYmda4yXucgS6mCkybIyzQpQX3yT+Y/FVaR3/JSIHYtVG93uOluOBIpbCnZ0bmn
         35E7/KOCGhwaUpyAsmSA+M7l5jAKg5od7Sr/yMNq5n8wcV6SsnnQ2jex4GmV2XxNBFtB
         wwPoi9O6Ug4tbnzfJFBybwB4ieK1RRL4smuC77yMGbG6xuXopEdO7v0xVuyrXrWYycgm
         biFD2qexiZdAuvPi5B8XW16tnqclBrU19kWKE7SrbkvxKk37+MzIija59LHwyCJzZuSN
         OIngZFyvt5cIp7hhiag4Z+tzftZGbqNn78XQG24tRUWKKjHBHfX8Ew4D42T+cifuOJjF
         J0tQ==
X-Gm-Message-State: AOAM532caOR1t6wzOj42a/tvhxadgfrnodgAlXMwsXlIN3L3w+7KtL66
	+ev9JbhqFYUueXwNzWmRyaSopaeeNSfzdCnRH80=
X-Google-Smtp-Source: 
 ABdhPJwELVEWXN5/CN2q46qLZJebLxPpagjBFX8v7sxgM5niAtyCykrQH2VjmBSfo5XQRKGbGEEucjaq3m2g5EyNajg=
X-Received: by 2002:a25:34ca:0:b0:645:716c:8cd1 with SMTP id
 b193-20020a2534ca000000b00645716c8cd1mr24551611yba.83.1652281540051; Wed, 11
 May 2022 08:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220511081409.3437145-1-jstephan@baylibre.com>
In-Reply-To: <20220511081409.3437145-1-jstephan@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 May 2022 08:05:29 -0700
Message-ID: 
 <CAMKF1sqmA_UF7zQtFQqdr46hqt+jsHYJbK2xCJJ=yEvy1s2RXA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][kirkstone][PATCH] libcamera: fix packaging
To: Julien STEPHAN <jstephan@baylibre.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004385e805debdc661"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 May 2022 15:05:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97036

--0000000000004385e805debdc661
Content-Type: text/plain; charset="UTF-8"

Is this needed on master as well ?

On Wed, May 11, 2022 at 1:16 AM Julien STEPHAN <jstephan@baylibre.com>
wrote:

> libcamera.so.0 and libcamera-base.so.0 are packaged in ${PN}-dev although
> they should be packaged in ${PN}. See poky/meta/conf/bitbake.conf.
> This trigger the following error when trying to run the `cam` utility
> (packaged inside ${PN}):
>
> $ cam -l
> cam: error while loading shared libraries: libcamera.so.0: cannot open
> shared object file: No such file or directory
>
> $ read-elf -d /usr/bin/cam
> Dynamic section at offset 0x2c740 contains 37 entries:
>   Tag        Type                         Name/Value
>  0x0000000000000001 (NEEDED)             Shared library: [libcamera.so.0]
>  0x0000000000000001 (NEEDED)             Shared library:
> [libcamera-base.so.0]
> [...]
>
> So package libcamera is broken and need to be installed along with
> libcamera-dev to be functionnal. Fix it by packaging libcamera.so.0 and
> libcamera-base.so.0 into ${PN}
>
> Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
> ---
>  meta-multimedia/recipes-multimedia/libcamera/libcamera.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> index 713626069..0b9f3f7a5 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> @@ -64,10 +64,10 @@ do_recalculate_ipa_signatures_package() {
>
>  FILES:${PN}-dev = "${includedir} ${libdir}/pkgconfig"
>  FILES:${PN}-dev += " ${libdir}/libcamera.so"
> -FILES:${PN}-dev += " ${libdir}/libcamera.so.0"
> +FILES:${PN} += " ${libdir}/libcamera.so.0"
>  FILES:${PN} += " ${libdir}/libcamera.so.0.0.0"
>  FILES:${PN}-dev += " ${libdir}/libcamera-base.so"
> -FILES:${PN}-dev += " ${libdir}/libcamera-base.so.0"
> +FILES:${PN} += " ${libdir}/libcamera-base.so.0"
>  FILES:${PN} += " ${libdir}/libcamera-base.so.0.0.0"
>  FILES:${PN} += " ${libdir}/v4l2-compat.so"
>  FILES:${PN}-gst = "${libdir}/gstreamer-1.0/libgstlibcamera.so"
> --
> 2.35.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97034):
> https://lists.openembedded.org/g/openembedded-devel/message/97034
> Mute This Topic: https://lists.openembedded.org/mt/91031240/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000004385e805debdc661
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Is this needed on master as well ?</div><div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 11, 20=
22 at 1:16 AM Julien STEPHAN &lt;<a href=3D"mailto:jstephan@baylibre.com">j=
stephan@baylibre.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>libcamera.so.0 and libcamera-base.so.0 are packaged in ${PN}-dev although<=
br>
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

--0000000000004385e805debdc661--

