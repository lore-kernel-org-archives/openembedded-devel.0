Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D144C67861
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 15:16:28 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.15000.1712330186370159011
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Apr 2024 08:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PN82Gdeg;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-22e6b61d652so860521fac.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 08:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712330185; x=1712934985; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ag5PbLh7ncIy3/6jel13apwLkS7RPCCRc/D3bf2Rh+4=;
        b=PN82GdeglVk/S6o82lBYowSET8pUoQ03M7jAoO2WjJR/901DWdkfHb6/hPWERhP1LA
         M9Vv3usV2KaHJ9z0Vd7FcRNOJ0ZGUAOcUC5jF5HDo7gNUSWKbC9ecWwxHGeD1/4gTWH6
         eAQHTQ5FOTSXR4iIgRbmTK9gGuVMVgBnoUf1BRqAL08zJEbV+Yh1i9SQE+9sq35r7cuh
         mDvadn1irXTt3dZ54SjM6jOIMUJG71ewaHQMkJUN89HpEk28m3Snjo0wz5mMSlDoHLgT
         EOjebwMSkPMmw1ui+kC04fc20PdoajJpZ0jfF2YRo9WameXsmuk6DSUbx4SsFHV99fOW
         AN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712330185; x=1712934985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ag5PbLh7ncIy3/6jel13apwLkS7RPCCRc/D3bf2Rh+4=;
        b=mFP+nuNO3zSVe6CfYBJ6VCYxDXwPfnyMXQUZWtESHvgZ3o0W6PzAvM5R26eK+7/ODy
         Mpe22SW6/sWN4GJFQtXVJ5RrKWWM/bsPI9ZKWqMsLuxbyfqsIDYIXMvsSAOHp7OzXCyG
         FGNAAqN/EMAg9FZufLkKNr+fzv4agKuBTfVEQiex5zHWGbIrJSDXGCuMfttPDRIAkFwi
         iaAcV1b6vxSZqxHUYP+cYG08cpSgwku6DPHqdVhBGUJ2nxgW76Tkt5Q16w/LfMroz7/t
         iDNtIeVraNgway94RpqWPXiFLTbcVO9EhEWePvTZtrnZ24RrdVdag0Tv/AlmXrL4ad6X
         NjeA==
X-Forwarded-Encrypted: i=1; AJvYcCXlt07mmNnvl3NKm7F4xaE/t8+DXEQlOS4BLCm1aYZhB1kxaivrXOSu6H8dg9ffRlKg3bBacE7b0Mj6hRNWrUYndMY+IX104XOkeONaEU/DOahC38EQfnlaCQ==
X-Gm-Message-State: AOJu0YwTCDufrlyTI71LZM9msjPeLq9CXHSlr1qJjzUycMd/NiFA7MLK
	qtG856SHDeW40fyoFjVjxVGM06+YgeNkdoooN+dYkiNJX6gd/UpPPgun64Hj6hyIBAjbOXu28C5
	S+5KLJFZezC8PdtJz0kgYbpxf30g=
X-Google-Smtp-Source: AGHT+IHRusIUpAvCeKqmgNJ30S1JinV1Z5fq3rpHVYiXaCYVZPFM4jwXPDA7Fd2GKvKVMCYmBdjt68v6+vjd8XxJBmw=
X-Received: by 2002:a05:6870:5588:b0:22e:7a61:5747 with SMTP id
 qj8-20020a056870558800b0022e7a615747mr1973794oac.3.1712330185573; Fri, 05 Apr
 2024 08:16:25 -0700 (PDT)
MIME-Version: 1.0
References: <AS1PR10MB5697A0F615AB7B6FEBE3F9C5FD032@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697A0F615AB7B6FEBE3F9C5FD032@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Apr 2024 08:15:59 -0700
Message-ID: <CAMKF1spxcXp8wS06KXGdDV7XaJqTVx5h_SgvG0FDtWWULMsWPw@mail.gmail.com>
Subject: Re: [oe] Versions of libmbim and libqmi
To: peter.marko@siemens.com
Cc: Wang Mingyu <wangmy@fujitsu.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"petr.gotthard@advantech.cz" <petr.gotthard@advantech.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 15:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109823

This was an oversight on my part, this will be reverted to stable
versions once again.

On Fri, Apr 5, 2024 at 3:04=E2=80=AFAM Peter Marko via lists.openembedded.o=
rg
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> Dear maintainers,
>
>
>
> Could you please clarify versions of libmbim and libqmi for scarthgap rel=
ease?
>
> These were recently upgraded to unstable, then reverted back to stable an=
d upgraded to unstable again.
>
> This second upgrade was done regardless of new inherit of upstream-versio=
n-is-even.
>
>
>
> libqmi:
>
> https://git.openembedded.org/meta-openembedded/commit/?id=3Df690ea9e33d9f=
f80bb3e7434a5ce428c7a4a0c6c libqmi: upgrade 1.34.0 -> 1.35.1
>
> https://git.openembedded.org/meta-openembedded/commit/?id=3D9ebcca5734830=
d48241c2ec7cd03d738a5d10c76 libqmi: upgrade 1.35.1 -> 1.35.2
>
> https://git.openembedded.org/meta-openembedded/commit/?id=3D7e0ce9b5e7e0e=
574acbf3488c947693e52c45f9f libqmi: correct PV
>
> https://git.openembedded.org/meta-openembedded/commit/?id=3D538b03a3ffaf2=
5c3bfcde076ae6a81ca05b3c166 libqmi: Revert back to the latest stable 1.34.0
>
> https://git.openembedded.org/meta-openembedded/commit/?id=3D3d3eea39abe7d=
dd6caeb1ad1fee10ddcb593dd7b libqmi: upgrade 1.34.0 -> 1.35.2
>
>
>
> libmbim:
>
> https://git.openembedded.org/meta-openembedded/commit/?id=3D3ddd5060a8718=
2f614981f07d1e1f72f45b82719 libmbim: upgrade 1.30.0 -> 1.31.1
>
> https://git.openembedded.org/meta-openembedded/commit/?id=3Ddd093656b9cc2=
def64307387ba45da61451d5397 libmbim: upgrade 1.31.1 -> 1.31.2
>
> https://git.openembedded.org/meta-openembedded/commit/?id=3Db7d577d8d3ecc=
d04098a245ce7fbe46097358786 libmbim: Revert back to the latest stable 1.30.=
0
>
> https://git.openembedded.org/meta-openembedded/commit/?id=3D770f0b97c0e16=
bf4c2d8b2e092a5a28069d677ba libmbim: upgrade 1.30.0 -> 1.31.2
>
>
>
> Thanks,
>
>   Peter
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109818): https://lists.openembedded.org/g/openembedde=
d-devel/message/109818
> Mute This Topic: https://lists.openembedded.org/mt/105345421/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

