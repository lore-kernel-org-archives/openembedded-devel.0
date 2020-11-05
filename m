Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.2376.1604609746856015592
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2020 12:55:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QgH1+5Wn;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: rosbrookn@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id p12so2140721qtp.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2020 12:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bxnOKwCkEEcwNJKDQccJtdjGnjeRw+yXs4oyw96Lv38=;
        b=QgH1+5WnpeYiimJFu1Pxx15+jJfK0krko9LFI3GdGITgPhUZLn+4WWja9e29kMx4L8
         bknc8VnQPw9/fmZFCGQNexSFCrR0wuHT7OYAMErOs7qxZ02QwNVnOiuLexKAkCnvn5Ut
         QEMoDSfe2GU/mKpRBDpxAGKI0Kdodx6ukv6fYrxMP//v8mTeBlAhY5xu6szzSUqeMPL/
         1pUqfAG3YdafALiYS9zHt309CCd0QVYnQ/6U9PdggH+EQnRTbDSMqOYw41dL7PjFvrFX
         d7lNA9zyKv9Kgw2kbUe6SSeIOqf4LSpF5nAnD4mz1zp5YdiBVc/sd45gdFz9M+a6hvSq
         HnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bxnOKwCkEEcwNJKDQccJtdjGnjeRw+yXs4oyw96Lv38=;
        b=kBvcBP4RUXh9Kc7ObMVjyXppxe5hEEk9ULZIv6MNhZHy4iCz3N9MUrQaaN5nxeaInZ
         1p6tCbxL0weBUOapxergHr01aaWojUo1PwWTVfmgOeCcTsuyvWRMrXlkzNGRjT7uSHdJ
         S2VbwmXiMeQiQLFIFPYCtuZLfF1GVzuDba9lpLS9PK7XOW0CX8Y9ZYqmd42oOGCdWPf3
         NmS0BUXDiLEP11fnV0v44yuVxaqgjXRywEjzbMPJo+kAdQe/bWEb1VQGyxTOdT4TjJZE
         wXr578sluf8O2drLmGXNcq4u78uLNj8n1Dx7lpaFZvSz8J0WmxipwPzrLzDhYYZWTshW
         JzPw==
X-Gm-Message-State: AOAM531015TN0Nth7MpVJm2ZYN9QBboo58yw6jhEdFZjmGMCUzaVleN4
	pwd6qtYFr6AaI606YXbYuOY=
X-Google-Smtp-Source: ABdhPJw3Nw0JKktYBjdVT3Rrc3rPsNXrQa/O35jIRZ9VHN1bv5CWt0LQBoMJiaYS9qXbiAStX9kJsg==
X-Received: by 2002:ac8:71c8:: with SMTP id i8mr3851436qtp.217.1604609745968;
        Thu, 05 Nov 2020 12:55:45 -0800 (PST)
Return-Path: <rosbrookn@gmail.com>
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com (209-217-208-226.northland.net. [209.217.208.226])
        by smtp.gmail.com with ESMTPSA id t18sm1671051qtr.1.2020.11.05.12.55.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2020 12:55:45 -0800 (PST)
Date: Thu, 5 Nov 2020 15:55:43 -0500
From: "Nick Rosbrook" <rosbrookn@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Nick Rosbrook <rosbrookn@ainfosec.com>
Subject: Re: [meta-networking][PATCH 1/2] strongswan: do not use deprecated stroke and starter by default
Message-ID: <20201105205543.GA1137694@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <cover.1604605168.git.rosbrookn@ainfosec.com>
 <78fd054347adbdb03d3faaae803d9ab3ad4da060.1604605168.git.rosbrookn@ainfosec.com>
 <CAMKF1srO7=d+ZWvd-3xYbamddv14=6NYUnmR+_BQgMZEc2XYHw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srO7=d+ZWvd-3xYbamddv14=6NYUnmR+_BQgMZEc2XYHw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 05, 2020 at 12:20:36PM -0800, Khem Raj wrote:
> On Thu, Nov 5, 2020 at 11:49 AM Nick Rosbrook <rosbrookn@gmail.com> wrote:
> >
> > The swanctl and vici configuration of strongswan is preferred, as the stroke
> > plugin used with starter is deprecated. As a reasonable default, add swanctl
> > systemd-charon to PACKAGECONFIG by default, removing charon and stroke.
> >
> > While here, make sure strongswan-starter.service is only installed when
> > charon is enabled. The current unconditional installation of
> > strongswan-starter.service can break systems which install strongswan.service
> > for use with swanctl.
> >
> > Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> > ---
> >  .../recipes-support/strongswan/strongswan_5.8.4.bb    | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
> > index 8a8809243..59641cb83 100644
> > --- a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
> > +++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
> > @@ -25,7 +25,7 @@ EXTRA_OECONF = " \
> >
> >  EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
> >
> > -PACKAGECONFIG ??= "charon curl gmp openssl stroke sqlite3 \
> > +PACKAGECONFIG ??= "curl gmp openssl sqlite3 swanctl systemd-charon \
> >          ${@bb.utils.filter('DISTRO_FEATURES', 'ldap', d)} \
> 
> ldap is not a standard DISTRO_FEATURE so lets keep it disabled by
> default. secondly enabling systemd-charon here would mean it wont work
> with sysvinit so lets make that
> option depend on systemd DISTRO_FEATURE

To be clear, the ldap line is not from this patch. That is in the
existing recipe. But, if you're asking me to change that while I'm here,
I'm happy to do so.

I will make systemd-charon depend on the systemd DISTRO_FEATURE.

Thanks,
-NR
