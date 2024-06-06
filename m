Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CF7C27C55
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 16:33:14 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.19417.1717691584530396130
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 09:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ffyBbhnv;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c9c41cdc4cso389406b6e.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717691584; x=1718296384; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UWUd03ciAh6AHrDc/FCBzC7QwLRbY6tew2dNSstz80=;
        b=ffyBbhnvUWOTP8+B2VSl7xf7RyntQQducdIOsUjz+FY/sLBwYNnRjnDoOngetYzK0V
         5nHCyZi2xeuqN5chkiHDrixzrI4ZDYjyjaEPFGN4b7rWUFrAU2YgwoQJYVHUmZljK3Xp
         CF2qHGyMsY/lo6mtDWNUyOr9DtdeIYu3m3QPaZsUmBQKjhrRRau0fvgiw80MCEyMmRdi
         m2ymIeEwmlS3Y3dIwKA+/AM9syC4obERSOmopXbakVG3OnE1rubVl5qsVJRITT17Nsst
         /4q92huGce8KZ1B4g69USxXB0DNlhnB6HMMZonx7iFB3mKsi1kiA3U4zXtGdHTGWnBwD
         2ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717691584; x=1718296384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UWUd03ciAh6AHrDc/FCBzC7QwLRbY6tew2dNSstz80=;
        b=OgCYkdkGt2l5xSg+LinHljhqtdGZpwMZ1tDKxgDNDlxz3u+26G+Mg2SH8ggCRDjvxY
         pdtFMP2tQH4Ye2a3MnJ7flSpfNe3DCQjgahnE8oWdjRPssI1cTSRNP5kafJVOMcp6xwD
         1DrUB/zqFENHcibLMhaCEz5zxozMK2ao2xPr5Z0gBkT/Cnffu7BICEngw1uD/18SJ3LF
         fNIWE/1kVypu9InJrS58rggSA2LUflacrh2zkPgPZkAoLkphigZp3Ko5CRGBLvpVaTba
         Eq4E0m7/oAyaKEm3X3HRwV65C1khnIRss2DAJX/yf53pmAKw/d8LZK3XceDuLyQsFWbB
         6Gkw==
X-Gm-Message-State: AOJu0YwoUJqPIv+pzzf2+ce+Rt2u9FhoM8F9/0UeKP/9AsKeROvjSAWw
	IU6mPRbnbb98MT3HmYm5kggFNiZIUtavt5Hn3C3Fgwr4XtBQsi9aXsVvbfmaNcJmKyT2cZl9EiC
	F1+f4gIOQy9g/0KkdPxan2cHn1HYBLdMe
X-Google-Smtp-Source: AGHT+IGsM+vNEF9rnxlB2usF+fVGHR/GPFO4Xuk+9zVi7W2T0aRVc+jb0wzn7GR17JoGk5Bq+J0e1PGI6i43ysfOkBQ=
X-Received: by 2002:aca:1018:0:b0:3c5:eed2:e244 with SMTP id
 5614622812f47-3d2043b1bccmr6346599b6e.30.1717691583638; Thu, 06 Jun 2024
 09:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240606162307.972946-1-kai.kang@windriver.com> <20240606162307.972946-4-kai.kang@windriver.com>
In-Reply-To: <20240606162307.972946-4-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Jun 2024 09:32:37 -0700
Message-ID: <CAMKF1soi8GbyLSjoAN5396abY98FoON90f=JSn_doBpvVnQg1w@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 4/4] daq: fix incompatible pointer
 type error
To: kai.kang@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 16:33:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110754

On Thu, Jun 6, 2024 at 9:23=E2=80=AFAM Kai Kang via lists.openembedded.org
<kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Fix incompatible pointer type error for daq:
>
> | ../../daq-2.0.7/os-daq-modules/daq_nfq.c: In function 'SetPktHdr':
> | ../../daq-2.0.7/os-daq-modules/daq_nfq.c:394:37: error: passing argumen=
t 2 of 'nfq_get_payload' from incompatible pointer type [-Wincompatible-poi=
nter-types]
> |   394 |     int len =3D nfq_get_payload(nfad, (char**)pkt);
> |       |                                     ^~~~~~~~~~~
> |       |                                     |
> |       |                                     char **
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../recipes-connectivity/daq/daq_2.0.7.bb     |  1 +
>  ...-fix-incompatible-pointer-type-error.patch | 30 +++++++++++++++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/daq/files/daq-fi=
x-incompatible-pointer-type-error.patch
>
> diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb b/meta=
-networking/recipes-connectivity/daq/daq_2.0.7.bb
> index 66ad83f71..8cb4c04fa 100644
> --- a/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
> +++ b/meta-networking/recipes-connectivity/daq/daq_2.0.7.bb
> @@ -11,6 +11,7 @@ DEPENDS =3D "libpcap libpcre libdnet bison-native libne=
tfilter-queue"
>  SRC_URI =3D "http://fossies.org/linux/misc/daq-${PV}.tar.gz \
>             file://disable-run-test-program-while-cross-compiling.patch \
>             file://0001-correct-the-location-of-unistd.h.patch \
> +           file://daq-fix-incompatible-pointer-type-error.patch \
>             "
>  SRC_URI[sha256sum] =3D "bdc4e5a24d1ea492c39ee213a63c55466a2e8114b6a9abed=
609927ae13a7705e"
>  # these 2 create undeclared dependency on libdnet and libnetfilter-queue=
 from meta-networking
> diff --git a/meta-networking/recipes-connectivity/daq/files/daq-fix-incom=
patible-pointer-type-error.patch b/meta-networking/recipes-connectivity/daq=
/files/daq-fix-incompatible-pointer-type-error.patch
> new file mode 100644
> index 000000000..5a02d1615
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/daq/files/daq-fix-incompatible=
-pointer-type-error.patch
> @@ -0,0 +1,30 @@
> +Fix daq incompatible pointer type error:
> +
> +| ../../daq-2.0.7/os-daq-modules/daq_nfq.c: In function 'SetPktHdr':
> +| ../../daq-2.0.7/os-daq-modules/daq_nfq.c:394:37: error: passing argume=
nt 2 of 'nfq_get_payload' from incompatible pointer type [-Wincompatible-po=
inter-types]
> +|   394 |     int len =3D nfq_get_payload(nfad, (char**)pkt);
> +|       |                                     ^~~~~~~~~~~
> +|       |                                     |
> +|       |                                     char **
> +
> +Upstream-Status: Pending
> +

please submit upstream as well

> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +---
> + os-daq-modules/daq_nfq.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/os-daq-modules/daq_nfq.c b/os-daq-modules/daq_nfq.c
> +index 4de94b6..a6de2f3 100644
> +--- a/os-daq-modules/daq_nfq.c
> ++++ b/os-daq-modules/daq_nfq.c
> +@@ -391,7 +391,7 @@ static inline int SetPktHdr (
> +     DAQ_PktHdr_t* hdr,
> +     uint8_t** pkt
> + ) {
> +-    int len =3D nfq_get_payload(nfad, (char**)pkt);
> ++    int len =3D nfq_get_payload(nfad, (unsigned char**)pkt);
> +
> +     if ( len <=3D 0 )
> +         return -1;
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110752): https://lists.openembedded.org/g/openembedde=
d-devel/message/110752
> Mute This Topic: https://lists.openembedded.org/mt/106526692/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

