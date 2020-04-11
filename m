Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.2481.1586643989774163421
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Apr 2020 15:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LiyBPiup;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id w26so2682097qvd.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2020 15:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=weUFpAzEplWA9qDxMlW6KpoBpG/KvvXiaL/ZxT3eRhA=;
        b=LiyBPiupqzWch1YLPdo6MhI+X3R/4ixK7fGg50nK1JqI3f4zxFWNznTWf67sxTLSj5
         /ROEFPO6nMFNpyW4ewXb7TcBDvp6okITUY9mKQipYvPIzajq/TDpYNyRONFtOcKHuPZd
         8cJWaamXdpqigqOK4XOqprfVJ8Awcska3vNGbcuczifl217oCuZE7yXIRHGbUrtW/QTV
         UzXxVMu74eq8T1BSdWIEZI1TNZ9V4K+pqYQ2oRNWSD9v5jIWlINrgkv0oxEcTgMuYBJr
         911uEHMUaNJ8r7Ljvl780ZEhuwn4++ABc0D2cpYBKkrEKfuXPiHV0mNqWdWhWw+/d4zz
         VKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=weUFpAzEplWA9qDxMlW6KpoBpG/KvvXiaL/ZxT3eRhA=;
        b=U65oZDAehV+s0vek2T35f61KXQ5bbw9cN/q8JuQNt41shOMaApL76HzIN4IMdJ51MR
         P5gKkhe3uYt9DcIvIgtbd3waHds2AiD35M+ozd4TkPrXp4bGEjYCPOLbpLSiLT/4YTkb
         McdvbyrIXShwrkfZ2xXeESYqvPOpBoFJKBKT+AGW5Tk95jnUV45Yns03biCEi71nVgZt
         8flLONEqYcF7AHMdiwBRQeNso4kq6MCGaHc/GtsOnRJ1wMj1Ga984nrmCdrDZ/eW+mrX
         R/ysd4micca8sMKyRdFHOQ6eXSGwy4jx7Oxl80PTguc7CYQS1dd942UCz6IVsJPrGOPI
         +EPw==
X-Gm-Message-State: AGi0PuZv8KRKlhUH/SblSDJKvbhcJ3plM3tTJH3dleqzjcSL3gtbBhG1
	LfTQIAcvxjSYr6qL/QIAb/Z70OlzEPKz00ivQM7isCPG
X-Google-Smtp-Source: APiQypJWQPrlnUG0bnZxRv+6ZITb7xPI7r3CAVA3pq2zxtF7zxkj8LIC9Pq7XoqS04qZld+Zb/LGNzFQNdFG8a4G4V4=
X-Received: by 2002:a0c:b78e:: with SMTP id l14mr11146419qve.4.1586643988646;
 Sat, 11 Apr 2020 15:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1so7NBe8eLiJmeR0aWcf+A8+624qwRoR_RMHVGSQ94Hz4A@mail.gmail.com>
 <7592.1586513853636817343@lists.openembedded.org>
In-Reply-To: <7592.1586513853636817343@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 11 Apr 2020 15:26:01 -0700
Message-ID: <CAMKF1sr6sdqpa6KVMvTXWA3fKoCCFGR+UF-V7Z5wYVqkcR_DYQ@mail.gmail.com>
Subject: Re: [oe] [PATCH v2] Add nbdkit to extend backend possibilities of nbd.
To: przemyslaw.hawrylewicz.czarnowski@linux.intel.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2020 at 3:17 AM
<przemyslaw.hawrylewicz.czarnowski@linux.intel.com> wrote:
>
>  On Thursday, April 9, 2020 8:53 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> > clang find an interesting failure
>
> >
>
> > 22:42:57 | main.c:116:2: error: embedding a #include directive within =
macro
>
> > arguments is not supported
>
> > 22:42:57 | #include "synopsis.c"
>
> > 22:42:57 |  ^
>
> Interesting indeed. This is not my sode, I am just using it in openBMC.
> Is this something what prevents integration?
>

I took a stab at it and fixed it with few more cleanups that I would
have asked for. Sent a v3 with those changes in

> --
>
> Best regards,
> Przemys=C5=82aw Czarnowski
>
>=20
