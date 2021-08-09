Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.25568.1628526952137988888
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Aug 2021 09:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=bnP8dGOw;
 spf=pass (domain: google.com, ip: 209.85.219.177, mailfrom: maxims@google.com)
Received: by mail-yb1-f177.google.com with SMTP id z5so28902826ybj.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Aug 2021 09:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=58bXtJptha2R4uxj2gPwSMHNxYqaat11Big7q9s+aYY=;
        b=bnP8dGOwMq6/hb4usfPGRXaqciIaaapw6T9U24JmV1MPzglhuepxSFIBTNH63c83nx
         UlK9VXpzf/uPi8SbR/+uD++EZ8ovcgYzToBvZkaya1X0Bqw7qC9pDarIohBu1J8ki+Om
         V4V3o6xUaqZ7C63mCwKhJ+zO0NvGt0QNKCEkI53yrfa34krFJ4LtHE01t6BSZ4gdTrhu
         Ot2crcTxW6e1jdnQv5Rj+JctuFv41ZoHxhPqRHvLPQcc1wr02nmgkZi2FMHCFx6QW2gF
         qgDf8NKgurU4S3QABNn327hu3m+IoFvCauXMWIiuKzZE62YiyBx/v+cnicC61+wNYf+d
         YQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=58bXtJptha2R4uxj2gPwSMHNxYqaat11Big7q9s+aYY=;
        b=p6LC/FqnWzWbiZT7aoEDfkgOA7YpCKgv1gWMRjNdVkqdIqqvVobA7YTp0YyrNwLzP0
         4WCPUX1DKIQFAhIVCNyNt94uYoBBVylK8Uy9REQ8Lwd6rXGi6W87WhBx4VJalGQvXAeB
         kjxV95JVDrGdgkgavtsp6CrLT+kXCFSiIyMFyKKusiyma5dGfkZEAfvEJe2zPvddzom8
         aHMiMRLfxThzVB4pcs279bUnsrU2LJ5jt1Nm/3+nTj6GDgpwb7EAt3o8CXfLwI09qLVH
         EwqIRd18looQM2qa2RcNkH6gRERq1lfo7XheHQJtxjsl5ikFghWZyCctgazqcOVClNbU
         9Zcw==
X-Gm-Message-State: AOAM533cU7Cdo8k3zYntw+OP3WCK+mJt2qKnHs8ZmhzWosVQwR+kAn6Y
	iv19aTh86yGPdQtECfW2cRMWTlDG3Qb+yypgKn3tJA==
X-Google-Smtp-Source: ABdhPJxTVdEtXFRQvubkzRfv1HS0gL5mtceNNkSzrxyjG1eLLVfKQsMKghU3Mgrqt2YiK1aqTKoBnVvu25eQfef5SNQ=
X-Received: by 2002:a25:4d4:: with SMTP id 203mr20995957ybe.499.1628526950788;
 Mon, 09 Aug 2021 09:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210806215045.3036785-1-maxims@google.com> <CAMKF1sqDbkkGjO5PvjBVYEJzx=y7QG3n6YTVj2mCMBWjDPREyQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqDbkkGjO5PvjBVYEJzx=y7QG3n6YTVj2mCMBWjDPREyQ@mail.gmail.com>
From: "Maxim Sloyko" <maxims@google.com>
Date: Mon, 9 Aug 2021 09:35:41 -0700
Message-ID: <CAFR_W8r2b75CMEYXr0gsVhvAnjCTEcWornNkwo0Hya+xX1pSSw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-oe: libusbgx: Configure the Devices Used
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 7, 2021 at 9:37 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Aug 6, 2021 at 2:50 PM Maxim Sloyko via lists.openembedded.org
> <maxims=google.com@lists.openembedded.org> wrote:
> >
> > Add ability to configure the UDC used for specific schema.
> > The feature is backwards compatible, so existing users don't need to
> > change anything.
> >
> > If one wants to specify which UDC is used for specific schema,
> > for example, `eth0`, they can add this variable to the configuration
> > file:
> >
> > UDC_FOR_SCHEMA_eth0=f8000000.udc
> >
> > If the device file exists in /sys/class/udc when the gadget is started,
> > it will be used for this schema.
> >
> > If this configuration is not present, first available device is picked.
> >
>
> Thanks for your contribution Maxim, it looks fine, although I had to
> edit the commit subject line to remove meta-oe from it
> commit msg guidelines are here for OE
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Noted, thank you.

>
>
> > Signed-off-by: Maksym Sloyko <maxims@google.com>
> > ---
> >  meta-oe/recipes-support/libusbgx/libusbgx/gadget-start | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >  mode change 100644 => 100755 meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
> >
> > diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
> > old mode 100644
> > new mode 100755
> > index 1a106b785..9e22671a9
> > --- a/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
> > +++ b/meta-oe/recipes-support/libusbgx/libusbgx/gadget-start
> > @@ -7,5 +7,10 @@ for i in $IMPORT_SCHEMAS; do
> >  done
> >
> >  for i in $ENABLED_SCHEMAS; do
> > -    ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/"$i"/UDC
> > +    configured_udc=$(eval 'echo ${UDC_FOR_SCHEMA_'"$i"'}')
> > +    if [ -n "${configured_udc}" ] && [ -e "/sys/class/udc/${configured_udc}" ]; then
> > +        echo ${configured_udc} > /sys/kernel/config/usb_gadget/"$i"/UDC
> > +    else
> > +        ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/"$i"/UDC
> > +    fi
> >  done
> > --
> > 2.32.0.605.g8dce9f2422-goog
> >
> >
> > 
> >



-- 
-MS
