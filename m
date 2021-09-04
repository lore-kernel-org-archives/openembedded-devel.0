Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web09.1131.1630778055411998038
 for <Openembedded-devel@lists.openembedded.org>;
 Sat, 04 Sep 2021 10:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XqNktHyF;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id bn14so1619378qvb.12
        for <Openembedded-devel@lists.openembedded.org>; Sat, 04 Sep 2021 10:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=d1UdYBOilGb4Tc6fRuOrDYMY/Q8jx4u8da6cZQ4P8mM=;
        b=XqNktHyFFp9QEtBhcidMpOIAvgljLfMqwQcLjbzdYqTYoZTrp4qdyAOA/S+IRdWON0
         x+A4iigZkbQBDbU7KHSEM/Nps35VOvWFZ3y+NMUphXW3thwUk8KZjRl0q2oy0epkB7pS
         jpydnlYLzHMUYtwLAsw7zkMSahd2lDJ2ru6XG5OVStARlzKYTm3uysXHAbfJsrWQWvfR
         1s3tGSTET4pHAN47+ffNG3UX6PoPT8meb+2b23GmNQxRxWumtDiJr+sSRPeJye4p3VP6
         uaLsnhoDLuCZM8xA5TbENt0apUj4QBNsJvpWpEV0vYeAxurH1dxHvEQpXL1Lhtg1m/6g
         NXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=d1UdYBOilGb4Tc6fRuOrDYMY/Q8jx4u8da6cZQ4P8mM=;
        b=ggG+/uXWQzKTbN0B/ThoZYrSzJy1vZhHtA8ff/V5y3kn7T6KFZYzrGCt8rzUlg014G
         kTCxjbBVe4IMUaNQaA2zd3RM2W+3EXnY4B6mXkD1JG7X5sXIwffqQF15q5EWaNiCpxph
         e1PsjAJWyN2WmKNK93PP8iouGPIwLjnJcyGz4+gjMacLXg0nsghUwblgrc9rOcY3p0do
         QSH4eKKJ7Qc6p/aR8ENyPvY6Dvxu8EAfRaKNLhNrtJA8wlrSnWazQQL/82pMCJGEROq2
         N3eFmfRhK1TYdHVc9lpIso5JhKvlRQPZY/8i4KaWsnvn6yv9LGfFZVwEbeJBHcpYTPF2
         Hp3g==
X-Gm-Message-State: AOAM53338y59xoQ49YL6fJqS1y8jW0wjaqblbUHe0Jl8cg0boznrRLHX
	nRDqL0asNmcgtskUSbygMBfsvzNrVzkjIL2g6M4=
X-Google-Smtp-Source: ABdhPJwqVGBXFIC38aLoygAF9s+tWcOVpxSPgYZUTphZQHFbCuGojs7WzZn1UcAtVSzzzN9uUa4u0NOIRhnNBDSoqgQ=
X-Received: by 2002:a05:6214:28b:: with SMTP id l11mr4914249qvv.18.1630778053596;
 Sat, 04 Sep 2021 10:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <CA+xQMzz1cuSfo2XwV98BCCKmv=5XH65eYHdgSgH3TMNjU_d2cQ@mail.gmail.com>
In-Reply-To: <CA+xQMzz1cuSfo2XwV98BCCKmv=5XH65eYHdgSgH3TMNjU_d2cQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 4 Sep 2021 10:53:47 -0700
Message-ID: <CAMKF1sqgsG5e1j-85MCaydbukaiQbsuccLUyJThwotFjrOTypQ@mail.gmail.com>
Subject: Re: [oe] Regarding Python 3.9 to yocto .2.2
To: manjunatha srinivasan <manjunathan.n@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 4, 2021 at 3:42 AM manjunatha srinivasan
<manjunathan.n@gmail.com> wrote:
>
> Hi
> I want to back port python 3.9.5 (python3_3.9.5.bb) from hardknott yocto =
3.3 to my build environment morty (yocto 2.2). I don=E2=80=99t have any oth=
er option for upgrading my yocto version from morty (yocto 2.2) to the late=
st. Please let me know, how big is my porting effort?
> What are key points/steps I need to look for while porting?

The yocto versions are quite far so it wont be a trivial port. I would
suggest to take hardknott version so you can avoid override changes
and then do the needed to get it going on 2.2

>
> Thanks
> Manjunatha Srinivasan N
>
>
>
>=20
>
