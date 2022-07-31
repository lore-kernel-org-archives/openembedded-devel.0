Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0FAC00140
	for <webhook@archiver.kernel.org>; Sun, 31 Jul 2022 23:02:43 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.18779.1659308554472542032
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Jul 2022 16:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nEElH/0f;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id l3so7324652qkl.3
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Jul 2022 16:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PwsCXF5ce8moADRAIevBrl3r8kBjh+XVh4f8jcjvI4E=;
        b=nEElH/0flfvqf2vHAPb0qXX9dXjLEPp+SYcL6sDTWgF0+gyxPtuZUzbnbK+xyc1+lt
         NTKTuwINaHF1Z/H985I6VjJGfRCkhBdPpfPSwTWTyeFV0L/JhfoAZ1Tw9LBhtYueW7NJ
         BNpuTma2E4MstKFH2XR+L0grCQ2KcEEA/ezWXszQcVG74PMh1eIsvkY29R3sgTtuUqet
         IsFavS2WeOXQufaWPOGSS2DRF4p0MNvp0s2QJoEpCjM3Oiyfy67QKPVmpQNXt/SlZejD
         Kxp4acvKUNYDrqTQ9FuWcM0nmnc2v2De9bF0cKNTJaYWF1z9SFrgLLGkFum7bQiMFQpt
         0XiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PwsCXF5ce8moADRAIevBrl3r8kBjh+XVh4f8jcjvI4E=;
        b=4buNcfrsxYUWAqKl9yx6712m7eFSIivosP+UXODqAuKO5jNUQcshJf5HwNBZKEg3Bj
         9jIJGxgdZGhIFt+cV1y5QID87VQeHg2v7o2tW6L3kVNzovgaNSrjdPnbC2jfd7DqmshD
         2AVF1YahotyTbCp1dBsjuqRJjfPClQpBF35Mr6/bSH5ZOWfvqHhMZ5GhqjzMp33LVuuF
         O0y+IF7N4D77aUQXgsqOSKD8Zqium26EZbdTRMYfvfauif0KDzsvmeQ8ssbmhOV79fYm
         xOzV5l9vuSJf1FNf4bOVFTUyaocgJ7SU572PpGdhuhJ9nEvcHWZPqytKKgx4cTbedxTS
         Z2pA==
X-Gm-Message-State: AJIora8i4RQUXKQ2Bogb9rDksJdLloRzlhhpf4lWijUAxE3gtD0yyIA+
	k4RUH8hYR47eURt705HzZDkcAE5ZQFddq3r9w78=
X-Google-Smtp-Source: 
 AGRyM1tpYeJFdgXW65yDRrnAx+2dTqXq79CjbbQLiGgJX5mat55z5JreR2NmWUuHiZ42phH1fnm5T7EPV3N/TlWxBfE=
X-Received: by 2002:a05:620a:171f:b0:6b5:fa8e:5dd8 with SMTP id
 az31-20020a05620a171f00b006b5fa8e5dd8mr10116623qkb.149.1659308553397; Sun, 31
 Jul 2022 16:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220730022855.50524-1-vince@underview.tech>
 <8D884F32-A736-495B-B9A0-AB06F11DE265@arm.com>
 <CAPQx_gMv2y3L519Q=+a3ckLdsVfD=QDf-X6c+AUGUYb_Ed0zaw@mail.gmail.com>
 <F4C16675-96FC-493B-8B2A-601C47ADB641@arm.com>
In-Reply-To: <F4C16675-96FC-493B-8B2A-601C47ADB641@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 31 Jul 2022 19:02:22 -0400
Message-ID: 
 <CAMKF1sq6y71ZLLRfG_ey0HOkHCcedBsRNZH1LBKeL_KuwQQMiA@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] vlc: add virtual/vlc alias
To: Ross Burton <ross.burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
	"vince@underview.tech" <vince@underview.tech>
Content-Type: multipart/alternative; boundary="000000000000e5e8c805e521e00e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Jul 2022 23:02:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98068

--000000000000e5e8c805e521e00e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 31, 2022 at 3:18 PM Ross Burton <ross.burton@arm.com> wrote:

>
> > On 30 Jul 2022, at 22:24, Vincent Davis Jr via lists.openembedded.org
> <vince=3Dunderview.tech@lists.openembedded.org> wrote:
> >
> > Hey again Ross sorry I know I already sent this meant to hit reply all.
> >
> > Meant to say for layers that contain recipes that clone different
> implementations of VLC and want to allow the ability to select an
> implementation. Would be nice to have PROVIDES =3D "virtual/vlc" here ver=
sus
> multiple different layers providing bbappend files that add the PROVIDES
> variable.
> >
> > Working in PR were we want to allow either upstream implementation of
> VLC or raspberry pi distro implementation.
> >
> > https://github.com/agherzan/meta-raspberrypi/pull/985
>
> I still don=E2=80=99t see the need: meta-raspberrypi=E2=80=99s vlc-rpi ca=
n PROVIDE vlc and
> set PREFERRED_PROVIDER.
>

Right I think calling recipe something like Vic-raspberrypi.bb and using
PREFERRED_PROVIDER is a good idea. This will let distros make the choice as
they see fit


> Ross
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98067):
> https://lists.openembedded.org/g/openembedded-devel/message/98067
> Mute This Topic: https://lists.openembedded.org/mt/92704766/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e5e8c805e521e00e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jul 31, 2022 at 3:18 PM Ross Burton &lt;<a href=3D"=
mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><br>
&gt; On 30 Jul 2022, at 22:24, Vincent Davis Jr via <a href=3D"http://lists=
.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.=
org</a> &lt;vince=3D<a href=3D"mailto:underview.tech@lists.openembedded.org=
" target=3D"_blank">underview.tech@lists.openembedded.org</a>&gt; wrote:<br=
>
&gt; <br>
&gt; Hey again Ross sorry I know I already sent this meant to hit reply all=
.<br>
&gt; <br>
&gt; Meant to say for layers that contain recipes that clone different impl=
ementations of VLC and want to allow the ability to select an implementatio=
n. Would be nice to have PROVIDES =3D &quot;virtual/vlc&quot; here versus m=
ultiple different layers providing bbappend files that add the PROVIDES var=
iable.<br>
&gt; <br>
&gt; Working in PR were we want to allow either upstream implementation of =
VLC or raspberry pi distro implementation.<br>
&gt; <br>
&gt; <a href=3D"https://github.com/agherzan/meta-raspberrypi/pull/985" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/agherzan/meta-raspberr=
ypi/pull/985</a><br>
<br>
I still don=E2=80=99t see the need: meta-raspberrypi=E2=80=99s vlc-rpi can =
PROVIDE vlc and set PREFERRED_PROVIDER.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Right I think ca=
lling recipe something like Vic-raspberrypi.bb and using PREFERRED_PROVIDER=
 is a=C2=A0good idea. This will let distros make the choice as they see fit=
=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Ross<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#98067): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/98067" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/98067</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92704766/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92704766/1997914</a><br>
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

--000000000000e5e8c805e521e00e--

