Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0080AC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 13:31:48 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.150087.1783344701270048451
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 06:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RuJ6VbAp;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-664db84f074so3502125d50.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 06:31:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783344700; cv=none;
        d=google.com; s=arc-20260327;
        b=KTyB7r5yITH81th1ODnuIzKrGGrGQKH2Rekms3D3siitNXeyH88npgDytNn2LwfqAQ
         m6X0gy3IhMzlLSMQuHJ+ofqo3OHauyQsT8hPl8HMX1kR2QLk0OcKUl2t2zYmXKkwJPAJ
         ZhaXR+E6YZ3JrJuk7bjwyormL/6cKbrO9DaeHkZ52wjdDt4Sbtw8iLvc8MwHEtl6ZZTm
         xMZuS475CqL8/sJCdWQTDdPMsi1RKt1l+IJ8dbUg7QO7R2nbSb6WDOeXYIROg/d0St7l
         cjdM1UQggClUHM4V2hceL/zWKfRhTlG3wLElcPGbhd7m0ug1IlJQL0xxtt+rGKkpUdqJ
         vOfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wHekAAEdGRSWA34npSzswISAWxlMqs6tioewzqZnLAc=;
        fh=qYUgRAsvlNvpswxC4IPzSEuzfIkgQUpr/BXQTAADuvA=;
        b=ryB1jC5z2ezV4xNqRlkdRnhRrYbAvtRaoVg1D9pthOoSBjROgxGaqKYkdcXpKGOP0F
         vqtYX2AOKAzuzhMjXiMyySPaQW2/p+UahcOHHfyyF+ZuK2LO+iEW79jTQ7sxwgxoHOmT
         2/VIKaunfTM226DAPf37CS1Tc6zaNfmD//pjCluHkBmE/fnIskreIsKjZvHNv5YwjJcY
         JwDKCOdbKHALeUpUC52vhM+zwdExuK6Iz6R23Evv25dWZG7QfPBX6naAlyP9/X/FTmId
         kkqnYBsyY+XomStX/3y75xMVsYOpRuTsMBcOwvfrHon9hBdpR7Yr6Hw0c6HJrdEEWs2w
         cjKA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783344700; x=1783949500; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wHekAAEdGRSWA34npSzswISAWxlMqs6tioewzqZnLAc=;
        b=RuJ6VbAppXDwHlRYDsjEqVbM7WOpkAcaeg/9ki6Wv9pPbt5uVvwA6x75EGPXMs4LNM
         sPuFQh/NeGZ2bR7nK1vwXWzvOM/K/Vfz9taFLt+AxuxzXDhunLa3MBiT2al0MvsQPeww
         0PbCmigIJZXGxwfUMPudgC31o73t6xtuYYzd5CylCUfZHEM0v3A5YOJw1T9tCvFCxuGa
         2z6Qztni5yhfFFv1PEzQ/Q8tTfvxboi15il3U0CE9LHy92aAhAG54aFuZMOLRAGL6t0z
         iwLlYZWxWU7fQL5hmEricJHupYgVdWj9b3pBHsWdSspwDRogHk8cK26Q8yo5RMIM2YMI
         MSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344700; x=1783949500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHekAAEdGRSWA34npSzswISAWxlMqs6tioewzqZnLAc=;
        b=GKBkAAazdsNxYc/LYg9FAkuVMGhE6Kj+tDMGSZeH7WRVgQe8ue7jCDVH1Y7v/txhX8
         we4uqEtglL80tnDgyqHKNHkVN/0ndJhBMJH87FxkvDndNqtfdcg58MCCz+kJHxFxr8O+
         iYJPtnKpAsxn67ucmHaq7DovZ/rTz+MOqDnuRAPuuC5a0jZbsiGCDbtCJT3K6CJ0BYrB
         9nTIO9di1HKDGhd53QBlxq/0h9pbO7fpGll40EF3WuWyDawODYOFuzpVtG5kdqgz6/5X
         ImXinP/7MEf0isSaeQoyDQr9UTG6g7EijCiAKcyP8bbOwFMBMKmWYTBbWGVQCwk9cFyv
         zIkg==
X-Gm-Message-State: AOJu0YwFrw8OGOtoAkJbMXYFdenWGhak+DX6u/OAszwLhetEkYNfu/7Z
	egAAWo7Ds9viJnZfRAdeUFESlC55lKJCshRqzIisSO7WDSiN91CWu9sTuN3oUfmSKA6/Zxf6Hz0
	5fA4TwU3ItUUj3OJJKbFP8ZLP7Al3/nI=
X-Gm-Gg: AfdE7cksYnbcH/stVZnoxn/88ZV+QN/M59Po0KTF7Ee0b1nO1Jj/B/zej3wn4ms0/Uh
	v4qaxP2PT6i9TV3xMBloNgrj9K+7cjFSJe06Lk+gR2SQ+y3Lu0SSMamHrDgwR0qa8TR1l3UUC1M
	d4Ms6Ne6Od7moIN27pOZrmZJYZjPk+IDbyb+iOltODMcgUQJ1+chw2+yqbPEUX5BiHrdPiIWkjE
	d0VD9+4Qh/IBTfhdyvI+PtQIxbJrQ0RakHcOIEJJWyAgaTb+EHhK/AQRIlA/WuxmBJeXGTQzz82
	cf7m3d3GCfrxHUZTZNMRr8NyT9xkdfSlRiPf6qwMcEfgoCAyIRPRURJNA1akM6dHQRiQ4UHzsgw
	A/p1rPs1OZXYdujq4BRWdjOK+CMvx/MwMZ0ExiEOGVxnMH2di3Qrf5YFHOEYbdDkBNPEN
X-Received: by 2002:a53:ac94:0:b0:664:ae6b:b49f with SMTP id
 956f58d0204a3-6677fd3cb4cmr523971d50.84.1783344700089; Mon, 06 Jul 2026
 06:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260706083445.2842309-1-ross.burton@arm.com>
In-Reply-To: <20260706083445.2842309-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Jul 2026 06:31:28 -0700
X-Gm-Features: AVVi8CfuwhjjCSHtmkudbYV7poSvnc8SUP9aJFhcfldKWDuhG2vt3oVTBOcZ-80
Message-ID: <CAMKF1spZt9otLgCQnRW40L8JE9uPfhv9bODREMid=KVAkf2qWw@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] librav1e: make nasm dependency x86-specific
To: Ross Burton <ross.burton@arm.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005c6a8d0655f14bca"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 13:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128043

--0000000000005c6a8d0655f14bca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Does adding fdebug-prefix-map to ASFLAGS help on  x86


On Mon, Jul 6, 2026, 1:34=E2=80=AFAM Ross Burton via lists.openembedded.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> nasm is an x86 assembler, so only depend on it (and work around the
> build paths errors) on x86-64 (the assembler fastpaths are explicitly
> 64-bit only).
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../recipes-multimedia/rav1e/librav1e_p20250902.bb           | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/rav1e/
> librav1e_p20250902.bb b/meta-multimedia/recipes-multimedia/rav1e/
> librav1e_p20250902.bb
> index 836cd4448f..80ac5d9268 100644
> --- a/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb
> +++ b/meta-multimedia/recipes-multimedia/rav1e/librav1e_p20250902.bb
> @@ -7,9 +7,10 @@ inherit cargo_c pkgconfig cargo-update-recipe-crates
>
>  require ${PN}-crates.inc
>
> -DEPENDS +=3D "nasm-native"
> +DEPENDS:append:x86_64 =3D " nasm-native"
>
>  SRC_URI +=3D "git://
> github.com/xiph/rav1e.git;protocol=3Dhttps;nobranch=3D1;tag=3D${PV}
> <http://github.com/xiph/rav1e.git;protocol=3Dhttps;nobranch=3D1;tag=3D$%7=
BPV%7D>
> "
>  SRCREV =3D "a2f01b3e233f531c28a20b4c29fb5c9e5d29fa6d"
>
> -INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> +# TODO we need to pass -fdebug-prefix-map to the nasm calls
> +INHIBIT_PACKAGE_DEBUG_SPLIT:x86-64 =3D "1"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128026):
> https://lists.openembedded.org/g/openembedded-devel/message/128026
> Mute This Topic: https://lists.openembedded.org/mt/120136595/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005c6a8d0655f14bca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Does adding=C2=A0fdebug-prefix-map to ASFLAGS help on=C2=
=A0 x86<div dir=3D"auto"><br></div></div><br><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 6, 202=
6, 1:34=E2=80=AFAM Ross Burton via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@li=
sts.openembedded.org">arm.com@lists.openembedded.org</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">nasm is an x86 assemble=
r, so only depend on it (and work around the<br>
build paths errors) on x86-64 (the assembler fastpaths are explicitly<br>
64-bit only).<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank" rel=3D"noreferrer">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-multimedia/rav1e/<a href=3D"http://librav1e_p20250902.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">librav1e_p20250902.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-multimedia/recipes-multimedia/rav1e/<a href=3D"http://lib=
rav1e_p20250902.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">librav1=
e_p20250902.bb</a> b/meta-multimedia/recipes-multimedia/rav1e/<a href=3D"ht=
tp://librav1e_p20250902.bb" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>librav1e_p20250902.bb</a><br>
index 836cd4448f..80ac5d9268 100644<br>
--- a/meta-multimedia/recipes-multimedia/rav1e/<a href=3D"http://librav1e_p=
20250902.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">librav1e_p2025=
0902.bb</a><br>
+++ b/meta-multimedia/recipes-multimedia/rav1e/<a href=3D"http://librav1e_p=
20250902.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">librav1e_p2025=
0902.bb</a><br>
@@ -7,9 +7,10 @@ inherit cargo_c pkgconfig cargo-update-recipe-crates<br>
<br>
=C2=A0require ${PN}-crates.inc<br>
<br>
-DEPENDS +=3D &quot;nasm-native&quot;<br>
+DEPENDS:append:x86_64 =3D &quot; nasm-native&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;git://<a href=3D"http://github.com/xiph/rav1e.git;=
protocol=3Dhttps;nobranch=3D1;tag=3D$%7BPV%7D" rel=3D"noreferrer noreferrer=
" target=3D"_blank">github.com/xiph/rav1e.git;protocol=3Dhttps;nobranch=3D1=
;tag=3D${PV}</a>&quot;<br>
=C2=A0SRCREV =3D &quot;a2f01b3e233f531c28a20b4c29fb5c9e5d29fa6d&quot;<br>
<br>
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1&quot;<br>
+# TODO we need to pass -fdebug-prefix-map to the nasm calls<br>
+INHIBIT_PACKAGE_DEBUG_SPLIT:x86-64 =3D &quot;1&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128026): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128026" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/128026</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120136595/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/120136595/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@lists.=
openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000005c6a8d0655f14bca--

