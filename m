Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331B9C4451C
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 15:51:32 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8289.1784389884120274220
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Jul 2026 08:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WsHODLm9;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8143daf89c7so51048887b3.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Jul 2026 08:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784389883; cv=none;
        d=google.com; s=arc-20260327;
        b=FPX35KEkGCc/AgmL+N9OrxoTGNTJ/yuOnOVdKPxic4i96wGkp0zQessIzIe/wxJ9W0
         IvFXpJ5PXH+MuJuSY1n7E3CHGV9hYia/w3YHRTQhbgIsLVSuI7VRWbTAupsTmEwwvBw8
         DD9KYZ6jTogWlvHLY1k89V8xhNbUFxRVh/oOwvxqvYTG2/Zgo+9wYmlJBLHurjEwwkFm
         acwDT3VXAlMOV+zeDaYwK77xWOc0nqauvMsv2p/iZE3l5+9zbngFoYfeG+Y1pTnN6llg
         9rao7BuUa6D3prT3k8aRiXovrY6ZkJBAQFS7/D20YADAeTsougSuKDn8SCbMwjE+MIGx
         lLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9ICZ45RvuedbQUs8losc1xuhika9oxCCEk0EFJ4clFo=;
        fh=wtQJmTNKI5f1UFKEvRhwyoTFPNk3MPf/Yr/dx5nN1Vo=;
        b=HVy6SABYk0bj7GQ8YEavmJ+aLnnRcKlWmKuLDC6RdQWUWAHLh4+0supVutJxlrjv5G
         8UwCUaDgT77U9H9BOdDt/bZ0oRy37Tqagxg97KGdvfXqMNprdfBimZfrOvX1vxO5G/0p
         8HOrFp9EqM3yKYOjMcnveodUy/dgi/J/K7+yBua9cuUL/kgX+9FtYNy+3LIR++60CdXw
         5RQ/z9mZnsqJa+04atSsLvRku4eJBNhtLiidCbA3GXub16rr1N4KvovOGRU2R2APVkKp
         q9xJfNCumssvIMlzc8g1emw0pLWGW7mVnzIwR31KK4aUEAecY4RfiZoqOIVtXPp/+Vck
         ZYHA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784389883; x=1784994683; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ICZ45RvuedbQUs8losc1xuhika9oxCCEk0EFJ4clFo=;
        b=WsHODLm9z9O8a/f5ggXP+JQ0yvVIyLptO2DJR1b++fnz1hBSYTY3vhWVdpWvWw1l1J
         xdp1VNHVvJ80LLuXg9YR7Q9SKV9Eo+c4UthxZQ1H44ORbuiIh6Hrk45wwHu/93QvU5tP
         LoyKQiiGdMiQJY2Lhs8khNp1yO2x9/giQmEXRvxrCXklh+3tmA6+nMT34UT+sqpa/lnf
         XL5wHkVQJ0sGv5I5rj39h+p8aNXOhwCijNGcHIRq5wOjhk3fjnXGyYUX4OZF6xdeHW/w
         No2k0Q9fumganNtPmlRANN0NQwGAnOr8NJsVprEfaui3R1yatF6AxvEakGHM2lK6qbvL
         skSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784389883; x=1784994683;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ICZ45RvuedbQUs8losc1xuhika9oxCCEk0EFJ4clFo=;
        b=BDXHzmsb+FYoNPOaChgLcPoJHcRqyKgO9U3yTnF0eeJkzz7zLylna0RN6abvGkp1mZ
         D3GmE5X0APRjDMz1I4ytZSMeA2mhVZ55C26e3ctlIBKdZmdQOrrgOUzPszEKabaMwaHh
         VrFIdqk+ZlkO2H2pL6Gf9rGhnXt/rEOogZTp6JYGLO/kXgxsHPXTN0+T4GEMZs6ZcMQq
         3KoDqpWXnVLLPAmrqb34OVtoRvVHu12wKrVYfjPX9yzoAP9cM53K7AdwQlG4aZTkzefr
         tZwDLG5ikyR+h8ypnOets5d4Z3Y7rakpCKdrOFOKEzysHW6tJ4/Lcl4Gx7A4aB6Msado
         wEmA==
X-Gm-Message-State: AOJu0YyElXEc/j43HrIbIfNE7VdsqWE9NwPCL817QbrrHnrgGw0paOLm
	0fRzanlpzAoQn9Dike3O9f2Vi4/lAB312cD4MLnIf2uH8aI5aQFjyuaIXuFIhRO5PiF8tKxDKVM
	eHlZIoIFQRxT+1PAhT8NauArAWZ/fe5Ihqf1b
X-Gm-Gg: AfdE7cnhFahMPo31Ia+lN1zeQpRWwOzTdFm7WQSiu5R7GcEPF5hzLuUBTlf912xjPCq
	9ZVTAg5+HV0829jn/r3y83lClH/CpsQTUJXtvVchs+0UjGLt878GspDkK6T0VuqoHpvNG9OERkp
	yLn7oVy8ZcIgL8VjkdhE0CAAVu5TvmZPRrdC6xVDwjwrv3E+AhgFNBJQRSNaFYf7mt7/CZF1Fj1
	uV9FKrTgK+tob+u4uagNBf4ul906VuiZCNgx36Z4iRVSOwms4gT5fCAodVC2Tqs5qwXlbGVrNnU
	PkjVcRbTRJR/zh/8bOQ+cvmi5MTHwFM669p4kyxP22iVqYEuvlNa2S5WbkKQaCApAAWem+m/rZE
	AYDKmJlQPb4Q9PGogsIRmGQtn+Nvo/GcEJoz1637BKQRxlGHoLMbD0YhKMRzkWIMABXARww==
X-Received: by 2002:a05:690c:b9e:b0:80c:2874:67b5 with SMTP id
 00721157ae682-81ef25e9282mr23868937b3.52.1784389883103; Sat, 18 Jul 2026
 08:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <ccc9289f95924943d5fba4f4be27e6c558652390.1784270036.git.joerg.sommer@navimatix.de>
In-Reply-To: <ccc9289f95924943d5fba4f4be27e6c558652390.1784270036.git.joerg.sommer@navimatix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Jul 2026 08:50:55 -0700
X-Gm-Features: AUfX_mwBQkS8Zoyz0y5UA1YAemL3M_6DI0EIgqF3an6ItSr9gkYi0YfPJylms0c
Message-ID: <CAMKF1srYEvATLXXGDgBizwnedDPhihfX0E5+VBi0n=R-kMZZyQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] zsh: Update 5.9.1 -> 5.9.2
To: joerg.sommer@navimatix.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001f8e6a0656e4a53f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Jul 2026 15:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128255

--0000000000001f8e6a0656e4a53f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The sha checksum for 5.9.2 tarball seems to have discrepancies.

https://errors.yoctoproject.org/Errors/Details/950824/

Can you check by building please ?


On Thu, Jul 16, 2026 at 11:34=E2=80=AFPM J=C3=B6rg Sommer via lists.openemb=
edded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:

> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>
> Changelog https://zsh.sourceforge.io/releases.html
>
> * Only minor changes.
>
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
>  meta-oe/recipes-shells/zsh/{zsh_5.9.1.bb =3D> zsh_5.9.2.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-shells/zsh/{zsh_5.9.1.bb =3D> zsh_5.9.2.bb} (95%)
>
> diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.1.bb
> b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
> similarity index 95%
> rename from meta-oe/recipes-shells/zsh/zsh_5.9.1.bb
> rename to meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
> index a62526dbb2..88c846a27d 100644
> --- a/meta-oe/recipes-shells/zsh/zsh_5.9.1.bb
> +++ b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENCE;md5=3D1a4c4cda3e8096d2fd483ff2f4514fec"
>  DEPENDS =3D "ncurses bison-native libcap libpcre2 gdbm groff-native"
>
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar=
.xz"
> -SRC_URI[sha256sum] =3D
> "5d20bec03f981dc4e9a09ec245e7415388ff641f79c5c5c416b5042e58d8280d"
> +SRC_URI[sha256sum] =3D
> "020ee644be1749507b282e619cdcd95c56ff36144e79b7a3c245458aacd9458f"
>
>  inherit autotools gettext update-alternatives manpages
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128245):
> https://lists.openembedded.org/g/openembedded-devel/message/128245
> Mute This Topic: https://lists.openembedded.org/mt/120311241/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001f8e6a0656e4a53f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The sha checksum for 5.9.2 tarball seems to have discrepan=
cies.=C2=A0<div><br></div><div><a href=3D"https://errors.yoctoproject.org/E=
rrors/Details/950824/">https://errors.yoctoproject.org/Errors/Details/95082=
4/</a></div><div><br></div><div>Can you check by building please ?<div><br>=
</div></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 16, 2026 at 11:34=E2=80=AFPM =
J=C3=B6rg Sommer via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;joerg.sommer=3D<a href=3D"mailto:navimatix.de@lists.open=
embedded.org">navimatix.de@lists.openembedded.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">From: J=C3=B6rg Sommer &lt=
;<a href=3D"mailto:joerg.sommer@navimatix.de" target=3D"_blank">joerg.somme=
r@navimatix.de</a>&gt;<br>
<br>
Changelog <a href=3D"https://zsh.sourceforge.io/releases.html" rel=3D"noref=
errer" target=3D"_blank">https://zsh.sourceforge.io/releases.html</a><br>
<br>
* Only minor changes.<br>
<br>
Signed-off-by: J=C3=B6rg Sommer &lt;<a href=3D"mailto:joerg.sommer@navimati=
x.de" target=3D"_blank">joerg.sommer@navimatix.de</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-shells/zsh/{<a href=3D"http://zsh_5.9.1.bb" rel=3D"no=
referrer" target=3D"_blank">zsh_5.9.1.bb</a> =3D&gt; <a href=3D"http://zsh_=
5.9.2.bb" rel=3D"noreferrer" target=3D"_blank">zsh_5.9.2.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-shells/zsh/{<a href=3D"http://zsh_5.9.1.bb" re=
l=3D"noreferrer" target=3D"_blank">zsh_5.9.1.bb</a> =3D&gt; <a href=3D"http=
://zsh_5.9.2.bb" rel=3D"noreferrer" target=3D"_blank">zsh_5.9.2.bb</a>} (95=
%)<br>
<br>
diff --git a/meta-oe/recipes-shells/zsh/<a href=3D"http://zsh_5.9.1.bb" rel=
=3D"noreferrer" target=3D"_blank">zsh_5.9.1.bb</a> b/meta-oe/recipes-shells=
/zsh/<a href=3D"http://zsh_5.9.2.bb" rel=3D"noreferrer" target=3D"_blank">z=
sh_5.9.2.bb</a><br>
similarity index 95%<br>
rename from meta-oe/recipes-shells/zsh/<a href=3D"http://zsh_5.9.1.bb" rel=
=3D"noreferrer" target=3D"_blank">zsh_5.9.1.bb</a><br>
rename to meta-oe/recipes-shells/zsh/<a href=3D"http://zsh_5.9.2.bb" rel=3D=
"noreferrer" target=3D"_blank">zsh_5.9.2.bb</a><br>
index a62526dbb2..88c846a27d 100644<br>
--- a/meta-oe/recipes-shells/zsh/<a href=3D"http://zsh_5.9.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">zsh_5.9.1.bb</a><br>
+++ b/meta-oe/recipes-shells/zsh/<a href=3D"http://zsh_5.9.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">zsh_5.9.2.bb</a><br>
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENCE;md5=3D1a4c4cda3=
e8096d2fd483ff2f4514fec&quot;<br>
=C2=A0DEPENDS =3D &quot;ncurses bison-native libcap libpcre2 gdbm groff-nat=
ive&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/$=
{BP}.tar.xz&quot;<br>
-SRC_URI[sha256sum] =3D &quot;5d20bec03f981dc4e9a09ec245e7415388ff641f79c5c=
5c416b5042e58d8280d&quot;<br>
+SRC_URI[sha256sum] =3D &quot;020ee644be1749507b282e619cdcd95c56ff36144e79b=
7a3c245458aacd9458f&quot;<br>
<br>
=C2=A0inherit autotools gettext update-alternatives manpages<br>
<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128245): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128245" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128245</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120311241/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120311241/1997914</a><br>
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

--0000000000001f8e6a0656e4a53f--

