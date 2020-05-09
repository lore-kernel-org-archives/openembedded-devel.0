Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.2905.1589050500135735028
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 May 2020 11:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PYeHhmdz;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: sakoman@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id m12so8645890wmc.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 09 May 2020 11:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LFuFub7DBSBp2z+mP6vyFQ96I/hvhgMdZzeO3e5flCY=;
        b=PYeHhmdzOsQQXSlOKXwVCyTAPsnZJbuzSGQnRdmTaTHUfjQZrq5CWp5SBlHShCsQZJ
         tiXA6o9wu7sA2Ibcr/ijFvRXb6twJSZxIO+1QdrtnXMR7kUrGREQ5558aDkRTKvqqfE8
         IS2Mc+I0h/pGdUHaf9zALZzkl3Og+7CwfCOPJxM5tcAWlr2dgpByI1TZx94trEcp/plc
         dAY7sb0A2x40hJEamYEu/qpk4o9D+5eMpZ9QK+yDlH51MkE9nzOLAzTXew9RoKLjq8eR
         Alu1w/hq5UrlRPzgc1qLU6O8fbxC6Iv/zfWeCD16hCq37ZPp9GC2x9sxkmwWVUQof/jr
         xLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LFuFub7DBSBp2z+mP6vyFQ96I/hvhgMdZzeO3e5flCY=;
        b=lHyvLebDUnJFQqQlYZXjl1+spNGKFXMdNWUqM9j/RbCKH5WEhx8arASUNLeQGmO5cO
         mZ3wSYNC46r066dC7cx11WoDuN+GYtA0n58QUQMdsJ8cEvKldsnPez8pX+8BE9F0FCXE
         JJWcXdTsy5X49B2an+IJRC+YcdPqQpaXEmFLqKadh0J2pJy5e+lWYt2wEhzzrp/HXafH
         /o/eF65unMYvAYtAAtXdWAT9yKad7+XBTESGdk04EocvuxB1QXVk7wl2SKEwhRBMatDj
         2uO2uIPVCcxwqUXWXJ8n9hZVsNODel2cxj1V3kNlOj3VLyTYl2LgtmfPWIbsCWG6jiNU
         1VYw==
X-Gm-Message-State: AGi0PuYMlokCywUoCI4rkE55hdf575eMJqEjXYE0HUJBeLqhckex4kxh
	1F1P0lbsc0OdstRGbRecOYVSZYpm/ICzLTAcNUk=
X-Google-Smtp-Source: APiQypJHwhl0XbgCbMEg6tlf54ikTYOlvt14fL6WDocIuaCHPgg6kEDCTXFeHtedVNIVHZ699ZbB3qaP13R4Q98ecCs=
X-Received: by 2002:a1c:4e16:: with SMTP id g22mr21403101wmh.157.1589050498614;
 Sat, 09 May 2020 11:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200507142806.48643a47@cy-rd-cb> <20200508105610.GA8452@localhost>
 <090c0075-c785-e3fd-1da4-c56518a64c0c@cybernetics.com> <20200508184129.GA7248@localhost>
 <b2a74e1d-32f1-56f2-934c-58d2a6d25f64@cybernetics.com>
In-Reply-To: <b2a74e1d-32f1-56f2-934c-58d2a6d25f64@cybernetics.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Sat, 9 May 2020 08:54:47 -1000
Message-ID: <CAGDS+nmf3gjj6Nsp0+dRn-B=TXDF5tYOa2zN-MN-9s9ZNAJn6Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] php: fix opcache link error in 7.4
To: Claude Bing <cbing@cybernetics.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi Claude,

On Fri, May 8, 2020 at 11:26 AM Claude Bing <cbing@cybernetics.com> wrote:
>
> OK, I started a new patch thread.  Who/what determines which patches get
> included in the named release branches?  Specifically, we are using
> dunfell and would like these changes to show up in that branch.

Just submit a patch to this list tagged with [dunfell].  In general
though I won't take a patch unless it is already in master, so a patch
for both master and dunfell should be tagged with [master][dunfell]

If the issue is already fixed in master with a version bump, and a
version bump in dunfell would be too dangerous (i.e. feature changes)
then I'll take a patch to the current version in dunfell.  Again, tag
it with [dunfell] and also mention the commit in master that fixes the
issue.

Thanks,

Steve

>
> :)
>
> Regards,
>
> Claude Bing
>
> On 5/8/20 2:41 PM, Adrian Bunk wrote:
> > On Fri, May 08, 2020 at 10:42:22AM -0400, Claude Bing wrote:
> >> On 5/8/20 6:56 AM, Adrian Bunk wrote:
> >>> On Thu, May 07, 2020 at 02:28:06PM -0400, Claude Bing wrote:
> >>>> Explicitly specifying -lrt is required for opcache to be linked against
> >>>> the proper dependencies.  Additionally, PHP disables libdl when it
> >>>> detects a cross-compilation environment for some reason.  In order to
> >>>> load any type of extension, re-enabling libdl is required.
> >>>> ...
> >>>> +# link against librt (libc) if opcache is specified in order to avoid the
> >>>> +# following error:
> >>>> +# Failed loading /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: undefined symbol: shm_unlink
> >>>> +LDFLAGS += "${@ " -lrt " if bb.utils.contains('PACKAGECONFIG', 'opcache', 'true', 'false', d) else "" }"
> >>>
> >>> Is this actually a bug in 0001-opcache-config.m4-enable-opcache.patch
> >>> and should instead be fixed there?
> >>
> >> Yes, that does indeed fix the problem.  Would you like me to reply to
> >> this thread with a new patch, or create a different thread?
> >> ...
> >
> > Your original patch is already in master, please submit a new patch in a
> > different thread that removes this workaround from php_7.4.4.bb and
> > fixes 0001-opcache-config.m4-enable-opcache.patch.
> >
> > Thanks
> > Adrian
> >
> >
> >
> >
> 
