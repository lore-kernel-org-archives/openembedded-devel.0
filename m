Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF4E5C433EF
	for <webhook@archiver.kernel.org>; Sun, 14 Nov 2021 01:50:50 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.4765.1636854648928534408
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 17:50:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NbowQamP;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id r8so16261057iog.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Nov 2021 17:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oFABIkQwGmYaVmGC8vFWdoTRf9kDyCBW5SEPr9wPnzM=;
        b=NbowQamP+iJo4LNgFaR1XSppymZ9EGj2xtuPDC1SRrmA6WdI0+5YpEu7YX60Y7LWhS
         OlOAyKmbUzEAidbwDNNkcP557z9D3VTPLvD0zcMhpZA+VpbYgXR8divufxoTKeytTAkS
         NGnF1iA5eONVKwKD8u74cP4N4W31ivTv3erFMei3kbgbysiilnLNF72iAB7aWnulN4cf
         iwNPHyC3AFKzPPVJAmfD5AOeiVd0UU+d2bi+sjYYpNGtdJi0UI0shshbuaM28fDLhYLZ
         MBfbBvO3m8ToSQv9PfJiZwqG2zyAPZrv18AhWQYJBIC/1uHiS/6hI+DO76EKdWJhn2TW
         bZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oFABIkQwGmYaVmGC8vFWdoTRf9kDyCBW5SEPr9wPnzM=;
        b=WkuNq6j91XiEWQ8ftynkrGwqgu2FzNXx5JvCUGlaWa78Rm2OL2mDZsnh6k3igW8xGO
         jrU3OJrDsxfZtYnq/nEjr0SGyYwkwffiqqvAfp8Q6oIxADlHKXWHnUlu6QdsCGkuCsP1
         4JnrL3yEsB3XesUzeNrNvoNG7TOc/E8ib8bvaOhZG/YDlXUJw2shSsMsRPyrD5tsky0x
         uAH8SasMwSiuoJOZ8QVA7etoGq72s2LBdcXt6ZVf0xJK2U0xcYdF7tldvqDvUwotWToa
         nBGGDd43AOJJ6rZCXr6vQSlavWxtmXDyISgx/8QMVLxzfQmrzBiDl8x9HLaAy9YmXqnD
         Nzjw==
X-Gm-Message-State: AOAM530+LSXB6Ah+M5UNZc7p40K24dOFeIuYxmuDYxPho1RV7MSylI/Z
	0iV1osRjoS2H6TFj/HzbAmRRhkuAaw4guvZUUwo=
X-Google-Smtp-Source: 
 ABdhPJzAVlbhx92LB7wTFV3YHli55IcmydXySMgIDwl+RDPVUNYhsytVaYpj5nBIs+IGc2T4/lPFLidF0KJDJnsv4Jo=
X-Received: by 2002:a05:6602:2e81:: with SMTP id
 m1mr16468063iow.55.1636854648202;
 Sat, 13 Nov 2021 17:50:48 -0800 (PST)
MIME-Version: 1.0
References: <20211113174606.2044137-1-raj.khem@gmail.com>
 <20211113174606.2044137-3-raj.khem@gmail.com>
In-Reply-To: <20211113174606.2044137-3-raj.khem@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 13 Nov 2021 17:50:37 -0800
Message-ID: 
 <CANx9H-D_H-tUv32JaVYDqp0==O1DNCpqABoAirvhqHT3JBhhxA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 3/9] libmediaart: introspection is
 not valid meson option
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dae7e605d0b5eb1e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Nov 2021 01:50:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93941

--000000000000dae7e605d0b5eb1e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 13, 2021 at 9:46 AM Khem Raj <raj.khem@gmail.com> wrote:

> meson 0.60+ errors out on unknown options and -Dintrospection
> is not a valid option
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
Acked-by: Tim Orling <ticotimo@gmail.com>

Thank you for this series. I wasn=E2=80=99t sure what the proper solution w=
as.

---
>  .../recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-multimedia/recipes-support/libmediaart/
> libmediaart-2.0_1.9.5.bb b/meta-multimedia/recipes-support/libmediaart/
> libmediaart-2.0_1.9.5.bb
> index 31fe43bfa7..ffedb2625e 100644
> --- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.b=
b
> +++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.b=
b
> @@ -18,6 +18,6 @@ S =3D "${WORKDIR}/libmediaart-${PV}"
>
>  # gobject-introspection is mandatory and cannot be configured
>  REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
> -UNKNOWN_CONFIGURE_WHITELIST =3D "introspection"
> +GIR_MESON_OPTION =3D ""
>
>  EXTRA_OEMESON =3D "-Dimage_library=3Dgdk-pixbuf"
> --
> 2.33.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93932):
> https://lists.openembedded.org/g/openembedded-devel/message/93932
> Mute This Topic: https://lists.openembedded.org/mt/87032482/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000dae7e605d0b5eb1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Nov 13, 2021 at 9:46 AM Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">meson 0.60+ errors out on unknown options and -Dintr=
ospection<br>
is not a valid option<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
</blockquote><div dir=3D"auto">Acked-by: Tim Orling &lt;<a href=3D"mailto:t=
icotimo@gmail.com">ticotimo@gmail.com</a>&gt;</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Thank you for this series. I wasn=E2=80=99t sure what=
 the proper solution=C2=A0was.</div><div dir=3D"auto"><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex" dir=3D"auto">---<br>
=C2=A0.../recipes-support/libmediaart/<a href=3D"http://libmediaart-2.0_1.9=
.5.bb" rel=3D"noreferrer" target=3D"_blank">libmediaart-2.0_1.9.5.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-multimedia/recipes-support/libmediaart/<a href=3D"http://=
libmediaart-2.0_1.9.5.bb" rel=3D"noreferrer" target=3D"_blank">libmediaart-=
2.0_1.9.5.bb</a> b/meta-multimedia/recipes-support/libmediaart/<a href=3D"h=
ttp://libmediaart-2.0_1.9.5.bb" rel=3D"noreferrer" target=3D"_blank">libmed=
iaart-2.0_1.9.5.bb</a><br>
index 31fe43bfa7..ffedb2625e 100644<br>
--- a/meta-multimedia/recipes-support/libmediaart/<a href=3D"http://libmedi=
aart-2.0_1.9.5.bb" rel=3D"noreferrer" target=3D"_blank">libmediaart-2.0_1.9=
.5.bb</a><br>
+++ b/meta-multimedia/recipes-support/libmediaart/<a href=3D"http://libmedi=
aart-2.0_1.9.5.bb" rel=3D"noreferrer" target=3D"_blank">libmediaart-2.0_1.9=
.5.bb</a><br>
@@ -18,6 +18,6 @@ S =3D &quot;${WORKDIR}/libmediaart-${PV}&quot;<br>
<br>
=C2=A0# gobject-introspection is mandatory and cannot be configured<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;gobject-introspection-data&quot;<b=
r>
-UNKNOWN_CONFIGURE_WHITELIST =3D &quot;introspection&quot;<br>
+GIR_MESON_OPTION =3D &quot;&quot;<br>
<br>
=C2=A0EXTRA_OEMESON =3D &quot;-Dimage_library=3Dgdk-pixbuf&quot;<br>
-- <br>
2.33.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93932): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93932" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93932</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87032482/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
87032482/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000dae7e605d0b5eb1e--

