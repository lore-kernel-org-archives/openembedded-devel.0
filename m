Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19553CD342C
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 14:47:40 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20448.1778078855126700971
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2026 07:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IVumRazo;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-67cac5ece75so5074055a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 07:47:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778078853; cv=none;
        d=google.com; s=arc-20240605;
        b=kr+De5CWWbHD8jS1s3sMuUuNNxPgulDlIDxnl8TXYz5wsGCWBABVYP9Ch4ntWgSCaj
         pBDSC8RuBFpenWkHguXhVmU7sU9GwPLJzdiEVfUAjj7h5EW6MJKyg25nuFpsJQo93v9D
         JA8alBz9OPNbs2yQwHWXnqSykMZ60BFRflZD1qw2Ek0EYdgKlMpBZbV7zUrSKEEC7uxP
         1jGgQRqHk+5kSkAb6P3Tx+paEcgIgDaz0H6EpbIxAourTvkEsQrurczf1AA8WD+Uq8GH
         UFY96Qsyzi6kBf5re5z4lvk7V8AgYI2MVkW/XsIk2YzQd+IdxBUU8300fMBEml04FJM9
         Rizg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gYqaI0nTK+ZbD6VoD/DRjQ1HApZa7fU0Zg2nyc0sFcU=;
        fh=UE1XI8I3V1NFx4bAc9BHXYEibEpNSgYq1XZLLpwJ1W0=;
        b=OB1/zYSYuGfkwBzZ7SaPV9S9SJ3zEeKes03zzqjX13HCRTzhjxNDGDq73giQuTXoMT
         N7+zswuFokG3EH2HG945sj2tEytD+d4yVynhaG/s7NLTpurgQh1zD5TPD7VxiE8EZUmz
         hQmI/Qmkop9sYRc8NfcDjNr0eShhxK4/550A8xdfaIW8XjpuMgA/SZ7INUp0WQkWEVNa
         JMHyoiitNVWB748Oh0pYQEaN/xumql23WmfrF36Wr2lWV+M2wJHnYf6YC6ztFQnLQbzS
         BGFYweNV1AWzpriVgi/koXp2aJ+wnZSZpbDsT/M4Mz6Sz9Us2Ye4uy2Bfq7ULEH5v34T
         LT5w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778078853; x=1778683653; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gYqaI0nTK+ZbD6VoD/DRjQ1HApZa7fU0Zg2nyc0sFcU=;
        b=IVumRazo4+Gr3Z+EbVvWQuyGpqO1vk7UJLGZu0M8NHQ4ygmr+C2eYEaAKsCIkfMhOb
         2d6jqNcKmIQaMDnnbcANT++//283Q//EbEtjVOKosf4VYtxW/5sAbNJQVocPNx+03YKU
         LUu7Tua6qMM5W+7PXmhuB1dhCdVq4kc1+H2+DYonrVNP8BL1rGV5t4vkcQ95dt5qwkdb
         QDljW5qxAiw7nWIUuaCgGzR07fzYW4vOb4zRhFqx5D0l7iRtqzg60od60ie6fOcRAzlz
         OUoUtmdLTVMZ5DRRHL435zqwTg7/bbzkTlZ/qGl6x+N/ahciXw9kXqc4fJrSuWCZqDuK
         b2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778078853; x=1778683653;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYqaI0nTK+ZbD6VoD/DRjQ1HApZa7fU0Zg2nyc0sFcU=;
        b=LbyU8yUUoZCSs/Yo3yMsovhKfFLv95HZq/0msR12Vc6gbBh0tpusjxcFMA2TxwXyOj
         hQxgdo7kJQq3xyQ8YVaSN0xv8FFowDZcVk9gji89fyB+7BtTvlxlFQWGgDl83Y69Ls0P
         x0QdpwGVa38fVEjs8lQTRWT4IaMudwB8rNJzvcg9/OCULL8nL+FTBbRIsR4sTG+4TrJm
         C2lKpRiyP9eSDbMcv7akZioJQGsiorScJpIJky/5V0P1k/qVRdt2t6ZQUK//gt6nCEin
         nV79jMi+rZenXyscVIoGR0FUcSShvkMMN14zTjAfqoqHBfO1685JYqcvoiAHI/DZFcKu
         YTNw==
X-Gm-Message-State: AOJu0YxNm9cgflAsW/oPKBcqDAkEcrE+apxzdypPZOTWfdvRnLO//PWB
	KgFOTovKLYOY0w1Ub5jRK60wW5hon4jqZ//QFKyv7nm2ynYfDgNOuVJEtaxJ0klmO2h9byR4m8Q
	W4d9iQ6qU3WBN0nOqdEGBikSuq3eNOYA=
X-Gm-Gg: AeBDievkWJHer6gny86mJ4gAX00idxmhHTwcntI7RjcLTQZyOAcjMNQ53yZP4j3ODRn
	wMEa3+LpQhhWg+NqDEZnW94OJqA1jvrlfr8gwurBcDNovXea1UfQPPiFlSc4lk0JgVzlAzYHqJy
	YtMbYs8D+cAEJYOz6BapziSCJpzwK8y6ULg9DPWs1pJZAve/TbXuADTtRXwRWnuZmaaaOjwpx9i
	RvbvSz17CtUdXGoogZDq6iLTf4A2l9BdajFsDnT1KXavdgW4gW3qab4+z3+s6TmdOJuFuZeIVnQ
	PNM+lQQz6K1wJD9RNZ72hK810UQhEAxV+ZMP09vGU+Frx1yoymtroLYaBAH/TQp401cJFLOuMBD
	REJ9I
X-Received: by 2002:a17:907:98d:b0:bc3:6b0e:1686 with SMTP id
 a640c23a62f3a-bc56f30a6bemr197014566b.37.1778078853263; Wed, 06 May 2026
 07:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260506111552.2782-1-jose.quaresma@foundries.io>
 <20260506111552.2782-2-jose.quaresma@foundries.io> <177806940817.45302.5857955111130743302@ping.linuxembedded.co.uk>
In-Reply-To: <177806940817.45302.5857955111130743302@ping.linuxembedded.co.uk>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 6 May 2026 15:47:21 +0100
X-Gm-Features: AVHnY4KFn_curNghochewMU8nbw9pBY-eSYiOj-fOcKY0uy-dQgapYih_epsXE8
Message-ID: <CANPvuR=Pz40_AKwSdE-2wWSst9P2X-rY9rN5-Ui21VpUAMqz2A@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 2/6] libcamera: add configs pipelines for testing
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: openembedded-devel@lists.openembedded.org, jose.quaresma@oss.qualcomm.com, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000006e75e00651273e86"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 14:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126805

--0000000000006e75e00651273e86
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kieran,

Kieran Bingham <kieran.bingham@ideasonboard.com> escreveu (quarta,
6/05/2026 =C3=A0(s) 13:10):

> Hi Jose,
>
> Quoting Jose Quaresma (2026-05-06 12:15:48)
> > vimc:
> > Is a driver that emulates complex video hardware, and is
> > useful for testing libcamera without needing access to a physical
> > camera. We would like to add support to the libcamera vimc
> > pipeline handler for multiple simultaneous streams, to ease
> > testing of such mechanism. This also requires adding multistream
> > support to the vimc driver in the Linux kernel.
> >
> > virtual:
> > Is a specialized handler designed to create software-based,
> > virtual camera devices. It allows for testing, debugging, and
> > simulating camera pipelines without needing physical hardware,
> > often producing test patterns (e.g., all green frames) via qcam.
> > This enables developers to emulate camera sensors and
> > Image Signal Processors (ISPs) within the libcamera
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  .../recipes-multimedia/libcamera/libcamera_0.6.0.bb       | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-multimedia/recipes-multimedia/libcamera/
> libcamera_0.6.0.bb b/meta-multimedia/recipes-multimedia/libcamera/
> libcamera_0.6.0.bb
> > index 4dce26a5d0..1f9e21e45b 100644
> > --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
> > +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
> > @@ -28,12 +28,16 @@ PACKAGECONFIG[dng] =3D ",,tiff"
> >  PACKAGECONFIG[gst] =3D
> "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabled,gstreamer1.0
> gstreamer1.0-plugins-base"
> >  PACKAGECONFIG[pycamera] =3D
> "-Dpycamera=3Denabled,-Dpycamera=3Ddisabled,python3 python3-pybind11"
> >  PACKAGECONFIG[raspberrypi] =3D ",,libpisp"
> > +PACKAGECONFIG[vimc] =3D ",,"
> > +PACKAGECONFIG[virtual] =3D ",,libyuv libjpeg-turbo"
> >
> > +ARM_PIPELINES =3D "imx8-isi,mali-c55,simple,uvcvideo"
> >  # Raspberry Pi requires the meta-raspberrypi layer
> >  # These values are coming from the project's meson.build file,
> >  # which lists the supported values by arch.
> > -ARM_PIPELINES =3D "${@bb.utils.contains('PACKAGECONFIG', 'raspberrypi'=
,
> 'rpi/pisp,rpi/vc4,', '', d)}"
> > -ARM_PIPELINES .=3D "imx8-isi,mali-c55,simple,uvcvideo"
> > +ARM_PIPELINES .=3D "${@bb.utils.contains('PACKAGECONFIG', 'raspberrypi=
',
> ',rpi/pisp,rpi/vc4', '', d)}"
>
>
> > +ARM_PIPELINES .=3D "${@bb.utils.contains('PACKAGECONFIG', 'vimc',
> ',vimc', '', d)}"
> > +ARM_PIPELINES .=3D "${@bb.utils.contains('PACKAGECONFIG', 'virtual',
> ',virtual', '', d)}"
>
> These are not 'ARM' pipelines. Maybe they should be categorised
> separately as test platforms ?
>

I thought about that, but pipelines are only chosen in arm/aarch64, and for
all other architectures we have 'auto'
which is not deterministic and will enable everything possible.

LIBCAMERA_PIPELINES ??=3D "auto"
LIBCAMERA_PIPELINES:arm ??=3D "${ARM_PIPELINES}"
LIBCAMERA_PIPELINES:aarch64 ??=3D "${ARM_PIPELINES}"

Therefore, this change will work the same way in ARM and the others.
The 'vimc' is already part of 'auto' because it has no dependencies and
'virtual' will also be enabled in 'auto' when chosen in PACKAGECONFIG,
given that the dependencies will be in the sysroot.
That's if I understood correctly; correct me if I'm wrong.

I could add a TEST_PIPELINES but I think that would complicate things
too much because I don't see how I would use it together with the 'auto'.

Jose


>
> --
> Kieran
>
>
>
> >
> >  LIBCAMERA_PIPELINES ??=3D "auto"
> >  LIBCAMERA_PIPELINES:arm ??=3D "${ARM_PIPELINES}"
> > --
> > 2.54.0
> >
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000006e75e00651273e86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"color:rgb(0,0,0)">Hi Kiera=
n,</span></div><br><div class=3D"gmail_quote gmail_quote_container"><div di=
r=3D"ltr" class=3D"gmail_attr">Kieran Bingham &lt;<a href=3D"mailto:kieran.=
bingham@ideasonboard.com">kieran.bingham@ideasonboard.com</a>&gt; escreveu =
(quarta, 6/05/2026 =C3=A0(s) 13:10):<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hi Jose,<br>
<br>
Quoting Jose Quaresma (2026-05-06 12:15:48)<br>
&gt; vimc:<br>
&gt; Is a driver that emulates complex video hardware, and is<br>
&gt; useful for testing libcamera without needing access to a physical<br>
&gt; camera. We would like to add support to the libcamera vimc<br>
&gt; pipeline handler for multiple simultaneous streams, to ease<br>
&gt; testing of such mechanism. This also requires adding multistream<br>
&gt; support to the vimc driver in the Linux kernel.<br>
&gt; <br>
&gt; virtual:<br>
&gt; Is a specialized handler designed to create software-based,<br>
&gt; virtual camera devices. It allows for testing, debugging, and<br>
&gt; simulating camera pipelines without needing physical hardware,<br>
&gt; often producing test patterns (e.g., all green frames) via qcam.<br>
&gt; This enables developers to emulate camera sensors and<br>
&gt; Image Signal Processors (ISPs) within the libcamera<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-multimedia/libcamera/<a href=3D"http://libcamera_0.6=
.0.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.6.0.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 8 ++++++--<br>
&gt;=C2=A0 1 file changed, 6 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"h=
ttp://libcamera_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.=
6.0.bb</a> b/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http:/=
/libcamera_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.6.0.b=
b</a><br>
&gt; index 4dce26a5d0..1f9e21e45b 100644<br>
&gt; --- a/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http://l=
ibcamera_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.6.0.bb<=
/a><br>
&gt; +++ b/meta-multimedia/recipes-multimedia/libcamera/<a href=3D"http://l=
ibcamera_0.6.0.bb" rel=3D"noreferrer" target=3D"_blank">libcamera_0.6.0.bb<=
/a><br>
&gt; @@ -28,12 +28,16 @@ PACKAGECONFIG[dng] =3D &quot;,,tiff&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[gst] =3D &quot;-Dgstreamer=3Denabled,-Dgstreamer=
=3Ddisabled,gstreamer1.0 gstreamer1.0-plugins-base&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[pycamera] =3D &quot;-Dpycamera=3Denabled,-Dpycamer=
a=3Ddisabled,python3 python3-pybind11&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[raspberrypi] =3D &quot;,,libpisp&quot;<br>
&gt; +PACKAGECONFIG[vimc] =3D &quot;,,&quot;<br>
&gt; +PACKAGECONFIG[virtual] =3D &quot;,,libyuv libjpeg-turbo&quot;<br>
&gt;=C2=A0 <br>
&gt; +ARM_PIPELINES =3D &quot;imx8-isi,mali-c55,simple,uvcvideo&quot;<br>
&gt;=C2=A0 # Raspberry Pi requires the meta-raspberrypi layer<br>
&gt;=C2=A0 # These values are coming from the project&#39;s meson.build fil=
e,<br>
&gt;=C2=A0 # which lists the supported values by arch.<br>
&gt; -ARM_PIPELINES =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;,=
 &#39;raspberrypi&#39;, &#39;rpi/pisp,rpi/vc4,&#39;, &#39;&#39;, d)}&quot;<=
br>
&gt; -ARM_PIPELINES .=3D &quot;imx8-isi,mali-c55,simple,uvcvideo&quot;<br>
&gt; +ARM_PIPELINES .=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;=
, &#39;raspberrypi&#39;, &#39;,rpi/pisp,rpi/vc4&#39;, &#39;&#39;, d)}&quot;=
<br>
<br>
<br>
&gt; +ARM_PIPELINES .=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;=
, &#39;vimc&#39;, &#39;,vimc&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +ARM_PIPELINES .=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;=
, &#39;virtual&#39;, &#39;,virtual&#39;, &#39;&#39;, d)}&quot;<br>
<br>
These are not &#39;ARM&#39; pipelines. Maybe they should be categorised<br>
separately as test platforms ?<br></blockquote><div><br></div><div>I though=
t about that, but pipelines are only chosen in arm/aarch64, and for all oth=
er architectures we have &#39;auto&#39;=C2=A0</div><div>which is not determ=
inistic and will enable everything possible.</div><div><br></div><div>LIBCA=
MERA_PIPELINES ??=3D &quot;auto&quot;<br>LIBCAMERA_PIPELINES:arm ??=3D &quo=
t;${ARM_PIPELINES}&quot;<br>LIBCAMERA_PIPELINES:aarch64 ??=3D &quot;${ARM_P=
IPELINES}&quot;<br><br>Therefore, this change will work the same way in ARM=
 and the others.</div><div>The &#39;vimc&#39; is already part of &#39;auto&=
#39; because it has no dependencies and=C2=A0</div><div>&#39;virtual&#39; w=
ill also be enabled in &#39;auto&#39;=C2=A0when chosen in PACKAGECONFIG,</d=
iv><div>given that the dependencies will be in the sysroot.</div><div>That&=
#39;s if I understood correctly; correct me if I&#39;m wrong.</div><div><br=
></div><div>I could add a TEST_PIPELINES but I think that would complicate =
things</div><div>too much because I don&#39;t see how I would use it togeth=
er with the &#39;auto&#39;.</div><div><br></div><div>Jose</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
--<br>
Kieran<br>
<br>
<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 LIBCAMERA_PIPELINES ??=3D &quot;auto&quot;<br>
&gt;=C2=A0 LIBCAMERA_PIPELINES:arm ??=3D &quot;${ARM_PIPELINES}&quot;<br>
&gt; -- <br>
&gt; 2.54.0<br>
&gt; <br>
&gt;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--0000000000006e75e00651273e86--

