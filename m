Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDB6C369D3
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 07:59:47 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.42810.1745826983672194502
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 00:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RY7HL82A;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso6321108a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 00:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745826982; x=1746431782; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EFewrUDSmlHxcjUy/8dck005MPg9ASN+NvvCN2kin90=;
        b=RY7HL82A0eRXjxgOOzml9xpmdfpjo/KM4hokrLS0FdUyxdedRywEY2jQu9Kz+PGoSb
         3PsoEvdNCWmbyOao1cp+5e4pcOXQE9VO8zzzUuwHFZrRh1kaCtiNnoAss4assp3L7UQS
         YoWuBJJGnKgGRb4J4PywVN7dFGzhPnQd7dMsdlAf+diE9LPuTXn1P6cMgO/brITqraA5
         OKDR31bmaDk8O8vgZpkZARbvX55Ar9/uU7latskjxGICTOv3d3tqcgMx0665K9yPfAg4
         G5HaL/veg3f2WOPy9Bs1vwaDCYvE4rYFJ6l/Mx9bTl6VA4b/+eEAXVfo0yfbeGxlOcTg
         ev3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745826982; x=1746431782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EFewrUDSmlHxcjUy/8dck005MPg9ASN+NvvCN2kin90=;
        b=HocmUXYXA/g3rCJZB/YCGxOMWNw8GfhPcKtz6WY46OEUVlHFxYMFm7kKumYHXOfITL
         yU0oy6BF3m46nVRzkuqI5WPvxPUBcXO7TmQLZO7Rx9mkXXXuLn/6YLQgiUoraeScHsv+
         qZk5OsfnZPhW8qyLks8RUUa2VTT6Vuskbk7EfOoDNB4A+e1aI3wPj8eOLwNlYcsJJW7X
         H0CddKtwURo+1bHhiHw9K/djLjIyutSIByrZ31pSkdVxOwuLhIeVfWA19xgIKbM8/1Kw
         3nDVvp5q/JapX1pPhS3qYbbcQT2eeN1mFqyIW/bvMoQupzVMGLJjO5On5yf8R9dRmYfM
         t5vg==
X-Forwarded-Encrypted: i=1; AJvYcCWtW9XM07ivXWCfPJz+HKFZ04PKlV/0nZrWqUg9F6UZbaz3Rz+y68QZr8KCox0JSe+GXE3kcj4PXnpYiVtvyg3E6NU=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzng02aMs9aWSGDyOH7ijm8BeUAfx9k3g+C7N2PDmvmPobJooSa
	C6+9mic4TtLTRRcMk7w7kZ9k6th4VSIiRAtzgHrs/b+EHrtOuEqr
X-Gm-Gg: ASbGncuI2OMxAF2/DvyYNQEwTrIjgzA8gX+VgmQZ1k8d3it2Nk2oeHjKrqEtZzYxM3R
	neeAn/lmXc9xZoWKHOCK+NQ+MRIpiw8MWX+qvuVCxYzY1lmn2PHiHxAhDqF0mVKAiHVvtNj54wm
	aOJm+k9sv/deEwOU9klazz0cMpNjnqJ0EfwmwrNQHvG4/EhQy6Kj4p4iBZXXUAlsIi+Fr9qmhHF
	/V9nJTsdFc+ZJ2Wmv8N+ZSa4zG05u+XIILtVLy/LpJ6nGkz7a02Lfn+67R6w06VxqCFxwk4FNez
	tJh1S27MLI+DB/LH9jjFtdVwgxu7B6C9ZJtrJWfEyLt911VC
X-Google-Smtp-Source: AGHT+IGXTmjMM96QpfhUL8ucMuHjblS/B5GCD+CYeRZi42MvkbXcMiYtV+zMS0K4xjjSxk3cm4WuPg==
X-Received: by 2002:a17:907:1c96:b0:ac7:391a:e2d3 with SMTP id a640c23a62f3a-ace713fe0fbmr976574666b.58.1745826981609;
        Mon, 28 Apr 2025 00:56:21 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7035464f1sm5401590a12.62.2025.04.28.00.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 00:56:20 -0700 (PDT)
Message-ID: <570e3112-1eb8-443e-9a96-97dab147c8dd@gmail.com>
Date: Mon, 28 Apr 2025 09:56:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] testdisk: add recipe
To: wen.yang@linux.dev, openembedded-devel@lists.openembedded.org
References: <20250427152746.8099-1-wen.yang@linux.dev>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250427152746.8099-1-wen.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Apr 2025 07:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117189

It looks like this recipe was created with/for an old version of Yocto.
Could you please prepare it for master branch?
I have added some comments inline.

On 4/27/25 17:27, Wen Yang via lists.openembedded.org wrote:
> testdisk is a free data recovery software primarily designed to help
> recover lost partitions and/or make non-booting disks bootable again
> when these symptoms are caused by faulty software.
>
> Signed-off-by: Wen Yang <wen.yang@linux.dev>
> ---
>  .../recipes-support/testdisk/testdisk_7.2.bb  | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-oe/recipes-support/testdisk/testdisk_7.2.bb
>
> diff --git a/meta-oe/recipes-support/testdisk/testdisk_7.2.bb b/meta-oe/recipes-support/testdisk/testdisk_7.2.bb
> new file mode 100644
> index 0000000000..64e3d612c1
> --- /dev/null
> +++ b/meta-oe/recipes-support/testdisk/testdisk_7.2.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "TestDisk is a free data recovery software primarily designed to help recover lost partitions and/or make non-booting disks bootable again when these symptoms are caused by faulty software, certain types of viruses or human error (such as accidentally deleting your Partition Table)."
> +LICENSE = "GPLv2"
This LICENSE value is deprecated. Please use spdx identifiers if
possible/applicable, like GPL-2.0-only or GPL-2.0-or-later
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +PR = "r1"
Is PR needed in this recipe?
> +
> +DEPENDS = "jpeg ncurses e2fsprogs"
> +
> +SRC_URI = "https://github.com/cgsecurity/testdisk/archive/refs/tags/v7.2.tar.gz"
Archived tags in Github are unfortunately not immutable, so their use is
discouraged (and it also throws a fatal QA check). It is preferred to
use the direct commit ID.
> +S = "${WORKDIR}/testdisk-7.2"
> +
> +inherit autotools pkgconfig
> +
> +PACKAGES =+ "photorec"
It is recommended to prepend the extra packages' names with the main
recipe name, like ${PN}-photorec
> +
> +DESCRIPTION_photorec = "Photorec is file data recovery software designed to recover lost files including video, documents and archives from Hard Disks and CDRom and lost pictures (Photo Recovery) from digital camera memory."
> +FILES_photorec = "${sbindir}/photorec"
The underscore override syntax has changed to ":".
> +
> +SRC_URI[md5sum] = "c47d69e2c950b6b2f0dadb2a2921d6c6"
> +SRC_URI[sha256sum] = "f3fe7ec02cafcbe792a4c783976de3a6312963b0ce8a613d38adbcd8bdca0517"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117176): https://lists.openembedded.org/g/openembedded-devel/message/117176
> Mute This Topic: https://lists.openembedded.org/mt/112489401/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


