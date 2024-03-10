Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD5AC54E58
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 14:40:53 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.38752.1710081647656191829
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Mar 2024 07:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T11fNVnh;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-412f62ee005so25225115e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 Mar 2024 07:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710081646; x=1710686446; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMrst3C80V7PWWwTVNqQpclYHL3ee+i679vTUSffmsM=;
        b=T11fNVnhjj3LBkoj8dz1v+jsGUpzGwPmy8qVJO/aKbggqxmIrP6I0I6q6snZakehOF
         lnhjjP6K9Hw60g5pOoKz0U9b9DcS9B2C/3dUp38N2GVLHFkbKArDODxZVpdIlEGeZBXy
         1tTMxsb2JE7W7BJ1KE6uq1E5cN3dmcmGNtpRo8Sa0It6sQnRowXqyY8510ytR1kwvtnh
         2dwSCdFTip2YkPmS18JbUXeOL06bqEP7uyVyk2QA7cdAi5uxF5I/OYiYApKF83WOmSfO
         GMbk8k8LmTYkV05BPWg7zEWaP3KEYGjUIr0PbaxfhHiT67alTlCRhZW59aUhIR0SfdbA
         PkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710081646; x=1710686446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMrst3C80V7PWWwTVNqQpclYHL3ee+i679vTUSffmsM=;
        b=aN9R+YxFYk6uphkVKSExuPuBcG+o9p+OpqCGZePsf0Fq2OwjU2ldH2faZp6PHSTBgU
         Bh5BPMPVb0qoVCS30OBMCbT+pTFEN0FOzN0aBx2ftCVFy+K57ywEO6M1hOc9WJcVxogq
         02gK8fIWlySBRuqd6KrLkeWKy97lrHT3XhT2pF9r+QNoud9dF1Y/whRKPPENPoBlTiin
         N6XWCLdYZbr8Xi8lQXJABXXN8+k8YAzTGGiBBm6zQx3xrkJ8aeXGgEPK8FzXdeKuCN5S
         D9s9nu0x45yGAATlYJVvAEQU1Lp01uj4OTG+BgWqG1/PINVD31Bn0QMMSaMcUdt0BGqx
         o3cg==
X-Forwarded-Encrypted: i=1; AJvYcCXPWSP6S3guRM+I5jDqPho7Bd6dosSd+9JgAX/pMDZlVsDLYoRRIRLRAwvFCEvBIRBDIqLDWaWz92CbB83nEcJGqmA/m0QY10yPh7kgGpFWPon8/shOoAG1JQ==
X-Gm-Message-State: AOJu0YweAnhK8OTNTLcOnqToC/K7lY5VYBDkKtWJ3tZJiN6pK19waiYx
	HxK8jGFZlTSZSeQJDonZDqN9rE5KyRo9T4mCMQKgGBFo9XLDdAALxv1fJCULyHoNE4vAZ97D5tN
	4iyYcjFzEjNdmQwzfTiUDmAd4Xhg=
X-Google-Smtp-Source: AGHT+IGWxcd4N2TknADP+YVVHZWgQrICftxzurwOscCa4CqchZzSFjon3vjost5BEZBYfjHDd1+NgPb5B+gXP3TG0LI=
X-Received: by 2002:a05:600c:45cd:b0:412:ef25:aaa5 with SMTP id
 s13-20020a05600c45cd00b00412ef25aaa5mr3210366wmo.36.1710081645942; Sun, 10
 Mar 2024 07:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <1709856910-618-1-git-send-email-wangmy@fujitsu.com> <17BB6BA45241C005.5850@lists.openembedded.org>
In-Reply-To: <17BB6BA45241C005.5850@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 10 Mar 2024 15:40:29 +0100
Message-ID: <CA+chaQeGXkdZVZTCp+GZVE4KKxnbcwqqJAGi0Qivqf5u9a59vA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH V2] abseil-cpp: upgrade 20230802.1 -> 20240116.1
To: martin.jansa@gmail.com
Cc: wangmy@fujitsu.com, Peter Kjellerstedt <pkj@axis.com>, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Mar 2024 14:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109258

On Sun, Mar 10, 2024 at 2:54=E2=80=AFPM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Does this intentionally undo last 2 changes from Peter? The commit
> message doesn't mention it
>
> https://git.openembedded.org/meta-openembedded/commit/?id=3D32eefcf1ca97a=
08ea85f62a72b676e447f1b79a0
> https://git.openembedded.org/meta-openembedded/commit/?id=3D5c554c9b8cb63=
b5d0d5f434c28dd71c0f1843448
>
> also looks like libabsl_flags is no longer provided by this version
> (got failure from one recipe, will check if it's expected).

this last part was expected, absl_flags was removed in:
https://github.com/abseil/abseil-cpp/commit/4038192a57cb75f7ee671f81a3378ff=
4c74c4f8e

Luckily the library wasn't really needed in our libedgetpu, so I could
just remove it from LDFLAGS as in:
https://github.com/shr-project/meta-webosose/commit/58c1ee08b35a5ffb3b3ef2f=
e142d1a78585aafcc

Regards,

