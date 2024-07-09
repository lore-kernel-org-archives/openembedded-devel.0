Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BB8C3271E
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 02:20:26 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web11.3884.1720491621381976345
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jul 2024 19:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=apUZ+IZO;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7036f1f3434so773531a34.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jul 2024 19:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720491620; x=1721096420; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p9e2R8XRfrKqn1yjPY6tDgv/VwFgNzuS+a5oeT569ac=;
        b=apUZ+IZOL1F2Yp+ZL/DEbA6zBoinKbPCuXZ9g4oimO/fumAH4sQOHn/UpoVQgExLD4
         hpcRgRcNZpe5aW6Vz3C6JShmUlCppZ4nYYxxyiv2nLgc9j9+umVq3J2ORn2x3eRPdI4p
         yCtB7C5tr8kZPJseaJcdiZPvNKBbPLi2fUPeAuRMG6V0mGp82td1lmnV2H6/K7bSOLpg
         WOl0wl5HKhWxrdVwuBdNu1GlQ8fODaJSm7yr3iSXPoKE4jYAW2q2JU7IQ9Rzhn6wvmKt
         JO3rAAboFFKl0R+WliTGImijOLMyFKtyMfbB9cvwNkO5x/weg/TzFliZ2kufetrzAiJO
         d0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720491620; x=1721096420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9e2R8XRfrKqn1yjPY6tDgv/VwFgNzuS+a5oeT569ac=;
        b=qIxd2ny5RtwKZ+q6eQfeve+dX8Deo0UqRb98+WaXf2FPz0hZW62pUp6MyNlVgbJ7ug
         RG9AW23dK/ItdZ3oZeKPI92Y2no8x4qEIFd5gdQZSmkX6bn6m8Qp2S8XBzeFDZpCXo9v
         NyfUM1mXW3IrM6DeViuXA1YXxFyLCWC9vkRgiYOx4WiO39jCcSgATLS0lwFuhmySow6c
         eleO4si1oTNQhJHZVq8yY9GLSgSBnkxNabzjdYF9sLFki/xfe4pbaPCphLQbGIUSgaWT
         ldowLIYJ6+s2vPd07f0rsXDFzZzXuQUc/eH89+9N1Fh5nbo12IiVEEUt1gBfudHIY322
         PTMQ==
X-Gm-Message-State: AOJu0Yw5YhHt+gmp09n7mDdVXyNPLu+CxtlMeAOOIGIabfGlfIIA9vC9
	WuDcpPTm1PlHjn1TRHNKY9r2iTpCLIMT9g2Nxo6ERwP5KW5uk3frgRf3BVPzMCZr9VLcahlw70/
	ZJbYu3Pxi0l7Uy+/wROR2ijSzuLw=
X-Google-Smtp-Source: AGHT+IEHkjqtIu3W0lG6aB/ILKrpJEpHvq3tpm7be2ZGY278sfGdu9ILiLgkhW7Mfl4SKy7qSyS1YSIPAEaRqR1svks=
X-Received: by 2002:a05:6870:b52c:b0:24c:ac25:a107 with SMTP id
 586e51a60fabf-25eaec8dde1mr1121766fac.57.1720491620326; Mon, 08 Jul 2024
 19:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240709004123.1330033-1-jpuhlman@mvista.com> <CAMKF1srskTrmMq84r=Cb60yZnBkbDu_hL7eWc8CnHVqF1Vvcuw@mail.gmail.com>
 <ac4cf2fb-f54d-4c75-83dc-e0bc7619ec6b@mvista.com>
In-Reply-To: <ac4cf2fb-f54d-4c75-83dc-e0bc7619ec6b@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Jul 2024 19:20:08 -0700
Message-ID: <CAMKF1spUGyrDXNmOgYJy3Q44+RwJgk1OGr36jJUoEpPJm81URg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] net-snmp: Set ps flag value since
 it checks the host
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000de6177061cc72ba4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jul 2024 02:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111274

--000000000000de6177061cc72ba4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jeremy

So it seems only needed during build it seems ?

On Mon, Jul 8, 2024 at 6:47=E2=80=AFPM Jeremy Puhlman <jpuhlman@mvista.com>=
 wrote:

>
>
> On 7/8/2024 6:00 PM, Khem Raj wrote:
> > On Mon, Jul 8, 2024 at 5:41=E2=80=AFPM Jeremy Puhlman via
> > lists.openembedded.org <jpuhlman=3Dmvista.com@lists.openembedded.org>
> > wrote:
> >> From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
> >>
> >> The value the configure script uses is picked up
> >> from the host machine ps, and there are cases when
> >> the flag selection can be different. Which would
> >> break reproducablity between builds on different
> >> machines.
> >>
> >> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> >> ---
> >>   meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta-networking/recipes-protocols/net-snmp/
> net-snmp_5.9.4.bb b/meta-networking/recipes-protocols/net-snmp/
> net-snmp_5.9.4.bb
> >> index 75b3d9e8c..989ec5413 100644
> >> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> >> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.4.bb
> >> @@ -73,6 +73,7 @@ CACHED_CONFIGUREVARS =3D " \
> >>       lt_cv_shlibpath_overrides_runpath=3Dyes \
> >>       ac_cv_path_UNAMEPROG=3D${base_bindir}/uname \
> >>       ac_cv_path_PSPROG=3D${base_bindir}/ps \
> >> +    ac_cv_ps_flags=3D"-e" \
> > While this change seems ok, I wonder if then we also need to ensure
> > that procps provided ps utility is rdepend'ed upon too.
> All the usage there is to see if snmpd is actually running. Any value
> that works for all of them would be reasonable. I thought the
> assumption was that busybox was always on the system and busybox ps
> accepts -e with an output that should work. Probably
> don't need the rdepend, If base busybox is still assumed.
>
> >>       ac_cv_file__etc_printcap=3Dno \
> >>       NETSNMP_CONFIGURE_OPTIONS=3D \
> >>   "
> >> --
> >> 2.35.7
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#111270):
> https://lists.openembedded.org/g/openembedded-devel/message/111270
> >> Mute This Topic: https://lists.openembedded.org/mt/107114904/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub
> [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
> --
> Jeremy Puhlman
> jpuhlman@mvista.com
>
>

--000000000000de6177061cc72ba4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Jeremy</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">So it seems only needed during build it seems ?</div><div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 8, 2024=
 at 6:47=E2=80=AFPM Jeremy Puhlman &lt;<a href=3D"mailto:jpuhlman@mvista.co=
m">jpuhlman@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><br>
<br>
On 7/8/2024 6:00 PM, Khem Raj wrote:<br>
&gt; On Mon, Jul 8, 2024 at 5:41=E2=80=AFPM Jeremy Puhlman via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;jpuhlman=3D<a href=3D"mailto:mvista=
.com@lists.openembedded.org" target=3D"_blank">mvista.com@lists.openembedde=
d.org</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt; From: &quot;Jeremy A. Puhlman&quot; &lt;<a href=3D"mailto:jpuhlman=
@mvista.com" target=3D"_blank">jpuhlman@mvista.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; The value the configure script uses is picked up<br>
&gt;&gt; from the host machine ps, and there are cases when<br>
&gt;&gt; the flag selection can be different. Which would<br>
&gt;&gt; break reproducablity between builds on different<br>
&gt;&gt; machines.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Jeremy A. Puhlman &lt;<a href=3D"mailto:jpuhlman@mv=
ista.com" target=3D"_blank">jpuhlman@mvista.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta-networking/recipes-protocols/net-snmp/<a href=3D"=
http://net-snmp_5.9.4.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9=
.4.bb</a> | 1 +<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-networking/recipes-protocols/net-snmp/<a href=3D=
"http://net-snmp_5.9.4.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.=
9.4.bb</a> b/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://n=
et-snmp_5.9.4.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.4.bb</a=
><br>
&gt;&gt; index 75b3d9e8c..989ec5413 100644<br>
&gt;&gt; --- a/meta-networking/recipes-protocols/net-snmp/<a href=3D"http:/=
/net-snmp_5.9.4.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.4.bb<=
/a><br>
&gt;&gt; +++ b/meta-networking/recipes-protocols/net-snmp/<a href=3D"http:/=
/net-snmp_5.9.4.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.4.bb<=
/a><br>
&gt;&gt; @@ -73,6 +73,7 @@ CACHED_CONFIGUREVARS =3D &quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lt_cv_shlibpath_overrides_runpath=3Dyes =
\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ac_cv_path_UNAMEPROG=3D${base_bindir}/un=
ame \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ac_cv_path_PSPROG=3D${base_bindir}/ps \<=
br>
&gt;&gt; +=C2=A0 =C2=A0 ac_cv_ps_flags=3D&quot;-e&quot; \<br>
&gt; While this change seems ok, I wonder if then we also need to ensure<br=
>
&gt; that procps provided ps utility is rdepend&#39;ed upon too.<br>
All the usage there is to see if snmpd is actually running. Any value <br>
that works for all of them would be reasonable. I thought the<br>
assumption was that busybox was always on the system and busybox ps <br>
accepts -e with an output that should work. Probably<br>
don&#39;t need the rdepend, If base busybox is still assumed.<br>
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ac_cv_file__etc_printcap=3Dno \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0NETSNMP_CONFIGURE_OPTIONS=3D \<br>
&gt;&gt;=C2=A0 =C2=A0&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.35.7<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#111270): <a href=3D"https://lists.openembedded=
.org/g/openembedded-devel/message/111270" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-devel/message/111270</a><=
br>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1071=
14904/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/107114904/1997914</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedd=
ed.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
<br>
-- <br>
Jeremy Puhlman<br>
<a href=3D"mailto:jpuhlman@mvista.com" target=3D"_blank">jpuhlman@mvista.co=
m</a><br>
<br>
</blockquote></div></div>

--000000000000de6177061cc72ba4--

