Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.20530.1607632485259379118
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Dec 2020 12:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AgdpH49Z;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id az16so999915qvb.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Dec 2020 12:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PV92YI/hyP4VgPgBLe/+M0Z+GrHMk4oDd9Ppd0nTHXo=;
        b=AgdpH49ZKve1UdEn4EUWY2E++zDS1SLf+hhRUJUtGUUT2tS/gNL5xq8WhVIlN3tVkK
         r3nJNlJRO3QJHoGkYnkXyQXyZNRgTA4QGdIfTbHWlo65vNgoBH0tVtj6tOgjEAPjRg38
         kkdbXTT+F//kwesYUNzf7gB5rs5mxXgW5caAbPCXQX9bA491yC5uucF8k0aJBzeaY7nP
         U9YrMg2MRWLEy8eUO/N00o+Exsaded4MjW6ZF5QoQT83RVG32vcb/j09XiDlEzBUHlAO
         LV/yZBR1nehNQav5kJ/XsBef5oRIAt2fabioKqbB4opEuOcr1d3k4b8Lyn8ljHmV2rnB
         414g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PV92YI/hyP4VgPgBLe/+M0Z+GrHMk4oDd9Ppd0nTHXo=;
        b=K2sy9Y7g4xrHLneBcibM/6nXrjOoqqPkmEXnKMEBjK7MU1VksUJfXZxZE2/3mQiV/i
         +pssOio1kVDC2y+h3FUh2fzou/tqjgh8nIY250/KvxMMh1G2yzVmjIR3Kyt+V73PGYw9
         R1Ovnqj0srl4dALQvnsqOjRiXr2G45reZXhxB2ZpXsGhiUANkoyAeE6DviLW/vTzD/p/
         UR/I7+56heQzjb2N6HSI1d5RaJEQ7RCoCHt5bh+ogU0TPGI5eyxeFWPjkazlJzEBE+M1
         nua0hxaSgJBsSktlS3PyMKknQN2+HT96sWOOEHhRVmJvplE7Peh82/wmsFENBJjv5cSm
         lYWA==
X-Gm-Message-State: AOAM531UPbVAI4nQQKEboRKIxTIwRicedej3mAOQAm3J5rur/h4+X3Bv
	+I9YGghcaKNtjI69rl78xp/KsqK6tTELA/t8Pbk=
X-Google-Smtp-Source: ABdhPJwE79B6CPCV3QiJPvUfteY8ZIxZa1N6pBRM//FgEXJvAaZN/A/kOlUI39K60j/EDm49zgf9cN9st21jWplOA1I=
X-Received: by 2002:a05:6214:21e6:: with SMTP id p6mr11170650qvj.8.1607632484400;
 Thu, 10 Dec 2020 12:34:44 -0800 (PST)
MIME-Version: 1.0
References: <20201204040829.38707-1-twoerner@gmail.com> <20201204040829.38707-2-twoerner@gmail.com>
 <CAMKF1srUKMu4BKER5xBhc5Kw5tOoqPE3PgGHYWAiLx7u0yEHig@mail.gmail.com>
 <CAMKF1sq4bSW23uEmcuD8+W_+yvi0dKKpTh_-aApasRPb=heHGA@mail.gmail.com> <CAHUNapQMNV5Ei_2MKYyaWKyD6xQ6_U_sZbwRdaGCwBcWWnc-tw@mail.gmail.com>
In-Reply-To: <CAHUNapQMNV5Ei_2MKYyaWKyD6xQ6_U_sZbwRdaGCwBcWWnc-tw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 10 Dec 2020 12:34:17 -0800
Message-ID: <CAMKF1spwyen8hwQ7iwJ36kS=WGRZUy6sOS0EDvUX29GCH2uTPA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3 2/3] glmark2: update to latest
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 10, 2020 at 11:39 AM Trevor Woerner <twoerner@gmail.com> wrote:
>
> On Tue, Dec 8, 2020 at 6:55 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> while I have applied v3, please send a v4 addressing this change.
>
>
> I had wanted to try going in a different direction, one that didn't need the DISTRO_FEATURE thing.

all I wanted was to fix PV as a followup
