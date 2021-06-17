Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web12.3898.1623908301704169324
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 22:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W3lvsyEH;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d9so3785094qtp.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jun 2021 22:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1EYqBPUHx36CoubfDcOrlue3UeV/LbHdM70VMhIBx4Y=;
        b=W3lvsyEHj0miGX3xVemSupcdJIU6S4Kdh4nTTtPxbZSb/5kT2ocwSk61puMHZ3OUqj
         4+yxJetwKihD3ESTEOSFCDPLE9+oDNj2cgaSb6slDMxIQ6QSetUNKDDqzG4SfNKFg8s+
         yVpDmbGXfR6MymNWEKSmvqQndvsdzGJ7fFRZHlq2m4lz0ucuT5cibTyZdMuqSjkeNdSM
         LK5n5r7RCmJjIw/h52HWSQO3jX0F71281wvipfQab1xIaaaubVbSZBgAqGyYnPnCliAK
         eFJO+CMbqk1OnMAMD+B6A91iLnChpvmluA0M0/TmCD+82kN2BxD/q6FGl8L1ePyPSEEm
         JDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1EYqBPUHx36CoubfDcOrlue3UeV/LbHdM70VMhIBx4Y=;
        b=nY7LgEK7dEwU51EJ5oyjHPHjt/4W1XC3X0J2/zqcYhaJPrdtiLo/ELWxHAZAyWKZnI
         ZCtsuWzq8J//lh9o0oKeufeSgb+MwcgD1pMouaGIhaasGkXaQnHdHE+P2/UmPCks4xhH
         izcxdX0ZuilJ0I2WAj7WLPavJHm/U4SbDeSy1aDqAajM8Rui0W6FAt24Q/qV+MiED/Gf
         8U069NB4QGCRDm5hIGeSIUdlakABAo4kH964dDuB3RklPuTjHEAxzOwtfCtapvoBh5B8
         L9ZnecJ5xb9ggfzOl/rPH82LNmq7WjMEFwiAIQ1pOn9y/DUcXHBoHR/HchjO1tce7OWQ
         norA==
X-Gm-Message-State: AOAM5316k7ExLNyPWGuKVjFzyxYiq9HKkdyTpVhKKCSdnwmyPBvanHvy
	xSzC7wZKj2lQM9I0zW0OBme4fYfMjFG4EojhUYk=
X-Google-Smtp-Source: ABdhPJy+HWgYZAT5ggi0T3ZN3zFx1EjfYm6LtV4ovce+LvA8p32LMFjcyDEAfFkRviuLwyUJCs+c0ABPKtRCKc5cluQ=
X-Received: by 2002:ac8:5716:: with SMTP id 22mr3385788qtw.82.1623908300786;
 Wed, 16 Jun 2021 22:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <16889911C5E4B48C.20286@lists.openembedded.org> <TYCPR01MB5599CED629CC952CE45E5E9E8F0E9@TYCPR01MB5599.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB5599CED629CC952CE45E5E9E8F0E9@TYCPR01MB5599.jpnprd01.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 16 Jun 2021 22:37:53 -0700
Message-ID: <CAMKF1sqZOAF2ntT+o0y+i3M_R7qrb1LMQrpi_vm5a+Bhfu6O0A@mail.gmail.com>
Subject: Re: [oe] [PATCH] dovecot: add CVE-2016-4983 to allowlist
To: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi

Its already in master, please check latest tip

On Wed, Jun 16, 2021 at 9:13 PM ito-yuichi@fujitsu.com
<ito-yuichi@fujitsu.com> wrote:
>
> Hi,
>
> I would appreciate if you have any advice on this patch.
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org
> > <openembedded-devel@lists.openembedded.org> On Behalf Of
> > ito-yuichi@fujitsu.com
> > Sent: Tuesday, June 15, 2021 9:13 AM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [PATCH] dovecot: add CVE-2016-4983 to allowlist
> >
> > CVE-2016-4983 affects only postinstall script on specific distribution, so add
> > it to allowlist.
> >
> > Signed-off-by: Yuichi Ito <ito-yuichi@fujitsu.com>
> > ---
> >  meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
> > b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
> > index 19ba2b1fc..26b4f5ee8 100644
> > --- a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
> > +++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
> > @@ -72,3 +72,6 @@ FILES_${PN} += "${libdir}/dovecot/*plugin.so
> > \  FILES_${PN}-staticdev += "${libdir}/dovecot/*/*.a"
> >  FILES_${PN}-dev += "${libdir}/dovecot/libdovecot*.so"
> >  FILES_${PN}-dbg += "${libdir}/dovecot/*/.debug"
> > +
> > +# CVE-2016-4983 affects only postinstall script on specific
> > +distribution CVE_CHECK_WHITELIST += "CVE-2016-4983"
> > --
> > 2.25.1
>
>
> 
>
