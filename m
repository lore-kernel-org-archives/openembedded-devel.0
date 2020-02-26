Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 83DE86154A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 15:05:29 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id b5so2884909qkh.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2020 07:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=E9Ac2XxbZy7sft1AmDa9B4CLGENKBNzsIjNByM+Kz8s=;
	b=W167lfwBd40djs7sxPZeF5MEsRlAUH7w185WpbdQXuTUEEsiS0YK9l8Mh33fMDF/QV
	o2+uqLZjVIChuiR7ZMRJnvy9aK/qcEfJI79TsengNl8+X5DHTqWVF1To6lRQ33IPLz1X
	ZbftU2311QQXeawl45VjIVBCPKpcd/iZZJaZtjHSb6VXAamLqxZw/KR+qvkfH0OP0P80
	m8wKxngsL8CCAG+/fpogmOo2u6ryw3BnLb49Bt8xEirZCDDd0YTq/T5YaoDygSFDTEfQ
	UjGyACVq37T1fcP2Y1eyxKE3PhiaQM6nK1eVXAAt+APveO2V5QwQolCuUuSWNiEVp932
	ySkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=E9Ac2XxbZy7sft1AmDa9B4CLGENKBNzsIjNByM+Kz8s=;
	b=cOqWNZ8Z/Hk/eDev6ioH1sNKdIFqIFoaR/BIlHuNtMtTTx5e2lKP+/U7U1pvBhaMPz
	Azin0HRgps1lGsHNe4sdtYYka+DhTCBpD9GiTw5l/k1WVEfLgYrh7fjfAuFQrlPU+N9y
	c04riaEfGn6auBluHGekdQkSb0Y5cHN+bVTdLPvRbYmSIHmfynxyQOWjpqu8QqqKT+iW
	k/gHbofL05Y+3Q5p21HnrdxBWMRmbptwV+g7e5UO6bWpIeFYJZ15ZxYACizW7z+IZLJq
	oTkk16wAtEMgqZJ9eZnUYjNvwZFeKouAcRcGgDvIRXiwPGH2CiLM3krVtyXOWZ6tLGPJ
	OtCw==
X-Gm-Message-State: APjAAAUu74kQM03JbdiGn8AKmQLjzmfYLrHlqnSeaNq1QAV0ohEKzFio
	7qf1Y/J/oQPo/gdLjNipYrj6XZHRD7FVmWjujt0=
X-Google-Smtp-Source: APXvYqxX9DhKAP/URNf7FrW9n+POSW3SzavnnQhd0AzN5usjy/9M18ZhAg3ypnlI8ApQBNHyW+fVPw6RNn/UUB772Tw=
X-Received: by 2002:a37:e47:: with SMTP id 68mr5577488qko.17.1582729530098;
	Wed, 26 Feb 2020 07:05:30 -0800 (PST)
MIME-Version: 1.0
References: <1582536523-89923-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<549f56c2-9056-ff8c-96f4-713437fc8de0@gmail.com>
	<0999b8fa5f394721bdd25b24e1afa2d7@G08CNEXMBPEKD06.g08.fujitsu.local>
In-Reply-To: <0999b8fa5f394721bdd25b24e1afa2d7@G08CNEXMBPEKD06.g08.fujitsu.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Feb 2020 07:05:03 -0800
Message-ID: <CAMKF1soAbC_uVRaBRnjb0=YUvxiRKYfHjyvbPCxuX2wqvjQ9EA@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] daq: upgrade 2.0.6 -> 2.2.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Feb 2020 15:05:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 1:33 AM Zheng, Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Hi Khem
>
> > This is causing snort build failures since we use snort 2.9
> >
> > https://errors.yoctoproject.org/Errors/Details/392611/
> >
> > Perhaps we need to upgrade snort 3.0 and daq together
>
> I'm sorry to have this error. To fix it, I have tried to upgrade snort 3.=
0 but it failed=EF=BC=88in do_configure task).
>
> And how should we do next? To fix snort and make it pass?
>

perhaps share errors yoou are seeing

> --------------------------------------------------
> Zheng Ruoqin
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>        Nanjing, 210012, China
> MAIL : zhengrq.fnst@cn.fujistu.com
>
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Tuesday, February 25, 2020 1:00 PM
> > To: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@cn.fujitsu=
.com>; openembedded-
> > devel@lists.openembedded.org
> > Subject: Re: [oe] [meta-networking][PATCH] daq: upgrade 2.0.6 -> 2.2.2
> >
> >
> >
> > On 2/24/20 1:28 AM, Zheng Ruoqin wrote:
> > > Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > > ---
> > >   .../recipes-connectivity/daq/{daq_2.0.6.bb =3D> daq_2.2.2.bb}   | 4=
 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >   rename meta-networking/recipes-connectivity/daq/{daq_2.0.6.bb =3D>
> > daq_2.2.2.bb} (88%)
> > >
> > > diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb b/=
meta-
> > networking/recipes-connectivity/daq/daq_2.2.2.bb
> > > similarity index 88%
> > > rename from meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
> > > rename to meta-networking/recipes-connectivity/daq/daq_2.2.2.bb
> > > index 42ffb17a1..29ac5c770 100644
> > > --- a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
> > > +++ b/meta-networking/recipes-connectivity/daq/daq_2.2.2.bb
> > > @@ -25,8 +25,8 @@ EXTRA_OECONF =3D "--disable-nfq-module --disable-ip=
q-
> > module --includedir=3D${include
> > >   PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', =
d)}"
> > >   PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
> > >
> > > -SRC_URI[md5sum] =3D "2cd6da422a72c129c685fc4bb848c24c"
> > > -SRC_URI[sha256sum] =3D
> > "b40e1d1273e08aaeaa86e69d4f28d535b7e53bdb3898adf539266b63137be7cb"
> > > +SRC_URI[md5sum] =3D "c61f60674a5f951f0c50faf33a611fee"
> > > +SRC_URI[sha256sum] =3D
> > "7cd818cabb1ad35360e83076e54775f07165ee71407dc672d147e27d3cd37f7b"
> > >
> > >   inherit autotools
> > >
> > >
> > This is causing snort build failures since we use snort 2.9
> >
> > https://errors.yoctoproject.org/Errors/Details/392611/
> >
> > Perhaps we need to upgrade snort 3.0 and daq together
> >
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

