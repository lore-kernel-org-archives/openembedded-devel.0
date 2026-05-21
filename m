Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB1DCD343F
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 06:36:41 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30951.1779345396638160453
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 23:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MF8saTWn;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4043b27ddeaso3554470fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2026 23:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779345396; cv=none;
        d=google.com; s=arc-20240605;
        b=E+32hecXlRNzyJH2IHMB+Relf6fuzAhHZwfi7QrHRaUyDBg1wUBlBPrABzkI9XgPyq
         4jUJwDkLzG7y7yuuFDAPOHSyeaHEF0WNvzWS/82YkuKAD06XO14YRKwC/JmJA6Nxyw23
         HC5lc3NXG/URsZaXI41GK/SCxIaIYlMSW3HGEyhyK75feG+unoFrVbg+mjrPqCwqxjsX
         xrnTCrEJkL1StYgpfmGtTY72Lx+y/3wwyf5k5yD55poa5wvg2mpmww2NaPyHraZdPdYe
         SyzirZcYz/FCMgp7w8RxxkbQBHrp+5kNSmDRQinNfE4Q/250SuKqeL3cQuVuV+cq7Say
         YjfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M7IjjsGbpt0Y9T3v28gLTJe1Acl9vU7X5HciyzjXEyQ=;
        fh=cxzSSg5fd04DoSyc+ihU+rQnfQaDkhRpdo4FQfUeL2k=;
        b=anOpFgAy0TfXL0+e7HZyyFf5l3mhAoLxuKQNYV/aUn1Y0HYZ4JlL1RjVsNd10vtaNf
         E26yz45G0OGHQJuIyLP/RUmMR0NPyrQMw+k7xlF01ZyGlCgMrECEiggrTGF25/cOEOMC
         arcuhWZzdJgPEssJGz+B+SYgffrExxvfK0zt73lcqheArK05fXWEz0AcCbkTvmc2lMYS
         qIz5rEUZdgKc1ZkAYQ9yRtimiXZhniPuZgNf4wgf8ezoQzDZtFk5ft9XjHrTu/L84MQ0
         OKXvdYvrWhWXGkDqzDDZYZYypurXq5IteHJkYBio+ZhqhxAnJa/pUQf4da1/6rz0s/m4
         yQqQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779345396; x=1779950196; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7IjjsGbpt0Y9T3v28gLTJe1Acl9vU7X5HciyzjXEyQ=;
        b=MF8saTWn1cF7juVVZMxInySNQzRu69cZFovwI40ia0YC0/19xhGyoMjMFIHkILu+AB
         lRqeUJZDWrfZQWsTDbwwHRpy7VZT5DKpBU8bAMAyDFzsIch6bY73YpM13RdE2zWgd55q
         ERrhQuZjyVMj1fLYbfBB3+DL4vLoNwQ4HRvSgzuUi9NFoYBjl4IA1GH28eTM1MaKP2ln
         sj8weNKwZj4QSaf6qatp4ZmJOXuFvB1VVVV3np/eaNdIM5U3qsE4zkng6dkQn4qEmR8+
         lTNwqRtniUyXdGyIbV2A9Ksa9OpushPHExGqlY2qAZ+yy5ytmSzmTDHZSCPZL5Wb0meN
         /fmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779345396; x=1779950196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M7IjjsGbpt0Y9T3v28gLTJe1Acl9vU7X5HciyzjXEyQ=;
        b=BG/6aDZk7fc0gufCxLiHRHDLpbuteCpPFWI8NIU/4Zj74IkjADO9WAwI3y287XlF+T
         RR/c/cAdk0LA23cYqD/3xNql/QdWUpjwNYa5wXcx8BcuQF0NMCbiJlQv2cEWSkB5q2R+
         fYj8tMF9hKlO+gywoEehNM2sbSC/GAYOOe0K+Gk66KvUlD8etiuGtvFne071m1RgiDbd
         X/1FBiGL2Q9l1XXHLodbX0sYnU2MyzOz5z5gbqD/l7WCjEz1kjskLMrYRitp3FDL+2ZE
         lIlEwsk4SZHE9chaBdtvU3pCC6rkNdjoC7uB6iZCYGr3rJUWmuP+8p0IDUdg+C4lYCLL
         l4pQ==
X-Gm-Message-State: AOJu0YyiScFBzjO7Ll6Qh5nBOh3Dg3v3svtzqYV90eczKPeupVa99IRF
	0fCt0gLe7UQh+F61t1lKPRyxMFT6CoIj8PFBuV7bQlM06AIvoJuD6RsNXv7fwQrT+Brd4plhtLL
	YRqDpSot3C7In6nza941r0NhnKkhwvF22eDar1BU=
X-Gm-Gg: Acq92OEtp4+jt3zTVJ5NvbWsIwpusDWLc0WgFOJhv701iT1repzn2kVKwwsbhSqXCgk
	EqjQkpdGVtjKwHWWyQJgHkOsNEddQPQC8aFZz3AwVCLCiXSnc0lSavYRIlBkQ059CctdhPkL0g5
	HRYfW+z0kyJ1x8NvUJn1G3ipbovkdbwkiN3DX0RbeGVwf2PVC6xdXz1y1ajAPjtMuA+hBGTCmxT
	ZMKIO81kgYBzS8xMWPODPRIQ8YsSREaobmqWyv3X27NC8PXrhkubX04OzKgeAsC10Ltnd5ZBprL
	x6o2FOhaLA==
X-Received: by 2002:a05:6870:898e:b0:42f:beec:92ed with SMTP id
 586e51a60fabf-43b2e7e8c67mr972284fac.10.1779345395635; Wed, 20 May 2026
 23:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260518171336.470608-1-Abhishek.Bachiphale@windriver.com> <20260518171336.470608-7-Abhishek.Bachiphale@windriver.com>
In-Reply-To: <20260518171336.470608-7-Abhishek.Bachiphale@windriver.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 21 May 2026 18:36:24 +1200
X-Gm-Features: AVHnY4I-482hP0ICHSpbptZIlOmGnX3kC0MxTMnv6lDAD6R47lBIs4qHbO4rjCE
Message-ID: <CADySD0GacBwLg597RcxgZtyPSE40gpqkzU2mi2vEGtJxH_8BNg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 6/6] dnsmasq: fix CVE-2026-5172
To: abhishek.bachiphale@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 06:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127133

Instead of this patch series, why don't we simply upgrade to 2.92rel2 ?
https://thekelleys.org.uk/dnsmasq/CHANGELOG?

cheers
Ankur

On Tue, May 19, 2026 at 5:14=E2=80=AFAM Abhishek Bachiphale via
lists.openembedded.org
<abhishek.bachiphale=3Dwindriver.com@lists.openembedded.org> wrote:
>
> A buffer overflow in dnsmasq=E2=80=99s extract_addresses() function allow=
s
> an attacker to trigger a heap out-of-bounds read and crash by
> exploiting a malformed DNS response, enabling extract_name()
> to advance the pointer past the record=E2=80=99s end.
>
> Reference:
> [ https://nvd.nist.gov/vuln/detail/CVE-2026-5172 ]
>
> Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
> ---
>  .../recipes-support/dnsmasq/dnsmasq_2.92.bb   |  1 +
>  .../dnsmasq/files/CVE-2026-5172.patch         | 34 +++++++++++++++++++
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-202=
6-5172.patch
>
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb b/me=
ta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
> index 4ae650f7e7..c19467aed9 100644
> --- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
> +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
> @@ -20,6 +20,7 @@ SRC_URI =3D "http://www.thekelleys.org.uk/dnsmasq/${@['=
archive/', ''][float(d.getV
>             file://CVE-2026-4891.patch \
>             file://CVE-2026-4892.patch \
>             file://CVE-2026-4893.patch \
> +           file://CVE-2026-5172.patch \
>  "
>  SRC_URI[sha256sum] =3D "fd908e79ff37f73234afcb6d3363f78353e768703d92abd8=
e3220ade6819b1e1"
>
> diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.=
patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch
> new file mode 100644
> index 0000000000..ce6e0f464b
> --- /dev/null
> +++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2026-5172.patch
> @@ -0,0 +1,34 @@
> +commit fa3c8ddef6712b52f562813317e6a997e1210123
> +Author: Simon Kelley <simon@thekelleys.org.uk>
> +Date:   Mon Mar 30 16:24:33 2026 +0100
> +
> +Fix buffer overflow vulnerability in extract_addresses() CVE-2026-5172
> +
> +Thanks to Hugo Martinez Ray for spotting this.
> +
> +The value of rdlen for an RR can be a lie, allowing the
> +call to extract_name() at rfc1025.c:952 to advance the value of p1
> +past the calculated end of the record. The makes the calculation
> +of bytes remaining in the RR underflow to a huge number and results
> +in a massive heap OOB read and certain crash.
> +
> +CVE: CVE-2026-5172
> +
> +Upstream-Status: Backport [ https://thekelleys.org.uk/gitweb/?p=3Ddnsmas=
q.git;a=3Dcommit;h=3D073082ddc0aba7b8efa15a688d6183463b65effa ]
> +
> +Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
> +
> +diff --git a/src/rfc1035.c b/src/rfc1035.c
> +index f0e1082..7e05fb5 100644
> +--- a/src/rfc1035.c
> ++++ b/src/rfc1035.c
> +@@ -943,7 +943,8 @@ int extract_addresses(struct dns_header *header, siz=
e_t qlen, char *name, time_t
> +                             /* Name, extract it then re-encode. */
> +                             int len;
> +
> +-                            if (!extract_name(header, qlen, &p1, name, =
EXTR_NAME_EXTRACT, 0))
> ++                            /* rdlen may lie, and extract_name() advanc=
es p1 past where it says the record ends. */
> ++                            if (!extract_name(header, qlen, &p1, name, =
EXTR_NAME_EXTRACT, 0) || (p1 > endrr))
> +                               {
> +                                 blockdata_free(addr.rrblock.rrdata);
> +                                 return 2;
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127057): https://lists.openembedded.org/g/openembedde=
d-devel/message/127057
> Mute This Topic: https://lists.openembedded.org/mt/119376896/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

