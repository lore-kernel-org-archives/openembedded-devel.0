Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDDAC433FE
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 08:29:45 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.7269.1666254583665860012
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Oct 2022 01:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EeQOhcEy;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: peron.clem@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id g27so28792812edf.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Oct 2022 01:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHHAM8QpCL9kdz9BztxN1ID5/tLsByn9lPFFMKv/+IA=;
        b=EeQOhcEywAIqojaMurfGjyJ1FjuynhmbREouAAvGi8s7tV8s3S2QH76uzrPh7T3OMj
         atvm8iJLDJNpC4YCZSUfHN8yB1f+vNXZ/VjwhyQcbxhknQ7wPRPGMTVZnwuLoon3sk4W
         3cBjMT3MesnfDA9SdkkC2pf0BosGDXV8yoHmVDmv4Z3GlOH5HmpCu1nxoc1uUjutt3JU
         U10d6P6DDY3T9/qzXMbBol2S8Wj3pYuDVxRWZK9C9uLCiWpKp29PPBgfa3HT4T/JVOGL
         2aPvegxyIfsmYsslmqjI+/gTkFK4yuGkbnz24GQoBGUjRFL9QjWCRw6dh0APnWp6uyRZ
         F8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHHAM8QpCL9kdz9BztxN1ID5/tLsByn9lPFFMKv/+IA=;
        b=lyPe8f/k4r5bCwMYBJyr8NYzgDDWYR1DVpOz/JhrnLvvwar2dj2fYAvNeA1a9NTLrC
         9K9vngv3ACRbJqgYeJB9tNsKphhfJi9CaDyptjySvUhx9Xg7QHwOBM+O0s6+Qn6MFZOA
         0GEQKX7nd+WnXA4za7zfHp7gpCmLKoCJNhPkIPAXt3BaMb0/KLasdHziD+DL0lulgcoS
         XtEX/nTar4x5PYd6mjV45grKbHOM3B99aRPR3p8OGOo98y99NZWjR/P+YaqazT2MiZIr
         XM2cd+/6mR6XDFo6JqX4PAKQXDeR5KA1A4qxrTM13+xt4Pf9LlRBA4ngzyXilrr5H05F
         axmQ==
X-Gm-Message-State: ACrzQf2Gub/hdlVx8wBEoR3X+usY6EUlX941XJmfOFySa5/Ivqu+zyp1
	Tx73eghmE9cnSta8p7qOe5Qul9KCjRyQqkHeQQhBTyL4
X-Google-Smtp-Source: AMsMyM6Hc2vF6bvV8XutzScB4gSJRlU20OaeLDQKJo5kJIa5AkWUJFPmlV/RiFUHIhP49fuVbN10WhipfMXoBedbSQ8=
X-Received: by 2002:a50:ccc2:0:b0:460:4db2:5006 with SMTP id
 b2-20020a50ccc2000000b004604db25006mr1883834edj.369.1666254581337; Thu, 20
 Oct 2022 01:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220908132909.52916-1-peron.clem@gmail.com>
In-Reply-To: <20220908132909.52916-1-peron.clem@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Thu, 20 Oct 2022 10:29:29 +0200
Message-ID: <CAJiuCcc1ejZ6LwbST__2=C2GwEsuwaiCgdTWS5d_8FyiNtHAmw@mail.gmail.com>
Subject: Re: [PATCH] python3: setuptools-git-versioning: new package
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Oct 2022 08:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99249

Hi,

On Thu, 8 Sept 2022 at 15:29, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com=
> wrote:
>
> Add a recipe for python3-setuptools-git-versioning.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>

Sorry I forgot to add Khem in this patch, is it ok to upstream it or
should I resend ?

Thanks,

> ---
>  .../python3-setuptools-git-versioning_1.10.1.bb     | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-setuptool=
s-git-versioning_1.10.1.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-setuptools-git-v=
ersioning_1.10.1.bb b/meta-python/recipes-devtools/python/python3-setuptool=
s-git-versioning_1.10.1.bb
> new file mode 100644
> index 0000000000..9e480ae808
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-setuptools-git-versioni=
ng_1.10.1.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "Use git repo data for building a version number according P=
EP-440"
> +HOMEPAGE =3D "https://github.com/dolfinus/setuptools-git-versioning"
> +AUTHOR =3D "dolfinus <martinov.m.s.8@gmail.com>"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D92e79e3a844e66731724600f3ac9c=
0d8"
> +
> +SRC_URI[sha256sum] =3D "a68f2cd6d261503750fe600ba3c533440c57c1801ed74317=
5c387e9b3e80f44e"
> +
> +DEPENDS +=3D "${PYTHON_PN}-toml ${PYTHON_PN}-packaging"
> +
> +inherit pypi setuptools3
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>

