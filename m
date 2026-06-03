Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A22FCD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 16:08:01 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24161.1780502879552300804
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 09:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kn1r+Nne;
 spf=pass (domain: gmail.com, ip: 74.125.224.47, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6608c1a4215so1409471d50.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 09:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780502879; cv=none;
        d=google.com; s=arc-20240605;
        b=TRPbQ9gXkWaTSKWD0eCo5WAWNo8WcT2r1+KVSZeU1/5x53u4oRvabs1ZZqbIuytA+l
         zXYsamVl0OmqylpSN9DbitdejBP8up6ifRSS+KbLJzEDQ/obhz+M8Q3RPkCc+mBOcisr
         +vwvBDjADZFmk65TMXIOlESO+/qh2r17PMPuJIxWt7jqUcF2t9fOgLs+uLXse0NUrsZi
         MpY6y1l3n+5oQN+FbKVpd099uxzOB64/SNW6dEOrucWBv8hclO51qq0Oem/V8aa+nCSx
         E805pwd0hiRr/4VVmYkDO9VtIjjOy3ucSjoyZyUHbKnCgsdjLQr1yZfLf/QmecQjnVyX
         wreg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cMZtEFTbivEK5kYHopDnX5xD0WusqiBof4WlDfuAGcs=;
        fh=hpHyn1SZGF5B1sAKCpQgaikPjM5z6Dw7D8179CFCpdE=;
        b=ZjOKYpgb+IcdN5GHDDX5gOxgvlQH3L8jU8X3iHMsqOfQ/xXpGWtPbH/meTR4Dwp5d+
         nOj7FfEl7Sy3ct8a/judoJknfz/xKbSGA3M9+m7jU0D0kQbsAG0Co6RetQlmvsa2cASj
         wMTWSpvtjXTDKwOdnh+K1w/bWVi9I3xUAEWmdbm2psozV6EJnTYOn0Y+VkvP1M6FjUF/
         AWDUSh0/k5rMwBQMX8TL4ADtU+2fuoWcIZumXNyAhpmr+FhkFfRpJIqX8vAaZyggp1OM
         cd17w0M3NLmi4TQ0M28kApHiZNgbYyr6pBFO6A5jjlmeTUBiPlF3+OqP3PjkPjpHx4Sm
         5+Yg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780502879; x=1781107679; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cMZtEFTbivEK5kYHopDnX5xD0WusqiBof4WlDfuAGcs=;
        b=Kn1r+Nne5xMgVPTDlE4fHGpCgvCaG25MrL9kVO1T1/Q5W9t6uGdg6WKEOm96tWeWyk
         4e4KdrqUisjjJT1cFs2Utzc0Gyh4IP3iL3I/FNJtZHjDB7fJfekKGER2Q8oRgPBOt1eg
         fKuH95Egfl4Kscxq54I6i70Y0j+V7lQrNeTJk7yFAgh0PfqePqpZR7IGqLX28r102sQ0
         USGgZfglDfOKC5uO65XIYnoDkGE7t6D/e1Z/VfIdMWo3DUtnjSlXMgDZC6b0Qq06562p
         ykSNaFkCi98a3H+z6xYcau9hLEKGvay1D33hyGq2Y0gHtUKueXp74E4PVRS/YbWRWyUi
         W36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780502879; x=1781107679;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMZtEFTbivEK5kYHopDnX5xD0WusqiBof4WlDfuAGcs=;
        b=TL5alkiD6aUSHQQNAKtWugEp+SSljGYCPTDwGUcPU88zItfQfnqvuEXx+/MCBw32eW
         9ck82UNPIAKp/ktkebM/gp2e3pafC8rj2gsSs6Qe5LvTaXrffc8sZ+vgHyAJcD++5TDf
         6U4guujRLq2wxZWd9fHcSkjt/Y7TljmgiqZqMjIq/QXwEtdoOtx4slOOzI7UnZj5/iFN
         JJoQGi9yU/LaQUdAZt3pQ5Kd/SKiFSAUo70WN4RF1w4+KyiWt40HIC8WQZJQYQtfpf2x
         gg0RwIL77zyIAYje3Ywk6khoHl31nqX8P8SesHPar4TmUFYWWXZND8a5tE7TzSc4Ieqk
         8xoA==
X-Forwarded-Encrypted: i=1; AFNElJ+CaSwgtTJVkrRrgrdpiJDLw/lunfXwPnKvubSiSXQB6VYvwf8zhfcSyo5gWWuwdibij0ydhIYe/vabctpL8XNsFO4=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9b/Y0A+/OF0P+Ly/OU+wwqHxyshBG+uSDyrEz7uozjkO/pfzW
	gQaozsdPQtrO1pKgSUtmExxJDrB520hZH4xF3MQy8HmVNmud8kuFmvkzuJ4Cmmloh65gAzBAgV6
	ZPAJKC/loN9iI97D0QYM8ceJeiH3rbhY=
X-Gm-Gg: Acq92OHK4YU6Vl6YJcXn3xR141yhe5ApWy2hRuLed9S2+aRV4qWrHHY7Wl2XTN5kMiH
	W497quiAF1JhU+XurBTeMTK5hf0MDiaXTY0z10dmZbw9Q2pDbzc73Q3rKKOudMhK5SPIhK1xsNn
	pIWtrRB7N/GCqNHAqneEaA6L8SSSn18Je7kYMqqwCgSSLVFm3B34QjPA2shWdv/oFpGMMGSLsX1
	NUxdWjjRqwFIJfxB3o+0IVR7+XDAVAFgN6zxrnGrYiQEEtTFEklK+bMEGc4umMYQXmNBiziD1Dv
	8RvnpzduYVa1dZqCXZV2NoWjRJOkHtbbkevuLaMa3wFEeQvssZLOwJR+W0yJP+2EpRf48wMFuIL
	2KfIFTpKJq45vjwF0Lz5rKCD/pzajHs/XPQ/IaAutChc8ZTaOR8n9KVYMUEWwzJ/jL4GD2EKkbN
	/TlOeXu9hMrxPYMeMVTnL3uA7oAQo=
X-Received: by 2002:a05:690e:d0b:b0:660:9c4e:a43f with SMTP id
 956f58d0204a3-660f1207734mr28526d50.13.1780502878332; Wed, 03 Jun 2026
 09:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260602222336.3053573-1-a-christidis@ti.com>
In-Reply-To: <20260602222336.3053573-1-a-christidis@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Jun 2026 18:07:32 +0200
X-Gm-Features: AVHnY4KUTED4DMfUxx8_b3e1YdbKe7I33rkdDJV1JOWCBG3zHryDgj0bcor35rY
Message-ID: <CAMKF1srxWHGzpkV2sinvPVzw+TF=Kk-RHkv5=3bp10pUUjFN2w@mail.gmail.com>
Subject: Re: [meta-oe][master][PATCH] ktx-software: Version change 4.4.0 -> 5.0.0
To: a-christidis@ti.com
Cc: reatmon@ti.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000095a9e306535ba124"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 16:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127383

--00000000000095a9e306535ba124
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 12:23=E2=80=AFAM <a-christidis@ti.com> wrote:

> From: Antonios Christidis <a-christidis@ti.com>
>
> Major 5.0.0 version update. On top of new features, this version fixes
> compilation issues with GCC 16 and C++20.
>
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>  .../{ktx-software_4.4.0.bb =3D> ktx-software_5.0.0.bb}         | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-graphics/ktx-software/{ktx-software_4.4.0.bb =3D>
> ktx-software_5.0.0.bb} (84%)
>
> diff --git a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
> b/meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
> similarity index 84%
> rename from meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
> rename to meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
> index ae4caeb89c..ba9eaf2def 100644
> --- a/meta-oe/recipes-graphics/ktx-software/ktx-software_4.4.0.bb
> +++ b/meta-oe/recipes-graphics/ktx-software/ktx-software_5.0.0.bb
> @@ -6,10 +6,11 @@ LICENSE =3D "Apache-2.0 & BSD-1-Clause & BSD-2-Clause &
> BSD-3-Clause & BSL-1.0 \
>            & CC-BY-3.0 & CC-BY-4.0 & CC0-1.0 & Zlib & MIT & HI-Trademark =
&
> fmt & \
>            Kodak & PNGSuite & ETCSLA & Cesium-Trademark-Terms"
>
> -LIC_FILES_CHKSUM =3D
> "file://REUSE.toml;md5=3D45910de791d599e6ba472f6fa506f391"
> +LIC_FILES_CHKSUM =3D
> "file://REUSE.toml;md5=3D9f87c97ba36aab42411bf93c094a61f2"
>
>
What changed in license ? Please document that with a proper tag in the
commit message.


>  SRC_URI =3D "git://
> github.com/KhronosGroup/KTX-Software.git;protocol=3Dhttps;branch=3Dmain;l=
fs=3D0"
> -SRCREV =3D "beef80159525d9fb7abb8645ea85f4c4f6842e8f"
> +
> +SRCREV =3D "6269d2752ed04446c2d4749f54f3aad4f94555b5"
>
>  inherit cmake
>
> --
> 2.34.1
>
>

--00000000000095a9e306535ba124
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 3, =
2026 at 12:23=E2=80=AFAM &lt;<a href=3D"mailto:a-christidis@ti.com">a-chris=
tidis@ti.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Antonios Christidis &lt;<a href=3D"mailto:a-christidis@ti=
.com" target=3D"_blank">a-christidis@ti.com</a>&gt;<br>
<br>
Major 5.0.0 version update. On top of new features, this version fixes<br>
compilation issues with GCC 16 and C++20.<br>
<br>
Signed-off-by: Antonios Christidis &lt;<a href=3D"mailto:a-christidis@ti.co=
m" target=3D"_blank">a-christidis@ti.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://ktx-software_4.4.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">ktx-software_4.4.0.bb</a> =3D&gt; <a href=3D"http://ktx-softw=
are_5.0.0.bb" rel=3D"noreferrer" target=3D"_blank">ktx-software_5.0.0.bb</a=
>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-graphics/ktx-software/{<a href=3D"http://ktx-s=
oftware_4.4.0.bb" rel=3D"noreferrer" target=3D"_blank">ktx-software_4.4.0.b=
b</a> =3D&gt; <a href=3D"http://ktx-software_5.0.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">ktx-software_5.0.0.bb</a>} (84%)<br>
<br>
diff --git a/meta-oe/recipes-graphics/ktx-software/<a href=3D"http://ktx-so=
ftware_4.4.0.bb" rel=3D"noreferrer" target=3D"_blank">ktx-software_4.4.0.bb=
</a> b/meta-oe/recipes-graphics/ktx-software/<a href=3D"http://ktx-software=
_5.0.0.bb" rel=3D"noreferrer" target=3D"_blank">ktx-software_5.0.0.bb</a><b=
r>
similarity index 84%<br>
rename from meta-oe/recipes-graphics/ktx-software/<a href=3D"http://ktx-sof=
tware_4.4.0.bb" rel=3D"noreferrer" target=3D"_blank">ktx-software_4.4.0.bb<=
/a><br>
rename to meta-oe/recipes-graphics/ktx-software/<a href=3D"http://ktx-softw=
are_5.0.0.bb" rel=3D"noreferrer" target=3D"_blank">ktx-software_5.0.0.bb</a=
><br>
index ae4caeb89c..ba9eaf2def 100644<br>
--- a/meta-oe/recipes-graphics/ktx-software/<a href=3D"http://ktx-software_=
4.4.0.bb" rel=3D"noreferrer" target=3D"_blank">ktx-software_4.4.0.bb</a><br=
>
+++ b/meta-oe/recipes-graphics/ktx-software/<a href=3D"http://ktx-software_=
5.0.0.bb" rel=3D"noreferrer" target=3D"_blank">ktx-software_5.0.0.bb</a><br=
>
@@ -6,10 +6,11 @@ LICENSE =3D &quot;Apache-2.0 &amp; BSD-1-Clause &amp; BSD=
-2-Clause &amp; BSD-3-Clause &amp; BSL-1.0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp; CC-BY-3.0 &amp; CC-BY-4.0 &a=
mp; CC0-1.0 &amp; Zlib &amp; MIT &amp; HI-Trademark &amp; fmt &amp; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kodak &amp; PNGSuite &amp; ETCSLA =
&amp; Cesium-Trademark-Terms&quot;<br>
<br>
-LIC_FILES_CHKSUM =3D &quot;file://REUSE.toml;md5=3D45910de791d599e6ba472f6=
fa506f391&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://REUSE.toml;md5=3D9f87c97ba36aab42411bf93=
c094a61f2&quot;<br>
<br></blockquote><div><br></div><div>What changed in license ? Please docum=
ent that with a proper tag in the commit message.</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/KhronosGroup/KTX=
-Software.git;protocol=3Dhttps;branch=3Dmain;lfs=3D0" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/KhronosGroup/KTX-Software.git;protocol=3Dhttps;b=
ranch=3Dmain;lfs=3D0</a>&quot;<br>
-SRCREV =3D &quot;beef80159525d9fb7abb8645ea85f4c4f6842e8f&quot;<br>
+<br>
+SRCREV =3D &quot;6269d2752ed04446c2d4749f54f3aad4f94555b5&quot;<br>
<br>
=C2=A0inherit cmake<br>
<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--00000000000095a9e306535ba124--

