Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E55C54E76
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 21:29:20 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.18530.1700170152836320120
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 13:29:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gTPgcer/;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6d67d32adc2so717143a34.2
        for <Openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 13:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700170152; x=1700774952; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zejheuZW4qQWluO1g3nePUEkJ7JLzrEUGek7PBO08+0=;
        b=gTPgcer/c2VEJ7P0RT7ERQwXQZbqEWIeocbycaEwoXJhbx3LEXlcqYhVk97hHtpLV3
         HZiurtjs/d79mkaCBxzSbBOlRBEMYgdK4PuAxm/MXZ49j01qxp6p3N4rvE2eeHBku2OB
         fyL87n4cNAtyaP+kRkQ6rB7gZvrNzQcTQjrzgZbwpo4o/4dajP/60Lc2dkHMyc2kMfDV
         IDxw7itAo5qqxhmNmNBc+XA3dyvt3+ATUq1YsP4jpkhaskLfmFXnXNOwBFqE5+jGmnp2
         Om+UFv3NB/k9JfhsSTVdj2lRXSC/+isj1qw+YCVp3yH6S3OU3Vq4yhHWpxrpH7uGWYxa
         3vdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700170152; x=1700774952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zejheuZW4qQWluO1g3nePUEkJ7JLzrEUGek7PBO08+0=;
        b=TYQ1JKuGsyESrgQxO5RmGLodN9uGKENbTaK4z/4403TZk3cDdjPCWo8iUi2b9/cc+6
         AlO9W3gAI4i+dru4LB/pMHSULoYUl2Kv3Rpj+EfBvVMVq0KmnjtJAmYvxW8I+1N+WwcA
         bYqXxohB5Hqb+N466TI772FhIfJl2AD5wrGtn/Sd9FWi6MehZWGohLa8lOg4zjPCPNd/
         ZM0Fr7B5NKy2MUNoXOrUl0BcWL0NUyK8/nsvgfSwFykjdsuotSslwXxOa/fIxYSSh3UV
         RAQXeTvTAybeyeTVuxt5pG2UguHrzmWqEUC6KvYfxMUM+rLPAtACh79OCwRaeHZjqdrj
         5WCw==
X-Gm-Message-State: AOJu0Yzv0CzGODfkEuSCIFHBe5aHLD0giJZ1ug7kG6UMRLVzsse53lCY
	4UDcP5BQylMhw34qIEEpQc+Av8MtBdAEum0t2Rf4doSYDvs=
X-Google-Smtp-Source: AGHT+IFiUzzUiUywphftG/mGKHycd02y+3GNfUdRTZp62iMV0NkunsflhUfUeH5kWRO3W8+zWjNJwQAXY/gR10OJmnE=
X-Received: by 2002:a05:6870:4994:b0:1e9:c224:bb91 with SMTP id
 ho20-20020a056870499400b001e9c224bb91mr21870384oab.38.1700170151948; Thu, 16
 Nov 2023 13:29:11 -0800 (PST)
MIME-Version: 1.0
References: <CAFWmYv0mYFjLuegx+LyVQDQEVmzXUyuU49qjsH7Bw6WOkRVaPw@mail.gmail.com>
In-Reply-To: <CAFWmYv0mYFjLuegx+LyVQDQEVmzXUyuU49qjsH7Bw6WOkRVaPw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Nov 2023 13:28:46 -0800
Message-ID: <CAMKF1sp2Y3sB4KUTEYWc+fedxy-fkzud8DqO4WeDo3yJ78-piw@mail.gmail.com>
Subject: Re: [oe] Maintainer for Qualcomm Adreno 650 OpenCL Library
To: Matt Dorsch <hnd@dorscm.wakeful.net>
Cc: Openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 21:29:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106829

On Thu, Nov 16, 2023 at 1:19=E2=80=AFPM Matt Dorsch <hnd@dorscm.wakeful.net=
> wrote:
>
> Good afternoon,
>
> I've run into an issue in the OpenCL Library for the Qualcomm Adreno 650 =
chip. This library is delivered to Ubuntu 18.04 via the package qti-adreno.=
 The info for this package lists the maintainer as "OE-Core Developers <ope=
nembedded-core@lists.openembedded.org>" and a homepage of http://support.cd=
matech.com . Should I be asking for help with the issue here or via support=
.cdmatech.com ? If it helps, the issue I'm seeing occurs when I try to use =
clFFT, which is the standard library for performing Fast Fourier Transforms=
 via OpenCL. I can debug far enough to lead me to think that something is w=
rong with the OpenCL barrier function for the Adreno. At a higher level, mo=
re than half of clFFT's 16,000 self-tests fail on the Adreno. clFFT runs co=
rrectly on NVIDIA GPU (including all 16,000 self-tests), so I suspect the i=
ssue is with the Adreno OpenCL compiler/driver/hardware.

I dont think its part of core or other openembedded layers. So I would
suggest to dig further and maybe go via support channels of the layer
which provides recipe for this library and then if it comes down to
toolchain or CL libraries from oe-core then we can help.

>
> Thank you in advance for any advice you can provide on where I should go =
to seek help.
>
> Matt
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106828): https://lists.openembedded.org/g/openembedde=
d-devel/message/106828
> Mute This Topic: https://lists.openembedded.org/mt/102635817/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

