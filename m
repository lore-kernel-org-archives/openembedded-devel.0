Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8F97260110
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 05:18:39 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id f6-v6so6440812plo.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Aug 2018 22:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Mmo09nIbTVuUI5fa/6W9xLIYhq/p/77SF+nqtoJhQ74=;
	b=nA6MDpihe5RVIkejmggHJq/fw/zT2F/3kND7vbyMHe2cA/i4MvNt0C/R5XUJWfsnCn
	PSRLfTrJ/YmXjhGOfJmOI4BRGE/KCP31TsUuxXYEWkkHchXEZG7lAadx3cGxQlxim6Jx
	yE12GYMmUzNBBHxytMskuASsvUJYgAxuRH5bH8PxiYU2U283vOOzHmUxllo5Q7FZbo4F
	EzKNvpQ6+sASNDuj8hqkF/bH8ZmDMbvrvf/DUOfww9WU5zuFzvvCBCw+101/y3qMCi6R
	mabYGEHJ0MIdap2dAHcDdxtsJZsSYlrkwyDl3oK44drRnVr+Y7WRrVLw+8pw2gzyRl+Y
	xQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Mmo09nIbTVuUI5fa/6W9xLIYhq/p/77SF+nqtoJhQ74=;
	b=moZc2JVIE8dDQ1952H5+1kd20OJSeWLrdT/eJEF8WAlMMkeBxu4UtAgwqkAJAkOhnB
	iy49J7/Ce3G1EjacPHr5jqcPIB8asqD8y82+42l3FXR2/Kr/kyvTdXgSCewBOn0DBGHA
	I5y+vKH9zuWlCgfqTejcFcihRm2NLLmkFBgrklBEEBIh5YYcqvWxnUEf8zBjfdzGH9yB
	bfKjo9/+VbbdEaL6cKacy829rmdauOJJbyWUdDoI5kgsuAPhFU9+Cdo97N1CUPDU6WCJ
	9kzYpwDn7oH8MJD6A3W9aUr6NOvDdsoPK5Fauw0AmDjHQt4pxfav5gAaCPFLG7Ld3lYY
	y/gQ==
X-Gm-Message-State: AOUpUlHimDB3caxUsXLWX1EF3SAHV7LzWfSWhrXGiroCVvsnZbSHwB0c
	NQLi6BsglQgWHdsY6NMkuIW8N5Hs
X-Google-Smtp-Source: AA+uWPw8T7kdkBOxhNhEoxp8aoqiH75Ws0OfrnzpWR+jEGgVZkCG8Zew+Pl4aWbHkV7nfsMwfN6pFw==
X-Received: by 2002:a17:902:143:: with SMTP id
	61-v6mr15131592plb.171.1534137520634; 
	Sun, 12 Aug 2018 22:18:40 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:9ca4:2778:861f:6bc?
	([2601:202:4180:c33:9ca4:2778:861f:6bc])
	by smtp.gmail.com with ESMTPSA id
	n9-v6sm28063800pfg.21.2018.08.12.22.18.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Aug 2018 22:18:40 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180811145827.11578-1-Martin.Jansa@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d4e8fb83-a13f-41fc-a48d-f0c64674580e@gmail.com>
Date: Sun, 12 Aug 2018 22:18:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180811145827.11578-1-Martin.Jansa@gmail.com>
Subject: Re: [meta-oe][PATCH] android-tools: fix build with glibc-2.28
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Aug 2018 05:18:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/11/2018 07:58 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...sb_linux.c-fix-build-with-glibc-2.28.patch | 24 +++++++++++++++++++
>  .../android-tools/android-tools_5.1.1.r37.bb  |  1 +
>  2 files changed, 25 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/0001-usb_linux.c-fix-build-with-glibc-2.28.patch
>
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/0001-usb_linux.c-fix-build-with-glibc-2.28.patch b/meta-oe/recipes-devtools/android-tools/android-tools/0001-usb_linux.c-fix-build-with-glibc-2.28.patch
> new file mode 100644
> index 0000000000..15401d1524
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools/0001-usb_linux.c-fix-build-with-glibc-2.28.patch
> @@ -0,0 +1,24 @@
> +From cb80906bd3869bba370a088e4634ae4a8093fdd8 Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <Martin.Jansa@gmail.com>
> +Date: Sat, 11 Aug 2018 13:23:37 +0000
> +Subject: [PATCH] usb_linux.c: fix build with glibc-2.28
> +
> +* include sysmacros for major, minor
Shouldn't this also have "Upstream-Status" ?

> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + adb/usb_linux.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/adb/usb_linux.c b/adb/usb_linux.c
> +index f16bdd036..c8a773244 100644
> +--- a/adb/usb_linux.c
> ++++ b/adb/usb_linux.c
> +@@ -22,6 +22,7 @@
> + #include <sys/ioctl.h>
> + #include <sys/types.h>
> + #include <sys/time.h>
> ++#include <sys/sysmacros.h>
> + #include <dirent.h>
> + #include <fcntl.h>
> + #include <errno.h>
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> index 780ecaa11a..a85e8b6652 100644
> --- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> @@ -47,6 +47,7 @@ SRC_URI = " \
>      file://ext4_utils.mk;subdir=${BPN} \
>      file://fastboot.mk;subdir=${BPN} \
>      file://mkbootimg.mk;subdir=${BPN} \
> +    file://0001-usb_linux.c-fix-build-with-glibc-2.28.patch;patchdir=system/core \
>  "
>  
>  S = "${WORKDIR}/git"


