Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832CDCD8C9D
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 21:06:56 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56937.1781212008836440459
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 14:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=L+S57lk1;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7e2cb01a974so3651367b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 14:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781212008; cv=none;
        d=google.com; s=arc-20240605;
        b=NmWiVAlUYn9/1MOwsAlXDbvwDzN5cBFHJKFgoKEVPRBxMp0ZTxJnKeh1ceEvyWLwCZ
         YpVk6QZV2BPJQaZc3w5YERdZamhF82pE0Zx+oZ1EFk6QcjaXfFEWpIlew4y7JvEqRUBc
         41b54rsA6LClieQ2zrvGKt8TwxfMdJtbO9+S1zeY7klLZbnvEvREe/YfmSMsA4dM4cYW
         rxStTzFTUb7T1xS7K3COQEMAFBH9SvxrysnQQVaqOhqXhWTCDqPAC2znFunvF5D06gNs
         yU7RekezBX9nNK2hfqRPzR0Om92h+ilrOMGj10HVwGbmmWcfWXiFJ9+FjwLcb/rLNm7d
         uV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MS9xT6f1nq9oD7/9esva82ukfYwIFGN1VJ8CNXKvuGU=;
        fh=TKJj+TQbOfhIZO+HJtRVqEbv76mR7gPejKPp/8pTfkM=;
        b=gS+hCgbjIjeSRVdQQYJHfhExmD1rtSON5j9c6tNQ7h1RwiTdjLZo9NN44bfF49EepB
         B0jJiSH5B6I49P/Np/PXiIgEhVbTwKHeWPkTgnehGsOnBz+YR8RPt7PG6sbCBU/aEHOY
         624aceCknpiVreZglAeau407aX3e++lq2+aqs1J06q+gI7tzTqa4e0CEntTFwQUWn3c7
         REnZZHCSSGdceWgidRhuslfSOj3C5FTEhUacaW9o2ogZ+01e+xnr98HA6R0Jay+VdtWD
         OUxETt9jnzM3DRDxoDXO/BhP3NHpWGgEd50e6jMX9k9XNJoZQQtsK6RqiRFLGb7srscY
         7JiA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781212008; x=1781816808; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MS9xT6f1nq9oD7/9esva82ukfYwIFGN1VJ8CNXKvuGU=;
        b=L+S57lk1tsWX+DOaQMlYDzZyTvLI6Y51qlCnt9n43o54BSDOOHSiVO6CWEYv9rrRfJ
         lc8g+ytnoxTFsgLaG4k65ANSj7OFZ8YcIls+E4aMC2vrBOAXZTu4sp6Dg0nQCz50M6SX
         Vf4yRCdugnn2N4BwmGqyhecgncWj0RnPJgo8Z2B07U4fhvjbgOVP2URpUP/4/mvHngCP
         fSbNNtYB99yXLB+svoD3KNn8SiqTZUphT9QGgMn3zOA0s/y93L8T4bPl2U4BgaaUkU5e
         f8hqdh5fB/c5dVW49fXCX7755sN5xkC56YCpRQR90V8MyXgeBgl4JGvrKFN8CyScFI9+
         ejQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781212008; x=1781816808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MS9xT6f1nq9oD7/9esva82ukfYwIFGN1VJ8CNXKvuGU=;
        b=mOFvfyhRNZdHUSx1Di34T2fcJGwxKxNNJqzcxkRqKtFmW7afQon2YcBZI02vFpEe1g
         XdIcU7VQCXbzevwu5iE+KAY25NKG9zPAAV6+OLZfr5ksY7xO+EvU2+Yl5M40gP9hulhf
         GmUDXvjNy81OFV9DBEzNqx6/7WR+Klf/J6pj2tfO7bRkJSJy2PIkovjcH0+fxApwaJuu
         6Sg6QaMoDaYzSGBPsxk/LjDin+yYtwN4wStQFC2XyNc6HyWxaqTRgGCHBMLtkCCDWB+W
         IRyXU4j7/n+pJbEvEgAK1Fl1nbLe6o52CxXUiaI+F1lpHk66079vm6lQabm4jr5OCRnO
         vSQw==
X-Gm-Message-State: AOJu0YxM3aanLxgYBR6l+lLdRIYf3D1wCtcOqA7F5oqEG0QED7irw2I7
	OoLZzm82VhahKsiNDBnMxGOvT7b2U6kq/Ul9qUnn/7krKDCkJRPIvA73KuppSPuzMvbtBp60YsT
	7br3o7pF/9DklIociQvx0kSP0RWZvasc=
X-Gm-Gg: Acq92OFSgJ851mDpm/KGYkEQYagx6UHx+gYwSIy/bsP2cUQ3LfnGzqpE3BcbIHtIsgV
	+heI62lMK0nH8Efr844f0O4/bwFoTRpc53zAPBEy6XRh/pbtECdtHSncvQPTTgnY2cgy4zKvoTq
	rgR3WU9sGEetQES158oSVj2geahpFyCspHJ9dGQu8e7EdhHtzM0CdjfdiY9zm8xGMCSpWpgkGJs
	Af3V111lG+jHyhBhJn0/wCHcoDvlibSlZh3AVUsopgqbgxpqThEgrq0/lkr5cPXKk5BN0FUO2b2
	rq4IcrSguhIcwpR2jdiTb/9PSaLdwWwYdflp8hPvPvHwb+1N9NtoYIl2g3LA0fU0+r0z9OL6WQd
	mJZPTU3BPTTW+xZOrPmtujysek/2FIayBYrtWtxO7NKUa5+Qf5K3r/RFgDVDTSHEcpejWLdgd3G
	/SCHs=
X-Received: by 2002:a05:690e:140e:b0:650:38c4:9d80 with SMTP id
 956f58d0204a3-6626986734amr3775421d50.35.1781212007808; Thu, 11 Jun 2026
 14:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260611205607.2081431-1-f_l_k@t-online.de>
In-Reply-To: <20260611205607.2081431-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Jun 2026 14:01:07 -0700
X-Gm-Features: AVVi8Ccjtns4bzC6BBVNAMJiKencKEk1zQ51BEtHQC7Y2DKaQRxzqIjL5ydNh30
Message-ID: <CAMKF1soU7MJBKh1QxLvYZXyFZY4PJy2rZ31cuXoLKUToZgLUHg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] cairomm: fix LIC_FILES_CHECKSUM
To: Markus Volk <f_l_k@t-online.de>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fec38c065400bccb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 21:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127535

--000000000000fec38c065400bccb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I wonder if it needs to be backported to older branches as well. If so how
D are does it have to go.

On Thu, Jun 11, 2026, 1:56=E2=80=AFPM Markus Volk via lists.openembedded.or=
g <f_l_k=3D
t-online.de@lists.openembedded.org> wrote:

> License changed from LGPL-2.0 to LGPL-2.1
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-graphics/cairo/cairomm_1.14.6.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.14.6.bb
> b/meta-oe/recipes-graphics/cairo/cairomm_1.14.6.bb
> index a076c217f5..b5e337e9b5 100644
> --- a/meta-oe/recipes-graphics/cairo/cairomm_1.14.6.bb
> +++ b/meta-oe/recipes-graphics/cairo/cairomm_1.14.6.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "C++ bindings for Cairo graphics library"
>
> -LICENSE =3D "LGPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc46bda00ffbb0ba1dac22f8d087f5=
4d9"
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4bf661c1e3793e55c8d1051bc5e0a=
e21"
>
>  inherit gnomebase
>
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127534):
> https://lists.openembedded.org/g/openembedded-devel/message/127534
> Mute This Topic: https://lists.openembedded.org/mt/119764689/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fec38c065400bccb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I wonder if it needs to be backported to older branches a=
s well. If so how D are does it have to go.</div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Ju=
n 11, 2026, 1:56=E2=80=AFPM Markus Volk via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-onlin=
e.de@lists.openembedded.org">t-online.de@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">License chan=
ged from LGPL-2.0 to LGPL-2.1<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank" rel=3D"noreferrer">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-graphics/cairo/<a href=3D"http://cairomm_1.14.6.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">cairomm_1.14.6.bb</a> | 4 ++=
--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-graphics/cairo/<a href=3D"http://cairomm_1.14.=
6.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">cairomm_1.14.6.bb</a>=
 b/meta-oe/recipes-graphics/cairo/<a href=3D"http://cairomm_1.14.6.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">cairomm_1.14.6.bb</a><br>
index a076c217f5..b5e337e9b5 100644<br>
--- a/meta-oe/recipes-graphics/cairo/<a href=3D"http://cairomm_1.14.6.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">cairomm_1.14.6.bb</a><br>
+++ b/meta-oe/recipes-graphics/cairo/<a href=3D"http://cairomm_1.14.6.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">cairomm_1.14.6.bb</a><br>
@@ -1,7 +1,7 @@<br>
=C2=A0SUMMARY =3D &quot;C++ bindings for Cairo graphics library&quot;<br>
<br>
-LICENSE =3D &quot;LGPL-2.0-only&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc46bda00ffbb0ba1dac22f8d08=
7f54d9&quot;<br>
+LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4bf661c1e3793e55c8d1051bc5=
e0ae21&quot;<br>
<br>
=C2=A0inherit gnomebase<br>
<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127534): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127534" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lists.openembedded.org/g/openembedded-devel/message/127534</a=
><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119764689/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/119764689/1997914</a><br>
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

--000000000000fec38c065400bccb--

