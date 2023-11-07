Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E794C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 13:22:14 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.10162.1699363324743967841
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 05:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B5ZV4mmw;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-32dc9ff4a8fso3226461f8f.1;
        Tue, 07 Nov 2023 05:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699363323; x=1699968123; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OZH9vnLqnurt59O4jAmmqNqVkPwFh5x84SPgYhcXLPg=;
        b=B5ZV4mmwvSraa9b94Y9a71BasCoMFm4LRhynwVuEMZXeS4Kkb4mJ33WiKNiH4rDQSa
         4sdBb4mvtg/GXOjI4g9CAXNg3m5A8nHXwsl+TfV4K1EXGqogUejSOiV/SoA9UIiUzjDI
         0UbXZbjda/yHhv5jILXpOkyYMdp6r7dj3uJFP6d2qjlR7vAnkzLa3/lvusD3kQelV37r
         s3wD7CT5bgJLJ0hfi9EfZrR1x88djlYwb8PYDkxybv/0I+ubID3oJliwsbsIIPIR0z0g
         A9fykQKBGOC1Q3gsh2kVyFiphoO3ZSUg23aIz1UGuGvOtwCdWILMcQhLje+qM19t7YcH
         LcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699363323; x=1699968123;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OZH9vnLqnurt59O4jAmmqNqVkPwFh5x84SPgYhcXLPg=;
        b=T/DQK4S+076gDuo7/ngNsY/QTb0ay6erpC+RiAIx2s0k5Mt+TywWJ8sX2Sx4rDxEP4
         x/DVqYV3o+iONFoq2sYszP/zOkaeT8QgrfvNhVG6g3fIS472MCMuhqBRgZEqf8pDkJ7C
         pDIg+r2PTMyKSVjQikIlppebcyZJFbOUSiKvnOuGNaVemlYZU1k40DLSYG5jKxaFa6fF
         eZxZMGWvsH0DH1MWXSYNANXLb2pwLJ4NEJfccBdCU42t9PTfVSt5qat/ezXN71J6kONE
         LqD0bqf1kv6LHEmVmgBMjqPWZRP/zSMogTxHCDqRRgJ/0LuWcJR7D0J/J/U1XW7w6jbR
         mtzw==
X-Gm-Message-State: AOJu0YwGM6ie11MOoPPk7Zx1gr2bkodfQQr5dzCbWgbv2xo4XrKO2VIa
	NmLA3yPDlYOc5oZgOIqntj0TyVN9JWzJtnuhxEE=
X-Google-Smtp-Source: AGHT+IEtLututp0fLwHajfCXnS5ulOY6KDea7amgzbQaK27Ca/61lQr5Ft15mxa07YkNCRQJf6JsQmwcxrQIPU+Hfw4=
X-Received: by 2002:a5d:5914:0:b0:32d:a49c:dfd1 with SMTP id
 v20-20020a5d5914000000b0032da49cdfd1mr20509134wrd.48.1699363322908; Tue, 07
 Nov 2023 05:22:02 -0800 (PST)
MIME-Version: 1.0
References: <AS4P251MB101352FEDFB9A83CA5454B3EDCA9A@AS4P251MB1013.EURP251.PROD.OUTLOOK.COM>
 <777c8b7f489738074b22dbd87c1906552342af6c.camel@linuxfoundation.org>
In-Reply-To: <777c8b7f489738074b22dbd87c1906552342af6c.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 7 Nov 2023 14:21:50 +0100
Message-ID: <CA+chaQeeddjYY1XCoQsnf79uR-c_o-UL7Ry37di+yHmnSxO=kg@mail.gmail.com>
Subject: Re: [oe] [RFC] Support for alternative init systems
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: ANQUETIN Mathieu <mathieu.anquetin@groupe-cahors.com>, 
	"openembedded-architecture@lists.openembedded.org" <openembedded-architecture@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000034d5a806098fdbbd"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 13:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106453

--00000000000034d5a806098fdbbd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I would also remind that we used to have separate PN-systemd packages when
systemd support was in meta-systemd layer:
https://git.openembedded.org/meta-openembedded/log/meta-systemd

This was later replaced with init scripts being usually in main PN and
sysvinit and systemd in DISTRO_FEATURES controlling which init systems your
DISTRO supports. So I guess to build images with only openrc script and no
sysvinit nor systemd, you should start by removing these DISTRO_FEATURES
and possibly providing patches where recipes still install either of them
(not respecting DISTRO_FEATURES).

Regards,

On Tue, Nov 7, 2023 at 2:15=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2023-11-07 at 09:30 +0000, ANQUETIN Mathieu wrote:
> > Hello all,
> >
> > I would like to discuss an architecture solution to ease support for
> > alternative init systems.
> >
> > As of now, OpenEmbedded supports sysvinit and systemd as first-class
> > citizens but does so by including required files in the main package
> > based on the value of the VIRTUAL-RUNTIME_init-manager variable. This
> > forces layers, like meta-openrc for example, to remove files
> > generated by other layers before providing their own. This increases
> > the maintenance burden for layer maintainers of these alternative
> > init systems while making them always feel like second-class
> > citizens.
> >
> > My solution would be to generate specific packages for each init
> > system (${PN}-sysvinit, ${PN}-systemd, ...) and RDEPENDS on them
> > given the value of the VIRTUAL-RUNTIME_init-manager variable. This
> > would simplify recipes because filtering files would no longer be
> > required since all packages would be generated and other layers would
> > simply provide their ${PN}-altinit package through bbappends.
> > I have made a PoC on the 'kirkstone' branch but this kind of
> > modification requires all recipes to adapt to the new architecture
> > and therefore I would like to know if you would accept such
> > modifications.
>
> I'd note that both systemd and sysvinit end up with code which does
> manipulate the generated packages depending on which is enabled.
> Packages can be generated for systemd only which would result in the
> packages not containing sysvinit scripts.
>
> As such, ${PN}-sysvinit and ${PN}-systemd would never exist together
> since you have to choose an init system and the ability to swap between
> them is limited.
>
> I'd note that you can have init scripts for multiple packages within a
> given recipe. I'd also note that packages sometimes aren't actually
> useful without their init script.
>
> Also, the packages wouldn't be that useful since if you change
> VIRTUAL-RUNTIME_init-manager, all the packages are going to end up
> being rebuilt anyway.
>
> As such, I think the proposed solution would need a lot more careful
> thought and detail before we'd be able to say whether it would make
> sense.
>
> Cheers,
>
> Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106452):
> https://lists.openembedded.org/g/openembedded-devel/message/106452
> Mute This Topic: https://lists.openembedded.org/mt/102439770/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000034d5a806098fdbbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I would also remind that we used to have separate PN-syste=
md packages when systemd support was in meta-systemd layer:<div><a href=3D"=
https://git.openembedded.org/meta-openembedded/log/meta-systemd">https://gi=
t.openembedded.org/meta-openembedded/log/meta-systemd</a><br></div><div><br=
></div><div>This was later replaced with init scripts being usually in main=
 PN and sysvinit and systemd in DISTRO_FEATURES controlling which init syst=
ems your DISTRO supports. So I guess to build images with only openrc scrip=
t and no sysvinit nor systemd, you should start by removing these DISTRO_FE=
ATURES and possibly providing patches where recipes still install either of=
 them (not respecting DISTRO_FEATURES).</div><div><br></div><div>Regards,</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Tue, Nov 7, 2023 at 2:15=E2=80=AFPM Richard Purdie &lt;<a href=3D"ma=
ilto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Tue, 2023-11-07 at 09:30 +0000, ANQUETIN Mathieu wrote:<br>
&gt; Hello all,<br>
&gt; <br>
&gt; I would like to discuss an architecture solution to ease support for<b=
r>
&gt; alternative init systems.<br>
&gt; <br>
&gt; As of now, OpenEmbedded supports sysvinit and systemd as first-class<b=
r>
&gt; citizens but does so by including required files in the main package<b=
r>
&gt; based on the value of the VIRTUAL-RUNTIME_init-manager variable. This<=
br>
&gt; forces layers, like meta-openrc for example, to remove files<br>
&gt; generated by other layers before providing their own. This increases<b=
r>
&gt; the maintenance burden for layer maintainers of these alternative<br>
&gt; init systems while making them always feel like second-class<br>
&gt; citizens.<br>
&gt; <br>
&gt; My solution would be to generate specific packages for each init<br>
&gt; system (${PN}-sysvinit, ${PN}-systemd, ...) and RDEPENDS on them<br>
&gt; given the value of the VIRTUAL-RUNTIME_init-manager variable. This<br>
&gt; would simplify recipes because filtering files would no longer be<br>
&gt; required since all packages would be generated and other layers would<=
br>
&gt; simply provide their ${PN}-altinit package through bbappends.<br>
&gt; I have made a PoC on the &#39;kirkstone&#39; branch but this kind of<b=
r>
&gt; modification requires all recipes to adapt to the new architecture<br>
&gt; and therefore I would like to know if you would accept such<br>
&gt; modifications.<br>
<br>
I&#39;d note that both systemd and sysvinit end up with code which does<br>
manipulate the generated packages depending on which is enabled.<br>
Packages can be generated for systemd only which would result in the<br>
packages not containing sysvinit scripts.<br>
<br>
As such, ${PN}-sysvinit and ${PN}-systemd would never exist together<br>
since you have to choose an init system and the ability to swap between<br>
them is limited.<br>
<br>
I&#39;d note that you can have init scripts for multiple packages within a<=
br>
given recipe. I&#39;d also note that packages sometimes aren&#39;t actually=
<br>
useful without their init script.<br>
<br>
Also, the packages wouldn&#39;t be that useful since if you change <br>
VIRTUAL-RUNTIME_init-manager, all the packages are going to end up<br>
being rebuilt anyway.<br>
<br>
As such, I think the proposed solution would need a lot more careful<br>
thought and detail before we&#39;d be able to say whether it would make<br>
sense.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#106452): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/106452" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/106452</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102439770/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102439770/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000034d5a806098fdbbd--

