Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B708DCD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 05:11:30 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123020.1781500283880049766
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jun 2026 22:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pcrV+DjE;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6608c1a4215so3007970d50.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 14 Jun 2026 22:11:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781500283; cv=none;
        d=google.com; s=arc-20240605;
        b=ZqEccy3lGxl7UJv83wsaWADMCI40dCkJ2P1vBXi/yhCqqrDULXtXQoHvbGb9dzr5rN
         b9LfKUzSEeE3eW5evOWgteVWipD4fbjIjNdMpJN41kujQHItNTqhuXkKe44DaUeg8P2m
         Nxyn2k/mU7xO1b1jBhr0cFvJ4qeG3BQNGeyIFNTI8naV5scwn+TN/SCkumNmTlEyOu4I
         7eE4I57dc/L3KN0hPe0mivpJSIpkKHiEljfQ1OHXFgK47gAQ8fmZ4hDvyn6QVMCQxbP7
         vqgFIIlutUjxBLvnVpQeuZTZ4Lb6VYMSLMQAJ8jpOe4NRoPg2ZU3K7Ay7fanN9swHZ1D
         lMtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qVXhgbnzvjg58yyVifMlTxTU5zxBlrGG7lNRSQJVcPI=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=CDeFN5rsuLukz3A9f2FpWib8OPob3rLVuSiFaorB1mMQle6xKt6AAHsPGyu+8l1UTH
         EnRSxfgyD5B+15yJUhTCFzmEPNf6qhcWc7ugo1nPp+tpcyVW5VZJD8MkMJThG0tkmH6G
         z4rF78MRUB3IIOnmr8PhIvWd3Dn8B3jKZRbeOLQ6JGEV0HQA0sXnUDVmFvW3eluB5yx/
         T0cQQ5K9BKomTxPOxt7bH5Xc1EdKuUlbHyAvwWjnzM+0a+zbufOVbJbewVEcDqQ+m5Ue
         hO2BuNzVnQDXLl4NeI96kt7MflEBKE9RIdrkE5OJHL43qCF6ynyhvmpvUnlIhC8XLPVR
         N1XQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781500283; x=1782105083; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qVXhgbnzvjg58yyVifMlTxTU5zxBlrGG7lNRSQJVcPI=;
        b=pcrV+DjEAx7aFZCJDbIa4S1WoLwfleBW1UmpJIWi6fZscTQkUZYMAyjso1Vg06HZXq
         F6Jn/3peOenbyoGyrnJ0GBFicNvF0El5mMDRaFukBOIFIc80IAh8KFACIPV6SKHlDsDy
         IxlVoRVuCMi0TdomhTPOhbTvSigrjfSFVofZw2FqDDC3WBHWgoxOvxUOGIJ10o/mvf1Z
         /3sbm3frVQFzhBZ6fH96w3JD9DKAwnh0k2uD0FI5eO1u7sZBY1cgGJF2qZVQprX2OI2j
         FQ4Q8iLYgr71WkcYtkI1sVfmh8L1LjjtMfKPDXqh26QaTl07AzTf0UdpWe4foXGw9f3X
         nyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781500283; x=1782105083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVXhgbnzvjg58yyVifMlTxTU5zxBlrGG7lNRSQJVcPI=;
        b=Z4mozfQSghPYP8jLPFPz3OC38nygYU8cZ2l8WRNfrdhCgASg0K5Xa/wzyp3cPo8k4t
         uev/rZCKxRQsVfOKLh4QDrwYvM4Y+0Y3O3OybGT4WWNbL+M1s/IU3oIX5uw+vlgJ50SY
         G2bjmUskSxmq78ICW+6xgeINp1969ABMmY3cSzMuVhwpTw1GVclDxUWSfJV5YC9OuyoW
         GcUmKf9pFEqFkbgTw1mqNSyUOAgBilOPmdiKLozdd/zsgIYKiassW2YGXKrvwiwTe5Th
         cbSDteeq7/IYS1FO1+fBM88h8fHXurmkwu8H7KFZqVg1e7QZwVjZzOYH8u6ScsJuSHe6
         PzcA==
X-Gm-Message-State: AOJu0YxOlXn5WavDcs6ukuPBG2+iHhDEq7pzKSfHWb/hGhseKwqiF5On
	OHBEfZvF4eEAYVs73x6CXt6+nsVyqnlMfBC1PM8poEqHLoZAqHTQLtjzAMU3OzSbC1JHDuNubU8
	k7jcCJnz8PVwAi8SIIvI25VbFG4BFG4o=
X-Gm-Gg: Acq92OFla+7RGva3z9cmi3YrdL1jx9hbHa9XRKrMdhnVnevJag9+Z+WKKdF3W7eSOpe
	K0fsIkXXyX7GjXe0N/a/O0Z3ALenkVu6+LdpXVGeAZlADyRA/V6LGB8dBjghVVjmv0Ak9+SUd3D
	NmXKHH9InLk8M3/Kn9g2Qt93um0bEgRfOgmh3OKeEsdn8UaBCUN0EfvNURWBUWyGnJchCaFdlTt
	+g6YEyOStTcRnwb8jMdwcjylO0IEwiwZ05EXNp6pNeYCSMIWBigW2QwmBUrnNStbZVMRK7F7Aji
	PDAe1u3BlEozvTVNiT9PfwYl7hK3euzoz1ZcB5iU0EZ1O4YeGf0khVbmSbhqi1dthh/fDJnxMRu
	JMb+cbZqe5epc6E1M60Bu6WSTSMkRV0w2iVUq8ZskWXNDclAOTDxqKHwXT37Iab6hDdZPRote+I
	2+A9i4
X-Received: by 2002:a05:690e:b4f:b0:65e:4bcb:2a76 with SMTP id
 956f58d0204a3-66276b02173mr8945683d50.39.1781500282839; Sun, 14 Jun 2026
 22:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260611085647.233427-1-f_l_k@t-online.de> <20260611085647.233427-3-f_l_k@t-online.de>
In-Reply-To: <20260611085647.233427-3-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Jun 2026 22:10:56 -0700
X-Gm-Features: AVVi8Ccom43W-xOiQ8pSz1cGrNTQE8ZUu8iRtjPS1zkfu0NzU-Y4AKUY7ysN0Q4
Message-ID: <CAMKF1soMwemcLC1MdZYJ0+SiwXVkp9xzmq=ddQMmiEO+LK2S4Q@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 3/3] libdvdread: switch to meson buildsystem
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000086a795065443db9e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 05:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127580

--00000000000086a795065443db9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please move this recipe from meta-oe to meta-multimedia as well, otherwise
its failing due to libdvdcss being in meta-multimedia

On Thu, Jun 11, 2026 at 1:57=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> autotools buildsystem has been removed:
> do_configure: no configure script found
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
> b/meta-oe/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
> index 0e56f0bd3c..0be61c2174 100644
> --- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
> +++ b/meta-oe/recipes-multimedia/libdvdread/libdvdread_7.0.1.bb
> @@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D64e753fa7d1ca31632bc383da3b57c27"
>  SRC_URI =3D "
> https://download.videolan.org/pub/videolan/libdvdread/${PV}/libdvdread-${=
PV}.tar.xz
> "
>  SRC_URI[sha256sum] =3D
> "2e3e04a305c15c3963aa03ae1b9a83c1d239880003fcf3dde986d3943355d407"
>
> -inherit autotools lib_package binconfig pkgconfig
> +inherit meson lib_package binconfig pkgconfig manpages
>
> -CONFIGUREOPTS:remove =3D "--disable-silent-rules"
> +PACKAGECONFIG ?=3D "libdvdcss"
> +PACKAGECONFIG[libdvdcss] =3D
> "-Dlibdvdcss=3Denabled,-Dlibdvdcss=3Ddisabled,libdvdcss"
> +PACKAGECONFIG[manpages] =3D
> "-Denable_docs=3Dtrue,-Denable_docs=3Dfalse,doxygen-native"
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127520):
> https://lists.openembedded.org/g/openembedded-devel/message/127520
> Mute This Topic: https://lists.openembedded.org/mt/119753722/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000086a795065443db9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please move this recipe from meta-oe to meta-multimedia as=
 well, otherwise its failing due to=C2=A0libdvdcss being in meta-multimedia=
<br></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, Jun 11, 2026 at 1:57=E2=80=AFAM Markus Vo=
lk via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a>=
 &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org">t-online=
.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">autotools buildsystem has been removed:<br>
do_configure: no configure script found<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-multimedia/libdvdread/<a href=3D"http://libdvdread_7.=
0.1.bb" rel=3D"noreferrer" target=3D"_blank">libdvdread_7.0.1.bb</a> | 6 ++=
++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-multimedia/libdvdread/<a href=3D"http://libdvd=
read_7.0.1.bb" rel=3D"noreferrer" target=3D"_blank">libdvdread_7.0.1.bb</a>=
 b/meta-oe/recipes-multimedia/libdvdread/<a href=3D"http://libdvdread_7.0.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libdvdread_7.0.1.bb</a><br>
index 0e56f0bd3c..0be61c2174 100644<br>
--- a/meta-oe/recipes-multimedia/libdvdread/<a href=3D"http://libdvdread_7.=
0.1.bb" rel=3D"noreferrer" target=3D"_blank">libdvdread_7.0.1.bb</a><br>
+++ b/meta-oe/recipes-multimedia/libdvdread/<a href=3D"http://libdvdread_7.=
0.1.bb" rel=3D"noreferrer" target=3D"_blank">libdvdread_7.0.1.bb</a><br>
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D64e753fa7d1=
ca31632bc383da3b57c27&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://download.videolan.org/pub/videol=
an/libdvdread/$%7BPV%7D/libdvdread-$%7BPV%7D.tar.xz" rel=3D"noreferrer" tar=
get=3D"_blank">https://download.videolan.org/pub/videolan/libdvdread/${PV}/=
libdvdread-${PV}.tar.xz</a>&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;2e3e04a305c15c3963aa03ae1b9a83c1d2398800=
03fcf3dde986d3943355d407&quot;<br>
<br>
-inherit autotools lib_package binconfig pkgconfig<br>
+inherit meson lib_package binconfig pkgconfig manpages<br>
<br>
-CONFIGUREOPTS:remove =3D &quot;--disable-silent-rules&quot;<br>
+PACKAGECONFIG ?=3D &quot;libdvdcss&quot;<br>
+PACKAGECONFIG[libdvdcss] =3D &quot;-Dlibdvdcss=3Denabled,-Dlibdvdcss=3Ddis=
abled,libdvdcss&quot;<br>
+PACKAGECONFIG[manpages] =3D &quot;-Denable_docs=3Dtrue,-Denable_docs=3Dfal=
se,doxygen-native&quot;<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127520): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127520" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127520</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119753722/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119753722/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000086a795065443db9e--

