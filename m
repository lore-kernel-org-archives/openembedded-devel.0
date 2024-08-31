Return-Path: <michael@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD9ACD13DD
	for <webhook@archiver.kernel.org>; Sat, 31 Aug 2024 18:41:53 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.2057.1725129711115694384
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Aug 2024 11:41:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=pRDNqTFt;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.50, mailfrom: michael@amarulasolutions.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a868b739cd9so345493766b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Aug 2024 11:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1725129709; x=1725734509; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEZJK3AcS1FBwszatqiYjLdIRrxfBOMXW+UxJkPFd/Y=;
        b=pRDNqTFtr0T6uTMzQqeTp5n7n7tgJfX6ZoNU3T//o9wZFFHsUP6Cz0S1Utaxf3qgev
         eSVlj3hCaISrIvcEsVzq33bsz0H4B2KRJAfADWI0gyEJr+qptJSAUxcejgWRkUMGkqF/
         Q/05yBIYwn0PDP9XQPUvVxC6B1H3ACTC7g8Gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725129709; x=1725734509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WEZJK3AcS1FBwszatqiYjLdIRrxfBOMXW+UxJkPFd/Y=;
        b=ORjrCO6M6MK/hAB53zJuW6YYeLQJppdgf64z/78qjGarRb2lOnBWyIBIhgtlPX/Rnu
         MHm6VriaCPFHl2M7fy/4KQbC43wok5fZWWFQkD1z1cD0JVbFXRHxmli82nFhfXZX1bZK
         ZW7Jxv9GtfKZnmqVUV2FF6gy8QhE25awKEmjYOXrniawbtMXIcEOAy7wGOP24rDwCcs6
         IQMNqwXorxZLxXRPG+KvCwTLqwNObTdY/k+y/2eeFaqRmdvVvbYr9qwFzr3FDAvkYHLx
         TYCxyGV0ZHcwKIaZUH3VMV5nA03dLXDzMWYI6tyWYpQFJUmYeGMMNN1bsL/njVe53UCb
         Z0mQ==
X-Gm-Message-State: AOJu0YwhVCCcSHQKvDy/AT0i133pUGULzF7aC3vJsjnWcyfC5ff3X/uu
	/b+cagrjrjVJ7fH/9btBjN85Ff70mnhY+GuZbSNxDEvh+pqaZXod63WHh2Znds5kySxQP8pR1WT
	w0UfX1YYTJ2hpj5MkuRcw53w7JZKFEFyk/gqnp72nArTNGNEIMSY=
X-Google-Smtp-Source: AGHT+IFjEaPBLHpvvYbBT83n6zbZvx4R+KDu0HWibOBVxzBE2BMrK1MCdL/v+VgYD4mHZt2llURrBcX1jEkb71fM75U=
X-Received: by 2002:a17:907:d94:b0:a86:b97c:fc38 with SMTP id
 a640c23a62f3a-a897fad0fb0mr819327866b.56.1725129708096; Sat, 31 Aug 2024
 11:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240825153102.1055323-1-michael@amarulasolutions.com>
In-Reply-To: <20240825153102.1055323-1-michael@amarulasolutions.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sat, 31 Aug 2024 20:41:37 +0200
Message-ID: <CAOf5uwkjXMfRjvdY5T1PPfDKkf-N8oTF3O9=5ZdwQ-H-SrQxOA@mail.gmail.com>
Subject: Re: [PATCH V2] cpuset: Add recipe for cpuset tool 1.6.2
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Aug 2024 18:41:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112063

Hi Khem

On Sun, Aug 25, 2024 at 5:31=E2=80=AFPM Michael Trimarchi
<michael@amarulasolutions.com> wrote:
>
> Cpuset is a Python application that forms a wrapper around the
> standard Linux filesystem calls to make using the cpusets facilities
> in the Linux kernel easier. This can be used on linux realtime or
> standard linux
>
> Example
>
> cset shield --cpu 2-3
> echo c > /proc/irq/287/smp_affinity
> irq=3D`ps | grep -m 1 "irq/287"  | awk '{ print $1 }'`
> cset shield -s -p $irq --force
> chrt -f -p 75 $irq
>

Anything more that I need to do. I'm really a newbie here

Michael

> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
> V1-V2:
>         - patch was on wrong project
>         - suggest to move on meta-openemedded
> ---
>  meta-oe/recipes-devtools/cpuset/cpuset_1.6.2.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/cpuset/cpuset_1.6.2.bb
>
> diff --git a/meta-oe/recipes-devtools/cpuset/cpuset_1.6.2.bb b/meta-oe/re=
cipes-devtools/cpuset/cpuset_1.6.2.bb
> new file mode 100644
> index 000000000..b404d4131
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/cpuset/cpuset_1.6.2.bb
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "Cpuset manipulation tool"
> +HOMEPAGE =3D "https://github.com/SUSE/cpuset"
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +SRC_URI =3D "git://github.com/SUSE/cpuset.git;protocol=3Dhttps;branch=3D=
master"
> +
> +SRCREV =3D "4f80263208935f0df4f616cf9d8cb7285599a670"
> +S =3D "${WORKDIR}/git"
> +
> +inherit setuptools3
> +
> +RDEPENDS:${PN} +=3D "python3-core python3-logging python3-pydoc"
> --
> 2.43.0
>


--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com

