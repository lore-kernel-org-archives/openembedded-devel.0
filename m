Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E11FC3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 14:08:41 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.15384.1720620514828346244
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 07:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SeiokQc4;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-703626a0704so2058808a34.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 07:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720620514; x=1721225314; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZtbIB6XsUEMtUhqxKoUdZvD9sOrVYMG6LUT6+6dfkQ=;
        b=SeiokQc4T2CX6Xvx85HC8KcF6sJ+wCWTATYUqi8S63+BvpHfSGxpebDls7mZCOFgB/
         WizZNqya4icjyTIBW1MvssAF5msOdLT2lpyFQiZzGBXWbZmMplmzTdr3V2qMFFZPdbgg
         429IPMbo6Tn1Y7PF5eU7++hjlDXBBUbvHK494TMmL0L9V49y+dYphiklZ5lm+1woFdm8
         Hw38BmlcAC13jgAZ5fpWrjyBjcyiAQ4+HMmvX9rdaaWqXQfRV682qBiqhUItUwx08RQj
         9F5v87tatggEYlMsxq4wzZtXhxCV5uHzsuKkwejkwFp65V8RW1ox4kKuqIdQv2kPSR58
         7chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720620514; x=1721225314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZtbIB6XsUEMtUhqxKoUdZvD9sOrVYMG6LUT6+6dfkQ=;
        b=m785ZDBHMj5tAkbE6+BO88lA/lFI9HnuMK0nFVrnNJ5AfCAr4taCKzbR2VAXTXHng4
         Qj7ELH6SuWJg9lSEUWdfszodYjh7LTMqSQ0y59Wga0AhZXGCa+IRhRV1W4APuh9oHHGy
         FiX+Mvy2KyS73uE57cQptlKlKK8HGjyJP3vKSznCb0MIwlvCOIHiWBbB/OrkePGh3x+d
         7ss+e7NIpyf5SlyuXkga0KLKFle3HsVV+7PYrHfSurMvjPgJoqm0U59AUpRQjlklr+pY
         U1NcsOBB14JX0sxx+zgADd2sApW4MN/GMgNUrW+FTyIttcNsC05Meet0LBVF+/jlfHzD
         RGeA==
X-Gm-Message-State: AOJu0Yzsr/nSHdgQft8wpYmoql4oZPLb8F+QoDixVR6miSI2/dumPD+Y
	uqiIG0TQNcWdcLxIOzxXac90ng4JJ6ROQkNLj2gRVyJkH2L3KXaSFWHsGJmSfY2ymKpb+7PXduT
	O2zWl+HGs2iAH+a2DgOLv0o04b4N88Pff
X-Google-Smtp-Source: AGHT+IFrshoUEde1NX4EzLuo6LIuYk0TDG0FwnMLWlYrtSm5mvuAwBh5xnBUpNfgfieSoCz7a1U/OUF6K4/41HYnCIQ=
X-Received: by 2002:a05:6870:a10c:b0:25e:e09:786d with SMTP id
 586e51a60fabf-25eaec3f6c7mr4654232fac.53.1720620513714; Wed, 10 Jul 2024
 07:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <d9633459-8887-4e85-ac2f-33c5b97a32b5@3mdeb.com>
In-Reply-To: <d9633459-8887-4e85-ac2f-33c5b97a32b5@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Jul 2024 07:08:07 -0700
Message-ID: <CAMKF1srWSBdsgi_MJ=2SQDQ=sS7utQY1_bUc-ccM1hf1zk3puw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] meta-networking: recipes-support:
 miniocli: add
To: daniil.klimuk@3mdeb.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jul 2024 14:08:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111299

fails to apply

Patch failed at 0001 meta-networking: recipes-support: miniocli: add
error: git diff header lacks filename information when removing 1
leading pathname component (line 8)

Please use git format-patch to generate the patch

On Wed, Jul 10, 2024 at 5:21=E2=80=AFAM Danik via lists.openembedded.org
<daniil.klimuk=3D3mdeb.com@lists.openembedded.org> wrote:
>
> Adds CLI tool to manage MinIO S3 deployments.
>
>
> Signed-off-by: Daniil Klimuk <daniil.klimuk@3mdeb.com>
> ---
>   .../recipes-support/miniocli/miniocli_git.bb  | 20 +++++++++++++++++++
>   1 file changed, 20 insertions(+)
>   create mode 100644
> meta-networking/recipes-support/miniocli/miniocli_git.bb
>
> diff --git a/meta-networking/recipes-support/miniocli/miniocli_git.bb
> b/meta-networking/recipes-support/miniocli/miniocli_git.bb
> new file mode 100644
> index 000000000000..55cf8b917146
> --- /dev/null
> +++ b/meta-networking/recipes-support/miniocli/miniocli_git.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "Simple and fast CLI tool to manage MinIO deployments."
> +HOMEPAGE =3D "https://min.io/docs/minio/linux/reference/minio-mc.html"
> +SECTION =3D "net"
> +
> +GO_IMPORT =3D "github.com/minio/mc"
> +
> +inherit go-mod
> +
> +LICENSE =3D "AGPL-3.0"
> +LIC_FILES_CHKSUM =3D
> "file://src/${GO_IMPORT}/LICENSE;md5=3Deb1e647870add0502f8f010b19de32af"
> +
> +SRC_URI =3D "git://${GO_IMPORT};protocol=3Dhttps;branch=3Dmaster"
> +SRCREV =3D "e7c9a733c680fe62066d24e8718f81938b4f6606"
> +
> +FILES:${PN} +=3D "${bindir}/mc"
> +
> +# MinIO CLI depends on getent which is a part of glibc-utils.
> +RDEPENDS:${PN} =3D "glibc-utils"
> +# github.com/minio/mc has some Bash scripts.
> +RDEPENDS:${PN}-dev =3D "bash"
> --
> 2.45.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111296): https://lists.openembedded.org/g/openembedde=
d-devel/message/111296
> Mute This Topic: https://lists.openembedded.org/mt/107141238/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

