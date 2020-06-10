Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.2104.1591816221090652353
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 12:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dmVtkr1v;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id c12so2656966qtq.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jun 2020 12:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G8ihCwryQUbUDpMERGpmtJnIgEuk5TF4V8OVfLXkXV4=;
        b=dmVtkr1vBPAPy/WRCy+RuK2k3WCcOayqsm39poYOGtBop1LzaHDwcDHtPHyP/KjRCp
         8XOEFRBapG65FYN2uVDpstPiCIIbfbeLaxbVeZHMx5cWJ+4ap4tILVbaUrDil2/X2Qwq
         5VeUpOl6vd0/WLvtZnSXyCk8VVeiMpLb9HBZt6dga1DMWLx2+F8oMsl7GrMcqpYrnx1G
         0D1LOBkABtOPIKIJDQenqepg6UIfUJ3d98H/KOuzHI6oDyASZXtbfMsEwAP9So2E5aEI
         T9T/9ckpzv4A31W9PvsIMfvyrQlumtn3SFiDu64u5w/20gdf0VBGg+UkIhdCFmxl5mnf
         PKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G8ihCwryQUbUDpMERGpmtJnIgEuk5TF4V8OVfLXkXV4=;
        b=h0W7OEApokz5dTMKsdWQ1IdVweCeuRDN2c3gzBge/seMEUwJ3BpZB2nfeZb7YEfnvT
         qbnn/wA7lrftd4bdvf75QjJ9UKlox5lXan2aoSvrW6uDpVGKnLSjKeDeRp2/bhFw4c7N
         OQ6+6SVYsesPqF9IGUNdjYMLOge32B85hvQlGTMbsnyo3IJNh02KIwSbqw9HkKuW//1A
         l0trfuoV/XMeUMoFvE2Atits+/YVMJvtUqyWDi8ZmFGYo8L7JvXP/PwS79BdcQL5JEZI
         xX8SmH/OiAzVuZnUR7Yw0caFwlIYhCQXgXG22gaLZX4AnkkUoOBXqitUzI0TjlWsbkgt
         nQ5A==
X-Gm-Message-State: AOAM5328rjBsqMXtqGHpF228uO0HYXdkkCezn1fVB2NVsbwf6vyrMEJ8
	8EQt/SK4Fc/wa6wiXBpPf/5b0InVF3V7CgfGcbQ=
X-Google-Smtp-Source: ABdhPJxOLGVz/ANKQc68kJCTE5gmM4RtmM+tq4oHyU4cMdn9YQm0UdPvnXIALJ0VlfD/Ee5mlDxwsIBCnI5Hql/ajgI=
X-Received: by 2002:aed:3f55:: with SMTP id q21mr4857578qtf.190.1591816220040;
 Wed, 10 Jun 2020 12:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200607160532.415655-1-offougajoris@gmail.com> <20200607192848.GS17660@denix.org>
In-Reply-To: <20200607192848.GS17660@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 10 Jun 2020 12:09:54 -0700
Message-ID: <CAMKF1sqY-rhLWpNNYKfix138-7bo60fjpNQnVPsVMK_WTnHOGQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] c-periphery: add recipe
To: Denys Dmytriyenko <denis@denix.org>
Cc: Joris Offouga <offougajoris@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 7, 2020 at 12:29 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Sun, Jun 07, 2020 at 06:05:32PM +0200, Joris Offouga wrote:
> > Signed-off-by: Joris Offouga <offougajoris@gmail.com>
> > ---
> >  .../c-periphery/c-periphery_2.2.1.bb          | 21 +++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/c-periphery/c-periphery_2.2.1.bb
> >
> > diff --git a/meta-oe/recipes-devtools/c-periphery/c-periphery_2.2.1.bb b/meta-oe/recipes-devtools/c-periphery/c-periphery_2.2.1.bb
> > new file mode 100644
> > index 000000000..b53cd6b19
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/c-periphery/c-periphery_2.2.1.bb
> > @@ -0,0 +1,21 @@
> > +SUMMURY = "C-Periphery lib used to access GPIO, LED, PWM, SPI, I2C, MMIO, Serial"
> > +DESCRIPTION = "A C library for peripheral I/O (GPIO, LED, PWM, SPI, I2C, MMIO, Serial) in Linux"
>
> libsoc?
>
> If this one gets in, should probably go to recipes-support where libsoc
> lives...

Good feedback. I have added a patch to move it to recipes-support to
master-next

>
>
> > +HOMEPAGE = "https://github.com/vsergeev/c-periphery"
> > +
> > +SECTION = "libs"
> > +
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=4097ec544cf01e9c7cfc4bdf8e4ed887"
> > +
> > +SRC_URI = "git://github.com/vsergeev/c-periphery;protocol=https"
> > +SRCREV = "c2aa7d164f87b807077daeeb3443a56b89e1d1c9"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit cmake
> > +
> > +EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON"
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > +
> > --
> > 2.25.1
> >
>
> >
>
> 
