Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3C2C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 07:56:30 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.15818.1707292581607645051
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 23:56:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z58VLK/+;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33b0e5d1e89so294805f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 23:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707292580; x=1707897380; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ORZg1e+vGLsNiItjKaI388RtGGoYX7h1R4hW3on6GrM=;
        b=Z58VLK/+l8yeiAWht9MPZqL2aCYTyCklknl5CGgaBd9Hg4Ks9KH/PVT3eMs/aU16LD
         s/bzDOOSSktTR3xokxE6z0iieMSllPbbKNdOM7pYLwBgDGXgNCp2X+pfw3kMXPYSzsGP
         aHxfzO+jrQTJtDMUF9HdabyVYixcclTGXudHOhFu7aoWKUmyWSacgqyj895L1DC3Jbgh
         Y96rR3fgcJwlidsuRDL0a7jFUVM3jaIz8sRqL6hx/vhgvX2eBKzgTw0KizVhqSjAbHwd
         7qjHu1ukemUoMKRom/pmIz37jid4IuzklzaS1hkpMPGIUqIKD1WkMCLReYYwi+onIe58
         bBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707292580; x=1707897380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORZg1e+vGLsNiItjKaI388RtGGoYX7h1R4hW3on6GrM=;
        b=pAPdNIL9yDu00ftk2lSeEzwQ3J3jeYgEKP7cfuew6kDJWcDmguYmurmlAFNYpZmSxm
         eDrVFZX7yegs1+NSr8pp/4IR/3Wg5egwnfnsKW4J2abp8qUpEQd5i13acBn/ZnpcKsk6
         Ri15QBYNn7lolFTUxD5OvKlGoqIv7ODMkZKZQC+lGQ/AX2XJTAmMzsSxun2hKJQ0aaXo
         F/lc6VMcQq7IDQPqq23jIgKVlWLW8Ux0Uf3kmMp/6+lo1k/GP9Ii+seycVgXiqn4Je+M
         rD6BKrbEnSroBr9UKcNQuidATBioP7LtsGFrlsPdn8hhjxa8YeZQvg5uIPf3toYIEijH
         4BVg==
X-Gm-Message-State: AOJu0Yx+a1zEBW7YaVGFee9lbhy5CmR0ExM6au2sAME6TGdHMF05iwF4
	4u0a0xJfBEt7GwT3pt7+37tbZPYRebe1qEGGV0AE6WkAg0QIcA5yTDses6jxuwska5f4e8N6dy9
	oCrPp8SAif7iy3b5tXrmnsfobT48=
X-Google-Smtp-Source: AGHT+IEDPBLxQ6DqVecW8M2YI05aG/Pz89VEn/AJgIcndfnaSa5KPzXhAQhbzJFoYKWME1Evcw9Q7bLD2Qqxy4MnitI=
X-Received: by 2002:a05:6000:2a2:b0:33b:3e4c:40b6 with SMTP id
 l2-20020a05600002a200b0033b3e4c40b6mr3420271wry.10.1707292579761; Tue, 06 Feb
 2024 23:56:19 -0800 (PST)
MIME-Version: 1.0
References: <20240207075327.3518669-1-jean-marc.bouche@foss.st.com>
In-Reply-To: <20240207075327.3518669-1-jean-marc.bouche@foss.st.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 7 Feb 2024 08:56:06 +0100
Message-ID: <CA+chaQeA76VOd1LFEMX6qkpVvN4d41a3b0iXYiZ_77=hknMgdg@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] rtkit: missing files/directories in package
To: Jean-Marc BOUCHE <jean-marc.bouche@foss.st.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000be904c0610c607f6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 07:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108650

--000000000000be904c0610c607f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 7, 2024 at 8:53=E2=80=AFAM Jean-Marc BOUCHE <
jean-marc.bouche@foss.st.com> wrote:

> Fix the following error when building the recipe:
>   Files/directories were installed but not shipped in any package:
>   /lib
>   /lib/systemd
>   /lib/systemd/system
>   /lib/systemd/system/rtkit-daemon.service
>
> Signed-off-by: Jean-Marc BOUCHE <jean-marc.bouche@foss.st.com>
> ---
>  meta-oe/recipes-support/rtkit/rtkit_0.13.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/rtkit/rtkit_0.13.bb
> b/meta-oe/recipes-support/rtkit/rtkit_0.13.bb
> index 7ae992503..684f047ed 100644
> --- a/meta-oe/recipes-support/rtkit/rtkit_0.13.bb
> +++ b/meta-oe/recipes-support/rtkit/rtkit_0.13.bb
> @@ -19,5 +19,5 @@ PACKAGECONFIG[systemd] =3D ",,systemd"
>  USERADD_PACKAGES =3D "${PN}"
>  USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --shell
> /bin/nologin rtkit"
>
> -FILES:${PN} +=3D "${libdir} ${datadir}"
> +FILES:${PN} +=3D "${libdir} ${datadir} ${base_libdir}"
>

Use systemd_system_unitdir and if the rtkit build doesn't respect that,
then fix rtkit instead.

meta/conf/bitbake.conf:export systemd_system_unitdir =3D
"${nonarch_base_libdir}/systemd/system"

It's not always the same as base_libdir (e.g. for multilib).

--000000000000be904c0610c607f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 7, 2024 at 8:53=E2=80=AFA=
M Jean-Marc BOUCHE &lt;<a href=3D"mailto:jean-marc.bouche@foss.st.com">jean=
-marc.bouche@foss.st.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Fix the following error when building the recipe:<b=
r>
=C2=A0 Files/directories were installed but not shipped in any package:<br>
=C2=A0 /lib<br>
=C2=A0 /lib/systemd<br>
=C2=A0 /lib/systemd/system<br>
=C2=A0 /lib/systemd/system/rtkit-daemon.service<br>
<br>
Signed-off-by: Jean-Marc BOUCHE &lt;<a href=3D"mailto:jean-marc.bouche@foss=
.st.com" target=3D"_blank">jean-marc.bouche@foss.st.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-support/rtkit/<a href=3D"http://rtkit_0.13.bb" rel=3D=
"noreferrer" target=3D"_blank">rtkit_0.13.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-support/rtkit/<a href=3D"http://rtkit_0.13.bb"=
 rel=3D"noreferrer" target=3D"_blank">rtkit_0.13.bb</a> b/meta-oe/recipes-s=
upport/rtkit/<a href=3D"http://rtkit_0.13.bb" rel=3D"noreferrer" target=3D"=
_blank">rtkit_0.13.bb</a><br>
index 7ae992503..684f047ed 100644<br>
--- a/meta-oe/recipes-support/rtkit/<a href=3D"http://rtkit_0.13.bb" rel=3D=
"noreferrer" target=3D"_blank">rtkit_0.13.bb</a><br>
+++ b/meta-oe/recipes-support/rtkit/<a href=3D"http://rtkit_0.13.bb" rel=3D=
"noreferrer" target=3D"_blank">rtkit_0.13.bb</a><br>
@@ -19,5 +19,5 @@ PACKAGECONFIG[systemd] =3D &quot;,,systemd&quot;<br>
=C2=A0USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
=C2=A0USERADD_PARAM:${PN} =3D &quot;--system --no-create-home --user-group =
--shell /bin/nologin rtkit&quot;<br>
<br>
-FILES:${PN} +=3D &quot;${libdir} ${datadir}&quot;<br>
+FILES:${PN} +=3D &quot;${libdir} ${datadir} ${base_libdir}&quot;<br></bloc=
kquote><div><br></div><div>Use systemd_system_unitdir and if the rtkit buil=
d doesn&#39;t respect that, then fix rtkit instead.</div><div><br></div><di=
v>meta/conf/bitbake.conf:export systemd_system_unitdir =3D &quot;${nonarch_=
base_libdir}/systemd/system&quot;</div><div><br></div><div>It&#39;s not alw=
ays the same as base_libdir (e.g. for multilib).</div></div></div>

--000000000000be904c0610c607f6--

