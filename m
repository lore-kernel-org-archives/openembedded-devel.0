Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DF7D730B8
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 07:58:41 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7009.1775203119804795263
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 00:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KGeQ7gAM;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79853c0f5b9so28303367b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 00:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775203119; cv=none;
        d=google.com; s=arc-20240605;
        b=TofFuYgiqmKMPWRUioiMPoo+DKPac8I8rflPHHOdoRTrVVJdZuraL2Bqc7UcVQQYsI
         Z9g/fpiWABXSxJjjeAWf+NNE5xl26oTnPK2A8WHCURqC8l4DQV1Es7l2gmtUuF5qs0Ie
         bUBDmCc0iYFzODpgkAlPqYht7PhG4wnAPzeTUyddKgpAawhC78gGJrL1hUN8jLByRYmr
         uh/Y0Y57HOoBPLvqjJp98/eN9QjPWSLD0c8na2ukVDZc+vpowJRWnvxKWH/1m2CC/mPG
         R8q/bI1l6tREAnpyfwwd9EPdXzOJBcLU+4whAIYeYusrp5fhovflb2OUyny4dd0+UJ+z
         kaHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Yo8GIJCRnLC9eyr0zwfm2BdZtCMp7z9yXK0EDyRG4ZQ=;
        fh=EqOkiAhqhyQLePL89eAbV+K6criwampNEbOPlJ51jTg=;
        b=YQa7X729/30rEqZRuDLXinUgx6gY5UHNWMHPQ3yoy2hwrQjiZ+1My9LYXYbjsEYo37
         SR0Ki09d3Tk1Wpj3fO7RC9D1G/JWxjVKlN/8liB5K1t3FwRllz/MZEeAwQg9fSOlO+6S
         h9UairkRJZkIn3gqKlarhEXWwv9271vGOBkNAHZtvoEQWD9pvjc3tSNhAB5qIW9jntHd
         hJ2sU2yATPzQ9FKggOrJnvCvPR87JU/OYq1EnAy1syWg7peTKOcHP9sldxBJIcP4UEuK
         3shCRGV4Z/g1RrcbZ6mj+ziprU3m2IvwV05QnH58/Fb5TSuPIC6T18bBX7oQ60zg/LFH
         n6MA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775203119; x=1775807919; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yo8GIJCRnLC9eyr0zwfm2BdZtCMp7z9yXK0EDyRG4ZQ=;
        b=KGeQ7gAM6GnAetPC2HB4PzxIZCBe2nsr4K35z87dB4gOU5K68kMAQGJtVht6IeJPuy
         CT7fEfvpNiZopfXIqBrz7bgAHWNP5Kl22vyQ9eU3l8qq/vfCPq9citYe0R4fK6XiUIvm
         uNRtL18K+K/7tMB7X0Akh3Ugae7XlHW2zaC6PWRK9zuVtU2DyPqnW189VMRsR270M5bJ
         C3fb7niPiX1aFpbK6REB6arkZCgw4wPlHpQXCQfPZahjp9aYU/kxxD6wSGtXcvaYF5yu
         L/FoPbfryDiuVLblH7RgQ6eoE/JpqyRv6BRBzlhPijV6KhtxJheJ6tPO+b3EW8N9mW7M
         58dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775203119; x=1775807919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yo8GIJCRnLC9eyr0zwfm2BdZtCMp7z9yXK0EDyRG4ZQ=;
        b=i0xjb5kEjUgBwH4/6LzfRzxzgM5WQe7IDalk/WFjuH6DK3NUqiqwcbvCbYl0r91PwC
         M0T8spO8EQWkS/LU5rt4droyex/cZk1wo7rrJ3IdrnS1uk/tI6e/rktDYSgA9J7hDbVu
         tTAtkSgh8jdJC3gAGf8pn5jsIEmJmhELUSbK6LTUaMqZ/qx+RZbkv9TMUX5qEuomwuDg
         Vuiqg8qPAI5HASuxhKFpuGLwLrBSMtEmHve/RsSehhqwGK/9lym7R2arqRx2V0MIELHl
         9i2m86anPlc2eVD0j4hZu6ZFtOHaN2Ajqm24PEhmWyCfBoy7ezaBEQUPDzcjUDCRYcEj
         RlSw==
X-Forwarded-Encrypted: i=1; AJvYcCX3X6yOi7WycxYcjkdj3Fj6m9bB9PHuCwULzgf0oUuaz6cdWiA7BX7hlZ05J7A1MQZzKoCc4v5plWkCDnXf8KcyshU=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx8/nr/flKncLXGRe7mrxTZtxcrrXz2nWtiuCq0opZdACP1T+JM
	hzmRJOJGEGJ0ToFl2osYTi1BhU2ccVfzEXZyplxvWg3NPVzTfvFn8XkcOxeWHJhOObw6khKYLd+
	75QZ7PyomhmMreqJ0fFN3eDT+0KWDDEA=
X-Gm-Gg: AeBDies1/sZZ+fCptDM48kKkmQrP4xKugKZVtvY0sc1X87vQVMs6SMLXm3h8NaOmyC5
	0L1K1nheIktwYAs0P86C/cwlngRE9J7k/x/D3b0IjTPS/YIHyeaQByhvba3jgsiZB79+VT6Mhs8
	QDsHy8/qOjq1Cq4WiGygFRU7QCUbPelcn17zbaO7APIC4siWvxJQ+mzDR2OHM1knu/rEP2U0/Gp
	51x9RLFfoa1yFikNr/jeuNrfEVKSwCmahz5Lmhz/78ZIrwyh4WTMSQwx4EG0c2B/ggxOBU3/c9o
	XzpVfl0aCl0GP1mZxju9jsQkz21v5cbApnhQYGYnMH54IoyeXVQ2rnPwEOSqy2W7DHFzMyAM8+8
	/yB/PKnb0iKniraDK9KZ+HMW2
X-Received: by 2002:a05:690e:438b:b0:650:3396:52d0 with SMTP id
 956f58d0204a3-650486c200emr1298812d50.13.1775203118648; Fri, 03 Apr 2026
 00:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260331095820.1967914-1-martin.jansa@gmail.com> <CA+s=J=wiBcqMjM=CLgnWgOrXLxWvQ83iQvEdGCpHeQnB0jWmGA@mail.gmail.com>
In-Reply-To: <CA+s=J=wiBcqMjM=CLgnWgOrXLxWvQ83iQvEdGCpHeQnB0jWmGA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Apr 2026 00:58:11 -0700
X-Gm-Features: AQROBzBnKqiluqfz_YY7wOY-Ts1eoArgYQ6KMtIJn8389HFR2bRgka-qS44enrk
Message-ID: <CAMKF1sorwerjG46cqtEEyYAe2Fbo7D6L5G63vRonjzftX_CDhQ@mail.gmail.com>
Subject: Re: [oe] [scarthgap][meta-oe][PATCH] flatpak: add PACKAGECONFIG for dconf
To: anuj.mittal@oss.qualcomm.com
Cc: martin.jansa@gmail.com, openembedded-devel@lists.openembedded.org, 
	Markus Volk <f_l_k@t-online.de>
Content-Type: multipart/alternative; boundary="0000000000004a9185064e89af94"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 07:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125977

--0000000000004a9185064e89af94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 12:34=E2=80=AFAM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> On Tue, Mar 31, 2026 at 5:58=E2=80=AFPM Martin Jansa via
> lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > From: Markus Volk <f_l_k@t-online.de>
> >
> > Disable by default to avoid a requirement for meta-gnome
> >
> > Signed-off-by: Markus Volk <f_l_k@t-online.de>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
> b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
> > index 639027701b..3a2974294f 100644
> > --- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
> > +++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.8.bb
> > @@ -21,7 +21,6 @@ REQUIRED_DISTRO_FEATURES =3D "polkit"
> >  DEPENDS =3D " \
> >      appstream \
> >      bison-native \
> > -    dconf \
> >      fuse3 \
> >      gdk-pixbuf \
> >      glib-2.0 \
> > @@ -38,7 +37,6 @@ DEPENDS =3D " \
> >
> >  RDEPENDS:${PN} =3D " \
> >      ca-certificates \
> > -    dconf \
> >      flatpak-xdg-utils \
> >      fuse3-utils \
> >  "
> > @@ -51,6 +49,7 @@ GTKDOC_MESON_ENABLE_FLAG =3D 'enabled'
> >  GTKDOC_MESON_DISABLE_FLAG =3D 'disabled'
> >
> >  PACKAGECONFIG[curl] =3D "-Dhttp_backend=3Dcurl,,curl"
> > +PACKAGECONFIG[dconf] =3D "-Ddconf=3Denabled,-Ddconf=3Ddisabled,dconf"
>
> This will change the behaviour for this recipe. Why is it needed? Are
> there problems if it's left enabled?
>

meta-oe does not depend on meta-gnome but its vice versa. If this option is
kept enabled by default
its adding dep on dconf which comes from meta-gnome. We do not want that

>
>
> >  PACKAGECONFIG[docbook_docs] =3D
> "-Ddocbook_docs=3Denabled,-Ddocbook_docs=3Ddisabled,xmlto-native"
> >  PACKAGECONFIG[man] =3D "-Dman=3Denabled,-Dman=3Ddisabled,libxslt-nativ=
e"
> >  PACKAGECONFIG[soup] =3D "-Dhttp_backend=3Dsoup,,libsoup-2.4"
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125974):
> https://lists.openembedded.org/g/openembedded-devel/message/125974
> Mute This Topic: https://lists.openembedded.org/mt/118593820/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004a9185064e89af94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 3, =
2026 at 12:34=E2=80=AFAM Anuj Mittal via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=3D"mailto:oss.=
qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.openembedded.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Tue, Mar 31, 2026 at 5:58=E2=80=AFPM Martin Jansa via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_=
blank">f_l_k@t-online.de</a>&gt;<br>
&gt;<br>
&gt; Disable by default to avoid a requirement for meta-gnome<br>
&gt;<br>
&gt; Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" ta=
rget=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.15.=
8.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.15.8.bb</a> | 3 +--<br=
>
&gt;=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpa=
k_1.15.8.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.15.8.bb</a> b/m=
eta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.15.8.bb" rel=3D=
"noreferrer" target=3D"_blank">flatpak_1.15.8.bb</a><br>
&gt; index 639027701b..3a2974294f 100644<br>
&gt; --- a/meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.15.=
8.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.15.8.bb</a><br>
&gt; +++ b/meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.15.=
8.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.15.8.bb</a><br>
&gt; @@ -21,7 +21,6 @@ REQUIRED_DISTRO_FEATURES =3D &quot;polkit&quot;<br>
&gt;=C2=A0 DEPENDS =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 appstream \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bison-native \<br>
&gt; -=C2=A0 =C2=A0 dconf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fuse3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gdk-pixbuf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 glib-2.0 \<br>
&gt; @@ -38,7 +37,6 @@ DEPENDS =3D &quot; \<br>
&gt;<br>
&gt;=C2=A0 RDEPENDS:${PN} =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ca-certificates \<br>
&gt; -=C2=A0 =C2=A0 dconf \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 flatpak-xdg-utils \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 fuse3-utils \<br>
&gt;=C2=A0 &quot;<br>
&gt; @@ -51,6 +49,7 @@ GTKDOC_MESON_ENABLE_FLAG =3D &#39;enabled&#39;<br>
&gt;=C2=A0 GTKDOC_MESON_DISABLE_FLAG =3D &#39;disabled&#39;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG[curl] =3D &quot;-Dhttp_backend=3Dcurl,,curl&quot;<=
br>
&gt; +PACKAGECONFIG[dconf] =3D &quot;-Ddconf=3Denabled,-Ddconf=3Ddisabled,d=
conf&quot;<br>
<br>
This will change the behaviour for this recipe. Why is it needed? Are<br>
there problems if it&#39;s left enabled?<br></blockquote><div><br></div><di=
v>meta-oe does not depend on meta-gnome but its vice versa. If this option =
is kept enabled by default</div><div>its adding dep on dconf which comes fr=
om meta-gnome. We do not want that=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
<br>
&gt;=C2=A0 PACKAGECONFIG[docbook_docs] =3D &quot;-Ddocbook_docs=3Denabled,-=
Ddocbook_docs=3Ddisabled,xmlto-native&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[man] =3D &quot;-Dman=3Denabled,-Dman=3Ddisabled,li=
bxslt-native&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[soup] =3D &quot;-Dhttp_backend=3Dsoup,,libsoup-2.4=
&quot;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125974): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125974" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125974</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118593820/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118593820/1997914</a><br>
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

--0000000000004a9185064e89af94--

