Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D209C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 04:46:00 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.24390.1683607555533519221
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 21:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TWxSj30w;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-38ea3f8e413so2780540b6e.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 21:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683607555; x=1686199555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+ur1c3KxG0bmY3If3qaMuoA4bFxUzasRPg5aA4OLGE=;
        b=TWxSj30wcuvMBMPVR9bpEQdQr+SVUW+J/nu1WsjbaYLFOuLpbA5gvFYop3ChLM9qjA
         QNoZHYTPTTbCYHC1Yw35ob5Dgs6wr+6iqeDPHYimxQJUN7a9lvEAY4sfONsKbzgLokmE
         g7lqU0Gx5s9X1OLqCxYUH07g4I333DujOijokxqfZIABr+wPDVWphsCAGlu35eJnzTxf
         lIcL1fVkeImAu3O+tJotV4bFL8CucpU4Nuo6pL2n6Fjh7uksmZBtzUAvi2RT7bpvWpRc
         CKzQWwIJ1au+VJZ50mU+0fHplRcjz4/chWha6NzMyFOHFYf7aTX4twUYbap1wE1UBusx
         k3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683607555; x=1686199555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+ur1c3KxG0bmY3If3qaMuoA4bFxUzasRPg5aA4OLGE=;
        b=jj5qXh/xG9OCj317Mi74uQohOw1NMtcWDLzrcIYk2Jc06WH6S9E5z7soCRSImVaDQe
         WAiqDtHy2IUpm7wc3LgGF2HrMswyzvxBnYv7nwFeWP69LovvMSaHWAfgk2DwVnasZGHr
         XGK2fLOHIXNWx/I+6q6PwsRgaFs0fYu+RxV2ZecMJ8LiFumPhNW8Tj/L8CxbfaIv4O5S
         6Kdj06elHc+qzKdZyEKkYF6rrzZMF13TTPllh+PlNhbMPjKNoI6J9EdhCthNW2ZnrivQ
         cvVF3S3O37nHdywrrBmHqSS9QTF+JiYZnfio0j3ViqnZTF8g5KHLiM4/qzLtrQfKqD9b
         7Paw==
X-Gm-Message-State: AC+VfDwGELuINLQ2QSAZOFg+Z6ZnYpeFA17rSLiUfc1b/NZ13v+bN0Gk
	3Wb/SySWiz7QBGwxNAyb0GeUhZMYEa4FlF0j1CA=
X-Google-Smtp-Source: ACHHUZ6BS7CT6FdkGi77sc/7MgTNxls3En15uOgpKprsh/dDXGbEORAniFlp9WIV0P7mh46EKjsvsHryWtGfHDk4Hnk=
X-Received: by 2002:a05:6808:404b:b0:389:1274:be46 with SMTP id
 cz11-20020a056808404b00b003891274be46mr747897oib.19.1683607554595; Mon, 08
 May 2023 21:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <1683540471-25268-1-git-send-email-wangmy@fujitsu.com> <1683540471-25268-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1683540471-25268-3-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 May 2023 21:45:28 -0700
Message-ID: <CAMKF1srpDzE0zSHChu1dSZC=S6jASo7-NsnO5jEUepsWyzw88g@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] libplist: upgrade 2.2.0 -> 2.3.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 04:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102463

In order to get this patch through we need to fix
libimobiledevice-glue recipe as well. See the error below

https://errors.yoctoproject.org/Errors/Details/703594/

also while you are at it, we have duplicate recipes for libplist,
please merge them into one if possible

see meta-oe/recipes-extended/libimobiledevice/libplist_git.bb and
libplist_2.2.0.bb

On Mon, May 8, 2023 at 3:08=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Changes:
>   * Rename PLIST_UINT to PLIST_INT and add plist_new_int() and plist_get_=
int_val()
>   * Add support for JSON format
>   * Add support for OpenStep format
>   * Introduce error codes and format constants
>   * Add return value to import/export functions to allow returning error =
codes
>   * Add new plist_sort function
>   * Add several human-readable output-only formats
>   * Add new plist_write_to_string/_stream/_file functions
>   * Add new plist_print function
>   * Add new plist_read_from_file function
>   * Add new plist_mem_free() function
>   * Add a few C++ methods
>   * Add C++ interface test
>   * Add PLIST_NULL type
>   * Some code housekeeping (mostly clang-tidy)
> - Breaking:
>   * plist_from_memory() gets additional parameter
> - Bugfixes:
>   * Fix multiple bugs in all of the parsers
>   * Fix handling of PLIST_UID nodes
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta-oe/recipes-extended/libimobiledevice/libplist_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb b/=
meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> index 82f3e4d0c9..8f5a7f166f 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> @@ -8,9 +8,9 @@ DEPENDS =3D "libxml2 glib-2.0 swig python3"
>
>  inherit autotools pkgconfig python3native python3targetconfig
>
> -PV =3D "2.2.0+git${SRCPV}"
> +PV =3D "2.3.0"
>
> -SRCREV =3D "db93bae96d64140230ad050061632531644c46ad"
> +SRCREV =3D "72480212cd8ec0ab8d0b5064df52c146cac603b4"
>  SRC_URI =3D "git://github.com/libimobiledevice/libplist;protocol=3Dhttps=
;branch=3Dmaster"
>
>  S =3D "${WORKDIR}/git"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102397): https://lists.openembedded.org/g/openembedde=
d-devel/message/102397
> Mute This Topic: https://lists.openembedded.org/mt/98757857/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

