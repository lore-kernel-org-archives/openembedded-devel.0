Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6D2C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 14:44:30 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web10.24362.1743000261132421641
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Mar 2025 07:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BoSgOj2A;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3fe83c8cbdbso1916035b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 07:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743000260; x=1743605060; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DjgS5QuKa38NM7lXhLd0fYYV6qt6jVQWjlmZcIIdiE=;
        b=BoSgOj2ANmi0jCOjXxt2J31XQOQM2ZL8k/fB2mRO0Xfze3tMujyPyNw8lr37yV/anE
         xv8f1tYKPoj4Fjh00EEYcu6eXoz9vnWsrrex8Xt9Eo071g+5Z7A2gYXRpDFY1YC3jvTo
         HgOJLOc3OV34Q0CJhcXG3G7xEGljUct43BoO28EFTHSI6z75XMa52a2XV+vxJaeVTYGe
         gw15rr5wIBIhCaTNWTZQjXk1+LdS0O6pEfCRMxt1IUhC5TcnqCdMyHEyOsHlKF4HvSs9
         jn+lGpVxoBcMfpWySjzcnhAjRDB92OfEnSN8TpBkfhusE8v77YNol9zIUyJxQGPg9R/L
         szGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743000260; x=1743605060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DjgS5QuKa38NM7lXhLd0fYYV6qt6jVQWjlmZcIIdiE=;
        b=Yf9v5LxT5O7sCkDI3BN2CXtJIdkbSfzYUcWieW1eRjaEGquwnX83cl1vtFdZ35iSKV
         f/jpt5U4NPtNtotJWmhQwOiMb956ewFQ02Qrvs/9mCbUzkSrL5AeOqgy0jMPLPv37pDP
         axRpY2oRVl3PCSMPVDpghmdEfcIO49aqWEH18+5yXbGWBSOlwwaBXtBIvRWqf4tjxfWQ
         D70odsUzkSx/j4kKnWP9P8lNDSVL7qS4Muu+n2ODLyJLKM4PWsRC5yf1fm3e36fzKQkY
         5hiX2CB/J+dbJaKmbFqva/Jhs/KueZ2V69e+qDYeYN8lGbQ0oZdqBra+QorNClg6nuN3
         QEgw==
X-Gm-Message-State: AOJu0Yx+sn8DHV5aXAgaYxuq74FE0XDqTaBKzVpXAUYuNXDiuma9qLGw
	TcPbqc64HhKjdgO2Hy31HRis6mMhDqFvnPDlspApysXWd1Egtj3gmLdSjP8E1oIq2KzMVVOKNa6
	maGirbKE7dBORscuyu5gDP9QcnVQGfd64
X-Gm-Gg: ASbGncvnNj1A2szYTCd68IdLE4m46z12odMYergdyOlHrMWCmTvs9I6srItALKHd3sX
	crKYeyIz3FjgVUDLFgNJiccaVha3ulys30M8L/b5OOFjmmAtVwpIl18Zmf4beUr4nvscUbgnbA/
	Y5P7h9MX8iKXNLgQ+JPSJnxAG3
X-Google-Smtp-Source: AGHT+IEdSuJDRlZm9iyIHiyLQwNKWs9SYZKob3fVZsadiz9Tq99hzP/ok0MxGN2CNSRuU3UyIcZJWAUKyVR2mypGV/g=
X-Received: by 2002:a05:6808:1408:b0:3f6:7cd2:8187 with SMTP id
 5614622812f47-3febf72c855mr13681282b6e.20.1743000259996; Wed, 26 Mar 2025
 07:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250326080348.3794227-1-mark.yang@lge.com>
In-Reply-To: <20250326080348.3794227-1-mark.yang@lge.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Mar 2025 07:43:53 -0700
X-Gm-Features: AQ5f1Jr41OtRRcj4lWl1Vy9mfsTyWKqX1QxrJVb7Hk6101oLGkpcCaZ2_ZtsUH0
Message-ID: <CAMKF1soAmVzXo8bRSpTsgJSEfe0tQk+UObrMCgSRgrKse2ehbA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] dnsmasq: fix build with gcc-15
To: mark.yang@lge.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 14:44:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116297

we have 2.91 upgrade staged in master-next. If we need this patch
still then please rebase it on 2.91 upgrade and resend

On Wed, Mar 26, 2025 at 1:03=E2=80=AFAM mark.yang via lists.openembedded.or=
g
<mark.yang=3Dlge.com@lists.openembedded.org> wrote:
>
> From: "mark.yang" <mark.yang@lge.com>
>
> * to fix: following errors occurred in gcc-15.0.1 environment.
> dhcp.c:320:49: error: passing argument 3 of 'iface_enumerate' from incomp=
atible pointer type [-Wincompatible-pointer-types]
>   320 |               !iface_enumerate(AF_INET, &match, check_listen_addr=
s) ||
>       |                                                 ^~~~~~~~~~~~~~~~~=
~
>       |                                                 |
>       |                                                 int (*)(struct in=
_addr,  int,  char *, struct in_addr,  struct in_addr,  void *)
> dnsmasq.h:1662:50: note: expected 'int (*)(void)' but argument is of type=
 'int (*)(struct in_addr,  int,  char *, struct in_addr,  struct in_addr,  =
void *)'
>  1662 | int iface_enumerate(int family, void *parm, int (callback)());
>       |                                             ~~~~~^~~~~~~~~~~
> dhcp.c:33:12: note: 'check_listen_addrs' declared here
>    33 | static int check_listen_addrs(struct in_addr local, int if_index,=
 char *label,
>       |            ^~~~~~~~~~~~~~~~~~
> dhcp.c:333:44: error: passing argument 3 of 'iface_enumerate' from incomp=
atible pointer type [-Wincompatible-pointer-types]
>   333 |       if (!iface_enumerate(AF_INET, &parm, complete_context))
>       |                                            ^~~~~~~~~~~~~~~~
>       |                                            |
>       |                                            int (*)(struct in_addr=
,  int,  char *, struct in_addr,  struct in_addr,  void *)
> dnsmasq.h:1662:50: note: expected 'int (*)(void)' but argument is of type=
 'int (*)(struct in_addr,  int,  char *, struct in_addr,  struct in_addr,  =
void *)'
>  1662 | int iface_enumerate(int family, void *parm, int (callback)());
>       |                                             ~~~~~^~~~~~~~~~~
> dhcp.c:31:12: note: 'complete_context' declared here
>    31 | static int complete_context(struct in_addr local, int if_index, c=
har *label,
>       |            ^~~~~~~~~~~~~~~~
>
> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---
>  .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |   1 +
>  ...ompatibility-and-Wincompatible-point.patch | 375 ++++++++++++++++++
>  2 files changed, 376 insertions(+)
>  create mode 100644 meta-networking/recipes-support/dnsmasq/files/0001-Fi=
x-GCC-15-C23-compatibility-and-Wincompatible-point.patch
>
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb b/me=
ta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
> index ba783d03ff..5cdb24f36a 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.90.bb
> @@ -15,6 +15,7 @@ SRC_URI =3D "http://www.thekelleys.org.uk/dnsmasq/${@['=
archive/', ''][float(d.getV
>             file://dnsmasq-resolvconf.service \
>             file://dnsmasq-noresolvconf.service \
>             file://dnsmasq-resolved.conf \
> +           file://0001-Fix-GCC-15-C23-compatibility-and-Wincompatible-po=
int.patch \
>  "
>  SRC_URI[sha256sum] =3D "8f6666b542403b5ee7ccce66ea73a4a51cf19dd49392aacc=
d37231a2c51b303b"
>
> diff --git a/meta-networking/recipes-support/dnsmasq/files/0001-Fix-GCC-1=
5-C23-compatibility-and-Wincompatible-point.patch b/meta-networking/recipes=
-support/dnsmasq/files/0001-Fix-GCC-15-C23-compatibility-and-Wincompatible-=
point.patch
> new file mode 100644
> index 0000000000..9b69b8c55b
> --- /dev/null
> +++ b/meta-networking/recipes-support/dnsmasq/files/0001-Fix-GCC-15-C23-c=
ompatibility-and-Wincompatible-point.patch
> @@ -0,0 +1,375 @@
> +From da2cc84854a01dd08a8bb4161428be20b83a5ec7 Mon Sep 17 00:00:00 2001
> +From: gen2dev <gen2dev@qsr.us>
> +Date: Sun, 1 Dec 2024 22:53:16 +0000
> +Subject: [PATCH] Fix GCC-15, C23 compatibility and
> + -Wincompatible-pointer-types errors
> +
> +A bug in gentoo linux https://bugs.gentoo.org/945183 reported that dnsma=
sq 2.90 fails to compile with GCC 15.
> +
> +The issue is that while previous versions of GCC defaulted to the C17 st=
andard and C23 could be selected with
> +"-std=3Dc23" or "-std=3Dgnu23", GCC 15 defaults to C23. In C23 incompati=
ble pointer types are an error instead of
> +a warning, so the "int (*callback)()" incomplete prototypes cause errors=
.
> +
> +For example, compiling dnsmasq 2.90 with gcc 14.2.1 and "-std=3Dgnu23" f=
ails with errors such as:
> +    lease.c: In function `lease_find_interfaces':
> +    lease.c:467:34: warning: passing argument 3 of `iface_enumerate' fro=
m incompatible pointer type [-Wincompatible-pointer-types[https://gcc.gnu.o=
rg/onlinedocs/gcc/Warning-Options.html#index-Wincompatible-pointer-types]]
> +      467 |   iface_enumerate(AF_INET, &now, find_interface_v4);
> +          |                                  ^~~~~~~~~~~~~~~~~
> +          |                                  |
> +          |                                  int (*)(struct in_addr,  in=
t,  char *, struct in_addr,  struct in_addr,  void *)
> +    In file included from lease.c:17:
> +    dnsmasq.h:1662:50: note: expected `int (*)(void)' but argument is of=
 type `int (*)(struct in_addr,  int,  char *, struct in_addr,  struct in_ad=
dr,  void *)'
> +     1662 | int iface_enumerate(int family, void *parm, int (callback)()=
);
> +          |                                             ~~~~~^~~~~~~~~~~
> +
> +This patch uses a typedef'ed union of pointer types to get type checking=
 of the pointers. If that's too complicated,
> +another way might be to use (void *) casts to disable type checking.
> +
> +Also, some of the IPv6 callbacks had "int preferred, int valid" and some=
 had
> +"unsigned int preferred, unsigned int valid". This patch changes them al=
l to "unsigned int"
> +so they're the same and to avoid casting "u32" to "int", eg:
> +    u32 preferred =3D 0xffffffff;
> +    callback(..., (int)preferred, ...)
> +Even if those cast values aren't used in the callback, casting u32 to "i=
nt" feels bad, especially if "int" is 32 bits.
> +
> +Signed-off-by: mark.yang <mark.yang@lge.com>
> +
> +Upstream-Status: Backport [da2cc84 Fix GCC-15, C23 compatibility and -Wi=
ncompatible-pointer-types errors]
> +---
> + src/arp.c     |  2 +-
> + src/bpf.c     | 14 +++++++-------
> + src/dhcp.c    |  4 ++--
> + src/dhcp6.c   |  8 ++++----
> + src/dnsmasq.h |  8 +++++++-
> + src/lease.c   |  6 +++---
> + src/netlink.c | 12 ++++++------
> + src/network.c |  6 +++---
> + src/radv.c    | 14 +++++++-------
> + 9 files changed, 40 insertions(+), 34 deletions(-)
> +
> +diff --git a/src/arp.c b/src/arp.c
> +index 0a5a9bf..6ff1f01 100644
> +--- a/src/arp.c
> ++++ b/src/arp.c
> +@@ -152,7 +152,7 @@ int find_mac(union mysockaddr *addr, unsigned char *=
mac, int lazy, time_t now)
> +        if (arp->status !=3D ARP_EMPTY)
> +          arp->status =3D ARP_MARK;
> +
> +-       iface_enumerate(AF_UNSPEC, NULL, filter_mac);
> ++       iface_enumerate(AF_UNSPEC, NULL, (callback_t){.af_unspec=3Dfilte=
r_mac});
> +
> +        /* Remove all unconfirmed entries to old list. */
> +        for (arp =3D arps, up =3D &arps; arp; arp =3D tmp)
> +diff --git a/src/bpf.c b/src/bpf.c
> +index 62b589c..82d0125 100644
> +--- a/src/bpf.c
> ++++ b/src/bpf.c
> +@@ -47,7 +47,7 @@ static union all_addr del_addr;
> +
> + #if defined(HAVE_BSD_NETWORK) && !defined(__APPLE__)
> +
> +-int arp_enumerate(void *parm, int (*callback)())
> ++int arp_enumerate(void *parm, callback_t callback)
> + {
> +   int mib[6];
> +   size_t needed;
> +@@ -91,7 +91,7 @@ int arp_enumerate(void *parm, int (*callback)())
> +       rtm =3D (struct rt_msghdr *)next;
> +       sin2 =3D (struct sockaddr_inarp *)(rtm + 1);
> +       sdl =3D (struct sockaddr_dl *)((char *)sin2 + SA_SIZE(sin2));
> +-      if (!(*callback)(AF_INET, &sin2->sin_addr, LLADDR(sdl), sdl->sdl_=
alen, parm))
> ++      if (!callback.af_unspec(AF_INET, &sin2->sin_addr, LLADDR(sdl), sd=
l->sdl_alen, parm))
> +       return 0;
> +     }
> +
> +@@ -107,7 +107,7 @@ int iface_enumerate(int family, void *parm, int (*ca=
llback)())
> +
> +   if (family =3D=3D AF_UNSPEC)
> + #if defined(HAVE_BSD_NETWORK) && !defined(__APPLE__)
> +-    return  arp_enumerate(parm, callback);
> ++    return  arp_enumerate(parm, callback.af_unspec);
> + #else
> +   return 0; /* need code for Solaris and MacOS*/
> + #endif
> +@@ -147,7 +147,7 @@ int iface_enumerate(int family, void *parm, int (*ca=
llback)())
> +               broadcast =3D ((struct sockaddr_in *) addrs->ifa_broadadd=
r)->sin_addr;
> +             else
> +               broadcast.s_addr =3D 0;
> +-            if (!((*callback)(addr, iface_index, NULL, netmask, broadca=
st, parm)))
> ++            if (!callback.af_inet(addr, iface_index, NULL, netmask, bro=
adcast, parm))
> +               goto err;
> +           }
> +         else if (family =3D=3D AF_INET6)
> +@@ -212,8 +212,8 @@ int iface_enumerate(int family, void *parm, int (*ca=
llback)())
> +                 addr->s6_addr[3] =3D 0;
> +               }
> +
> +-            if (!((*callback)(addr, prefix, scope_id, iface_index, flag=
s,
> +-                              (int) preferred, (int)valid, parm)))
> ++            if (!callback.af_inet6(addr, prefix, scope_id, iface_index,=
 flags,
> ++                              (unsigned int) preferred, (unsigned int)v=
alid, parm))
> +               goto err;
> +           }
> +
> +@@ -223,7 +223,7 @@ int iface_enumerate(int family, void *parm, int (*ca=
llback)())
> +             /* Assume ethernet again here */
> +             struct sockaddr_dl *sdl =3D (struct sockaddr_dl *) addrs->i=
fa_addr;
> +             if (sdl->sdl_alen !=3D 0 &&
> +-                !((*callback)(iface_index, ARPHRD_ETHER, LLADDR(sdl), s=
dl->sdl_alen, parm)))
> ++                !callback.af_local(iface_index, ARPHRD_ETHER, LLADDR(sd=
l), sdl->sdl_alen, parm))
> +               goto err;
> +           }
> + #endif
> +diff --git a/src/dhcp.c b/src/dhcp.c
> +index 2603c76..009c2a0 100644
> +--- a/src/dhcp.c
> ++++ b/src/dhcp.c
> +@@ -317,7 +317,7 @@ void dhcp_packet(time_t now, int pxe_fd)
> +         match.ind =3D iface_index;
> +
> +         if (!daemon->if_addrs ||
> +-            !iface_enumerate(AF_INET, &match, check_listen_addrs) ||
> ++            !iface_enumerate(AF_INET, &match, (callback_t){.af_inet=3Dc=
heck_listen_addrs}) ||
> +             !match.matched)
> +           return;
> +
> +@@ -330,7 +330,7 @@ void dhcp_packet(time_t now, int pxe_fd)
> +       if (relay_upstream4(iface_index, mess, (size_t)sz))
> +       return;
> +
> +-      if (!iface_enumerate(AF_INET, &parm, complete_context))
> ++      if (!iface_enumerate(AF_INET, &parm, (callback_t){.af_inet=3Dcomp=
lete_context}))
> +       return;
> +
> +       /* Check for a relay again after iface_enumerate/complete_context=
 has had
> +diff --git a/src/dhcp6.c b/src/dhcp6.c
> +index c9d54dc..303d33c 100644
> +--- a/src/dhcp6.c
> ++++ b/src/dhcp6.c
> +@@ -239,7 +239,7 @@ void dhcp6_packet(time_t now)
> +         relay_upstream6(if_index, (size_t)sz, &from.sin6_addr, from.sin=
6_scope_id, now))
> +       return;
> +
> +-      if (!iface_enumerate(AF_INET6, &parm, complete_context6))
> ++      if (!iface_enumerate(AF_INET6, &parm, (callback_t){.af_inet6=3Dco=
mplete_context6}))
> +       return;
> +
> +       /* Check for a relay again after iface_enumerate/complete_context=
 has had
> +@@ -617,7 +617,7 @@ void make_duid(time_t now)
> +       newnow =3D now - 946684800;
> + #endif
> +
> +-      iface_enumerate(AF_LOCAL, &newnow, make_duid1);
> ++      iface_enumerate(AF_LOCAL, &newnow, (callback_t){.af_local=3Dmake_=
duid1});
> +
> +       if(!daemon->duid)
> +       die("Cannot create DHCPv6 server DUID: %s", NULL, EC_MISC);
> +@@ -667,7 +667,7 @@ struct cparam {
> +
> + static int construct_worker(struct in6_addr *local, int prefix,
> +                           int scope, int if_index, int flags,
> +-                          int preferred, int valid, void *vparam)
> ++                          unsigned int preferred, unsigned int valid, v=
oid *vparam)
> + {
> +   char ifrn_name[IFNAMSIZ];
> +   struct in6_addr start6, end6;
> +@@ -801,7 +801,7 @@ void dhcp_construct_contexts(time_t now)
> +     if (context->flags & CONTEXT_CONSTRUCTED)
> +       context->flags |=3D CONTEXT_GC;
> +
> +-  iface_enumerate(AF_INET6, &param, construct_worker);
> ++  iface_enumerate(AF_INET6, &param, (callback_t){.af_inet6=3Dconstruct_=
worker});
> +
> +   for (up =3D &daemon->dhcp6, context =3D daemon->dhcp6; context; conte=
xt =3D tmp)
> +     {
> +diff --git a/src/dnsmasq.h b/src/dnsmasq.h
> +index a9019ee..abb06c8 100644
> +--- a/src/dnsmasq.h
> ++++ b/src/dnsmasq.h
> +@@ -1662,7 +1662,13 @@ void route_sock(void);
> + #endif
> +
> + /* bpf.c or netlink.c */
> +-int iface_enumerate(int family, void *parm, int (callback)());
> ++typedef union {
> ++      int (*af_unspec)(int family, char *addrp, char *mac, size_t macle=
n, void *parmv);
> ++      int (*af_inet)(struct in_addr local, int if_index, char *label, s=
truct in_addr netmask, struct in_addr broadcast, void *vparam);
> ++      int (*af_inet6)(struct in6_addr *local, int prefix, int scope, in=
t if_index, int flags, unsigned int preferred, unsigned int valid, void *vp=
aram);
> ++      int (*af_local)(int index, unsigned int type, char *mac, size_t m=
aclen, void *parm);
> ++} callback_t;
> ++int iface_enumerate(int family, void *parm, callback_t callback);
> +
> + /* dbus.c */
> + #ifdef HAVE_DBUS
> +diff --git a/src/lease.c b/src/lease.c
> +index a133021..06a6ae4 100644
> +--- a/src/lease.c
> ++++ b/src/lease.c
> +@@ -411,7 +411,7 @@ static int find_interface_v4(struct in_addr local, i=
nt if_index, char *label,
> + #ifdef HAVE_DHCP6
> + static int find_interface_v6(struct in6_addr *local,  int prefix,
> +                            int scope, int if_index, int flags,
> +-                           int preferred, int valid, void *vparam)
> ++                           unsigned int preferred, unsigned int valid, =
void *vparam)
> + {
> +   struct dhcp_lease *lease;
> +
> +@@ -468,9 +468,9 @@ void lease_find_interfaces(time_t now)
> +   for (lease =3D leases; lease; lease =3D lease->next)
> +     lease->new_prefixlen =3D lease->new_interface =3D 0;
> +
> +-  iface_enumerate(AF_INET, &now, find_interface_v4);
> ++  iface_enumerate(AF_INET, &now, (callback_t){.af_inet=3Dfind_interface=
_v4});
> + #ifdef HAVE_DHCP6
> +-  iface_enumerate(AF_INET6, &now, find_interface_v6);
> ++  iface_enumerate(AF_INET6, &now, (callback_t){.af_inet6=3Dfind_interfa=
ce_v6});
> + #endif
> +
> +   for (lease =3D leases; lease; lease =3D lease->next)
> +diff --git a/src/netlink.c b/src/netlink.c
> +index ef4b5fe..c706339 100644
> +--- a/src/netlink.c
> ++++ b/src/netlink.c
> +@@ -151,7 +151,7 @@ static ssize_t netlink_recv(int flags)
> +    family =3D AF_LOCAL finds MAC addresses.
> +    returns 0 on failure, 1 on success, -1 when restart is required
> + */
> +-int iface_enumerate(int family, void *parm, int (*callback)())
> ++int iface_enumerate(int family, void *parm, callback_t callback)
> + {
> +   struct sockaddr_nl addr;
> +   struct nlmsghdr *h;
> +@@ -247,7 +247,7 @@ int iface_enumerate(int family, void *parm, int (*ca=
llback)())
> +                     }
> +
> +                   if (addr.s_addr && callback_ok)
> +-                    if (!((*callback)(addr, ifa->ifa_index, label,  net=
mask, broadcast, parm)))
> ++                    if (!callback.af_inet(addr, ifa->ifa_index, label, =
 netmask, broadcast, parm))
> +                       callback_ok =3D 0;
> +                 }
> +               else if (ifa->ifa_family =3D=3D AF_INET6)
> +@@ -288,9 +288,9 @@ int iface_enumerate(int family, void *parm, int (*ca=
llback)())
> +                     flags |=3D IFACE_PERMANENT;
> +
> +                   if (addrp && callback_ok)
> +-                    if (!((*callback)(addrp, (int)(ifa->ifa_prefixlen),=
 (int)(ifa->ifa_scope),
> ++                    if (!callback.af_inet6(addrp, (int)(ifa->ifa_prefix=
len), (int)(ifa->ifa_scope),
> +                                       (int)(ifa->ifa_index), flags,
> +-                                      (int) preferred, (int)valid, parm=
)))
> ++                                      (unsigned int)preferred, (unsigne=
d int)valid, parm))
> +                       callback_ok =3D 0;
> +                 }
> +             }
> +@@ -318,7 +318,7 @@ int iface_enumerate(int family, void *parm, int (*ca=
llback)())
> +
> +           if (!(neigh->ndm_state & (NUD_NOARP | NUD_INCOMPLETE | NUD_FA=
ILED)) &&
> +               inaddr && mac && callback_ok)
> +-            if (!((*callback)(neigh->ndm_family, inaddr, mac, maclen, p=
arm)))
> ++            if (!callback.af_unspec(neigh->ndm_family, inaddr, mac, mac=
len, parm))
> +               callback_ok =3D 0;
> +         }
> + #ifdef HAVE_DHCP6
> +@@ -342,7 +342,7 @@ int iface_enumerate(int family, void *parm, int (*ca=
llback)())
> +             }
> +
> +           if (mac && callback_ok && !((link->ifi_flags & (IFF_LOOPBACK =
| IFF_POINTOPOINT))) &&
> +-              !((*callback)((int)link->ifi_index, (unsigned int)link->i=
fi_type, mac, maclen, parm)))
> ++              !callback.af_local((int)link->ifi_index, (unsigned int)li=
nk->ifi_type, mac, maclen, parm))
> +             callback_ok =3D 0;
> +         }
> + #endif
> +diff --git a/src/network.c b/src/network.c
> +index 0e93c4d..36d9262 100644
> +--- a/src/network.c
> ++++ b/src/network.c
> +@@ -596,7 +596,7 @@ static int iface_allowed(struct iface_param *param, =
int if_index, char *label,
> +
> + static int iface_allowed_v6(struct in6_addr *local, int prefix,
> +                           int scope, int if_index, int flags,
> +-                          int preferred, int valid, void *vparam)
> ++                          unsigned int preferred, unsigned int valid, v=
oid *vparam)
> + {
> +   union mysockaddr addr;
> +   struct in_addr netmask; /* dummy */
> +@@ -833,12 +833,12 @@ again:
> +
> +   param.spare =3D spare;
> +
> +-  ret =3D iface_enumerate(AF_INET6, &param, iface_allowed_v6);
> ++  ret =3D iface_enumerate(AF_INET6, &param, (callback_t){.af_inet6=3Dif=
ace_allowed_v6});
> +   if (ret < 0)
> +     goto again;
> +   else if (ret)
> +     {
> +-      ret =3D iface_enumerate(AF_INET, &param, iface_allowed_v4);
> ++      ret =3D iface_enumerate(AF_INET, &param, (callback_t){.af_inet=3D=
iface_allowed_v4});
> +       if (ret < 0)
> +       goto again;
> +     }
> +diff --git a/src/radv.c b/src/radv.c
> +index d2d3390..f39716c 100644
> +--- a/src/radv.c
> ++++ b/src/radv.c
> +@@ -58,7 +58,7 @@ static int add_prefixes(struct in6_addr *local,  int p=
refix,
> +                       unsigned int preferred, unsigned int valid, void =
*vparam);
> + static int iface_search(struct in6_addr *local,  int prefix,
> +                       int scope, int if_index, int flags,
> +-                      int prefered, int valid, void *vparam);
> ++                      unsigned int prefered, unsigned int valid, void *=
vparam);
> + static int add_lla(int index, unsigned int type, char *mac, size_t macl=
en, void *parm);
> + static void new_timeout(struct dhcp_context *context, char *iface_name,=
 time_t now);
> + static unsigned int calc_lifetime(struct ra_interface *ra);
> +@@ -307,7 +307,7 @@ static void send_ra_alias(time_t now, int iface, cha=
r *iface_name, struct in6_ad
> +
> +   /* If no link-local address then we can't advertise since source addr=
ess of
> +      advertisement must be link local address: RFC 4861 para 6.1.2. */
> +-  if (!iface_enumerate(AF_INET6, &parm, add_prefixes) ||
> ++  if (!iface_enumerate(AF_INET6, &parm, (callback_t){.af_inet6=3Dadd_pr=
efixes}) ||
> +       parm.link_pref_time =3D=3D 0)
> +     return;
> +
> +@@ -449,7 +449,7 @@ static void send_ra_alias(time_t now, int iface, cha=
r *iface_name, struct in6_ad
> +       put_opt6_long(mtu);
> +     }
> +
> +-  iface_enumerate(AF_LOCAL, &send_iface, add_lla);
> ++  iface_enumerate(AF_LOCAL, &send_iface, (callback_t){.af_local=3Dadd_l=
la});
> +
> +   /* RDNSS, RFC 6106, use relevant DHCP6 options */
> +   (void)option_filter(parm.tags, NULL, daemon->dhcp_opts6);
> +@@ -823,7 +823,7 @@ time_t periodic_ra(time_t now)
> +         param.iface =3D context->if_index;
> +         new_timeout(context, param.name, now);
> +       }
> +-      else if (iface_enumerate(AF_INET6, &param, iface_search))
> ++      else if (iface_enumerate(AF_INET6, &param, (callback_t){.af_inet6=
=3Diface_search}))
> +       /* There's a context overdue, but we can't find an interface
> +          associated with it, because it's for a subnet we dont
> +          have an interface on. Probably we're doing DHCP on
> +@@ -856,7 +856,7 @@ time_t periodic_ra(time_t now)
> +                     aparam.iface =3D param.iface;
> +                     aparam.alias_ifs =3D NULL;
> +                     aparam.num_alias_ifs =3D 0;
> +-                    iface_enumerate(AF_LOCAL, &aparam, send_ra_to_alias=
es);
> ++                    iface_enumerate(AF_LOCAL, &aparam, (callback_t){.af=
_local=3Dsend_ra_to_aliases});
> +                     my_syslog(MS_DHCP | LOG_INFO, "RTR-ADVERT(%s) %s =
=3D> %d alias(es)",
> +                               param.name, daemon->addrbuff, aparam.num_=
alias_ifs);
> +
> +@@ -871,7 +871,7 @@ time_t periodic_ra(time_t now)
> +                            those. */
> +                         aparam.max_alias_ifs =3D aparam.num_alias_ifs;
> +                         aparam.num_alias_ifs =3D 0;
> +-                        iface_enumerate(AF_LOCAL, &aparam, send_ra_to_a=
liases);
> ++                        iface_enumerate(AF_LOCAL, &aparam, (callback_t)=
{.af_local=3Dsend_ra_to_aliases});
> +                         for (; aparam.num_alias_ifs; aparam.num_alias_i=
fs--)
> +                           {
> +                             my_syslog(MS_DHCP | LOG_INFO, "RTR-ADVERT(%=
s) %s =3D> i/f %d",
> +@@ -920,7 +920,7 @@ static int send_ra_to_aliases(int index, unsigned in=
t type, char *mac, size_t ma
> +
> + static int iface_search(struct in6_addr *local,  int prefix,
> +                       int scope, int if_index, int flags,
> +-                      int preferred, int valid, void *vparam)
> ++                      unsigned int preferred, unsigned int valid, void =
*vparam)
> + {
> +   struct search_param *param =3D vparam;
> +   struct dhcp_context *context;
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116290): https://lists.openembedded.org/g/openembedde=
d-devel/message/116290
> Mute This Topic: https://lists.openembedded.org/mt/111913155/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

