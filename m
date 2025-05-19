Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E75AC3ABC9
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 01:58:20 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.41943.1747619894321423624
 for <Openembedded-devel@lists.openembedded.org>;
 Sun, 18 May 2025 18:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XiaQsvEZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2c2ada8264aso1715052fac.2
        for <Openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 18:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747619893; x=1748224693; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwB4IJKZlWgeBr5m2f6XgUaTbk8WYN1BflowDqaZnMg=;
        b=XiaQsvEZREBB3PuAs71JCz5C79HaSfdF0PgfbbWeAHtIkeJKZr7lHoVuGTPZ8ufXAu
         lAenK1ggsRurDKFLRhSId+Fqx+vKiN+c54xQJ+Q7snQoAPGQwZ2x9AE6VGAGxmBsAH9K
         0rymPfvbcA8Zs3X2rDbV3u0KtspUQIeiM7mOQZULP0L7yWfiiXtdJlO+Hqf1evCPVg+s
         1n6Uwom7acx1ip1XFPABNd3rLouFebL0sRNQIzOKApqlpjKc8RLOMdlzWyA+q0o2Bm12
         EzIYdLJzTc0uJewwSDZHGvQah5QW1ugTwIga9KBbzffh3nL3quFdIXvM0WvsrpAGM6mT
         oN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747619893; x=1748224693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwB4IJKZlWgeBr5m2f6XgUaTbk8WYN1BflowDqaZnMg=;
        b=caH2RoW2JA0lRiNbB/3szRHWj50TEYppvny8ai5fIwY74FLqzZbgBSpzW9kbi/Ytgd
         WYI2tjiWw5xo/neozvS/28nx3NZ4O1BrSqpsPkADE9fQJ1WbgAvuLUgVm6BH30/RntTU
         hzoIqv5A2gr5D533gmMLv43W9KK+GC+5iBg8gR5SGPYfiz7Ouc1R+grZxwPzsO/Pmcr0
         NHFzNNOoH4kwCtImbGwK0T6cuu67AZLlUNQJoUYsPALx15JnK1yej/lbzjSDSJLnJqei
         dc+A7i0+3Dj1p1/EEQ9WeAlJogfGZbjlpWP8x7FIiBD2zmBJUC9+F7AB+HXTMyBOqUWU
         vRBA==
X-Gm-Message-State: AOJu0YxUnRGnHIQdSLBIPunD7q5SfyCKOxs+NHqjD3PQfQI/vQ6OqSrH
	t3uRhe0QUKjqdDNELK9ijrXlbSFb7uxNTUVClmIBVhnrU87d7+rPHiaR8tciRcwhqJsvb4pTPjK
	A6rHLCi21cTdiVNx9kDpYur7VRyLvL7Ji/OUt2eE=
X-Gm-Gg: ASbGncsmhDGTC9kGX9E5gh7G00cV8t2sVdtyZ5t6OulXYYyTQuDad2j/sVbMa7bRoi2
	2SZITeDD8wUoBQ6tsNDeMXxULIg4Rz/Kz2hdeScCWHC7ZifT2jEQTQA/OOKmpfUsZw75sn3CIDu
	QbU2XwUS9juUicZtRvsV6mtcOtXkP6EIk=
X-Google-Smtp-Source: AGHT+IHqv88LVh7tKNZhWShR8c65KXKje1bvQBeGLaRWJ8S5hOrt/0leTUpjZA9rPA/PvGG3B0MOGqmFqB5rvGgY/Wk=
X-Received: by 2002:a05:6870:179a:b0:2c2:588a:70a3 with SMTP id
 586e51a60fabf-2e3c1ea2c0dmr5447953fac.24.1747619893359; Sun, 18 May 2025
 18:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250519010221.282882-1-dimitris@siganos.org>
In-Reply-To: <20250519010221.282882-1-dimitris@siganos.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 18:57:47 -0700
X-Gm-Features: AX0GCFvEl4rYXXOsqiRHa1xjZTS6AbsAAgzTS4ABOypMXQJtDHZHLFyBzToxIFg
Message-ID: <CAMKF1spvtZ8z-2m7LgZQkEs7KJjQSFeki9VbPJa=VmKfpk7reQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] bvi: add new package
To: dimitris@siganos.org
Cc: Openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 01:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117469

On Sun, May 18, 2025 at 6:02=E2=80=AFPM Dimitrios Siganos via
lists.openembedded.org <dimitris=3Dsiganos.org@lists.openembedded.org>
wrote:
>
> bvi is a visual editor for binary files
>
> Signed-off-by: Dimitrios Siganos <dimitris@siganos.org>
> ---
>  meta-oe/recipes-support/bvi/bvi_1.4.2.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-support/bvi/bvi_1.4.2.bb
>
> diff --git a/meta-oe/recipes-support/bvi/bvi_1.4.2.bb b/meta-oe/recipes-s=
upport/bvi/bvi_1.4.2.bb
> new file mode 100644
> index 0000000000..b0081794d0
> --- /dev/null
> +++ b/meta-oe/recipes-support/bvi/bvi_1.4.2.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Binary VI editor"
> +DESCRIPTION =3D "bvi is a visual editor for binary files."
> +HOMEPAGE =3D "https://sourceforge.net/projects/bvi"
> +SECTION =3D "console/utils"
> +LICENSE =3D "GPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da36207309d382da27cd66fdaae922=
e3c"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/bvi/bvi-${PV}.src.tar.gz"

Maybe use
${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz

> +SRC_URI[sha256sum] =3D "4bba16c2b496963a9b939336c0abcc8d488664492080ae43=
a86da18cf4ce94f2"
> +
> +DEPENDS +=3D "ncurses"
> +
> +# The project uses old style C interfaces and it is not compatible with =
C23
> +# it builds fine with C17, specifying gnu17 as the C dialect to use
> +CFLAGS:append =3D " -std=3Dgnu17 -Wno-old-style-definition"

There is a patch attached to https://sourceforge.net/p/bvi/bugs/16/
perhaps this can be used and above flags avoided.

> +
> +inherit pkgconfig autotools-brokensep
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117467): https://lists.openembedded.org/g/openembedde=
d-devel/message/117467
> Mute This Topic: https://lists.openembedded.org/mt/113185078/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

