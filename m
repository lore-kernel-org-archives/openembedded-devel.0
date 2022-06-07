Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62032C43334
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 17:28:05 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web09.297.1654622879404171621
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jun 2022 10:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dpZz9Y+V;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id l1so12808311qvh.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jun 2022 10:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XzUaSG+cfWAAsqSQkEjSeCGnokmIYpOBOHiPIDmghxo=;
        b=dpZz9Y+V52OcD9/WTqkSyghHHnZnXEd9mxj+klq4eQOww79isWA2YPeC4OcAuYrz7a
         sb1GNRNxDrVwTUDnYJgXAUgJWrwfQHwxmPe/fywvONschJpfcLjce+8AYdgZ7nx8OOaC
         pxFATzqGVD1Qe9fDx2FYHSqWEwvpBrc3oeqVJPcJxDNiCIxix5JPqKRhrxFiDhtPqP5e
         qw9gVXNdzQqPsn00GGu6ksXT0Y0lTWSvU3686gktAfc3v4NLt4c6nlqqctq3zoc/Gs/s
         xnG/xEJL7NvM1iRbXx9TixnrpMDQ2zBlqrNM2IsB+mjuE1A5ey16ggAu0mzxkvO41DGW
         irTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XzUaSG+cfWAAsqSQkEjSeCGnokmIYpOBOHiPIDmghxo=;
        b=W56z1C8qRSMT+dtM53P69nGts+FoaSGam8Efy2hXhgejZ0cyySvE2se5rFiF3M3jHp
         6Qn6QAZ2MMRmHm1BswRjipxLrkel2syLr89EzPjFD0YO3QS6IF5cngybGE1orcCQDhSd
         XfQAS9KzHTzyFXw/K5uIx4fFlQlEhwMcyfg9gibey6Yp/gPDL9uiFDT2tW28sRJkthlS
         NtvjgvOW6CAeBw5G3a1Vo8WD0Zr1yniTBbi19+uAC4xFtKEwOR1XjJ5dygF7l+3GSGql
         dQ06NPBVVY00zMwKQevGwWgD5+WFSA0kN8oqj1ReHB8fuVw665nzPqrRLIbVzLE7qBeK
         a+DQ==
X-Gm-Message-State: AOAM533JdUjwafZJB+2nhhKw/AZOvttLzC0V4MxfvF48A/9gNSkXJUJf
	gwrrh4svmg26H+3zBAfUND6IPsO7r/v6N0xYTTg=
X-Google-Smtp-Source: 
 ABdhPJxd0G+HjN9xp1zpYgPdacSE9Cre+5krLoHCAW+3OEcq0BTEtJwGjAyUCm1D2MZJEvzlyKC3HwujKq0mLv58lno=
X-Received: by 2002:a05:6214:5089:b0:464:6a91:2ec4 with SMTP id
 kk9-20020a056214508900b004646a912ec4mr26490775qvb.36.1654622878370; Tue, 07
 Jun 2022 10:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220606220137.1887491-1-adrian.freihofer@siemens.com>
 <20220606220137.1887491-4-adrian.freihofer@siemens.com>
 <CALbNGRSNqCmjmF-re3zeqfEh2gp-j41SGdxUfzKwiyqRC4HpMg@mail.gmail.com>
 <07e40f6161b803aaf0f4ea86b1beca3f6674fe52.camel@gmail.com>
In-Reply-To: <07e40f6161b803aaf0f4ea86b1beca3f6674fe52.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Jun 2022 10:27:32 -0700
Message-ID: 
 <CAMKF1spz0DLbeP-psg8w5P6JitaueDks-iJJvs1HR1OTyRZCJw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 3/5] networkmanager: use nftables by
 default
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jun 2022 17:28:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97442

On Tue, Jun 7, 2022 at 10:26 AM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> Hi Andreas
>
> Good question. I changed it back and forth before I sent it to the
> mailing list. I finally changed it to the NetworkManager defaults (they
> changed it a few versions ago). I think it can easily be changed back.
> And after the LTS release, it's a good time to point out that nftables
> should be considered for future builds.

I think if defaults have changed to use nftables then this change is fine.

>
> But there is no strong argument for it. I'm also fine to put it on
> iptables.
>
> Maybe a distro feature to set a preference for iptables or nftables
> would also be useful. There are now various packages that support both
> configurably.
>
> Regards,
> Adrian
>
> On Tue, 2022-06-07 at 09:29 +0200, Andreas M=C3=BCller wrote:
> > Hi Adrian,
> >
> > just out of curiosity: Why do you suggest to prefer nftables over iptab=
les?
> >
> > Andreas
> >
> > On Tue, Jun 7, 2022 at 12:01 AM Adrian Freihofer
> > <adrian.freihofer@gmail.com> wrote:
> > >
> > > From NEWS file of netowrkmanager 1.32:
> > >
> > > firewall: add nftables firewall backend for configuring IPv4 NAT with
> > > shared mode. Now two backends are supported, "iptables" and "nftables=
".
> > > The default gets detected based on whether /usr/sbin/nft or
> > > /usr/sbin/iptables is installed, with nftables preferred.
> > >
> > > With this change nftables is not the prefered backend also with OE. B=
ut
> > > it's still possible to set NETWORKMANAGER_FIREWALL_DEFAULT back to
> > > iptables.
> > >
> > > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > > ---
> > >  .../networkmanager/networkmanager_1.36.2.bb                 | 6 ++++=
+-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager_1.36.2.bb b/meta-networking/recipes-connectivity/networkmanager/=
networkmanager_1.36.2.bb
> > > index 9fc43dceb5..55eb3e7024 100644
> > > --- a/meta-networking/recipes-connectivity/networkmanager/networkmana=
ger_1.36.2.bb
> > > +++ b/meta-networking/recipes-connectivity/networkmanager/networkmana=
ger_1.36.2.bb
> > > @@ -42,6 +42,10 @@ NETWORKMANAGER_DNS_RC_MANAGER_DEFAULT ??=3D "auto"
> > >  # ['dhcpcanon', 'dhclient', 'dhcpcd', 'internal', 'nettools']
> > >  NETWORKMANAGER_DHCP_DEFAULT ??=3D "internal"
> > >
> > > +# The default gets detected based on whether /usr/sbin/nft or /usr/s=
bin/iptables is installed, with nftables preferred.
> > > +# ['', 'iptables', 'nftables']
> > > +NETWORKMANAGER_FIREWALL_DEFAULT ??=3D "nftables"
> > > +
> > >  EXTRA_OEMESON =3D "\
> > >      -Difcfg_rh=3Dfalse \
> > >      -Dtests=3Dyes \
> > > @@ -238,7 +242,7 @@ FILES:${PN}-daemon +=3D " \
> > >      ${systemd_system_unitdir} \
> > >  "
> > >  RRECOMMENDS:${PN}-daemon +=3D "\
> > > -    iptables \
> > > +    ${NETWORKMANAGER_FIREWALL_DEFAULT} \
> > >      ${@bb.utils.filter('PACKAGECONFIG', 'dnsmasq', d)} \
> > >  "
> > >  INITSCRIPT_NAME:${PN}-daemon =3D "network-manager"
> > > --
> > > 2.35.3
> > >
> > >
> > >
> > >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97441): https://lists.openembedded.org/g/openembedded=
-devel/message/97441
> Mute This Topic: https://lists.openembedded.org/mt/91588569/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

