Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A219C4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 19:00:06 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.53499.1669921197425741200
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 10:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gqwa4WET;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id c129so3082819oia.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 10:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CmtKIt6H+D0L9xjOLqmSNO0HDc8zfGgWJKzVNCBa1FA=;
        b=Gqwa4WETa2QgUY5XV5XyZRj/46yh9kVcJavESJBsqhXnIf34JCpFcq/9Jzmy8P1jKh
         62tz9pz/YzFKcnT3S2ICHk5RlX2Aywh81VL8bYAo6dzDwKvIQ2vwE2e66j27F2yci7WA
         qStLhVFjTd+irasiRaOr59ZiGXGgD+4yam113r5BDojEE5nqfc5xpEde8hFv/xtmmn5g
         v1OFFWUBpnv0nbGg9ysz2jjgKdiBTSScsGaZRK4hPn/+mI1PkJh5668QxdPjQkosLt9Y
         wb4hEVIckA/Spf9gqMBNsbEQFEjHk8bFUKIIcJ7CpNM91RZL35/A6W0mAuzpu+jBBGoW
         f2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CmtKIt6H+D0L9xjOLqmSNO0HDc8zfGgWJKzVNCBa1FA=;
        b=uEvOzAyHimJM9/c2jxroSE6SWUioMxeFQe4jxJT7s5MY0T6jGd2eQ1fbEmFplpF/RT
         hYyuT7+JHOP7Lt7ej1L8bSVSCKC47EIkBL8eVihRkaQZSzWLZOeYhubMfNM1Rzjhpilb
         6NnqOpYmnd5/Kr80IPU4+5UTFPT4o9JF3bG+zYILqcG7ozG6fui0cDZg5NM/jlPwVhwm
         f3iY4zWM9Nx0HmtndiK2wieZ8jIhby39tFfKXBASo+Gvg87B3D/eL0/dqqf3ficMQHnZ
         qsv+kW8JHS84+xdpKd80q9gcMpExVb76MnANznXf3of1eoscLWvGMr8D8GVwgyhESgvH
         bAUw==
X-Gm-Message-State: ANoB5pnATLpJkxpUXjv9q1Mr6ytOHuuCQLEBjOSAr1eOaSX44Z0Q2qkS
	QpPtZOA6Ot/ucBmVu3/IBusjv+wHQkE/VCBN00gRwigY
X-Google-Smtp-Source: AA0mqf485iv9bJSW3KeCLcQVSHT/5GOGG9my56RLhZlhQuelM27P6u1sWHkd8iJnolMf4bLKWFohI9kphYKVbOyHL4Y=
X-Received: by 2002:a54:4491:0:b0:359:d852:616d with SMTP id
 v17-20020a544491000000b00359d852616dmr23731409oiv.55.1669921196534; Thu, 01
 Dec 2022 10:59:56 -0800 (PST)
MIME-Version: 1.0
References: <20221201083456.1573628-1-tomasz.zyjewski@3mdeb.com> <20221201083456.1573628-2-tomasz.zyjewski@3mdeb.com>
In-Reply-To: <20221201083456.1573628-2-tomasz.zyjewski@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Dec 2022 10:59:30 -0800
Message-ID: <CAMKF1sqjESDw93VCuR82d4oMkETgK6tPVjwbJophgrHXeSPqwg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH V3 2/2] python3-uefi-firmware: add
 recipe for version 1.9
To: tomzy <tomasz.zyjewski@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org, michal.kotyla@3mdeb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 19:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99903

please rebase on top of master or master-next and resend

On Thu, Dec 1, 2022 at 12:35 AM tomzy <tomasz.zyjewski@3mdeb.com> wrote:
>
> Install uefi-firmware-parser tool
>
> The UEFI firmware parseer is a simple module and set of scripts for
> parsing, extracting, and recreating UEFI firmware volumes.
>
> Signed-off-by: Tomasz =C5=BByjewski <tomasz.zyjewski@3mdeb.com>
> ---
>  .../python/python3-uefi-firmware_1.9.bb         | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-uefi-firm=
ware_1.9.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.=
9.bb b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb
> new file mode 100644
> index 000000000000..3837a17437b1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Various data structures and parsing tools for UEFI firmware=
."
> +DESCRIPTION =3D "This package contains Python UEFI firmware parser tool.=
 The \
> +UEFI firmware parser is a simple module and set of scripts for parsing, =
\
> +extracting, and recreating UEFI firmware volumes. This includes parsing =
\
> +modules for BIOS, OptionROM, Intel ME and other formats too."
> +HOMEPAGE =3D "https://github.com/theopolis/uefi-firmware-parser"
> +AUTHOR =3D "Teddy Reed <teddy@prosauce.org>"
> +LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://setup.py;md5=3D90fa5bae1547550f1c1993f651ed=
a955"
> +
> +SRC_URI =3D "git://github.com/theopolis/uefi-firmware-parser;protocol=3D=
https;branch=3Dmaster"
> +
> +SRCREV =3D "502f1bada1ed11fdd1792646fda0bfafb8fa57fb"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit setuptools3
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99883): https://lists.openembedded.org/g/openembedded=
-devel/message/99883
> Mute This Topic: https://lists.openembedded.org/mt/95377963/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

