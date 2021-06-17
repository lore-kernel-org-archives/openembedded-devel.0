Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.3777.1623908346180969771
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 22:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZlueKB/v;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 5so1062897qvf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jun 2021 22:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a72J/geVR6xi2mxVeX1kxu+9ZNsZDhHtotnDIZeT+hI=;
        b=ZlueKB/vRQZZehAzTe9O2/RJC0SHh1E86DPRoloEvIBoaLDiX6vAP373HJNNV+DQew
         jBK6/fg4688ta2jD3yUwsmn1JAxD82AI7i+rnDEbIlgq0UYxX8cbXpdRul0LEikU9l4B
         zIwF8hYGIFPvcXesuUwNxh7JaTAIKyUXoQvbYmtJDxek3jOq82SOWgprJR+1sf2kCGMN
         mUkz2dldoLcbrM7RbBew1xWlcJLQdfLCBKWGHaR+Lo1y6aHC4m+QxeyOiKTxK6f+4Hzx
         zxBsapNgFiIaXiEfKUG6dgX9qC88ujCcDaYBr5SlI/SuOSRSBtAJgqqIvFG17Bo/Y9pH
         M/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a72J/geVR6xi2mxVeX1kxu+9ZNsZDhHtotnDIZeT+hI=;
        b=ZpK4q90phcAJZbOVYJvavOkl2oePAwTHY/iKIUEhHyaoFIQBqwvRDvMmg5B3EHBHBa
         goEIV6S+HyEQp4vlH/RI6Ug9OfvPAo6PP6nO84mmGP//1TWwzmYdHVx6sIPicoZBosXp
         E8ueU9vIWQ7tCYeeFYeDaCKT784flm2me7/JGNFzB9oBbzPZyXkRIFFA9bArCE4+HxHa
         h8bLn5osnuswTxHKoUY8ECL3QOhmm/sTZ7NpPyxdUP9tnE58Af1HAeBp1fr9dWEehCYl
         IW/N4p5lSGC4VybBKGsI4VkKOLxVvZ6/NFDpgefyGZeyAVUI59xoBsmyYzzue6M2DmOY
         81og==
X-Gm-Message-State: AOAM532X2YRxJz/mqNQdN3Tuban0k64ek6UzUdeSmzZ3ksd0k8eRK/0v
	6nb2C7jvth+r2XJP6GtGz08cDzNdWhdbMK1RCJA=
X-Google-Smtp-Source: ABdhPJwerUF7hRa5944PrmuaV6kCDFVe+KUw3BkbYTeK+ixIvpR2dJxQdB2Zrfe5a8aTdxcSNU7XKNqJeXODLpRE6gc=
X-Received: by 2002:a0c:f089:: with SMTP id g9mr4229579qvk.50.1623908345246;
 Wed, 16 Jun 2021 22:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <16877A0991CEE112.8333@lists.openembedded.org> <TYCPR01MB5599FD7F21812AFB694953FF8F0E9@TYCPR01MB5599.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB5599FD7F21812AFB694953FF8F0E9@TYCPR01MB5599.jpnprd01.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 16 Jun 2021 22:38:38 -0700
Message-ID: <CAMKF1sqjpcaTA=jgHwfQS8-eS6GNbVtoUpOfuyif-pGz4WkTig@mail.gmail.com>
Subject: Re: [oe] [PATCH] cyrus-sasl: add CVE-2020-8032 to allowlist
To: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this is also in master already, thanks for your contribution

On Wed, Jun 16, 2021 at 9:10 PM ito-yuichi@fujitsu.com
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
> > Sent: Friday, June 11, 2021 5:33 PM
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [PATCH] cyrus-sasl: add CVE-2020-8032 to allowlist
> >
> > This affects only openSUSE, so add it to allowlist.
> >
> > Signed-off-by: Yuichi Ito <ito-yuichi@fujitsu.com>
> > ---
> >  .../recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb            | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git
> > a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
> > b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
> > index 33de8ca7e..c4b41ace8 100644
> > --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
> > +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.27.bb
> > @@ -96,3 +96,6 @@ FILES_${PN}-dbg       += "${libdir}/sasl2/.debug"
> >  FILES_${PN}-staticdev += "${libdir}/sasl2/*.a"
> >
> >  INSANE_SKIP_${PN} += "dev-so"
> > +
> > +# CVE-2020-8032 affects only openSUSE
> > +CVE_CHECK_WHITELIST += "CVE-2020-8032"
> > --
> > 2.25.1
>
>
> 
>
