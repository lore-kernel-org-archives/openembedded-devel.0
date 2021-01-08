Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.1506.1610138772394706070
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 12:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b7+TfCJR;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id y12so51420pji.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Jan 2021 12:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u6vUDTWBPk7MyM7wNi9P91TL9KfrPTIcc4x8pcbxS5M=;
        b=b7+TfCJRNCcVc3EWZf8CBHJgMSX5IZAChbsYtSdvEZRJt3S3eul3kZ4PpgsW/ACMN0
         gXp/BPSHOsqd2c8jLahD1hpSrgM89cnkxTlPhJHY4R4CS6Z0CF/t4oBWYbpk6vOe6odO
         kj82RCfmsBaDr2YUSSqmy/GaHn2wqRBk2RkA49E/zOhTBIQU3QBCThQPPYj0NAnysxFU
         F18AUYB04NBZuSsPQOSW3TkkS+Xp0OYX4qKREdg60cmJWPdV7LxuDJi1WmbgaPzMQSI3
         i9F56tHpKwNKGp45SV9Xt/kBIs5jghgf/Bta+rynIHqjAsKP5RbcCIkR+vkeZEBcH216
         4XEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u6vUDTWBPk7MyM7wNi9P91TL9KfrPTIcc4x8pcbxS5M=;
        b=ByaxNTy8dBtlEZKrSoflirZE08hihOFzOq80Ji2ogKfkFZHZ9Dpafi9koirdhKe0hN
         JqDJWMqz/CCTDia8LZjHeOa2UQvqO6GNiZO8ZQHTilLHdSPTwNT7ifLeEX5EnL9rzroW
         2RJDeCywMmZ2xLEjHRZgM5gcg2PiXSmjCJci0KscgnBTVUCEpuw1AQgkIgjMTfNcX4RL
         6al+BgpTjIpp9LutTQqGJPeINO1BjUe7afBWFtuuxrc+MPLnWAtSwbYCvMrF9cRd2b7/
         7uUyiAUPGXMVH8DIviWvD1YeP7Vw5BW2qam0MXy/OzLW2pE2K9dfJjr3LmRbwfmWNBan
         UMrg==
X-Gm-Message-State: AOAM5312FBZCkuA3fgPuug7q7PCxQ25RL4Ebh6oM8l40VHErjlaVj4uD
	qpZXBsQKvUjTRsNysJp3LstOX/bZh6DmJ0lvVtk=
X-Google-Smtp-Source: ABdhPJzO2iCTHegS8/pg3k7tksfLBRz7aEFafKhI+Dk4ZZFPCFXdFe8+dmSzzggPxWxO5kRuRWWEilcsyXHrAbSLtIk=
X-Received: by 2002:a17:90a:a2a:: with SMTP id o39mr5533571pjo.161.1610138771899;
 Fri, 08 Jan 2021 12:46:11 -0800 (PST)
MIME-Version: 1.0
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
 <20210106151717.1779543-4-schnitzeltony@gmail.com> <CAMKF1srRCWhAcsVaNM=rou6_ys+KC_16PyB4KGB+Kj2vjfvZWQ@mail.gmail.com>
 <CALbNGRTreOS2m9z9tOp_Z3sGrVVypZr=5J9RBFwwnPF+fieYcw@mail.gmail.com> <CAMKF1sqht8W9eaqY6sVAVEqq_fKXsefOkjCSaLF=eCt-f+6vMQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqht8W9eaqY6sVAVEqq_fKXsefOkjCSaLF=eCt-f+6vMQ@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Fri, 8 Jan 2021 21:46:00 +0100
Message-ID: <CALbNGRT_Jgtqd=LzHSNxBOvowHWLDx481tNsJ2bBiR=G2uaP3A@mail.gmail.com>
Subject: Re: [oe] [PATCH 04/28] libxfce4ui: upgrade 4.14.1 -> 4.16.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 8, 2021 at 9:32 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Jan 8, 2021 at 12:29 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > On Fri, Jan 8, 2021 at 8:54 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > I see an odd failure on qemuriscv64
> > > https://errors.yoctoproject.org/Errors/Details/540832/
> > Hi Khem,
> >
> > Have seen this either but assumed it was caused by going back and
> > forth during tests. Worked around this by cleansstate.
> >
> > I think there is some race (unrelated to qemuriscv64): when I saw the
> > error, the file was there. I looked into that already but did not find
> > suspicious yet. Have put libxfce4ui back on my TODO...
> >
>
> yeah it seems intermittent, its already in master so will observe how
> it fairs in CI builds over few days
> and if its too noisy we might need a quick solution
>
If you look in the logs and search for
'TOPDIR/build/tmpfs/hosttools/install -c -m 644
../../libxfce4ui-4.16.0/libxfce4ui/libxfce4ui.h', you'll find it
twice. Seems there are two make jobs doing same (sometimes at the same
time).

This is at least a start...

Andreas
