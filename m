Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5919C2BBCA
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 04:53:53 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.10267.1719550425139344004
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 21:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ds/yFLuH;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52cf4ca8904so254870e87.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 21:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719550423; x=1720155223; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zr6EgKm8ra3Du59iHR1b/j26QD/XfkkvPjPCE0Vt+FY=;
        b=Ds/yFLuH/miqrWgfcPzufZvID+0PIPTxyKae4ojMadNsnidcDaNAFq0eYAtq/7lp6p
         8Mk5KMLBwG+vu7txJYuXoqfondQFDThKXpt+HudRG4znT3SZx2x7ly4dOvSPxQK6TLB8
         c3BqvZ/nxaVdc+/P3GRwm/NMdDsFHR/mbS/BejiImPE+Fep9Em5sk1rQZ2wPJvWri/SW
         BXCR/DPuzGvXqj3GTHpQjeG4y/GMGYq/V0j0VdKzZr8pL3kcG2D9ffFSkMVBkS4phhVa
         YnXyIkl9pQ8fo9OYW/OkNfVac4ghLow6eSx3Tk2juBRyfKM/zlT8zijmAVd6sK1KpnNx
         vukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719550423; x=1720155223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zr6EgKm8ra3Du59iHR1b/j26QD/XfkkvPjPCE0Vt+FY=;
        b=pNTAXXUC/O1BimQb/9QRE1ttVOTvbW2TMG6DkWSbWkyXF6QT/xEaHVPDvuGLkBVpqn
         g5NfpgVFyb4INdj9yKgpafMw6MGu5AK0LEtNfd4wXqK0Aj+rJE3QeNIscifSQ7fwjMzG
         Sew/TUXZhBUs8NVyctqlosNYjj11xFkSoXcGM/fhl//56I+Fc6dgFU2k0GSfqYFhQHLg
         AGVU7/90gwHHnXWoRex6ZvxmGmc1dRd91LD0GWDzPiZFEV0YvFaoZSVrm4coqspU/HIt
         itJ/ING5gPiIZ/FCgfMPL4HBzULOQuGg6b09dhekW5ev0tL+fAAyB9/iiuBYknAxcjZ/
         QI6w==
X-Gm-Message-State: AOJu0YwOYLZtQQ0eDqVLBqU3e2IHYturk3/OCpJWUF6nUd+bgEPBAX+E
	KgYhnz2jrkDQ766hlpArh2akq1P1kyEgF0j1aC5S6mROIBfw14WR4haxXiyZe4Erg5GTDhznvBF
	rtYXO9U8731N0LLQc25RbFssZmJE=
X-Google-Smtp-Source: AGHT+IF0QHEQ32M1SHERKyKF7251g7SU6eLbpmsF0SDz4QFQRGyOBy4aCpyldEeGzVB+i9/rlKWTeJb/kr5J8Chg9Ys=
X-Received: by 2002:a19:5f5e:0:b0:52c:da1b:a613 with SMTP id
 2adb3069b0e04-52ce0680acemr9872373e87.65.1719550422698; Thu, 27 Jun 2024
 21:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <1719544767-17994-1-git-send-email-wangmy@fujitsu.com> <1719544767-17994-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1719544767-17994-2-git-send-email-wangmy@fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 28 Jun 2024 06:53:30 +0200
Message-ID: <CA+chaQckGFbtN9uCzY_C7+XWzY5woAQ1Adt3yN7a4LKE3nqEeQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH 2/4] linux-atm: fix build failure
 with gcc-14
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 04:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111140

See https://git.openembedded.org/meta-openembedded/diff/meta-networking/rec=
ipes-support/linux-atm/linux-atm_2.5.2.bb?h=3Dmaster-next&id=3Dd196c0c1af16=
eba55f8f0277eea76129ed2f677d
which has the log as well.

On Fri, Jun 28, 2024 at 5:19=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb=
 b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
> index 86b9112ba..c434027eb 100644
> --- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
> +++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
> @@ -29,6 +29,8 @@ file://COPYING.LGPL;md5=3D6e29c688d912da12b66b73e32b03d=
812"
>
>  inherit autotools pkgconfig
>
> +CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> +
>  EXTRA_OEMAKE +=3D "ROOTPREFIX=3D${root_prefix}"
>
>  FILES:${PN} +=3D "${nonarch_base_libdir}/firmware"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111135): https://lists.openembedded.org/g/openembedde=
d-devel/message/111135
> Mute This Topic: https://lists.openembedded.org/mt/106922377/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

