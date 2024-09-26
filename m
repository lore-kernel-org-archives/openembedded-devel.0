Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C189FCCFA13
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 10:13:05 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web11.39432.1727345582620820019
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Sep 2024 03:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RJEh1S+t;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-49bc44e51bcso305178137.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 03:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727345581; x=1727950381; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EJGltCScRwMcNpOIN5J/kCHdLUYbodD0ChAKBe6A2XU=;
        b=RJEh1S+t7PVIe1mTphYSNWJTPog8WIXZrPzzi2Fuxe8VG+bsOWsuUmaVATjUsz1AV2
         izVQG9xNdjN3JFBczqPRfVQJM/dwycBOiWNPMO9TuDe4sr1xD3sS6VvKkPAkIdCE8vVg
         Z0PV9FLtb7jkThwGosD1JcYaKnAC7BmWGR0QU+kRjxNzCQJWbv+8iVq5Fsiaygud7J2G
         yL/kQEuZwY/bk1EWFupTfJZPXjjTcGDjP7gXXknmulQiD+hpa5zsndapwchhv8gFqVoQ
         O2by3gUpJzaJsc4TEmxxdc3691Aq1TXvyN3lErem3hHv0CdiA3T9M5NWFa1SiobXKbIM
         qHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727345581; x=1727950381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJGltCScRwMcNpOIN5J/kCHdLUYbodD0ChAKBe6A2XU=;
        b=r6BxizKRlUpY6xY9WOUEyR9jGw77Y0AI4qocmaeLRe8JaIVKdo9fRsR8C+aFZfulUq
         +uN4PM7bufUaNaUVpMo1j4kuK5WxFVVBPac7skeNnR+G8qJL+jStvopX2kBXc3fnoZnp
         giaZ5XxHD/1nvQNqscVxXIoHLfzIihSTtwaFHbfjQ41s4GuRpFSRup+kQZ0KdQYWlpjR
         jWpbrCClQecw8rbG423nI/UhRJmAaKOuLDxAB5Ix8YkKGfGVoVFmaUzvDq1kZS8KOy2T
         em8tQf28Vi7BZNPM/oThYSiLtednvrsl3orR7FHKlDRt/ljGI7fBm+L1Q4zk+DrbwQi3
         U6FA==
X-Forwarded-Encrypted: i=1; AJvYcCVudSiRM83vSGua6V0JGk11spb31Iu8ySXZoxklz7F6gtBOuY6rCH9B0gAjf762EkBUdsKWJzgNkpdvQzZi8iB4BiY=@lists.openembedded.org
X-Gm-Message-State: AOJu0YypRgofNGVfBlk8MDXRyl5ULzvY4JckMVYjFa0giceIM4qUSWLz
	PYy1AEw/Jmr9xPh144ewbGO12QYW7vhcYx/IavannL+VkkAQ0g4ExT7BAI+dzMRgcWT2wEzL6mA
	kfNZgbynb2s6bn3R2Gm31aCgiOwU=
X-Google-Smtp-Source: AGHT+IEqOscEPUbwVXZREONi07uK4t3ydYbPtquXk+nzD4i1XUyiK+YuWuCTYN5t5oPuVoQlCIjGTBz1rBfGARJGK1I=
X-Received: by 2002:a05:6102:cc9:b0:48f:461c:ab86 with SMTP id
 ada2fe7eead31-4a15dc99c5cmr5333647137.12.1727345581486; Thu, 26 Sep 2024
 03:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240925144556.1451584-1-dmitry.baryshkov@linaro.org> <CAB2nKc_d33JRj7kLQju6SdB9OnnE37E82baQoj2nVPirsqnFOQ@mail.gmail.com>
In-Reply-To: <CAB2nKc_d33JRj7kLQju6SdB9OnnE37E82baQoj2nVPirsqnFOQ@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 26 Sep 2024 11:12:50 +0100
Message-ID: <CANPvuR=PVPxLbXD13WQ3YDxEFCtMGrEZv0ng1JkHS=FK5FPT_Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] libdevmapper: Inherit nopackages
To: vincent.prince.fr@gmail.com
Cc: dbaryshkov@gmail.com, openembedded-devel@lists.openembedded.org, 
	Peter Kjellerstedt <pkj@axis.com>, Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c9fb80062302fb80"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 10:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112516

--000000000000c9fb80062302fb80
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Vincent Prince via lists.openembedded.org <vincent.prince.fr=3D
gmail.com@lists.openembedded.org> escreveu (quinta, 26/09/2024 =C3=A0(s) 10=
:49):

> Hello all,
>
> Any update on this backport patch? :)
>

The patch is not yet on the staging tree but I believe it will be
there soon.
https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/scar=
thgap-nut

but yes, this should be a priority given that the scarthgap recipe is
broken.

Jose


>
> Best regards,
> Vincent
>
> Le mer. 25 sept. 2024 =C3=A0 16:46, Dmitry Baryshkov via
> lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org> a
> =C3=A9crit :
> >
> > From: Peter Kjellerstedt <pkj@axis.com>
> >
> > This fixes errors from buildhistory changes where packages-split would
> > be empty.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > (cherry picked from commit 90f96e053ad3eefa7693d9748efdfbfa72d7dcfd)
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >
> > The oe-core got commit c9e2a8fa2f03 ("buildhistory: Simplify intercept
> > call sites and drop SSTATEPOSTINSTFUNC usage") backported to the
> > scarthgap branch. Backport the fix for libdevmapper too.
> >
> > ---
> >  meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
> b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
> > index be558ce1d218..3b4439c3ae06 100644
> > --- a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
> > +++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.22.bb
> > @@ -5,6 +5,8 @@ require lvm2.inc
> >
> >  DEPENDS +=3D "autoconf-archive-native"
> >
> > +inherit nopackages
> > +
> >  TARGET_CC_ARCH +=3D "${LDFLAGS}"
> >
> >  do_install() {
> > --
> > 2.39.5
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112515):
> https://lists.openembedded.org/g/openembedded-devel/message/112515
> Mute This Topic: https://lists.openembedded.org/mt/108648856/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000c9fb80062302fb80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Vincent Prince via <a href=3D"http://=
lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;<a=
 href=3D"http://vincent.prince.fr" target=3D"_blank">vincent.prince.fr</a>=
=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gm=
ail.com@lists.openembedded.org</a>&gt; escreveu (quinta, 26/09/2024 =C3=A0(=
s) 10:49):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello=
 all,<br>
<br>
Any update on this backport patch? :)<br></blockquote><div><br></div><div>T=
he patch is not yet on the staging tree but I believe=C2=A0it will be there=
=C2=A0soon.<br><a href=3D"https://git.openembedded.org/meta-openembedded-co=
ntrib/log/?h=3Dstable/scarthgap-nut" target=3D"_blank">https://git.openembe=
dded.org/meta-openembedded-contrib/log/?h=3Dstable/scarthgap-nut</a><br></d=
iv><div><br></div><div>but yes, this should be a priority given that the sc=
arthgap recipe is broken.<br></div><div><br></div><div>Jose</div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best regards,<br>
Vincent<br>
<br>
Le mer. 25 sept. 2024 =C3=A0 16:46, Dmitry Baryshkov via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;dbaryshkov=3D<a href=3D"mailto:gmail.com=
@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org=
</a>&gt; a<br>
=C3=A9crit :<br>
&gt;<br>
&gt; From: Peter Kjellerstedt &lt;<a href=3D"mailto:pkj@axis.com" target=3D=
"_blank">pkj@axis.com</a>&gt;<br>
&gt;<br>
&gt; This fixes errors from buildhistory changes where packages-split would=
<br>
&gt; be empty.<br>
&gt;<br>
&gt; Signed-off-by: Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellers=
tedt@axis.com" target=3D"_blank">peter.kjellerstedt@axis.com</a>&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; (cherry picked from commit 90f96e053ad3eefa7693d9748efdfbfa72d7dcfd)<b=
r>
&gt; Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov=
@linaro.org" target=3D"_blank">dmitry.baryshkov@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; The oe-core got commit c9e2a8fa2f03 (&quot;buildhistory: Simplify inte=
rcept<br>
&gt; call sites and drop SSTATEPOSTINSTFUNC usage&quot;) backported to the<=
br>
&gt; scarthgap branch. Backport the fix for libdevmapper too.<br>
&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-support/lvm2/<a href=3D"http://libdevmapper_2.03=
.22.bb" rel=3D"noreferrer" target=3D"_blank">libdevmapper_2.03.22.bb</a> | =
2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/lvm2/<a href=3D"http://libdevmapp=
er_2.03.22.bb" rel=3D"noreferrer" target=3D"_blank">libdevmapper_2.03.22.bb=
</a> b/meta-oe/recipes-support/lvm2/<a href=3D"http://libdevmapper_2.03.22.=
bb" rel=3D"noreferrer" target=3D"_blank">libdevmapper_2.03.22.bb</a><br>
&gt; index be558ce1d218..3b4439c3ae06 100644<br>
&gt; --- a/meta-oe/recipes-support/lvm2/<a href=3D"http://libdevmapper_2.03=
.22.bb" rel=3D"noreferrer" target=3D"_blank">libdevmapper_2.03.22.bb</a><br=
>
&gt; +++ b/meta-oe/recipes-support/lvm2/<a href=3D"http://libdevmapper_2.03=
.22.bb" rel=3D"noreferrer" target=3D"_blank">libdevmapper_2.03.22.bb</a><br=
>
&gt; @@ -5,6 +5,8 @@ require lvm2.inc<br>
&gt;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;autoconf-archive-native&quot;<br>
&gt;<br>
&gt; +inherit nopackages<br>
&gt; +<br>
&gt;=C2=A0 TARGET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br>
&gt;<br>
&gt;=C2=A0 do_install() {<br>
&gt; --<br>
&gt; 2.39.5<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#112515): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/112515" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/112515</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108648856/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108648856/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000c9fb80062302fb80--

