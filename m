Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79E94D2A536
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 17:03:58 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.28778.1729098223497522337
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 10:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AygpgRC6;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5eb5be68c7dso70972eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 10:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729098223; x=1729703023; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poWiYUFDCq5Y1JIXp8FdKMI0Gim6ucuqlymid9anbgU=;
        b=AygpgRC6ilcmOawt6HV8gUYcbNrHKJJRQRqIskioSHndK1+CQUsCEtOHCP5Z35+5Xo
         utyIJW6yDRgAaO0R3r8EAKNfHOSEbmNROpUExYjaUw/Byw/Am9ajejieMtKzC2n9fL1p
         5M1DCOyT11Qkn19nrUqeIStc2M7Y0sSxzVJ3AHYn2GS9mNbpZf2oqLIx8LuE1EsjWS6n
         i3kRw1RvEFsUYBnk/bafh+tiewXL3lbP346fTOCqFsyumtRGWsZ3lYN1HGQDp8tL4Atd
         oFAgl4MLKfZfgn0VgrE1Y69FQEXCbDa8Nt/WIcvh/03ELOW607f7Tby+0Yi6kxq0GUfT
         ZG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729098223; x=1729703023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=poWiYUFDCq5Y1JIXp8FdKMI0Gim6ucuqlymid9anbgU=;
        b=JtrBZMY6lcerod6EIwOyc6ynZo3EssCQqBZMrDm/SGo9R4bMka4POI4OmqzMQPtG2c
         LPjcnnYoC+idCuDYAq3kb64uNk54SYamB9as7HuUQvGS0s83Qu9pRBlUKGg4LAeQRgxM
         jacW+tvGOlfGH8g+fnmwnTLNRkleWzgb1PD4r8A6GuQa3yUf9VUs1qlRW/aRIA9sK0eA
         6zSL4J96A5N3Xgcjx4N714ICYoAiTLTJoNQDBiSfqGww3/KXWOpaxwlW++nMYl7/5M1M
         GXvE+i7/dQwDe13hTReOnVRfEZbNdqE2lvmz48WDZyoWnrCn1wkgMMT5tTTsQ+1rYd+p
         M8tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPjnTbFPqeyYsiXnuVzxUGs5yNXEqSnnnh8yWoys/N34OgYAi3pXTRKg5QLHeQpaGvLukUEMQ4YWGYNT0mESu4E3Q=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz4FDnhAvTZqt67r0HGwbqxuDXYbuH8yH5/b/uKJdi8yj7wAItb
	NxyHhCLW0VsY4rc2mB72qNcWHpKgzUIcZIvmnBK/UkIwCJ8cA7ByEs0aAj6vBN3AnvVxs8mvzBX
	SoWMVY1axBekvH9dpdAVWnYj0ot4=
X-Google-Smtp-Source: AGHT+IEZg0B8+wWndREb60dU9IJcFug/S7C3DWC2kHCwBGZnCVecIbLqOWleR4Of9lMNOSk0EqFiNz6Og/S/2pKeNoI=
X-Received: by 2002:a05:6820:22a4:b0:5e5:c49a:b53 with SMTP id
 006d021491bc7-5eb1a1d42c5mr11099658eaf.7.1729098222617; Wed, 16 Oct 2024
 10:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20241008075235.349939-1-kai.kang@windriver.com> <CA+chaQeshT35SaqOVfZhpA5qkaj3Hi3rGroFmBbwcJ9zP4nXQg@mail.gmail.com>
In-Reply-To: <CA+chaQeshT35SaqOVfZhpA5qkaj3Hi3rGroFmBbwcJ9zP4nXQg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Oct 2024 10:03:16 -0700
Message-ID: <CAMKF1sqF0rhehci9zVQiTxUMG0mXZcNvPrYCm_w4bX9kHe0X-g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xmlrpc-c: 1.59.01 -> 1.60.03
To: martin.jansa@gmail.com
Cc: kai.kang@windriver.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 17:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112940

On Wed, Oct 16, 2024 at 8:19=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> This seems to cause random build failure in some builds:
>
> rm -f libxmlrpc_util.so.4
> rm -f libxmlrpc_util.so.4
> ln -s libxmlrpc_util.so.4.60 libxmlrpc_util.so.4
> ln -s libxmlrpc_util.so.4.60 libxmlrpc_util.so.4
> rm -f libxmlrpc_util.so
> ln: failed to create symbolic link 'libxmlrpc_util.so.4': File exists
>

seems like a race condition, I have not yet hit it in the CI builds
that I have tried, but perhaps something to debug into

> On Tue, Oct 8, 2024 at 9:52=E2=80=AFAM Kai Kang via lists.openembedded.or=
g
> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > From: Kai Kang <kai.kang@windriver.com>
> >
> > Update xmlrpc-c from 1.59.01 to latest stable version 1.60.03. The
> > SRCREV is one more fix commit after release 1.60.03 in the stable
> > series. And remove 0002-fix-formatting-issues.patch which has been fixe=
d
> > in upstream.
> >
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> >  .../xmlrpc-c/0002-fix-formatting-issues.patch | 34 -------------------
> >  ...mlrpc-c_1.59.01.bb =3D> xmlrpc-c_1.60.03.bb} |  5 ++-
> >  2 files changed, 2 insertions(+), 37 deletions(-)
> >  delete mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0002-fix=
-formatting-issues.patch
> >  rename meta-oe/recipes-devtools/xmlrpc-c/{xmlrpc-c_1.59.01.bb =3D> xml=
rpc-c_1.60.03.bb} (92%)
> >
> > diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0002-fix-format=
ting-issues.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0002-fix-for=
matting-issues.patch
> > deleted file mode 100644
> > index 9d92e4712..000000000
> > --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0002-fix-formatting-is=
sues.patch
> > +++ /dev/null
> > @@ -1,34 +0,0 @@
> > -From 14f15cb0f03defa8efb4c8e2fece58e50655be6b Mon Sep 17 00:00:00 2001
> > -From: Hongxu Jia <hongxu.jia@windriver.com>
> > -Date: Sun, 23 Jul 2017 22:20:29 -0400
> > -Subject: [PATCH] src/xmlrpc_server_abyss.c: fix formatting issues
> > -
> > -Fixed when compile with "-Wformat -Wformat-security -Werror=3Dformat-s=
ecurity":
> > -|src/xmlrpc_server_abyss.c:771:13: error: format not a string literal
> > -and no format arguments [-Werror=3Dformat-security]
> > -|             xmlrpc_faultf(envP, error);
> > -|             ^~~~~~~~~~~~~
> > -
> > -Upstream-Status: Pending
> > -
> > -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ----
> > - src/xmlrpc_server_abyss.c | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/src/xmlrpc_server_abyss.c b/src/xmlrpc_server_abyss.c
> > -index 2388652..3843f10 100644
> > ---- a/src/xmlrpc_server_abyss.c
> > -+++ b/src/xmlrpc_server_abyss.c
> > -@@ -768,7 +768,7 @@ createServer(xmlrpc_env *                      con=
st envP,
> > -         ServerInit2(abyssServerP, &error);
> > -
> > -         if (error) {
> > --            xmlrpc_faultf(envP, error);
> > -+            xmlrpc_faultf(envP, "%s", error);
> > -             xmlrpc_strfree(error);
> > -         }
> > -     }
> > ---
> > -2.8.1
> > -
> > diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb b/me=
ta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
> > similarity index 92%
> > rename from meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb
> > rename to meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
> > index 5d5152b83..a34256c27 100644
> > --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb
> > +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
> > @@ -7,10 +7,9 @@ LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3Daefbf81=
ba0750f02176b6f86752ea951"
> >
> >  SRC_URI =3D "git://github.com/mirror/xmlrpc-c.git;branch=3Dmaster;prot=
ocol=3Dhttps \
> >             file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc=
.patch \
> > -           file://0002-fix-formatting-issues.patch \
> >             "
> > -#Release 1.59.01
> > -SRCREV =3D "352aeaa9ae49e90e55187cbda839f2113df06278"
> > +# one more commit after Release 1.60.03 in the Stable series
> > +SRCREV =3D "a823b0bb5cf0a4dbd34f929cbfdfb0439c5d9b0e"
> >
> >  S =3D "${WORKDIR}/git/stable"
> >
> > --
> > 2.34.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112939): https://lists.openembedded.org/g/openembedde=
d-devel/message/112939
> Mute This Topic: https://lists.openembedded.org/mt/108885171/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

