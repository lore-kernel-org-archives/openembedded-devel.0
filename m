Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C6BC4452D
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 17:40:48 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28972.1784655638698542484
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 10:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IkV1ffVK;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81e8fa1b8d6so119231897b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 10:40:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784655638; cv=none;
        d=google.com; s=arc-20260327;
        b=G/1LL6F2zULJZanX2nVUte/yHufjV6OUkd5k3ftMyR3JT85yfQ+xN8tJyZwblRMgXW
         9ThgBf0a3Fjt7d/Tf1SFKKkLCtlN6NlymRlJ0sh6G8BIf78V29OmjMU1wZF+3dIbpomX
         j7T9KVzVO/AfCWnGkotJ3/Fwdpagz/4b6GDo2Pfw/8stfW0spi9w2+IT0d1BSrVR32p0
         9WG/RiO4fXU0jkvwNcxYvuZyvWWwVbZPYArv3z4evS6ncdTJ/jxUrjfif0QJFYE6kVmp
         Z8TNbBmKrHo0wKPMT/NhYw7ZwEYTIQ5FDx4oTyI77k9aSG/l8PtcUKVyar8Gg4fXoIFN
         c8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/pLYP61SBchE21R5k0BP+WRrxn2rukslTVNr2Wz9ThQ=;
        fh=/ocEzzqrd6xq7lLe0Pdn4i+HA2K5/K+r/itKI3dg96U=;
        b=i1tbOijwg2425474Ho4ecxGnrKGtMS6lwOj1ZPu9xtglSMmlk/vBN9QTl0V4RLY6Ak
         JdQeMv9MfroIEgJlKjc2L9w4onJypEJbDV65KhM7wlMg26xcfJZqnFtuZNcshhTXG91+
         YIW+c4cvt6KM60hpKegj3aErKDDJVsvlGLvDTtuiVOU6CLL2LmgiM2lci4Gyok/wtrcB
         TGjSEmnjq3+cCewqaxN6kY0ETbOvhtGLMU6aeryDVx5PB8/zfZnFKpOIqdsyFAizNvpp
         AWFcTUg7GGmCEUkkPkMJdaww0y0i+d5i5Nj62lYRcgUxaUArJnarJz+op/uFPXBZud6z
         AyXw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784655638; x=1785260438; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/pLYP61SBchE21R5k0BP+WRrxn2rukslTVNr2Wz9ThQ=;
        b=IkV1ffVKYaJJ7s+r62FUSe2a5WCH+9O4RdUd5+sc3onqPj0nuTgeBzhV68Z+d9vc2b
         ftruRrmrX09GNk2O/ZmBRxjwcANmmEfdU9thAzJ1wMSTURw+LJB3uGRofqpLmsLP3dvL
         k5veZXNXk8UDWUX2sLAcJLCI/KE5KMPY2U0wd9QOkf8nOnblnevtXEI/N1nRGzlSKBRi
         OX2CV/+gyJlJLPumzqRz9yLHag73dAWlppkByF2JboGmVuucgj53OLNg9E0I7zDy6dy2
         QCX3xvcpNxEISZbX70mj5QTAMby9LmKSCitnOh4Gu2MsNrXRY76ixQLEJ/lgxk1nZdt6
         bXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784655638; x=1785260438;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/pLYP61SBchE21R5k0BP+WRrxn2rukslTVNr2Wz9ThQ=;
        b=VoF3m21+2vLrtUZRxzuhtrTF6RbRha/1Y5NfggwvsXuu9ofvL1Bje3EI3R5OcXhO5G
         l2sCkTThuh48Unqn7sUj/YlhqBZnvzkkdzlHC8sPX+vah7E0YhPVwljXXq5k+TeXC1dJ
         kboMR38qr1pm1uGmJAoUcKSD5q8twb6WrwXBk2ti8NoWGNE0Vq/w0F34mTbsMwWHovky
         S4n0mxwG8z4WOwVsBbGKLV+YT51pD3QUodg2xtwYvE7vE5RbPYN45UCoZkPAIkbDicvl
         Hy5DhxWD/Tr68sD/RhEyrWGeNmYWIxBItMfnMLl9qOFx0qtAEF4RleUVRE8IImfAxsXQ
         KM3g==
X-Gm-Message-State: AOJu0YwxTWVgFhenWiEFKyIc+YUeQpyoY4PwSZMoVvwlHc5B9tIwHCDu
	CL4FYUNxw50f+vTPFA9Wx2AfJtCgsG0N6hoomcH1ZHSMEMxSWF3MkRGIv+ENGatXGG78/f52KE7
	TaRLt9VmaPkG/kMQx9K+IT5fly6UkytACAyHx
X-Gm-Gg: AR+sD10YJwJi2UzClcTOXpipxQwCuoOA+DDmJyCarbaceerW3D0ZA4SlXfyyuaz3V3N
	ERUL5fe21v9dF9g684kirK0Q1dPSXb34+109uFKa3U9nctvpx5cOQhSGyOx9ywFgr/E1ODQtk40
	pyX5LXctVO9ll7Uj57Kwnc7FJOmJbfd5HItEQmpX9YaxiZs6d/IIMfgPe3WKBbIYNrdE9GYYyCw
	bAoBg4JWWUP8zzeEC3BrsNlZXrx8fYvF0TqdGELtMdPpqEr5gTMrpD9k3wNWr978GHiO2B8dXZB
	5qxH0VPVWGD57TBha4wJyBUlkPAQYguhbsJxuX3Jj8kMNQ6dY+QCUxPx0Lej3Ottk8L113WATxw
	IeiMTmb8SX3MtObmyo5+FnUjmvuvHV0lEvivjp+Y2Pf7rLJCRaufoDN6NktoP4A==
X-Received: by 2002:a05:690c:6607:b0:80c:d342:955c with SMTP id
 00721157ae682-81ef26cb595mr63664997b3.3.1784655637579; Tue, 21 Jul 2026
 10:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260721082727.2994105-1-james@codeconstruct.com.au>
In-Reply-To: <20260721082727.2994105-1-james@codeconstruct.com.au>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jul 2026 10:40:09 -0700
X-Gm-Features: AUfX_mzt87YtIoxOW6XGEr08EFz9McKQhqKHZz-VmQcGHNTa-Atm1p3qH4QXMXg
Message-ID: <CAMKF1sr-5TrcXuUrasxXiOCgT9hO5mqzZi1ZfOm0-ypSQ2rMiw@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH] mctp: upgrade 2.5 -> 2.6
To: james@codeconstruct.com.au
Cc: openembedded-devel@lists.openembedded.org, jk@codeconstruct.com.au
Content-Type: multipart/alternative; boundary="000000000000530b8d0657228568"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 17:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128359

--000000000000530b8d0657228568
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this does not work when systemd is not in distro_features

Parsing recipes...ERROR:
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking=
/recipes-support/mctp/mctp_2.6.bb:
/srv/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-networking=
/recipes-support/mctp/mctp_2.6.bb
inherits useradd but doesn't set USERADD_PACKAGES



On Tue, Jul 21, 2026 at 1:27=E2=80=AFAM James Lee via lists.openembedded.or=
g <james=3D
codeconstruct.com.au@lists.openembedded.org> wrote:

> mctp version 2.6 released on 2026-07-21, bump srcrev to the v2.6 tag.
>
> The new version of mctpd can run as an unprivileged user with
> CAP_NET_BIND_SERVICE and CAP_NET_ADMIN added to the process' ambient
> capabilities. Added this unpriviledged user to the recipe when systemd
> is available.
>
> Signed-off-by: James Lee <james@codeconstruct.com.au>
> Acked-by: Jeremy Kerr <jk@codeconstruct.com.au>
> ---
>  .../recipes-support/mctp/{mctp_2.5.bb =3D> mctp_2.6.bb}      | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-support/mctp/{mctp_2.5.bb =3D> mctp_2.6.b=
b}
> (82%)
>
> diff --git a/meta-networking/recipes-support/mctp/mctp_2.5.bb
> b/meta-networking/recipes-support/mctp/mctp_2.6.bb
> similarity index 82%
> rename from meta-networking/recipes-support/mctp/mctp_2.5.bb
> rename to meta-networking/recipes-support/mctp/mctp_2.6.bb
> index a8787d3f2b..73e090bdab 100644
> --- a/meta-networking/recipes-support/mctp/mctp_2.5.bb
> +++ b/meta-networking/recipes-support/mctp/mctp_2.6.bb
> @@ -5,12 +5,12 @@ LICENSE =3D "GPL-2.0-only"
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61d=
b21"
>
> -SRCREV =3D "07c7a5d526f686da89bc9ae9cad917e46652b272"
> +SRCREV =3D "31ac0e86b0e23d32abf34d191653a87a47f3c9a7"
>
>  SRC_URI =3D "git://
> github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps;tag=3Dv${PV}
> <http://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps;tag=
=3Dv$%7BPV%7D>
> "
>
>
> -inherit meson pkgconfig systemd
> +inherit meson pkgconfig systemd useradd
>
>  EXTRA_OEMESON =3D " \
>      -Dtests=3Dfalse \
> @@ -39,6 +39,9 @@ do_install:append () {
>      fi
>  }
>
> +USERADD_PACKAGES =3D "${@bb.utils.contains('PACKAGECONFIG', 'systemd',
> '${PN}', '', d)}"
> +USERADD_PARAM:${PN} =3D "${@bb.utils.contains('PACKAGECONFIG', 'systemd'=
,
> '-r -U -s /bin/false mctpd', '', d)}"
> +
>  FILES:${PN} +=3D " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', \
>              '${datadir}/dbus-1/system.d/mctpd.conf', '', d)} \
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128340):
> https://lists.openembedded.org/g/openembedded-devel/message/128340
> Mute This Topic: https://lists.openembedded.org/mt/120373276/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000530b8d0657228568
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">this does not work when systemd is not in distro_features=
=C2=A0<div><br></div><div><pre style=3D"color:rgb(0,0,0);white-space:pre-wr=
ap">Parsing recipes...ERROR: /srv/pokybuild/yocto-worker/meta-oe/build/meta=
-openembedded/meta-networking/recipes-support/mctp/<a href=3D"http://mctp_2=
.6.bb">mctp_2.6.bb</a>: /srv/pokybuild/yocto-worker/meta-oe/build/meta-open=
embedded/meta-networking/recipes-support/mctp/<a href=3D"http://mctp_2.6.bb=
">mctp_2.6.bb</a> inherits useradd but doesn&#39;t set USERADD_PACKAGES
</pre><br></div></div><br><div class=3D"gmail_quote gmail_quote_container">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 21, 2026 at 1:27=E2=80=AF=
AM James Lee via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;james=3D<a href=3D"mailto:codeconstruct.com.au@lists.openemb=
edded.org">codeconstruct.com.au@lists.openembedded.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">mctp version 2.6 rele=
ased on 2026-07-21, bump srcrev to the v2.6 tag.<br>
<br>
The new version of mctpd can run as an unprivileged user with<br>
CAP_NET_BIND_SERVICE and CAP_NET_ADMIN added to the process&#39; ambient<br=
>
capabilities. Added this unpriviledged user to the recipe when systemd<br>
is available.<br>
<br>
Signed-off-by: James Lee &lt;<a href=3D"mailto:james@codeconstruct.com.au" =
target=3D"_blank">james@codeconstruct.com.au</a>&gt;<br>
Acked-by: Jeremy Kerr &lt;<a href=3D"mailto:jk@codeconstruct.com.au" target=
=3D"_blank">jk@codeconstruct.com.au</a>&gt;<br>
---<br>
=C2=A0.../recipes-support/mctp/{<a href=3D"http://mctp_2.5.bb" rel=3D"noref=
errer" target=3D"_blank">mctp_2.5.bb</a> =3D&gt; <a href=3D"http://mctp_2.6=
.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.6.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 | 7 +++++--<br>
=C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-networking/recipes-support/mctp/{<a href=3D"http://mctp_2=
.5.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a> =3D&gt; <a href=
=3D"http://mctp_2.6.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.6.bb</a=
>} (82%)<br>
<br>
diff --git a/meta-networking/recipes-support/mctp/<a href=3D"http://mctp_2.=
5.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a> b/meta-networkin=
g/recipes-support/mctp/<a href=3D"http://mctp_2.6.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">mctp_2.6.bb</a><br>
similarity index 82%<br>
rename from meta-networking/recipes-support/mctp/<a href=3D"http://mctp_2.5=
.bb" rel=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a><br>
rename to meta-networking/recipes-support/mctp/<a href=3D"http://mctp_2.6.b=
b" rel=3D"noreferrer" target=3D"_blank">mctp_2.6.bb</a><br>
index a8787d3f2b..73e090bdab 100644<br>
--- a/meta-networking/recipes-support/mctp/<a href=3D"http://mctp_2.5.bb" r=
el=3D"noreferrer" target=3D"_blank">mctp_2.5.bb</a><br>
+++ b/meta-networking/recipes-support/mctp/<a href=3D"http://mctp_2.6.bb" r=
el=3D"noreferrer" target=3D"_blank">mctp_2.6.bb</a><br>
@@ -5,12 +5,12 @@ LICENSE =3D &quot;GPL-2.0-only&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D4cc91856b08b094b4f406=
a29dc61db21&quot;<br>
<br>
-SRCREV =3D &quot;07c7a5d526f686da89bc9ae9cad917e46652b272&quot;<br>
+SRCREV =3D &quot;31ac0e86b0e23d32abf34d191653a87a47f3c9a7&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/CodeConstruct/mc=
tp;branch=3Dmain;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/CodeConstruct/mctp;branch=3Dmain;protocol=3Dhttps;=
tag=3Dv${PV}</a>&quot;<br>
<br>
<br>
-inherit meson pkgconfig systemd<br>
+inherit meson pkgconfig systemd useradd<br>
<br>
=C2=A0EXTRA_OEMESON =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-Dtests=3Dfalse \<br>
@@ -39,6 +39,9 @@ do_install:append () {<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
+USERADD_PACKAGES =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &=
#39;systemd&#39;, &#39;${PN}&#39;, &#39;&#39;, d)}&quot;<br>
+USERADD_PARAM:${PN} =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;=
, &#39;systemd&#39;, &#39;-r -U -s /bin/false mctpd&#39;, &#39;&#39;, d)}&q=
uot;<br>
+<br>
=C2=A0FILES:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sy=
stemd&#39;, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;${datadir}/dbus-1/syst=
em.d/mctpd.conf&#39;, &#39;&#39;, d)} \<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128340): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128340" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128340</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120373276/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120373276/1997914</a><br>
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

--000000000000530b8d0657228568--

