Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD5EC27C53
	for <webhook@archiver.kernel.org>; Sun,  9 Jun 2024 18:57:36 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web11.2949.1717959452033253220
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jun 2024 11:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bVlW2/E7;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-25487d915b8so1246563fac.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Jun 2024 11:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717959451; x=1718564251; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1RlvMn+8fg+s5nONom/Y41Pp6ioCEwi5y7pQXDy0XE=;
        b=bVlW2/E76FDPrHN2LyNgPy1AVIm8LYnUI12WzJf+VJCQueLKy5SRGbCyYmMXq6NY+w
         Jq8PRz7dyLHys+7nwi/vfHF2gQA/cj0RhgoLLlo5JtYTSx6FNaNVF54Ic7EbFHJQhBzw
         KN30NVsztjTC3CbMDIqTrAQ+c034H/d8fN5Ek353b/vmE1WQAi+1oNs+fOSW/3s4K0X5
         mON6IneDyqR0zfwR0P+cT6ShQyWQUX7X/+DYTXNh/J8H29rqcYrlSqRqzdmUE6JOU649
         HncP1XqM6nOZEGSKa52GqSRDj7IHcOS6y9xhf2nQxK4kAgAXc+w1Up471dtmCvmbyiJI
         PRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717959451; x=1718564251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1RlvMn+8fg+s5nONom/Y41Pp6ioCEwi5y7pQXDy0XE=;
        b=eArLLg8BErSMY8umJf6uc6eWrJJy5+dvnn0PGM5mcw7UcVSyWRJC7adslz21WgGzQl
         VSmdhv9GPCplApqmmmjL5omXXD8x4OkycnwTij0Fd8r3qsxEITbEFw0dAw0hNWQAj3gu
         9B3kgIOy43T89HejbJD4eoZPQ3T6WqyE3Zu/QYDq/py/LDE4nZrmGkDbpIulDLWMrXtb
         C9iHCPq0mxl/iZ4TlgOFpOgSdEbhXDQb3tcqWNCOWxSfYPsF3fYvrg+kDGicS2isc269
         /0Nf+ISWBsOWW2+0nKU70yrdgEaHgLD++nBLr88+MbjQ847Ja66JyXXHQEbkK8E2rg1P
         M3aQ==
X-Gm-Message-State: AOJu0Yzhqiswh2UuioVWDL1L9UCZ2OyxhfJQIRups0joLvMj/8Xo95Q+
	0nYxJqwcHarKHVHjbaWeXIUc1LrRMmw+KmqH6zZrVg7orS2COgRwIpkqsSvb7DPBUxZcwfwf7q0
	35AaC5a5RLXdA5z/tNvbvDD5aa+M=
X-Google-Smtp-Source: AGHT+IH1CLU0b7L+A8q1tlJk1RbzgYwO3/2NwDTsI9OnwFae6SSGkDVk+v8D6ItoOI4AczkW08QE9PYFCKVCD2lU0ro=
X-Received: by 2002:a05:6870:158b:b0:24f:d1bb:993e with SMTP id
 586e51a60fabf-25463efd873mr9288709fac.0.1717959451091; Sun, 09 Jun 2024
 11:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240609184503.3742334-1-f_l_k@t-online.de>
In-Reply-To: <20240609184503.3742334-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Jun 2024 11:57:03 -0700
Message-ID: <CAMKF1so+PK9g1Jr5vmbOM2tm0Ond2-ioP_mZZ2MH+0UpHkXv_g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libgee: downgrade incompatible-pointer-types
 back to warning
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Jun 2024 18:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110784

On Sun, Jun 9, 2024 at 11:44=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> Workaround to fix build with gcc14
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb b/meta-oe/r=
ecipes-devtools/libgee/libgee_0.20.6.bb
> index 0ed6e8235..4f9099ff0 100644
> --- a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
> +++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
> @@ -11,6 +11,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857=
fcd118f065f900982c24"
>  GNOMEBASEBUILDCLASS =3D "autotools"
>  inherit gnomebase vala gobject-introspection
>
> +CFLAGS +=3D "-Wno-incompatible-pointer-types"
> +

Is this in works upstream ? if not it will be good to atleast report it

>  do_configure:prepend() {
>      MACROS=3D"libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversio=
n.m4"
>      for i in ${MACROS}; do
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110783): https://lists.openembedded.org/g/openembedde=
d-devel/message/110783
> Mute This Topic: https://lists.openembedded.org/mt/106580066/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

