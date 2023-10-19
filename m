Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BEFCDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 03:30:57 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.19473.1697686254512210155
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 20:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q/1YrQml;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1ea48ef2cbfso2549430fac.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 20:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697686254; x=1698291054; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMzEDzZZUMbom44xlSdHKzNf/jKX7qAsP2BA1r3yA1g=;
        b=Q/1YrQmlWzRF3/0mqVt84/PbOHuAp0lvizkOrU73fMkpAgwqIxG4iVzZFHu7ESJG4T
         zMK+WwmmB7Mnk+GXfpYKiFmxdnTumOe+rosinlK5clOU0H/e7+gFbWBo7uD44V1725sC
         H2PUXTli/ps7u6qdqiM31fcdr+xeATad59GrmTaz4JtrflSPCLu+w9hyh52hbanCnbA8
         btZr6IsH0n/jMCeumbPUBK24jxXrKPBPioUlqBu0BLCiz5Z7TS4FSVwhr1FhvPDDtqPF
         58dOshzyEfQJ/NxlPe78L8AdxxFjV8BixO9rSuLUokiXb71v3o8HNNYB78NLwETeOjV6
         ECEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697686254; x=1698291054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMzEDzZZUMbom44xlSdHKzNf/jKX7qAsP2BA1r3yA1g=;
        b=Xn8xpQ2BW9lV979AchD74ZlkS3K2MFOrTDWKqC/35nG6gfq0sKmXkd5jU5QqPQPBBT
         d9cjvwIHRRKkWtNVeGWhT6ZUZxLJoUDaFQ2dur/B3RefY8FI00xU9QSqqsM7ztgIt+Nk
         zgDCPawf05itR5740Dw/JiXnixNo91/E4vPqY+QGm5Fyix7czCmr0QgvqkxKAeS51/Jp
         rUNE6wRT87/qvIISaHVjqft8jW+aJ05TP8hd7xLlS5OsnMBfwLPLlyhi+hI+4J0Ou0fj
         Egi0PEAK5HamLIZ1VLrCS44LeoknBOk0hFYkjKJ2dPrLsyVyVGsYU2hw5aEyl8lUY/kk
         Bbgg==
X-Gm-Message-State: AOJu0Yx2T7biXGzl9IHyLuEul8lcb2seBJ51tPHBH1h8zJqqDNfFkMee
	Iy6TpR61g7d3i1XWduDJiRP41LE6wOBSjB+iSkQpRLTRS+0=
X-Google-Smtp-Source: AGHT+IEYwB7D5MtTwkNLLK+sTziljU3StfknxXdg308dZHBoGyNFCgNgOZUCl3vJVNLZCnI5m7CXhbsr6IYh6FZGe9g=
X-Received: by 2002:a05:6870:b1b:b0:1ea:8645:6354 with SMTP id
 lh27-20020a0568700b1b00b001ea86456354mr1587898oab.0.1697686253680; Wed, 18
 Oct 2023 20:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231019011326.3535316-1-ticotimo@gmail.com> <20231019011326.3535316-2-ticotimo@gmail.com>
In-Reply-To: <20231019011326.3535316-2-ticotimo@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Oct 2023 20:30:27 -0700
Message-ID: <CAMKF1srBaFgMyRDjXimfYyX1=mWvZDwbG6KckjJp8rgsrgFk-Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] debsums: remove old recipe
To: Tim Orling <ticotimo@gmail.com>, Tom Rini <trini@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 03:30:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105588

Adding Tom since he added it back in 2017.

On Wed, Oct 18, 2023 at 6:14=E2=80=AFPM Tim Orling <ticotimo@gmail.com> wro=
te:
>
> The debsums recipe has not been substantially touched since 2020
> when it was moved to dynamic-layers.
>
> In meta-openembedded ecosystem, it is the only known recipe that
> depends on po4a, which is being removed in a separate commit.
>
> According to the layerindex, no known recipes depend on debsums:
> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Ddep=
ends%3Adebsums
>
> Signed-off-by: Tim Orling <ticotimo@gmail.com>
> ---
>  .../packagegroup-meta-oe.bbappend             |  2 +-
>  .../recipes-support/debsums/debsums_2.2.2.bb  | 56 -------------------
>  2 files changed, 1 insertion(+), 57 deletions(-)
>  delete mode 100644 meta-oe/dynamic-layers/perl-layer/recipes-support/deb=
sums/debsums_2.2.2.bb
>
> diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups=
/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/perl-layer/recipes-=
core/packagegroups/packagegroup-meta-oe.bbappend
> index 8cb8d22a2..5c48fd5c0 100644
> --- a/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packag=
egroup-meta-oe.bbappend
> +++ b/meta-oe/dynamic-layers/perl-layer/recipes-core/packagegroups/packag=
egroup-meta-oe.bbappend
> @@ -1 +1 @@
> -RDEPENDS:packagegroup-meta-oe-support +=3D "debsums rasdaemon"
> +RDEPENDS:packagegroup-meta-oe-support +=3D "rasdaemon"
> diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/debsums/de=
bsums_2.2.2.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/debsums/=
debsums_2.2.2.bb
> deleted file mode 100644
> index 252db1994..000000000
> --- a/meta-oe/dynamic-layers/perl-layer/recipes-support/debsums/debsums_2=
.2.2.bb
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -SUMMARY =3D "Miscellaneous utilities specific to Debian"
> -SUMMARY:${PN}-cron =3D "Cron scripts to control automatic debsum checkin=
g"
> -DESCRIPTION =3D "A tool for verification of installed package files agai=
nst \
> -MD5 checksums debsums can verify the integrity of installed package file=
s \
> -against MD5 checksums installed by the package, or generated from a .deb=
 \
> -archive."
> -DESCRIPTION:${PN}-cron =3D "Cron scripts to control automatic system int=
egrity \
> -checking via debsums."
> -SECTION =3D "base"
> -LICENSE =3D "GPL-2.0-only"
> -LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3D770d751553e6559e9eae=
fd2e11ccf7e9"
> -
> -SRC_URI =3D "http://snapshot.debian.org/archive/debian/20170530T212108Z/=
pool/main/d/debsums/debsums_2.2.2.tar.xz"
> -SRC_URI[md5sum] =3D "82b0710855a7e5212d4358163a269e79"
> -SRC_URI[sha256sum] =3D "aa61896f93a6bbfe0161c21dcd67529ae8e1ec8c3ccf2445=
23c52c4ad8253d97"
> -
> -# the package is taken from snapshots.debian.org; that source is static =
and goes stale
> -# so we check the latest upstream from a directory that does get updated
> -UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/d/${BPN}/"
> -
> -inherit perlnative gettext
> -
> -DEPENDS +=3D "po4a-native"
> -
> -do_install() {
> -        install -d ${D}/${sysconfdir}/cron.daily ${D}/${sysconfdir}/cron=
.weekly
> -        install -d ${D}/${sysconfdir}/cron.monthly ${D}${sbindir} ${D}${=
bindir}
> -        install -d ${D}${mandir}/man1 ${D}${mandir}/man8
> -        install -m 0755 debsums ${D}${bindir}/
> -        install -m 0755 rdebsums ${D}${bindir}/
> -        install -m 0755 debsums_init ${D}${sbindir}
> -        install -m 0644 man/debsums.1 ${D}${mandir}/man1/
> -        install -m 0644 man/rdebsums.1 ${D}${mandir}/man1/
> -        install -m 0644 man/debsums_init.8 ${D}${mandir}/man8/
> -        install -m 0644 debian/cron.daily \
> -                ${D}/${sysconfdir}/cron.daily/debsums
> -        install -m 0644 debian/cron.weekly \
> -                ${D}/${sysconfdir}/cron.weekly/debsums
> -        install -m 0644 debian/cron.monthly \
> -                ${D}/${sysconfdir}/cron.monthly/debsums
> -        # Must exist, defaults to empty.
> -        touch ${D}/${sysconfdir}/debsums-ignore
> -}
> -
> -PACKAGES =3D+ "${PN}-cron"
> -
> -RDEPENDS:${PN} =3D "dpkg dpkg-perl libfile-fnmatch-perl perl \
> -                  perl-module-constant perl-module-digest-md5 \
> -                  perl-module-errno perl-module-fcntl \
> -                  perl-module-file-basename perl-module-file-copy \
> -                  perl-module-file-find perl-module-file-glob \
> -                  perl-module-file-path perl-module-file-spec \
> -                  perl-module-file-temp perl-module-getopt-long \
> -                  perl-module-posix"
> -
> -FILES:${PN}-cron =3D "${sysconfdir}/cron.*"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105587): https://lists.openembedded.org/g/openembedde=
d-devel/message/105587
> Mute This Topic: https://lists.openembedded.org/mt/102052093/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

