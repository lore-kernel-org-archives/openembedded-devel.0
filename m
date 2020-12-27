Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web08.28124.1609035223670066696
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Dec 2020 18:13:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q1U+YZPD;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id z11so6434165qkj.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 26 Dec 2020 18:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7xciG7/REwx/qaxUvFbcj7UbB3f0KxaN04fJ8fp2jdc=;
        b=q1U+YZPDb7VzBVFSNu3jD4mgOJglIV5ofZ4wOZIRdTv50kvuwwBCnDyaLPnSG3gotQ
         Ykf7l3h633Sw2OaqMefer25DKZlCPz0IkWxDdWp2azwwgGkY6ZNfRAdXqzXn3cvrX1fW
         +futMn5snv+JOz6aaZ2Jxh37Fyko6HCND2jeReVZqjI0AAc9JPuPdhoYgw8wbeQOJhSa
         xYhtTCb3NcNA7uos8auK8MNmuBPMT1ZbbaYmZtxjmgQiC0+gqX0nh2hTMOBRxZLo/TXO
         IPWswWWwyFK3rcxH0Ia+vwcN1u2wunwNzCK/NX9sYeMBI0dYsYmYLtEYX4essLaHLzD/
         EoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7xciG7/REwx/qaxUvFbcj7UbB3f0KxaN04fJ8fp2jdc=;
        b=C1ZGIJsWf4YTy1lDhTAaPFeXEoadcdWvg5Gs5v03La/x1Z7SxXNCoyDRRRkO9F1tcX
         aM7m6knkac2fEWn8tCRwV4lB9ikLCQAVXbVxf8bFo/NWYp0lXYH88ND9w9C15UalBZM5
         Tml2rloSs1IMWPQJBZHejxFsBHg8XrfuGwgejevx5bt6MBjaAvgKMEN2hOb+D5t0HVtS
         6rLu7ykhJVbDhLm5Cn4/ae+4OZIE1x5VsbDY4o71fCtMVHYV6XMgSPdw5WvMOMJCb0fZ
         TX+PLzRaOAw34DmMhWTVdjpwNpCkFYMCGLNRS/77e1QYaCWGpi6qbCu1GISg5Pwjv+LW
         rAHw==
X-Gm-Message-State: AOAM532XsgNZ1aeR0TCMKr+0lZ04T42cz5guctPqpS7AhyEZFarWvAIQ
	KMSQLFG9xsmW6LmXF7NpRsojsaeRI7UeZjcaolM=
X-Google-Smtp-Source: ABdhPJzRik0QynTgvthNgdlImwjZusQjAylFGoo+Khk6zDoiI9b2NhCF7FnoIuG3F2i+AfJ486zlIDexnwZctXt+D5E=
X-Received: by 2002:a37:744:: with SMTP id 65mr37522199qkh.71.1609035222775;
 Sat, 26 Dec 2020 18:13:42 -0800 (PST)
MIME-Version: 1.0
References: <20201223031046.513846-1-dmitry.baryshkov@linaro.org>
 <CAMKF1srVQdu6RfOcROq6ca4ppUGpr5BOSZBDPTNKSGTLGnj8HA@mail.gmail.com> <CALT56yNSY9kx=B1YMtzz9HUw48D8ujgnVRmjWEn0V-oQZ7+KAQ@mail.gmail.com>
In-Reply-To: <CALT56yNSY9kx=B1YMtzz9HUw48D8ujgnVRmjWEn0V-oQZ7+KAQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 26 Dec 2020 18:13:16 -0800
Message-ID: <CAMKF1sp0S2fMwNQk6ntoVmswh1DmzdjbYzmOaASf83qBG=H1kQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] android-tools-conf-configfs: add an alternative to anrdoid-tools-conf
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am seeing another error on rpi4-64

NOTE: Multiple providers are available for runtime android-tools-conf
(android-tools-conf, android-tools-conf-configfs)
Consider defining a PREFERRED_RPROVIDER entry to match android-tools-conf

On Thu, Dec 24, 2020 at 2:45 AM Dmitry Baryshkov <dbaryshkov@gmail.com> wro=
te:
>
> =D1=87=D1=82, 24 =D0=B4=D0=B5=D0=BA. 2020 =D0=B3. =D0=B2 09:34, Khem Raj =
<raj.khem@gmail.com>:
> >
> > I am seeing this warning
> >
> > WARNING: /mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-de=
vtools/android-tools/android-to
> > ols-conf-configfs_1.0.bb: Unable to get checksum for
> > android-tools-conf-configfs SRC_URI entry android
> > -gadget-setup.machine: file could not be found
>
> Oops. Should be fixed in v2
>
> >
> > while building for qemuriscv32
>
> --
> With best wishes
> Dmitry
