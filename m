Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8DBD65C52
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 06:55:29 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.31833.1731567322632122461
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Nov 2024 22:55:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A00E/N9/;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53da209492cso228253e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 22:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731567321; x=1732172121; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CW6bg0YDjol405Yy+75o58MlUGPMHRSzrNWThmJa6Io=;
        b=A00E/N9/J7CTK/EEL0z1LbFzLnaVWDPKWYPnUVh1Upce8JN+psYBs4+uaaEoyFBiEY
         A7oKeKt0Gt4BQadI6XvKRSZlZDeOsTTGanoOTPQCpn0lErooox857k2fv5iHyyF1T718
         jiQE0+2KFeDI7aEiFJklm1pO9sVtIjhplyT0mSQ7qwuro91HG9iUDC8ltKmqDQjXIJ9U
         FVVPQXas10AN+ELQgQxtBjyCpPwtkjBIsC1ASsUItGbSezTdDoISTK6K62AmfAw+tMV0
         bxHXHam8Z7YxrFby2jN7QpBM8HG40btz7I3E1c4f2c+pu6BdNCGxMAqFuUNx887zKK4u
         82QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731567321; x=1732172121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CW6bg0YDjol405Yy+75o58MlUGPMHRSzrNWThmJa6Io=;
        b=cKUaspY4a0ytQyB0IZ0FXIvQ51QZkD6t/+wMa1ymllQnV1cDZbIUX65v03QP9let6k
         MpFJsNfnmk3U9QI/+loMzD1DcjU+e2DAoLLYpBXUh6/0YjpHH06X5JWvTvgwhZa73vqU
         gHQpKM7L+lkUbW2o42pb919a3kHPqnoO0Et52CeB+49lIgOKHLUrKJLh8t9t3RqMVEYE
         +OlpnMxvrDNSVXMTnm+N3JJNrtHIoZQLADb8vDYiR0NK/9MDnzkti0NAcwOsTrFAHNwg
         AuGk4OAR5vy9hKyuJ6/k1SWAsBJuuZJPwZZwtNRSxPYMDJ0gz1c6JXz1LL96r8T3KI3Z
         jttw==
X-Forwarded-Encrypted: i=1; AJvYcCWpOlbdXY4SMWjbKKzsk14f4IGq9DwFQB7TQeUOPv4ELNR1y/ELdcehuhPU/6zLXye/XQbBXrB4Oe+QhFHPPP1TXcU=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw1aKD624lCLxMWfRkCCuR7p11/NYzG2LpMWDqRmQg1kTL58ul+
	vfEBXsg62idS/j8XRU2v2/Ry4LR463Gvj6JeCS6J4/i9LElmPQN0VJVX9yXJR+R5Zq4q/japwnw
	tjJHglo1Ndfk70QqXdC35+OItP4A=
X-Google-Smtp-Source: AGHT+IGk1G4hspjtcMafNyie8LHAJo7I6D9FEj5h7U2EcafgH7N73xpAcFMbyG13mFOiBFaNDyBotx2sCyG9H1tiQUs=
X-Received: by 2002:a05:6512:b94:b0:539:f6c4:c29d with SMTP id
 2adb3069b0e04-53d9fee3c58mr2797371e87.54.1731567320452; Wed, 13 Nov 2024
 22:55:20 -0800 (PST)
MIME-Version: 1.0
References: <20241114034206.398654-1-chanh@os.amperecomputing.com>
In-Reply-To: <20241114034206.398654-1-chanh@os.amperecomputing.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Nov 2024 07:55:02 +0100
Message-ID: <CA+chaQenViwkCb1Bch_8YWgoKe=58wiLB4FFnfa=12b+bKem2Q@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mctp: SRCREV bump 089dc53..5c3b15d
To: chanh@os.amperecomputing.com
Cc: Khem Raj <raj.khem@gmail.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	openembedded-devel@lists.openembedded.org, 
	Phong Vo <phong@os.amperecomputing.com>, Thang Nguyen <thang@os.amperecomputing.com>, 
	Quan Nguyen <quan@os.amperecomputing.com>, Thu Nguyen <tbnguyen@amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 06:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113815

Please update PV to indicate that it doesn't match with 2.0

On Thu, Nov 14, 2024 at 4:42=E2=80=AFAM Chanh Nguyen via
lists.openembedded.org
<chanh=3Dos.amperecomputing.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
>  meta-networking/recipes-support/mctp/mctp_2.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/mctp/mctp_2.0.bb b/meta-netw=
orking/recipes-support/mctp/mctp_2.0.bb
> index 24f974774..759f83239 100644
> --- a/meta-networking/recipes-support/mctp/mctp_2.0.bb
> +++ b/meta-networking/recipes-support/mctp/mctp_2.0.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "GPL-2.0-only"
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cc91856b08b094b4f406a29dc61d=
b21"
>
> -SRCREV =3D "089dc53fa7387cca517cd713061c323ca06fb6dd"
> +SRCREV =3D "5c3b15de6cf84f02ef2b759c8762969fe21965b6"
>
>  SRC_URI =3D "git://github.com/CodeConstruct/mctp;branch=3Dmain;protocol=
=3Dhttps"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113814): https://lists.openembedded.org/g/openembedde=
d-devel/message/113814
> Mute This Topic: https://lists.openembedded.org/mt/109568059/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

