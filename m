Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BB8C52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 21:14:07 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.57793.1723497242928179427
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Aug 2024 14:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aJYOAFJ6;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5d5ed6f51cfso3258360eaf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 14:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723497242; x=1724102042; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjhCUx1GJsKpVH/B+VCZzrknYFGJdO1Q8gPqzX5w38g=;
        b=aJYOAFJ6Whkz8o0BvA4tfD4DsDurNWuW2Dua/8HaUIC3Qe7wIHrNxPw+Z0iLb6W8WQ
         Yv8eG1reiPAdXlgSHcYxVkvI18np+4pVufIcpvm7KCU+VrhXIvxH5RNC38qeIUmln5KG
         E5iSIqXLQURaUCFJCx+KSQOyd+eCFWHKJ0SLDQax2LV/zLSK2rLyUUSeYle1t88dL4Do
         b96GXeQBeh/goXbh7ozU7FhCIdJWwvnW5XajxiErwxJNRqFOJuzA77xYqbdmJX2F7NUE
         6b4V7BdwT0Es/hnMXKRS9PZ36JNwj+x9NNAw3tMuOFBJ7Fd8O7f/CKmC6lANqiNHXh6j
         520A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723497242; x=1724102042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjhCUx1GJsKpVH/B+VCZzrknYFGJdO1Q8gPqzX5w38g=;
        b=knezFOSs/dURvefIcOHmqx8XR0M6QlMEz3XJYtGdJiDzmGbVg2m23dGK6N6LVNvgvo
         VnYZxptYoUplM+bk1tuuWg0ntSrqIQ7LTRDl0pEzw/4oQFjiSGfJyiUQY0x8TN0ic5sV
         Y5Ryn1/qCVn3HjNz391dHvLTcBYTrAQba5wVAzwACAploBdz+L5NhS6Qc24vIZU0nG8S
         ymI5An6GEw1zzLEPYU8qofzTJBkT4m18sbgqXMkZtv8mgGxTiX5EJvykDEUQq83yom5K
         L/2UCIBKpWS4novO3iBiVgihBLuA1R77xmJFdjkfBJqrmtw2NnlkW0xIGNPrre3ayCJJ
         IkcA==
X-Gm-Message-State: AOJu0Yy9ceeuKvrgVB3N9FYfl6bcPDAnykqWbw4Lw4VDBRsr7yMWORkX
	omczDMRxM4O9OiGQXkob5q0Q9y7jSUjzj8mqMOfW1XJNs2fh3MyKfWXKxdMpB/7G2MJXLNC/nOQ
	O1gllict4syE1BrDtV714VavOFr0=
X-Google-Smtp-Source: AGHT+IECDZO1AJ9UYhBpukS4DAm6/KFgYnXjCMUJQ/peowBGJbuUxilRv5hQauY/t+HnEdpdi8ldHAcvzi0sJlPPoZc=
X-Received: by 2002:a05:6820:821:b0:5d8:ebe:23fb with SMTP id
 006d021491bc7-5da689ce23amr2277415eaf.7.1723497242103; Mon, 12 Aug 2024
 14:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240812211207.1450248-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20240812211207.1450248-1-Randy.MacLeod@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Aug 2024 14:13:36 -0700
Message-ID: <CAMKF1soZsRJwVE6wYbHjCGh_UvUXzxNNUT0D-+yGDNRLx=ASmA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][v2 PATCH] liblinebreak: remove obsolete library
To: randy.macleod@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 21:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111783

I have rebased it on master already, please check master-next if its alrigh=
t.

On Mon, Aug 12, 2024 at 2:12=E2=80=AFPM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> liblinebreak has no users in meta-oe or in the layer index:
>    https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3D=
depends%3Aliblinebreak
> so remove it.
>
> The upstream is has not been maintained for some time:
>    https://vimgadgets.sourceforge.net/liblinebreak/
> and they say that liblinebreak has been superceded by libunibreak,
> an equivalent library that works in more languages:
>    https://vimgadgets.sourceforge.net/libunibreak/
>
> Since there are no users of liblinebreak, libunibreak was not packaged.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  .../liblinebreak/liblinebreak_2.1.bb                | 13 -------------
>  1 file changed, 13 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/liblinebreak/liblinebreak_2.1=
.bb
>
> diff --git a/meta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb b/m=
eta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb
> deleted file mode 100644
> index c6caf450a..000000000
> --- a/meta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -DESCRIPTION =3D "Liblinebreak is an implementation of the line breaking =
algorithm as described in Unicode 5.1.0 Standard Annex 14, Revision 22"
> -HOMEPAGE =3D "http://vimgadgets.sourceforge.net/liblinebreak/"
> -SECTION =3D "libs"
> -LICENSE =3D "Zlib"
> -LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Df89a1ce02e2dba48c1c0a8e603846=
4c2"
> -
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/vimgadgets/liblinebreak/${PV}=
/liblinebreak-${PV}.tar.gz"
> -SRC_URI[sha256sum] =3D "dd8cba554d260cf686865cc53d0c6be98102a80f56f8152c=
a5e7307bf06a66b8"
> -
> -UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/vimgadgets/file=
s/liblinebreak/"
> -UPSTREAM_CHECK_REGEX =3D "${BPN}/(?P<pver>\d+(\.\d+)+)"
> -
> -inherit autotools
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111782): https://lists.openembedded.org/g/openembedde=
d-devel/message/111782
> Mute This Topic: https://lists.openembedded.org/mt/107865398/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

