Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADFAC433F5
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 02:27:14 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.2084.1643336833421808137
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 18:27:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cb0zRRiz;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id w8so4385985qkw.8
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 18:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=icVYChKJDrTjiySH1/oCLT82VGruXWE7vM6+VK1QrGQ=;
        b=cb0zRRizHhIsr8OJ7unikDnBah4XxHtRf/EVi/zBjQg3VMGAFZDqzvSOie4yJ2W8ro
         6ual5Lxjvxk/Zwj+I7W03e1dFs66kg+G1tWT111C/h/NHV6XEC55ZJdDNgDZHWK0yWS2
         OZRP3WkrDECshSkYEKhDiHhuV1Dg9E7tDIPHAB4lzEtAYKuvD3YfC/+w2aFN5ZLHq3qJ
         1nPO9Uo8w7gmSL6QwnY0uryXLI5iCTkUK03VS9cqli7E5/olV1DOHyA86Sq1I+3w9Jj2
         jFlxpbEuDR0DWY2uH9IMKL5dsEWm1yaPk37SpJKyUr1XSH09NT/HDAYwH40rxdNiAmqd
         XVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=icVYChKJDrTjiySH1/oCLT82VGruXWE7vM6+VK1QrGQ=;
        b=WKitY3JW9s7qo34bktIqCvECBfmxP4swlKQSN3bYdCwCBoX9oDojfsk4gFJO4xE+X0
         Aro8YY98TnYULUMe6O2OO5aOU5kA6Dz1tdie/ljsnlOgj7mfdgMV4oiWmhPQlQ3yoD5T
         Y4UHP1t5ISrS1x8oIeZtS2DfOzq39RM7s9p3OXfR+Q5lZUwirqLTwdGm6eeJZ6JXvgSm
         N2l46K19+fi7rF3GoIiOCqnBGlgYqLj1OUmpuwU8A7UeCvxMsbZOpicvfDCRZ/CBZVx6
         GSz3fzv0z/tO/u+20gug5S/SFFWei+WDmwmyg5H0r7P2D41AmiYgbTyHhDkbdd2CwM1u
         PYfA==
X-Gm-Message-State: AOAM530rI6i/tz0qv+Ox7NGoesrV+8zmR1SvLNsTuo2TqNlMfNG/UGpP
	n3ph+ZME8I4Q/lCZdhgJxnsS4F27//FyuoBAeXo=
X-Google-Smtp-Source: 
 ABdhPJypi3vN9oFpYPDCt56Yz1JCA48CnOXCSrGiKJboNHQaOlYrxkyPduwnHdT860YrYLwjw1Ek2PJDv48GK9lZL4w=
X-Received: by 2002:a05:620a:2010:: with SMTP id
 c16mr4628041qka.149.1643336832408;
 Thu, 27 Jan 2022 18:27:12 -0800 (PST)
MIME-Version: 1.0
References: <20220128013536.2809159-1-limon.anibal@gmail.com>
In-Reply-To: <20220128013536.2809159-1-limon.anibal@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jan 2022 18:26:46 -0800
Message-ID: 
 <CAMKF1sog0kc5MYaZzJ161L+g4JgFBUKjg0D4UNKNJQZKznU2Wg@mail.gmail.com>
Subject: Re: [oe] [meta-openembedded][PATCH 1/2] meta-oe/recipes-devtools: Add
 python3-apt bindings
To: "An?bal Lim?n" <limon.anibal@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal@rzerosystems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 02:27:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95137

On Thu, Jan 27, 2022 at 5:35 PM An?bal Lim?n <limon.anibal@gmail.com> wrote=
:
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal@rzerosystems.com>
> ---
>  .../python/python3-apt_2.3.0.bb                 | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb
>
> diff --git a/meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb b/meta-=
oe/recipes-devtools/python/python3-apt_2.3.0.bb
> new file mode 100644
> index 000000000..4e7138b33
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python3-apt_2.3.0.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Python-apt is a wrapper to use features of apt from python.=
"
> +LICENSE =3D "GPLv2 & Permissive"

Permissive is not a standard SPDX license. So please explain it better.

> +LIC_FILES_CHKSUM =3D "file://COPYING.GPL;md5=3D0636e73ff0215e8d672dc4c32=
c317bb3 \
> +                    file://debian/copyright;md5=3D4ed7b6862ca422678b17e7=
d4ed592285"
> +
> +SRC_URI =3D "git://salsa.debian.org/apt-team/python-apt.git;protocol=3Dh=
ttps;branch=3Dmain"
> +
> +SRCREV =3D "6145b6484d220685edfd922d364afbf065127efe"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit setuptools3
> +
> +DEPENDS +=3D "apt"
> +RDEPENDS:${PN} +=3D "apt python3-core"
> +
> +FILES:${PN} =3D "/usr/lib /usr/share/python-apt"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95133): https://lists.openembedded.org/g/openembedded=
-devel/message/95133
> Mute This Topic: https://lists.openembedded.org/mt/88736517/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

