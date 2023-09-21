Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6987CD495E
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 06:47:22 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web10.10138.1695278834369712693
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Sep 2023 23:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cxU/tD86;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1cc87405650so340327fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Sep 2023 23:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695278833; x=1695883633; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MQ9nlTajMQf9AnbzVlDfLDBidfKyDXtB51qtGB8JOc=;
        b=cxU/tD86s4sCI4Fhm1e+W68XWnkmpurW/RfIdWa4PJGiAXObPEo8m2B0ha/BjfZ7Qr
         0kv42WTfYrgPzB4slVJv0h8NjAtJwq8DOIUR3iPG4+DolCgQrNOp2NPUTAWlb9xD0TNr
         iXXiQwrNgMU8ump+jS99f8Ikrl/2OKWd582pp1gKsKihlZaJ57lZE49dBrY3euE+4y6e
         A+x1v26rAityvmsjo7zt40iDXxgB7F2HTYakSK4Iabfbi+fqFRWbltTmz5avUj9mAhrt
         KoulRLMAkX4vVRLI2NvORMNKJIDYN4JUZJRl+m0eGZkvJ28SmSx/hzKonA6pG34350zc
         iYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695278833; x=1695883633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1MQ9nlTajMQf9AnbzVlDfLDBidfKyDXtB51qtGB8JOc=;
        b=bbNUYnteDV+sZhvkuHhhubYcxoX7+Z0viefqA4HKItMvdUhCx7/iDPFr3q7uVkPebl
         I8GriA81Rb15DTdyCkECbcmhWNAOkhXADW7Xz/brNB5NcvmdzUFC8G2khJJltrhMGtFi
         SLom9JYHNoE+euzncVONeLrWzJVe0J45ZiYjKXaX1eSH/WBUB+wV13jye7gl3Vxl5ztm
         IDnpSv3VQOJOldmIOeq+qE+kWb6v+sWZJHjdOQ4qa2NX+p987ei9JUFNTjsFn9yXqHQ5
         FXUa8OSuBf4rB4BahQWipBIl5tdsl8PQclsNqsNlSiUdkp5irCr4+ywKaENbkZucyUNG
         W0HQ==
X-Gm-Message-State: AOJu0YzMDU6ixGCpEN3CcVQdqU5GiVB+aMwTrA2GASP7EXNUt40+S0Ju
	wIDuLhNwZAJ3n10M/w6DDjWe+9nwT9UVZSNRGEn+1LMJlO0=
X-Google-Smtp-Source: AGHT+IFG2yl1NBTXPTtqmaZhZjqVi5GZbqpNT6X/jZ9+D/sgr31+qOC+VZ/7zMPEHKv0hW5007wK66RgqlAtXO9+Sn8=
X-Received: by 2002:a05:6870:4985:b0:1dc:8191:8aa with SMTP id
 ho5-20020a056870498500b001dc819108aamr651778oab.44.1695278833332; Wed, 20 Sep
 2023 23:47:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230921063841.359264-1-pawel.langowski@3mdeb.com>
In-Reply-To: <20230921063841.359264-1-pawel.langowski@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Sep 2023 23:46:47 -0700
Message-ID: <CAMKF1spERpON7ntvWHdqxQrkttvyHiCE3j2A23Y7b93JD=x-OQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCHv2] recipes-connectivity: Add tayga recipe
To: Pawel Langowski <pawel.langowski@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org, piotr.krol@3mdeb.com, 
	tomasz.zyjewski@3mdeb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Sep 2023 06:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105035

On Wed, Sep 20, 2023 at 11:39=E2=80=AFPM Pawel Langowski
<pawel.langowski@3mdeb.com> wrote:
>
> Recipe for TAYGA - an out-of-kernel stateless NAT64 implementation for Li=
nux
> ---
>  .../tayga/files/tayga.conf                    | 103 ++++++++++++++++++
>  .../tayga/files/tayga.service                 |  12 ++
>  .../recipes-connectivity/tayga/tayga_0.9.2.bb |  20 ++++
>  3 files changed, 135 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/tayga/files/tayg=
a.conf
>  create mode 100644 meta-networking/recipes-connectivity/tayga/files/tayg=
a.service
>  create mode 100644 meta-networking/recipes-connectivity/tayga/tayga_0.9.=
2.bb
>
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
> index 000000000000..12d0d14e0d49
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/tayga/tayga_0.9.2.bb
> @@ -0,0 +1,20 @@
> +LICENSE =3D "GPLv2"

Use spdx string for LICENSE

> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +SRC_URI =3D "http://www.litech.org/tayga/tayga-${PV}.tar.bz2"
> +SRC_URI[md5sum] =3D "7a7b24165ce008df772f398d86fa280e"

no need for md5 sums. please remove

> +SRC_URI[sha256sum] =3D "2b1f7927a9d2dcff9095aff3c271924b052ccfd2faca9588=
b277431a44f0009c"
> +
> +SRC_URI +=3D "file://tayga.conf \
> +            file://tayga.service"

move this to SRC_URI above
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
> View/Reply Online (#105034): https://lists.openembedded.org/g/openembedde=
d-devel/message/105034
> Mute This Topic: https://lists.openembedded.org/mt/101495132/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

