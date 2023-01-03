Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55056C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 06:14:49 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.58100.1672726486684447624
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Jan 2023 22:14:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FXyYRfqY;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id m4so31618386pls.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Jan 2023 22:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lnx21NHWUk11rvzJ9MZRSXLFQYXUBgAI/o1S8zctCk4=;
        b=FXyYRfqYjElbBVlaTSp79TES8Kps8Et48ztjgatueUQNf3SYV+SUFDyi0uvHinP9/B
         VPmKZdxrK7m57eVR/aFjJVMxnf5gutb5IRWRolYysMq5rrTSRaTupnVzxamD7hgnfktl
         bN/fgNlN3sLZdz0q6HzlhvyutYwYe04B1hJNwTRXbIiA+YjHMmNrIjnpFtYhsqgpK1xp
         vLG8rdxlXSvV7k9sLJ9pSO34v/pmVO4Q+sNrNhM2+xSBAqNT7IrKHlpC2hayJdjuyU22
         2sYRpqTvux6q2Tfn/N6RCUvw875h/MFe4psMDoWKE8zMPaC4qZqiggHgYf+40XYZewD6
         YjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lnx21NHWUk11rvzJ9MZRSXLFQYXUBgAI/o1S8zctCk4=;
        b=yXnx/h3aFbiqzXfwMfpHMvMEkY6bgKgss4/8/1EZWchN7sr3ogVk4Ytm8FCHUI1bvV
         dT0ppc9SBf9llvu6GIz3H9INZOGZSm6I79kAh9p45SfXIDPD012IlKVkh4hn2/FZEfON
         M066SOMEtOB17gWHG00aaBnhV5IZhENBaXUtBbibhBpb4x4DXqcMDNk/q8LhTmKPpt2d
         G8elrrsOuaUN41ND9rg8P14sjkpKvWRGT5PESnjR2yl32ijbfZ9owhL0ndgtDadzAfOC
         WdSFzVxTlvssYa1VQ5U0fdCfO/Y1DF4OcZ5wMtsWEh25tK2mFlVjaDomzAFkt3zSk3Tr
         j/sg==
X-Gm-Message-State: AFqh2krEoRWRFUdo7if7X3ixIo1Ne5X0/BEjOOD9nWk0+TYCBrOjMUC0
	wvPYGw9uZlM9ms6e32q40R4vyH9R/Mg=
X-Google-Smtp-Source: AMrXdXvPp5QW6XmD/SAGhV+1GHhco/HCoSgFTqHU6EjPFo7yEm2ph04hw8VGCKwKsSM6gyyUXmUKUw==
X-Received: by 2002:a17:902:aa8f:b0:189:e55d:ec72 with SMTP id d15-20020a170902aa8f00b00189e55dec72mr43035293plr.20.1672726485583;
        Mon, 02 Jan 2023 22:14:45 -0800 (PST)
Received: from ?IPV6:2601:646:9181:1cf0::1cae? ([2601:646:9181:1cf0::1cae])
        by smtp.gmail.com with ESMTPSA id o33-20020a635a21000000b00478bd458bdfsm11272924pgb.88.2023.01.02.22.14.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 22:14:45 -0800 (PST)
Message-ID: <bf996d25-a93a-5f7e-a416-1299f3eda397@gmail.com>
Date: Mon, 2 Jan 2023 22:14:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [oe] [meta-oe] [PATCH] appstream: upgrade 0.15.5 -> 0.15.6
To: openembedded-devel@lists.openembedded.org
References: <1672289132-16078-1-git-send-email-wangmy@fujitsu.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <1672289132-16078-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 06:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100356

thanks for patches, your system clock is out of sync again which 
confuses patchwork flow for me. Please fix it.

On 12/28/22 20:45, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> ==========
> Features:
>   * qt: Add API for ContentRating descriptions and ratingIds
>   * Add some coccinelle semantic patches for common style issues
>   * compose: Allow building without SVG support (for bootstrap only)
>   * validator: Check for nodes that are text nodes even though they shouldn't be
>   * validator: Extend validation for custom tag
>   * validator: Improve Screenshot validation
> 
> Specification:
>   * docs: Fix typos in <extends> documentation
> 
> Bugfixes:
>   * validator: internat: Don't allow bandwidth_mbitps when value is offline-only
>   * validator: Fix timestamp validation
>   * validator: Allow release descriptions to start with punctuation
>   * compose: Only add no-metainfo tag if component isn't already ignored
>   * compose: Show better error in AscImage if compose was build without rsvg
>   * Add a hack to clarify proper PtrArray element ownership for language bindings
>   * qt: Port away from deprecated QDateTime API
>   * qt: Deprecate Component::requires
>   * qt: Fix warning
>   * qt: Fix stringListToCharArray and Pool::componentsByCategories
>   * qt: Port away from deprecated foreach
>   * as-review: Add a typedef for property enums
>   * as-review: Install properties at once rather than individually
>   * as-review: Specify G_PARAM_STATIC_STRINGS for properties
>   * as-review: Emit GObject::notify on property value changes
>   * as-review: Add missing property for as_review_{get,set}_priority()
>   * ascli: fix NULL pointer dereference
> 
> Miscellaneous:
>   * docs: Split releases specification into its own section
>   * style: Make code easier to read by using helper macros in all places
>   * Make some compiler warnings fatal unconditionally
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   .../appstream/{appstream_0.15.5.bb => appstream_0.15.6.bb}      | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-support/appstream/{appstream_0.15.5.bb => appstream_0.15.6.bb} (92%)
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
>   SRC_URI = "https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz"
>   SRC_URI:append:class-target = " file://0001-fix-crosscompile.patch"
> -SRC_URI[sha256sum] = "cb15ed62cc2729683879a2dbf98c0a3267ea2b4d57bba6bc55e70a25500e04c2"
> +SRC_URI[sha256sum] = "23d6c940368b5a6cedf622df3707c0dd8679cf4b0739f7aba13f925c58cdf10e"
>   
>   S = "${WORKDIR}/AppStream-${PV}"
>   
> 
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

