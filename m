Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web12.83572.1597821954276216360
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2020 00:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mhb8fQNe;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: marek.belisko@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id t15so17226323edq.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2020 00:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cl2nzAna+ySvmcQJN3+DLXtXctgXPsIfnrGqJUsgM7w=;
        b=Mhb8fQNej78COHIkAvPhHVVItZCfm/LPmAoT77Asp5KT3c0kqY0WOlucQ09TfcVHk1
         toGs9Nhoiz7EFPUCdklDLEqlSEt3zMl6tFXQeZVfHLfOaECIwzYaBaqHjVtRP5ZM0aGB
         dJIJ1LRCLed6y+yiqigaNQfcRIY2ly4elKwEwQypTDFH5cbuYuY4Xd5oQqBlXLAkqWYF
         mPAur1oui5g2XnelSq5jCrQ0cI4r+xQM5Y8BmvQPi/ed/NEK/V9pp2/dPxWE8vp1+bnK
         CGFrSuAKUmj7OPcDeNhe/bYv+4/xieGdZAVxj2NYtT25Kpbjz9KSFmH5DHFuaW4NtC90
         OLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cl2nzAna+ySvmcQJN3+DLXtXctgXPsIfnrGqJUsgM7w=;
        b=AaiLQJG2ALm1xWCqmS9gz2AULnLLRc6TxS0PXuNqukShQ0qtbZyn+axdkdH9FRCuIH
         OUlyFPINWoQDVhvJgHZL7pGc6HF6aXkD0ouFPC3GUYgfQZPn6Pyoj+Hkm0GelqOdqrJD
         mSH/65B3phkFy7tUlrnOoCVzgwfbY234ZLL0B32cbhk5EtoiwgI/7WWWdsgbmA8mAoUw
         qJjI4mVSPIllNYNT9E8FfcMqYEynKZjnv1yMHslS5gf4u8LuqltYFLBeH/qf75mDMQn8
         gCQpzOIbFLfd5DhHO1qPFsqOTx8zzIp7GuifyWDDe80QaMZJfzTYbEOEAmB/o3fQvirZ
         EHeg==
X-Gm-Message-State: AOAM53060Tw2Yf1GeGao19ekUpxf0o3Rmdjl1nZE35bh7b2l4O1xdysp
	mUekIYmADi00o33gX0Fw5dr5V+W1bzY1T1HNd2Q=
X-Google-Smtp-Source: ABdhPJzfKTFCpQ6zZXo2xO+tWMMzUS0QgHF3vGdN5NgA1T/gC+7c9d3BS0/dP7yBsBgi+64YzE4VQ84jL/qaKBYC8EY=
X-Received: by 2002:a05:6402:38c:: with SMTP id o12mr24144129edv.271.1597821952424;
 Wed, 19 Aug 2020 00:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv36viDXoJC6VQ2asswo=TaDU=0zJftXGSxbhkfDDk13KYg@mail.gmail.com>
 <CAMKF1spo3AzBPAe4bYwm4eCTQ6r1cyfN1cUQgqKuq=S+HFCiMQ@mail.gmail.com>
In-Reply-To: <CAMKF1spo3AzBPAe4bYwm4eCTQ6r1cyfN1cUQgqKuq=S+HFCiMQ@mail.gmail.com>
From: "Marek Belisko" <marek.belisko@gmail.com>
Date: Wed, 19 Aug 2020 09:25:41 +0200
Message-ID: <CAAfyv34m_Mr+GbS3EptBgyLrujmuhBGYYjKGFgh4-_mNLtK35A@mail.gmail.com>
Subject: Re: [oe] libgpiod using STAGING_KERNEL_DIR
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Aug 18, 2020 at 11:32 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Aug 18, 2020 at 1:09 PM Marek Belisko <marek.belisko@gmail.com> wrote:
> >
> > Hi,
> >
> > I'm using poky warrion and added meta-openembedded to have libgpiod
> > recipe. I'm using a custom 5.6 kernel and I would like to update
> > libgpiod to version 1.5.1 but this version needs kernel headers >= 5.g
> > (but kernel headers on warrior are 4.x). My idea was to somehow pass
> > STAGING_KERNEL_DIR to CFLAGS but this seems it's not the way to go. As
> > I understand from the kernel-header recipe I cannot simply bump
> > kernel-headers because libc depends on it also. Any ideas how to
> > achieve this? Thanks.
>
> if it need UAPI headers from kernel then linux-libc-headers should be
> bumped for best results
How about this notice at the beginning of the linux-libc-heades recipe:
#########################################################################
####                        PLEASE READ
#########################################################################
#
# You're probably looking here thinking you need to create some new copy
# of linux-libc-headers since you have your own custom kernel. To put
# this simply, you DO NOT.
#
# Why? These headers are used to build the libc. If you customise the
# headers you are customising the libc and the libc becomes machine
# specific. Most people do not add custom libc extensions to the kernel
# and have a machine specific libc.
#
# But you have some kernel headers you need for some driver? That is fine
# but get them from STAGING_KERNEL_DIR where the kernel installs itself.
# This will make the package using them machine specific but this is much
# better than having a machine specific C library. This does mean your
# recipe needs a
#    do_configure[depends] += "virtual/kernel:do_shared_workdir"
# but again, that is fine and makes total sense.
#
# There can also be a case where your kernel extremely old and you want
# an older libc ABI for that old kernel. The headers installed by this
# recipe should still be a standard mainline kernel, not your own custom
# one.
#
# -- RP

I think it's not the way to go. An I'm using pretty new kernel 5.6. So
STAGIG_KERNEL_DIR is not correct way?

Thanks.
>
> >
> > BR,
> >
> > marek
> >
> > --
> > as simple and primitive as possible
> > -------------------------------------------------
> > Marek Belisko - OPEN-NANDRA
> > Freelance Developer
> >
> > Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
> > Tel: +421 915 052 184
> > skype: marekwhite
> > twitter: #opennandra
> > web: http://open-nandra.com
> > 

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
