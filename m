Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web08.19769.1607629177652899857
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Dec 2020 11:39:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OzksHjy2;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id 2so6426253ilg.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Dec 2020 11:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W6n6dJ0A3vslvbIaDFIUuZJHf9FGPkuo6Pn59Vrz2Ks=;
        b=OzksHjy26/NputFMuHXr42zukYzvpevLE3XN1m1AyyZzD3l7IeULZzlnIr0ikFMMMQ
         gHVvOGRj9yIBIdHnoKcsYPQRRxVjDeHGJ9hh+c5FIlca7Iy1S3BKe7N+yz/NzPI785dg
         oA4EfOHaZmtg3J2jj4tFn9M1NB5jti1updDpu58ojfptmXNEz+AElhwdMU4ZaXyY9jrE
         E0TRWHoy+dBQXwaJyMLaf0DDZJRAcgSjJ8xm5/MGIJT/9aTII0g9dHJhn8tZM+6bJyZB
         6l3Gk9Z5JJcMMAAdGKZOSNlvoy1zWunfeByaKOGJmkvHwCtPs3P1DASSbtQpS3KeXENX
         gAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W6n6dJ0A3vslvbIaDFIUuZJHf9FGPkuo6Pn59Vrz2Ks=;
        b=HlOf1SikqQCACfQmPO52Mfrb0WsoBMCsv/iVOkxwwUeBMZOOPtjZKy9CI5odgVmUGR
         RUqa71wvvyHN/CJdfHoratvx8uk+bzFuZ57DQJ2BMJS7tSeFDk4bVBzFiPl8CbPvm0Ps
         jNmjpnMsP+oqw01VDTUgfbsA9GitPO8eF3FqGFxkNQoHmGFHXalc/DVXOEjPX5HL/okR
         SiYncQzCyR0c+FRpRb+Fe3CXSZQM75An4t3SPMzfGZxyN3imFw5CICp/bIMPycNaW+hm
         84cxRSuU5lOD2Oue2gLIt45XxQKBHnI7NZFjrYNRiG/7S2nDckqpIy+uyQTrAYsrFi/L
         fioA==
X-Gm-Message-State: AOAM530XdjRwQb5XNun2WPdh8ZMOvDVvIDYwy2LlgjyQjGmOCKiNvK+N
	FoujzxhHBC6+WqUwmqG4fOBoo8lNlbio5FduFqI=
X-Google-Smtp-Source: ABdhPJz+zJlkegWqdj/rRYSwAwV4vepzCp5Dbl/xa5GnQ3UtWkDq4jonC22n8MdRZhPsWUt0aMFgQe/TUQ2InCQYUCg=
X-Received: by 2002:a05:6e02:1192:: with SMTP id y18mr10707666ili.58.1607629177070;
 Thu, 10 Dec 2020 11:39:37 -0800 (PST)
MIME-Version: 1.0
References: <20201204040829.38707-1-twoerner@gmail.com> <20201204040829.38707-2-twoerner@gmail.com>
 <CAMKF1srUKMu4BKER5xBhc5Kw5tOoqPE3PgGHYWAiLx7u0yEHig@mail.gmail.com> <CAMKF1sq4bSW23uEmcuD8+W_+yvi0dKKpTh_-aApasRPb=heHGA@mail.gmail.com>
In-Reply-To: <CAMKF1sq4bSW23uEmcuD8+W_+yvi0dKKpTh_-aApasRPb=heHGA@mail.gmail.com>
From: "Trevor Woerner" <twoerner@gmail.com>
Date: Thu, 10 Dec 2020 14:39:25 -0500
Message-ID: <CAHUNapQMNV5Ei_2MKYyaWKyD6xQ6_U_sZbwRdaGCwBcWWnc-tw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3 2/3] glmark2: update to latest
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000007a9ce05b6215678"

--00000000000007a9ce05b6215678
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 8, 2020 at 6:55 PM Khem Raj <raj.khem@gmail.com> wrote:

> while I have applied v3, please send a v4 addressing this change.


I had wanted to try going in a different direction, one that didn't need
the DISTRO_FEATURE thing.

--00000000000007a9ce05b6215678
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Dec 8, 2020 at 6:55 PM Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">while I have applied v3, please send a v4 addressing this change=
.</blockquote><div><br></div><div>I had wanted to try going in a different =
direction, one that didn&#39;t need the DISTRO_FEATURE thing.=C2=A0</div></=
div></div>

--00000000000007a9ce05b6215678--
