Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC5F8C54FB9
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 20:42:46 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.6144.1700253765563489614
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 12:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L6EwA+GP;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1f0f94a08a0so1319894fac.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 12:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700253765; x=1700858565; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iuZrg2DlaEk0iwgzQS+ZmQsk1IaLGurS28Jy9poMcso=;
        b=L6EwA+GPB4FWGnAFiqhLwqV8Dujcgt9QdrBdwhSVVMm71QG+akKoM/9DdWnT/8CnuL
         Z2GtXRBZA0ZCiBDa/crD0xgxZz1neCJLn3eFYjkquVAJEqsREc9Byqt3G09kjOB1GeY+
         0PbQj1vxmz5oGWw6tMZSpEHVIfA+iqAKWzbwd46Rqdu7H7p9ixjgv548PdaAka9XTPkA
         V/xNuiWCTTUBoDtfIekCTm4cjc3Lfya3Q19qq3FMtryjPZkUi1Z6QWELHZHy4MSdbTbk
         uDCSBy0zCyHaUypZnyBO768JxSqdFHGXre+tB43u17v022UOYOdPVFrT0dp2vQ3wzAi1
         RzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700253765; x=1700858565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iuZrg2DlaEk0iwgzQS+ZmQsk1IaLGurS28Jy9poMcso=;
        b=qOi1QmbcKp9zyiyy5RXuu1N72pWO+ekVN48ovhz++x8+Ph3ml60h1UAy9sQhfSGoxl
         FXWLJ1SDAKdIZLQg8sg8aHYkT9XhQ+EyMCd+RW/Wl9bBo6+LHrDhsoNkdfGaSHFE59gV
         9EYu/tXpONpWGTYvx/1+sDv5ccGw8yNDYv8bo05T/W58TNu6yom7XgcGeacyET8u/Jvi
         2MU/rHUnDK2fw1Ck3kPRT0O1+I61lo/5gr93ymKozc+xl50+rVt7s+UoMrbQtWn/Wv12
         i4hiSYiLqg2TQ6BSB3M+FHJkEL3y2D+QdOC/jmJjgdgbWcY714X0krV448PVYvXR/ly2
         dRfQ==
X-Gm-Message-State: AOJu0YyJMYi6srjqgE8FwoFFgkjKR3L3K+yzXuh7L0VnSNefxF3V1Yge
	usWq1Ix3NGdWKFE5N9SxX6vqBQu93CunBtrJfFBU9EeCrIg=
X-Google-Smtp-Source: AGHT+IEbYCEV6s1mgTdkS1mHTf99lXTjfrkCy1fps8Z2ePqQ8Lr6/G7KoKqxsrqvQZzdIjc9vLzEX7ClKksx6j/dKok=
X-Received: by 2002:a05:6870:724d:b0:1f0:5e1f:4518 with SMTP id
 y13-20020a056870724d00b001f05e1f4518mr328167oaf.37.1700253764296; Fri, 17 Nov
 2023 12:42:44 -0800 (PST)
MIME-Version: 1.0
References: <20231117193223.7359-1-alex.kiernan@gmail.com> <8189c8fe-4afb-46ef-adbf-83784381e681@gmail.com>
 <CAO5Uq5SUU5najbWZ29ptAsn0b80+E-Y-pYHa8cJucHrFL9ZPhA@mail.gmail.com>
In-Reply-To: <CAO5Uq5SUU5najbWZ29ptAsn0b80+E-Y-pYHa8cJucHrFL9ZPhA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Nov 2023 12:42:18 -0800
Message-ID: <CAMKF1sotzhCvW0wNGFsfA=0gfsUthjEem+DAkz6jbWDAXHr8ug@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mdns: Upgrade 2200.0.8 -> 2200.40.37.0.1
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Wang Mingyu <wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 20:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106879

On Fri, Nov 17, 2023 at 12:40=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail.c=
om> wrote:
>
> Thanks... I should've checked master-next :|

always a good idea

>
> On Fri, Nov 17, 2023 at 7:41=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > I have squashed this with
> >
> > https://lore.kernel.org/openembedded-devel/1700121036-21542-1-git-send-=
email-wangmy@fujitsu.com/T/#u
> >
> > On 11/17/23 11:32 AM, Alex Kiernan wrote:
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > ---
> > >
> > >   ...utine-for-cleaning-recent-interfaces.patch | 15 +++++------
> > >   ...01-Handle-interface-without-ifa_addr.patch | 12 ++++-----
> > >   .../0001-dns-sd-Include-missing-headers.patch | 11 +++-----
> > >   ...outine-for-tearing-down-an-interface.patch | 15 +++++------
> > >   ...ke-Set-libdns_sd.so-soname-correctly.patch | 13 ++++-----
> > >   .../0003-Track-interface-socket-family.patch  | 21 +++++++--------
> > >   ...cate-loopback-interface-to-mDNS-core.patch | 19 ++++++-------
> > >   ...-Separate-TLS-targets-from-libraries.patch | 11 +++-----
> > >   ...0005-Use-list-for-changed-interfaces.patch | 27 +++++++++-------=
---
> > >   ...-mDNSCore-Fix-broken-debug-parameter.patch | 10 +++----
> > >   .../0006-Handle-noisy-netlink-sockets.patch   | 17 +++++-------
> > >   .../0006-make-Add-top-level-Makefile.patch    | 10 +++----
> > >   ...-deleted-interfaces-as-being-changed.patch | 13 ++++-----
> > >   ...0008-Handle-errors-from-socket-calls.patch | 19 ++++++-------
> > >   .../mdns/0009-remove-unneeded-headers.patch   | 14 +++++-----
> > >   .../mdns/mdns/0015-Add-missing-limits.h.patch |  8 +++---
> > >   ...dns_2200.0.8.bb =3D> mdns_2200.40.37.0.1.bb} |  4 +--
> > >   17 files changed, 100 insertions(+), 139 deletions(-)
> > >   rename meta-networking/recipes-protocols/mdns/{mdns_2200.0.8.bb =3D=
> mdns_2200.40.37.0.1.bb} (98%)
> > >
> > > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Create-=
subroutine-for-cleaning-recent-interfaces.patch b/meta-networking/recipes-p=
rotocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.pa=
tch
> > > index 91198dea733c..f5d424d58f4e 100644
> > > --- a/meta-networking/recipes-protocols/mdns/mdns/0001-Create-subrout=
ine-for-cleaning-recent-interfaces.patch
> > > +++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Create-subrout=
ine-for-cleaning-recent-interfaces.patch
> > > @@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.c=
om>
> > >    mDNSPosix/mDNSPosix.c | 24 ++++++++++++++----------
> > >    1 file changed, 14 insertions(+), 10 deletions(-)
> > >
> > > -diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
> > > -index 0a7c3dfa2475..fe7242d83599 100644
> > > ---- a/mDNSPosix/mDNSPosix.c
> > > -+++ b/mDNSPosix/mDNSPosix.c
> > > -@@ -1322,6 +1322,19 @@ mDNSlocal int SetupSocket(struct sockaddr *in=
tfAddr, mDNSIPPort port, int interf
> > > +Index: mDNSResponder/mDNSPosix/mDNSPosix.c
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
> > > ++++ mDNSResponder/mDNSPosix/mDNSPosix.c
> > > +@@ -1322,6 +1322,19 @@ mDNSlocal int SetupSocket(struct sockadd
> > >        return err;
> > >    }
> > >
> > > @@ -38,7 +38,7 @@ index 0a7c3dfa2475..fe7242d83599 100644
> > >    // Creates a PosixNetworkInterface for the interface whose IP addr=
ess is
> > >    // intfAddr and whose name is intfName and registers it with mDNS =
core.
> > >    mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *in=
tfAddr, struct sockaddr *intfMask,
> > > -@@ -1559,16 +1572,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const =
m)
> > > +@@ -1559,16 +1572,7 @@ mDNSlocal int SetupInterfaceList(mDNS *c
> > >
> > >        // Clean up.
> > >        if (intfList !=3D NULL) freeifaddrs(intfList);
> > > @@ -56,6 +56,3 @@ index 0a7c3dfa2475..fe7242d83599 100644
> > >
> > >        return err;
> > >    }
> > > ---
> > > -2.35.1
> > > -
> > > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-=
interface-without-ifa_addr.patch b/meta-networking/recipes-protocols/mdns/m=
dns/0001-Handle-interface-without-ifa_addr.patch
> > > index daee318ae4a3..7e76f07c0eb3 100644
> > > --- a/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interfa=
ce-without-ifa_addr.patch
> > > +++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interfa=
ce-without-ifa_addr.patch
> > > @@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.c=
om>
> > >    mDNSPosix/mDNSPosix.c | 4 +++-
> > >    1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > -diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
> > > -index d7f31cc4d5cf..f10301253f58 100644
> > > ---- a/mDNSPosix/mDNSPosix.c
> > > -+++ b/mDNSPosix/mDNSPosix.c
> > > -@@ -1895,6 +1895,7 @@ mDNSlocal void InterfaceChangeCallback(int fd,=
 void *context)
> > > +Index: mDNSResponder/mDNSPosix/mDNSPosix.c
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
> > > ++++ mDNSResponder/mDNSPosix/mDNSPosix.c
> > > +@@ -1895,6 +1895,7 @@ mDNSlocal void InterfaceChangeCallback(i
> > >           continue;
> > >
> > >            if ((ifa_loop4 =3D=3D NULL) &&
> > > @@ -26,7 +26,7 @@ index d7f31cc4d5cf..f10301253f58 100644
> > >                ((*ifi)->ifa_addr->sa_family =3D=3D AF_INET) &&
> > >                ((*ifi)->ifa_flags & IFF_UP) &&
> > >                ((*ifi)->ifa_flags & IFF_LOOPBACK))
> > > -@@ -1903,7 +1904,8 @@ mDNSlocal void InterfaceChangeCallback(int fd,=
 void *context)
> > > +@@ -1903,7 +1904,8 @@ mDNSlocal void InterfaceChangeCallback(i
> > >                continue;
> > >            }
> > >
> > > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-=
Include-missing-headers.patch b/meta-networking/recipes-protocols/mdns/mdns=
/0001-dns-sd-Include-missing-headers.patch
> > > index 4a60a9572896..82825b294de0 100644
> > > --- a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include=
-missing-headers.patch
> > > +++ b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include=
-missing-headers.patch
> > > @@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >    mDNSPosix/nss_mdns.c | 3 +++
> > >    1 file changed, 3 insertions(+)
> > >
> > > -diff --git a/mDNSPosix/nss_mdns.c b/mDNSPosix/nss_mdns.c
> > > -index afadb3c6c33b..84c312759463 100644
> > > ---- a/mDNSPosix/nss_mdns.c
> > > -+++ b/mDNSPosix/nss_mdns.c
> > > +Index: mDNSResponder/mDNSPosix/nss_mdns.c
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- mDNSResponder.orig/mDNSPosix/nss_mdns.c
> > > ++++ mDNSResponder/mDNSPosix/nss_mdns.c
> > >   @@ -89,6 +89,9 @@
> > >
> > >    #include <dns_sd.h>
> > > @@ -25,6 +25,3 @@ index afadb3c6c33b..84c312759463 100644
> > >
> > >    //----------
> > >    // Public functions
> > > ---
> > > -2.35.1
> > > -
> > > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0002-Create-=
subroutine-for-tearing-down-an-interface.patch b/meta-networking/recipes-pr=
otocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patc=
h
> > > index aa3dda8d55b7..867db88a5027 100644
> > > --- a/meta-networking/recipes-protocols/mdns/mdns/0002-Create-subrout=
ine-for-tearing-down-an-interface.patch
> > > +++ b/meta-networking/recipes-protocols/mdns/mdns/0002-Create-subrout=
ine-for-tearing-down-an-interface.patch
> > > @@ -13,11 +13,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.c=
om>
> > >    mDNSPosix/mDNSPosix.c | 22 ++++++++++++++++------
> > >    1 file changed, 16 insertions(+), 6 deletions(-)
> > >
> > > -diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
> > > -index fe7242d83599..a32a880c0ce5 100644
> > > ---- a/mDNSPosix/mDNSPosix.c
> > > -+++ b/mDNSPosix/mDNSPosix.c
> > > -@@ -1043,6 +1043,19 @@ mDNSlocal void FreePosixNetworkInterface(Posi=
xNetworkInterface *intf)
> > > +Index: mDNSResponder/mDNSPosix/mDNSPosix.c
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
> > > ++++ mDNSResponder/mDNSPosix/mDNSPosix.c
> > > +@@ -1043,6 +1043,19 @@ mDNSlocal void FreePosixNetworkInterface
> > >        gRecentInterfaces =3D intf;
> > >    }
> > >
> > > @@ -37,7 +37,7 @@ index fe7242d83599..a32a880c0ce5 100644
> > >    // Grab the first interface, deregister it, free it, and repeat un=
til done.
> > >    mDNSlocal void ClearInterfaceList(mDNS *const m)
> > >    {
> > > -@@ -1051,13 +1064,10 @@ mDNSlocal void ClearInterfaceList(mDNS *cons=
t m)
> > > +@@ -1051,13 +1064,10 @@ mDNSlocal void ClearInterfaceList(mDNS *
> > >        while (m->HostInterfaces)
> > >        {
> > >            PosixNetworkInterface *intf =3D (PosixNetworkInterface*)(m=
->HostInterfaces);
> > > @@ -54,6 +54,3 @@ index fe7242d83599..a32a880c0ce5 100644
> > >    }
> > >
> > >    mDNSlocal int SetupIPv6Socket(int fd)
> > > ---
> > > -2.35.1
> > > -
> > > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Se=
t-libdns_sd.so-soname-correctly.patch b/meta-networking/recipes-protocols/m=
dns/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
> > > index 7f660396b4e3..03fb1bc0d7d7 100644
> > > --- a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdn=
s_sd.so-soname-correctly.patch
> > > +++ b/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdn=
s_sd.so-soname-correctly.patch
> > > @@ -9,11 +9,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com=
>
> > >    mDNSPosix/Makefile | 2 +-
> > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > -diff --git a/mDNSPosix/Makefile b/mDNSPosix/Makefile
> > > -index 802a13dd70b6..5e74193c0e89 100755
> > > ---- a/mDNSPosix/Makefile
> > > -+++ b/mDNSPosix/Makefile
> > > -@@ -276,7 +276,7 @@ libdns_sd: setup $(BUILDDIR)/libdns_sd.$(LDSUFFI=
X)
> > > +Index: mDNSResponder/mDNSPosix/Makefile
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- mDNSResponder.orig/mDNSPosix/Makefile
> > > ++++ mDNSResponder/mDNSPosix/Makefile
> > > +@@ -276,7 +276,7 @@ libdns_sd: setup $(BUILDDIR)/libdns_sd.$
> > >    CLIENTLIBOBJS =3D $(OBJDIR)/dnssd_clientlib.c.so.o $(OBJDIR)/dnssd=
_clientstub.c.so.o $(OBJDIR)/dnssd_ipc.c.so.o $(OBJDIR)/dnssd_errstring.c.s=
o.o
> > >
> > >    $(BUILDDIR)/libdns_sd.$(LDSUFFIX): $(CLIENTLIBOBJS)
> > > @@ -22,6 +22,3 @@ index 802a13dd70b6..5e74193c0e89 100755
> > >       $(STRIP) $@
> > >
> > >    Clients: setup libdns_sd ../Clients/build/dns-sd
> > > ---
> > > -2.35.1
> > > -
> > > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0003-Track-i=
nterface-socket-family.patch b/meta-networking/recipes-protocols/mdns/mdns/=
0003-Track-interface-socket-family.patch
> > > index d2a9995ffa43..f1cda2b895bb 100644
> > > --- a/meta-networking/recipes-protocols/mdns/mdns/0003-Track-interfac=
e-socket-family.patch
> > > +++ b/meta-networking/recipes-protocols/mdns/mdns/0003-Track-interfac=
e-socket-family.patch
> > > @@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.c=
om>
> > >    mDNSPosix/mDNSPosix.h | 2 ++
> > >    2 files changed, 3 insertions(+)
> > >
> > > -diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
> > > -index a32a880c0ce5..9a5b4d7ea4cb 100644
> > > ---- a/mDNSPosix/mDNSPosix.c
> > > -+++ b/mDNSPosix/mDNSPosix.c
> > > -@@ -1415,6 +1415,7 @@ mDNSlocal int SetupOneInterface(mDNS *const m,=
 struct sockaddr *intfAddr, struct
> > > +Index: mDNSResponder/mDNSPosix/mDNSPosix.c
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
> > > ++++ mDNSResponder/mDNSPosix/mDNSPosix.c
> > > +@@ -1415,6 +1415,7 @@ mDNSlocal int SetupOneInterface(mDNS *co
> > >            // Set up the extra fields in PosixNetworkInterface.
> > >            assert(intf->intfName !=3D NULL);         // intf->intfNam=
e already set up above
> > >            intf->index                =3D intfIndex;
> > > @@ -26,10 +26,10 @@ index a32a880c0ce5..9a5b4d7ea4cb 100644
> > >            intf->multicastSocket4     =3D -1;
> > >    #if HAVE_IPV6
> > >            intf->multicastSocket6     =3D -1;
> > > -diff --git a/mDNSPosix/mDNSPosix.h b/mDNSPosix/mDNSPosix.h
> > > -index 9675591b0434..dd7864cd0d5e 100644
> > > ---- a/mDNSPosix/mDNSPosix.h
> > > -+++ b/mDNSPosix/mDNSPosix.h
> > > +Index: mDNSResponder/mDNSPosix/mDNSPosix.h
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.h
> > > ++++ mDNSResponder/mDNSPosix/mDNSPosix.h
> > >   @@ -19,6 +19,7 @@
> > >    #define __mDNSPlatformPosix_h
> > >
> > > @@ -46,6 +46,3 @@ index 9675591b0434..dd7864cd0d5e 100644
> > >        int multicastSocket4;
> > >    #if HAVE_IPV6
> > >        int multicastSocket6;
> > > ---
> > > -2.35.1
> > > -
> > > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0004-Indicat=
e-loopback-interface-to-mDNS-core.patch b/meta-networking/recipes-protocols=
/mdns/mdns/0004-Indicate-loopback-interface-to-mDNS-core.patch
> > > index a5f7f0136bba..6bc36456f682 100644
> > > --- a/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopb=
ack-interface-to-mDNS-core.patch
> > > +++ b/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopb=
ack-interface-to-mDNS-core.patch
> > > @@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.c=
om>
> > >    mDNSPosix/mDNSPosix.c | 7 ++++---
> > >    1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > -diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
> > > -index 9a5b4d7ea4cb..02a19b438e03 100644
> > > ---- a/mDNSPosix/mDNSPosix.c
> > > -+++ b/mDNSPosix/mDNSPosix.c
> > > -@@ -1348,7 +1348,7 @@ mDNSlocal void CleanRecentInterfaces(void)
> > > +Index: mDNSResponder/mDNSPosix/mDNSPosix.c
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
> > > ++++ mDNSResponder/mDNSPosix/mDNSPosix.c
> > > +@@ -1348,7 +1348,7 @@ mDNSlocal void CleanRecentInterfaces(voi
> > >    // Creates a PosixNetworkInterface for the interface whose IP addr=
ess is
> > >    // intfAddr and whose name is intfName and registers it with mDNS =
core.
> > >    mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *in=
tfAddr, struct sockaddr *intfMask,
> > > @@ -27,7 +27,7 @@ index 9a5b4d7ea4cb..02a19b438e03 100644
> > >    {
> > >        int err =3D 0;
> > >        PosixNetworkInterface *intf;
> > > -@@ -1411,6 +1411,7 @@ mDNSlocal int SetupOneInterface(mDNS *const m,=
 struct sockaddr *intfAddr, struct
> > > +@@ -1411,6 +1411,7 @@ mDNSlocal int SetupOneInterface(mDNS *co
> > >
> > >            intf->coreIntf.Advertise =3D m->AdvertiseLocalAddresses;
> > >            intf->coreIntf.McastTxRx =3D mDNStrue;
> > > @@ -35,7 +35,7 @@ index 9a5b4d7ea4cb..02a19b438e03 100644
> > >
> > >            // Set up the extra fields in PosixNetworkInterface.
> > >            assert(intf->intfName !=3D NULL);         // intf->intfNam=
e already set up above
> > > -@@ -1561,7 +1562,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m=
)
> > > +@@ -1561,7 +1562,7 @@ mDNSlocal int SetupInterfaceList(mDNS *c
> > >                        }
> > >    #endif
> > >                        if (SetupOneInterface(m, i->ifa_addr, i->ifa_n=
etmask,
> > > @@ -44,7 +44,7 @@ index 9a5b4d7ea4cb..02a19b438e03 100644
> > >                        {
> > >                            if (i->ifa_addr->sa_family =3D=3D AF_INET)
> > >                                foundav4 =3D mDNStrue;
> > > -@@ -1578,7 +1579,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m=
)
> > > +@@ -1578,7 +1579,7 @@ mDNSlocal int SetupInterfaceList(mDNS *c
> > >            // if ((m->HostInterfaces =3D=3D NULL) && (firstLoopback !=
=3D NULL))
> > >            if (!foundav4 && firstLoopback)
> > >                (void) SetupOneInterface(m, firstLoopback->ifa_addr, f=
irstLoopback->ifa_netmask,
> > > @@ -53,6 +53,3 @@ index 9a5b4d7ea4cb..02a19b438e03 100644
> > >        }
> > >
> > >        // Clean up.
> > > ---
> > > -2.35.1
> > > -
> > > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Se=
parate-TLS-targets-from-libraries.patch b/meta-networking/recipes-protocols=
/mdns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
> > > index a8e8dae60a20..837580ac368a 100644
> > > --- a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-=
TLS-targets-from-libraries.patch
> > > +++ b/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-=
TLS-targets-from-libraries.patch
> > > @@ -12,10 +12,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.c=
om>
> > >    mDNSPosix/Makefile | 14 ++++++++------
> > >    1 file changed, 8 insertions(+), 6 deletions(-)
> > >
> > > -diff --git a/mDNSPosix/Makefile b/mDNSPosix/Makefile
> > > -index 5e74193c0e89..b4313c36b035 100755
> > > ---- a/mDNSPosix/Makefile
> > > -+++ b/mDNSPosix/Makefile
> > > +Index: mDNSResponder/mDNSPosix/Makefile
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- mDNSResponder.orig/mDNSPosix/Makefile
> > > ++++ mDNSResponder/mDNSPosix/Makefile
> > >   @@ -112,9 +112,11 @@ ifeq ($(findstring linux,$(os)),linux)
> > >    ifeq ($(tls), no)
> > >    CFLAGS_OS =3D -D_GNU_SOURCE -DHAVE_IPV6 -DNOT_HAVE_SA_LEN -DUSES_N=
ETLINK -DHAVE_LINUX -DTARGET_OS_LINUX -ftabstop=3D4 -Wno-expansion-to-defin=
ed
> > > @@ -59,6 +59,3 @@ index 5e74193c0e89..b4313c36b035 100755
> > >
> > >    $(OBJDIR)/NetMonitor.c.o:            $(COREDIR)/mDNS.c # Note: Net=
Monitor.c textually imports mDNS.c
> > >
> > > ---
> > > -2.35.1
> > > -
> > > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-Use-lis=
t-for-changed-interfaces.patch b/meta-networking/recipes-protocols/mdns/mdn=
s/0005-Use-list-for-changed-interfaces.patch
> > > index 1aec34f24300..f00116c61741 100644
> > > --- a/meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-c=
hanged-interfaces.patch
> > > +++ b/meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-c=
hanged-interfaces.patch
> > > @@ -15,10 +15,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.c=
om>
> > >    mDNSPosix/mDNSPosix.c | 58 ++++++++++++++++++++++++++++++++-------=
----
> > >    1 file changed, 43 insertions(+), 15 deletions(-)
> > >
> > > -diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
> > > -index 02a19b438e03..e20adda92229 100644
> > > ---- a/mDNSPosix/mDNSPosix.c
> > > -+++ b/mDNSPosix/mDNSPosix.c
> > > +Index: mDNSResponder/mDNSPosix/mDNSPosix.c
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
> > > ++++ mDNSResponder/mDNSPosix/mDNSPosix.c
> > >   @@ -74,6 +74,14 @@ struct IfChangeRec
> > >    };
> > >    typedef struct IfChangeRec IfChangeRec;
> > > @@ -34,7 +34,7 @@ index 02a19b438e03..e20adda92229 100644
> > >    // Note that static data is initialized to zero in (modern) C.
> > >    static PosixEventSource *gEventSources;             // linked list=
 of PosixEventSource's
> > >    static sigset_t gEventSignalSet;                // Signals which e=
vent loop listens for
> > > -@@ -1621,6 +1629,23 @@ mDNSlocal mStatus OpenIfNotifySocket(int *pFD=
)
> > > +@@ -1621,6 +1629,23 @@ mDNSlocal mStatus OpenIfNotifySocket(int
> > >        return err;
> > >    }
> > >
> > > @@ -58,7 +58,7 @@ index 02a19b438e03..e20adda92229 100644
> > >    #if MDNS_DEBUGMSGS
> > >    mDNSlocal void      PrintNetLinkMsg(const struct nlmsghdr *pNLMsg)
> > >    {
> > > -@@ -1648,14 +1673,13 @@ mDNSlocal void      PrintNetLinkMsg(const st=
ruct nlmsghdr *pNLMsg)
> > > +@@ -1648,14 +1673,13 @@ mDNSlocal void      PrintNetLinkMsg(cons
> > >    }
> > >    #endif
> > >
> > > @@ -74,7 +74,7 @@ index 02a19b438e03..e20adda92229 100644
> > >
> > >        // The structure here is more complex than it really ought to =
be because,
> > >        // unfortunately, there's no good way to size a buffer in adva=
nce large
> > > -@@ -1691,9 +1715,9 @@ mDNSlocal mDNSu32       ProcessRoutingNotifica=
tion(int sd)
> > > +@@ -1691,9 +1715,9 @@ mDNSlocal mDNSu32       ProcessRoutingNo
> > >
> > >            // Process the NetLink message
> > >            if (pNLMsg->nlmsg_type =3D=3D RTM_GETLINK || pNLMsg->nlmsg=
_type =3D=3D RTM_NEWLINK)
> > > @@ -86,7 +86,7 @@ index 02a19b438e03..e20adda92229 100644
> > >
> > >            // Advance pNLMsg to the next message in the buffer
> > >            if ((pNLMsg->nlmsg_flags & NLM_F_MULTI) !=3D 0 && pNLMsg->=
nlmsg_type !=3D NLMSG_DONE)
> > > -@@ -1704,8 +1728,6 @@ mDNSlocal mDNSu32       ProcessRoutingNotifica=
tion(int sd)
> > > +@@ -1704,8 +1728,6 @@ mDNSlocal mDNSu32       ProcessRoutingNo
> > >            else
> > >                break;  // all done!
> > >        }
> > > @@ -95,7 +95,7 @@ index 02a19b438e03..e20adda92229 100644
> > >    }
> > >
> > >    #else // USES_NETLINK
> > > -@@ -1737,14 +1759,13 @@ mDNSlocal void      PrintRoutingSocketMsg(co=
nst struct ifa_msghdr *pRSMsg)
> > > +@@ -1737,14 +1759,13 @@ mDNSlocal void      PrintRoutingSocketMs
> > >    }
> > >    #endif
> > >
> > > @@ -111,7 +111,7 @@ index 02a19b438e03..e20adda92229 100644
> > >
> > >        readCount =3D read(sd, buff, sizeof buff);
> > >        if (readCount < (ssize_t) sizeof(struct ifa_msghdr))
> > > -@@ -1759,12 +1780,10 @@ mDNSlocal mDNSu32       ProcessRoutingNotifi=
cation(int sd)
> > > +@@ -1759,12 +1780,10 @@ mDNSlocal mDNSu32       ProcessRoutingNo
> > >            pRSMsg->ifam_type =3D=3D RTM_IFINFO)
> > >        {
> > >            if (pRSMsg->ifam_type =3D=3D RTM_IFINFO)
> > > @@ -126,7 +126,7 @@ index 02a19b438e03..e20adda92229 100644
> > >    }
> > >
> > >    #endif // USES_NETLINK
> > > -@@ -1774,7 +1793,8 @@ mDNSlocal void InterfaceChangeCallback(int fd,=
 void *context)
> > > +@@ -1774,7 +1793,8 @@ mDNSlocal void InterfaceChangeCallback(i
> > >    {
> > >        IfChangeRec     *pChgRec =3D (IfChangeRec*) context;
> > >        fd_set readFDs;
> > > @@ -136,7 +136,7 @@ index 02a19b438e03..e20adda92229 100644
> > >        struct timeval zeroTimeout =3D { 0, 0 };
> > >
> > >        (void)fd; // Unused
> > > -@@ -1782,17 +1802,25 @@ mDNSlocal void InterfaceChangeCallback(int f=
d, void *context)
> > > +@@ -1782,17 +1802,25 @@ mDNSlocal void InterfaceChangeCallback(i
> > >        FD_ZERO(&readFDs);
> > >        FD_SET(pChgRec->NotifySD, &readFDs);
> > >
> > > @@ -164,6 +164,3 @@ index 02a19b438e03..e20adda92229 100644
> > >    }
> > >
> > >    // Register with either a Routing Socket or RtNetLink to listen fo=
r interface changes.
> > > ---
> > > -2.35.1
> > > -
> > > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCor=
e-Fix-broken-debug-parameter.patch b/meta-networking/recipes-protocols/mdns=
/mdns/0005-mDNSCore-Fix-broken-debug-parameter.patch
> > > index 4cda71bdb1bc..fd2f2f117887 100644
> > > --- a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-b=
roken-debug-parameter.patch
> > > +++ b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-b=
roken-debug-parameter.patch
> > > @@ -10,11 +10,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.c=
om>
> > >    mDNSCore/mDNS.c | 2 +-
> > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > -diff --git a/mDNSCore/mDNS.c b/mDNSCore/mDNS.c
> > > -index eecd7daa724e..1e843c081938 100644
> > > ---- a/mDNSCore/mDNS.c
> > > -+++ b/mDNSCore/mDNS.c
> > > -@@ -10210,7 +10210,7 @@ mDNSlocal void mDNSCoreReceiveNoUnicastAnswe=
rs(mDNS *const m, const DNSMessage *
> > > +Index: mDNSResponder/mDNSCore/mDNS.c
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- mDNSResponder.orig/mDNSCore/mDNS.c
> > > ++++ mDNSResponder/mDNSCore/mDNS.c
> > > +@@ -10231,7 +10231,7 @@ mDNSlocal void mDNSCoreReceiveNoUnicastA
> > >    #else
> > >                                const DNSServRef dnsserv =3D qptr->qDN=
SServer;
> > >    #endif
> > > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-=
noisy-netlink-sockets.patch b/meta-networking/recipes-protocols/mdns/mdns/0=
006-Handle-noisy-netlink-sockets.patch
> > > index 882d08e6c63d..80cdbca50013 100644
> > > --- a/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-n=
etlink-sockets.patch
> > > +++ b/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-n=
etlink-sockets.patch
> > > @@ -27,11 +27,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.c=
om>
> > >    mDNSPosix/mDNSPosix.c | 182 ++++++++++++++++++++++++++++++++++++++=
+---
> > >    1 file changed, 172 insertions(+), 10 deletions(-)
> > >
> > > -diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
> > > -index e20adda92229..5d52de31f79b 100644
> > > ---- a/mDNSPosix/mDNSPosix.c
> > > -+++ b/mDNSPosix/mDNSPosix.c
> > > -@@ -1788,14 +1788,43 @@ mDNSlocal void          ProcessRoutingNotifi=
cation(int sd, GenLinkedList *change
> > > +Index: mDNSResponder/mDNSPosix/mDNSPosix.c
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
> > > ++++ mDNSResponder/mDNSPosix/mDNSPosix.c
> > > +@@ -1788,14 +1788,43 @@ mDNSlocal void          ProcessRoutingNo
> > >
> > >    #endif // USES_NETLINK
> > >
> > > @@ -75,7 +75,7 @@ index e20adda92229..5d52de31f79b 100644
> > >
> > >        (void)fd; // Unused
> > >
> > > -@@ -1810,12 +1839,149 @@ mDNSlocal void InterfaceChangeCallback(int =
fd, void *context)
> > > +@@ -1810,12 +1839,149 @@ mDNSlocal void InterfaceChangeCallback(i
> > >        }
> > >        while (0 < select(pChgRec->NotifySD + 1, &readFDs, (fd_set*) N=
ULL, (fd_set*) NULL, &zeroTimeout));
> > >
> > > @@ -230,7 +230,7 @@ index e20adda92229..5d52de31f79b 100644
> > >        while ((changedInterface =3D (NetworkInterfaceIndex*)changedIn=
terfaces.Head) !=3D NULL)
> > >        {
> > >            RemoveFromList(&changedInterfaces, changedInterface);
> > > -@@ -1947,15 +2113,11 @@ mDNSexport void mDNSPlatformClose(mDNS *cons=
t m)
> > > +@@ -1947,15 +2113,11 @@ mDNSexport void mDNSPlatformClose(mDNS *
> > >    #endif
> > >    }
> > >
> > > @@ -247,6 +247,3 @@ index e20adda92229..5d52de31f79b 100644
> > >        ClearInterfaceList(m);
> > >        err =3D SetupInterfaceList(m);
> > >        return PosixErrorToStatus(err);
> > > ---
> > > -2.35.1
> > > -
> > > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0006-make-Ad=
d-top-level-Makefile.patch b/meta-networking/recipes-protocols/mdns/mdns/00=
06-make-Add-top-level-Makefile.patch
> > > index 268e574c5090..c12a02fcdd8c 100644
> > > --- a/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-l=
evel-Makefile.patch
> > > +++ b/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-l=
evel-Makefile.patch
> > > @@ -12,14 +12,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.c=
om>
> > >    1 file changed, 2 insertions(+)
> > >    create mode 100644 Makefile
> > >
> > > -diff --git a/Makefile b/Makefile
> > > -new file mode 100644
> > > -index 000000000000..feb6ac67ef47
> > > +Index: mDNSResponder/Makefile
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >   --- /dev/null
> > > -+++ b/Makefile
> > > ++++ mDNSResponder/Makefile
> > >   @@ -0,0 +1,2 @@
> > >   +all clean:
> > >   +   cd mDNSPosix && $(MAKE) $@
> > > ---
> > > -2.35.1
> > > -
> > > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-de=
leted-interfaces-as-being-changed.patch b/meta-networking/recipes-protocols=
/mdns/mdns/0007-Mark-deleted-interfaces-as-being-changed.patch
> > > index e53b0fd3ae7a..dae1ac7ea01f 100644
> > > --- a/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-i=
nterfaces-as-being-changed.patch
> > > +++ b/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-i=
nterfaces-as-being-changed.patch
> > > @@ -22,11 +22,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.c=
om>
> > >    mDNSPosix/mDNSPosix.c | 2 +-
> > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > -diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
> > > -index 5d52de31f79b..77d982f4c50b 100644
> > > ---- a/mDNSPosix/mDNSPosix.c
> > > -+++ b/mDNSPosix/mDNSPosix.c
> > > -@@ -1714,7 +1714,7 @@ mDNSlocal void          ProcessRoutingNotifica=
tion(int sd, GenLinkedList *change
> > > +Index: mDNSResponder/mDNSPosix/mDNSPosix.c
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
> > > ++++ mDNSResponder/mDNSPosix/mDNSPosix.c
> > > +@@ -1714,7 +1714,7 @@ mDNSlocal void          ProcessRoutingNo
> > >    #endif
> > >
> > >            // Process the NetLink message
> > > @@ -35,6 +35,3 @@ index 5d52de31f79b..77d982f4c50b 100644
> > >                AddInterfaceIndexToList(changedInterfaces, ((struct if=
infomsg*) NLMSG_DATA(pNLMsg))->ifi_index);
> > >            else if (pNLMsg->nlmsg_type =3D=3D RTM_DELADDR || pNLMsg->=
nlmsg_type =3D=3D RTM_NEWADDR)
> > >                AddInterfaceIndexToList(changedInterfaces, ((struct if=
addrmsg*) NLMSG_DATA(pNLMsg))->ifa_index);
> > > ---
> > > -2.35.1
> > > -
> > > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-=
errors-from-socket-calls.patch b/meta-networking/recipes-protocols/mdns/mdn=
s/0008-Handle-errors-from-socket-calls.patch
> > > index e689f8c2675c..1789001e14e2 100644
> > > --- a/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-=
from-socket-calls.patch
> > > +++ b/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-=
from-socket-calls.patch
> > > @@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.c=
om>
> > >    mDNSPosix/mDNSPosix.c | 12 +++++++++---
> > >    1 file changed, 9 insertions(+), 3 deletions(-)
> > >
> > > -diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
> > > -index 77d982f4c50b..cab512160afb 100644
> > > ---- a/mDNSPosix/mDNSPosix.c
> > > -+++ b/mDNSPosix/mDNSPosix.c
> > > -@@ -1677,7 +1677,7 @@ mDNSlocal void          ProcessRoutingNotifica=
tion(int sd, GenLinkedList *change
> > > +Index: mDNSResponder/mDNSPosix/mDNSPosix.c
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
> > > ++++ mDNSResponder/mDNSPosix/mDNSPosix.c
> > > +@@ -1677,7 +1677,7 @@ mDNSlocal void          ProcessRoutingNo
> > >    // Read through the messages on sd and if any indicate that any in=
terface records should
> > >    // be torn down and rebuilt, return affected indices as a bitmask.=
 Otherwise return 0.
> > >    {
> > > @@ -27,7 +27,7 @@ index 77d982f4c50b..cab512160afb 100644
> > >        char buff[4096];
> > >        struct nlmsghdr         *pNLMsg =3D (struct nlmsghdr*) buff;
> > >
> > > -@@ -1686,7 +1686,10 @@ mDNSlocal void          ProcessRoutingNotific=
ation(int sd, GenLinkedList *change
> > > +@@ -1686,7 +1686,10 @@ mDNSlocal void          ProcessRoutingNo
> > >        // enough to hold all pending data and so avoid message fragme=
ntation.
> > >        // (Note that FIONREAD is not supported on AF_NETLINK.)
> > >
> > > @@ -39,7 +39,7 @@ index 77d982f4c50b..cab512160afb 100644
> > >        while (1)
> > >        {
> > >            // Make sure we've got an entire nlmsghdr in the buffer, a=
nd payload, too.
> > > -@@ -1702,7 +1705,9 @@ mDNSlocal void          ProcessRoutingNotifica=
tion(int sd, GenLinkedList *change
> > > +@@ -1702,7 +1705,9 @@ mDNSlocal void          ProcessRoutingNo
> > >                    pNLMsg =3D (struct nlmsghdr*) buff;
> > >
> > >                    // read more data
> > > @@ -50,7 +50,7 @@ index 77d982f4c50b..cab512160afb 100644
> > >                    continue;                   // spin around and rev=
alidate with new readCount
> > >                }
> > >                else
> > > -@@ -2017,6 +2022,7 @@ mDNSlocal mDNSBool mDNSPlatformInit_CanReceive=
Unicast(void)
> > > +@@ -2017,6 +2022,7 @@ mDNSlocal mDNSBool mDNSPlatformInit_CanR
> > >        int err;
> > >        int s =3D socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
> > >        struct sockaddr_in s5353;
> > > @@ -58,6 +58,3 @@ index 77d982f4c50b..cab512160afb 100644
> > >        s5353.sin_family      =3D AF_INET;
> > >        s5353.sin_port        =3D MulticastDNSPort.NotAnInteger;
> > >        s5353.sin_addr.s_addr =3D 0;
> > > ---
> > > -2.35.1
> > > -
> > > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-=
unneeded-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0009-r=
emove-unneeded-headers.patch
> > > index 74d387368c43..d443bc97b2a8 100644
> > > --- a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneede=
d-headers.patch
> > > +++ b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneede=
d-headers.patch
> > > @@ -14,20 +14,18 @@ Signed-off-by: Beniamin Sandu <beniaminsandu@gmai=
l.com>
> > >    mDNSPosix/mbedtls.c | 2 --
> > >    1 file changed, 2 deletions(-)
> > >
> > > -diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
> > > -index a73681b..ab8f8c7 100644
> > > ---- a/mDNSPosix/mbedtls.c
> > > -+++ b/mDNSPosix/mbedtls.c
> > > +Index: mDNSResponder/mDNSPosix/mbedtls.c
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- mDNSResponder.orig/mDNSPosix/mbedtls.c
> > > ++++ mDNSResponder/mDNSPosix/mbedtls.c
> > >   @@ -38,10 +38,8 @@
> > >    #include <mbedtls/sha256.h>
> > >    #include <mbedtls/base64.h>
> > > -
> > > +
> > >   -#include <mbedtls/certs.h>
> > >    #include <mbedtls/x509.h>
> > >    #include <mbedtls/ssl.h>
> > >   -#include <mbedtls/config.h>
> > > -
> > > +
> > >    // Posix TLS server context
> > >    struct TLSContext_struct {
> > > ---
> > > -2.34.1
> > > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0015-Add-mis=
sing-limits.h.patch b/meta-networking/recipes-protocols/mdns/mdns/0015-Add-=
missing-limits.h.patch
> > > index 9fe721ff0759..511a6fdc1873 100644
> > > --- a/meta-networking/recipes-protocols/mdns/mdns/0015-Add-missing-li=
mits.h.patch
> > > +++ b/meta-networking/recipes-protocols/mdns/mdns/0015-Add-missing-li=
mits.h.patch
> > > @@ -9,10 +9,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com=
>
> > >    mDNSShared/PlatformCommon.c | 1 +
> > >    1 file changed, 1 insertion(+)
> > >
> > > -diff --git a/mDNSShared/PlatformCommon.c b/mDNSShared/PlatformCommon=
.c
> > > -index 9ce15468e217..c308af3e8b0e 100644
> > > ---- a/mDNSShared/PlatformCommon.c
> > > -+++ b/mDNSShared/PlatformCommon.c
> > > +Index: mDNSResponder/mDNSShared/PlatformCommon.c
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +--- mDNSResponder.orig/mDNSShared/PlatformCommon.c
> > > ++++ mDNSResponder/mDNSShared/PlatformCommon.c
> > >   @@ -32,6 +32,7 @@
> > >    #include <time.h>
> > >    #include <sys/time.h>           // Needed for #include <sys/time.h=
>().
> > > diff --git a/meta-networking/recipes-protocols/mdns/mdns_2200.0.8.bb =
b/meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb
> > > similarity index 98%
> > > rename from meta-networking/recipes-protocols/mdns/mdns_2200.0.8.bb
> > > rename to meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.=
bb
> > > index 8370ed50c08c..af2b337172a1 100644
> > > --- a/meta-networking/recipes-protocols/mdns/mdns_2200.0.8.bb
> > > +++ b/meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb
> > > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D31c5037192=
1e0fb731003bbc665f29bf"
> > >
> > >   DEPENDS:append:libc-musl =3D " musl-nscd"
> > >
> > > -SRC_URI =3D "git://github.com/apple-oss-distributions/mDNSResponder;=
protocol=3Dhttps;branch=3Dmain \
> > > +SRC_URI =3D "git://github.com/apple-oss-distributions/mDNSResponder;=
protocol=3Dhttps;branch=3Drel/mDNSResponder-2200 \
> > >              file://0001-dns-sd-Include-missing-headers.patch \
> > >              file://0002-make-Set-libdns_sd.so-soname-correctly.patch=
 \
> > >              file://0004-make-Separate-TLS-targets-from-libraries.pat=
ch \
> > > @@ -25,7 +25,7 @@ SRC_URI =3D "git://github.com/apple-oss-distributio=
ns/mDNSResponder;protocol=3Dhttps
> > >              file://0015-Add-missing-limits.h.patch \
> > >              file://0001-Handle-interface-without-ifa_addr.patch \
> > >              "
> > > -SRCREV =3D "d5029b5dff8aa59d1fc07ed796e994106ef58dee"
> > > +SRCREV =3D "a9f4049ab772ca57b5afc9804ae5004beb711d6e"
> > >
> > >   # We install a stub Makefile in the top directory so that the vario=
us checks
> > >   # in base.bbclass pass their tests for a Makefile, this ensures (th=
at amongst
> > >
> > >
> > >
> > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#106876): https://lists.openembedded.org/g/openembed=
ded-devel/message/106876
> > Mute This Topic: https://lists.openembedded.org/mt/102654260/3618097
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[alex.kiernan@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alex Kiernan

