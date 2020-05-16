Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.13414.1589666122537035301
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 May 2020 14:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rUVdhsJS;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id fb16so2900128qvb.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 May 2020 14:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0XDikA+DQqCCC2J4b9070vPf5wmIt7nGG+8u8XtEPng=;
        b=rUVdhsJS5nsYw5yDXOg9BkMpHfj7KhXsNz+EJZ9P7sGtcecuB6iyk3bA7jjrhtjHUV
         fpFzSp32OZh7vPTssZRmolI15yIsXpUUg4tSiBKY14JSQKw1yZhbUUr2La9AXtb8QN+7
         6CUFgzCeyzsA+qqLZHGTXymRu4cRhFihpjeFRXbiMs+ncc1sthie2OP5kfeiibBk3K9A
         D8yns81b4Mxxi/2PwLWuGqlqCD5U4Q/It4YLkXKW/KwtbnNDqbd+3iiRRnkUDLkBAmgp
         Qi1vDOsRdDZSfA6EoHHmGna9CR1OPq41nkJLQrr7RM9HbG6eTogbj8V9X6tadkXMp7PC
         tDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0XDikA+DQqCCC2J4b9070vPf5wmIt7nGG+8u8XtEPng=;
        b=Wdd1W7Nt9gahP9ibgTX5gaRD50s3mC8CT8hGWvqRPBzmECPRU3HmuSdvXeKUdiEtZh
         hiS+hzXRxUZ1m4qzcj1zxdu5ZSUs0IpmUmrRyDTrnPZXyMq26qB1mtpHjJbOG2SvIjUF
         55B93lj8qrIwe+KzarsI5HliD7pxdE+UloH1IAEuPATZBZE07cfAor8OdIYw4kRxae3n
         /UmqFINCX+qetrdarOFxqpfVmE8ws0NgvydVHaEQ1DQzz71VNzQtZL4mt1eY0jFrC0Oy
         d2FQnQTQLAxh4HuOzBbc1x+GBjxyl3/u5GphcUm5cSNeeFaDt6yRfwk9eIRz6VH+xbqW
         KenQ==
X-Gm-Message-State: AOAM533Lx77XvmiDn2irhv8iig5S21sHHqONZvzZi8ib1q7kKUe0GyS9
	u2VYSxhnXKUt2vaRyoEBdRWd4QDZYJX50zhb2N2pCr//
X-Google-Smtp-Source: ABdhPJzZrMft9+TfqYFENd+GyWj5rzU2WM9tDkpbJZ19EIokncOWT82towLE6Waf/Nj26/b/dsksuv7wC+QZkIQR2Z8=
X-Received: by 2002:a05:6214:1506:: with SMTP id e6mr9671475qvy.61.1589666121388;
 Sat, 16 May 2020 14:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200516162631.1862339-1-raj.khem@gmail.com> <401b0d008f8444da8613ba2102d614d4@XBOX03.axis.com>
In-Reply-To: <401b0d008f8444da8613ba2102d614d4@XBOX03.axis.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 16 May 2020 14:54:55 -0700
Message-ID: <CAMKF1sra2Z9S5cQiTOzt84FPcNkFUDBwgjY+wGHTmv8BN8LigQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/3] netplan: Depend on systemd if its in distro
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Updated.

On Sat, May 16, 2020 at 1:05 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: den 16 maj 2020 18:26
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Khem Raj <raj.khem@gmail.com>
> > Subject: [oe] [meta-networking][PATCH 1/3] netplan: Depend on systemd if its in distro
>
> Change "its"  to "it is".
>
> >
> > it needs to link with libsystemd when using systemd as init system
> > Fixes
> > Package libsystemd was not found in the pkg-config search path.
> > Perhaps you should add the directory containing `libsystemd.pc'
> > to the PKG_CONFIG_PATH environment variable
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-networking/recipes-connectivity/netplan/netplan_0.98.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
> > b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
> > index db029a4b8a..15c4968132 100644
> > --- a/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
> > +++ b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
> > @@ -18,7 +18,8 @@ SRC_URI = " \
> >          git://github.com/CanonicalLtd/netplan.git \
> >  "
> >
> > -DEPENDS = "glib-2.0 libyaml"
> > +DEPENDS = "glib-2.0 libyaml ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
>
> That can be simplified to:
>
> DEPENDS = "glib-2.0 libyaml ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>
> > +
> >  RDEPENDS_${PN} = "python3 python3-core python3-pyyaml python3-netifaces python3-nose python3-coverage python3-pycodestyle python3-pyflakes util-linux-libuuid"
> >
> >  inherit pkgconfig systemd
> > --
> > 2.26.2
>
> //Peter
>
