Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BB7E728CA
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 16:49:52 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.22766.1696006187471711234
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 09:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W0CEBxdd;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1dd2e65ed59so4564152fac.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 09:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696006187; x=1696610987; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfcKkZhmnwhEPQfgfime/esWnDy7FujwZ51lirrFp84=;
        b=W0CEBxddfBSOGiSJau3DMbFfHGj9P/Ptksl+7lmCjA4NThU7CY24OKpEX4lrlD8W4/
         HmC1OhDRTLY+Uf83h09idjmfzCPGJumJ9k/8O/qTGC6X0kwwyKKAynkcflQYjm3HkJc/
         BmS/bnxlMY5K/NKPBbSmKrI+nCARB6Mdy81UjzEc9i3BHOXiwgjPUXd5I0QvDIO3S6VV
         4uVKVFWKemC/Id+Psiy0I0YO47HoMAVvDQI0C/9c1JrKIb5oqwswxm1KZg4ahthbBgYJ
         pH9zCSK7dyGiXjJfWcvAXYdTZJJEbGCLUv3fDA0y6lxYUgNhb5UzJdVfI5QB+VmT8ghz
         PqSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696006187; x=1696610987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YfcKkZhmnwhEPQfgfime/esWnDy7FujwZ51lirrFp84=;
        b=JwQQU4xNXdwmAbxI2RJV63CkduSO+XMV/WLr6EZjGulFJk8bHvf+SLB848qQSBKSLf
         CsstSXTFhh9Vzz79lHCodaxZ9oLZhA80P7LlGOaQi+oFTA95ksRvtV2pXjbQCQQK6Sks
         CwTwUM7P89ffr8IssvRE4z0gAHhtqr/P6d0JDauzPlp7e004cNdt3WNqQ+XMsvqsMgNH
         qdgAIsg7K2UCyCTa+Qyw6BHqVRQtwlp38HjsssLcQfJFa1a12C+EV/nQa2Acgaz2+cY0
         BX7wSGkQQuFKbxgYtK2xrCwc1gcFqEkgk+i/UOIv4Bg1iqh5O0TYoe+bLG6M99xzr04G
         VOag==
X-Gm-Message-State: AOJu0YwDHLqZ/9UCF8xTlkCbdFM/z/7rJhaiWul2JTnoi9vBHLBkKxT3
	iPl+PedAv5BpasOu5CPxti4m1pFarLkinscF8wQmLvrHrjCfYw==
X-Google-Smtp-Source: AGHT+IE5ioUxIu5NV3QPxD9PlghZQVvujjWcq95WnMoiJwrHc53TLdVjnoJMGQQDTJq4g61uaeKmhauPW2UnQeJ1Sm4=
X-Received: by 2002:a05:6870:b6a5:b0:1bb:51e4:9483 with SMTP id
 cy37-20020a056870b6a500b001bb51e49483mr5782409oab.45.1696006186460; Fri, 29
 Sep 2023 09:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230929133310.217569-1-pawel.langowski@3mdeb.com>
In-Reply-To: <20230929133310.217569-1-pawel.langowski@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Sep 2023 09:49:20 -0700
Message-ID: <CAMKF1srONZxdQebjB+kuqN0vsjMYpLBi0A0mHkY2pot+nC-uOA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCHv4] recipes-connectivity: Add tayga recipe
To: Pawel Langowski <pawel.langowski@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org, piotr.krol@3mdeb.com, 
	tomasz.zyjewski@3mdeb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 16:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105251

On Fri, Sep 29, 2023 at 6:33=E2=80=AFAM Pawel Langowski
<pawel.langowski@3mdeb.com> wrote:
>
> Recipe for TAYGA - an out-of-kernel stateless NAT64 implementation for Li=
nux
>
> Signed-off-by: Pawel Langowski <pawel.langowski@3mdeb.com>
> ---
>  .../tayga/files/0001-include-sys-uio.patch    |  10 ++
>  .../tayga/files/tayga.conf                    | 103 ++++++++++++++++++
>  .../tayga/files/tayga.service                 |  12 ++
>  .../recipes-connectivity/tayga/tayga_0.9.2.bb |  21 ++++
>  4 files changed, 146 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/tayga/files/0001=
-include-sys-uio.patch
>  create mode 100644 meta-networking/recipes-connectivity/tayga/files/tayg=
a.conf
>  create mode 100644 meta-networking/recipes-connectivity/tayga/files/tayg=
a.service
>  create mode 100644 meta-networking/recipes-connectivity/tayga/tayga_0.9.=
2.bb
>
> diff --git a/meta-networking/recipes-connectivity/tayga/files/0001-includ=
e-sys-uio.patch b/meta-networking/recipes-connectivity/tayga/files/0001-inc=
lude-sys-uio.patch
> new file mode 100644
> index 000000000000..ab8c6b5ca0d7

Please document this patch especially with some description, SOB and
Upstream-Status
see - https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.ht=
ml?highlight=3Dupstream+status#patch-upstream-status

> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/tayga/files/0001-include-sys-u=
io.patch
> @@ -0,0 +1,10 @@
> +--- tayga.h    2023-09-29 14:38:05.005837695 +0200
> ++++ tayga-2.h  2023-09-29 14:37:45.560837257 +0200
> +@@ -20,6 +20,7 @@
> + #include <sys/stat.h>
> + #include <sys/ioctl.h>
> + #include <sys/socket.h>
> ++#include <sys/uio.h>
> + #include <netinet/in.h>
> + #include <arpa/inet.h>
> + #include <unistd.h>
> diff --git a/meta-networking/recipes-connectivity/tayga/files/tayga.conf =
b/meta-networking/recipes-connectivity/tayga/files/tayga.conf
> new file mode 100644
> index 000000000000..c1b6163a4591
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/tayga/files/tayga.conf
> @@ -0,0 +1,103 @@
> +#
> +# Sample configuration file for TAYGA 0.9.2
> +#
> +# Modify this to use your own addresses!!
> +#
> +
> +#
> +# TUN device that TAYGA will use to exchange IPv4 and IPv6 packets with =
the
> +# kernel.  You may use any name you like, but `nat64' is recommended.
> +#
> +# This device may be created before starting the tayga daemon by running
> +# `tayga --mktun`.  This allows routing and firewall rules to be set up =
prior
> +# to commencement of packet translation.
> +#
> +# Mandatory.
> +#
> +tun-device nat64
> +
> +#
> +# TAYGA's IPv4 address.  This is NOT your router's IPv4 address!  TAYGA
> +# requires its own address because it acts as an IPv4 and IPv6 router, a=
nd
> +# needs to be able to send ICMP messages.  TAYGA will also respond to IC=
MP
> +# echo requests (ping) at this address.
> +#
> +# This address can safely be located inside the dynamic-pool prefix.
> +#
> +# Mandatory.
> +#
> +ipv4-addr 192.168.254.1
> +
> +#
> +# TAYGA's IPv6 address.  This is NOT your router's IPv6 address!  TAYGA
> +# requires its own address because it acts as an IPv4 and IPv6 router, a=
nd
> +# needs to be able to send ICMP messages.  TAYGA will also respond to IC=
MP
> +# echo requests (ping6) at this address.
> +#
> +# You can leave ipv6-addr unspecified and TAYGA will construct its IPv6
> +# address using ipv4-addr and the NAT64 prefix.
> +#
> +# Optional if the NAT64 prefix is specified, otherwise mandatory.  It is=
 also
> +# mandatory if the NAT64 prefix is 64:ff9b::/96 and ipv4-addr is a priva=
te
> +# (RFC1918) address.
> +#
> +#ipv6-addr 2001:db8:1::2
> +ipv6-addr fdaa:bb:1::1
> +
> +#
> +# The NAT64 prefix.  The IPv4 address space is mapped into the IPv6 addr=
ess
> +# space by prepending this prefix to the IPv4 address.  Using a /96 pref=
ix is
> +# recommended in most situations, but all lengths specified in RFC 6052 =
are
> +# supported.
> +#
> +# This must be a prefix selected from your organization's IPv6 address s=
pace
> +# or the Well-Known Prefix 64:ff9b::/96.  Note that using the Well-Known
> +# Prefix will prohibit IPv6 hosts from contacting IPv4 hosts that have p=
rivate
> +# (RFC1918) addresses, per RFC 6052.
> +#
> +# The NAT64 prefix need not be specified if all required address mapping=
s are
> +# listed in `map' directives.  (See below.)
> +#
> +# Optional.
> +#
> +##prefix 2001:db8:1:ffff::/96
> +prefix 64:ff9b::/96
> +
> +#
> +# Dynamic pool prefix.  IPv6 hosts which send traffic through TAYGA (and=
 do
> +# not correspond to a static map or an IPv4-translatable address in the =
NAT64
> +# prefix) will be assigned an IPv4 address from the dynamic pool.  Dynam=
ic
> +# maps are valid for 124 minutes after the last matching packet is seen.
> +#
> +# If no unassigned addresses remain in the dynamic pool (or no dynamic p=
ool is
> +# configured), packets from unknown IPv6 hosts will be rejected with an =
ICMP
> +# unreachable error.
> +#
> +# Optional.
> +#
> +dynamic-pool 192.168.254.0/24
> +
> +#
> +# Persistent data storage directory.  The dynamic.map file, which saves =
the
> +# dynamic maps that are created from dynamic-pool, is stored in this
> +# directory.  Omit if you do not need these maps to be persistent betwee=
n
> +# instances of TAYGA.
> +#
> +# Optional.
> +#
> +data-dir /var/spool/tayga
> +
> +#
> +# Establishes a single-host map.  If an IPv6 host should be consistently
> +# reachable at a specific IPv4 address, the mapping can be specified in =
a
> +# `map' directive.  (IPv6 hosts numbered with an IPv4-translatable addre=
ss do
> +# not need map directives.)
> +#
> +# IPv4 addresses specified in the `map' directive can safely be located =
inside
> +# the dynamic-pool prefix.
> +#
> +# Optional.
> +#
> +#map 192.168.5.42 2001:db8:1:4444::1
> +#map 192.168.5.43 2001:db8:1:4444::2
> +#map 192.168.255.2 2001:db8:1:569::143
> diff --git a/meta-networking/recipes-connectivity/tayga/files/tayga.servi=
ce b/meta-networking/recipes-connectivity/tayga/files/tayga.service
> new file mode 100644
> index 000000000000..0bffeb92a501
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/tayga/files/tayga.service
> @@ -0,0 +1,12 @@
> +[Unit]
> +SourcePath=3D/usr/sbin/tayga
> +Description=3DLSB: userspace NAT64
> +
> +[Service]
> +Type=3Dforking
> +ExecStart=3D/usr/sbin/tayga -d --config /etc/tayga.conf
> +RemainAfterExit=3Dyes
> +TimeoutStopSec=3Dinfinity
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb b/=
meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb
> new file mode 100644
> index 000000000000..36d35e6dee89
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb
> @@ -0,0 +1,21 @@
> +LICENSE =3D "GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +SRC_URI =3D " \
> +        http://www.litech.org/tayga/tayga-${PV}.tar.bz2 \
> +        file://tayga.conf \
> +        file://tayga.service \
> +        file://0001-include-sys-uio.patch;striplevel=3D0 \
> +        "
> +SRC_URI[sha256sum] =3D "2b1f7927a9d2dcff9095aff3c271924b052ccfd2faca9588=
b277431a44f0009c"
> +
> +SYSTEMD_PACKAGES =3D "${PN}"
> +SYSTEMD_SERVICE:${PN} =3D "tayga.service"
> +
> +do_install:append() {
> +  install -m 0644 ${WORKDIR}/tayga.conf ${D}${sysconfdir}/tayga.conf
> +  install -d ${D}${systemd_unitdir}/system/
> +  install -m 0644 ${WORKDIR}/tayga.service ${D}${systemd_unitdir}/system=
/
> +}
> +
> +inherit autotools systemd
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105242): https://lists.openembedded.org/g/openembedde=
d-devel/message/105242
> Mute This Topic: https://lists.openembedded.org/mt/101657397/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

