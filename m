Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CE4C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 17:58:05 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.27839.1713290276346733989
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 10:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RHO+g9SJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6eb812370a5so1294577a34.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 10:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713290275; x=1713895075; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nw+hM4wSZUxERKP+CS61ZGv5I2ZauSIv1QtOYRR7u+o=;
        b=RHO+g9SJpfEE+nULbGYkvXipZprFwnaytvEoqfJkaSUBcwzU4vZl8XXbPHfUqF4mLx
         OcGopiT1lPso1TUhtIsnz4lSJArPTqFQ7uOSrfB8Pakc6i/IpaxE4VrLOS054+sIB99y
         1j+Vhe7xBzKXllMC3VGkifeTb/3YQ32QarZhKZlM4c8QthNh7thY7Xdt9smhJzYPmlid
         efzWpo/wX9tlEvurQuP48Bnmrpu/TG1AYT74NIkAi7qhdUStquVjBnRkKfWGHgnqMBr/
         IULoI16KEbywK98Oe1WbQ+OOcYO/IwTQTcKRYddZv3JgdbMXecMSrNxibRfvGqTkBE4v
         MHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713290275; x=1713895075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nw+hM4wSZUxERKP+CS61ZGv5I2ZauSIv1QtOYRR7u+o=;
        b=aUq7tC7iitL/oZP6RqYYesn0J/pgw5rqsZ/Jzwgar4bId/WAF9lN9QfhKrowFnqyDU
         LWL1pZxD64JGL+7g0CR6zZEOy6EFTXgLfQ0Cuzk/OxtxWHLb7Pawf7Dm8PfTTY4hoaG4
         CCPlzNouy8sESz8ILi25TVEGUtuP0yyQplzP+n7QqGolRizBHTtZGhtXpnPA6gRpr5K5
         Chx3KhyBN0HFzVHx5FOSjleApyjQ41IOgnuzQWuBFc7lzrRF86idMJndSTv0XY5ENVWa
         8+2Isz3+HZOBreV1QNRmr5O4/9q+0xhAPcEKWlyoTKgyD985QVgU2czXpcknvj88hyvh
         JnlQ==
X-Gm-Message-State: AOJu0Yyy1ICc1da4cR31qG4UNW71oAZGpXHe8tzJ9zAhrS6gTPv9aZND
	/3Dm7IAw87AiMuTUUIyWN18Q1HSK0LwVRasyrw/T2G+qYhnW8UmtADCi0UVo4i1OFdnytNsNw6n
	bGQDvSCdGU/QspA5d+qPzhHuWAwIB2aDa
X-Google-Smtp-Source: AGHT+IGmSRJb3l56Jpu6EvMlEAAZ23w3WU3ayLXgCnxemutxJJ1bXYvuaxMEZIapqTyhBSPCknP2C8CqyPC3l4rQCDs=
X-Received: by 2002:a05:6871:589:b0:229:7b8e:6b82 with SMTP id
 u9-20020a056871058900b002297b8e6b82mr15873573oan.1.1713290275493; Tue, 16 Apr
 2024 10:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240412030220.3073678-1-raj.khem@gmail.com> <AS1PR10MB56974A2ED47120F1E54B23CFFD082@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56974A2ED47120F1E54B23CFFD082@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Apr 2024 10:57:29 -0700
Message-ID: <CAMKF1sqUbeRSXXP44HMJSgmvuN9aHdzyhGvxUEYArnf=1D-pOg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] jemalloc: Update to tip of dev branch
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 17:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109983

On Tue, Apr 16, 2024 at 5:43=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.c=
om> wrote:
>
> Hello,
>
> Could we revert this patch together with related part of related commit?
> https://git.openembedded.org/meta-openembedded/commit/?h=3Dscarthgap&id=
=3D92bcaa8c1b5f7e2bdd607eafe59ea2d5799ba7d6
>
> Dev branch is unstable and not really suitable for new LTS release.

Last few releases have come of dev branch, so it is mainstream AFAICT,
secondly, this fixes otherwise failing ptests with older versions
so unit test wise it should be more sound.

Are there any other reasons you have in mind that we may not want it ?

>
> Thanks for considering this.
>   Peter

