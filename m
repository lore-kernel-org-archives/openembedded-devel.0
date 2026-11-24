Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25769.1795545395171980110
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 10:36:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=IUlN6jc8;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67da62357acso6623654d50.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 10:36:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795545394; cv=none;
        d=google.com; s=arc-20260327;
        b=osj1TQC37hOPvPcZ1VUjIv5m5NXioMMVCvun0syNVQjm1NxFeTYt9LdY6m9VdKO7gB
         kc2LHrMM/1AxjimABs1NRxLo1qtftzOsRcTir6ewGPTjXDJ5H7BSuoEagWVpIMSSAF4k
         c2VS5l3ZQ8QsrA+uB6InfrMt5XRw8KlhJdsgB2hPyk8s+kzXBcaI95DuqyTVOu3eIbYJ
         lje6E+A4thFNUAeEXd7FICbABJMJgD4FGJowXdD0Hy4fB+xCM+pYFWkAiWV5Fum6SZ2Z
         J4SMMAxt7Q26YaMuNAfMyPOaVir7o8yzc0uY9/lcJTls9c9wXttqC1PKSkuYr06CG57j
         LHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MbSGtA2My4gtthcUpuywqnzZ+Gb5P6NQ21EBBd5q+tE=;
        fh=2i1beyVmVoMFs8jbA9VI8PWb2raW9/8lxIM3jJY2Y9E=;
        b=shC+pG496RrLvOgHaP8dvFok3HZRFmhSDUhcCK48V2OykUs7j6lU72c06xX4AL+DEs
         w83OvqLwyW0SMjeuNC/dV/rc4eEDOcQkRA88ojWbiC4oxeED0AHolYJ1kGcdprq33Zio
         5ZEvEhhZU/SAn+0Zud5QDwWQl4IBgNRFpJtJfTRA95qtId0Mvm1pnJkivehdcXmPL2J0
         ABHcggPlvAjS+4R7asUWyzT86WdPK50gThZ3fcFrIbfk8NnPYuhMdU2ziLSY3CBZEEOH
         SQgRv3869x3ibexZLZrxw21G4eSo0zOmYVQnW9xORFqEYUQzzuRvjR7T4v+YJyb45CO5
         hCHA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795545394; x=1796150194; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MbSGtA2My4gtthcUpuywqnzZ+Gb5P6NQ21EBBd5q+tE=;
        b=IUlN6jc8ji5gl5m+RF1HYRN/+eLlA26mgY0P4l0TQld/f4NsIj4wng0BKPB+iF90+x
         TfvJwJ/Y9t8rNN3Ba6Wt5ZfrytvVa8mkXJItBK0UJe5s32yrSe+jYpQHWZKjX9WPO55Y
         2/o0l0FhsILR3Orws/90RvhjDfIyazbqSilWb+RB0LYp96DCtI90c088b9+0196TpDbX
         ZBbuR4J+1+Dl+VoZB3SpW0iCcf0JqOVgULiMyMTsOm6Km8AeYI+J+pn1GaYISxfKAQuA
         hNOZYmq0DyE904OGKq8H/+GnbYLJXXpiTmsKAO7gq36G+U8e6xmvr5wvbYIzqRlbW9id
         cq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795545394; x=1796150194;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MbSGtA2My4gtthcUpuywqnzZ+Gb5P6NQ21EBBd5q+tE=;
        b=Lma1DYNsLeXrlaF7F/66aJVW019LJpF136zoimWkdV3KRyuGN0LJW/ZuU0zszPuYLm
         JirsGaEmfhCyHkiAjzOrpZU+tEoXP3Cj73TNd4TmFRb6D/wi19/V4WmgRoqPAOLlor8e
         vvztv40ppbZDUunkL1O2zzKk7CzR5KpQZ2WnwywjtdP++OAgI/5khzPO18TceJdOwSM1
         QOVdMYjHI20ER1GGWDWN0CG4EDu25xfIIr95CV6Uh05reCeiMoqeQls5R5esTx+d4X9k
         NGljbLtOqZUzxaqicDI29RAJMrmYhSPyxYI1yjkxcZwASKElqudTzU0JamvWxx4AJndS
         PnYg==
X-Forwarded-Encrypted: i=1; AL+hErFtmaLgB9PbjqaPt3hkfrTYnXNugdPjYwcSWaG+bA0F4TH3LQXrDmDUn9CFnJIASHQG7OpccsYzgHP/HQTkvjKEkBQ=@lists.openembedded.org
X-Gm-Message-State: APuU4Z8BEbVAOz5V3VCfMUgwUoh90sDx8cuUtesPixhrGashF87Upp7t
	iezQJveaDgCvB1oafhdUC+D7ACPmPzQ4wVJRB9ph0CooH0U64lYQd8rEaaJAf61766bZBKUR3/m
	M9LYsYklQxOv0Upyd5feiuFKBBa5szt4=
X-Gm-Gg: AZFdTZfuB6DQWcGqcsx32+yWzmm5xafCCnSj8g0htmhQASAFbMbrVTofPJKLIsUucW2
	tlQPHWZwogmUDBA5cBc2idKxjIHG6pjthUgFI5q3J3Nmfnn9eDl/F7RTvi7QLfscxfl8lQyZNn0
	2cL7ABS45717g9B9kFQZ5ngYvdKVFTxY5RFq51++IqUKiQ2AccVlVwqw9KaT2dZGz18Q9XUACaz
	w9nhMaomL2K53G9V/uW2cGUiOSWW5oj8QFiGzO0A/3Tw2l7YZz8FS49X6D5IbrRrRsM/K1p39QH
	Tz4w8Z2T/snmHyShxfWlgoY/0iV/pw+HUk6m9E3/2BXiKN+iDwq2EB6bk6JcPbUY8ISfEghDNKX
	IpRwq1cl/ud5mpzL60O7Worf20pe00it5rhZxy+PyARUvsJD9umynM6Gh9mdSDDSZl1rxMx0HFu
	neQXbFIZKOtYlY5pq3eGmIrJ3HoPXkA7K1gjfwo1sjQlFsUJS+2X8iGupJYhppMdK8E2QnUD+0q
	FF+dOd3kDRSVjsEC9bS+s1rOka8q1DhlKgf+uug5Y3uLNeh3pL2KFlJcW12G6LG7AH7H3bDwfH5
	0+pu4z00Pr9Vv24Zi7qpL9X5ZMPpZrYTJCj/zZi9Zx+6ssOifyBe/KRwlqDZaZlvAw==
X-Received: by 2002:a05:690e:4850:b0:67d:baf9:116f with SMTP id
 956f58d0204a3-67df42c482bmr4486236d50.3.1795545393825; Tue, 24 Nov 2026
 10:36:33 -0800 (PST)
MIME-Version: 1.0
References: <20261123101533.3325486-1-f.pflug@pengutronix.de>
 <ckxwzsldrxqucqv2hrf2vbixryv57tjnghwm5q3vzfsn244ucm@3naoywqkyuxy>
 <CAMKF1srGB20M0F--WUdkWMA6B64JdYXvzC82CUQaoFHUq9Rb=Q@mail.gmail.com> <kxldhbqfbewjkjr3idksokecmjfyfsznst2phlwsnuealzeftn@knwddty63nxn>
In-Reply-To: <kxldhbqfbewjkjr3idksokecmjfyfsznst2phlwsnuealzeftn@knwddty63nxn>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Nov 2026 10:36:06 -0800
X-Gm-Features: Aa3M54rx0ptIjpGygACy5aY_mq1pBvvAIwsRHTwfKzT4h24RtxLmzUkeHYYzPJE
Message-ID: <CAMKF1spBfdwchmwpZkYB1enNJir44xxzN23PSxOAd3ER5=JreA@mail.gmail.com>
Subject: Re: [oe] [yocto] [meta-initramfs][PATCH] rsinit: add recipe for /init
 written in rust
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Fabian Pflug <f.pflug@pengutronix.de>, khem.raj@oss.qualcomm.com, 
	openembedded-devel@lists.openembedded.org, yocto@pengutronix.de
Content-Type: multipart/alternative; boundary="000000000000608ea6066109fd97"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 18:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132959

--000000000000608ea6066109fd97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 8:41=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.=
de>
wrote:

> On 26-11-24 08:29, Khem Raj wrote:
> > On Tue, Nov 24, 2026 at 8:09=E2=80=AFAM Marco Felsch via openembedded-d=
evel
> > <m.felsch=3Dpengutronix.de@lists.openembedded.org> wrote:
> >
> > > Hi Khem,
> > >
> > > sorry for the noise, but this patch was sent prematurely and we notic=
ed
> > > that you already applied it to master.
> > >
> > > Is it possible to revert the patch from master? Our goal is to get th=
e
> > > recipe into oe-core instead.
> > >
> >
> > Please provide needed fixes in meta-oe itself, getting into OE-Core is
> > better
> > justified that way eventually since there is a higher bar to be include=
d
> in
> > OE-Core
>
> If I got your right, the shall be:
>  1) We send fixes patches on top of the merged patch.
>  2) Once everything is in place we can try to move from meta-oe to
>     oe-core?
>

right, after it has been proven to work in usecases and then it can be
proposed
for inclusion in core with some solid arguments.


>
> Regards,
>   Marco
>
>
>
> >
> >
> > >
> > > Regards,
> > >   Marco
> > >
> > > On 26-11-23 11:14, Fabian Pflug wrote:
> > > > rsinit speeds up the boot by not having to parse all the bash scrip=
ts
> > > > currently used in the initramfs and replacing it with a single bina=
ry
> > > > written in rust.
> > > >
> > > > Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
> > > > ---
> > > >  .../recipes-core/rsinit/rsinit-crates.inc     | 36
> +++++++++++++++++++
> > > >  .../recipes-core/rsinit/rsinit_v0.1.0.bb      | 31 +++++++++++++++=
+
> > > >  2 files changed, 67 insertions(+)
> > > >  create mode 100644
> meta-initramfs/recipes-core/rsinit/rsinit-crates.inc
> > > >  create mode 100644 meta-initramfs/recipes-core/rsinit/
> rsinit_v0.1.0.bb
> > > >
> > > > diff --git a/meta-initramfs/recipes-core/rsinit/rsinit-crates.inc
> > > b/meta-initramfs/recipes-core/rsinit/rsinit-crates.inc
> > > > new file mode 100644
> > > > index 0000000000..9970c4a913
> > > > --- /dev/null
> > > > +++ b/meta-initramfs/recipes-core/rsinit/rsinit-crates.inc
> > > > @@ -0,0 +1,36 @@
> > > > +# Autogenerated with 'bitbake -c update_crates rsinit'
> > > > +
> > > > +# from Cargo.lock
> > > > +SRC_URI +=3D " \
> > > > +    crate://crates.io/bitflags/2.13.0 \
> > > > +    crate://crates.io/cfg-if/1.0.4 \
> > > > +    crate://crates.io/cfg_aliases/0.2.1 \
> > > > +    crate://crates.io/getrandom/0.2.17 \
> > > > +    crate://crates.io/git-version/0.3.9 \
> > > > +    crate://crates.io/git-version-macro/0.3.9 \
> > > > +    crate://crates.io/json/0.12.4 \
> > > > +    crate://crates.io/libc/0.2.186 \
> > > > +    crate://crates.io/log/0.4.32 \
> > > > +    crate://crates.io/nix/0.31.3 \
> > > > +    crate://crates.io/proc-macro2/1.0.106 \
> > > > +    crate://crates.io/quote/1.0.45 \
> > > > +    crate://crates.io/syn/2.0.118 \
> > > > +    crate://crates.io/unicode-ident/1.0.24 \
> > > > +    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
> > > > +"
> > > > +
> > > > +SRC_URI[bitflags-2.13.0.sha256sum] =3D
> > > "b4388bee8683e3d04af747c73422af53102d2bd24d9eadb6cbc100baef4b43f8"
> > > > +SRC_URI[cfg-if-1.0.4.sha256sum] =3D
> > > "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
> > > > +SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D
> > > "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
> > > > +SRC_URI[getrandom-0.2.17.sha256sum] =3D
> > > "ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a4614ad0"
> > > > +SRC_URI[git-version-0.3.9.sha256sum] =3D
> > > "1ad568aa3db0fcbc81f2f116137f263d7304f512a1209b35b85150d3ef88ad19"
> > > > +SRC_URI[git-version-macro-0.3.9.sha256sum] =3D
> > > "53010ccb100b96a67bc32c0175f0ed1426b31b655d562898e57325f81c023ac0"
> > > > +SRC_URI[json-0.12.4.sha256sum] =3D
> > > "078e285eafdfb6c4b434e0d31e8cfcb5115b651496faca5749b88fafd4f23bfd"
> > > > +SRC_URI[libc-0.2.186.sha256sum] =3D
> > > "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
> > > > +SRC_URI[log-0.4.32.sha256sum] =3D
> > > "953f07c43838f8e6f9758cab68bf5bed85465e7587ebe0b823f1bcd81978ad3a"
> > > > +SRC_URI[nix-0.31.3.sha256sum] =3D
> > > "cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d"
> > > > +SRC_URI[proc-macro2-1.0.106.sha256sum] =3D
> > > "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
> > > > +SRC_URI[quote-1.0.45.sha256sum] =3D
> > > "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
> > > > +SRC_URI[syn-2.0.118.sha256sum] =3D
> > > "1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422"
> > > > +SRC_URI[unicode-ident-1.0.24.sha256sum] =3D
> > > "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
> > > > +SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] =3D
> > > "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
> > > > diff --git a/meta-initramfs/recipes-core/rsinit/rsinit_v0.1.0.bb
> > > b/meta-initramfs/recipes-core/rsinit/rsinit_v0.1.0.bb
> > > > new file mode 100644
> > > > index 0000000000..e2c5e71d54
> > > > --- /dev/null
> > > > +++ b/meta-initramfs/recipes-core/rsinit/rsinit_v0.1.0.bb
> > > > @@ -0,0 +1,31 @@
> > > > +SUMMARY =3D "minimalistic init written in rust"
> > > > +DESCRIPTION =3D "rsinit is a minimalistic single binary init for t=
he
> > > initramfs for embedded systems"
> > > > +HOMEPAGE =3D "https://github.com/pengutronix/rsinit"
> > > > +
> > > > +LICENSE =3D "GPL-2.0-only AND CC0-1.0"
> > > > +LIC_FILES_CHKSUM =3D
> > > "file://LICENSES/GPL-2.0-only.txt;md5=3D570a9b3749dd0463a1778803b12a6=
dce
> \
> > > > +
> > > file://LICENSES/CC0-1.0.txt;md5=3D65d3616852dbf7b1a6d4b53b00626032"
> > > > +
> > > > +SRC_URI =3D "git://
> > > github.com/pengutronix/rsinit.git;protocol=3Dhttps;branch=3Dmain"
> > > > +SRCREV =3D "${PV}"
> > > > +
> > > > +inherit cargo cargo-update-recipe-crates
> > > > +
> > > > +require ${BPN}-crates.inc
> > > > +
> > > > +INSANE_SKIP:${PN} +=3D "already-stripped"
> > > > +
> > > > +PACKAGECONFIG ??=3D " \
> > > > +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
> '',
> > > d)} \
> > > > +    reboot \
> > > > +"
> > > > +
> > > > +PACKAGECONFIG[defaults] =3D ",--no-default-features"
> > > > +PACKAGECONFIG[dmverity] =3D "--features dmverity"
> > > > +PACKAGECONFIG[reboot] =3D "--features reboot-on-failure"
> > > > +PACKAGECONFIG[systemd] =3D "--features systemd"
> > > > +PACKAGECONFIG[usb9pfs] =3D "--features usb9pfs"
> > > > +
> > > > +# cargo installs everything into ${bindir}, which is normally
> /usr/bin.
> > > > +# Not the best choice for the init system, which should reside und=
er
> > > /init
> > > > +bindir =3D ""
> > > > --
> > > > 2.47.3
> > > >
> > > >
> > > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#132951):
> > > https://lists.openembedded.org/g/openembedded-devel/message/132951
> > > Mute This Topic: https://lists.openembedded.org/mt/122431108/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
> [
> > > raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> > >
>

--000000000000608ea6066109fd97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 24,=
 2026 at 8:41=E2=80=AFAM Marco Felsch &lt;<a href=3D"mailto:m.felsch@pengut=
ronix.de">m.felsch@pengutronix.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 26-11-24 08:29, Khem Raj wrote:<br>
&gt; On Tue, Nov 24, 2026 at 8:09=E2=80=AFAM Marco Felsch via openembedded-=
devel<br>
&gt; &lt;m.felsch=3D<a href=3D"mailto:pengutronix.de@lists.openembedded.org=
" target=3D"_blank">pengutronix.de@lists.openembedded.org</a>&gt; wrote:<br=
>
&gt; <br>
&gt; &gt; Hi Khem,<br>
&gt; &gt;<br>
&gt; &gt; sorry for the noise, but this patch was sent prematurely and we n=
oticed<br>
&gt; &gt; that you already applied it to master.<br>
&gt; &gt;<br>
&gt; &gt; Is it possible to revert the patch from master? Our goal is to ge=
t the<br>
&gt; &gt; recipe into oe-core instead.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Please provide needed fixes in meta-oe itself, getting into OE-Core is=
<br>
&gt; better<br>
&gt; justified that way eventually since there is a higher bar to be includ=
ed in<br>
&gt; OE-Core<br>
<br>
If I got your right, the shall be:<br>
=C2=A01) We send fixes patches on top of the merged patch.<br>
=C2=A02) Once everything is in place we can try to move from meta-oe to<br>
=C2=A0 =C2=A0 oe-core?<br></blockquote><div><br></div><div>right, after it =
has been proven to work in usecases and then it can be proposed</div><div>f=
or inclusion in core with some solid arguments.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
=C2=A0 Marco<br>
<br>
<br>
<br>
&gt; <br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt;=C2=A0 =C2=A0Marco<br>
&gt; &gt;<br>
&gt; &gt; On 26-11-23 11:14, Fabian Pflug wrote:<br>
&gt; &gt; &gt; rsinit speeds up the boot by not having to parse all the bas=
h scripts<br>
&gt; &gt; &gt; currently used in the initramfs and replacing it with a sing=
le binary<br>
&gt; &gt; &gt; written in rust.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Fabian Pflug &lt;<a href=3D"mailto:f.pflug@pe=
ngutronix.de" target=3D"_blank">f.pflug@pengutronix.de</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 .../recipes-core/rsinit/rsinit-crates.inc=C2=A0 =C2=A0=
 =C2=A0| 36 +++++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 .../recipes-core/rsinit/<a href=3D"http://rsinit_v0.1.=
0.bb" rel=3D"noreferrer" target=3D"_blank">rsinit_v0.1.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 | 31 ++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 2 files changed, 67 insertions(+)<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta-initramfs/recipes-core/rsinit/=
rsinit-crates.inc<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta-initramfs/recipes-core/rsinit/=
<a href=3D"http://rsinit_v0.1.0.bb" rel=3D"noreferrer" target=3D"_blank">rs=
init_v0.1.0.bb</a><br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta-initramfs/recipes-core/rsinit/rsinit-crate=
s.inc<br>
&gt; &gt; b/meta-initramfs/recipes-core/rsinit/rsinit-crates.inc<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000000..9970c4a913<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta-initramfs/recipes-core/rsinit/rsinit-crates.inc<b=
r>
&gt; &gt; &gt; @@ -0,0 +1,36 @@<br>
&gt; &gt; &gt; +# Autogenerated with &#39;bitbake -c update_crates rsinit&#=
39;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +# from Cargo.lock<br>
&gt; &gt; &gt; +SRC_URI +=3D &quot; \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/=
2.13.0" rel=3D"noreferrer" target=3D"_blank">crates.io/bitflags/2.13.0</a> =
\<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.=
0.4" rel=3D"noreferrer" target=3D"_blank">crates.io/cfg-if/1.0.4</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg_alias=
es/0.2.1" rel=3D"noreferrer" target=3D"_blank">crates.io/cfg_aliases/0.2.1<=
/a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getrandom=
/0.2.17" rel=3D"noreferrer" target=3D"_blank">crates.io/getrandom/0.2.17</a=
> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/git-versi=
on/0.3.9" rel=3D"noreferrer" target=3D"_blank">crates.io/git-version/0.3.9<=
/a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/git-versi=
on-macro/0.3.9" rel=3D"noreferrer" target=3D"_blank">crates.io/git-version-=
macro/0.3.9</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/json/0.12=
.4" rel=3D"noreferrer" target=3D"_blank">crates.io/json/0.12.4</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.=
186" rel=3D"noreferrer" target=3D"_blank">crates.io/libc/0.2.186</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/log/0.4.3=
2" rel=3D"noreferrer" target=3D"_blank">crates.io/log/0.4.32</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/nix/0.31.=
3" rel=3D"noreferrer" target=3D"_blank">crates.io/nix/0.31.3</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macr=
o2/1.0.106" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.=
106</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0=
.45" rel=3D"noreferrer" target=3D"_blank">crates.io/quote/1.0.45</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.1=
18" rel=3D"noreferrer" target=3D"_blank">crates.io/syn/2.0.118</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-i=
dent/1.0.24" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1=
.0.24</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasi/0.11=
.1+wasi-snapshot-preview1" rel=3D"noreferrer" target=3D"_blank">crates.io/w=
asi/0.11.1+wasi-snapshot-preview1</a> \<br>
&gt; &gt; &gt; +&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +SRC_URI[bitflags-2.13.0.sha256sum] =3D<br>
&gt; &gt; &quot;b4388bee8683e3d04af747c73422af53102d2bd24d9eadb6cbc100baef4=
b43f8&quot;<br>
&gt; &gt; &gt; +SRC_URI[cfg-if-1.0.4.sha256sum] =3D<br>
&gt; &gt; &quot;9330f8b2ff13f34540b44e946ef35111825727b38d33286ef9861426151=
21801&quot;<br>
&gt; &gt; &gt; +SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D<br>
&gt; &gt; &quot;613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658e=
b5724&quot;<br>
&gt; &gt; &gt; +SRC_URI[getrandom-0.2.17.sha256sum] =3D<br>
&gt; &gt; &quot;ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a46=
14ad0&quot;<br>
&gt; &gt; &gt; +SRC_URI[git-version-0.3.9.sha256sum] =3D<br>
&gt; &gt; &quot;1ad568aa3db0fcbc81f2f116137f263d7304f512a1209b35b85150d3ef8=
8ad19&quot;<br>
&gt; &gt; &gt; +SRC_URI[git-version-macro-0.3.9.sha256sum] =3D<br>
&gt; &gt; &quot;53010ccb100b96a67bc32c0175f0ed1426b31b655d562898e57325f81c0=
23ac0&quot;<br>
&gt; &gt; &gt; +SRC_URI[json-0.12.4.sha256sum] =3D<br>
&gt; &gt; &quot;078e285eafdfb6c4b434e0d31e8cfcb5115b651496faca5749b88fafd4f=
23bfd&quot;<br>
&gt; &gt; &gt; +SRC_URI[libc-0.2.186.sha256sum] =3D<br>
&gt; &gt; &quot;68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece58=
7de66&quot;<br>
&gt; &gt; &gt; +SRC_URI[log-0.4.32.sha256sum] =3D<br>
&gt; &gt; &quot;953f07c43838f8e6f9758cab68bf5bed85465e7587ebe0b823f1bcd8197=
8ad3a&quot;<br>
&gt; &gt; &gt; +SRC_URI[nix-0.31.3.sha256sum] =3D<br>
&gt; &gt; &quot;cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db=
47c3d&quot;<br>
&gt; &gt; &gt; +SRC_URI[proc-macro2-1.0.106.sha256sum] =3D<br>
&gt; &gt; &quot;8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb=
30934&quot;<br>
&gt; &gt; &gt; +SRC_URI[quote-1.0.45.sha256sum] =3D<br>
&gt; &gt; &quot;41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf3725=
9b924&quot;<br>
&gt; &gt; &gt; +SRC_URI[syn-2.0.118.sha256sum] =3D<br>
&gt; &gt; &quot;1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065=
b1422&quot;<br>
&gt; &gt; &gt; +SRC_URI[unicode-ident-1.0.24.sha256sum] =3D<br>
&gt; &gt; &quot;e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf3824=
7da75&quot;<br>
&gt; &gt; &gt; +SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] =3D<b=
r>
&gt; &gt; &quot;ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4=
ea44b&quot;<br>
&gt; &gt; &gt; diff --git a/meta-initramfs/recipes-core/rsinit/<a href=3D"h=
ttp://rsinit_v0.1.0.bb" rel=3D"noreferrer" target=3D"_blank">rsinit_v0.1.0.=
bb</a><br>
&gt; &gt; b/meta-initramfs/recipes-core/rsinit/<a href=3D"http://rsinit_v0.=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">rsinit_v0.1.0.bb</a><br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000000..e2c5e71d54<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta-initramfs/recipes-core/rsinit/<a href=3D"http://r=
sinit_v0.1.0.bb" rel=3D"noreferrer" target=3D"_blank">rsinit_v0.1.0.bb</a><=
br>
&gt; &gt; &gt; @@ -0,0 +1,31 @@<br>
&gt; &gt; &gt; +SUMMARY =3D &quot;minimalistic init written in rust&quot;<b=
r>
&gt; &gt; &gt; +DESCRIPTION =3D &quot;rsinit is a minimalistic single binar=
y init for the<br>
&gt; &gt; initramfs for embedded systems&quot;<br>
&gt; &gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/pengutroni=
x/rsinit" rel=3D"noreferrer" target=3D"_blank">https://github.com/pengutron=
ix/rsinit</a>&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +LICENSE =3D &quot;GPL-2.0-only AND CC0-1.0&quot;<br>
&gt; &gt; &gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &gt; &quot;file://LICENSES/GPL-2.0-only.txt;md5=3D570a9b3749dd0463a177=
8803b12a6dce \<br>
&gt; &gt; &gt; +<br>
&gt; &gt; file://LICENSES/CC0-1.0.txt;md5=3D65d3616852dbf7b1a6d4b53b0062603=
2&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +SRC_URI =3D &quot;git://<br>
&gt; &gt; <a href=3D"http://github.com/pengutronix/rsinit.git;protocol=3Dht=
tps;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank">github.com/pengutro=
nix/rsinit.git;protocol=3Dhttps;branch=3Dmain</a>&quot;<br>
&gt; &gt; &gt; +SRCREV =3D &quot;${PV}&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +inherit cargo cargo-update-recipe-crates<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +require ${BPN}-crates.inc<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +INSANE_SKIP:${PN} +=3D &quot;already-stripped&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +PACKAGECONFIG ??=3D &quot; \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;systemd&#39;, &#39;systemd&#39;, &#39;&#39;,<br>
&gt; &gt; d)} \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 reboot \<br>
&gt; &gt; &gt; +&quot;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +PACKAGECONFIG[defaults] =3D &quot;,--no-default-features&qu=
ot;<br>
&gt; &gt; &gt; +PACKAGECONFIG[dmverity] =3D &quot;--features dmverity&quot;=
<br>
&gt; &gt; &gt; +PACKAGECONFIG[reboot] =3D &quot;--features reboot-on-failur=
e&quot;<br>
&gt; &gt; &gt; +PACKAGECONFIG[systemd] =3D &quot;--features systemd&quot;<b=
r>
&gt; &gt; &gt; +PACKAGECONFIG[usb9pfs] =3D &quot;--features usb9pfs&quot;<b=
r>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +# cargo installs everything into ${bindir}, which is normal=
ly /usr/bin.<br>
&gt; &gt; &gt; +# Not the best choice for the init system, which should res=
ide under<br>
&gt; &gt; /init<br>
&gt; &gt; &gt; +bindir =3D &quot;&quot;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.47.3<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#132951):<br>
&gt; &gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/me=
ssage/132951" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/g/openembedded-devel/message/132951</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122=
431108/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/122431108/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembed=
ded.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-devel/unsub</a> [<br>
&gt; &gt; <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@=
gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
&gt; &gt;<br>
</blockquote></div></div>

--000000000000608ea6066109fd97--
