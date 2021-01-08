Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.1335.1610137921347575123
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 12:32:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TnxpDyXS;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id 7so7512073qtp.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Jan 2021 12:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ceMzGlTDq9K95DMwMNzsKYvOn40sYj8NRjCFp3eBuaU=;
        b=TnxpDyXS4q8dxPOqSMmSPH6uZnVU3k7VGNjxpsQOspIrn1ODfR3YIXk0EWR0ph5Gyr
         5ypJP6ZpoyGN8DJWzC69JN+AaRSB+btrJHZVj50YRhFtrSolk0uHf/SBLly36VV/+YAi
         4jJ0RBD7f1oI/ki+98rsjg5KP8qvxsKx0eW+Khv4s6yJsS3D70o8bGKj3NMmqQvWIMEQ
         neEFbcGDVtbDGE9lg6PI2eswAiNP+gclrrKvM1OHNi2xJRnwL6EUm+i5iQ1udFvoF+q3
         TNYru6l/c3EHhM2jrfH77If22f2SkqlA8/eh8QtU5eD2Jc/1aCqt9STGj+jo5mR8/Px2
         5oxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ceMzGlTDq9K95DMwMNzsKYvOn40sYj8NRjCFp3eBuaU=;
        b=MwY11vz1Syutq9azXqLNQxN1VPdeFF2NPqIGviFQEkqUDioXyKnI7hc+FzMjWSo8dS
         q/yGtAActkDI2A3jB+bGTeCFIEGjuC0YgQ9iy9cM21XlKkUWt3T5Y2AvUrVX3JdJTOU+
         UfBs8CRQsn+ZPOWKc+/bIxGsRz7E4bU26hMqIOtnqEnVvX9R7Kxo8FhvApni6H/g0Sms
         kKEdaZGhbvKJH3n5DAZxAY2iM26PF/AEM2anxC4o9nDQ1exanw6jHNHFPmihCCZnmzj2
         a2hTaDUpqFXTTTRHEGvproyd0FB6vZd2O0IVwsXmeKa9v7aYrIGwzSBTtV1UNospvItJ
         3Pew==
X-Gm-Message-State: AOAM531mfX8BkZzb58e3UBWG6J090KsAIV1eyR8ZhSsvuGt17Phl2VCD
	Dt2YTn6YvFsjd+yZUOS/8y9HQ98sNQOWu59z8gs=
X-Google-Smtp-Source: ABdhPJzmMbfLr9wky2Ud/XoqISqgoEMlahYkLq5zHXsC/VrtLNuFVIPgLipK/RXdBzR2zBl+RgHTwv03h/GxJHASr9E=
X-Received: by 2002:ac8:3417:: with SMTP id u23mr5333032qtb.80.1610137920466;
 Fri, 08 Jan 2021 12:32:00 -0800 (PST)
MIME-Version: 1.0
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
 <20210106151717.1779543-4-schnitzeltony@gmail.com> <CAMKF1srRCWhAcsVaNM=rou6_ys+KC_16PyB4KGB+Kj2vjfvZWQ@mail.gmail.com>
 <CALbNGRTreOS2m9z9tOp_Z3sGrVVypZr=5J9RBFwwnPF+fieYcw@mail.gmail.com>
In-Reply-To: <CALbNGRTreOS2m9z9tOp_Z3sGrVVypZr=5J9RBFwwnPF+fieYcw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 8 Jan 2021 12:31:34 -0800
Message-ID: <CAMKF1sqht8W9eaqY6sVAVEqq_fKXsefOkjCSaLF=eCt-f+6vMQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 04/28] libxfce4ui: upgrade 4.14.1 -> 4.16.0
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 8, 2021 at 12:29 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Fri, Jan 8, 2021 at 8:54 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > I see an odd failure on qemuriscv64
> > https://errors.yoctoproject.org/Errors/Details/540832/
> Hi Khem,
>
> Have seen this either but assumed it was caused by going back and
> forth during tests. Worked around this by cleansstate.
>
> I think there is some race (unrelated to qemuriscv64): when I saw the
> error, the file was there. I looked into that already but did not find
> suspicious yet. Have put libxfce4ui back on my TODO...
>

yeah it seems intermittent, its already in master so will observe how
it fairs in CI builds over few days
and if its too noisy we might need a quick solution

> Andreas
