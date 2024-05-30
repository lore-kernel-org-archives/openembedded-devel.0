Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315FCC25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 19:06:23 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.68.1717095981897396882
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 12:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xm+RMo7F;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-627e3368394so2511537b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 12:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717095981; x=1717700781; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9WwwoGR9JDFk11KMQoLoG6HPZr97gA5um5c4f2ZbzM=;
        b=Xm+RMo7FnXunuenbjsw1SQrzeXmrj2lnqbNprAJ3MjGntdHbiQWGN06okG3Uzv7ZZF
         p0yMLpG1th/TwISOGyBI3wCrW/ZE4FjpVtgkSZThBhVXA5Sx1S3gZiQLJDUVl1ARvell
         ZtGhO8X0tNFsGFmIZoXxcMTJFd6jpGyz2Y9ilvWxI7Hf6ECk4CGTRlR/8Hi4zfaX3jam
         f7MjLJ3n5PEN4Hn49PWVsXYtcJ35tTfQP+eGackoNtcMHthAg8hQ1wfoJnTzHstLWh++
         3tPJ0565gksYGI1Hcb2Cpru2V+rh5wad9E7CQb+X95X+/5UFwtpjsaQ/+Kw/+2nK7fpZ
         juBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717095981; x=1717700781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A9WwwoGR9JDFk11KMQoLoG6HPZr97gA5um5c4f2ZbzM=;
        b=k8WfmzNxrNcQdi9JOvuJCVLVTvyUWJZK6BKvNfTLLcBgfgAl1kQmxPCod6ZtiNEA9t
         zXKHy/rW5eVAVDRNH2JzRniNAOXsQx9buNL/l+xZqlzcTNJ3WkWcQJdflDe2WyJBSgG2
         8SW/wK8SodFP0dK5Id+q9NWUKUpkWPSwGF4RL34R8aA6AasRM4qqZaj3QXuDglu8DoLv
         ilhyGwuE5zIZKiqA+toY8tXjZwMughBRC1fWSvTacuuZi5Di1aJafG+Ia3hLpNxyqJbu
         7IHfTlSbin5AVxtsF9MreN8XDkIEuMA4poazVnZZV65xaeBCXif6ZLFIqnrCX2e38qLv
         rWsw==
X-Gm-Message-State: AOJu0YytXv+Qi15an4O4uZH1CXE936nQj/EBo4dkawj45GhhjG5YgcXd
	Nwd/y/iKQX4fljzrC8jZiJu1NqgnrUyDAf9/JrSlEAOLfqsTm1QrYKmJVt+4L9S9P1dIEFbl0rl
	1jDpDIWKrtHsvTa4ag3fr1ULB1Xo=
X-Google-Smtp-Source: AGHT+IEUBD7xkbg6n6SvTHmquRt80ETGeNfL9FqwOzxD4UbFN1qWme/Fq7IQHYwTO2AMZmHq34+9DA1u9X7tFKGP0Kw=
X-Received: by 2002:a0d:c144:0:b0:62c:6fac:1c2b with SMTP id
 00721157ae682-62c6fac2e22mr20180667b3.27.1717095981054; Thu, 30 May 2024
 12:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <17D4599EF10BB041.22027@lists.openembedded.org>
In-Reply-To: <17D4599EF10BB041.22027@lists.openembedded.org>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Thu, 30 May 2024 21:06:10 +0200
Message-ID: <CABF_=yip1-orVqezLmC5R5Z6ESPaJvvzA9wA-W9LzGKDu5YYdA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-dasbus: Add new recipe
To: jan.vermaete@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Mingli Yu <mingli.yu@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 19:06:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110640

Please ignore this one.  The correct one will be send soon.
Sorry

On Thu, May 30, 2024 at 9:04=E2=80=AFPM Jan Vermaete via
lists.openembedded.org <jan.vermaete=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Dasbus is a DBus library written in Python 3, based on GLib
> and inspired by pydbus.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-devtools/python/python3-dasbus_1.7.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-dasbus_1.=
7.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb b/=
meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> new file mode 100644
> index 000000000..3efa96171
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-dasbus_1.7.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Dasbus is a DBus library written in Python 3, based on GLib=
 and inspired by pydbus."
> +HOMEPAGE =3D "https://dasbus.readthedocs.io"
> +SECTION =3D "devel"
> +LICENSE =3D "LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1803fa9c2c3ce8cb06b4861d75310=
742"
> +
> +SRC_URI =3D "git://github.com/dasbus-project/dasbus.git;protocol=3Dhttps=
;branch=3Dmaster \
> +"
> +SRCREV =3D "413cf9a0b7c231468f1d28d9a29dd8dd8bda15c5"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit setuptools3
> +
> +RDEPENDS:${PN} =3D "python3-pygobject"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110638): https://lists.openembedded.org/g/openembedde=
d-devel/message/110638
> Mute This Topic: https://lists.openembedded.org/mt/106345708/2167232
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [j=
an.vermaete@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

