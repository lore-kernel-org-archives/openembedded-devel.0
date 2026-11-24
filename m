Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21415.1795537808073259129
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 08:30:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=O7Flmz+T;
 spf=pass (domain: gmail.com, ip: 74.125.224.50, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6767d92cde6so5138067d50.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 08:30:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795537807; cv=none;
        d=google.com; s=arc-20260327;
        b=c2J+sZlRd693ln+kEql/DdE8l8MALlJZ4FmQ+eOEim149etrHYximXsbgpcNgyBlbo
         zTpZa+wVAzhn1pt4IBWIOW5CvbOYLbIp/xhZ6fm7+b7ifHfEYX7fXKwZuHmhzdhMs+or
         5Y0/8FW2Fsz7Ar4W2++pXPOjj0aHrnQZlIV4zp28AmKk2UQvwM8ciY4CdDL2oQ/o9q8b
         HrXsdrJyMrvz50bVfePpxwBoc0/NajL4vGP6gTpgZ3KmHNYUDaJgf38KbSpXfQGxpr4P
         Ac8Z/NTUTNrSUAnfbtMEq4GTsC3luSJB+7V0NcCdOtDj4uWHzKOJpIzIMnHJ5KPj6onB
         /Udw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Th1pVZ+7QP2exWPdZVU+AN7kqVm5JkzqZEgivuRxFBI=;
        fh=4usOmFDO1yPTFIZnkDrg+c0xIDwL5cdX9499t5dcTOI=;
        b=VO9qYOYQbutzeMck7vamFKorryLYrgCCZrZU30FL6RMt5FK/1sZNd6EA+ZLEnoi8Sk
         d6MkqzjrVVMz2A5X7/Ln5s+MCHSMqPTSy8zIpVc0tsrzYpOGI7xtG8pEPtffcMWG15Ic
         v4ZF7wdM4bakPLvZekAJq0wKYctIyDOXXVQQcBVBESe90znVRvO7NUWMztiMbzVtBHCe
         AjcTKSaUrTHDOBol+h0rOGvQah7ygeazTrTXGhjltOJW4Las9VFczJcZfNveMWo3FdKn
         JgzI/OHJ656dYLC0/ELGfkfY3B+DgrPsM+sxF51Mo2hbWq8zAkzOIDk/0YykLFLOyLAk
         /GPw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795537807; x=1796142607; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Th1pVZ+7QP2exWPdZVU+AN7kqVm5JkzqZEgivuRxFBI=;
        b=O7Flmz+TXD6bj1kGYo3K9Dpb69u4u/RmTJ/B8zZROVxKgK4CEe1aZd1HJtOKRiYQCi
         K/kdqeew6axdRuDc/NwfBtzNUu0bt0DPOCbUmJW6LMZpOJOt+ii9A5vaBTxcfP4CSumR
         jrNv6CK5GK8nbCWmK8LV7LRNSoDkftV4wYr7S36oCBKHT80X5vjWVtvj8Qz759iS7LBA
         Ysup93wvimtyrdn4I4127K6AZ63tZGmxxzQPw3zv88Km/NX8hnfJlyet/VwHcYioWvhy
         6BUgjQZAKQgfwM2rpBxjIg9PfSMAuMmLIXtO2nqjbl1ZHgl+MV4PA5tayEYuok0NY4Hg
         rSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537807; x=1796142607;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Th1pVZ+7QP2exWPdZVU+AN7kqVm5JkzqZEgivuRxFBI=;
        b=QwtvHQlS92Tnws1LTFaLT6DOumxOrh+AUk3HdbIj5LlSKXI+0cTq+epZF8PMDGAcNT
         xSh1vF4bL9Ek6ynhLU6ewszZbPBe8hBLrAIDObJSaIzAAuEZkmR9EOwz0NuyDuiBE4mB
         EtrcvI8WXY8knlpck2/o3OQQ/IEbBkfe8RK8YareCxn+LduyuDCtUIlHlQBt2qX+xyKw
         /W9eoeslqadmRdOM/OnlkZ4QTCw/nFljAxCRi6if/YUjjnJrvqujd2ic7Anza9yVSiXg
         r5Y7hG168izT8cQAsIrqo7o0GnVCvgh3WICMfXsw/fKGqEHdgGFiT6RDbpjwa5qHe8ka
         Fi6g==
X-Forwarded-Encrypted: i=1; AL+hErG1eqEC78sQdwCEriie18DqAsKTiEF7udVKo5NRCeOoeJ4z0UwIlcFmpYmFKW4YdqEWJCw+XyzSq2zNWsITsVJNbqE=@lists.openembedded.org
X-Gm-Message-State: APuU4Z9IpZr30k+WCdyfhRLDmi1rnLJt4Q7TBsrqkwD5/IzfYA15eIP3
	5x347+OxB0ZZ2ruAAiZGr929IKURsGayRwH0NN1I7EpnrqVuOksrOafJLkmtr1lwdXfW9n1CpqA
	MUMEoqhRLQlk2XKISK4jvjA2FwNiwLOA=
X-Gm-Gg: AZFdTZeaecHevou6QvvafxWWiX9VPhZygwWT5+mXBLcx2MyKxhRQCdfVLUqbEn2uwxM
	DB86MeDttJ+L199eT+GyLBmHrlJ09+6MXH1xW36UkcqK1QSHHwGdL0dHoJgAwmIPUhmEGFtxS5z
	ZdN1MYbsnDZnl7a1aMWVQTQNntHExNgde8ACjjQJuGTUMEgsXyk2v0WIJaB6KHCGteZ9mKzLa/L
	mkQ/u6brdpJAAsJw9kZ0Q5+5xznKOjSsWJC2AAZwGNSIa0EXpRUHlfmbcb1NpfWQAIdPOsXGhHs
	otuwS+hTmWapTB5Wo+4Srm1XFWChZxmlBxlgiFe5KLLf8jrZzNN8lJTaDxdyxRCTNPqDufiXPF+
	JJQFOJbMBls21XQjz/Eyd0lfZAX2uV2+lmraD8+8ldd9MBVRZAaJMSP7tl+T0lciGu39vjP0P7J
	ggt4U7HBTNehP4BQ5If0VD2Yd6uxcLyltPEY56CNw+vpfJlsDwPDWFwLoIaVX12Nq4JcSguqahi
	07NHMh+uvCq4PZsgKeWESOVnkTee2mNlFLy4UNo8AuFn6DiXoLXYa/njQ9B/f6HP/HYDac24lAo
	d4UKBjIRjTta/KJ1jgZO4X8wfJgJMb2jLSPHpM75qW/+5DtmrNNKqekuel31dMzqTw==
X-Received: by 2002:a05:690e:4852:10b0:67c:664a:9006 with SMTP id
 956f58d0204a3-67df442350bmr4332866d50.64.1795537806916; Tue, 24 Nov 2026
 08:30:06 -0800 (PST)
MIME-Version: 1.0
References: <20261123101533.3325486-1-f.pflug@pengutronix.de> <ckxwzsldrxqucqv2hrf2vbixryv57tjnghwm5q3vzfsn244ucm@3naoywqkyuxy>
In-Reply-To: <ckxwzsldrxqucqv2hrf2vbixryv57tjnghwm5q3vzfsn244ucm@3naoywqkyuxy>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Nov 2026 08:29:40 -0800
X-Gm-Features: Aa3M54qIn9uxC9JjoRgAF25qh-azXH0ubxQXIuhTi2U22tTBlNjLG-Dz5SrEgzc
Message-ID: <CAMKF1srGB20M0F--WUdkWMA6B64JdYXvzC82CUQaoFHUq9Rb=Q@mail.gmail.com>
Subject: Re: [oe] [yocto] [meta-initramfs][PATCH] rsinit: add recipe for /init
 written in rust
To: m.felsch@pengutronix.de
Cc: Fabian Pflug <f.pflug@pengutronix.de>, khem.raj@oss.qualcomm.com, 
	openembedded-devel@lists.openembedded.org, yocto@pengutronix.de
Content-Type: multipart/alternative; boundary="0000000000002982b806610839f4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 16:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132952

--0000000000002982b806610839f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 8:09=E2=80=AFAM Marco Felsch via openembedded-devel
<m.felsch=3Dpengutronix.de@lists.openembedded.org> wrote:

> Hi Khem,
>
> sorry for the noise, but this patch was sent prematurely and we noticed
> that you already applied it to master.
>
> Is it possible to revert the patch from master? Our goal is to get the
> recipe into oe-core instead.
>

Please provide needed fixes in meta-oe itself, getting into OE-Core is
better
justified that way eventually since there is a higher bar to be included in
OE-Core


>
> Regards,
>   Marco
>
> On 26-11-23 11:14, Fabian Pflug wrote:
> > rsinit speeds up the boot by not having to parse all the bash scripts
> > currently used in the initramfs and replacing it with a single binary
> > written in rust.
> >
> > Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
> > ---
> >  .../recipes-core/rsinit/rsinit-crates.inc     | 36 +++++++++++++++++++
> >  .../recipes-core/rsinit/rsinit_v0.1.0.bb      | 31 ++++++++++++++++
> >  2 files changed, 67 insertions(+)
> >  create mode 100644 meta-initramfs/recipes-core/rsinit/rsinit-crates.in=
c
> >  create mode 100644 meta-initramfs/recipes-core/rsinit/rsinit_v0.1.0.bb
> >
> > diff --git a/meta-initramfs/recipes-core/rsinit/rsinit-crates.inc
> b/meta-initramfs/recipes-core/rsinit/rsinit-crates.inc
> > new file mode 100644
> > index 0000000000..9970c4a913
> > --- /dev/null
> > +++ b/meta-initramfs/recipes-core/rsinit/rsinit-crates.inc
> > @@ -0,0 +1,36 @@
> > +# Autogenerated with 'bitbake -c update_crates rsinit'
> > +
> > +# from Cargo.lock
> > +SRC_URI +=3D " \
> > +    crate://crates.io/bitflags/2.13.0 \
> > +    crate://crates.io/cfg-if/1.0.4 \
> > +    crate://crates.io/cfg_aliases/0.2.1 \
> > +    crate://crates.io/getrandom/0.2.17 \
> > +    crate://crates.io/git-version/0.3.9 \
> > +    crate://crates.io/git-version-macro/0.3.9 \
> > +    crate://crates.io/json/0.12.4 \
> > +    crate://crates.io/libc/0.2.186 \
> > +    crate://crates.io/log/0.4.32 \
> > +    crate://crates.io/nix/0.31.3 \
> > +    crate://crates.io/proc-macro2/1.0.106 \
> > +    crate://crates.io/quote/1.0.45 \
> > +    crate://crates.io/syn/2.0.118 \
> > +    crate://crates.io/unicode-ident/1.0.24 \
> > +    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
> > +"
> > +
> > +SRC_URI[bitflags-2.13.0.sha256sum] =3D
> "b4388bee8683e3d04af747c73422af53102d2bd24d9eadb6cbc100baef4b43f8"
> > +SRC_URI[cfg-if-1.0.4.sha256sum] =3D
> "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
> > +SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D
> "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
> > +SRC_URI[getrandom-0.2.17.sha256sum] =3D
> "ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a4614ad0"
> > +SRC_URI[git-version-0.3.9.sha256sum] =3D
> "1ad568aa3db0fcbc81f2f116137f263d7304f512a1209b35b85150d3ef88ad19"
> > +SRC_URI[git-version-macro-0.3.9.sha256sum] =3D
> "53010ccb100b96a67bc32c0175f0ed1426b31b655d562898e57325f81c023ac0"
> > +SRC_URI[json-0.12.4.sha256sum] =3D
> "078e285eafdfb6c4b434e0d31e8cfcb5115b651496faca5749b88fafd4f23bfd"
> > +SRC_URI[libc-0.2.186.sha256sum] =3D
> "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
> > +SRC_URI[log-0.4.32.sha256sum] =3D
> "953f07c43838f8e6f9758cab68bf5bed85465e7587ebe0b823f1bcd81978ad3a"
> > +SRC_URI[nix-0.31.3.sha256sum] =3D
> "cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d"
> > +SRC_URI[proc-macro2-1.0.106.sha256sum] =3D
> "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
> > +SRC_URI[quote-1.0.45.sha256sum] =3D
> "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
> > +SRC_URI[syn-2.0.118.sha256sum] =3D
> "1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422"
> > +SRC_URI[unicode-ident-1.0.24.sha256sum] =3D
> "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
> > +SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] =3D
> "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
> > diff --git a/meta-initramfs/recipes-core/rsinit/rsinit_v0.1.0.bb
> b/meta-initramfs/recipes-core/rsinit/rsinit_v0.1.0.bb
> > new file mode 100644
> > index 0000000000..e2c5e71d54
> > --- /dev/null
> > +++ b/meta-initramfs/recipes-core/rsinit/rsinit_v0.1.0.bb
> > @@ -0,0 +1,31 @@
> > +SUMMARY =3D "minimalistic init written in rust"
> > +DESCRIPTION =3D "rsinit is a minimalistic single binary init for the
> initramfs for embedded systems"
> > +HOMEPAGE =3D "https://github.com/pengutronix/rsinit"
> > +
> > +LICENSE =3D "GPL-2.0-only AND CC0-1.0"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENSES/GPL-2.0-only.txt;md5=3D570a9b3749dd0463a1778803b12a6dce =
\
> > +
> file://LICENSES/CC0-1.0.txt;md5=3D65d3616852dbf7b1a6d4b53b00626032"
> > +
> > +SRC_URI =3D "git://
> github.com/pengutronix/rsinit.git;protocol=3Dhttps;branch=3Dmain"
> > +SRCREV =3D "${PV}"
> > +
> > +inherit cargo cargo-update-recipe-crates
> > +
> > +require ${BPN}-crates.inc
> > +
> > +INSANE_SKIP:${PN} +=3D "already-stripped"
> > +
> > +PACKAGECONFIG ??=3D " \
> > +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '',
> d)} \
> > +    reboot \
> > +"
> > +
> > +PACKAGECONFIG[defaults] =3D ",--no-default-features"
> > +PACKAGECONFIG[dmverity] =3D "--features dmverity"
> > +PACKAGECONFIG[reboot] =3D "--features reboot-on-failure"
> > +PACKAGECONFIG[systemd] =3D "--features systemd"
> > +PACKAGECONFIG[usb9pfs] =3D "--features usb9pfs"
> > +
> > +# cargo installs everything into ${bindir}, which is normally /usr/bin=
.
> > +# Not the best choice for the init system, which should reside under
> /init
> > +bindir =3D ""
> > --
> > 2.47.3
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#132951):
> https://lists.openembedded.org/g/openembedded-devel/message/132951
> Mute This Topic: https://lists.openembedded.org/mt/122431108/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002982b806610839f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 24,=
 2026 at 8:09=E2=80=AFAM Marco Felsch via openembedded-devel &lt;m.felsch=
=3D<a href=3D"mailto:pengutronix.de@lists.openembedded.org">pengutronix.de@=
lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Hi Khem,<br>
<br>
sorry for the noise, but this patch was sent prematurely and we noticed<br>
that you already applied it to master.<br>
<br>
Is it possible to revert the patch from master? Our goal is to get the<br>
recipe into oe-core instead.<br></blockquote><div><br></div><div>Please pro=
vide needed fixes in meta-oe itself, getting into OE-Core is better</div><d=
iv>justified that way eventually since there is a higher bar to be included=
 in OE-Core</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Regards,<br>
=C2=A0 Marco<br>
<br>
On 26-11-23 11:14, Fabian Pflug wrote:<br>
&gt; rsinit speeds up the boot by not having to parse all the bash scripts<=
br>
&gt; currently used in the initramfs and replacing it with a single binary<=
br>
&gt; written in rust.<br>
&gt; <br>
&gt; Signed-off-by: Fabian Pflug &lt;<a href=3D"mailto:f.pflug@pengutronix.=
de" target=3D"_blank">f.pflug@pengutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../recipes-core/rsinit/rsinit-crates.inc=C2=A0 =C2=A0 =C2=A0| 3=
6 +++++++++++++++++++<br>
&gt;=C2=A0 .../recipes-core/rsinit/<a href=3D"http://rsinit_v0.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">rsinit_v0.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
| 31 ++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 67 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-initramfs/recipes-core/rsinit/rsinit-cra=
tes.inc<br>
&gt;=C2=A0 create mode 100644 meta-initramfs/recipes-core/rsinit/<a href=3D=
"http://rsinit_v0.1.0.bb" rel=3D"noreferrer" target=3D"_blank">rsinit_v0.1.=
0.bb</a><br>
&gt; <br>
&gt; diff --git a/meta-initramfs/recipes-core/rsinit/rsinit-crates.inc b/me=
ta-initramfs/recipes-core/rsinit/rsinit-crates.inc<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..9970c4a913<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-initramfs/recipes-core/rsinit/rsinit-crates.inc<br>
&gt; @@ -0,0 +1,36 @@<br>
&gt; +# Autogenerated with &#39;bitbake -c update_crates rsinit&#39;<br>
&gt; +<br>
&gt; +# from Cargo.lock<br>
&gt; +SRC_URI +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/2.13.0" re=
l=3D"noreferrer" target=3D"_blank">crates.io/bitflags/2.13.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.4" rel=
=3D"noreferrer" target=3D"_blank">crates.io/cfg-if/1.0.4</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg_aliases/0.2.1" =
rel=3D"noreferrer" target=3D"_blank">crates.io/cfg_aliases/0.2.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getrandom/0.2.17" r=
el=3D"noreferrer" target=3D"_blank">crates.io/getrandom/0.2.17</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/git-version/0.3.9" =
rel=3D"noreferrer" target=3D"_blank">crates.io/git-version/0.3.9</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/git-version-macro/0=
.3.9" rel=3D"noreferrer" target=3D"_blank">crates.io/git-version-macro/0.3.=
9</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/json/0.12.4" rel=3D=
"noreferrer" target=3D"_blank">crates.io/json/0.12.4</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.186" rel=
=3D"noreferrer" target=3D"_blank">crates.io/libc/0.2.186</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/log/0.4.32" rel=3D"=
noreferrer" target=3D"_blank">crates.io/log/0.4.32</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/nix/0.31.3" rel=3D"=
noreferrer" target=3D"_blank">crates.io/nix/0.31.3</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.106=
" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.106</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.45" rel=
=3D"noreferrer" target=3D"_blank">crates.io/quote/1.0.45</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.118" rel=3D=
"noreferrer" target=3D"_blank">crates.io/syn/2.0.118</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-ident/1.0.2=
4" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-ident/1.0.24</a> =
\<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasi/0.11.1+wasi-sn=
apshot-preview1" rel=3D"noreferrer" target=3D"_blank">crates.io/wasi/0.11.1=
+wasi-snapshot-preview1</a> \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +SRC_URI[bitflags-2.13.0.sha256sum] =3D &quot;b4388bee8683e3d04af747c7=
3422af53102d2bd24d9eadb6cbc100baef4b43f8&quot;<br>
&gt; +SRC_URI[cfg-if-1.0.4.sha256sum] =3D &quot;9330f8b2ff13f34540b44e946ef=
35111825727b38d33286ef986142615121801&quot;<br>
&gt; +SRC_URI[cfg_aliases-0.2.1.sha256sum] =3D &quot;613afe47fcd5fac7ccf1db=
93babcb082c5994d996f20b8b159f2ad1658eb5724&quot;<br>
&gt; +SRC_URI[getrandom-0.2.17.sha256sum] =3D &quot;ff2abc00be7fca6ebc47452=
4697ae276ad847ad0a6b3faa4bcb027e9a4614ad0&quot;<br>
&gt; +SRC_URI[git-version-0.3.9.sha256sum] =3D &quot;1ad568aa3db0fcbc81f2f1=
16137f263d7304f512a1209b35b85150d3ef88ad19&quot;<br>
&gt; +SRC_URI[git-version-macro-0.3.9.sha256sum] =3D &quot;53010ccb100b96a6=
7bc32c0175f0ed1426b31b655d562898e57325f81c023ac0&quot;<br>
&gt; +SRC_URI[json-0.12.4.sha256sum] =3D &quot;078e285eafdfb6c4b434e0d31e8c=
fcb5115b651496faca5749b88fafd4f23bfd&quot;<br>
&gt; +SRC_URI[libc-0.2.186.sha256sum] =3D &quot;68ab91017fe16c622486840e4c8=
3c9a37afeff978bd239b5293d61ece587de66&quot;<br>
&gt; +SRC_URI[log-0.4.32.sha256sum] =3D &quot;953f07c43838f8e6f9758cab68bf5=
bed85465e7587ebe0b823f1bcd81978ad3a&quot;<br>
&gt; +SRC_URI[nix-0.31.3.sha256sum] =3D &quot;cf20d2fde8ff38632c426f1165ed7=
436270b44f199fc55284c38276f9db47c3d&quot;<br>
&gt; +SRC_URI[proc-macro2-1.0.106.sha256sum] =3D &quot;8fd00f0bb2e90d81d104=
4c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934&quot;<br>
&gt; +SRC_URI[quote-1.0.45.sha256sum] =3D &quot;41f2619966050689382d2b44f66=
4f4bc593e129785a36d6ee376ddf37259b924&quot;<br>
&gt; +SRC_URI[syn-2.0.118.sha256sum] =3D &quot;1b9ae57f904213ebb649ce6895b8=
a66c66f0203b9319718f69a5612a065b1422&quot;<br>
&gt; +SRC_URI[unicode-ident-1.0.24.sha256sum] =3D &quot;e6e4313cd5fcd3dad5c=
afa179702e2b244f760991f45397d14d4ebf38247da75&quot;<br>
&gt; +SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] =3D &quot;ccf3e=
c651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b&quot;<br>
&gt; diff --git a/meta-initramfs/recipes-core/rsinit/<a href=3D"http://rsin=
it_v0.1.0.bb" rel=3D"noreferrer" target=3D"_blank">rsinit_v0.1.0.bb</a> b/m=
eta-initramfs/recipes-core/rsinit/<a href=3D"http://rsinit_v0.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">rsinit_v0.1.0.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e2c5e71d54<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-initramfs/recipes-core/rsinit/<a href=3D"http://rsinit_v0.1=
.0.bb" rel=3D"noreferrer" target=3D"_blank">rsinit_v0.1.0.bb</a><br>
&gt; @@ -0,0 +1,31 @@<br>
&gt; +SUMMARY =3D &quot;minimalistic init written in rust&quot;<br>
&gt; +DESCRIPTION =3D &quot;rsinit is a minimalistic single binary init for=
 the initramfs for embedded systems&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/pengutronix/rsinit" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/pengutronix/rsinit<=
/a>&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;GPL-2.0-only AND CC0-1.0&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSES/GPL-2.0-only.txt;md5=3D570=
a9b3749dd0463a1778803b12a6dce \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://LICENSES/CC0-1.0.txt;md5=3D65d3616852dbf7b1a6d4b53b00626032&quot;<b=
r>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/pengutronix/rsin=
it.git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank"=
>github.com/pengutronix/rsinit.git;protocol=3Dhttps;branch=3Dmain</a>&quot;=
<br>
&gt; +SRCREV =3D &quot;${PV}&quot;<br>
&gt; +<br>
&gt; +inherit cargo cargo-update-recipe-crates<br>
&gt; +<br>
&gt; +require ${BPN}-crates.inc<br>
&gt; +<br>
&gt; +INSANE_SKIP:${PN} +=3D &quot;already-stripped&quot;<br>
&gt; +<br>
&gt; +PACKAGECONFIG ??=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sy=
stemd&#39;, &#39;systemd&#39;, &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 reboot \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +PACKAGECONFIG[defaults] =3D &quot;,--no-default-features&quot;<br>
&gt; +PACKAGECONFIG[dmverity] =3D &quot;--features dmverity&quot;<br>
&gt; +PACKAGECONFIG[reboot] =3D &quot;--features reboot-on-failure&quot;<br=
>
&gt; +PACKAGECONFIG[systemd] =3D &quot;--features systemd&quot;<br>
&gt; +PACKAGECONFIG[usb9pfs] =3D &quot;--features usb9pfs&quot;<br>
&gt; +<br>
&gt; +# cargo installs everything into ${bindir}, which is normally /usr/bi=
n.<br>
&gt; +# Not the best choice for the init system, which should reside under =
/init<br>
&gt; +bindir =3D &quot;&quot;<br>
&gt; -- <br>
&gt; 2.47.3<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#132951): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/132951" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/132951</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122431108/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122431108/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002982b806610839f4--
