Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web09.628.1619212284925447715
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Apr 2021 14:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YBGYy0Us;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id d1so12910588qvy.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Apr 2021 14:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gCjfg2iCvc5r900H/gnyYIOqtdl9YxVmnaG92wqvTUw=;
        b=YBGYy0UsqgP6KShYzOq6/GVwNQ4K4Mvr2SwzIChT+eujgYHWjp7Wjbi+FIKcks3+pZ
         8KiWD6RZiSnTHLZEqBML37CR//UYDR0N1+umf45xB2qzEB2EoOycieMCrgndHBE+aMHF
         DCZ3pi9+BKwe3GPt+RVF+rEN2Lz363JS9h2EIc071LdnBI+nz5Hjb2k6VzDlwXT3+v+v
         g0AA83Og6Qw2yP2DW8kK2dSikcqnP9auKY+nMc4tT8WWcp8CFeVY4pU8Rl7StlwTw5ap
         F0qllKefZrF453uJMLLSnNbWEwtvmFCpb6cjA+DDa8ax46EG6u32MfdhLVNlSyhUdv59
         0XrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gCjfg2iCvc5r900H/gnyYIOqtdl9YxVmnaG92wqvTUw=;
        b=BT1zUiW1tChLXkNKvHrL5699T4Luy8pYEFLK2KuUWAC1FAxLSqSLZVJ/H3rl6LH5E8
         EH/C9YKHlZCFW4SNdY4/5thz0PJCHocUElAg+4/grrBOAX1LicYM4obexG0T3dS3OjwK
         Z7nv7mwAkWIUEOWVAplU4jmTsBiyJf+9a/9f4nRe027FUk1GB3ePF9tsg1rp0K81Lk2R
         3hWiMsBvaMIMXtz3tApLFOH14kBTNolzPrSySAkpcZQPLlNYt4FwTK5WSnmab0lBW33x
         I8w8TYcGm299Axdui1SNIErwEEYjdyMJCCfZaRCp4H6rDQSSZvAvLCU8ufMF8Ju/kiQA
         EcKg==
X-Gm-Message-State: AOAM533WOc9/0qotZhdjTbsrHRR1FeSFEZ3ftyhz0PD0Z8ziMD6T6t5w
	ZFcgNUkDMZrePZCZv2hgU975daxZS/Qj1euFhh5KWwuG+tL0rA==
X-Google-Smtp-Source: ABdhPJzB5gxiI+7yaFyOdUvtQMvhLjKbNfax5vkdz5NwgArODMWHJPpoIXT/+5YZjef0UyQcFh1i2ZZJNJRb6GrT3Bc=
X-Received: by 2002:ad4:5bef:: with SMTP id k15mr6274023qvc.16.1619212283904;
 Fri, 23 Apr 2021 14:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210419210440.2446040-1-raj.khem@gmail.com> <20210419210440.2446040-4-raj.khem@gmail.com>
 <20210422123348.4e15c17f@kmaincent-XPS-13-7390>
In-Reply-To: <20210422123348.4e15c17f@kmaincent-XPS-13-7390>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 23 Apr 2021 14:10:58 -0700
Message-ID: <CAMKF1srte22fUKkODrUt0WvAT+pBLOzNJm8eFx-3TFeOc_awzw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3 3/4] nodejs: Use qemu usermode to run target binaries during build
To: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 22, 2021 at 3:33 AM K=C3=B6ry Maincent <kory.maincent@bootlin.c=
om> wrote:
>
> On Mon, 19 Apr 2021 14:04:39 -0700
> "Khem Raj" <raj.khem@gmail.com> wrote:
>
> > So far, we have been trying to build nodejs-native and use the native
> > host binaries from there, which has worked out ok but always changes
> > when major upgrade is done, since more binaries or places are required
> > to be captured. This patch changes this approach to use qemu-user to ru=
n
> > these binaries under during cross build. This lets them run closer to
> > upstream build process and also removes dependency on nodejs-native
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../nodejs/0002-Using-native-binaries.patch   | 93 +++++++++----------
> >  .../recipes-devtools/nodejs/nodejs_14.16.1.bb | 34 ++++++-
> >  2 files changed, 74 insertions(+), 53 deletions(-)
> >
>
> You can remove the "--without-snapshot" configuration parameter, now usel=
ess.
>
> With that fixed:
> Tested-by: Kory Maincent <kory.maincent@bootlin.com>
>

Thanks a lot for testing it Kory, it was already merged but I have
send a followup to remove --without-snapshot
let me know if there anything else we need in this recipe

> Thanks,
> K=C3=B6ry
