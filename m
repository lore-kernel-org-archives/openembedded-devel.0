Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B26D2F7C2
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 21:07:00 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.34870.1729112815491830356
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 14:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aeAFjn5e;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3e5c9026ea1so718809b6e.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 14:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729112815; x=1729717615; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KZHj0e+V057cWEKnc1SBqtZQr6AauBsoubLfvu9drg=;
        b=aeAFjn5ehpjED76s+WTUKABuna5Keu71MQGvolg64ReLQMw8OzrQpZzdvGKrnmtcEm
         3qLbKJ2qHzXWLKQxKidHLeTP88YFtknuAxqNJEgEtBuoek1BL+7ymOYwp93TVE4+P1bA
         iHpoFRPhOkSCrAFrSonDOCb7kONeP3sYTKgzRp/OwbS9PllvLtDkCIAYYmpt3ee7feGO
         aKNV30eEdvOWJoa3gm7Me2+p5HUGYpsaHnA48n9Y5KTqVcVRsF+6yniLTx4Pir06Oi/6
         7mUugSFgmeOMugU1hQw6I9szWpQatCpPlv29WBA5d3pCIshMKq8S/8zPnskEX74+YRnC
         +Hzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729112815; x=1729717615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KZHj0e+V057cWEKnc1SBqtZQr6AauBsoubLfvu9drg=;
        b=vYoDx9vAJ1O0s0GjmPLwpHd5uOBdbjim3xMJG7xZQ7a/zxg7mvAeEZf3QUrfmJtiCp
         +gkscpJPRNXYmg1QUy4rbkPvhDaAGrCEuY9iRhZ0enYZZQGo3sf2t7ILVotsPLCJ1wNC
         KPFg0yueHLEctydZpCHV7LpwVT4BHUazsJmJPenWQZ8ECPEZav82J/0wgCzrXR21rEMr
         O1LVa07XMCcYi6hIBpBinqCO4s7NNu9HFKORsKG8orIo22lviDc4U6y5y5HOaiKvNaLM
         QDJqr8jT7QHRZCrZV/1xn6lh0gzoT0MieCgZyVoUgNLnpive6eK6SSXqmcmbks75CjdF
         gyRA==
X-Forwarded-Encrypted: i=1; AJvYcCX4uMRMk40KdYS/GSjIlo4rBIPNkNk7TuRnCec8UWbd1sH5zUHJV9fDBBhUChWNfumflxXF9bK6h12y4W8BvCPbVhg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxCnwExG2t2igwEEJndO9QMHLfyj7NDnZ5JUrE2JEXRfrbyQH3H
	6wjcinBPi6LBcIlKBkrflrTpbgb0kl0cKLBu/gC/VhZtQPg0cTfk++IKwhtCiKM24+wVg2ZSt+d
	BpkoyJFkajjASWSwbWVRkGc7omlw=
X-Google-Smtp-Source: AGHT+IGMZl4YltEuJs4cPpWFs2ldZkz9VFHyp9r0bONv6e9u5oHfZ4K6BPhJ2K/hcCx6zSJMHJLTEFFV2BOcdLlCOx4=
X-Received: by 2002:a05:6808:1449:b0:3e5:f9a4:796a with SMTP id
 5614622812f47-3e5faf04d2dmr676901b6e.6.1729112814654; Wed, 16 Oct 2024
 14:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20241016071044.2039824-1-chanh@os.amperecomputing.com>
In-Reply-To: <20241016071044.2039824-1-chanh@os.amperecomputing.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Oct 2024 14:06:28 -0700
Message-ID: <CAMKF1spkwKHYmFFF115_C+N8H+_orVT6xwxOUtXt692yZj7DOQ@mail.gmail.com>
Subject: Re: [meta-networking][PATCH] mctp: upgrade 1.1 -> 2.0
To: Chanh Nguyen <chanh@os.amperecomputing.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, openembedded-devel@lists.openembedded.org, 
	Phong Vo <phong@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, 
	Quan Nguyen <quan@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 21:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112955

Fails to configure for qemux86

https://errors.yoctoproject.org/Errors/Details/809756/

On Wed, Oct 16, 2024 at 12:11=E2=80=AFAM Chanh Nguyen
<chanh@os.amperecomputing.com> wrote:
>
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
>  .../recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0.bb}           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-support/mctp/{mctp_1.1.bb =3D> mctp_2.0.b=
b} (96%)
>
> diff --git a/meta-networking/recipes-support/mctp/mctp_1.1.bb b/meta-netw=
orking/recipes-support/mctp/mctp_2.0.bb
> similarity index 96%
> rename from meta-networking/recipes-support/mctp/mctp_1.1.bb
> rename to meta-networking/recipes-support/mctp/mctp_2.0.bb
> index bf3961be4..a0e757a6e 100644
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
> --
> 2.43.0
>

