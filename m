Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.4518.1621672108536401988
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 May 2021 01:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vQv5YQkJ;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 6so16103664pgk.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 May 2021 01:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nWdt9UFUNl4PhkZZ8FRBbEZOfL0iVNzu8sKRJtOY+l4=;
        b=vQv5YQkJUQcoN4/TgJIsF3FeJqkgYKxobOQ4UHgGKKRTsMBFcE9WcUHo5A6yRztkCC
         hBFcLEKUBlKProiHwxL4hP05lPx2c6F9azXRndIBk/r34MPj7N5lRI2dEKqerp+6QN9p
         jFMIYOMmBbtOKwNkwsVHVAHAWFvyJPWMSnr4Js3flxBWhKk+jkOkB6geHNhQXikSfguP
         yaRjx9ydjVF3OMUi209ihx8xvImGJcp6tNTakiFr5X/IiYuU0MXvJLbrHa4bkJAzT/wk
         MKdoSk2H6SgiggzTfKBkCcBSz3oOyFX76O19Wr3W8k0mzxDkEr24GW7jdhxSnktRNGyb
         Oi/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nWdt9UFUNl4PhkZZ8FRBbEZOfL0iVNzu8sKRJtOY+l4=;
        b=QRGvE+iLQjd4ho+0bYTrxSJRQrLMlV5NpNVcXQwVmQq46qPYO+7AfQIj+defS+5YDy
         XcH73+P8vG8k/NfR7XP1MloQZoyvcJBrYmj7oG3tHC8gAtOPqoAO8x/v68uLRDNjL85E
         KbCc3PYtk31uXDKcH7C4SVVlsVMx2r0vvZP8GLjqeIrZk2haJLrCx/Z2k3cc/QYDwKGx
         9/5yUCYaMvh6QlXU3BLaB9NRvu7IbPnXEumImnfke9ROcbGXgYjFL4xo5sGFELJV1kpa
         3Cfag3vWvo5TbGoU1PjnI6aKuvxXrS9+ATv3oxYMI7LjXynujiiDgjVDKNfduTBixky9
         qHCA==
X-Gm-Message-State: AOAM532wvKdGqvdAN2YzeQAhT4IvpmjBBSvI5a4ZgfCi+lHxjtBhh0Fe
	0rGmLdO1KTAiKdYd2jAEMbqrKPPlsC3tv04NhdI=
X-Google-Smtp-Source: ABdhPJxjC4xNnsDWemKwKSGG21G4b+lgH8c7SzxMf2Ikhyds965U+O+4+SYOOz3oxHBbSpxrlEofYNJ/RH1jy6LbDE8=
X-Received: by 2002:a62:148e:0:b029:2e4:e5a5:7e33 with SMTP id
 136-20020a62148e0000b02902e4e5a57e33mr6079435pfu.9.1621672108093; Sat, 22 May
 2021 01:28:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210522013521.588774-1-schnitzeltony@gmail.com> <49c18c1b-9c00-a1c0-c2f5-c8070195dfc0@gmail.com>
In-Reply-To: <49c18c1b-9c00-a1c0-c2f5-c8070195dfc0@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sat, 22 May 2021 10:28:17 +0200
Message-ID: <CALbNGRRSz9CF+T0WKD+1A6_04Q5T6-PzaMf3MhytNDsP3-tbbQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 01/17] giflib: upgrade 5.1.4 -> 5.2.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, May 22, 2021 at 4:59 AM Khem Raj <raj.khem@gmail.com> wrote:
> > +
> > +inherit autotools-brokensep
> > +
>
> do you know what broke out of tree builds ?
Just sent out a more verbose V2

Cheers

Andreas
