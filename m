Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BFBF013FA
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 21:19:35 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61998.1773695971005290920
 for <Openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 14:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jUKmG+58;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-64c31ca77b4so5299534d50.2
        for <Openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 14:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773695970; cv=none;
        d=google.com; s=arc-20240605;
        b=bpW5inRTq9bivXuhxyZqrBXBp0m5wlB4CaFG0tyMwMKCYS2lmJgqdpFQy2AfSkRS97
         2nZsss2fKPBCi1ghn13WF5nS5KAnfVqNHxFuM5rReAuT/zAcpBX1/MpyK7yYfmeYo/5U
         4izTPXbyWKrxkrrEUfRuTdRKyPrU5EiX5XCC7NQDbr5IZAocMnQrF3es6aQ9ZRT+7HBf
         Rr5oT3e1RBpeNLIN1fufZ71ZaGl8q7300yCNLd+0UFcKd+K41HYw7+mx7HfThcHjn1IR
         am7/cgCkK87+7IYF093+HSk6Ghu5nciYvJxJyfpz/fNDMBh3p4l8nm7rrYInEHyF1WbV
         q9qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OFF24tVriIPWTq8Ve4WBU07hQ7CvXEURpnTw5mnEsIc=;
        fh=e642JFFuaOm0VJL5QzX7JKMmcnM38F57RhUxT/5/FGA=;
        b=aeKSGnGjfU+AE3d89GM0lYJzUmGsNdCgLX7wM/LlEWdqRMuGHQr+je+9p+H/Hko45F
         P816qqce8oUCi+bQAH9+SB/8ntZ3o/2hPs56EZmDsIocknIjmL1ewTzrszwC2yOJ9QMH
         76ah5OZyUQpS3vr7Y9pALDvJ5GijljzxYTkifUlZscM1rJnDtIOtIYAvZspYvQ/xDMLi
         ZNfojACQw11xHeKzgzsa8XM2m3hYkmF/cf5Kyxjqce4lwpPm+V7KEyNvrYkVcru4hPV9
         2DuRrGScEsQ7/n2+8YAmJlSXVYtZAl3Rvxi4c6SV6goC7TM5L4QeTeFaC5a7cdHw3/+2
         kY4w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773695970; x=1774300770; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OFF24tVriIPWTq8Ve4WBU07hQ7CvXEURpnTw5mnEsIc=;
        b=jUKmG+58FuGGNH6MtY9xyWCF1ci/DXllPg9TxoXSq62Amtrz4GeyviGy97pOqbGDWq
         PBlHtvpkr+TT/iUg8hrw7a06P/nfOmiBZ5wXq0Ek9extGKHyv1lyTJGgKNbW1PKXWSV2
         vM/dw0GkvHW26IJvsxJWpV6CaB7igWsrH9eC5uTCRRRLlYjILPm+A2d3SEUOnqGT/4wg
         MPOE8CZKVuFNFqviMAs4joZ0iVbAlaN2GmnFDMYYGxHF7DJUWI2YXUQny5VQ7ofTOPWQ
         tKh/pWvLuMa4fwRg8wveNhcJudYSHTujuQObzIfw11AH7bCAjk+32p17swgwBJlQ7RMj
         13oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773695970; x=1774300770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFF24tVriIPWTq8Ve4WBU07hQ7CvXEURpnTw5mnEsIc=;
        b=oebVdKtuFrLkRa7tp32UOgDuozJhvP1VRf8YpBLaHwt6jTzquyAygmXjrhLNbAkI8t
         KcdcjanRuUL4rWW+BaQKnLPddLFyduVGp59aENJIXf9UPWttab6BW4l2jzKi7aY4hZAh
         SeP5ruGmhTGdKOTMC4A0EQCTcfnKNOn/0zEFm12tivZS/tXyj4GIgci3QIIRz7mbxVmz
         HE8TNVpdwbwu8IlQ4VHHD2iJLONbjh82kmcCt+cM2zkZniDYglWzqUDDc+q4/znP1Dnr
         FlkMpwN5DYYjpfislyX4+QpIVCbLZ4zaeQKGqCaXYSuWtB9Elc0VX8WnqbjHKxu5cfSF
         vB6g==
X-Forwarded-Encrypted: i=1; AJvYcCU+Bm6On5pwo5mDJqGcX1z6a5YnzruUBF2gxNItXUaJM+X0uMNfW/S7AsNsugPy5xV96Lc2bFjfJNPARCqx2R4bR/Y=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyubQPF3xV7kWPAKIyjyeda/Vh/2Z0VkohgR1I+thREbocD7YGT
	N09Up1M9qYoUCOfStinzwmegS2rqVhuTuVsnPVjoLeCh9esKU6fNOynBlne79BJrgFDYaUrhTjc
	YMhgsC6bK+jM8gVf5es5NdIRFjJDYcXY=
X-Gm-Gg: ATEYQzxVWUhduJ4lJJrGwz4B0FHX2OuGeDQn9JpW3WjNUf8Z8Bjlr3p3JshoKOVf++3
	rFjI9I0kmwIogfSoHTtdMGr9M+Dck/qBFQbhG2PPI0bkVlt0VNnsWrTG5hDX6JeEPS2sFPhSWG8
	aF6OfrXqaNcqZyAyqteXhKI9Y1lAv5HEuBBmBqksWAv8cW/TcWk8LmYGqQRiUi7rsm4LC/LhZ6n
	PBI/MskHMOGXF0jip6zOcYsd4c04QO6EA3j7tTSg11IEE+H7bxkGkUvBxbIe/Br3JZ2+XtbiT9a
	U9baYBtt3Q8OLuNbusxNo87yXuZKfoqGeudxiFq1gDiO+wb/DwaGuPL5u2cYZF0SpRI3CFyKTPi
	1XTUK3BckAZr6BxjtCdUYXkwRdvlRuuLGZtc=
X-Received: by 2002:a05:690e:2053:b0:64c:9f31:e33 with SMTP id
 956f58d0204a3-64e630cea71mr10573004d50.65.1773695970067; Mon, 16 Mar 2026
 14:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <189B995EB7159C24.1328210@lists.openembedded.org> <DH4G570ID0LD.1IS5KSPDMXJ5I@ti.com>
In-Reply-To: <DH4G570ID0LD.1IS5KSPDMXJ5I@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Mar 2026 14:19:02 -0700
X-Gm-Features: AaiRm51HBj64tQc87B6w9jf6ZqTMCgUCFfKFA0kmGQ1kWUKrOPkg7Cm8H9BhvWM
Message-ID: <CAMKF1sr6cgf4=FMM6HwZYnotsJXT-3HxmeBuJb-GWX0JWZkebg@mail.gmail.com>
Subject: Re: [oe][meta-xfce][PATCH] xfce4-session: update for emptty
To: Randolph Sapp <rs@ti.com>
Cc: kai.kang@windriver.com, Openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003c4a24064d2ac6ed"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 21:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125291

--0000000000003c4a24064d2ac6ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 12:17=E2=80=AFPM Randolph Sapp <rs@ti.com> wrote:

> On Tue Mar 10, 2026 at 4:51 PM CDT, Randolph Sapp via
> lists.openembedded.org wrote:
> > From: Randolph Sapp <rs@ti.com>
> >
> > The x-session-manager alternative link has been removed. Instead a
> > distro should choose what the default session is by using the
> > DEFAULT_SESSION variable of xserver-nodm-init.
> >
> > If the default session cannot be found the user will be presented with =
a
> > menu to pick the session themselves. This relies on the xsession and
> > wayland-sessions desktop entries, which XFCE already provides.
> >
> > Signed-off-by: Randolph Sapp <rs@ti.com>
> > ---
> >
> > Sending this now that emptty has been picked up on oe-core's master-nex=
t
> branch.
> >
> >  .../recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb      | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/meta-xfce/recipes-xfce/xfce4-session/
> xfce4-session_4.20.3.bb b/meta-xfce/recipes-xfce/xfce4-session/
> xfce4-session_4.20.3.bb
> > index af7ab98ae5..3690078daf 100644
> > --- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb
> > +++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> >
> >  DEPENDS =3D "libwnck3 libsm libxfce4ui libxfce4windowing virtual/libx1=
1"
> >
> > -inherit xfce update-alternatives features_check
> > +inherit xfce features_check
> >
> >  SRC_URI +=3D "file://0001-configure.in-hard-code-path-to-iceauth.patch=
"
> >  SRC_URI[sha256sum] =3D
> "dbf00672c5316a30b7001fe852e6a5ba9f889afeab8a247545a160d4302f1fa2"
> > @@ -19,10 +19,6 @@ PACKAGECONFIG[polkit] =3D "--enable-polkit,
> --disable-polkit, polkit"
> >  EXTRA_OECONF =3D "GDBUS_CODEGEN=3D${STAGING_BINDIR_NATIVE}/gdbus-codeg=
en \
> >
> GLIB_COMPILE_RESOURCES=3D${STAGING_BINDIR_NATIVE}/glib-compile-resources"
> >
> > -ALTERNATIVE:${PN} =3D "x-session-manager"
> > -ALTERNATIVE_TARGET[x-session-manager] =3D "${bindir}/xfce4-session"
> > -ALTERNATIVE_PRIORITY_${PN} =3D "150"
> > -
> >  FILES:${PN} +=3D " \
> >      ${libdir}/xfce4/*/*/*.so \
> >      ${libdir}/xfce4/session/*-*-* \
> > --
> > 2.53.0
>
> The required emptty series was removed from oe-core master-next. Please
> hold off
> on taking this patch for now.
>
>
yep. Dropped from master-next


> Randolph
>

--0000000000003c4a24064d2ac6ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 16,=
 2026 at 12:17=E2=80=AFPM Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com">rs=
@ti.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Tue Mar 10, 2026 at 4:51 PM CDT, Randolph Sapp via <a href=3D"htt=
p://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.open=
embedded.org</a> wrote:<br>
&gt; From: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D"_blank"=
>rs@ti.com</a>&gt;<br>
&gt;<br>
&gt; The x-session-manager alternative link has been removed. Instead a<br>
&gt; distro should choose what the default session is by using the<br>
&gt; DEFAULT_SESSION variable of xserver-nodm-init.<br>
&gt;<br>
&gt; If the default session cannot be found the user will be presented with=
 a<br>
&gt; menu to pick the session themselves. This relies on the xsession and<b=
r>
&gt; wayland-sessions desktop entries, which XFCE already provides.<br>
&gt;<br>
&gt; Signed-off-by: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=
=3D"_blank">rs@ti.com</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Sending this now that emptty has been picked up on oe-core&#39;s maste=
r-next branch.<br>
&gt;<br>
&gt;=C2=A0 .../recipes-xfce/xfce4-session/<a href=3D"http://xfce4-session_4=
.20.3.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-session_4.20.3.bb</a>=
=C2=A0 =C2=A0 =C2=A0 | 6 +-----<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-xfce/recipes-xfce/xfce4-session/<a href=3D"http://xf=
ce4-session_4.20.3.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-session_4=
.20.3.bb</a> b/meta-xfce/recipes-xfce/xfce4-session/<a href=3D"http://xfce4=
-session_4.20.3.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-session_4.20=
.3.bb</a><br>
&gt; index af7ab98ae5..3690078daf 100644<br>
&gt; --- a/meta-xfce/recipes-xfce/xfce4-session/<a href=3D"http://xfce4-ses=
sion_4.20.3.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-session_4.20.3.b=
b</a><br>
&gt; +++ b/meta-xfce/recipes-xfce/xfce4-session/<a href=3D"http://xfce4-ses=
sion_4.20.3.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-session_4.20.3.b=
b</a><br>
&gt; @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee=
4d69f5fce4486a80fdaf4a4263&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;libwnck3 libsm libxfce4ui libxfce4windowing vi=
rtual/libx11&quot;<br>
&gt;<br>
&gt; -inherit xfce update-alternatives features_check<br>
&gt; +inherit xfce features_check<br>
&gt;<br>
&gt;=C2=A0 SRC_URI +=3D &quot;file://0001-configure.in-hard-code-path-to-ic=
eauth.patch&quot;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;dbf00672c5316a30b7001fe852e6a5ba9f8=
89afeab8a247545a160d4302f1fa2&quot;<br>
&gt; @@ -19,10 +19,6 @@ PACKAGECONFIG[polkit] =3D &quot;--enable-polkit, --=
disable-polkit, polkit&quot;<br>
&gt;=C2=A0 EXTRA_OECONF =3D &quot;GDBUS_CODEGEN=3D${STAGING_BINDIR_NATIVE}/=
gdbus-codegen \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GLIB_COM=
PILE_RESOURCES=3D${STAGING_BINDIR_NATIVE}/glib-compile-resources&quot;<br>
&gt;<br>
&gt; -ALTERNATIVE:${PN} =3D &quot;x-session-manager&quot;<br>
&gt; -ALTERNATIVE_TARGET[x-session-manager] =3D &quot;${bindir}/xfce4-sessi=
on&quot;<br>
&gt; -ALTERNATIVE_PRIORITY_${PN} =3D &quot;150&quot;<br>
&gt; -<br>
&gt;=C2=A0 FILES:${PN} +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/xfce4/*/*/*.so \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${libdir}/xfce4/session/*-*-* \<br>
&gt; --<br>
&gt; 2.53.0<br>
<br>
The required emptty series was removed from oe-core master-next. Please hol=
d off<br>
on taking this patch for now.<br>
<br></blockquote><div><br></div><div>yep. Dropped from master-next</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Randolph<br>
</blockquote></div></div>

--0000000000003c4a24064d2ac6ed--

