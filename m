Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F59F53D9F
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 21:19:16 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61989.1773695947194854977
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 14:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DNtTN9zQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7986e538decso41501727b3.1
        for <Openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 14:19:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773695946; cv=none;
        d=google.com; s=arc-20240605;
        b=KOEqCvbnoaRlp7RbF0Sy+vcLls7C5GZuiZiLyO1tgTxCcptMX/7uSV4PiL3ZQqNxui
         92J0k/2aPRL3Qz6SWlgirXv5hpDYxPNC1E0QXh8PWO2lwAZ5v+LqzsDCL59/CQzKeyO4
         Vy1jNFQMb6XCMuvgDFzFwNpv5QkCqgefYtQL+Am7RNsdbVRccE4XW70CltWk2ESW2m9z
         VOALwvmmcToSLiTXxdCNH9mty/RD+NXMs4kDgSzcnvpO6iaGVhGkNC8rRBb39f7Zw7n/
         sf8rbGrK+V8DjsdrFuCRINSjolAW/0rfTpgE5QCsKgTXNULogUGJtJN8mJMtugO6MhXN
         CSOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xFm8vkrA5QjDPWtphIpAjMrPikFNJ1kbpnsN8lwdcVQ=;
        fh=NniU7nEK8jtuQSEamIWMwpmymqdA6+AafZfenCU3pXo=;
        b=QR6Mek078Sw7DitUFZjUoGusx3zWQtCat5CDASnVEnJ4bQDb+ZlXo99bylvXMuZR7S
         DZ/1CiWV+8cPW52ywMBEylPjsP4sXGWcsLTKhXM/JjlGV2ACvRYOgLY7RohmLS6466jF
         1YjR3umcLnwKLxyWQQJ4lt8OuLzdXDrEkiVh+wnYIa/rQ+SbrfudnkIrGGXtcxDyPzWQ
         IzqMePhGeWjelvr7+iqJsaLszl3RoMuJJdm0es+xYROb0/6OUKxfijpNCNm2Tq0mTWdq
         EpWuH0HlxX8FeC6yst3IXohWiUmw5xbsOMs/dsjHmVfDwXBs8BwDtUNUqoDMsC9Hmacm
         rBZA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773695946; x=1774300746; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xFm8vkrA5QjDPWtphIpAjMrPikFNJ1kbpnsN8lwdcVQ=;
        b=DNtTN9zQjSyZ+KlpnOTidB0AzVT28hq1ONd3qM2f/ru802dPK+bLnxoYw2UE5HMNjY
         o7fE7wzYA8bi0eZrA4C7suxLhW2cSMVQAKg60sD2X+kY0fgJsN6/N1bmuMKgNGB9Qjg8
         b0TKaZqQjLxbekUgL/15o4B0nWFjSqjxT21Oo5RmDykMWvXv9OI2N+DyIaV+mLGtczPQ
         /dovOelvniUWKMgU8chZXo6DwLH1g52kdYTbLZJTGvI20gLDsMDJnyqBEASMKSMZc0Yj
         EgZd4RprcgM/UkhHruSR6Ppo5G96WiQPTmwcYI4qprENcEeYx7f4HdIC/GsImRF14Wwi
         OjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773695946; x=1774300746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFm8vkrA5QjDPWtphIpAjMrPikFNJ1kbpnsN8lwdcVQ=;
        b=Qo1na0fjZb9O7Ody7ee7gh0wpdltf/v9YwL7VpHaed5LhxMhYLNkfajek+ZwdWBb3b
         s+psmciyotF3sPejnG2t7UKNeZiJqQRfRTOSSvEX7akUpg8yXmKhNBqbcOm1SV0RRgw5
         vjeCwvdPJysOOiimnQhk00EjX/tNqgFXFA2/oyrSVzWN28Ov+lYmsoZPwtQtksJFkpDC
         RjW57A9C5+FqwN9Z8QEGpaQ5pJyyOyJKc6m80jFHteRfw/QxJrqqURAvNt7XZ/NGhtS8
         XM5aDBwwdkbVaz3sVgZqrhPPlEjsJoGHrD7UiTeapLqZxUEhLfbQr0ZMDe3Id6G7hynP
         sxTQ==
X-Gm-Message-State: AOJu0Yx2hrhIyc/RWmlmWCHRWQXDlsQHoOBUyXxKYy9mpWGN/8a8AMI3
	+Kpqthb2H0D3x6OiHmqp8YxUi4Yr7n64AZlslvlFu2p8jorxEgAzwDcWAde9QQqEGLrQMgPttYr
	Vq/B+fFZi2RD/iTspFqV5swQ5ejN+q2w=
X-Gm-Gg: ATEYQzxBlSsjyjOZ2NP2zslzRjjV1lYC6stm8fWaYPL3CiV9rveVbTmQI3pt8bdz2NZ
	gtpS4mPrxZjWppwo/rh/ii15rBuc/gTeImzrPlmZyOrCty9pa8efsdPfvppvOPUYKyu/yEuBlyD
	BCfg6ftCpReOR9wPD3mPy0GeZBCM4ez/ww294F6dUgt47cr57PdXIjQtocctmNWTwp0Jeh+ytWl
	dNWrZa64kN1bcGOqLA78k1w3ds8yE1LNzwKyRF00rQYvxCYj7XkSBohlxFKV456O/yjQdJRLgBl
	D4KTaC5fZ+sLqoC6FvKW10C9woqgFIhs6fUGBLV6NIbz9qkhYXHC0mTBnKHg6Gcj5PShmAXajyE
	zWDyKaXzmTbv/hmzsJz4Lh3mdWsvKNwF6sGo=
X-Received: by 2002:a05:690c:7344:b0:799:3a3:2f25 with SMTP id
 00721157ae682-79a1c1888d0mr149107697b3.38.1773695946258; Mon, 16 Mar 2026
 14:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <189B999485293477.1328210@lists.openembedded.org> <DH4G4V56CMNZ.3IXBQC7P2RTXI@ti.com>
In-Reply-To: <DH4G4V56CMNZ.3IXBQC7P2RTXI@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Mar 2026 14:18:38 -0700
X-Gm-Features: AaiRm53F7yvAvhEHLqUeT8IMqBEGKJiJkp2sa7mfZAotcAa0iTcvw4M4CBNiLks
Message-ID: <CAMKF1spQQT05OPx_AKxKdQZ+83zn9xXaOW5WukSy5VBiNrCo1w@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 0/2] sessions: update recipes for emptty
To: Randolph Sapp <rs@ti.com>
Cc: Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d0ffb1064d2ac4e2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 21:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125290

--000000000000d0ffb1064d2ac4e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for update

On Mon, Mar 16, 2026 at 12:16=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:

> On Tue Mar 10, 2026 at 4:55 PM CDT, Randolph Sapp via
> lists.openembedded.org wrote:
> > From: Randolph Sapp <rs@ti.com>
> >
> > The x-session-manager alternative link has been removed. Instead a
> distro should
> > choose what the default session is by using the DEFAULT_SESSION variabl=
e
> of
> > xserver-nodm-init.
> >
> > If the default session cannot be found the user will be presented with =
a
> > menu to pick the session themselves. Some of these sessions already
> provided
> > their own desktop entries, others needed one to be added.
> >
> > All required recipe changes have been made, with the only major user
> facing
> > change being that a session will not be automatically selected. It's up
> to them
> > to decide at runtime, with a distro override, or with local.conf
> override.
> >
> > This series has a dependency on the emptty series in oe-core.
> >
> > Randolph Sapp (2):
> >   openbox: update for emptty
> >   icewm: update for emptty
> >
> >  meta-oe/recipes-extended/icewm/icewm_3.8.2.bb     |  6 +-----
> >  .../openbox/files/openbox.desktop                 |  6 ++++++
> >  meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb | 15 +++++++++++----
> >  3 files changed, 18 insertions(+), 9 deletions(-)
> >  create mode 100644
> meta-oe/recipes-graphics/openbox/files/openbox.desktop
> >
> > --
> > 2.53.0
>
> The required emptty series was removed from oe-core master-next. Please
> hold off
> on taking these patches for now.
>
> Randolph
>

--000000000000d0ffb1064d2ac4e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for update=C2=A0</div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 1=
6, 2026 at 12:16=E2=80=AFPM Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com">=
rs@ti.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Tue Mar 10, 2026 at 4:55 PM CDT, Randolph Sapp via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a> wrote:<br>
&gt; From: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_blank"=
>rs@ti.com</a>&gt;<br>
&gt;<br>
&gt; The x-session-manager alternative link has been removed. Instead a dis=
tro should<br>
&gt; choose what the default session is by using the DEFAULT_SESSION variab=
le of<br>
&gt; xserver-nodm-init.<br>
&gt;<br>
&gt; If the default session cannot be found the user will be presented with=
 a<br>
&gt; menu to pick the session themselves. Some of these sessions already pr=
ovided<br>
&gt; their own desktop entries, others needed one to be added.<br>
&gt;<br>
&gt; All required recipe changes have been made, with the only major user f=
acing<br>
&gt; change being that a session will not be automatically selected. It&#39=
;s up to them<br>
&gt; to decide at runtime, with a distro override, or with local.conf overr=
ide.<br>
&gt;<br>
&gt; This series has a dependency on the emptty series in oe-core.<br>
&gt;<br>
&gt; Randolph Sapp (2):<br>
&gt;=C2=A0 =C2=A0openbox: update for emptty<br>
&gt;=C2=A0 =C2=A0icewm: update for emptty<br>
&gt;<br>
&gt;=C2=A0 meta-oe/recipes-extended/icewm/<a href=3D"http://icewm_3.8.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">icewm_3.8.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 6 +-----<br>
&gt;=C2=A0 .../openbox/files/openbox.desktop=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++++++<br>
&gt;=C2=A0 meta-oe/recipes-graphics/openbox/<a href=3D"http://openbox_3.6.1=
.bb" rel=3D"noreferrer" target=3D"_blank">openbox_3.6.1.bb</a> | 15 +++++++=
++++----<br>
&gt;=C2=A0 3 files changed, 18 insertions(+), 9 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/openbox/files/openbo=
x.desktop<br>
&gt;<br>
&gt; --<br>
&gt; 2.53.0<br>
<br>
The required emptty series was removed from oe-core master-next. Please hol=
d off<br>
on taking these patches for now.<br>
<br>
Randolph<br>
</blockquote></div>

--000000000000d0ffb1064d2ac4e2--

