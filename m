Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29139C77B7D
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 18:10:05 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.2713.1684433400242250550
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 May 2023 11:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rd0NhG4j;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f435658d23so23001905e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 11:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684433398; x=1687025398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P7RslYgdeF2eKnco4/1lJ5rOde9kkHGI0xIRC7gKoEU=;
        b=rd0NhG4jSDuI1Zw90bRJCnud9nq+okymtavTjMncsiGtsHXHEBopL/QoXVCD9r10/V
         RCMnajTGcvsmnp5FhAmakD8+p6/RDQM4Go3FPPQqkrHMBhDQifaQhkwd+GtbgQ77c/zQ
         4E+dOabnG9Yb8YDkd+Kj8f6AhcuzR5Gm2IEFmCBuJ00rgTYInS6GLSFSpQ2E+0eDhFfC
         afjJ1kHZ5ThDoWJubmAgx5BMrogH/iSCyjEI0esEVyRxSqJxRl/DC6cTx0ifbItzNtVC
         XKt1Ouk2SwHcO5lBoq4wCuNUfhJnR18++6Ty7hDAfD35L8x8/VpJ1Dg4PGc8iOLI61L6
         KXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684433398; x=1687025398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7RslYgdeF2eKnco4/1lJ5rOde9kkHGI0xIRC7gKoEU=;
        b=A3MAbGSIYWP2uN5vBklZWB+YA/mbSNRkFwHeGuXn7j+EeMmZ5h0xMKw9uRNIBo+nFw
         LJuhO4v7D3cSJ/jbOl/ytsQijs4sp8Z7iHiNNLfE/sA2XIU70kKw3/VbIqsalvN8U35Y
         Tq0mJt+l9etrlQRycsyrVcwKGy3szByE/rd/jDamQ23tv0sjf/tdi5LWMGu4N94dCPss
         MJPPnk+FNbNWroHTuDsIPRHUXrayNKPCOtfHsgi6RqOj5NHB7UvRWeBdCfTWWqA8x4t8
         nTc92S7jwcH6q1l8jBeLR/+TBnHL01GWi9i3LB7Ne30B+ROgkoXdYDVAEkXrD1hDEyN1
         ACjQ==
X-Gm-Message-State: AC+VfDxw+GTTvaGkyED2W1tEDFgjzM0q4fCromjL4X0A7O+1peCiGpHG
	O0lgQKFNp9T004fLYThEuOwnXjUKSiC/BoL7ppc=
X-Google-Smtp-Source: ACHHUZ49p7JrWfIVmO+z5jfhmtSnfkUB91eL/CAlrzkiXnrhSqa33Ww3HIm/tz4Ip1D8yI3YQwhOV3TDIGlOcdoQkxo=
X-Received: by 2002:a7b:c5cd:0:b0:3f1:789d:ad32 with SMTP id
 n13-20020a7bc5cd000000b003f1789dad32mr2530192wmk.11.1684433398256; Thu, 18
 May 2023 11:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230518101233.3885135-1-Martin.Jansa@gmail.com> <CAMKF1sprnCmnaNkFtrg0h3ek-b=42sXf0Z=qSCCdzLG9+uu3Cg@mail.gmail.com>
In-Reply-To: <CAMKF1sprnCmnaNkFtrg0h3ek-b=42sXf0Z=qSCCdzLG9+uu3Cg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 18 May 2023 20:09:45 +0200
Message-ID: <CA+chaQfmXq4HPemB2dQboQvjQ7Ms5JpUGDdij=s3EZ0+UwX6AA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] networkmanager: enable vala only with GI_DATA_ENABLED
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000059d77605fbfbb63b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 18:10:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102660

--00000000000059d77605fbfbb63b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The vala inherit is conditional on vala PACKAGECONFIG, so it seems to work
fine.

On Thu, May 18, 2023 at 7:58=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> On Thu, May 18, 2023 at 3:12=E2=80=AFAM Martin Jansa <Martin.Jansa@gmail.=
com>
> wrote:
> >
> > * cannot be enabled without:
> >   http://errors.yoctoproject.org/Errors/Details/704353/
> >   NetworkManager-1.42.6/meson.build:816:4: ERROR: Assert failed: vala
> api require GObject introspection. Use -Dvapi=3Dfalse to disable it
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../networkmanager/networkmanager_1.42.6.bb                    | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.42.6.bb
> b/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.42.6.bb
> > index 31687a30b9..2412775cf1 100644
> > --- a/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.42.6.bb
> > +++ b/meta-networking/recipes-connectivity/networkmanager/
> networkmanager_1.42.6.bb
> > @@ -70,11 +70,12 @@ do_compile:prepend() {
> >      export
> GI_TYPELIB_PATH=3D"${B}}/src/libnm-client-impl${GI_TYPELIB_PATH:+:$GI_TYP=
ELIB_PATH}"
> >  }
> >
> > -PACKAGECONFIG ??=3D "readline nss ifupdown dnsmasq nmcli vala \
> > +PACKAGECONFIG ??=3D "readline nss ifupdown dnsmasq nmcli \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
> bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '',
> d)} \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'wifi polkit', d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit'=
,
> '', d)} \
> > +    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vala', '', d)} \
> >  "
>
> I think vala support should be added via inheriting vala class. The
> problem is still there when GI_DATA_ENABLED
> is True.
>
> >
> >  inherit ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}
> > --
> > 2.40.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#102657):
> https://lists.openembedded.org/g/openembedded-devel/message/102657
> > Mute This Topic: https://lists.openembedded.org/mt/98988017/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000059d77605fbfbb63b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The vala inherit is conditional on vala PACKAGECONFIG, so =
it seems to work fine.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Thu, May 18, 2023 at 7:58=E2=80=AFPM Khem Raj &lt;=
<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, May 18, 202=
3 at 3:12=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; * cannot be enabled without:<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://errors.yoctoproject.org/Errors/Details/7=
04353/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org=
/Errors/Details/704353/</a><br>
&gt;=C2=A0 =C2=A0NetworkManager-1.42.6/meson.build:816:4: ERROR: Assert fai=
led: vala api require GObject introspection. Use -Dvapi=3Dfalse to disable =
it<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../networkmanager/<a href=3D"http://networkmanager_1.42.6.bb" r=
el=3D"noreferrer" target=3D"_blank">networkmanager_1.42.6.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-connectivity/networkmanager/<a hr=
ef=3D"http://networkmanager_1.42.6.bb" rel=3D"noreferrer" target=3D"_blank"=
>networkmanager_1.42.6.bb</a> b/meta-networking/recipes-connectivity/networ=
kmanager/<a href=3D"http://networkmanager_1.42.6.bb" rel=3D"noreferrer" tar=
get=3D"_blank">networkmanager_1.42.6.bb</a><br>
&gt; index 31687a30b9..2412775cf1 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/networkmanager/<a href=3D"h=
ttp://networkmanager_1.42.6.bb" rel=3D"noreferrer" target=3D"_blank">networ=
kmanager_1.42.6.bb</a><br>
&gt; +++ b/meta-networking/recipes-connectivity/networkmanager/<a href=3D"h=
ttp://networkmanager_1.42.6.bb" rel=3D"noreferrer" target=3D"_blank">networ=
kmanager_1.42.6.bb</a><br>
&gt; @@ -70,11 +70,12 @@ do_compile:prepend() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 export GI_TYPELIB_PATH=3D&quot;${B}}/src/libnm-cli=
ent-impl${GI_TYPELIB_PATH:+:$GI_TYPELIB_PATH}&quot;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -PACKAGECONFIG ??=3D &quot;readline nss ifupdown dnsmasq nmcli vala \<=
br>
&gt; +PACKAGECONFIG ??=3D &quot;readline nss ifupdown dnsmasq nmcli \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;systemd&#39;, &#39;systemd&#39;, bb.utils.contains(&#39;DISTRO_FEATURES&=
#39;, &#39;x11&#39;, &#39;consolekit&#39;, &#39;&#39;, d), d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;bluetooth&#39;, &#39;bluez5&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39=
;wifi polkit&#39;, d)} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;selinux&#39;, &#39;selinux audit&#39;, &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;GI_DATA_ENABLED&#39;, &#39;Tr=
ue&#39;, &#39;vala&#39;, &#39;&#39;, d)} \<br>
&gt;=C2=A0 &quot;<br>
<br>
I think vala support should be added via inheriting vala class. The<br>
problem is still there when GI_DATA_ENABLED<br>
is True.<br>
<br>
&gt;<br>
&gt;=C2=A0 inherit ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;vala&=
#39;, &#39;vala&#39;, &#39;&#39;, d)}<br>
&gt; --<br>
&gt; 2.40.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#102657): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/102657" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/102657</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98988017=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/98988017/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000059d77605fbfbb63b--

