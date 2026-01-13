Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FFCD2D0FC
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 19:58:34 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68047.1768334300048100574
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 11:58:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vo7jMhcp;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78e7ba9fc29so83508377b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 11:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768334299; x=1768939099; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xnE0tSEmuQeT4ASziLGhckn9QulV9UVv03JzDieS3qw=;
        b=Vo7jMhcpAJk8TILHQTD1tKu6MX6k1bIbvwTxywgf6XGcshkgMMxYnywbkKcb8VacyA
         bl22c9Qmnkc2SwAzCBx9r5oJ4vbAGEHe/J0yPenlhyv91IRD/hlP0ZcAF/JvZ8n8YbOZ
         fPsnuWoWyu9PfOr09jN8ZV1mgqculYRQ5JBzVV/0utrCtxUGD3NP6+EWm9zZc8shv5hx
         EsON9ejscTr47KPwZFb6r1xNY6SgSEg0XTvIML+Elnd14iX1go9Qt+GLOg1wHujgS0Ay
         8CgkdAHF7DSn8670FWUm9F9J2gwnAaLlCfxLQ2z3tHzpNH48PTh8cvSAOtoe2aMdyIqf
         xP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768334299; x=1768939099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnE0tSEmuQeT4ASziLGhckn9QulV9UVv03JzDieS3qw=;
        b=sil+t8wM3UvnKGt1Wto3bxhPjYo8PNoarlEyNcu6NVrUQJUZWF38KFdVfqkg9hZ50X
         a2stGmBxd1bzTwdCwipRkdFUrR8V3iY6fygN3oerl8tLiEQ/h3hZuFwH8qvLBQBrcfib
         yN4BnL2gwRxA5LCcGeloCa91/D4FMjmKmdMJcSMPYqRSupQxFvYn6jK/jUduOOgRvirw
         FBqWXk358U/WrkGpwFfd+tnUFuje76jEZ9f1JFHkV7FDNFKrQZBC90ADYjjC4G4S/vfH
         UGaPpVWN+9TjlvSEa/z9Ef63+vsRRIpxgdk2tZeNeZwQ9g1lCv61eWIJpZwVfU1VGZeV
         BXaA==
X-Gm-Message-State: AOJu0Yw+lA3XrcnedYmwWJIbLzAkwcvir1iwbXEWGLLlM5F1/8BxfhhB
	9BTx2ageFFWp3ZGjwZRuXzOvPHjP+mqZXvMnBLQsakHoC4Yio8Byx23FxA9djGEFRVi4IB/Q77a
	aMBEce4RvI0PkteAYdoYTSZAoD6tnMlY=
X-Gm-Gg: AY/fxX69NcnyQGBlg3r3Bwf+D4VIfUWg7mBQwxkVXRqOJQY0TqR4Js4eMI9QGoGXUYJ
	6U0cWpGmAZ+TSjXPNA2sZI31ULJlDA6zRQQyxX6Tb7g5tfPYLehn2XM/KenlU+LeIuPxqsNm552
	gfEjuJA+uaP7j5FwvwVOiBKd3Wzq1iydyFKBzqU+8wQu1vyIeWjUUGCK5Ca3i3tLg25IS0qIsCC
	/fXdLQU2dH39LKFqsdvWlLIEBH/JtE7WfovnYG9Ovh+0Sl9WaA1iM34yLglKrwKTZHCxLFPFAxd
	WAHTuoA2OQjc6DjZ+sahzGt2Zg7Dc5UZghAXVhuuLDqlphx+3VfDksbtFJaOfNbNExLa98DCevZ
	c9oN2ScE7vEZJLPolbX9l0+hdgwLqZ8o9dMxiBA5+2pZi9A==
X-Received: by 2002:a05:690e:4106:b0:647:fea:2955 with SMTP id
 956f58d0204a3-64901aae91emr372921d50.25.1768334299028; Tue, 13 Jan 2026
 11:58:19 -0800 (PST)
MIME-Version: 1.0
References: <20260113195045.285913-1-f_l_k@t-online.de>
In-Reply-To: <20260113195045.285913-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Jan 2026 11:57:52 -0800
X-Gm-Features: AZwV_QjUosRthyh20ocN4KheAahYXmAM-_LQRwzooyon5pvDsGpeHmg3RQe5mYQ
Message-ID: <CAMKF1srgVow77MKqd9==bLNDUPDcZ3JH2YdNSQhi=sX78qGSGg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] re2: update 2024.03.01 -> 2025.11.05
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bce1ef06484a69c7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 19:58:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123442

--000000000000bce1ef06484a69c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have submitted something similar as well.

On Tue, Jan 13, 2026 at 11:51=E2=80=AFAM Markus Volk via lists.openembedded=
.org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Update fixes:
> |
> /home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-poky-linux/re2/202=
4.03.01/sources/re2-2024.03.01/re2/prog.h:25:1:
> note: 'memchr' is defined in header '<cstring>'; this is probably fixable
> by adding '#include <cstring>'
> |    24 | #include "re2/sparse_set.h"
> |   +++ |+#include <cstring>
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../re2/{re2_2024.03.01.bb =3D> re2_2025.11.05.bb}                | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/re2/{re2_2024.03.01.bb =3D>
> re2_2025.11.05.bb} (97%)
>
> diff --git a/meta-oe/recipes-support/re2/re2_2024.03.01.bb
> b/meta-oe/recipes-support/re2/re2_2025.11.05.bb
> similarity index 97%
> rename from meta-oe/recipes-support/re2/re2_2024.03.01.bb
> rename to meta-oe/recipes-support/re2/re2_2025.11.05.bb
> index a510545bab..a238b22d4c 100644
> --- a/meta-oe/recipes-support/re2/re2_2024.03.01.bb
> +++ b/meta-oe/recipes-support/re2/re2_2025.11.05.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b5c31eb512bdf3cb11ffd5713963=
760"
>
>  # tag 2024-03-01
> -SRCREV =3D "2d866a3d0753f4f4fce93cccc6c59c4b052d7db4"
> +SRCREV =3D "927f5d53caf8111721e734cf24724686bb745f55"
>
>  SRC_URI =3D "git://github.com/google/re2.git;branch=3Dmain;protocol=3Dht=
tps \
>             ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest'=
,
> '', d)} \
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123440):
> https://lists.openembedded.org/g/openembedded-devel/message/123440
> Mute This Topic: https://lists.openembedded.org/mt/117249602/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bce1ef06484a69c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have submitted something similar as well.</div><br><div =
class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Jan 13, 2026 at 11:51=E2=80=AFAM Markus Volk via <a href=3D"=
http://lists.openembedded.org">lists.openembedded.org</a> &lt;f_l_k=3D<a hr=
ef=3D"mailto:t-online.de@lists.openembedded.org">t-online.de@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Update fixes:<br>
| /home/flk/bitbake-builds/poky/build/tmp/work/corei7-64-poky-linux/re2/202=
4.03.01/sources/re2-2024.03.01/re2/prog.h:25:1: note: &#39;memchr&#39; is d=
efined in header &#39;&lt;cstring&gt;&#39;; this is probably fixable by add=
ing &#39;#include &lt;cstring&gt;&#39;<br>
|=C2=A0 =C2=A0 24 | #include &quot;re2/sparse_set.h&quot;<br>
|=C2=A0 =C2=A0+++ |+#include &lt;cstring&gt;<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0.../re2/{<a href=3D"http://re2_2024.03.01.bb" rel=3D"noreferrer" targ=
et=3D"_blank">re2_2024.03.01.bb</a> =3D&gt; <a href=3D"http://re2_2025.11.0=
5.bb" rel=3D"noreferrer" target=3D"_blank">re2_2025.11.05.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-support/re2/{<a href=3D"http://re2_2024.03.01.=
bb" rel=3D"noreferrer" target=3D"_blank">re2_2024.03.01.bb</a> =3D&gt; <a h=
ref=3D"http://re2_2025.11.05.bb" rel=3D"noreferrer" target=3D"_blank">re2_2=
025.11.05.bb</a>} (97%)<br>
<br>
diff --git a/meta-oe/recipes-support/re2/<a href=3D"http://re2_2024.03.01.b=
b" rel=3D"noreferrer" target=3D"_blank">re2_2024.03.01.bb</a> b/meta-oe/rec=
ipes-support/re2/<a href=3D"http://re2_2025.11.05.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">re2_2025.11.05.bb</a><br>
similarity index 97%<br>
rename from meta-oe/recipes-support/re2/<a href=3D"http://re2_2024.03.01.bb=
" rel=3D"noreferrer" target=3D"_blank">re2_2024.03.01.bb</a><br>
rename to meta-oe/recipes-support/re2/<a href=3D"http://re2_2025.11.05.bb" =
rel=3D"noreferrer" target=3D"_blank">re2_2025.11.05.bb</a><br>
index a510545bab..a238b22d4c 100644<br>
--- a/meta-oe/recipes-support/re2/<a href=3D"http://re2_2024.03.01.bb" rel=
=3D"noreferrer" target=3D"_blank">re2_2024.03.01.bb</a><br>
+++ b/meta-oe/recipes-support/re2/<a href=3D"http://re2_2025.11.05.bb" rel=
=3D"noreferrer" target=3D"_blank">re2_2025.11.05.bb</a><br>
@@ -4,7 +4,7 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b5c31eb512bdf3cb11ff=
d5713963760&quot;<br>
<br>
=C2=A0# tag 2024-03-01<br>
-SRCREV =3D &quot;2d866a3d0753f4f4fce93cccc6c59c4b052d7db4&quot;<br>
+SRCREV =3D &quot;927f5d53caf8111721e734cf24724686bb745f55&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/google/re2.git;b=
ranch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.=
com/google/re2.git;branch=3Dmain;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PTEST_E=
NABLED&#39;, &#39;1&#39;, &#39;file://run-ptest&#39;, &#39;&#39;, d)} \<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123440): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123440" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123440</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117249602/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117249602/1997914</a><br>
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

--000000000000bce1ef06484a69c7--

