Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544D9CCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 07:56:02 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43332.1762761341988838470
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 23:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZR0HLNrf;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so152374f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 23:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762761340; x=1763366140; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sxJbys7rxVj1aR2Bqr/aH7Pq4SsES8P3uTh0xi4eZQw=;
        b=ZR0HLNrfYWNvlTLnNEFBAUIOOAtpYNy4gGXOHOqDqzY1lPB7nhbxKLzIeeFwcxZbAF
         NEI1yY/EFZNiB+KwlKG3tIXcg6LGjq/uxHUV3QQriy2+LgPiPqQZ3sSn6Ed8lXnoFXH5
         Vi8dnoxELLUw0/pxshWyUu/QtzeAQ12iEWqmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762761340; x=1763366140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxJbys7rxVj1aR2Bqr/aH7Pq4SsES8P3uTh0xi4eZQw=;
        b=vyZ5vLaTKj0sVv4ftENeDJJFMXl06JDIjGCsA6wznxZtZu5ZWrSUCXvE22JG1ZbZDK
         3wbW1SVshWxiwNbYHAzmLqniP+4vGUYPj9H78rsUe4eP9wEK1dYZdRWh96Q+FFyNSn6Z
         O8Z+fXtW0hbBdo3yyioj2eHqXxe9FDuTZS1dkzrvOgdabvtxnGTeZKod2+U3/1EtE+5r
         jD34jgFIwD3HMdDZ/tO99bTgm/TMPAzNtELqiaaGlQKGMWrHsSgCUf/sn3Sogsyresff
         T8l2rrYzvrJmeCgcqpMpyrORQ6RmnHoPFWqdF8+tHPJK2Jdnl1KM2UCDJctJu8T9ojaB
         VCqQ==
X-Gm-Message-State: AOJu0YwMUJ7g7qIzkukVjh9VTiDOLRAi5zpC7Z6+pNchgvpnpcTo61JF
	FkMiKRKk5drvQf7rlFpLQQcZN5GqGrUkujo56bY2zzEvD14DzaYYbxqA1/WdHqY2xMVRmerpinz
	FJbfM56L3G6IndX4QT5xzE1Ob+ktGBbf0Wcfj/Qwwrw==
X-Gm-Gg: ASbGncuWfkRgRPYlsgYyHrX/4TlhuKa6FTWbHd9WPz4zR+N3PyHTRT2fqzutOfe5KYd
	pH2PNdyqcpVB6Zq8vZxv1DGAndUoamN4V/tywbHLcLGE5t2goWjVDmZAWKt/5uDlEdfUEjNAbvb
	znXgybpZ63KYf5xBmhIfIA1anWSVIxQCcTCzSXIBbKmENxPSYMr0Clazu3n5DL9qn2/A6dOQeHb
	xDXNVWL8SRjFYf812M7KpaRtzxymSUlDannLScEvIStnJeD3A8obJIb3uQ34qLcfY4C9Iv2c5eo
	AUnhITsohqvng2jtRZXVCllhw3Y1M4axGxOjRwFO
X-Google-Smtp-Source: AGHT+IEngfb+9SsffL6MaW1K5gCySR2mvyjG4VrfAjU9Dvu5ofO7vJ510wNkX/XL4/U4gzOt9kk5lHAGPdCG6ybgC+Y=
X-Received: by 2002:a05:6000:230d:b0:42b:3aa8:ff9f with SMTP id
 ffacd0b85a97d-42b3aa90611mr2176655f8f.28.1762761340044; Sun, 09 Nov 2025
 23:55:40 -0800 (PST)
MIME-Version: 1.0
References: <20251108141838.259595-1-yi.zhao@windriver.com>
In-Reply-To: <20251108141838.259595-1-yi.zhao@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 10 Nov 2025 08:55:13 +0100
X-Gm-Features: AWmQ_bnvTpXIZH88piHLc9oZuit4lVGzKrG1HKfdosw0zOnqm2JvBQM1KIMpXGE
Message-ID: <CAMSfU+7HK8QKBFjpCRt1J2aNLWjPN0Xzc_ObzY7Nqx4KWo0=Zg@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH] menulibre: add UPSTREAM_CHECK_URI
To: yi.zhao@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007f56ef064338dbeb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 07:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121448

--0000000000007f56ef064338dbeb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 8 nov. 2025 =C3=A0 15:18, Yi Zhao via lists.openembedded.org <yi.zh=
ao=3D
eng.windriver.com@lists.openembedded.org> a =C3=A9crit :

> Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correct
> latest stable verison.
>
> Before the patch:
> $ devtool latest-version menulibre
> INFO: Current version: 2.4.0
> INFO: Latest version:
>
> After the patch:
> $ devtool latest-version menulibre
> INFO: Current version: 2.4.0
> INFO: Latest version: 2.4.0
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
> b/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
> index 71d3ab4d29..4c52249fed 100644
> --- a/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
> +++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.4.0.bb
> @@ -15,6 +15,9 @@ REQUIRED_DISTRO_FEATURES =3D "x11
> gobject-introspection-data"
>  SRC_URI =3D "
> https://github.com/bluesabre/${BPN}/releases/download/${BP}/${BP}.tar.gz"
>  SRC_URI[sha256sum] =3D
> "d906acf9cc13b0e15b8e342ae9aab8b0680db336a382d0c42f5d5f465f593c9f"
>
> +UPSTREAM_CHECK_URI =3D "https://github.com/bluesabre/menulibre/releases"
> +UPSTREAM_CHECK_REGEX =3D "releases/tag/menulibre-(?P<pver>\d+(\.\d+)+)"
>

Have you thought about using the github-releases class?
https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/git=
hub-releases.bbclass


> +
>  do_compile[noexec] =3D "1"
>
>  do_install:append() {
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121387):
> https://lists.openembedded.org/g/openembedded-devel/message/121387
> Mute This Topic: https://lists.openembedded.org/mt/116187911/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000007f56ef064338dbeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 8 =
nov. 2025 =C3=A0=C2=A015:18, Yi Zhao via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;yi.zhao=3D<a href=3D"mailto:eng.wind=
river.com@lists.openembedded.org">eng.windriver.com@lists.openembedded.org<=
/a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the co=
rrect<br>
latest stable verison.<br>
<br>
Before the patch:<br>
$ devtool latest-version menulibre<br>
INFO: Current version: 2.4.0<br>
INFO: Latest version:<br>
<br>
After the patch:<br>
$ devtool latest-version menulibre<br>
INFO: Current version: 2.4.0<br>
INFO: Latest version: 2.4.0<br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta-xfce/recipes-apps/menulibre/<a href=3D"http://menulibre_2.4.0.bb=
" rel=3D"noreferrer" target=3D"_blank">menulibre_2.4.0.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta-xfce/recipes-apps/menulibre/<a href=3D"http://menulibre_2=
.4.0.bb" rel=3D"noreferrer" target=3D"_blank">menulibre_2.4.0.bb</a> b/meta=
-xfce/recipes-apps/menulibre/<a href=3D"http://menulibre_2.4.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">menulibre_2.4.0.bb</a><br>
index 71d3ab4d29..4c52249fed 100644<br>
--- a/meta-xfce/recipes-apps/menulibre/<a href=3D"http://menulibre_2.4.0.bb=
" rel=3D"noreferrer" target=3D"_blank">menulibre_2.4.0.bb</a><br>
+++ b/meta-xfce/recipes-apps/menulibre/<a href=3D"http://menulibre_2.4.0.bb=
" rel=3D"noreferrer" target=3D"_blank">menulibre_2.4.0.bb</a><br>
@@ -15,6 +15,9 @@ REQUIRED_DISTRO_FEATURES =3D &quot;x11 gobject-introspect=
ion-data&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/bluesabre/$%7BBPN%7D/=
releases/download/$%7BBP%7D/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/bluesabre/${BPN}/releases/download/${BP}/${BP}.t=
ar.gz</a>&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;d906acf9cc13b0e15b8e342ae9aab8b0680db336=
a382d0c42f5d5f465f593c9f&quot;<br>
<br>
+UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/bluesabre/menul=
ibre/releases" rel=3D"noreferrer" target=3D"_blank">https://github.com/blue=
sabre/menulibre/releases</a>&quot;<br>
+UPSTREAM_CHECK_REGEX =3D &quot;releases/tag/menulibre-(?P&lt;pver&gt;\d+(\=
.\d+)+)&quot;<br></blockquote><div><br></div><div>Have you thought about us=
ing the=C2=A0github-releases class?</div><div><a href=3D"https://git.openem=
bedded.org/openembedded-core/tree/meta/classes-recipe/github-releases.bbcla=
ss">https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe=
/github-releases.bbclass</a></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
+<br>
=C2=A0do_compile[noexec] =3D &quot;1&quot;<br>
<br>
=C2=A0do_install:append() {<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#121387): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/121387" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/121387</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116187911/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116187911/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000007f56ef064338dbeb--

