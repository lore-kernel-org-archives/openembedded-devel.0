Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3EFC369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 17:17:31 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.11762.1745601441096635879
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Apr 2025 10:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hy1WNWaP;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-603f54a6cb5so1617486eaf.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 10:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745601440; x=1746206240; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v388v6J2ZkLil2TGC7/iDebWkwh3/vSK1Fev2b30oEg=;
        b=Hy1WNWaPU5Px3BMTTbIQgBsgRgYsiy3RQLAxmKs4R8c9Bf1YeaN9kCtCm5fruv+Lvu
         bA+i/UeyaJmjb4YKe6Or8uanQ5QJ+RDt4YFQwTPkqs3N/DViJRhis9UJIXpAVELzlX6l
         +D6dRd4+KxXzV4lxPwlITcrB9CWvyeEELbJEAKTxhKfLUqwUtmxHrlhA5+wlehxb2fzE
         OvZuVXZgmGy4vkPxM41A7gyi7PMKPrkUNn8E6tvRyYaNEz0vhk2l3wHnJvXZeVcrdVD4
         TrPSCWkhilKfY2Yjdzf+XyM8kfOyf3eZTWBpb+UiVvDOqFYheEZwVuTBLj/1XXTmXb18
         RGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745601440; x=1746206240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v388v6J2ZkLil2TGC7/iDebWkwh3/vSK1Fev2b30oEg=;
        b=WWSAORO3cVP+s2IXh/mw9q40cJyYzTQbblUpiaTMSno9rSbQfsIo+Le6gaxTvNCoGW
         tks2HeTIGhfvvOYh/kucNloUVfXYKbX6lKZdGFzkocNVnldkDZT1AYhlmX400b5L62dI
         HbL/3XPiFxs3fj/j3KO/YmIFSRFW89s38L5/j9kvMXgoGQeDgABjrIUYFZUmGpzpisMY
         slUTjvatlLHpI2vraTBbo/TMR1MPBmL8A71wmxNwnY3LNoH2W/eOFam6if9Ub3ziHsGm
         ka7NcSMUJd3qd4C2S8FJirEQPNFM56CO81qyKCsgTjSQddt5YwmgJzTkVMzHoUddxxSs
         c3xQ==
X-Gm-Message-State: AOJu0Yzw+bnwLRl69WZsPdNn2Vgbr5oCiwkYW5Jd4+JK+3C5bqsTnpHK
	rR0zevJ6zvrJgBU1DgRyJrzMAipLHDJJmJx6ErLEvTmBjzsROUfG6SbP5hT2phZTbEOwZ23rxQd
	NUaGEYDPSbcAp1Mqy9yVTRvdvzt0=
X-Gm-Gg: ASbGncu76lBXgYmF3W6f06oqQL/a9GiflGgiGBmvUty/D/UP6FNireGCxkdvDDKxkfj
	GnnqnLq3RH7vEpzJO0IzetblZzUvcL7WwYT4IguD5LQhuQPDZciyuAkOS0l0wzRRmgtSM501yyW
	0DuYxU/V/m/LelNb1PKDmvOihy3QfzLQ6LauGW1CNeH52Ir7sv2+2kf4w=
X-Google-Smtp-Source: AGHT+IFa0l6nwA44oES/DyBvcDQh6wP47VaVfcJUtr5Pb4K9gFJkFztVmqHDp74sC232T8OpCAngIR6W7r6GPY5IuR0=
X-Received: by 2002:a05:6820:1e02:b0:601:d224:5213 with SMTP id
 006d021491bc7-60652a41c1cmr1718130eaf.1.1745601440255; Fri, 25 Apr 2025
 10:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250424210659.2282492-1-f_l_k@t-online.de> <62c3c5ed-878b-4498-bd18-6fc487051245@gmail.com>
 <9J9AVS.14KZCG9KXDF63@t-online.de>
In-Reply-To: <9J9AVS.14KZCG9KXDF63@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Apr 2025 10:17:09 -0700
X-Gm-Features: ATxdqUGwcN0_wrEmJ1NkYWkyaEw0t3Py7f4bLk4n-kbDnH_1vHBlmy3M5m1fzpc
Message-ID: <CAMKF1spO7SKk=pd8Hz50UfwFGDiO6znw-rRsD8AeJaFsM_Eyag@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] libsdl3-ttf: make use of virtual/libsdl3
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c4133e06339d81da"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 17:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117134

--000000000000c4133e06339d81da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 9:52=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:

> This is not necessary but since you added virtual/libsdl3 in
> libsdl3-image, I assumed you wanted it that way
>
> https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D4613cf385460f973d1fe3c75336ce44e141ae9f4
>
>
I actually should have meant virtual/libsdl2 may be send a patch to make it
libsdl3 and also remove it from PROVIDES in libsdl3

On Fri, Apr 25 2025 at 09:43:15 -07:00:00, Khem Raj via
> lists.openembedded.org <raj.khem=3Dgmail.com@lists.openembedded.org> wrot=
e:
>
> On 4/24/25 2:06 PM, Markus Volk via lists.openembedded.org wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de> ---
> meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb | 2 +- 1 file
> changed, 1 insertion(+), 1 deletion(-) diff --git
> a/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb
> b/meta-oe/recipes-graphics/libsdl3/libsdl3-ttf_3.2.2.bb index
> f914d1dcff..4bc84ec6ee 100644 --- a/meta-oe/recipes-graphics/libsdl3/
> libsdl3-ttf_3.2.2.bb +++ b/meta-oe/recipes-graphics/libsdl3/
> libsdl3-ttf_3.2.2.bb @@ -1,6 +1,6 @@ SUMMARY =3D "Simple DirectMedia Laye=
r
> truetype font library" SECTION =3D "libs" -DEPENDS =3D "libsdl3 freetype"
> +DEPENDS =3D "virtual/libsdl3 freetype"
>
> I see that libsdl3 recipe does PROVIDE virtual/libsdl3 but is it required
> ? are there multiple providers for libsdl3 available to choose from ?
>
> LICENSE =3D "Zlib" LIC_FILES_CHKSUM =3D "
> file://LICENSE.txt;md5=3Dfbb0010b2f7cf6e8a13bcac1ef4d2455"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this
> group. View/Reply Online (#117132):
> https://lists.openembedded.org/g/openembedded-devel/message/117132 Mute
> This Topic: https://lists.openembedded.org/mt/112441095/3618223 Group
> Owner: openembedded-devel+owner@lists.openembedded.org Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c4133e06339d81da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Apr 25, 2025 at 9:52=E2=80=AFAM Markus Volk &l=
t;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D"m_-5965103452811363291geary=
-body" dir=3D"auto"><div>This is not necessary but since you added virtual/=
libsdl3 in libsdl3-image, I assumed you wanted it that way</div><div><a hre=
f=3D"https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next=
&amp;id=3D4613cf385460f973d1fe3c75336ce44e141ae9f4" target=3D"_blank">https=
://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&amp;id=3D=
4613cf385460f973d1fe3c75336ce44e141ae9f4</a></div></div><div id=3D"m_-59651=
03452811363291geary-quote" dir=3D"auto"><br></div></blockquote><div dir=3D"=
auto"><br></div><div dir=3D"auto">I actually should have meant virtual/libs=
dl2 may be send a patch to make it libsdl3 and also remove it from PROVIDES=
 in libsdl3=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div id=3D"m_-5965103452811363291geary-quote" dir=3D"auto">On Fri, A=
pr 25 2025 at 09:43:15 -07:00:00, Khem Raj via <a href=3D"http://lists.open=
embedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;raj.khem=3D<=
a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.=
com@lists.openembedded.org</a>&gt; wrote:<br><blockquote type=3D"cite"><div=
 style=3D"white-space:break-spaces">On 4/24/25 2:06 PM, Markus Volk via <a =
href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded=
.org</a> wrote:
<blockquote>Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online=
.de" target=3D"_blank">f_l_k@t-online.de</a>&gt;
---
  meta-oe/recipes-graphics/libsdl3/<a href=3D"http://libsdl3-ttf_3.2.2.bb" =
target=3D"_blank">libsdl3-ttf_3.2.2.bb</a> | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libsdl3/<a href=3D"http://libsdl3-ttf=
_3.2.2.bb" target=3D"_blank">libsdl3-ttf_3.2.2.bb</a> b/meta-oe/recipes-gra=
phics/libsdl3/<a href=3D"http://libsdl3-ttf_3.2.2.bb" target=3D"_blank">lib=
sdl3-ttf_3.2.2.bb</a>
index f914d1dcff..4bc84ec6ee 100644
--- a/meta-oe/recipes-graphics/libsdl3/<a href=3D"http://libsdl3-ttf_3.2.2.=
bb" target=3D"_blank">libsdl3-ttf_3.2.2.bb</a>
+++ b/meta-oe/recipes-graphics/libsdl3/<a href=3D"http://libsdl3-ttf_3.2.2.=
bb" target=3D"_blank">libsdl3-ttf_3.2.2.bb</a>
@@ -1,6 +1,6 @@
  SUMMARY =3D &quot;Simple DirectMedia Layer truetype font library&quot;
  SECTION =3D &quot;libs&quot;
-DEPENDS =3D &quot;libsdl3 freetype&quot;
+DEPENDS =3D &quot;virtual/libsdl3 freetype&quot;
</blockquote>
I see that libsdl3 recipe does PROVIDE virtual/libsdl3 but is it=20
required ? are there multiple providers for libsdl3 available to choose=20
from ?

<blockquote>  LICENSE =3D &quot;Zlib&quot;
  LIC_FILES_CHKSUM =3D &quot;<a>file://LICENSE.txt;md5=3Dfbb0010b2f7cf6e8a1=
3bcac1ef4d2455&quot;</a>
 =20





</blockquote></div><div style=3D"white-space:break-spaces">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#117132): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/117132" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-devel/message/117132</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112441095/361=
8223" target=3D"_blank">https://lists.openembedded.org/mt/112441095/3618223=
</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" target=3D"_blank">https://lists.openembedded.org/g/openembedded-dev=
el/unsub</a> [<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@=
t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div></blockquote></div></div>

--000000000000c4133e06339d81da--

