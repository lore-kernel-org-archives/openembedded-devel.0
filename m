Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB61AC54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 17:19:58 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.487.1709745594146019571
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 09:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YHL+NPQn;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6e4e952467fso1647781a34.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 09:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709745593; x=1710350393; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UGXYHWme3dcXfmfjZ0HxSZ2Y95EqlJFRAhliAjapIU=;
        b=YHL+NPQnKSG0ijsEZjL/vlJzHkrGrNjC/GF8ZQmpvr0+m3v5RauDBas8T4xaUEfuBi
         I4cTXOMijDVxR7krt5NRaRcDEsSqPsVNzscrW6qb0yGcCdy3ACsg0nIGWsDrq0An0j1t
         2T+Ypt8rMB/9GqA+Kp06dy0Vb1hYhP048E3UvtK1nYvyKDozlFFU/j11i9e+OPmPvHdR
         TVMAwkBKPrTey8GCPGQMRlBuONtY83bGzIm7LWtyru4gepm18NnTJM+msFL5V+R2feyI
         2Jojc/HQOKwnmGvty8Af6WAJcTnKMtx/fndQ3Gw8u3F/W3wfKHTUx5AKUBEdqYA4l6pF
         FcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709745593; x=1710350393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UGXYHWme3dcXfmfjZ0HxSZ2Y95EqlJFRAhliAjapIU=;
        b=PGah+qvX8VHhifZj9dxD7wuAgY/mDPdb1pNJPFLbm5vr4kSgBGL90sHDc250yCpe1k
         WFBOUH/gfyjpBbQwiRgUWQjtJCEah8WkZrNQ3e8j85y+qu5lXfWd9AL4EblOLv1Q4SoV
         vJn/lpMxXcO1J1L/XW4MsOnUymqhCj9WXwGsFpzC4uyQs/HQOsQGixulBB0Tfcmv9JWk
         +b7IpOc1DdSl68DHFymp6D8XJgVR2x67HDmy7iGLAMvFdqJLTN2tRRTljUohFmBZ96ES
         TlpMpEWo2NV/w8d1HadfPpQnfNlVK48PL2f3TgcT5zSzwqtylgSNE2Z3j6ludXfFqkEE
         XPzA==
X-Gm-Message-State: AOJu0YyJoglhQPUTPtRDig+xcCasxMLh+Et5F27Rvt2d2+LN8TfhWwkj
	ck63IbPbKoxX7u4VSSqGd0vAZjtJ18chZuahnI+/fA669ncP5Lq+CZ0hACmK6dZhRgwKCmurneq
	PKwqJYcOD/0dgw5FlQVMpAcO0CK8=
X-Google-Smtp-Source: AGHT+IEX6rhNZMIS0tWKi9YEK0sxZyFUQ5/giHrm1nryEyppIh4TimzrPV2wNA+APBly703ZW1Q3/NR1XhEmHhbtTXM=
X-Received: by 2002:a05:6870:724e:b0:220:bb3b:c762 with SMTP id
 y14-20020a056870724e00b00220bb3bc762mr6000317oaf.33.1709745593317; Wed, 06
 Mar 2024 09:19:53 -0800 (PST)
MIME-Version: 1.0
References: <20240306171740.480830-1-alperyasinak1@gmail.com>
In-Reply-To: <20240306171740.480830-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Mar 2024 09:19:27 -0800
Message-ID: <CAMKF1sqjODuzjjc47US2obJXSX7uJLKC0XEu91fRLiZRrY3HgQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-icecream: add recipe
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 17:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109175

Are there any unit tests with this new package ?

On Wed, Mar 6, 2024 at 9:17=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com> w=
rote:
>
> icecream (ic) package offers a more concise and readable way to debug cod=
e by replacing print statements with simple function calls.
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../python/python3-icecream_2.1.3.bb            | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-icecream_=
2.1.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-icecream_2.1.3.b=
b b/meta-python/recipes-devtools/python/python3-icecream_2.1.3.bb
> new file mode 100644
> index 000000000..ec3a4b90f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-icecream_2.1.3.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "Never use print() to debug again; inspect variables, expres=
sions, and program execution with a single, simple function call."
> +HOMEPAGE =3D "https://github.com/gruns/icecream"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Deca5ce1610d64ed40920efdce=
85ff8d1"
> +
> +SRC_URI[sha256sum] =3D "0aa4a7c3374ec36153a1d08f81e3080e83d8ac1eefd97d2f=
4fe9544e8f9b49de"
> +
> +inherit pypi setuptools3
> +
> +RDEPENDS:${PN} +=3D " \
> +        python3-asttokens \
> +        python3-colorama \
> +        python3-executing \
> +        python3-numbers \
> +        python3-pygments \
> +        python3-pprint \
> +"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109174): https://lists.openembedded.org/g/openembedde=
d-devel/message/109174
> Mute This Topic: https://lists.openembedded.org/mt/104770329/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

