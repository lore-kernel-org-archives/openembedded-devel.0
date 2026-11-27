Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13516.1795774362749157087
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 02:12:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vuatPknZ;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67db35e7953so7914271d50.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 02:12:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795774362; cv=none;
        d=google.com; s=arc-20260327;
        b=Gt0IO2yOHQdWsHgfjgG9Yp2QpkdIZoaEB4TDc9VTnTFYA5/Tp0r5FfXNxW5V21x+6r
         Vh/vvx/As23sloyG4KhnVk6h6Gti9eEE71Cp892BiRJLz/yMmaMwtQrTIzNMZAnlgMoA
         hREzyU3sQR1OLUEPghM1t8OXmwVosIgsgh2b8fGmydh2B/LSh8+aMACQUz5cu5IdQkyV
         Lvqrz4nz/ge05lMxKC2CMj8b288qsAEt+TWtCa1vmlFWgpHsoxyAKBwNw3/yVBAW23/7
         C1Nfa6Y34fPLdrR3pJPYlh9vQrd1QZwAfPfOjUIoQOw5UnPFPrcVxIe96CQIEs7c9jz7
         xj6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lPafaxnzx24cL2jRvfpGBkNXYLcuSzNg2wwJuDRt2hY=;
        fh=uVY5QCXcI17EApA0FAvpPJyhBUStJdg0pIPXwyVTmfg=;
        b=dpHUKgfe8l/Ve3dN9I0u8rFvDzS8Ic1i1+p9MzMjq6rhZceKzL4OBIwDjxo47YE8Yr
         dBW9airw6XyVqs3LNnCgrh/Aoe9gxgj7j7OqqmVqcbmHe79I+IzM1MJXJQW29u+5Qt3P
         6t4B8p+SsI68x5JDHMVDk8uggBMjqsVEyTdjVtn/GiXeLdgDfSTXevP0d3Y9OpQzMYqM
         B+yatf3SrLuBrXN6VX3GH4N0CQ5z0krKQ7wO+L+zdcqsEdAHbUm2oji3/Qoz7Qg63kAd
         8tcNi0c+PB6Ut9Ep5Tn3rIQ3UbhK3vox+mX84G8SDGFz8x7HXs3Fxwi2Jo2R0dwj124y
         LU4g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774362; x=1796379162; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lPafaxnzx24cL2jRvfpGBkNXYLcuSzNg2wwJuDRt2hY=;
        b=vuatPknZqCb6Yf7H+rPG02qHuz+Yk4NiO1Xj7KM5i5l+f1cx3YEM1KurvpDKzaSURz
         pxd113DZ+ynXI304bNHyN1kig6dnh5ilTYPXcEhmwhth3VYxQBU2yeIEOr7SuMErZRyG
         YFGBJIcdzR8ERJ2//jFXASB8+zq3kIxXC6KFqvXe5h90krD5Hrev1dayTwdOcF5LR6w6
         +t80ac5lBF+HoW4cMNkFCUjkS8Z94SjoXU081m7lzm28dQ+tsNHOK3OP18rdlyhubqq6
         7n641MnXJUIfilHUcEg1jQc2df7jj2mK7MoXihy20N84ck9FFW7oPsFe/TPkBO+U8qDK
         GEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774362; x=1796379162;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lPafaxnzx24cL2jRvfpGBkNXYLcuSzNg2wwJuDRt2hY=;
        b=jeSVbNY8jo9ZTKzkq1Zf7qlREYMXF7Bu1RdJCPF5K7sram4epybWUvq8zeQdY+XIA2
         EIHg1nzA5M1au3+5RoIekxjTIF/jknD98y/DWU5txoOnVi6h3x1JNYwrUk9tjMxsHaBZ
         OqjcgnycN57/wQpS7x3uTAlI7AIs33zBgexJ46/xmVOAYTkMrE9+YFhGoIeKSGto0NWC
         OGIkW3yPI0SyHPEp7jN9UVImo/qUDR6GpPelq3NgPPUbofhk80xGB47HAqsCdijoftjH
         X7GGIW0i6HEAucB+I8m6R12VekM43qaJIyzpyc/S6ZylT67LgEWfX0pjnSjE9wIza9qy
         8s3g==
X-Gm-Message-State: APuU4Z/nGzt8SLonrRa03npR3Y9ASM2pQIxQ0CBbZJUF1omof2pFgces
	avxxEvIygvs/2CSXYUhK6Y+A1wH0Bkh+A2og8554oN6APxOJQMQqfeqMwtuGyK/qQFn+MK7reGU
	Ynf1xz3kxVTXVUFggf822AAEzzYFEjUQ=
X-Gm-Gg: AZFdTZfxaaA5uQE+gdjTHlD70xukeG3r8aMXmUzYxezzu1Xml+9MTrbrmy9yDXPBpdj
	w0AihIVaOVdcUBQT1oLStrsy+9qv9g9Ai3RmDg5tctMycWT9Pht+kEn37LYmFtgHkRJPI3Ul37B
	XXgcHv/Zc3SbiFpQh/tQhT1WHMMuH5bKGmxzk28zbUUR4Cb2VyQF3hJrKXO93xSmkwoVXvxTMq/
	HumbrY9fOF/aipB+JC2Q/ajN5qPTAFbwCDXhTb16s4t/u52o4OF25S+gBle7c0llS/cmSBXzriD
	OOG6rN7r14aYTYMStTdQk7JarOPkHvKzTrAe2WnUPUatRpRoRoGfKlcH/MnGutbnJcXliFbbrvf
	/jOLyGupE4/u5ttUWnbISmfscu1/pt7Osu0FBvdcEqkxpUNyz2Fp9odcfFPOUV6rGC7RPCtxkLw
	fifj/QWmotU1W5pFToKTEHSM60lHulepVrb+Liead2Gpm3v0N4NX40trPqCxs/EsTTxWNGjxhVB
	EPYK15JG8PNWzU+a+bCzBBjevimkgNl4EaCzP6ljzc/hf7QGYL8fehll/ayiJQY3amOGfQ9U7UT
	91MdEBQOsHTJwjHMKfUUqMv0b1ohGpOYTTT20k/vf9AfJ8V8v39kF5bnOMdj10bqYu5ON5wUomf
	cTFymqsx7lFmbQwtwLkqPWA==
X-Received: by 2002:a05:690e:1247:b0:67d:c122:e5ea with SMTP id
 956f58d0204a3-67df446e038mr7662346d50.45.1795774361772; Fri, 27 Nov 2026
 02:12:41 -0800 (PST)
MIME-Version: 1.0
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com> <DN5TR7XMD64W.1WVHLUD7CNKRM@smile.fr>
In-Reply-To: <DN5TR7XMD64W.1WVHLUD7CNKRM@smile.fr>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Nov 2026 02:12:14 -0800
X-Gm-Features: Aa3M54p7_OeuuZ1qcldRCnUUPrpwgXrAXgrTlWMcra1qYLNqWnWQGu--K2vGHVY
Message-ID: <CAMKF1srO2W8yWC5v_jOnk6VM37WJ3ct-GaYnEyTkUAKKGkPfuQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 00/69] Upstream version check fixes
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-devel@lists.openembedded.org, 
	Khem Raj <khem.raj@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000ee26d306613f4c39"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 10:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133373

--000000000000ee26d306613f4c39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 11:45=E2=80=AFPM Yoann Congal <yoann.congal@smile.f=
r> wrote:

> On Fri Nov 27, 2026 at 1:33 AM CET, Khem Raj via openembedded-devel wrote=
:
> > Fix or add UPSTREAM_CHECK_* settings so devtool check-upgrade-status
> > reports real versions: anchor tag regexes to release tags, restrict
> > series where newer major versions are separate products or rewrites,
> > point checks at the current hosting after moves, and mark the few
> > recipes whose upstream can no longer be checked as unknown.
>
> Hello Khem,
>
> Once these series merge, do you want to run the auh-meta-oe build?
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/47
>
> With all those fixed, output should be interesting.
>
>
Launched one on my yoe/mut branch
https://autobuilder.yoctoproject.org/valkyrie/?#/buildrequests/407006


> Regards,
> --
> Yoann Congal
> Smile ECS
>
>

--000000000000ee26d306613f4c39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 26,=
 2026 at 11:45=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@s=
mile.fr">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Fri Nov 27, 2026 at 1:33 AM CET, Khem Raj =
via openembedded-devel wrote:<br>
&gt; Fix or add UPSTREAM_CHECK_* settings so devtool check-upgrade-status<b=
r>
&gt; reports real versions: anchor tag regexes to release tags, restrict<br=
>
&gt; series where newer major versions are separate products or rewrites,<b=
r>
&gt; point checks at the current hosting after moves, and mark the few<br>
&gt; recipes whose upstream can no longer be checked as unknown.<br>
<br>
Hello Khem,<br>
<br>
Once these series merge, do you want to run the auh-meta-oe build?<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/builders/47" re=
l=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproject.org/val=
kyrie/?#/builders/47</a><br>
<br>
With all those fixed, output should be interesting.<br>
<br></blockquote><div><br></div><div>Launched one on my yoe/mut branch=C2=
=A0<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/buildrequest=
s/407006">https://autobuilder.yoctoproject.org/valkyrie/?#/buildrequests/40=
7006</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
Regards,<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div></div>

--000000000000ee26d306613f4c39--
