Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9C6567826B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Aug 2017 14:41:45 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id u133so13952186vke.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Aug 2017 07:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qFbIf3u+1mx0W54ELzGaVyHXhbXHh0hIXNJa84oBftY=;
	b=aUKM1wDpQr39UYehftGXyMUjzgr4dQKnhCn+zoOjGGzaPyUYGgspMqds7okmnPlvkc
	9aXzPDyeLj68PmLNSRW3lPq3LV5FMZhdhWFRa3744uk2/4xJXySs56Yn0r9RMb9K4LC8
	i2kSG7FNkhxp4Kdr4KSpa2Q/eGJKV4uget59T3D5JlExW9SkOQLBzxT5rv3Jv/zWobf/
	uDE+7/gnXSgx1AL8mbM7Y9ZtJSeYRtw5WdglNuI2PlqSlwjs4Hm0zAC/WTmuEsY0FY1k
	zKhB0eeAljPapraWMNRa5dbh052m18IqlADUsobZRtcvtxLER1bAR7dbkC1sa/r3ATxm
	gCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qFbIf3u+1mx0W54ELzGaVyHXhbXHh0hIXNJa84oBftY=;
	b=R+HZS4Na2ksWeG5kAxVamynowtWtqmEhZYcf3pCwfZlHd5X/Q5yBggJ+4l8B0Jhznu
	7n4PBb2LcjgaFx1JmmstljkrSZ007VrM8pKp5PYmwRjzPKi/nDMTFZ0K3okCp5G6xl6C
	w/S4uALcdJfRcRyrTdjZxt5k20oV4BO+WLfU4tEMEs71KFgQf4CAnXJMKQpC/MjbsXcb
	aR4+w6SVcLsoAsbY1SEkbtiTRLQKw5R0QMJarGDCUFCd3Nhv3Ur6V8Ii1I06CHBdYAOH
	5lBKLZbikqTjhDJk9w6OHIYYkP2us7UhKpY242QKqQvsPY/LBjTUU2y7UKxYWLGzIzmQ
	PZfg==
X-Gm-Message-State: AHYfb5hKQiwtbFpBlkIjM1VisQUGuJdeGdUYYu8WJ1aeIkAC8+GKiyq7
	6NgdBxJOnUsZk/Jh0iEvmRJfI6BzTg==
X-Received: by 10.31.181.85 with SMTP id e82mr9111992vkf.168.1502462506578;
	Fri, 11 Aug 2017 07:41:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Fri, 11 Aug 2017 07:41:46 -0700 (PDT)
In-Reply-To: <1502313179-15602-1-git-send-email-Randy.MacLeod@windriver.com>
References: <1502313179-15602-1-git-send-email-Randy.MacLeod@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 11 Aug 2017 16:41:46 +0200
Message-ID: <CA+chaQd5FxfZrpukAAsgxVsHjH6a-P6_sQ==gwJ3K8B6TO-5CQ@mail.gmail.com>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] imagemagick: upgrade from 7.0.6p4 to 7.0.6p5
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
X-List-Received-Date: Fri, 11 Aug 2017 14:41:45 -0000
Content-Type: text/plain; charset="UTF-8"

I've squashed this into previous imagemagick upgrade, but it's gone already
again:
http://errors.yoctoproject.org/Errors/Details/150328/

There is only 7.0.6-6 now.

On Wed, Aug 9, 2017 at 11:12 PM, Randy MacLeod <Randy.MacLeod@windriver.com>
wrote:

> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb
> b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb
> index 6f967c3..810df03 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb
> @@ -8,11 +8,11 @@ DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw
> freetype"
>  # Important note: tarballs for all patchsets within a version are deleted
> when
>  # a new pachset is created. To avoid multiple patches for each patchset,
> try to
>  # update to the last pachset of a version
> -PATCHSET = "4"
> +PATCHSET = "5"
>  SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-
> ${PV}-${PATCHSET}.tar.xz \
>  "
> -SRC_URI[md5sum] = "079a857268536862148b00efcf3ad75a"
> -SRC_URI[sha256sum] = "5fe1ce7d78befb5c8aa7f8ae69710d
> 0f78063d2e3a35c656521a3ce468ea733b"
> +SRC_URI[md5sum] = "15aad6a92d62770f476fcb97c7ad0d0c"
> +SRC_URI[sha256sum] = "5dbcd45b67514fe1981703759d008f
> 9aa2c6b6201917679dfd35776c904e51b2"
>
>  S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

