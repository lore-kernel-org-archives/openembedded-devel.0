Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1114C7EE31
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 14:14:12 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.9110.1750947243451451646
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 07:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PuPyksD9;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-711d4689084so12154027b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 07:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750947242; x=1751552042; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwhdwUccmyzZqkwS1bxj2mFznXLDEZfQUiWP6kMzbOQ=;
        b=PuPyksD9UQnfP8Wq7DWbmaK655cjI836FIEriG6frUUgrlmOzx8AVSceiDvWSEDEuq
         695P+iG5NOTvYcEMqrYJVPc/gRiRnwWeb+bUAiYdKkFc9g1o8MvOYtg9XQ+9N86xWEap
         aqHUhtTXbEhn/D+sTwVj+5EMsOdhQLjwFVkGJv5WAGALfE3Hxbm9+B/2WHMGH7L7y90u
         kedCbY9pLHiZt3t+gBhgmcLWAYUYEfHcNt/u9Pp87a5tqbyLTr4/BkmPTmPX/8jmv+YP
         on2AVOFLb+PfMaGRHV7OOyntIvXgy2eNXPq8sJ+0OFfJdZ57vIU6gbWbKF3Y8WtFDxND
         /9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947242; x=1751552042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwhdwUccmyzZqkwS1bxj2mFznXLDEZfQUiWP6kMzbOQ=;
        b=TDgnDHjVGjtfLQzZkk6WmoCMhE7iGCyS/3MTYFVe/ALU2E3Z239zFzunkam8WirlBm
         cidjb+fh4GlFyrk+YIN9lkJ+MhiSwZQToUktqx6mxTs6fBid10BfPFsHg3TSvV9KnwhX
         HeDBJnWilJU2v8Vs5GbP9vCpPXEHpXnymQwD3Ow3ON6HHO9pkNB/R7duDWsbI/sDzmD3
         e7/+eBpjAAv3ZYfqq0oFi30JlVxh1g5IQJmQuC8sIPuDoTYUp8K0n//SbrRi91qBVcDw
         EEwr831o60ectCnwYVF2bSruOdcLpxCRK7jQjfAao7DHYTMYQV6J0P5Eoj6fZC/Stvhn
         BSDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqwc3kR37lN7sA4ST9/Nm3NjKydQT+/qYK9/T25h4aym6rufV6dFKHcJnQ94HrJ8kyHM17fufVy4H0/A584i15Du0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyiG/F5lqX9BXfVjkfHiKiaYYzJDdC/HYKiOoV3ahCW3BzV4C30
	J5uGIPtxJ8SXOM908vt+V3umZPjRS0EGBhSooxj6UIHTuEKeMWaOQgNOiqCQqP2uaP4tFQLn647
	RzM1CMlInzCaOQuv89qqTUHdwMFfet+gHo1ag
X-Gm-Gg: ASbGncuuGEAP1BvuYwRl+yx/+VRKGKLplKzFkwv3hDy0tDXftwgtlEwazD5V8qxN9cN
	trJBOo4nahW5lijzb5fRj42UGGXreFSrIXGiPuZsxuTmIqrIbllv5dEdAesyhGbf+G6BFO2ZaKV
	gADQ5OKpKBRgAY9blGGyldBK27Fcs64YU6gkBtRXN6tMo=
X-Google-Smtp-Source: AGHT+IHzD54Fj6IokGVQdjUhFbe8Csd3tzHj9n9EOYmMBum9+2EEYQeFuaLuxgpbYaz6FvLy30pxOmxpz7itK2dKMVU=
X-Received: by 2002:a05:690c:18:b0:70e:2d30:43d6 with SMTP id
 00721157ae682-71406e153a3mr100988877b3.38.1750947242533; Thu, 26 Jun 2025
 07:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <184C6E7578662DE2.823@lists.openembedded.org> <cf6b6313-bae2-4a87-b2ca-c5f076507109@ti.com>
 <DB5PR02MB1021308634340DFD241895C3AEF7AA@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CAPoiz9wQpwu7vCC7FPPT5_3W2WEzrjdxtrV5JYF6iGCz8354uQ@mail.gmail.com>
In-Reply-To: <CAPoiz9wQpwu7vCC7FPPT5_3W2WEzrjdxtrV5JYF6iGCz8354uQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jun 2025 08:13:35 -0600
X-Gm-Features: Ac12FXw_fXLIzxP2m0lGQyHsksEPThsAA1CxqIcbJG_vdVmduB0At24uVXF6C9g
Message-ID: <CAMKF1soMbsG1QA2YTQXrjbz8S_BEXLMp46jtJqVcGzLGF6HJNw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: 5.29.5 -> 6.31.1
To: jdmason@kudzu.us
Cc: peter.kjellerstedt@axis.com, "reatmon@ti.com" <reatmon@ti.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 14:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118125

On Thu, Jun 26, 2025 at 8:06=E2=80=AFAM Jon Mason via lists.openembedded.or=
g
<jdmason=3Dkudzu.us@lists.openembedded.org> wrote:
>
> On Wed, Jun 25, 2025 at 9:19=E2=80=AFPM Peter Kjellerstedt via
> lists.openembedded.org
> <peter.kjellerstedt=3Daxis.com@lists.openembedded.org> wrote:
> >
> > > -----Original Message-----
> > > From: openembedded-devel@lists.openembedded.org <openembedded-devel@l=
ists.openembedded.org> On Behalf Of Ryan Eatmon via lists.openembedded.org
> > > Sent: den 26 juni 2025 01:57
> > > To: openembedded-devel@lists.openembedded.org
> > > Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: 5.29.5 -> 6.31.1
> > >
> > > Not sure why it says 1/2.  Ignore that.
> >
> > You probably subconsciously knew that you should update python3-protobu=
f
> > as well. ;)
> >
> > //Peter
>
> Confirmed
>
> | Failed to import nanopb_pb2.py: Detected mismatched Protobuf
> Gencode/Runtime major versions when loading nanopb.proto: gencode
> 6.31.1 runtime 5.29.5. Same major version is required. See Protobuf
> version guarantees at
> https://protobuf.dev/support/cross-version-runtime-guarantee.
>
> git mv ./meta-python/recipes-devtools/python/python3-protobuf_5.29.5.bb
> ./meta-python/recipes-devtools/python/python3-protobuf_6.31.1.bb
> and
> SRC_URI[sha256sum] =3D
> "d8cac4c982f0b957a4dc73a80e2ea24fab08e679c0de9deb835f4a12d69aca9a"
>
> Seem to have addressed the issue
>

Please send a patch for this upgrade as well.

> Thanks,
> Jon
>
>
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118123): https://lists.openembedded.org/g/openembedde=
d-devel/message/118123
> Mute This Topic: https://lists.openembedded.org/mt/113835772/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

