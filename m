Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE97C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 17:50:16 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.39947.1634579405254358503
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 10:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OP0qlJhj;
 spf=permerror, err=temporary DNS error (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id m22so43060626wrb.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 10:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kL6mk3nDIV2V27QUTjZPeEwJus9a/alFLUWEzLLcLnA=;
        b=OP0qlJhjjbdziaGiFGTA1vw54FSwAVgNxpMn5d+k2Us34mcpDAktFtoLezKe24eX3M
         YKKHydhAY6T8SZJlNUT9RmO1GuqeVLyxerACNEry4AIY183gnR4nLv6x686VoVpP8vRs
         ig/HwjqXtyLgHhl2H/DH8Af5l5ftuR9AElPiZmz0NHNzL0o948Efvxs+unmQ23+vH/D9
         xtV88sdpRihqjnabcyx7Taq6OfuwKpxzK7CEQ6VHZzy+38LXhzXts1AwkP54emnxv1wm
         tEM2YraPMvgT0DbjhY/23ApbbtVc4qoG5Mer1Eab2VNvLxi+UIBE3YBtnjxFnCJacZNs
         m7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kL6mk3nDIV2V27QUTjZPeEwJus9a/alFLUWEzLLcLnA=;
        b=7Y8T91+1LXq4lave4QX99b0FZoYBRGc6ldJlg8bLWsfATO+8GxvXuNuP6A6mG6P9U3
         cLSrdOml6G1HsESDjnZC29YIWNFWf/Ai0SVEN/qxNTKEkN6snP77WnJLSS8hlhF1FVOb
         sgS5MdY2adWoo3LZjmCn/0AZNaZEuPxrQSyx/rEQ7xXknQvU/uRaRupfpxyjG4utJthf
         qYkc+p/wHZv14a/ZyGUOyyxJBkTfLp6aNuONUgZaUBnA6oNwKNh4hbFRIoR6gHZP13jN
         T9IFZwhP+IzhiHxMzlyRdmNi29OVqy1KTLQ/89TELKK8nvsJlzc6hxqGOglEyJyEHGPt
         H9CQ==
X-Gm-Message-State: AOAM533sXezBdJozgXGKWIwiyidPv8cXzcQVkP3z0nOI+y0Ghv6rjy2X
	vTIKIflaSdDavNHbWjP1aOaoGXHmc/3xl4zOMkM=
X-Google-Smtp-Source: 
 ABdhPJy/XjXJUEbK4X1j3h5BuS3J+2RyQeKTIZcE+9ExB4+Ux0C6ERXDkFlpGimuyGH4HggSZY0xvbE3KIbV+Jq03Ug=
X-Received: by 2002:a05:6000:15c6:: with SMTP id
 y6mr36777466wry.382.1634579403585;
 Mon, 18 Oct 2021 10:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211018173750.3739908-1-JPEWhacker@gmail.com>
 <CALbNGRRg=k_fJ6H93ViJOcV7V195w4aWecdyyTjeue5XhjkB7Q@mail.gmail.com>
In-Reply-To: 
 <CALbNGRRg=k_fJ6H93ViJOcV7V195w4aWecdyyTjeue5XhjkB7Q@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 18 Oct 2021 12:49:53 -0500
Message-ID: 
 <CAJdd5Gb7KxW=a_hJDL9vgaSJqXbyNPxGZM_cMf8eptm3vaRMGA@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] mutter: Move gsettings to a separate package
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Tim Orling <ticotimo@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b53a9005cea42c4b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Oct 2021 17:50:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93439

--000000000000b53a9005cea42c4b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 18, 2021, 12:44 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
>
wrote:

> On Mon, Oct 18, 2021 at 7:37 PM Joshua Watt <JPEWhacker@gmail.com> wrote:
> >
> > Move the mutter gsettings to their own package. Some other compositors
> > (specifically, phoc) want to use the mutter provided gsettings to remai=
n
> > compatible. This allows those recipes to pick up the runtime settings
> > without having to pull in all of mutter
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> But now just adding mutter to image looses gsettings. Could you add a
> RDEPEND for mutter on mutter-gsettings?
>

Yep. Good catch


> Andreas
> > ---
> >  meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
> b/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
> > index 72e776719..1a81745f4 100644
> > --- a/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
> > +++ b/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
> > @@ -73,7 +73,9 @@ do_install:append() {
> >      done
> >  }
> >
> > -PACKAGES =3D+ "${PN}-tests"
> > +GSETTINGS_PACKAGE =3D "${PN}-gsettings"
> > +
> > +PACKAGES =3D+ "${PN}-tests ${PN}-gsettings"
> >
> >  FILES:${PN} +=3D " \
> >      ${datadir}/gnome-control-center \
> > --
> > 2.33.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#93437):
> https://lists.openembedded.org/g/openembedded-devel/message/93437
> > Mute This Topic: https://lists.openembedded.org/mt/86420550/3617609
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> schnitzeltony@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000b53a9005cea42c4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Oct 18, 2021, 12:44 PM Andreas M=C3=BCller &lt=
;<a href=3D"mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, Oct 18, 2021 at 7:3=
7 PM Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_bla=
nk" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Move the mutter gsettings to their own package. Some other compositors=
<br>
&gt; (specifically, phoc) want to use the mutter provided gsettings to rema=
in<br>
&gt; compatible. This allows those recipes to pick up the runtime settings<=
br>
&gt; without having to pull in all of mutter<br>
&gt;<br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&gt;<br>
But now just adding mutter to image looses gsettings. Could you add a<br>
RDEPEND for mutter on mutter-gsettings?<br></blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Yep. Good catch</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Andreas<br>
&gt; ---<br>
&gt;=C2=A0 meta-gnome/recipes-gnome/mutter/<a href=3D"http://mutter_3.34.6.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">mutter_3.34.6.bb</a> | =
4 +++-<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-gnome/recipes-gnome/mutter/<a href=3D"http://mutter_=
3.34.6.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">mutter_3.34.6.bb=
</a> b/meta-gnome/recipes-gnome/mutter/<a href=3D"http://mutter_3.34.6.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">mutter_3.34.6.bb</a><br>
&gt; index 72e776719..1a81745f4 100644<br>
&gt; --- a/meta-gnome/recipes-gnome/mutter/<a href=3D"http://mutter_3.34.6.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">mutter_3.34.6.bb</a><br=
>
&gt; +++ b/meta-gnome/recipes-gnome/mutter/<a href=3D"http://mutter_3.34.6.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">mutter_3.34.6.bb</a><br=
>
&gt; @@ -73,7 +73,9 @@ do_install:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 done<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -PACKAGES =3D+ &quot;${PN}-tests&quot;<br>
&gt; +GSETTINGS_PACKAGE =3D &quot;${PN}-gsettings&quot;<br>
&gt; +<br>
&gt; +PACKAGES =3D+ &quot;${PN}-tests ${PN}-gsettings&quot;<br>
&gt;<br>
&gt;=C2=A0 FILES:${PN} +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${datadir}/gnome-control-center \<br>
&gt; --<br>
&gt; 2.33.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#93437): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/93437" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://lists.openembedded.org/g/openembedded-devel/message/93437<=
/a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86420550=
/3617609" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/86420550/3617609</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:schnitze=
ltony@gmail.com" target=3D"_blank" rel=3D"noreferrer">schnitzeltony@gmail.c=
om</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div></div>

--000000000000b53a9005cea42c4b--

