Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.49861.1597688546627902062
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 11:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kM4Env9X;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id s23so13143438qtq.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2020 11:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gda36rFwso6SNxa7rehKVzEQPxJeDan2CNJ5SttJkQg=;
        b=kM4Env9Xo3hSt0Y6RoxJMBdMGHRV31r6RwVrfF8EfCrt52XzzYWm7cC22PErT97/OU
         T6Tcf9hR8FFhAJtmWJdMavTWJgJzg4JZ/p3HddiWgQFeEoKCbm3yz91LUCOrwfVFJ6Cb
         bmZcpE4i3UEmPnSErKlwYpIzNwTiEvw4iWzO3dPRNuu//iBPs6ZYUbX1wBJFpCiyiOHj
         sEu+fdwq0K9IdxIRTMudAPz63+7NnHJqDjwJuHoyErYbkub0WqhaUUvCy50Cs4ML09pe
         C3D8uS8CTEHAsLLbzCQiiZYdp9jHmClop2P/wyR5A2x6X+eMODeGFzDY1EvUKab0b416
         dD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gda36rFwso6SNxa7rehKVzEQPxJeDan2CNJ5SttJkQg=;
        b=faCPKCAEtTi61bGKxRXb94uszluwSHlJK8deBDqaOYq4tEen3k3qU+g3TeNmSZ7Q5A
         gjPO3/GTQvyxrdNWTBtapdxV6KZ6+cC9ym0KvO5DKbujKFX4GINKr60rIpn95z/HUeNc
         FmfzsjOgmTx8NxuxG3FwdXZUYPtXh/Ix1tY29nKqVy3zqtPPbLE4zkZVQ6useo8UuYxt
         KNcJ2PaGSthDS/sFS/WrHuF+3dI561Je8EghBciKo94jtQvl5bsMuJQ4p4T6diclow3W
         Bule7y8w8oHaBIADLP2v6Dv/9vk6Bv6JuQbzu8OegDZVDCbaIHrKiWupnxkvOGV4Karn
         gFHQ==
X-Gm-Message-State: AOAM5333A+bQnzBJct/1e8wUKzW+1/9sjhbLi3OT1HxJitXTuPF5DqY5
	IxG8222eci4XhhYj6+hd6aHqoPpSuFb3h7w+gUY=
X-Google-Smtp-Source: ABdhPJw9tj84dp4WGo6yKp5YWbNxkOAEvOp1gnuzSNGvpmqxpgM1u/59aSwaQRV+OuhICmCsJ0B65zMEOE+l8cxFsko=
X-Received: by 2002:ac8:22ea:: with SMTP id g39mr14841518qta.146.1597688545689;
 Mon, 17 Aug 2020 11:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200813194015.3412-1-joe.slater@windriver.com>
 <CAMKF1sreu9ygY8TK0biqdsfHkYFGHL3m_E-y-g_+5F4DZ0xBpg@mail.gmail.com> <BY5PR11MB39920F3D3CA5811C58DCAC03885F0@BY5PR11MB3992.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB39920F3D3CA5811C58DCAC03885F0@BY5PR11MB3992.namprd11.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 17 Aug 2020 11:21:59 -0700
Message-ID: <CAMKF1spdFxndpaGPkoYudqcjwMQ=bWZBtu2jXgX2xE+gEb_zdA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/1] aoetool: make builds reproducible
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 17, 2020 at 9:43 AM Slater, Joseph <joe.slater@windriver.com> wrote:
>
> Fine with me, but I thought there could be some reason they REALLY want -O.  Assuming it builds, I'll send a V2
>

possible but I doubt it. its perhaps worth asking upstream.

> Joe
>
> -----Original Message-----
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Thursday, August 13, 2020 3:25 PM
> To: Slater, Joseph <joe.slater@windriver.com>
> Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>; MacLeod, Randy <Randy.MacLeod@windriver.com>
> Subject: Re: [oe] [meta-networking][PATCH 1/1] aoetool: make builds reproducible
>
> On Thu, Aug 13, 2020 at 12:40 PM Joe Slater <joe.slater@windriver.com> wrote:
> >
> > Strip host path infomation out of binaries by not suppressing default
> > CFLAGS.
> >
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
> >  .../aoetools/aoetools/reproducible-build.patch       | 12 ++++++++++++
> >  .../recipes-support/aoetools/aoetools_36.bb          |  1 +
> >  2 files changed, 13 insertions(+)
> >  create mode 100644
> > meta-networking/recipes-support/aoetools/aoetools/reproducible-build.p
> > atch
> >
> > diff --git
> > a/meta-networking/recipes-support/aoetools/aoetools/reproducible-build
> > .patch
> > b/meta-networking/recipes-support/aoetools/aoetools/reproducible-build
> > .patch
> > new file mode 100644
> > index 000000000..4939ab25c
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/aoetools/aoetools/reproducible-b
> > +++ uild.patch
> > @@ -0,0 +1,12 @@
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -40,7 +40,8 @@ NPERSHELF=16
> > + CONF_SCRIPTS = aoe-discover aoe-interfaces aoe-mkshelf
> > +aoe-revalidate aoe-flush aoe-stat  PROGS = aoeping aoecfg
> > +aoe-sancheck  COMMANDS := ${CONF_SCRIPTS} aoe-mkdevs aoe-version
> > +coraid-update ${PROGS} -CFLAGS = -Wall -O -g
> > ++# We could still override this on the command line.
> > ++CFLAGS += -Wall -O -g
>
> Perhaps use ?= here, since -O will override the default optimization that bitbake will pass in env
>
> > + SANCHECKLIBS = -lpthread
> > +
> > + AOE_PING_OBJ = aoeping.o linux.o
> > diff --git a/meta-networking/recipes-support/aoetools/aoetools_36.bb
> > b/meta-networking/recipes-support/aoetools/aoetools_36.bb
> > index 9b73b442a..60f3dc9b2 100644
> > --- a/meta-networking/recipes-support/aoetools/aoetools_36.bb
> > +++ b/meta-networking/recipes-support/aoetools/aoetools_36.bb
> > @@ -13,6 +13,7 @@ RRECOMMENDS_${PN} = "kernel-module-aoe"
> >  SRC_URI = "http://sourceforge.net/projects/${BPN}/files/${BPN}/${BPN}-${PV}.tar.gz \
> >             file://aoe-stat-no-bashism.patch \
> >             file://makefile-add-ldflags.patch \
> > +           file://reproducible-build.patch \
> >          "
> >  SRC_URI[md5sum] = "bff30daa988a65f69d4448ce4726a6db"
> >  SRC_URI[sha256sum] = "fb5e2cd0de7644cc1ec04ee3aeb43211cf7445a0c19e13d6b3ed5a8fbdf215ff"
> > --
> > 2.24.1
> >
> > 
