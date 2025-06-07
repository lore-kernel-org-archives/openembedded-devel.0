Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51C9C5B543
	for <webhook@archiver.kernel.org>; Sat,  7 Jun 2025 15:05:31 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.20184.1749308723993367199
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Jun 2025 08:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CRJsJX/x;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ade48b24c97so46082566b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Jun 2025 08:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749308722; x=1749913522; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=phpIS9Q+DENPtgLEjoQsnhDsu+wM6N+8+cp/u/BAdxw=;
        b=CRJsJX/xXPIp79s3+gjUwKxH/M/lkUDTUpC0WdREptZqZoQECIimOrCv3kLcsdw913
         zIuVy3l/olo3KEpSBfF46mrTdvUlAfznDsLsUGjXQNyzNFpnk5GJZjK/w7AqXvb37xBj
         xYzZBb8fEHeBAs+Y21uaD51aJ8YBXjuMcf8cLy1+zWxJHp7cB/dfYKIFeBI7VpvGcFRv
         0qIhzNBCLRB3YUYxRCn+VgkavTTiAvdlFEy+xym09rSERfmvxJHrc7yWhFIZiCvb8yn9
         Hy/wes9aKTURY/7xEeLUuyGn3DeH80CPeIpiX4OfvOkzFlZ6UgZ5xmIB/NiCKKfbVfCT
         6MCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749308722; x=1749913522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phpIS9Q+DENPtgLEjoQsnhDsu+wM6N+8+cp/u/BAdxw=;
        b=HaPjl9xyTrnfdvpEJRSzM+C84Y7pIWW1NpzHHwbl9rluZ4rF4bkr6RjOZD+TLTTmPb
         2VL8yt+A4mi4Y3D07H9NfXbvllvMwWHIZRqoMcO4huVk776wEG5yMRYwWvJ5G/l2FPk2
         oT4Ft3AyXxKy9csmBWfmiAjrxsQIxOdEHayLZGz7O8mALC2thvvq6e2nmTMsagC1X0Rf
         4kC99JU4Jk1/JI3T41yUJIohnkGfyQ3c/+ZwF5jyax+n/eH3FtT884HjEmsjf6QZYBxS
         9h+1sp9mox1UNl8Ozp9u1bo2lrvW4ixOa9rguIuh7VnITqJr3TjY0TjI5cYdz4vMvvAs
         AYMw==
X-Forwarded-Encrypted: i=1; AJvYcCWW/mlMaCcfu+LxVeQDgp/TUV7IjnG/DSEZnaqXiimyanS1hV2sNPSjCV0aR5g0JgNLv42u2NG2Aep25mQFh40e2L0=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx7cZfhOe1BIR73tKoZ2eSj+7kdBUT+n6T8dkLs/hzJoAG7Iy64
	dKMEZWRfdVYKxI+v7QeilFT/skN0+D0saep5lnMXJ3Kll0A/6zvWF22M
X-Gm-Gg: ASbGncsMFbwGk2KZgGCgqNvGw6edzfd1Q/+crCkP6I2M6s3FqgGjzTRH8KZAsUmlb97
	t5hEWznfqP8WBGF2YzIZuj3LPZVptAZivE1/tHlkUcig3zaUb+gMr8kye5+xJ9x8chrEodjTtZ+
	BTSmzHAQWd/TC/dqidk7DPOiENg5LkRVDlLsuTmvy9G1sdUL5bDV7bT54A4fTog/NSo57BGRqKM
	EVFMRyRo2gm5PRMzKSa7KQIIrMkVn+SPbzLhSKJUYvND4XcT3pwihw68+PxU25NfF+L3024Dvz6
	haP9/S2p6ANVylPaS3z+FpZeC4VB6K2+kbCJOBQLtMq1NrzWpRyHNgbgoLVMrWK9ROeInw==
X-Google-Smtp-Source: AGHT+IHYxw2vlVvY6rVagRUNfVrt1Iq+hcFHx6eAwJtr1IQdbHwZoCKuDSiEDvyyFfkjGoK39ie4iA==
X-Received: by 2002:a17:907:9726:b0:ade:422d:3168 with SMTP id a640c23a62f3a-ade422d3629mr195324566b.37.1749308722027;
        Sat, 07 Jun 2025 08:05:22 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc383aasm280671666b.122.2025.06.07.08.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 08:05:21 -0700 (PDT)
Message-ID: <15cf89e9-1230-406a-9bb1-f9189cdfc20c@gmail.com>
Date: Sat, 7 Jun 2025 17:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-multimedia][PATCH] libheif: update 1.19.5 -> 1.19.8
To: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
References: <20250607145824.3452805-1-f_l_k@t-online.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250607145824.3452805-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Jun 2025 15:05:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117774

On 6/7/25 16:58, Markus Volk via lists.openembedded.org wrote:
> COPYING was changed
> [https://github.com/strukturag/libheif/commit/377a957bd84018f4d27588c989fa5c66935c16ed]
I think you might have forgotten updating the license checksum in the
recipe (unless it's a hash collision)

>
> 1.19.8
>
> Set essential flag for transformative properties as required by MIAF. This fixes the display of AVIF images with transformations encoded by libheif in Chrome, which checks whether this flag is set.
> If the environment variable LIBHEIF_SECURITY_LIMITS is set to OFF, libheif will not check any security limits. This can be used if a user wants to work with large images that were blocked by the security limits, but the application software does not allow to adjust the libheif security limits.
> Resolved processing 16-bit JPEG-2000
>
> 1.19.7
> Fixes a build error with SVT-AV1 encoder plugin when using reduced symbol visibility (#1480).
>
> 1.19.6
> Bugfix release.
>
> Additionally, there are the following changes:
>
> C++ and Go wrapper licenses have been changed to MIT
> supports SVT-AV1 v3.0.0 encoder
> support emscripten builds for ES6 modules
>
> Fixes
>
> CVE-2025-43966
> CVE-2025-43967
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../libheif/{libheif_1.19.5.bb => libheif_1.19.8.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-multimedia/recipes-multimedia/libheif/{libheif_1.19.5.bb => libheif_1.19.8.bb} (96%)
>
> diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
> similarity index 96%
> rename from meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
> rename to meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
> index e024ff0f60..6ecda99557 100644
> --- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
> +++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
> @@ -9,7 +9,7 @@ COMPATIBLE_MACHINE:powerpc64le = "null"
>  SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master"
>  
>  S = "${WORKDIR}/git"
> -SRCREV = "cd95b113d78d0696105a9e678cbd19487ee13d6c"
> +SRCREV = "5e9deb19fe6b3768af0bb8e9e5e8438b15171bf3"
>  
>  inherit cmake pkgconfig
>  
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117773): https://lists.openembedded.org/g/openembedded-devel/message/117773
> Mute This Topic: https://lists.openembedded.org/mt/113520958/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


