Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2EDC072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 20:40:56 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.6094.1700253649212272904
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 12:40:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hxli8fhu;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7b074e318b5so58430339f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 12:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700253648; x=1700858448; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILd6o/EbGZ/vcVn47wiCIe5FN+SMQ33KumWOM/Qy30A=;
        b=hxli8fhuUMqzqy3MkmxvESx3tOSumSZSvWgD7oshKA1XC3BbPaq81MqI5MKXt+C3KL
         Nl3uyoecSYYG7Pn7IxLr/S+3hHlgVHc53PJoPLNT85la8spQBA2rVrBZCbwdvO2YRn0w
         ZZriQcg1AgadWXU3zwUD7rhjKEev695pqONdCoDf+g0GzHmbvPK+Hp+m6336OLppQaaK
         sgI0iiUP9E37QNb+iUQavpZb1LTdxiZO/P47hqNRMJuOB5pp3OOxn7OZKVXG1lNwpWoC
         D5YYu7g4mH7WiVpwPrNWu41Zeda7WU1zVWYPhDsq6Mq0Wn78BRERN1Gpf5z5+3QAnTTk
         6IVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700253648; x=1700858448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILd6o/EbGZ/vcVn47wiCIe5FN+SMQ33KumWOM/Qy30A=;
        b=SJme9mlrgUa0ZZcsAC75Qt6iDBhbI/LPkdgO+iXQm6VCNQQ4czaqKW/UiZOx0GlZmh
         onuLtbNA/g0/BKHlcKODRGrCK70M4+nOLgrSpTdGklbMhQlRcAqd600aMXPGwg+zNiZY
         0LYIHKEXVI7Hvr1pCfGzkWlgWy+PUNBhCBn3LVSq9ApZBxD0ZV/ghLU8K8G5Bb9dEETL
         24jZLBEVp3+H0PY3Tl6V1P3ZsXpKXVWdithfmyR4/t7Cez8s1mTuHK9PSIvZ8T1dWV1u
         T3mA0T6vR2ZOmeaT5kT8u4wooTjB5buhklhhtQi2ysbz7NSL/xi/m24/drF7ZgbE0cVs
         SK6g==
X-Gm-Message-State: AOJu0Yz78zBTo8MilsuTjzKn5y6LJM/83Qa+jdCy/M+soDiphZrgZa9x
	Q8AKoNMxDnuYo8v85dJRkx3WbEiYt4/XSmbia2b9hrgt
X-Google-Smtp-Source: AGHT+IGINs1IA2aCO686K7pUHhzNQ8u/wFr5WlNLeykvB3PtBoBgJcjh1ConVbxICBFjZWhitNUbBk/iOA0A6LFQOZY=
X-Received: by 2002:a05:6602:3718:b0:7ac:ccd9:da93 with SMTP id
 bh24-20020a056602371800b007acccd9da93mr6042188iob.0.1700253647802; Fri, 17
 Nov 2023 12:40:47 -0800 (PST)
MIME-Version: 1.0
References: <20231117193223.7359-1-alex.kiernan@gmail.com> <8189c8fe-4afb-46ef-adbf-83784381e681@gmail.com>
In-Reply-To: <8189c8fe-4afb-46ef-adbf-83784381e681@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 17 Nov 2023 20:40:35 +0000
Message-ID: <CAO5Uq5SUU5najbWZ29ptAsn0b80+E-Y-pYHa8cJucHrFL9ZPhA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mdns: Upgrade 2200.0.8 -> 2200.40.37.0.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Wang Mingyu <wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 20:40:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106878

Thanks... I should've checked master-next :|

On Fri, Nov 17, 2023 at 7:41=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> I have squashed this with
>
> https://lore.kernel.org/openembedded-devel/1700121036-21542-1-git-send-em=
ail-wangmy@fujitsu.com/T/#u
>
> On 11/17/23 11:32 AM, Alex Kiernan wrote:
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >   ...utine-for-cleaning-recent-interfaces.patch | 15 +++++------
> >   ...01-Handle-interface-without-ifa_addr.patch | 12 ++++-----
> >   .../0001-dns-sd-Include-missing-headers.patch | 11 +++-----
> >   ...outine-for-tearing-down-an-interface.patch | 15 +++++------
> >   ...ke-Set-libdns_sd.so-soname-correctly.patch | 13 ++++-----
> >   .../0003-Track-interface-socket-family.patch  | 21 +++++++--------
> >   ...cate-loopback-interface-to-mDNS-core.patch | 19 ++++++-------
> >   ...-Separate-TLS-targets-from-libraries.patch | 11 +++-----
> >   ...0005-Use-list-for-changed-interfaces.patch | 27 +++++++++---------=
-
> >   ...-mDNSCore-Fix-broken-debug-parameter.patch | 10 +++----
> >   .../0006-Handle-noisy-netlink-sockets.patch   | 17 +++++-------
> >   .../0006-make-Add-top-level-Makefile.patch    | 10 +++----
> >   ...-deleted-interfaces-as-being-changed.patch | 13 ++++-----
> >   ...0008-Handle-errors-from-socket-calls.patch | 19 ++++++-------
> >   .../mdns/0009-remove-unneeded-headers.patch   | 14 +++++-----
> >   .../mdns/mdns/0015-Add-missing-limits.h.patch |  8 +++---
> >   ...dns_2200.0.8.bb =3D> mdns_2200.40.37.0.1.bb} |  4 +--
> >   17 files changed, 100 insertions(+), 139 deletions(-)
> >   rename meta-networking/recipes-protocols/mdns/{mdns_2200.0.8.bb =3D> =
mdns_2200.40.37.0.1.bb} (98%)
> >
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Create-su=
broutine-for-cleaning-recent-interfaces.patch b/meta-networking/recipes-pro=
tocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.patc=
h
> > index 91198dea733c..f5d424d58f4e 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutin=
e-for-cleaning-recent-interfaces.patch
> > +++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutin=
e-for-cleaning-recent-interfaces.patch
> > @@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com=
>
> >    mDNSPosix/mDNSPosix.c | 24 ++++++++++++++----------
> >    1 file changed, 14 insertions(+), 10 deletions(-)
> >
> > -diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
> > -index 0a7c3dfa2475..fe7242d83599 100644
> > ---- a/mDNSPosix/mDNSPosix.c
> > -+++ b/mDNSPosix/mDNSPosix.c
> > -@@ -1322,6 +1322,19 @@ mDNSlocal int SetupSocket(struct sockaddr *intf=
Addr, mDNSIPPort port, int interf
> > +Index: mDNSResponder/mDNSPosix/mDNSPosix.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
> > ++++ mDNSResponder/mDNSPosix/mDNSPosix.c
> > +@@ -1322,6 +1322,19 @@ mDNSlocal int SetupSocket(struct sockadd
> >        return err;
> >    }
> >
> > @@ -38,7 +38,7 @@ index 0a7c3dfa2475..fe7242d83599 100644
> >    // Creates a PosixNetworkInterface for the interface whose IP addres=
s is
> >    // intfAddr and whose name is intfName and registers it with mDNS co=
re.
> >    mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intf=
Addr, struct sockaddr *intfMask,
> > -@@ -1559,16 +1572,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
> > +@@ -1559,16 +1572,7 @@ mDNSlocal int SetupInterfaceList(mDNS *c
> >
> >        // Clean up.
> >        if (intfList !=3D NULL) freeifaddrs(intfList);
> > @@ -56,6 +56,3 @@ index 0a7c3dfa2475..fe7242d83599 100644
> >
> >        return err;
> >    }
> > ---
> > -2.35.1
> > -
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-in=
terface-without-ifa_addr.patch b/meta-networking/recipes-protocols/mdns/mdn=
s/0001-Handle-interface-without-ifa_addr.patch
> > index daee318ae4a3..7e76f07c0eb3 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface=
-without-ifa_addr.patch
> > +++ b/meta-networking/recipes-protocols/mdns/mdns/0001-Handle-interface=
-without-ifa_addr.patch
> > @@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com=
>
> >    mDNSPosix/mDNSPosix.c | 4 +++-
> >    1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > -diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
> > -index d7f31cc4d5cf..f10301253f58 100644
> > ---- a/mDNSPosix/mDNSPosix.c
> > -+++ b/mDNSPosix/mDNSPosix.c
> > -@@ -1895,6 +1895,7 @@ mDNSlocal void InterfaceChangeCallback(int fd, v=
oid *context)
> > +Index: mDNSResponder/mDNSPosix/mDNSPosix.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
> > ++++ mDNSResponder/mDNSPosix/mDNSPosix.c
> > +@@ -1895,6 +1895,7 @@ mDNSlocal void InterfaceChangeCallback(i
> >           continue;
> >
> >            if ((ifa_loop4 =3D=3D NULL) &&
> > @@ -26,7 +26,7 @@ index d7f31cc4d5cf..f10301253f58 100644
> >                ((*ifi)->ifa_addr->sa_family =3D=3D AF_INET) &&
> >                ((*ifi)->ifa_flags & IFF_UP) &&
> >                ((*ifi)->ifa_flags & IFF_LOOPBACK))
> > -@@ -1903,7 +1904,8 @@ mDNSlocal void InterfaceChangeCallback(int fd, v=
oid *context)
> > +@@ -1903,7 +1904,8 @@ mDNSlocal void InterfaceChangeCallback(i
> >                continue;
> >            }
> >
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-In=
clude-missing-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0=
001-dns-sd-Include-missing-headers.patch
> > index 4a60a9572896..82825b294de0 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-m=
issing-headers.patch
> > +++ b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-m=
issing-headers.patch
> > @@ -11,10 +11,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >    mDNSPosix/nss_mdns.c | 3 +++
> >    1 file changed, 3 insertions(+)
> >
> > -diff --git a/mDNSPosix/nss_mdns.c b/mDNSPosix/nss_mdns.c
> > -index afadb3c6c33b..84c312759463 100644
> > ---- a/mDNSPosix/nss_mdns.c
> > -+++ b/mDNSPosix/nss_mdns.c
> > +Index: mDNSResponder/mDNSPosix/nss_mdns.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- mDNSResponder.orig/mDNSPosix/nss_mdns.c
> > ++++ mDNSResponder/mDNSPosix/nss_mdns.c
> >   @@ -89,6 +89,9 @@
> >
> >    #include <dns_sd.h>
> > @@ -25,6 +25,3 @@ index afadb3c6c33b..84c312759463 100644
> >
> >    //----------
> >    // Public functions
> > ---
> > -2.35.1
> > -
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0002-Create-su=
broutine-for-tearing-down-an-interface.patch b/meta-networking/recipes-prot=
ocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patch
> > index aa3dda8d55b7..867db88a5027 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutin=
e-for-tearing-down-an-interface.patch
> > +++ b/meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutin=
e-for-tearing-down-an-interface.patch
> > @@ -13,11 +13,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com=
>
> >    mDNSPosix/mDNSPosix.c | 22 ++++++++++++++++------
> >    1 file changed, 16 insertions(+), 6 deletions(-)
> >
> > -diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
> > -index fe7242d83599..a32a880c0ce5 100644
> > ---- a/mDNSPosix/mDNSPosix.c
> > -+++ b/mDNSPosix/mDNSPosix.c
> > -@@ -1043,6 +1043,19 @@ mDNSlocal void FreePosixNetworkInterface(PosixN=
etworkInterface *intf)
> > +Index: mDNSResponder/mDNSPosix/mDNSPosix.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
> > ++++ mDNSResponder/mDNSPosix/mDNSPosix.c
> > +@@ -1043,6 +1043,19 @@ mDNSlocal void FreePosixNetworkInterface
> >        gRecentInterfaces =3D intf;
> >    }
> >
> > @@ -37,7 +37,7 @@ index fe7242d83599..a32a880c0ce5 100644
> >    // Grab the first interface, deregister it, free it, and repeat unti=
l done.
> >    mDNSlocal void ClearInterfaceList(mDNS *const m)
> >    {
> > -@@ -1051,13 +1064,10 @@ mDNSlocal void ClearInterfaceList(mDNS *const =
m)
> > +@@ -1051,13 +1064,10 @@ mDNSlocal void ClearInterfaceList(mDNS *
> >        while (m->HostInterfaces)
> >        {
> >            PosixNetworkInterface *intf =3D (PosixNetworkInterface*)(m->=
HostInterfaces);
> > @@ -54,6 +54,3 @@ index fe7242d83599..a32a880c0ce5 100644
> >    }
> >
> >    mDNSlocal int SetupIPv6Socket(int fd)
> > ---
> > -2.35.1
> > -
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-=
libdns_sd.so-soname-correctly.patch b/meta-networking/recipes-protocols/mdn=
s/mdns/0002-make-Set-libdns_sd.so-soname-correctly.patch
> > index 7f660396b4e3..03fb1bc0d7d7 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_=
sd.so-soname-correctly.patch
> > +++ b/meta-networking/recipes-protocols/mdns/mdns/0002-make-Set-libdns_=
sd.so-soname-correctly.patch
> > @@ -9,11 +9,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> >    mDNSPosix/Makefile | 2 +-
> >    1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > -diff --git a/mDNSPosix/Makefile b/mDNSPosix/Makefile
> > -index 802a13dd70b6..5e74193c0e89 100755
> > ---- a/mDNSPosix/Makefile
> > -+++ b/mDNSPosix/Makefile
> > -@@ -276,7 +276,7 @@ libdns_sd: setup $(BUILDDIR)/libdns_sd.$(LDSUFFIX)
> > +Index: mDNSResponder/mDNSPosix/Makefile
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- mDNSResponder.orig/mDNSPosix/Makefile
> > ++++ mDNSResponder/mDNSPosix/Makefile
> > +@@ -276,7 +276,7 @@ libdns_sd: setup $(BUILDDIR)/libdns_sd.$
> >    CLIENTLIBOBJS =3D $(OBJDIR)/dnssd_clientlib.c.so.o $(OBJDIR)/dnssd_c=
lientstub.c.so.o $(OBJDIR)/dnssd_ipc.c.so.o $(OBJDIR)/dnssd_errstring.c.so.=
o
> >
> >    $(BUILDDIR)/libdns_sd.$(LDSUFFIX): $(CLIENTLIBOBJS)
> > @@ -22,6 +22,3 @@ index 802a13dd70b6..5e74193c0e89 100755
> >       $(STRIP) $@
> >
> >    Clients: setup libdns_sd ../Clients/build/dns-sd
> > ---
> > -2.35.1
> > -
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0003-Track-int=
erface-socket-family.patch b/meta-networking/recipes-protocols/mdns/mdns/00=
03-Track-interface-socket-family.patch
> > index d2a9995ffa43..f1cda2b895bb 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-=
socket-family.patch
> > +++ b/meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-=
socket-family.patch
> > @@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com=
>
> >    mDNSPosix/mDNSPosix.h | 2 ++
> >    2 files changed, 3 insertions(+)
> >
> > -diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
> > -index a32a880c0ce5..9a5b4d7ea4cb 100644
> > ---- a/mDNSPosix/mDNSPosix.c
> > -+++ b/mDNSPosix/mDNSPosix.c
> > -@@ -1415,6 +1415,7 @@ mDNSlocal int SetupOneInterface(mDNS *const m, s=
truct sockaddr *intfAddr, struct
> > +Index: mDNSResponder/mDNSPosix/mDNSPosix.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
> > ++++ mDNSResponder/mDNSPosix/mDNSPosix.c
> > +@@ -1415,6 +1415,7 @@ mDNSlocal int SetupOneInterface(mDNS *co
> >            // Set up the extra fields in PosixNetworkInterface.
> >            assert(intf->intfName !=3D NULL);         // intf->intfName =
already set up above
> >            intf->index                =3D intfIndex;
> > @@ -26,10 +26,10 @@ index a32a880c0ce5..9a5b4d7ea4cb 100644
> >            intf->multicastSocket4     =3D -1;
> >    #if HAVE_IPV6
> >            intf->multicastSocket6     =3D -1;
> > -diff --git a/mDNSPosix/mDNSPosix.h b/mDNSPosix/mDNSPosix.h
> > -index 9675591b0434..dd7864cd0d5e 100644
> > ---- a/mDNSPosix/mDNSPosix.h
> > -+++ b/mDNSPosix/mDNSPosix.h
> > +Index: mDNSResponder/mDNSPosix/mDNSPosix.h
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.h
> > ++++ mDNSResponder/mDNSPosix/mDNSPosix.h
> >   @@ -19,6 +19,7 @@
> >    #define __mDNSPlatformPosix_h
> >
> > @@ -46,6 +46,3 @@ index 9675591b0434..dd7864cd0d5e 100644
> >        int multicastSocket4;
> >    #if HAVE_IPV6
> >        int multicastSocket6;
> > ---
> > -2.35.1
> > -
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-=
loopback-interface-to-mDNS-core.patch b/meta-networking/recipes-protocols/m=
dns/mdns/0004-Indicate-loopback-interface-to-mDNS-core.patch
> > index a5f7f0136bba..6bc36456f682 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopbac=
k-interface-to-mDNS-core.patch
> > +++ b/meta-networking/recipes-protocols/mdns/mdns/0004-Indicate-loopbac=
k-interface-to-mDNS-core.patch
> > @@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com=
>
> >    mDNSPosix/mDNSPosix.c | 7 ++++---
> >    1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > -diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
> > -index 9a5b4d7ea4cb..02a19b438e03 100644
> > ---- a/mDNSPosix/mDNSPosix.c
> > -+++ b/mDNSPosix/mDNSPosix.c
> > -@@ -1348,7 +1348,7 @@ mDNSlocal void CleanRecentInterfaces(void)
> > +Index: mDNSResponder/mDNSPosix/mDNSPosix.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
> > ++++ mDNSResponder/mDNSPosix/mDNSPosix.c
> > +@@ -1348,7 +1348,7 @@ mDNSlocal void CleanRecentInterfaces(voi
> >    // Creates a PosixNetworkInterface for the interface whose IP addres=
s is
> >    // intfAddr and whose name is intfName and registers it with mDNS co=
re.
> >    mDNSlocal int SetupOneInterface(mDNS *const m, struct sockaddr *intf=
Addr, struct sockaddr *intfMask,
> > @@ -27,7 +27,7 @@ index 9a5b4d7ea4cb..02a19b438e03 100644
> >    {
> >        int err =3D 0;
> >        PosixNetworkInterface *intf;
> > -@@ -1411,6 +1411,7 @@ mDNSlocal int SetupOneInterface(mDNS *const m, s=
truct sockaddr *intfAddr, struct
> > +@@ -1411,6 +1411,7 @@ mDNSlocal int SetupOneInterface(mDNS *co
> >
> >            intf->coreIntf.Advertise =3D m->AdvertiseLocalAddresses;
> >            intf->coreIntf.McastTxRx =3D mDNStrue;
> > @@ -35,7 +35,7 @@ index 9a5b4d7ea4cb..02a19b438e03 100644
> >
> >            // Set up the extra fields in PosixNetworkInterface.
> >            assert(intf->intfName !=3D NULL);         // intf->intfName =
already set up above
> > -@@ -1561,7 +1562,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
> > +@@ -1561,7 +1562,7 @@ mDNSlocal int SetupInterfaceList(mDNS *c
> >                        }
> >    #endif
> >                        if (SetupOneInterface(m, i->ifa_addr, i->ifa_net=
mask,
> > @@ -44,7 +44,7 @@ index 9a5b4d7ea4cb..02a19b438e03 100644
> >                        {
> >                            if (i->ifa_addr->sa_family =3D=3D AF_INET)
> >                                foundav4 =3D mDNStrue;
> > -@@ -1578,7 +1579,7 @@ mDNSlocal int SetupInterfaceList(mDNS *const m)
> > +@@ -1578,7 +1579,7 @@ mDNSlocal int SetupInterfaceList(mDNS *c
> >            // if ((m->HostInterfaces =3D=3D NULL) && (firstLoopback !=
=3D NULL))
> >            if (!foundav4 && firstLoopback)
> >                (void) SetupOneInterface(m, firstLoopback->ifa_addr, fir=
stLoopback->ifa_netmask,
> > @@ -53,6 +53,3 @@ index 9a5b4d7ea4cb..02a19b438e03 100644
> >        }
> >
> >        // Clean up.
> > ---
> > -2.35.1
> > -
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Sepa=
rate-TLS-targets-from-libraries.patch b/meta-networking/recipes-protocols/m=
dns/mdns/0004-make-Separate-TLS-targets-from-libraries.patch
> > index a8e8dae60a20..837580ac368a 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TL=
S-targets-from-libraries.patch
> > +++ b/meta-networking/recipes-protocols/mdns/mdns/0004-make-Separate-TL=
S-targets-from-libraries.patch
> > @@ -12,10 +12,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com=
>
> >    mDNSPosix/Makefile | 14 ++++++++------
> >    1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > -diff --git a/mDNSPosix/Makefile b/mDNSPosix/Makefile
> > -index 5e74193c0e89..b4313c36b035 100755
> > ---- a/mDNSPosix/Makefile
> > -+++ b/mDNSPosix/Makefile
> > +Index: mDNSResponder/mDNSPosix/Makefile
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- mDNSResponder.orig/mDNSPosix/Makefile
> > ++++ mDNSResponder/mDNSPosix/Makefile
> >   @@ -112,9 +112,11 @@ ifeq ($(findstring linux,$(os)),linux)
> >    ifeq ($(tls), no)
> >    CFLAGS_OS =3D -D_GNU_SOURCE -DHAVE_IPV6 -DNOT_HAVE_SA_LEN -DUSES_NET=
LINK -DHAVE_LINUX -DTARGET_OS_LINUX -ftabstop=3D4 -Wno-expansion-to-defined
> > @@ -59,6 +59,3 @@ index 5e74193c0e89..b4313c36b035 100755
> >
> >    $(OBJDIR)/NetMonitor.c.o:            $(COREDIR)/mDNS.c # Note: NetMo=
nitor.c textually imports mDNS.c
> >
> > ---
> > -2.35.1
> > -
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-=
for-changed-interfaces.patch b/meta-networking/recipes-protocols/mdns/mdns/=
0005-Use-list-for-changed-interfaces.patch
> > index 1aec34f24300..f00116c61741 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-cha=
nged-interfaces.patch
> > +++ b/meta-networking/recipes-protocols/mdns/mdns/0005-Use-list-for-cha=
nged-interfaces.patch
> > @@ -15,10 +15,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com=
>
> >    mDNSPosix/mDNSPosix.c | 58 ++++++++++++++++++++++++++++++++---------=
--
> >    1 file changed, 43 insertions(+), 15 deletions(-)
> >
> > -diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
> > -index 02a19b438e03..e20adda92229 100644
> > ---- a/mDNSPosix/mDNSPosix.c
> > -+++ b/mDNSPosix/mDNSPosix.c
> > +Index: mDNSResponder/mDNSPosix/mDNSPosix.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
> > ++++ mDNSResponder/mDNSPosix/mDNSPosix.c
> >   @@ -74,6 +74,14 @@ struct IfChangeRec
> >    };
> >    typedef struct IfChangeRec IfChangeRec;
> > @@ -34,7 +34,7 @@ index 02a19b438e03..e20adda92229 100644
> >    // Note that static data is initialized to zero in (modern) C.
> >    static PosixEventSource *gEventSources;             // linked list o=
f PosixEventSource's
> >    static sigset_t gEventSignalSet;                // Signals which eve=
nt loop listens for
> > -@@ -1621,6 +1629,23 @@ mDNSlocal mStatus OpenIfNotifySocket(int *pFD)
> > +@@ -1621,6 +1629,23 @@ mDNSlocal mStatus OpenIfNotifySocket(int
> >        return err;
> >    }
> >
> > @@ -58,7 +58,7 @@ index 02a19b438e03..e20adda92229 100644
> >    #if MDNS_DEBUGMSGS
> >    mDNSlocal void      PrintNetLinkMsg(const struct nlmsghdr *pNLMsg)
> >    {
> > -@@ -1648,14 +1673,13 @@ mDNSlocal void      PrintNetLinkMsg(const stru=
ct nlmsghdr *pNLMsg)
> > +@@ -1648,14 +1673,13 @@ mDNSlocal void      PrintNetLinkMsg(cons
> >    }
> >    #endif
> >
> > @@ -74,7 +74,7 @@ index 02a19b438e03..e20adda92229 100644
> >
> >        // The structure here is more complex than it really ought to be=
 because,
> >        // unfortunately, there's no good way to size a buffer in advanc=
e large
> > -@@ -1691,9 +1715,9 @@ mDNSlocal mDNSu32       ProcessRoutingNotificati=
on(int sd)
> > +@@ -1691,9 +1715,9 @@ mDNSlocal mDNSu32       ProcessRoutingNo
> >
> >            // Process the NetLink message
> >            if (pNLMsg->nlmsg_type =3D=3D RTM_GETLINK || pNLMsg->nlmsg_t=
ype =3D=3D RTM_NEWLINK)
> > @@ -86,7 +86,7 @@ index 02a19b438e03..e20adda92229 100644
> >
> >            // Advance pNLMsg to the next message in the buffer
> >            if ((pNLMsg->nlmsg_flags & NLM_F_MULTI) !=3D 0 && pNLMsg->nl=
msg_type !=3D NLMSG_DONE)
> > -@@ -1704,8 +1728,6 @@ mDNSlocal mDNSu32       ProcessRoutingNotificati=
on(int sd)
> > +@@ -1704,8 +1728,6 @@ mDNSlocal mDNSu32       ProcessRoutingNo
> >            else
> >                break;  // all done!
> >        }
> > @@ -95,7 +95,7 @@ index 02a19b438e03..e20adda92229 100644
> >    }
> >
> >    #else // USES_NETLINK
> > -@@ -1737,14 +1759,13 @@ mDNSlocal void      PrintRoutingSocketMsg(cons=
t struct ifa_msghdr *pRSMsg)
> > +@@ -1737,14 +1759,13 @@ mDNSlocal void      PrintRoutingSocketMs
> >    }
> >    #endif
> >
> > @@ -111,7 +111,7 @@ index 02a19b438e03..e20adda92229 100644
> >
> >        readCount =3D read(sd, buff, sizeof buff);
> >        if (readCount < (ssize_t) sizeof(struct ifa_msghdr))
> > -@@ -1759,12 +1780,10 @@ mDNSlocal mDNSu32       ProcessRoutingNotifica=
tion(int sd)
> > +@@ -1759,12 +1780,10 @@ mDNSlocal mDNSu32       ProcessRoutingNo
> >            pRSMsg->ifam_type =3D=3D RTM_IFINFO)
> >        {
> >            if (pRSMsg->ifam_type =3D=3D RTM_IFINFO)
> > @@ -126,7 +126,7 @@ index 02a19b438e03..e20adda92229 100644
> >    }
> >
> >    #endif // USES_NETLINK
> > -@@ -1774,7 +1793,8 @@ mDNSlocal void InterfaceChangeCallback(int fd, v=
oid *context)
> > +@@ -1774,7 +1793,8 @@ mDNSlocal void InterfaceChangeCallback(i
> >    {
> >        IfChangeRec     *pChgRec =3D (IfChangeRec*) context;
> >        fd_set readFDs;
> > @@ -136,7 +136,7 @@ index 02a19b438e03..e20adda92229 100644
> >        struct timeval zeroTimeout =3D { 0, 0 };
> >
> >        (void)fd; // Unused
> > -@@ -1782,17 +1802,25 @@ mDNSlocal void InterfaceChangeCallback(int fd,=
 void *context)
> > +@@ -1782,17 +1802,25 @@ mDNSlocal void InterfaceChangeCallback(i
> >        FD_ZERO(&readFDs);
> >        FD_SET(pChgRec->NotifySD, &readFDs);
> >
> > @@ -164,6 +164,3 @@ index 02a19b438e03..e20adda92229 100644
> >    }
> >
> >    // Register with either a Routing Socket or RtNetLink to listen for =
interface changes.
> > ---
> > -2.35.1
> > -
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-=
Fix-broken-debug-parameter.patch b/meta-networking/recipes-protocols/mdns/m=
dns/0005-mDNSCore-Fix-broken-debug-parameter.patch
> > index 4cda71bdb1bc..fd2f2f117887 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-bro=
ken-debug-parameter.patch
> > +++ b/meta-networking/recipes-protocols/mdns/mdns/0005-mDNSCore-Fix-bro=
ken-debug-parameter.patch
> > @@ -10,11 +10,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com=
>
> >    mDNSCore/mDNS.c | 2 +-
> >    1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > -diff --git a/mDNSCore/mDNS.c b/mDNSCore/mDNS.c
> > -index eecd7daa724e..1e843c081938 100644
> > ---- a/mDNSCore/mDNS.c
> > -+++ b/mDNSCore/mDNS.c
> > -@@ -10210,7 +10210,7 @@ mDNSlocal void mDNSCoreReceiveNoUnicastAnswers=
(mDNS *const m, const DNSMessage *
> > +Index: mDNSResponder/mDNSCore/mDNS.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- mDNSResponder.orig/mDNSCore/mDNS.c
> > ++++ mDNSResponder/mDNSCore/mDNS.c
> > +@@ -10231,7 +10231,7 @@ mDNSlocal void mDNSCoreReceiveNoUnicastA
> >    #else
> >                                const DNSServRef dnsserv =3D qptr->qDNSS=
erver;
> >    #endif
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-no=
isy-netlink-sockets.patch b/meta-networking/recipes-protocols/mdns/mdns/000=
6-Handle-noisy-netlink-sockets.patch
> > index 882d08e6c63d..80cdbca50013 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-net=
link-sockets.patch
> > +++ b/meta-networking/recipes-protocols/mdns/mdns/0006-Handle-noisy-net=
link-sockets.patch
> > @@ -27,11 +27,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com=
>
> >    mDNSPosix/mDNSPosix.c | 182 +++++++++++++++++++++++++++++++++++++++-=
--
> >    1 file changed, 172 insertions(+), 10 deletions(-)
> >
> > -diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
> > -index e20adda92229..5d52de31f79b 100644
> > ---- a/mDNSPosix/mDNSPosix.c
> > -+++ b/mDNSPosix/mDNSPosix.c
> > -@@ -1788,14 +1788,43 @@ mDNSlocal void          ProcessRoutingNotifica=
tion(int sd, GenLinkedList *change
> > +Index: mDNSResponder/mDNSPosix/mDNSPosix.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
> > ++++ mDNSResponder/mDNSPosix/mDNSPosix.c
> > +@@ -1788,14 +1788,43 @@ mDNSlocal void          ProcessRoutingNo
> >
> >    #endif // USES_NETLINK
> >
> > @@ -75,7 +75,7 @@ index e20adda92229..5d52de31f79b 100644
> >
> >        (void)fd; // Unused
> >
> > -@@ -1810,12 +1839,149 @@ mDNSlocal void InterfaceChangeCallback(int fd=
, void *context)
> > +@@ -1810,12 +1839,149 @@ mDNSlocal void InterfaceChangeCallback(i
> >        }
> >        while (0 < select(pChgRec->NotifySD + 1, &readFDs, (fd_set*) NUL=
L, (fd_set*) NULL, &zeroTimeout));
> >
> > @@ -230,7 +230,7 @@ index e20adda92229..5d52de31f79b 100644
> >        while ((changedInterface =3D (NetworkInterfaceIndex*)changedInte=
rfaces.Head) !=3D NULL)
> >        {
> >            RemoveFromList(&changedInterfaces, changedInterface);
> > -@@ -1947,15 +2113,11 @@ mDNSexport void mDNSPlatformClose(mDNS *const =
m)
> > +@@ -1947,15 +2113,11 @@ mDNSexport void mDNSPlatformClose(mDNS *
> >    #endif
> >    }
> >
> > @@ -247,6 +247,3 @@ index e20adda92229..5d52de31f79b 100644
> >        ClearInterfaceList(m);
> >        err =3D SetupInterfaceList(m);
> >        return PosixErrorToStatus(err);
> > ---
> > -2.35.1
> > -
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-=
top-level-Makefile.patch b/meta-networking/recipes-protocols/mdns/mdns/0006=
-make-Add-top-level-Makefile.patch
> > index 268e574c5090..c12a02fcdd8c 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-lev=
el-Makefile.patch
> > +++ b/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-lev=
el-Makefile.patch
> > @@ -12,14 +12,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com=
>
> >    1 file changed, 2 insertions(+)
> >    create mode 100644 Makefile
> >
> > -diff --git a/Makefile b/Makefile
> > -new file mode 100644
> > -index 000000000000..feb6ac67ef47
> > +Index: mDNSResponder/Makefile
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >   --- /dev/null
> > -+++ b/Makefile
> > ++++ mDNSResponder/Makefile
> >   @@ -0,0 +1,2 @@
> >   +all clean:
> >   +   cd mDNSPosix && $(MAKE) $@
> > ---
> > -2.35.1
> > -
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-dele=
ted-interfaces-as-being-changed.patch b/meta-networking/recipes-protocols/m=
dns/mdns/0007-Mark-deleted-interfaces-as-being-changed.patch
> > index e53b0fd3ae7a..dae1ac7ea01f 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-int=
erfaces-as-being-changed.patch
> > +++ b/meta-networking/recipes-protocols/mdns/mdns/0007-Mark-deleted-int=
erfaces-as-being-changed.patch
> > @@ -22,11 +22,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com=
>
> >    mDNSPosix/mDNSPosix.c | 2 +-
> >    1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > -diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
> > -index 5d52de31f79b..77d982f4c50b 100644
> > ---- a/mDNSPosix/mDNSPosix.c
> > -+++ b/mDNSPosix/mDNSPosix.c
> > -@@ -1714,7 +1714,7 @@ mDNSlocal void          ProcessRoutingNotificati=
on(int sd, GenLinkedList *change
> > +Index: mDNSResponder/mDNSPosix/mDNSPosix.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
> > ++++ mDNSResponder/mDNSPosix/mDNSPosix.c
> > +@@ -1714,7 +1714,7 @@ mDNSlocal void          ProcessRoutingNo
> >    #endif
> >
> >            // Process the NetLink message
> > @@ -35,6 +35,3 @@ index 5d52de31f79b..77d982f4c50b 100644
> >                AddInterfaceIndexToList(changedInterfaces, ((struct ifin=
fomsg*) NLMSG_DATA(pNLMsg))->ifi_index);
> >            else if (pNLMsg->nlmsg_type =3D=3D RTM_DELADDR || pNLMsg->nl=
msg_type =3D=3D RTM_NEWADDR)
> >                AddInterfaceIndexToList(changedInterfaces, ((struct ifad=
drmsg*) NLMSG_DATA(pNLMsg))->ifa_index);
> > ---
> > -2.35.1
> > -
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-er=
rors-from-socket-calls.patch b/meta-networking/recipes-protocols/mdns/mdns/=
0008-Handle-errors-from-socket-calls.patch
> > index e689f8c2675c..1789001e14e2 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-fr=
om-socket-calls.patch
> > +++ b/meta-networking/recipes-protocols/mdns/mdns/0008-Handle-errors-fr=
om-socket-calls.patch
> > @@ -14,11 +14,11 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com=
>
> >    mDNSPosix/mDNSPosix.c | 12 +++++++++---
> >    1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > -diff --git a/mDNSPosix/mDNSPosix.c b/mDNSPosix/mDNSPosix.c
> > -index 77d982f4c50b..cab512160afb 100644
> > ---- a/mDNSPosix/mDNSPosix.c
> > -+++ b/mDNSPosix/mDNSPosix.c
> > -@@ -1677,7 +1677,7 @@ mDNSlocal void          ProcessRoutingNotificati=
on(int sd, GenLinkedList *change
> > +Index: mDNSResponder/mDNSPosix/mDNSPosix.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- mDNSResponder.orig/mDNSPosix/mDNSPosix.c
> > ++++ mDNSResponder/mDNSPosix/mDNSPosix.c
> > +@@ -1677,7 +1677,7 @@ mDNSlocal void          ProcessRoutingNo
> >    // Read through the messages on sd and if any indicate that any inte=
rface records should
> >    // be torn down and rebuilt, return affected indices as a bitmask. O=
therwise return 0.
> >    {
> > @@ -27,7 +27,7 @@ index 77d982f4c50b..cab512160afb 100644
> >        char buff[4096];
> >        struct nlmsghdr         *pNLMsg =3D (struct nlmsghdr*) buff;
> >
> > -@@ -1686,7 +1686,10 @@ mDNSlocal void          ProcessRoutingNotificat=
ion(int sd, GenLinkedList *change
> > +@@ -1686,7 +1686,10 @@ mDNSlocal void          ProcessRoutingNo
> >        // enough to hold all pending data and so avoid message fragment=
ation.
> >        // (Note that FIONREAD is not supported on AF_NETLINK.)
> >
> > @@ -39,7 +39,7 @@ index 77d982f4c50b..cab512160afb 100644
> >        while (1)
> >        {
> >            // Make sure we've got an entire nlmsghdr in the buffer, and=
 payload, too.
> > -@@ -1702,7 +1705,9 @@ mDNSlocal void          ProcessRoutingNotificati=
on(int sd, GenLinkedList *change
> > +@@ -1702,7 +1705,9 @@ mDNSlocal void          ProcessRoutingNo
> >                    pNLMsg =3D (struct nlmsghdr*) buff;
> >
> >                    // read more data
> > @@ -50,7 +50,7 @@ index 77d982f4c50b..cab512160afb 100644
> >                    continue;                   // spin around and reval=
idate with new readCount
> >                }
> >                else
> > -@@ -2017,6 +2022,7 @@ mDNSlocal mDNSBool mDNSPlatformInit_CanReceiveUn=
icast(void)
> > +@@ -2017,6 +2022,7 @@ mDNSlocal mDNSBool mDNSPlatformInit_CanR
> >        int err;
> >        int s =3D socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
> >        struct sockaddr_in s5353;
> > @@ -58,6 +58,3 @@ index 77d982f4c50b..cab512160afb 100644
> >        s5353.sin_family      =3D AF_INET;
> >        s5353.sin_port        =3D MulticastDNSPort.NotAnInteger;
> >        s5353.sin_addr.s_addr =3D 0;
> > ---
> > -2.35.1
> > -
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-un=
needed-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0009-rem=
ove-unneeded-headers.patch
> > index 74d387368c43..d443bc97b2a8 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-=
headers.patch
> > +++ b/meta-networking/recipes-protocols/mdns/mdns/0009-remove-unneeded-=
headers.patch
> > @@ -14,20 +14,18 @@ Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.=
com>
> >    mDNSPosix/mbedtls.c | 2 --
> >    1 file changed, 2 deletions(-)
> >
> > -diff --git a/mDNSPosix/mbedtls.c b/mDNSPosix/mbedtls.c
> > -index a73681b..ab8f8c7 100644
> > ---- a/mDNSPosix/mbedtls.c
> > -+++ b/mDNSPosix/mbedtls.c
> > +Index: mDNSResponder/mDNSPosix/mbedtls.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- mDNSResponder.orig/mDNSPosix/mbedtls.c
> > ++++ mDNSResponder/mDNSPosix/mbedtls.c
> >   @@ -38,10 +38,8 @@
> >    #include <mbedtls/sha256.h>
> >    #include <mbedtls/base64.h>
> > -
> > +
> >   -#include <mbedtls/certs.h>
> >    #include <mbedtls/x509.h>
> >    #include <mbedtls/ssl.h>
> >   -#include <mbedtls/config.h>
> > -
> > +
> >    // Posix TLS server context
> >    struct TLSContext_struct {
> > ---
> > -2.34.1
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns/0015-Add-missi=
ng-limits.h.patch b/meta-networking/recipes-protocols/mdns/mdns/0015-Add-mi=
ssing-limits.h.patch
> > index 9fe721ff0759..511a6fdc1873 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns/0015-Add-missing-limi=
ts.h.patch
> > +++ b/meta-networking/recipes-protocols/mdns/mdns/0015-Add-missing-limi=
ts.h.patch
> > @@ -9,10 +9,10 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> >    mDNSShared/PlatformCommon.c | 1 +
> >    1 file changed, 1 insertion(+)
> >
> > -diff --git a/mDNSShared/PlatformCommon.c b/mDNSShared/PlatformCommon.c
> > -index 9ce15468e217..c308af3e8b0e 100644
> > ---- a/mDNSShared/PlatformCommon.c
> > -+++ b/mDNSShared/PlatformCommon.c
> > +Index: mDNSResponder/mDNSShared/PlatformCommon.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- mDNSResponder.orig/mDNSShared/PlatformCommon.c
> > ++++ mDNSResponder/mDNSShared/PlatformCommon.c
> >   @@ -32,6 +32,7 @@
> >    #include <time.h>
> >    #include <sys/time.h>           // Needed for #include <sys/time.h>(=
).
> > diff --git a/meta-networking/recipes-protocols/mdns/mdns_2200.0.8.bb b/=
meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb
> > similarity index 98%
> > rename from meta-networking/recipes-protocols/mdns/mdns_2200.0.8.bb
> > rename to meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb
> > index 8370ed50c08c..af2b337172a1 100644
> > --- a/meta-networking/recipes-protocols/mdns/mdns_2200.0.8.bb
> > +++ b/meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D31c50371921e=
0fb731003bbc665f29bf"
> >
> >   DEPENDS:append:libc-musl =3D " musl-nscd"
> >
> > -SRC_URI =3D "git://github.com/apple-oss-distributions/mDNSResponder;pr=
otocol=3Dhttps;branch=3Dmain \
> > +SRC_URI =3D "git://github.com/apple-oss-distributions/mDNSResponder;pr=
otocol=3Dhttps;branch=3Drel/mDNSResponder-2200 \
> >              file://0001-dns-sd-Include-missing-headers.patch \
> >              file://0002-make-Set-libdns_sd.so-soname-correctly.patch \
> >              file://0004-make-Separate-TLS-targets-from-libraries.patch=
 \
> > @@ -25,7 +25,7 @@ SRC_URI =3D "git://github.com/apple-oss-distributions=
/mDNSResponder;protocol=3Dhttps
> >              file://0015-Add-missing-limits.h.patch \
> >              file://0001-Handle-interface-without-ifa_addr.patch \
> >              "
> > -SRCREV =3D "d5029b5dff8aa59d1fc07ed796e994106ef58dee"
> > +SRCREV =3D "a9f4049ab772ca57b5afc9804ae5004beb711d6e"
> >
> >   # We install a stub Makefile in the top directory so that the various=
 checks
> >   # in base.bbclass pass their tests for a Makefile, this ensures (that=
 amongst
> >
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106876): https://lists.openembedded.org/g/openembedde=
d-devel/message/106876
> Mute This Topic: https://lists.openembedded.org/mt/102654260/3618097
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
lex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

