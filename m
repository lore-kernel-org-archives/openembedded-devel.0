Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F20DAC982CC
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 22:35:03 +0000 (UTC)
Received: from mail-yx2-f29.google.com (mail-yx2-f29.google.com [74.125.224.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20686.1789857294782350201
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Sep 2026 15:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LFIWMp8y;
 spf=pass (domain: gmail.com, ip: 74.125.224.157, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f29.google.com with SMTP id 00721157ae682-85d43da99easo15288187b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 15:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789857294; cv=none;
        d=google.com; s=arc-20260327;
        b=gRShpz3sSY5zcOTbYCa7AiA7bvirYQc7ntReCAH9qz3wpdoiGcIiPOSwXO4OV1h2Uc
         vfXDmp/Ji2s5g4CQNQNe8cvuyGgdxSp7bTbNIUryyUmzAykkMNcvtelp8YWo9VRSHcow
         a88SLpe+angaFiZjkyqao6oF6V4IKuLeFGrUft06koRf3YyDtwNGNQesFcqKQJdQ/LuM
         9en12i8rkgi2FVM9+wAlOcCQUbXyzOjxRFaKDQXU9G3zWVb0b+DMfO1KQu6UPlSjTpXK
         4DHsyuV5u4licEes6j8e9c3J3f/1YEspZmcuZkoCf4zRyYxK1d/h/1yKuSt7ADaiKP8x
         h60A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Qs80ABPOhzyJjF9QUdy+omtphG5HEvwleFxzilwYf1A=;
        fh=39Jrz0pCdEEJgsQILIR/teyB9b8L5vGug4EpjbJWtVM=;
        b=F2O5ZQGWX8mEGlh/FEyzYHOfP0cnyDsoE65DnOOxQYrck2hvlpVk3XIJfXByxcFSxX
         oidM/Au/GLvItfSIUPdqKk4Ju00LwSD4w5lTzSnDmRO9imUKtZbtoxASN5H93uorVtcL
         HiSFsrYRaNMD3rWsgsYW1cdiQ3GygK96heyvLWREP/qiCmB+jBmxpy5I7MNrPH/9Vmtc
         X5OQDHBs3VqoR0Xg2MKNOi0fFMSgBwrtEiYPxJvp6kB8pv7oXFZe8Nbl2mrxXX50jLDn
         vlycBvi0c3uMURv4xzYPwajhVshgjUfzPdc62D8HiigV48Iq2QsDEM+njMHQnX3rIGa7
         XeGw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857294; x=1790462094; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qs80ABPOhzyJjF9QUdy+omtphG5HEvwleFxzilwYf1A=;
        b=LFIWMp8y45DTBA+9EipcZho+P3TcjAtCzNZrSPkeW7wmGGhC9T4o7a5ZWHjotQq8UG
         bBT8wL4V7ON5zXaL16X5iqOjdh+Ip9Dn4BOZv995wZoPEW6rIXsYFqktF5M3eK7jOWxS
         sIlosa+Dl+8p6AyxABS3mh/0BaE+qdQKMPSpUpaKvojErroyE69o0wNf8vVCo2vfwf9U
         /KdNrse3/3hMnk0ktzl3tzZUCt4roUpIh8k8xgudNAJA0YSY/zXyePJRxeHmEWr+Hs9U
         GgWBDtv3Wq/nq/83AnI5FBzYbuWd4cfdwXbgI8l9dYmuVO2RWCEPUqmxJiSNUoC+7Y3Z
         BWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857294; x=1790462094;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qs80ABPOhzyJjF9QUdy+omtphG5HEvwleFxzilwYf1A=;
        b=pZ0GhXOiETUmQMEnoxElthyBwry/z9cxWDxZLTcAJy7xfxT99YwEUUqm6ndvvIOf05
         nScFj+HWhj06/GfGGRtH3zs8WAXQX8PzdcszsPzmWkhtiVbNX8n5hk14e5VNnQp0GFMM
         6RAFrGkizBIeprgfOpg3gdJ7MuCRG5BvHq9JsPxARQUizbGHniYIceYKqjsMtYajLqQp
         Z4XA2/OKdOcyFV2jiQTFkEoKr4/S6iXizemFgL1u57j7jHqv5UhMOp59DOUeeXUsMlFS
         BWC/zRSZyjHSSQwYNGcr5jph4OGp6+f/f9lu53J5+UWkXfAaOeuHvy0NpXfnQCc1FlZV
         8d7w==
X-Forwarded-Encrypted: i=1; AKwUvBxMvGGi9c6ZWn6X3qmRIHwZhBNaoPFDNlirs3goF7qsWkjlI/XhVGShiHhYzIKTLIRwH8TlV4R7vIMLPJV+Ogh8d2U=@lists.openembedded.org
X-Gm-Message-State: AFuF++kpj60O2+6tBAuAEE8oc5tTiZFbLO7MVWU2a0p+lrPEpk6q39tv
	WoTEwfQ/156J8XJNvAzKu7b6XX6k1fSFHGg0+eOYYheVxlms9GYe0Fezh21QKtlRzMiw402Xri1
	zE1F21Qtt5RLyJDs6rzhTTlAS9l+/jDM=
X-Gm-Gg: AYBFou3V3tNCXTJvxLuqztNY+n1W1wsLu8zSGLOsDygmyQQPd+k8m93o7s202n0f6rM
	7lOKd/TeaA6YdBzLSo0ztMmfbEksBDOFSazL6nCq389oS9E4oRy2y1yZN+W/jzNqdTEdSGqCoH1
	jjJTBcFvE22IAF8VdZO1GFMX1I+F2syV2I5TpsMOqz4/Yv59QZXoA2s5ydtEkXrD/nG4hQjrS7f
	z5kbeewvC/z1e91PNfhyfgobN+/+cLdm05ExB0wccY4PbcBjgtDudjoG4vq/1SoglK2vr4ika/P
	PhaNvNZOKaF1UQiMIZ4pKNOD4J7NWqwsokdCRqpew/SAUNb8jNUCFLjuVTn2whEo9qrB1+Jjdqm
	Wz64IYBLK1QfrLR8du10xrBb3cYgOF4wObnlSnvVNEe02KSjXDBOeMMPAzgpXUXGqTpnIoz1DS6
	g9Y7YfEFsVO8XX5tA8l5BCTzz5CPF4V1MPG8UXQSu2E0fgjNf+dhDTvclMcTzjZuaSlPzxW+l/2
	ZtFrrf1ooHFaRDny3fVqRH6wXHASr8eZ2oX
X-Received: by 2002:a05:690e:148d:b0:66f:c1bc:87e8 with SMTP id
 956f58d0204a3-6717fdb320cmr2016227d50.65.1789857293646; Sat, 19 Sep 2026
 15:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260918055108.3637556-1-tillmann.severin@bmw.de> <AS8PR10MB507311D2ABDAF561DD50CED2FD872@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB507311D2ABDAF561DD50CED2FD872@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Sep 2026 15:34:26 -0700
X-Gm-Features: AcwNN1Whf9frgaWBaIK1YU4eiv0ToOQRXy6nUqii4K69V4oN7V1SeMheLd7Iux0
Message-ID: <CAMKF1spx6UOkhqbG3TpkfBP_bbHjxLJZJoPoN=KreUGgVOuF1g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] smolkit: Add low-footprint partial
 replacement for polkit
To: peter.marko@siemens.com
Cc: "Tillmann.Severin@bmw.de" <Tillmann.Severin@bmw.de>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"ross.burton@arm.com" <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="0000000000002fbff6065bdda06e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Sep 2026 22:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130126

--0000000000002fbff6065bdda06e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have accepted v1, so please send a new incremental patch addressing the
diff between v1 and v2 as well as Peter's feedback.

On Thu, Sep 17, 2026 at 11:04=E2=80=AFPM Peter Marko via lists.openembedded=
.org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:

>
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Severin Tillmann, DE-862 via
> > lists.openembedded.org
> > Sent: Friday, September 18, 2026 7:51 AM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: ross.burton@arm.com; Tillmann Severin <tillmann.severin@bmw.de>
> > Subject: [oe] [meta-oe][PATCH v2] smolkit: Add low-footprint partial
> replacement
> > for polkit
> >
> > smolkit is a replacement for a subset of
> > polkit's interface, which is low-footprint in the
> > sense of not needing to have a javascript engine
> > available to do its job. polkit has this disadvantage
> > and even with a small javascript engine like duktape,
> > it is not worth to have turing-complete configuration
> > where you could also use static JSON on some embedded
> > devices.
> >
> > Signed-off-by: Tillmann Severin <tillmann.severin@bmw.de>
> > ---
> > changes in v2:
> > - smolkit PROVIDES polkit instead of conflicting a distro feature
> > - Drop line setting `S`
> > - Tags are now available upstream
> > ---
> > ---
> >  meta-oe/recipes-extended/smolkit/smolkit.bb | 24 +++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/smolkit/smolkit.bb
> >
> > diff --git a/meta-oe/recipes-extended/smolkit/smolkit.bb
> b/meta-oe/recipes-
> > extended/smolkit/smolkit.bb
> > new file mode 100644
> > index 0000000000..47ca0c3740
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/smolkit/smolkit.bb
> > @@ -0,0 +1,24 @@
> > +SUMMARY =3D "low-footprint polkit replacement"
> > +HOMEPAGE =3D "https://github.com/bmwcarit/smolkit"
> > +DESCRIPTION =3D "\
> > +  Service that implements a subset of polkit's D-Bus interface with a
> static
> > configuration language. \
> > +"
> > +
> > +LICENSE =3D "Apache-2.0"
> > +LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
> > +
> > +inherit cmake features_check pkgconfig
> > +
> > +DEPENDS =3D "\
> > +  rapidjson \
> > +  sdbus-c++ \
> > +"
> > +
> > +PROVIDES =3D "polkit"
>
> Doesn't this cause warnings when something in the build depends on polkit=
?
> I think there is a need for defining PREFERRED_PROVIDER definitions in
> layer.conf
>
> And you maybe also need to add RPROVIDES:${PN} for cases when something
> RDEPENDS on polkit.
>
> > +
> > +PV =3D "0.2.0+git"
> > +
> > +SRC_URI =3D "\
> > +    git://github.com/bmwcarit/${BPN}.git;protocol=3Dhttps;branch=3Dmai=
n
> <http://github.com/bmwcarit/$%7BBPN%7D.git;protocol=3Dhttps;branch=3Dmain=
> \
>
> Please add ;tag=3Dv${PV} to SRC_URI
>
> > +"
> > +SRCREV =3D "46bbfd5c922a8d03a534398ee129ded822dfcafe"
> > --
> > 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130111):
> https://lists.openembedded.org/g/openembedded-devel/message/130111
> Mute This Topic: https://lists.openembedded.org/mt/121310117/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002fbff6065bdda06e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have accepted v1, so please send a new incremental patch=
 addressing the diff between v1 and v2 as well as Peter&#39;s feedback.</di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Sep 17, 2026 at 11:04=E2=80=AFPM Peter Marko via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;pe=
ter.marko=3D<a href=3D"mailto:siemens.com@lists.openembedded.org">siemens.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a> &lt;openembedd=
ed-<br>
&gt; <a href=3D"mailto:devel@lists.openembedded.org" target=3D"_blank">deve=
l@lists.openembedded.org</a>&gt; On Behalf Of Severin Tillmann, DE-862 via<=
br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Friday, September 18, 2026 7:51 AM<br>
&gt; To: <a href=3D"mailto:openembedded-devel@lists.openembedded.org" targe=
t=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
&gt; Cc: <a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burt=
on@arm.com</a>; Tillmann Severin &lt;<a href=3D"mailto:tillmann.severin@bmw=
.de" target=3D"_blank">tillmann.severin@bmw.de</a>&gt;<br>
&gt; Subject: [oe] [meta-oe][PATCH v2] smolkit: Add low-footprint partial r=
eplacement<br>
&gt; for polkit<br>
&gt; <br>
&gt; smolkit is a replacement for a subset of<br>
&gt; polkit&#39;s interface, which is low-footprint in the<br>
&gt; sense of not needing to have a javascript engine<br>
&gt; available to do its job. polkit has this disadvantage<br>
&gt; and even with a small javascript engine like duktape,<br>
&gt; it is not worth to have turing-complete configuration<br>
&gt; where you could also use static JSON on some embedded<br>
&gt; devices.<br>
&gt; <br>
&gt; Signed-off-by: Tillmann Severin &lt;<a href=3D"mailto:tillmann.severin=
@bmw.de" target=3D"_blank">tillmann.severin@bmw.de</a>&gt;<br>
&gt; ---<br>
&gt; changes in v2:<br>
&gt; - smolkit PROVIDES polkit instead of conflicting a distro feature<br>
&gt; - Drop line setting `S`<br>
&gt; - Tags are now available upstream<br>
&gt; ---<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-extended/smolkit/<a href=3D"http://smolkit.bb" r=
el=3D"noreferrer" target=3D"_blank">smolkit.bb</a> | 24 +++++++++++++++++++=
++<br>
&gt;=C2=A0 1 file changed, 24 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/smolkit/<a href=3D"h=
ttp://smolkit.bb" rel=3D"noreferrer" target=3D"_blank">smolkit.bb</a><br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-extended/smolkit/<a href=3D"http://smolki=
t.bb" rel=3D"noreferrer" target=3D"_blank">smolkit.bb</a> b/meta-oe/recipes=
-<br>
&gt; extended/smolkit/<a href=3D"http://smolkit.bb" rel=3D"noreferrer" targ=
et=3D"_blank">smolkit.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..47ca0c3740<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-extended/smolkit/<a href=3D"http://smolkit.bb" r=
el=3D"noreferrer" target=3D"_blank">smolkit.bb</a><br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +SUMMARY =3D &quot;low-footprint polkit replacement&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/bmwcarit/smolkit" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/bmwcarit/smolkit</a>&=
quot;<br>
&gt; +DESCRIPTION =3D &quot;\<br>
&gt; +=C2=A0 Service that implements a subset of polkit&#39;s D-Bus interfa=
ce with a static<br>
&gt; configuration language. \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;Apache-2.0&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D<br>
&gt; &quot;file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57&quot;<br>
&gt; +<br>
&gt; +inherit cmake features_check pkgconfig<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;\<br>
&gt; +=C2=A0 rapidjson \<br>
&gt; +=C2=A0 sdbus-c++ \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +PROVIDES =3D &quot;polkit&quot;<br>
<br>
Doesn&#39;t this cause warnings when something in the build depends on polk=
it?<br>
I think there is a need for defining PREFERRED_PROVIDER definitions in laye=
r.conf<br>
<br>
And you maybe also need to add RPROVIDES:${PN} for cases when something RDE=
PENDS on polkit.<br>
<br>
&gt; +<br>
&gt; +PV =3D &quot;0.2.0+git&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 git://<a href=3D"http://github.com/bmwcarit/$%7BBPN%7D.=
git;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/bmwcarit/${BPN}.git;protocol=3Dhttps;branch=3Dmain</a> \<br>
<br>
Please add ;tag=3Dv${PV} to SRC_URI<br>
<br>
&gt; +&quot;<br>
&gt; +SRCREV =3D &quot;46bbfd5c922a8d03a534398ee129ded822dfcafe&quot;<br>
&gt; --<br>
&gt; 2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130111): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130111" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130111</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121310117/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121310117/1997914</a><br>
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

--0000000000002fbff6065bdda06e--

