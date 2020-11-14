Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web10.5416.1605357227307435635
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2020 04:33:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pyCvg5t5;
 spf=pass (domain: gmail.com, ip: 209.85.210.66, mailfrom: toertel@gmail.com)
Received: by mail-ot1-f66.google.com with SMTP id z16so11440020otq.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2020 04:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6mH2aV3v5GZs0H9Nz2dKgHwST7n8XSDN6Hp8CYVc3pA=;
        b=pyCvg5t5TNkuhZ0lZb1V6mQG6VivAiRnCyoqr3GxuFAe2N+xbLfG/RMEkS3i+jJO37
         /HHjisa8cO92v4dpVEkqsOSFOOWcUbIpo1DhH6CjNU1xG3C9EulONOdLaxcpYn1WzknB
         B93rkR3k3OUPDjfimiUxCgSaj7GdjSt8xodqYJQ+UTsnnn8RhhPesPYPGA7C2orrcWTn
         Hl03OvZM7kFOE3nwrbhkh057kWmOWqN4VVvTjYVmtKCR2DdKIIv5bWSL/shQ9i2r8uvv
         qpyZkKws0lFaKRRlP4hVJqT56ZCRS5c9SeBbTJGpJ1TMkX7VUIsfWym42ItjT60/F6Tx
         6lLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6mH2aV3v5GZs0H9Nz2dKgHwST7n8XSDN6Hp8CYVc3pA=;
        b=LZZjnGV0TdcKHcVg6SbQZRMs3cce80vyL0VVRXMWArJ4IDWzZKx2RwsldaKi5Yu+Uj
         1GSrWkQW9WtzPXSBANqPAooVSLKrDMEI/tdpzDNMYhDhW0gDWar9ushXkqzWDqApEIf8
         /TpUnemnjhqb2C0nTKOj6Uh1CALazTCuVqJcGrLTiKDC7pplDVesM/iDraILhGX+pOQE
         tOnLdiPzl1qXmTumxma80RAGDYAlT8xd7Hwn6AIe0+Uf/Qz4bN9GuWC+m3fEY/MA88QW
         HLKfUhG9fZ6X3qsDcF1jP9mzu1x1PH/+T9lPM/tvIAS57lB43nXuBfRWj9fn2KRkXNJz
         2anw==
X-Gm-Message-State: AOAM532Ho2XLUzOyg4t7ABdTQh5SlK+oREPTLbDxXCfJYrtOqk2Np8pU
	iAAZDmSwDu3NRe45ggXBh8kMpvtX9DCzHC6eOU0=
X-Google-Smtp-Source: ABdhPJz1/r+pwmDzILNTWhe66s3//Nr5pcXuVhHhQ+i5cNh//zB9a2oEvKy9aDn2lSTR9vWsczM59dd1DIqLmV5E/4E=
X-Received: by 2002:a9d:3be3:: with SMTP id k90mr5009600otc.50.1605357226654;
 Sat, 14 Nov 2020 04:33:46 -0800 (PST)
MIME-Version: 1.0
References: <20201113184045.44235-1-toertel@gmail.com> <CAMKF1sqp6u=NOxP+hsFBxATN65YniNc9N=myyZTmW3AJp20b9A@mail.gmail.com>
In-Reply-To: <CAMKF1sqp6u=NOxP+hsFBxATN65YniNc9N=myyZTmW3AJp20b9A@mail.gmail.com>
From: "Mark Jonas" <toertel@gmail.com>
Date: Sat, 14 Nov 2020 13:33:35 +0100
Message-ID: <CAEE5dN282_-GkyYTe=c45g2wGch8Bfcto8XHkWGyO=Ew-0UHOA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsocketcan: Add PACKAGECONFIG options
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

> > +PACKAGECONFIG ?= ""
> > +PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
> > +PACKAGECONFIG[no-error-log] = "--disable-error-log,--enable-error-log"
>
> what are defaults for configure ?
> perhaps its more readable if its
> PACKAGECONFIG ?= "error-log"
> PACKAGECONFIG[error-log] = "--enable-error-log,--disable-error-log"

For ./configure itself the default is --enable-error-log=yes. So right
now everybody using the defaults has error-log enabled.

https://git.pengutronix.de/cgit/tools/libsocketcan/tree/configure.ac#n107

I also thought about adding "error-log" as the default into
PACKAGECONFIG but wasn't sure whether there would be an undesired
side-effect if someone already used PACKAGECONFIG in a personal
bbappend: In this case error-log would be suddenly gone.

I have no problem changing it according to your proposal. Please tell
me, I will update the patch accordingly.

Greetings,
Mark
