Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2238C43219
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 22:32:55 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web08.1523.1646087575119721000
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:32:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jzIC6bsI;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id d3so15137872qvb.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wJGaz3UXg8ULn2hYw2dB0/jjLMb9YIU2/MxyJALh02k=;
        b=jzIC6bsI8wRZ1vt7Sklw+COmScImljKkhKzwe9WZgtH4HJI73YIwJ9Unoa7GYPCILd
         kAlZLYmibZeg9KJd7mUisXdTlw+g62d4axYpxh35Tbidn74GnUYBXLc2T9h1PYGp9DhZ
         Jnqwcq/YIqaJn/wZyq9duYX4w9QyZJPGFkMHbxRsonnqGuqeu3jboW62ozvKJ5lJIpey
         pWTCDE2r0zdQFFOia1iD7vaQHZb9wsqyT1YTw6uSk31gU7N/XnwLqIdMbPyXLDI4lAKt
         Pgz08p8SoZKyEeWVytkXODd3FVhIGYphuawrrnKaYeRK/BfnPM9nBdAS+BBHpey7hhhx
         yt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wJGaz3UXg8ULn2hYw2dB0/jjLMb9YIU2/MxyJALh02k=;
        b=K76rNjf+Ph3vY2YkyydzbvxsDGbAgqr+LK6/71KUrvjy0gJeHdftjlWRZksCxbiMq6
         Be3xDKEk4KmeHiXDhaTSmql5lwNU6/XgUMCZBj8V5e7dm2OqSIq4hCJZqxgxgRHi59bH
         SlNyfvPbXCxnXoSRxmxwzLkWiFo712EMh1qarmS6u1vUyLezlRxi6RukAsZA6ac1O4Af
         9W+6BGsvzd5f8iuBoo9OX/vCAaRY0ZiqZkaDZ0vEGPxMIYTUzJXe/YfhWp4PoGVPzsMm
         2tcCHOP9GjtOEzpd1/IOOGTgcSOHKt3TsMolj2l4HKDeR13gvQNTwA2BZ53cEe1hVLyD
         G81A==
X-Gm-Message-State: AOAM531+51z9X7hZDZgokf9YfwwjxVU/cJvk8sDrmhcCJrEjyf84C0Lb
	H+yqazBlZdfu3fzkbXoHRlV6oAxsMmL9AQZ3FJo=
X-Google-Smtp-Source: 
 ABdhPJynHPCPflAfczF6WWs10EQoxS0kcvy5ILjvYWJRCh3YYFps5zzdTi2HhN42ucjT37ZgeK8L/miA70HfdX6J2UU=
X-Received: by 2002:ad4:596b:0:b0:434:ea08:d2ee with SMTP id
 eq11-20020ad4596b000000b00434ea08d2eemr1209054qvb.24.1646087574104; Mon, 28
 Feb 2022 14:32:54 -0800 (PST)
MIME-Version: 1.0
References: <20220228222206.25716-1-jsbronder@cold-front.org>
In-Reply-To: <20220228222206.25716-1-jsbronder@cold-front.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Feb 2022 14:32:27 -0800
Message-ID: 
 <CAMKF1sppTUJmQQ0QgfE0j3i7ZqRAATPLA+2o3sKy1_Cd_3d51g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-configobj: drop recipe
To: Justin Bronder <jsbronder@cold-front.org>,
 Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 22:32:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95602

Thanks for looking into this, Armin added this recipe in 2020, I would
like to hear from him as well on what this recipe's future plans are.

On Mon, Feb 28, 2022 at 2:22 PM Justin Bronder <jsbronder@cold-front.org> wrote:
>
> The last official release, 5.0.6 is from 2014 and does not build with
> bdist_wheel.  The upstream repository does appear active but it's
> unclear if anyone has the ability/motivation to tag a new release or
> upload it to PyPI.  If you depend upon this recipe, please work with
> upstream to tag a PEP-517 compliant release.
>
> https://github.com/DiffSK/configobj/issues/160
> https://github.com/DiffSK/configobj/issues/197
> https://github.com/DiffSK/configobj/issues/204
>
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> ---
>  .../packagegroups/packagegroup-meta-python.bb            | 1 -
>  .../recipes-devtools/python/python3-configobj_5.0.6.bb   | 9 ---------
>  2 files changed, 10 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index dbfa991ebe..6b10913657 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -81,7 +81,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
>      python3-colorlog \
>      python3-colorzero \
>      python3-configargparse \
> -    python3-configobj \
>      python3-configparser \
>      python3-configshell-fb \
>      python3-constantly \
> diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
> deleted file mode 100644
> index 1b85368105..0000000000
> --- a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -SUMMARY = "Config file reading, writing and validation."
> -SECTION = "devel/python"
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://configobj.py;md5=a7c3968dd866dfd23e91e125b669ab21"
> -
> -PYPI_PACKAGE = "configobj"
> -SRC_URI[sha256sum] = "a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902"
> -
> -inherit pypi setuptools3
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95601): https://lists.openembedded.org/g/openembedded-devel/message/95601
> Mute This Topic: https://lists.openembedded.org/mt/89462996/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

