Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028C6C5CFEB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 13:57:23 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19789.1786629435510581521
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 06:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a6nB/4eK;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8111c0c7561so24886257b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 06:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786629434; cv=none;
        d=google.com; s=arc-20260327;
        b=frVJtdgp9PVrqqYA698RB/Qy3Edq1DxROA8bBIGsJQ9Ip03iGM+9wKwv5j4rBmabgQ
         lS7vSs88A1wnAngCD2xn3RN0/xUon/kDWFhzJqi2pT4YmIQF1alMvzG6exGW7jr3i61x
         CbROnvjrkc0tVa02AmdipkOmgxclKhCUm9u+kUe7EfeWum4vTfYFO4nP+jzMVHjuwuMZ
         3ySugscEAAiKXrovcenkKchypBizJ4mda5AUB/YUbmthqN4bhKLljJgyVim996DPaWNv
         i1GzRldrbM84Mfa4yLRSJDJ5+L4d0lbYbSSnAiTPcsK35Dvb2UiTs4E3a+2tbsPaRNKf
         juOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8wT0B10qcOMQZ7E+ACUJyYVS2y81tpWXUVuKxChus5Y=;
        fh=Ob7CXPPKhPpq9HG5k6uo2txlkIdlvlC4WFdsx/zQctE=;
        b=Ve10nS3EjrRAV7g+8jrkrWk5d90LAvVLzF4JlR2khDqr3Zig6EVDXOX+0cuu3XodPG
         Y+AsDV7SXzMZIkETg5ISBzKVEOTEnZ+p3GzF3y7Bc92vc5OK4fvzzCK8Im4RHHDsa6oT
         7m7/lYP12TphoqCYQmqxFvPLoEyG26A3+oeQrrgwWrENoMp7XQGLF9X80DxFGUyvjk80
         /InyV9+oyb7tMD1tIusWIt2YTdcvQeDOX+haU8ZEjZbIbpvKjxH/uLSXQHFGNLg1rjV7
         Vi5sDlLmirh5C3Z0igVNU0p3tNgMnURcJl7lmHa/6rMOdC6ph5d4UHTXRv9lZk5+aTHn
         DNyQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786629434; x=1787234234; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wT0B10qcOMQZ7E+ACUJyYVS2y81tpWXUVuKxChus5Y=;
        b=a6nB/4eK1soz3kVu1WP/0hxvNwjuh5y4ngF+w1iJHXQLCUfzHFapjcZNCTQLmAVuXZ
         OdP+//rhGmpK7grKcmtLVRm7iba2D07umGmaJTjRgikpWEwxWY5Paqe6tKro9xVNhBX8
         gqO7htsNjUNeSE/qK5H1XdhKJYqQjtcBL4e7HFNnhjr48pJC8097+nI6huKnTLb3hsgA
         8ra0TWwyBJtvGMZ8Lr984s9yg74YFgUDvWgQb2DiDfvJXQHHEfIWzMwnOpngXSDpKIGF
         r7bS0SEA6DlkxWMzXo0NnZt8vBhu6PORldBTq3RoEQwGRimrsUBBNfmFPHbMpC6HsF/L
         E4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629434; x=1787234234;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8wT0B10qcOMQZ7E+ACUJyYVS2y81tpWXUVuKxChus5Y=;
        b=pTq9stUo9S2U+fPDOq2lWF9p7BvV/9Ab9dJ2ZIP8w7IsiL5s1hJwTgsxf0jd+5mBe5
         iD2huAWt6P4FO/PtK6HG/9ehetrGc95bLP/1DiHAU/DDsj1WkvolHyC+WJ7TM881znM/
         6iy0h/Ig4K+/L0mlIVlh2vzTZwC2PvZegyC3bid06nBUOIBg0WVlCiTfnI/ZTaT9zZD/
         YmwVI5kMS7tWVitcPW+OBnky6/CE+dUer63uuZf6kVxk1pzf6JJ9bXC9C/5E+vNwM/Kg
         YU9Jh3ixVAsmpzdYpqj2BQoqnCKxBILoBYKWHz9zeTZU+x23vsIw8fvvhgFl51Az204q
         sKyQ==
X-Gm-Message-State: AOJu0Yz8Qa80LS73LisukxQ3lzcgAmRWtASrz9saCYnTyjy0/KWEqjIN
	IEVEjxue5OSQCsYQt4K69qSWfLbsa68rqYTWjfiVhMy1Gfregneaoz/Oyj3xcU6OyQBe0STrUoL
	2rn67a603TPcIIobeDTcnJDcfDeALSQqMH1n/bY4=
X-Gm-Gg: AR+sD11qrEwqqURdhzIg5MVjFkW6ngCMWb0jN+Ir7rgW2a5bLeikkxVLI/vWERytUKA
	SP6OsvYFZfKB6CydqLbMzDy7z1Y8lV3zLvi1/2DAxsRqsF7LBZNj6t5lr8FV7Ijwh2SqftSnlTx
	uDpTdewWvg63V7WwKkUHOAbun8xVdU7SAFVp4hhE3bW3V/i7AK1us1QOcR9zfULN/DG5qlFJ0RX
	xPJA4WHeigrB/lhnpfsdzzQ4VAcR6SgCEtbr83Tr4ltvJAPuDz9CCfUUb3tc9b8CQk3Y6p4R5ck
	411ZIAMupGak/zjGBwmy5faH6rZTwbv17A+qgwsnUg9+C3bbt4n0SF9psdGXKE/SeOOToMj6Kzs
	CqinHrz8xhZN6Md2eZ20qi9ONCRM3EwfhlG8EK9QrdR6LVkoJlAB0E/XzMeWukylopxYz3EdHd1
	eDtgtZoE4dA47keG3aSS/uxyy45En63hR9XSh318lEaSjOan6zsbVb+MS9o3r+woKG9wDzTcwtU
	L6VTjbu/G0fhw==
X-Received: by 2002:a05:690c:19:b0:809:fd83:a88b with SMTP id
 00721157ae682-83470a756d1mr26450037b3.3.1786629434436; Thu, 13 Aug 2026
 06:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260811072523.3463118-1-james@codeconstruct.com.au> <20260811072523.3463118-2-james@codeconstruct.com.au>
In-Reply-To: <20260811072523.3463118-2-james@codeconstruct.com.au>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Aug 2026 06:56:47 -0700
X-Gm-Features: AUfX_mxt0BuBee6cEtrlD2_tY-h3824aBwZOACAuJF0JpasWtSt1XTIrB7qbREc
Message-ID: <CAMKF1spFhNG6n64S8YmpifH3c3EnPRVCkGORZ1dyWdaXS9m4+g@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH v2 2/2] mctp: upgrade 2.5 -> 2.6
To: james@codeconstruct.com.au
Cc: openembedded-devel@lists.openembedded.org, andrew@codeconstruct.com.au, 
	jk@codeconstruct.com.au
Content-Type: multipart/alternative; boundary="000000000000c8f0e20658ee14ef"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128942

--000000000000c8f0e20658ee14ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this has to be made specific to systemd distros alone otherwise we endup
with

Consider defining a PREFERRED_PROVIDER entry to match virtual/freeglut
ERROR: Nothing PROVIDES 'systemd' (but
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking=
/recipes-support/mctp/mctpd_2.6.bb
DEPENDS on or otherwise requires it)
systemd was skipped: using DISTRO 'poky', which is missing required
DISTRO_FEATURES: 'usrmerge systemd'
NOTE: Multiple providers are available for runtime libnss-mdns
(avahi-libnss-mdns, mdns)
Consider defining a PREFERRED_RPROVIDER entry to match libnss-mdns
ERROR: Nothing RPROVIDES 'mctpd' (but
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking=
/recipes-support/mctp/mctpd_2.6.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'mctpd'
NOTE: Runtime target 'mctpd' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['mctpd']
ERROR: Nothing RPROVIDES 'mctpd-dev' (but
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking=
/recipes-support/mctp/mctpd_2.6.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'mctpd-dev'


On Tue, Aug 11, 2026 at 12:25=E2=80=AFAM James Lee via lists.openembedded.o=
rg
<james=3Dcodeconstruct.com.au@lists.openembedded.org> wrote:

> Bumped mctp and mctp-daemon version to 2.6, and added the new system
> user to own mctpd's service.
>
> Signed-off-by: James Lee <james@codeconstruct.com.au>
> ---
>  meta-networking/recipes-support/mctp/mctp.inc                | 2 +-
>  .../recipes-support/mctp/{mctp_2.5.bb =3D> mctp_2.6.bb}        | 0
>  .../recipes-support/mctp/{mctpd_2.5.bb =3D> mctpd_2.6.bb}      | 5 ++++-
>  3 files changed, 5 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/mctp/{mctp_2.5.bb =3D> mctp_2.6.b=
b}
> (100%)
>  rename meta-networking/recipes-support/mctp/{mctpd_2.5.bb =3D> mctpd_2.6=
.bb}
> (89%)
>
> diff --git a/meta-networking/recipes-support/mctp/mctp.inc
> b/meta-networking/recipes-support/mctp/mctp.inc
> index 98225cffea..c8fc98f63a 100644
> --- a/meta-networking/recipes-support/mctp/mctp.inc
> +++ b/meta-networking/recipes-support/mctp/mctp.inc
> @@ -4,7 +4,7 @@ LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61d=
b21"
>
>  SRC_URI =3D "git://
> github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps;tag=3Dv${PV}
> <http://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps;tag=
=3Dv$%7BPV%7D>
> "
> -SRCREV =3D "07c7a5d526f686da89bc9ae9cad917e46652b272"
> +SRCREV =3D "31ac0e86b0e23d32abf34d191653a87a47f3c9a7"
>
>  inherit meson pkgconfig
>
> diff --git a/meta-networking/recipes-support/mctp/mctp_2.5.bb
> b/meta-networking/recipes-support/mctp/mctp_2.6.bb
> similarity index 100%
> rename from meta-networking/recipes-support/mctp/mctp_2.5.bb
> rename to meta-networking/recipes-support/mctp/mctp_2.6.bb
> diff --git a/meta-networking/recipes-support/mctp/mctpd_2.5.bb
> b/meta-networking/recipes-support/mctp/mctpd_2.6.bb
> similarity index 89%
> rename from meta-networking/recipes-support/mctp/mctpd_2.5.bb
> rename to meta-networking/recipes-support/mctp/mctpd_2.6.bb
> index f049be646b..f4c5bb976c 100644
> --- a/meta-networking/recipes-support/mctp/mctpd_2.5.bb
> +++ b/meta-networking/recipes-support/mctp/mctpd_2.6.bb
> @@ -2,7 +2,7 @@ require mctp.inc
>
>  SUMMARY =3D "Management Component Transport Protocol (MCTP) control
> protocol daemon"
>
> -inherit systemd
> +inherit systemd useradd
>
>  do_install:append () {
>      install -d ${D}${systemd_system_unitdir}
> @@ -17,6 +17,9 @@ do_install:append () {
>
>  SYSTEMD_SERVICE:${PN} =3D "mctpd.service mctp.target mctp-local.target"
>
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM:${PN} =3D "-r -U -s /bin/false mctpd"
> +
>  DEPENDS +=3D "systemd"
>
>  # Meson adds mctp utility binaries to FILES and do_install(), which
> cannot be
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128923):
> https://lists.openembedded.org/g/openembedded-devel/message/128923
> Mute This Topic: https://lists.openembedded.org/mt/120698533/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c8f0e20658ee14ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">this has to be made specific to systemd distros alone othe=
rwise=C2=A0we endup with<div><br></div><div><pre style=3D"color:rgb(0,0,0);=
white-space:pre-wrap">Consider defining a PREFERRED_PROVIDER entry to match=
 virtual/freeglut
ERROR: Nothing PROVIDES &#39;systemd&#39; (but /srv/pokybuild/yocto-worker/=
meta-oe/build/meta-openembedded/meta-networking/recipes-support/mctp/<a hre=
f=3D"http://mctpd_2.6.bb">mctpd_2.6.bb</a> DEPENDS on or otherwise requires=
 it)
systemd was skipped: using DISTRO &#39;poky&#39;, which is missing required=
 DISTRO_FEATURES: &#39;usrmerge systemd&#39;
NOTE: Multiple providers are available for runtime libnss-mdns (avahi-libns=
s-mdns, mdns)
Consider defining a PREFERRED_RPROVIDER entry to match libnss-mdns
ERROR: Nothing RPROVIDES &#39;mctpd&#39; (but /srv/pokybuild/yocto-worker/m=
eta-oe/build/meta-openembedded/meta-networking/recipes-support/mctp/<a href=
=3D"http://mctpd_2.6.bb">mctpd_2.6.bb</a> RDEPENDS on or otherwise requires=
 it)
No eligible RPROVIDERs exist for &#39;mctpd&#39;
NOTE: Runtime target &#39;mctpd&#39; is unbuildable, removing...
Missing or unbuildable dependency chain was: [&#39;mctpd&#39;]
ERROR: Nothing RPROVIDES &#39;mctpd-dev&#39; (but /srv/pokybuild/yocto-work=
er/meta-oe/build/meta-openembedded/meta-networking/recipes-support/mctp/<a =
href=3D"http://mctpd_2.6.bb">mctpd_2.6.bb</a> RDEPENDS on or otherwise requ=
ires it)
No eligible RPROVIDERs exist for &#39;mctpd-dev&#39;</pre></div></div><br><=
div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"g=
mail_attr">On Tue, Aug 11, 2026 at 12:25=E2=80=AFAM James Lee via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;james=3D<=
a href=3D"mailto:codeconstruct.com.au@lists.openembedded.org">codeconstruct=
.com.au@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Bumped mctp and mctp-daemon version to 2.6, a=
nd added the new system<br>
user to own mctpd&#39;s service.<br>
<br>
Signed-off-by: James Lee &lt;<a href=3D"mailto:james@codeconstruct.com.au" =
target=3D"_blank">james@codeconstruct.com.au</a>&gt;<br>
---<br>
=C2=A0meta-networking/recipes-support/mctp/mctp.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0.../recipes-support/mctp/{<a href=3D"http://mctp_2.5.bb" rel=3D"noref=
errer" target=3D"_blank">mctp_2.5.bb</a> =3D&gt; <a href=3D"http://mctp_2.6=
.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.6.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 0<br>
=C2=A0.../recipes-support/mctp/{<a href=3D"http://mctpd_2.5.bb" rel=3D"nore=
ferrer" target=3D"_blank">mctpd_2.5.bb</a> =3D&gt; <a href=3D"http://mctpd_=
2.6.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.6.bb</a>}=C2=A0 =C2=A0=
 =C2=A0 | 5 ++++-<br>
=C2=A03 files changed, 5 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-networking/recipes-support/mctp/{<a href=3D"http://mctp_2=
.5.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a> =3D&gt; <a href=
=3D"http://mctp_2.6.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.6.bb</a=
>} (100%)<br>
=C2=A0rename meta-networking/recipes-support/mctp/{<a href=3D"http://mctpd_=
2.5.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.5.bb</a> =3D&gt; <a hr=
ef=3D"http://mctpd_2.6.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.6.b=
b</a>} (89%)<br>
<br>
diff --git a/meta-networking/recipes-support/mctp/mctp.inc b/meta-networkin=
g/recipes-support/mctp/mctp.inc<br>
index 98225cffea..c8fc98f63a 100644<br>
--- a/meta-networking/recipes-support/mctp/mctp.inc<br>
+++ b/meta-networking/recipes-support/mctp/mctp.inc<br>
@@ -4,7 +4,7 @@ LICENSE =3D &quot;GPL-2.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D4cc91856b08b094b4f406=
a29dc61db21&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/CodeConstruct/mc=
tp;branch=3Dmain;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps;=
tag=3Dv${PV}</a>&quot;<br>
-SRCREV =3D &quot;07c7a5d526f686da89bc9ae9cad917e46652b272&quot;<br>
+SRCREV =3D &quot;31ac0e86b0e23d32abf34d191653a87a47f3c9a7&quot;<br>
<br>
=C2=A0inherit meson pkgconfig<br>
<br>
diff --git a/meta-networking/recipes-support/mctp/<a href=3D"http://mctp_2.=
5.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a> b/meta-networkin=
g/recipes-support/mctp/<a href=3D"http://mctp_2.6.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">mctp_2.6.bb</a><br>
similarity index 100%<br>
rename from meta-networking/recipes-support/mctp/<a href=3D"http://mctp_2.5=
.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a><br>
rename to meta-networking/recipes-support/mctp/<a href=3D"http://mctp_2.6.b=
b" rel=3D"noreferrer" target=3D"_blank">mctp_2.6.bb</a><br>
diff --git a/meta-networking/recipes-support/mctp/<a href=3D"http://mctpd_2=
.5.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.5.bb</a> b/meta-network=
ing/recipes-support/mctp/<a href=3D"http://mctpd_2.6.bb" rel=3D"noreferrer"=
 target=3D"_blank">mctpd_2.6.bb</a><br>
similarity index 89%<br>
rename from meta-networking/recipes-support/mctp/<a href=3D"http://mctpd_2.=
5.bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.5.bb</a><br>
rename to meta-networking/recipes-support/mctp/<a href=3D"http://mctpd_2.6.=
bb" rel=3D"noreferrer" target=3D"_blank">mctpd_2.6.bb</a><br>
index f049be646b..f4c5bb976c 100644<br>
--- a/meta-networking/recipes-support/mctp/<a href=3D"http://mctpd_2.5.bb" =
rel=3D"noreferrer" target=3D"_blank">mctpd_2.5.bb</a><br>
+++ b/meta-networking/recipes-support/mctp/<a href=3D"http://mctpd_2.6.bb" =
rel=3D"noreferrer" target=3D"_blank">mctpd_2.6.bb</a><br>
@@ -2,7 +2,7 @@ require mctp.inc<br>
<br>
=C2=A0SUMMARY =3D &quot;Management Component Transport Protocol (MCTP) cont=
rol protocol daemon&quot;<br>
<br>
-inherit systemd<br>
+inherit systemd useradd<br>
<br>
=C2=A0do_install:append () {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${systemd_system_unitdir}<br>
@@ -17,6 +17,9 @@ do_install:append () {<br>
<br>
=C2=A0SYSTEMD_SERVICE:${PN} =3D &quot;mctpd.service mctp.target mctp-local.=
target&quot;<br>
<br>
+USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
+USERADD_PARAM:${PN} =3D &quot;-r -U -s /bin/false mctpd&quot;<br>
+<br>
=C2=A0DEPENDS +=3D &quot;systemd&quot;<br>
<br>
=C2=A0# Meson adds mctp utility binaries to FILES and do_install(), which c=
annot be<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128923): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128923" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128923</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120698533/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120698533/1997914</a><br>
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

--000000000000c8f0e20658ee14ef--

