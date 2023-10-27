Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC164C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 16:50:57 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.11990.1698425454771286963
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Oct 2023 09:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hGMfDz1d;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-507be298d2aso3341168e87.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 09:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698425452; x=1699030252; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/XJ7D7rRJ0qrEATjdJoZi8HBRc549k+y9RIQYFkyC+k=;
        b=hGMfDz1d9944565GlrlFig/Veo/ngRioSTuh5GpVV3f5nWjOjd2DTkFjVhsa9/35/c
         d2aihCZuo9ExitozkL2AXrlJIrJnTxD6vlrRpJu4tzPX4m+HCZ1mD5VYdSm1pPnJJF59
         goNV909Yj99t0oLbbDuRfV1csplkpqGkXpAM1jG+2OQbWq5ct20/r4nPl3wEiUCwvYUL
         OYCLBAQjMIadAv5jenDhZWKS2ZOh7EQjKBCyOLEFMQfnwIPdd90OApg0hEWPOUsIL/cH
         JOLd1pjg5GAf7wQozIVhmYUxNCcWb2cEov8zqYIaZ+W7JIZvqXPpkSf/AfFJ1C2McWSb
         Z6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698425452; x=1699030252;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/XJ7D7rRJ0qrEATjdJoZi8HBRc549k+y9RIQYFkyC+k=;
        b=U4lIBMlzevzxTg2qR6gzt9voHkdqPcj4AzpAQFZAJDq3hwpTHu1mErn8RO8xpADOrN
         mC06A0uKAAKn8yFi6XheAZS8tDMMhyQ0LZKPBgwzKd38mRyWOnUEcnRWJS53UN1pc74P
         PMi7o0METzsJ6har9TPyhixZ7qj3AEP7Rhw2RohqIOeCXaHiejgQ7ghIswP7JOaEqf5M
         P0wMpiy+wcISPtK72pQgX7akB6YkU/cOkIrwaLxvA9gb508+26CibBsTHJU+2v66hgoc
         8fNPto7cSm18KDXCZvGP+LC+Vh7EHqY1lAfwhdpp7zgvOzECkgNUHKI5++BDVpmIOTZz
         HYzA==
X-Gm-Message-State: AOJu0YyyOA8Upuztq1j8+Xmc7cCFgUf8+GGYGf1/6+4mPPDKhhneP60f
	18cHRWPi0vfQmqy7a9MZVOFiwXUT73p7QZME9hYCp/lF
X-Google-Smtp-Source: AGHT+IHj919hCOvz+H8ZJDD7NLwiH+/vwA/C4tQ8niBHu5dHwiBNq2OVNXs1TsVEyuFWmgBPtmi/7sI7QwaIAer40ak=
X-Received: by 2002:a05:6512:128b:b0:508:126a:751e with SMTP id
 u11-20020a056512128b00b00508126a751emr3062515lfs.36.1698425451856; Fri, 27
 Oct 2023 09:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231027150244.231022-1-peron.clem@gmail.com>
In-Reply-To: <20231027150244.231022-1-peron.clem@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 27 Oct 2023 18:50:41 +0200
Message-ID: <CAJiuCcf33QLQrd6_H4tK48GdOXHaoLHu7cjmhJfc_PK2RBaMpw@mail.gmail.com>
Subject: Re: [PATCH] connectivity: add pcapplusplus recipe
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bc4aeb0608b57d2d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 16:50:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105779

--000000000000bc4aeb0608b57d2d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le ven. 27 oct. 2023, 17:02, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>=
 a =C3=A9crit :

> Add PcapPlusPlus 23.09 recipe.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  .../pcapplusplus/pcapplusplus_23.09.bb        | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/
> pcapplusplus_23.09.bb
>
> diff --git a/meta-oe/recipes-connectivity/pcapplusplus/
> pcapplusplus_23.09.bb b/meta-oe/recipes-connectivity/pcapplusplus/
> pcapplusplus_23.09.bb
> new file mode 100644
> index 000000000..90f18b7aa
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus_23.09.bb
> @@ -0,0 +1,19 @@
> +SUMMARY =3D "A multiplatform C++ library for capturing, parsing and
> crafting of network packets"
> +HOMEPAGE =3D "https://pcapplusplus.github.io/"
> +BUGTRACKER =3D "https://github.com/seladb/PcapPlusPlus/issues"
> +SECTION =3D "libs/network"
> +LICENSE =3D "Unlicense"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D911690f51af322440237a253d695d=
19f"
> +
> +DEPENDS =3D "libpcap"
> +
> +SRC_URI =3D "git://
> github.com/seladb/PcapPlusPlus.git;protocol=3Dhttps;branch=3Dmaster"
> +SRCREV =3D "4cf8ed44f9dd145f874dc1dd747dfefcfcab75be"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +PACKAGECONFIG ??=3D "shared"
> +PACKAGECONFIG[zstd] =3D
> "-DLIGHT_PCAPNG_ZSTD=3DON,-DLIGHT_PCAPNG_ZSTD=3DOFF,zstd"
> +PACKAGECONFIG[shared] =3D "-DBUILD_SHARED_LIBS=3DON,-DBUILD_SHARED_LIBS=
=3DOFF


I will send a v2 to also disable Tests and Examples binaries in the package

Regards

--=20
> 2.42.0
>
>

--000000000000bc4aeb0608b57d2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,<br><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">Le ven. 27 oct. 2023, 17:02, Cl=C3=A9ment P=C3=A9ro=
n &lt;<a href=3D"mailto:peron.clem@gmail.com">peron.clem@gmail.com</a>&gt; =
a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Add PcapPlusPlu=
s 23.09 recipe.<br>
<br>
Signed-off-by: Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.clem@gma=
il.com" target=3D"_blank" rel=3D"noreferrer">peron.clem@gmail.com</a>&gt;<b=
r>
---<br>
=C2=A0.../pcapplusplus/<a href=3D"http://pcapplusplus_23.09.bb" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">pcapplusplus_23.09.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 19 +++++++++++++++++++<br>
=C2=A01 file changed, 19 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-connectivity/pcapplusplus/<a href=
=3D"http://pcapplusplus_23.09.bb" rel=3D"noreferrer noreferrer" target=3D"_=
blank">pcapplusplus_23.09.bb</a><br>
<br>
diff --git a/meta-oe/recipes-connectivity/pcapplusplus/<a href=3D"http://pc=
applusplus_23.09.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">pcappl=
usplus_23.09.bb</a> b/meta-oe/recipes-connectivity/pcapplusplus/<a href=3D"=
http://pcapplusplus_23.09.bb" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">pcapplusplus_23.09.bb</a><br>
new file mode 100644<br>
index 000000000..90f18b7aa<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-connectivity/pcapplusplus/<a href=3D"http://pcapplusp=
lus_23.09.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">pcapplusplus_=
23.09.bb</a><br>
@@ -0,0 +1,19 @@<br>
+SUMMARY =3D &quot;A multiplatform C++ library for capturing, parsing and c=
rafting of network packets&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://pcapplusplus.github.io/" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">https://pcapplusplus.github.io/</a>&qu=
ot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://github.com/seladb/PcapPlusPlus/iss=
ues" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/sel=
adb/PcapPlusPlus/issues</a>&quot;<br>
+SECTION =3D &quot;libs/network&quot;<br>
+LICENSE =3D &quot;Unlicense&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D911690f51af322440237a253d6=
95d19f&quot;<br>
+<br>
+DEPENDS =3D &quot;libpcap&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/seladb/PcapPlusPlus.g=
it;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer noreferrer" target=
=3D"_blank">github.com/seladb/PcapPlusPlus.git;protocol=3Dhttps;branch=3Dma=
ster</a>&quot;<br>
+SRCREV =3D &quot;4cf8ed44f9dd145f874dc1dd747dfefcfcab75be&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit cmake<br>
+<br>
+PACKAGECONFIG ??=3D &quot;shared&quot;<br>
+PACKAGECONFIG[zstd] =3D &quot;-DLIGHT_PCAPNG_ZSTD=3DON,-DLIGHT_PCAPNG_ZSTD=
=3DOFF,zstd&quot;<br>
+PACKAGECONFIG[shared] =3D &quot;-DBUILD_SHARED_LIBS=3DON,-DBUILD_SHARED_LI=
BS=3DOFF</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">I will send a v2 to also disable Tests and Examples binaries in the pac=
kage</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards=C2=A0</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"></div><div dir=3D"auto"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
-- <br>
2.42.0<br>
<br>
</blockquote></div></div></div>

--000000000000bc4aeb0608b57d2d--

