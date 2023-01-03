Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D6EC3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 19:15:48 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.2575.1672773342518316334
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 11:15:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JhiEwsMx;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-15085b8a2f7so13112013fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 11:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LZkFv5s5vazpLYUFsICKwmHpSGjfnk2Cf8SrnLfEBwc=;
        b=JhiEwsMxdivk1CAcShIXsHcZW+wh1gPnX1weJ5qfwD9gEzh0w6PHzUFTnvY8oHv+DZ
         auH4xq1b8EYBUSZq2+UGk69Or6UtqiZP8LIXWb681p/wvcLeCA6zwLofyrZN22VEUqfX
         l3JWDz1zMJdPAd6CDdm2k8KkQe/OssO8v5uCW1HT0n2asklqYaKSme1GfvoashFEd9Eu
         q23xPrPSHvvW1PA4w1LRMj8qYgZZI8nRT1yOZqWPAY8Q02NxSAOaI7aSNcH4iYzIavu9
         b6ZJ+MUuzR9GeuZJNqvjO0CPtHYjjMgW6VJh6s059du8aWGP6Vr4qWX3E3WT+18swtS1
         sIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZkFv5s5vazpLYUFsICKwmHpSGjfnk2Cf8SrnLfEBwc=;
        b=klOjZn/Yrgdrd0bi0IgcTsXlTMj4XgBTqQ4h4BkO1wAJQo4Aav+CYdoPeON2SRAbSg
         IoB3uQP9G7549DA6dOEIboFrePWweuz/1vZ3IWgFaoSz89chCZqIU24abkHNK+46ivMT
         KyKu8J1Lb2B6fNHD3lwtwJuCIAWsk+ObOdJ09E+ArvxaEcT4WIE7H26zfHf+fbln2UbJ
         J09hfkalRWPRWMsGgjVPH+5FMbn26qZxQGCOzP0F+qSJVFiwuAlNJmbXSmz7E5Nq7goy
         9hs/TbnPrG0JqoiF8jip8eZkEKfY1DWmqWjTgbhLguHqnglX8N8qMWVHoPFh/IHH/OF1
         iK1w==
X-Gm-Message-State: AFqh2kp7DnfUxbFW8gkOcpGvfrr+D37Yr80fYgOFujNp6kekygRdertl
	MwTmYbF1lyPk5vcPT5/wJ3G4QfjaFDO/yItEHd4=
X-Google-Smtp-Source: AMrXdXscPgGaluY9vwdUGYQGDp+hCSck5/rHr7yQWYkSR9PctLiN8A5sTBtB9pgy5ZL4DWRlRGmr07JoOcSLd5MbM5g=
X-Received: by 2002:a05:6871:4049:b0:150:ab7d:7012 with SMTP id
 ky9-20020a056871404900b00150ab7d7012mr476370oab.55.1672773341643; Tue, 03 Jan
 2023 11:15:41 -0800 (PST)
MIME-Version: 1.0
References: <1672289132-16078-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1672289132-16078-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Jan 2023 11:15:15 -0800
Message-ID: <CAMKF1srpKv47G-RTGA3Dyxm=svyWW+pnXAg9y68t96YJeoWXHg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] appstream: upgrade 0.15.5 -> 0.15.6
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 19:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100369

this fails to build with clang, its stricter checks trip the build

../AppStream-0.15.6/tools/ascli-utils.c
../AppStream-0.15.6/tools/ascli-utils.c:116:23: error: a function
declaration without a prototype is deprecated in all versions of C
[-Werror,-Wstrict-prototypes]
ascli_print_separator ()
                      ^
                       void
../AppStream-0.15.6/tools/ascli-utils.c:174:26: error: a function
declaration without a prototype is deprecated in all versions of C
[-Werror,-Wstrict-prototypes]
ascli_get_output_colored ()
                         ^
                          void
2 errors generated.

 see
https://errors.yoctoproject.org/Errors/Details/686202/

On Mon, Jan 2, 2023 at 7:29 PM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> ==========
> Features:
>  * qt: Add API for ContentRating descriptions and ratingIds
>  * Add some coccinelle semantic patches for common style issues
>  * compose: Allow building without SVG support (for bootstrap only)
>  * validator: Check for nodes that are text nodes even though they shouldn't be
>  * validator: Extend validation for custom tag
>  * validator: Improve Screenshot validation
>
> Specification:
>  * docs: Fix typos in <extends> documentation
>
> Bugfixes:
>  * validator: internat: Don't allow bandwidth_mbitps when value is offline-only
>  * validator: Fix timestamp validation
>  * validator: Allow release descriptions to start with punctuation
>  * compose: Only add no-metainfo tag if component isn't already ignored
>  * compose: Show better error in AscImage if compose was build without rsvg
>  * Add a hack to clarify proper PtrArray element ownership for language bindings
>  * qt: Port away from deprecated QDateTime API
>  * qt: Deprecate Component::requires
>  * qt: Fix warning
>  * qt: Fix stringListToCharArray and Pool::componentsByCategories
>  * qt: Port away from deprecated foreach
>  * as-review: Add a typedef for property enums
>  * as-review: Install properties at once rather than individually
>  * as-review: Specify G_PARAM_STATIC_STRINGS for properties
>  * as-review: Emit GObject::notify on property value changes
>  * as-review: Add missing property for as_review_{get,set}_priority()
>  * ascli: fix NULL pointer dereference
>
> Miscellaneous:
>  * docs: Split releases specification into its own section
>  * style: Make code easier to read by using helper macros in all places
>  * Make some compiler warnings fatal unconditionally
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../appstream/{appstream_0.15.5.bb => appstream_0.15.6.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/appstream/{appstream_0.15.5.bb => appstream_0.15.6.bb} (92%)
>
> diff --git a/meta-oe/recipes-support/appstream/appstream_0.15.5.bb b/meta-oe/recipes-support/appstream/appstream_0.15.6.bb
> similarity index 92%
> rename from meta-oe/recipes-support/appstream/appstream_0.15.5.bb
> rename to meta-oe/recipes-support/appstream/appstream_0.15.6.bb
> index e8637b5ee..d91253bea 100644
> --- a/meta-oe/recipes-support/appstream/appstream_0.15.5.bb
> +++ b/meta-oe/recipes-support/appstream/appstream_0.15.6.bb
> @@ -26,7 +26,7 @@ GIR_MESON_OPTION = ""
>
>  SRC_URI = "https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz"
>  SRC_URI:append:class-target = " file://0001-fix-crosscompile.patch"
> -SRC_URI[sha256sum] = "cb15ed62cc2729683879a2dbf98c0a3267ea2b4d57bba6bc55e70a25500e04c2"
> +SRC_URI[sha256sum] = "23d6c940368b5a6cedf622df3707c0dd8679cf4b0739f7aba13f925c58cdf10e"
>
>  S = "${WORKDIR}/AppStream-${PV}"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100345): https://lists.openembedded.org/g/openembedded-devel/message/100345
> Mute This Topic: https://lists.openembedded.org/mt/96022517/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

