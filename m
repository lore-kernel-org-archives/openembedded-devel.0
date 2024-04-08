Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAEDCD1296
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 14:40:42 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.108670.1712587239850453453
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Apr 2024 07:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F/0rmP4e;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-343e7c20686so2447365f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 07:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712587238; x=1713192038; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EHiVf42WdYodByHmCAH5gY11s02UbiFoJCBc7B7oUpo=;
        b=F/0rmP4eKO9ppmTd6JUZ455IF38OgpoMosvhoNxVYzZQbkdS4WWhuLrDd3k61jcnEJ
         6ZyG0r2QNx2xgAjlFMkm0KEacURi8x86dYj+OOZi/ZoW+S2GpAcsRj8epzsSTSAWO/d9
         Lcm5JgtEoceYO3BvVjvUbyksGU7/VsImN6MrAaOXfQUIQRBNGhym4z1TZLcpVr73Ajpi
         LHGPdQjuTkPna8WHFqFoUXzXd1R2BqOnMouyE3VElVMpwlsHO+u+xePSar+4gnADf0hh
         +wqw5L4DYkVDPdEuDnyd5P+C85PD0Cg1MMhbXNYYC7cOjS/JuXPZq1d/KW7vljjnpBFN
         b/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712587238; x=1713192038;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHiVf42WdYodByHmCAH5gY11s02UbiFoJCBc7B7oUpo=;
        b=MYo76R2cAT3SiOgkP1hAbZhSexakDmqWNt8q6qDGvZLzMoQgpaG+Ianr6sWN3h4YjU
         ZehRVwifGe2oW2GIwoKWdrXYGBE9w766KVWmzqaqiEGfhON74ga///5mKfy4gu20LuwZ
         qysuM2+INUXsEfycsv1QR5aTyH5TWkDtm95s3u5Nlavj+vAuSh4BaTKBnH8QirGX4HdQ
         p66a9u0d7fVgfdl9AmmTYaCJnCaRrWn3uFM02PEq7cal1pxl2RNCsmCdtC6chaDS06hE
         C5+/oNcg8RzyMHtOvK6fWCucVTk4DMdQuqgRc4CGqAouNK6wzQiX3ehf/JgZLDnUtrnX
         FOMg==
X-Forwarded-Encrypted: i=1; AJvYcCWNRLatAJoryAecrJZBRpP0vnjvzQLYrtI4u50k1smgEoRQl52no04rCajTRoS+Dpq9SYZkfQCeJ2oPxuif5BDt9s7QY52aV3TmhzQ/V9DFfP0TvT62+v/vVg==
X-Gm-Message-State: AOJu0Yzt9J5n/a0tOrtGcMV3TS846DDHHt1j4hFjnCSMQOUzK1ypAu6M
	9wGiNGzeR5RVLC3ZJ4+1mz2bOmaBufBrVXDdDyU4kTwnb4pvdO3ly4H0qjA7ILN6vQh78oIW9iL
	GxYhutLOr1T7XmQTqJzc/EEy7BSI=
X-Google-Smtp-Source: AGHT+IFai2xwzSECru9/aOCW7/Ag+FV/zvmO1yRFfKHStAJh134aMwbIol5MCmJxmWLHU6O6P3haU5MW9BTDZ+jie2A=
X-Received: by 2002:adf:fc4e:0:b0:343:796f:df7e with SMTP id
 e14-20020adffc4e000000b00343796fdf7emr6385662wrs.46.1712587238281; Mon, 08
 Apr 2024 07:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240405162459.1286945-1-fathi.boudra@linaro.org>
 <CAMKF1soBViCDq1i8+ZS8k32U3rV5Hb4DbqPCXZy-+qeEgaMPtg@mail.gmail.com>
 <CAGNsrLBXGFP01o43JG8DKaLWhV9vr+cJUFaMYr=E9i5=010Cgw@mail.gmail.com>
 <CA+chaQeG4kwGjZOi4VNmk_sjQijwX_fq0s+vpZCWrqi9CXjv_g@mail.gmail.com> <CAGNsrLAdPdE+zqUHn-n9rjWLRMS5565EmCG3X2wkd6Ve+yF=Bg@mail.gmail.com>
In-Reply-To: <CAGNsrLAdPdE+zqUHn-n9rjWLRMS5565EmCG3X2wkd6Ve+yF=Bg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 8 Apr 2024 16:40:15 +0200
Message-ID: <CA+chaQfhknEQc+A9+BU7an1ywv-_F3Qd+jnX9ppvv0m3YYqg0g@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] composefs: add a new recipe
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 14:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109867

> > >
> > > I couldn't reproduce the build failure. What am I missing?
> >
> > removing meta-filesystems from your bblayers.conf
>
> no, I'm asking about the musl basename() related build failure.
>
> The build failure about fuse3 dependency is quite obvious.
> In my local build, I moved the recipe to
> meta-filesystems/recipes-support/composefs/
> I'll submit a v2 for the latter but if I can reproduce the musl issue
> and get it fixed for v2 that would be great.

Hi Fathi,

I'm sorry, I've realized it just after sending the reply, gmail was
showing your mail as a reply to the one about meta-filesystem and I
didn't notice the musl issue before sending the reply, will fix that
with another (6th) coffee :).

Cheers,

