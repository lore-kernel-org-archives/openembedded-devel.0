Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC91D3C532
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 20:47:13 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.8097.1729198032988629093
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Oct 2024 13:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FPmqMVvZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3e5ef9e795bso917219b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 13:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729198032; x=1729802832; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tB8KO5pNoxMl5ExPo42zsn1Roeyk9fLZ92NdCKk1R8k=;
        b=FPmqMVvZAn9Gla8awfGIhQ6z6LolzBGf49GIubwVVfDmwiDssKBn5jMYc9+hv4VpQP
         3tKPktUO2Nyy8YvpZH9VudOt0kHexKbnDIQfb5WiR+HkCHqYEO9q+bcKqXNSP+tQZfzQ
         DjJDpWozCKia3WDJq+TjndesVXYhLusAo+x2G+xXMYEwE+Zhjq1BcnxkGclUcVhVyaOT
         SMr4R8F6i8NJ2bxR0WvtZUPYdYi9iWph01tAqs5rgyoNlDcJuMbxu04+6euoRSSdjFqK
         wF0kjIS8HiWGVBFbIpVMy0TbNrrl3rWF/2Bq4unH6HGtVu/cDOaftrfqiKx0Yy3jTLwW
         UGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729198032; x=1729802832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tB8KO5pNoxMl5ExPo42zsn1Roeyk9fLZ92NdCKk1R8k=;
        b=JGjQjS3ngqUyzFQpzJKEl+snFDK+cnztJnwCAnXy1lTYCLbbmuSvTZB3YplLYbsPN0
         sWYTIVCvgWZanSur88KApZO0RCM6+uDjw8ADODb01c4CmxA9ZeHJNscIQMZ4BLwj0Om2
         2hjN/k820SEWUGdoBWpK2IBoHXiHPPtcmKTmNwkt3WEi6577EVNG7RtCJxDtN9qiatEs
         Lm7AxhhGS/eszHm3pyGntsE30Lxn5M4oWKQdsi0gZtRixkBkPK9D13FSksTVdFkNSNdR
         y6EqfahlCYyNY/Y5rL+nEztiWIwhlS3wcys0z94h+VlRnZ23RTPpzN4YA6vmLilEKLnF
         s3Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUsRWOKy0Ezd8MDF1F7VPjy+osZUbxnYXNguGjj4xphEiYHWXEpkXejsduTqeLbd6QN2XTVlO1sH5yMBfw7mzdnnfA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwgG3gZ+yvg1ryEApcDu0gvUdpgPvJqcfocMJI0feROWatgL74H
	lsZ5OaD2LPcqAaMqg7qE5frgu6f+S2kCTjZ4czGhEBkMYz+NkkSvThCmudSlG+rjhmwPi1Zmvso
	ZYimd9SsrjK82mNkpu3l+JzYuCR8=
X-Google-Smtp-Source: AGHT+IFYsh9nIwMwvHRPLKfqmmJF1zO4nKQf0MCh34PT3c8OpF00I0vGEXzaeZEtd/RxrDYSU11ja6eC4LW2I9ZNdoc=
X-Received: by 2002:a05:6808:201f:b0:3e5:f9ee:a2b3 with SMTP id
 5614622812f47-3e602c651admr19239b6e.4.1729198032104; Thu, 17 Oct 2024
 13:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20241017063626.2089926-1-chanh@os.amperecomputing.com>
In-Reply-To: <20241017063626.2089926-1-chanh@os.amperecomputing.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Oct 2024 13:46:45 -0700
Message-ID: <CAMKF1srdcMcJ6CVEm3Cf42nEyFug+kDO0yGWQ53GGjG1TADGfw@mail.gmail.com>
Subject: Re: [meta-networking,v2][PATCH] mctp: upgrade 1.1 -> 2.0
To: Chanh Nguyen <chanh@os.amperecomputing.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, openembedded-devel@lists.openembedded.org, 
	Phong Vo <phong@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, 
	Quan Nguyen <quan@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, 
	Thu Nguyen <tbnguyen@amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 20:47:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112970

ok, now it fails for musl target see

https://errors.yoctoproject.org/Errors/Details/809802/

maybe you need to include linux/socket.h to get AF_MCTP address family
definition

On Wed, Oct 16, 2024 at 11:36=E2=80=AFPM Chanh Nguyen
<chanh@os.amperecomputing.com> wrote:
>
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
> Change in v2:
>   - Fix CI failed                              [Chanh]
> ---
>  .../recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0.bb}       | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>  rename meta-networking/recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0.b=
b} (93%)
>
> diff --git a/meta-networking/recipes-support/mctp/mctp_1.1.bb b/meta-netw=
orking/recipes-support/mctp/mctp_2.0.bb
> similarity index 93%
> rename from meta-networking/recipes-support/mctp/mctp_1.1.bb
> rename to meta-networking/recipes-support/mctp/mctp_2.0.bb
> index bf3961be4..62044e007 100644
> --- a/meta-networking/recipes-support/mctp/mctp_1.1.bb
> +++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-only"
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61d=
b21"
>
> -SRCREV =3D "a591ad885aa28f113cb45870b2fd5bce48378d6f"
> +SRCREV =3D "9986862f88fd6e6ca75e2a29236cf332d640e600"
>
>  SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=
=3Dhttps"
>
> @@ -13,6 +13,10 @@ S =3D "${WORKDIR}/git"
>
>  inherit meson pkgconfig systemd
>
> +EXTRA_OEMESON =3D " \
> +    -Dtests=3Dfalse \
> +"
> +
>  PACKAGECONFIG ??=3D " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
>  "
> --
> 2.43.0
>

