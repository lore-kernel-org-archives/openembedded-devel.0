Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D8DF8809B
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 07:11:26 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8041.1776323479849912615
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 00:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LeRg7gjo;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: nmjain23@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8aca2726f61so57038106d6.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 00:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776323479; cv=none;
        d=google.com; s=arc-20240605;
        b=SfEqoAQJOzkVBiPvVRmbytHi1yzfTjEMTCaqTyoGwmmWIJED906UBE4cYnXIvKBUf0
         XAXFYkEKpgu6QdZL8NxzMHQKoo+sxRxqZ1DHbdS9ThlHGXK7Q33kAyMNJBvp0XXNPqJq
         zFx+6U7wO6qqp4CC2aw+5xvY+dwM3jntqEEZJ3C7VPZS/el0ikthTLJ5WGewPLor8iK/
         hvhgSjGBO8Zb5k8CRcuFkTBgrGzM2TVx1tyQX2ZjEigudVjITsbvb77KEx8unAtlHlsW
         Xxxz61dOYJHKz0LItcAOyPjmayF443Vj0JnkDK5E/zvEm2KImbPn9axdfKoy0gPaxuCe
         v7OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HJBNpQKvYljh7ceTv/dglyA1dnm97qkYCqQvzL2iQwY=;
        fh=0VGt6yliDzu3jXn650CeE1ova7LiT3imOtYG35Mx/hs=;
        b=VThyi4CQaOpKEbZwazi4C0k/BYuvGEQJsvySTfhG+G/sWhquUK12A9qMEYUKO8AcSl
         9x9M2bzV9bMnmLtI0D58a2IBhssBPo2JUxptrwbu8U1CQbYugKMmGIcpYomKQgjGYVR3
         K2mv4PwW3ereXRM2x9vTvd6bDQ8gLFETwgbfMnYGAvaKKXb+fM7jw+YdxgC3zCa7RerE
         4IcuchZPfmcj65YDeLjVyZVh7tLR/0DJ8KxcXnex9e+U1LZRgRA0CUfTWwb4znvYBmKW
         Si9PWFro0HS6ILdSr0w/4fmFgLlzxiDKyiuVBdnNarF3w6vU+NIc8joLYGPjQAWh6veM
         WCpQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776323479; x=1776928279; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HJBNpQKvYljh7ceTv/dglyA1dnm97qkYCqQvzL2iQwY=;
        b=LeRg7gjoD9sybeWWez0firmsHyRsElvwLunR9dlhY1vpJUepyR7OhAUT7v1Cllm3WR
         1EOv4Ah3wfOjX9gIRLuW5BAjyzqhinl1IZ6rMNvPYNJrhpk6V/8IQL3pjxYhNtqevwWU
         Gf2+qj4POUBoBJ52JeSHdRz7sFyS/k8sNI3tc4C6Bbs3XmTpOhXfFlr3EmmWUQheh5hn
         F71LiRiMkQ5GkTEFGzTpXaJeW1kmGfpsGev64NiMjBtGybjyNlElxT7Ta+0u2zp5ZoHs
         4rtfjQI9f9PjeEgAAmWb+uiN2ES0GxQlx1WiGuA/e1UQyJnB3wSilwTAIMZjkuEtCvtm
         T1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776323479; x=1776928279;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJBNpQKvYljh7ceTv/dglyA1dnm97qkYCqQvzL2iQwY=;
        b=gm+MLuDQctObu/DESE+wR39ZEhNCPn149dGDmv13ipyH3qn2hbjjPBTjHgaca8Gxfv
         agljzhJ3l/8j2zHOJ6jDXvqZLnjcMKitRcFnQpqX56yAX7Qw83NRYL6kQHltRVW2R+ai
         8o6LAasWb3qwzOY/bBwH7T3jkEtx7+CLUdszlTz5p1rzTClEKP3Qoc143K2jbvzqsm8w
         +r1sD7tGMguHNCid+B8bsrEcxCQmPBMTRf98HyhCMcOzyWb8dBt0TYRUPzuu6OsAC7V6
         GDgswwwsq7PEYv5DaCl186fiSFUVE4xr1U3s7AZHnYDC0W0lsQzvdQM0jAZGGax46nSc
         MhYg==
X-Gm-Message-State: AOJu0Yw8u2rvKbBQpy+sQ2RRKS3kbn2kBus5B4nui1rRPXKmi3ZwqH5z
	kOo9liI/BJMTU6bCukb8TRtj8+bfsETIkjM/eE7NndNhMZoaWnP3jFaC7GZsXjTsk7RkGwjtEWt
	NmwWj67FC5stu2PyUvM5zw/cKWKtV9izLwIrN
X-Gm-Gg: AeBDieuGGn8O3uS7nQ+EPUKL8fi3Uh+qBKPsy06h2eGar/kFZQNLNHUm+lTgr9mzP5P
	vKx4uGDfPBPKx+CLmmo5X2BXQl6fCAMGTeCqth0K8InSSQyZmToR8elC58ha0eaIfEtZG7UJ36d
	w6UJsgYtxn1KvQyT0fgqgabgazLdeSwClXed4quMvfP2W1JCB3PqWRa+X7URbj6UfeYwNa9Pvnd
	3ytCWg+On2wo1KQ/CcwIUO5ysshWGEqkSS/41KzHn2tbUgreSZAzl4P7WQ4+0Bsphl3cWiQPgxv
	NrrjBZJavbVvmMXhIX+hwnWX7eG37kPHUb3rmkD13HJToi0DBxwpX3WLhGsbSOPu/afY60BhTaz
	z2TsmQw==
X-Received: by 2002:a0c:e014:0:b0:89c:e7d8:9898 with SMTP id
 6a1803df08f44-8ac862ab2e7mr347878986d6.39.1776323478089; Thu, 16 Apr 2026
 00:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260414040405.2258458-1-naman.jain@partner.bmw.de>
In-Reply-To: <20260414040405.2258458-1-naman.jain@partner.bmw.de>
From: Naman Jain <nmjain23@gmail.com>
Date: Thu, 16 Apr 2026 12:41:05 +0530
X-Gm-Features: AQROBzCmHYjv3TdR97qpCjqgh20SKOZQNQiY3bG-1V6eGT1fcDGDk43m1_ZXmVg
Message-ID: <CALCkg5a+FdjUFquCmFd9K9AA-ePWR2eZtaxUAk8recEnBnv9Fw@mail.gmail.com>
Subject: Re: [meta-oe][scarthgap][PATCH] Imagemagick: Fix CVEs
To: openembedded-devel@lists.openembedded.org
Cc: Naman Jain <namanj1@kpit.com>
Content-Type: multipart/alternative; boundary="000000000000eaf8e5064f8e89e8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 07:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126400

--000000000000eaf8e5064f8e89e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
Please let us know if you will need any further information for it.

Thanks and regards,
Naman jain

On Tue, 14 Apr, 2026, 9:34=E2=80=AFam Naman Jain, <nmjain23@gmail.com> wrot=
e:

> Fix the following CVEs-
> CVE-2026-24481 CVE-2026-25638 CVE-2026-25794 CVE-2026-25795
> CVE-2026-25796 CVE-2026-25797 CVE-2026-25798 CVE-2026-25799
> CVE-2026-25897 CVE-2026-25898 CVE-2026-25965 CVE-2026-25966
> CVE-2026-25967 CVE-2026-25968 CVE-2026-25969 CVE-2026-25970
> CVE-2026-25982 CVE-2026-25985 CVE-2026-25986 CVE-2026-25987
> CVE-2026-25988 CVE-2026-26066 CVE-2026-26283 CVE-2026-26284
> CVE-2026-26983
>
> Signed-off-by: Naman Jain <namanj1@kpit.com>
> ---
>  .../imagemagick/CVE-2026-24481.patch          |  30 ++
>  .../imagemagick/CVE-2026-25638.patch          |  29 ++
>  .../imagemagick/CVE-2026-25794.patch          |  60 +++
>  .../imagemagick/CVE-2026-25795.patch          |  32 ++
>  .../imagemagick/CVE-2026-25796.patch          |  46 +++
>  .../imagemagick/CVE-2026-25797_1.patch        | 344 ++++++++++++++++++
>  .../imagemagick/CVE-2026-25797_2.patch        | 143 ++++++++
>  .../imagemagick/CVE-2026-25798.patch          | 109 ++++++
>  .../imagemagick/CVE-2026-25799.patch          |  42 +++
>  .../imagemagick/CVE-2026-25897.patch          |  34 ++
>  .../imagemagick/CVE-2026-25898_1.patch        |  39 ++
>  .../imagemagick/CVE-2026-25898_2.patch        |  37 ++
>  .../imagemagick/CVE-2026-25965.patch          | 322 ++++++++++++++++
>  .../imagemagick/CVE-2026-25966.patch          |  56 +++
>  .../imagemagick/CVE-2026-25967.patch          |  38 ++
>  .../imagemagick/CVE-2026-25968.patch          |  39 ++
>  .../imagemagick/CVE-2026-25969.patch          |  63 ++++
>  .../imagemagick/CVE-2026-25970.patch          | 139 +++++++
>  .../imagemagick/CVE-2026-25970_pre1.patch     |  57 +++
>  .../imagemagick/CVE-2026-25982.patch          |  77 ++++
>  .../imagemagick/CVE-2026-25985.patch          |  67 ++++
>  .../imagemagick/CVE-2026-25986.patch          |  42 +++
>  .../imagemagick/CVE-2026-25987.patch          |  44 +++
>  .../imagemagick/CVE-2026-25988.patch          |  50 +++
>  .../imagemagick/CVE-2026-26066.patch          |  49 +++
>  .../imagemagick/CVE-2026-26283.patch          |  33 ++
>  .../imagemagick/CVE-2026-26284.patch          |  31 ++
>  .../imagemagick/CVE-2026-26983.patch          |  41 +++
>  .../imagemagick/imagemagick_7.1.1.bb          |  28 ++
>  29 files changed, 2121 insertions(+)
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25638.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25794.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25795.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25796.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_1.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_2.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25798.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25799.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25897.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_1.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_2.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25965.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25966.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25967.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25968.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25969.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970_pre1.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25982.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25985.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25986.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25987.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25988.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26066.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26283.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26284.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-26983.patch
>
> diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patch
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patch
> new file mode 100644
> index 0000000000..abfa1f817c
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patc=
h
> @@ -0,0 +1,30 @@
> +From: Dirk Lemstra <dirk@lemstra.org>
> +Date: Fri, 23 Jan 2026 13:19:06 +0100
> +Subject: Initialize the pixels with empty values to prevent possible hea=
p
> + information disclosure (GHSA-96pc-27rx-pr36)
> +
> +(cherry picked from commit 51c9d33f4770cdcfa1a029199375d570af801c97)
> +
> +CVE: CVE-2026-24481
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick6/commit/38872ec2a70084813883ea=
152f18497911823c18
> ]
> +
> +origin:
> https://github.com/ImageMagick/ImageMagick/commit/51c9d33f4770cdcfa1a0291=
99375d570af801c97
> +bug:
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-96pc-=
27rx-pr36
> +
> +Signed-off-by: Naman Jain <namanj1@kpit.com>
> +---
> + coders/psd.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/coders/psd.c b/coders/psd.c
> +index 050abcd..7e2b3eb 100644
> +--- a/coders/psd.c
> ++++ b/coders/psd.c
> +@@ -1331,6 +1331,7 @@ static MagickBooleanType ReadPSDChannelZip(Image
> *image,
> +       ThrowBinaryException(ResourceLimitError,"MemoryAllocationFailed",
> +         image->filename);
> +     }
> ++  memset(pixels,0,count*sizeof(*pixels));
> +   if (ReadBlob(image,compact_size,compact_pixels) !=3D (ssize_t)
> compact_size)
> +     {
> +       pixels=3D(unsigned char *) RelinquishMagickMemory(pixels);
> diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25638.patch
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25638.patch
> new file mode 100644
> index 0000000000..025ff90c40
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25638.patc=
h
> @@ -0,0 +1,29 @@
> +From: Dirk Lemstra <dirk@lemstra.org>
> +Date: Tue, 3 Feb 2026 22:06:12 +0100
> +Subject: Fixed memory leak when writing MSL files (GHSA-gxcx-qjqp-8vjw)
> +
> +(cherry picked from commit 1e88fca11c7b8517100d518bc99bd8c474f02f88)
> +
> +CVE: CVE-2026-25638
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/1e88fca11c7b8517100d518=
bc99bd8c474f02f88
> ]
> +
> +origin:
> https://github.com/ImageMagick/ImageMagick/commit/1e88fca11c7b8517100d518=
bc99bd8c474f02f88
> +bug:
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-gxcx-=
qjqp-8vjw
> +
> +Signed-off-by: Naman Jain <namanj1@kpit.com>
> +---
> + coders/msl.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/coders/msl.c b/coders/msl.c
> +index 43c4b73..9facbf2 100644
> +--- a/coders/msl.c
> ++++ b/coders/msl.c
> +@@ -7887,6 +7887,7 @@ static MagickBooleanType WriteMSLImage(const
> ImageInfo *image_info,Image *image,
> +     (void)
> LogMagickEvent(TraceEvent,GetMagickModule(),"%s",image->filename);
> +   msl_image=3DCloneImage(image,0,0,MagickTrue,exception);
> +   status=3DProcessMSLScript(image_info,&msl_image,exception);
> ++  msl_image=3DDestroyImageList(msl_image);
> +   return(status);
> + }
> + #endif
> diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25794.patch
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25794.patch
> new file mode 100644
> index 0000000000..f67ab86ad1
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25794.patc=
h
> @@ -0,0 +1,60 @@
> +From: Dirk Lemstra <dirk@lemstra.org>
> +Date: Fri, 6 Feb 2026 21:03:53 +0100
> +Subject: Prevent out of bounds heap write in uhdr encoder
> + (
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-vhqj-=
f5cj-9x8h
> )
> +
> +(cherry picked from commit ffe589df5ff8ce1433daa4ccb0d2a9fadfbe30ed)
> +
> +Subject: [PATCH] CVE-2026-25794
> +CVE: CVE-2026-25794
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/ffe589df5ff8ce1433daa4c=
cb0d2a9fadfbe30ed
> ]
> +
> +origin:
> https://github.com/ImageMagick/ImageMagick/commit/ffe589df5ff8ce1433daa4c=
cb0d2a9fadfbe30ed
> +bug:
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-vhqj-=
f5cj-9x8h
> +
> +Signed-off-by: Naman Jain <namanj1@kpit.com>
> +---
> + coders/uhdr.c | 24 ++++++++++++++++--------
> + 1 file changed, 16 insertions(+), 8 deletions(-)
> +
> +diff --git a/coders/uhdr.c b/coders/uhdr.c
> +index 0a25676..a527465 100644
> +--- a/coders/uhdr.c
> ++++ b/coders/uhdr.c
> +@@ -618,20 +618,28 @@ static MagickBooleanType WriteUHDRImage(const
> ImageInfo *image_info,
> +   {
> +     /* Classify image as hdr/sdr intent basing on depth */
> +     int
> +-      bpp =3D image->depth >=3D hdrIntentMinDepth ? 2 : 1;
> +-
> +-    int
> +-      aligned_width =3D image->columns + (image->columns & 1);
> +-
> +-    int
> +-      aligned_height =3D image->rows + (image->rows & 1);
> ++      bpp;
> +
> +     ssize_t
> +-      picSize =3D aligned_width * aligned_height * bpp * 1.5 /* 2x2
> sub-sampling */;
> ++      aligned_height,
> ++      aligned_width;
> ++
> ++    size_t
> ++      picSize;
> +
> +     void
> +       *crBuffer =3D NULL, *cbBuffer =3D NULL, *yBuffer =3D NULL;
> +
> ++    if (((double) image->columns > sqrt(MAGICK_SSIZE_MAX/3.0)) ||
> ++        ((double) image->rows > sqrt(MAGICK_SSIZE_MAX/3.0)))
> ++      {
> ++        (void)
> ThrowMagickException(exception,GetMagickModule(),ImageError,
> ++          "WidthOrHeightExceedsLimit","%s",image->filename);
> ++        goto next_image;
> ++    }
> ++    bpp =3D image->depth >=3D hdrIntentMinDepth ? 2 : 1;
> ++    aligned_width =3D image->columns + (image->columns & 1);
> ++    picSize =3D aligned_width * aligned_height * bpp * 1.5 /* 2x2
> sub-sampling */;
> +     if (IssRGBCompatibleColorspace(image->colorspace) &&
> !IsGrayColorspace(image->colorspace))
> +     {
> +       if (image->depth >=3D hdrIntentMinDepth && hdr_ct =3D=3D UHDR_CT_=
LINEAR)
> diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25795.patch
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25795.patch
> new file mode 100644
> index 0000000000..69a474dc11
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25795.patc=
h
> @@ -0,0 +1,32 @@
> +From: Dirk Lemstra <dirk@lemstra.org>
> +Date: Fri, 6 Feb 2026 21:16:10 +0100
> +Subject: Fixed NULL pointer dereference in ReadSFWImage
> (GHSA-p33r-fqw2-rqmm)
> +
> +(cherry picked from commit 0c7d0b9671ae2616fca106dcada45536eb4df5dc)
> +
> +CVE: CVE-2026-25796
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/0c7d0b9671ae2616fca106d=
cada45536eb4df5dc
> ]
> +
> +bug:
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-p33r-=
fqw2-rqmm
> +origin:
> https://github.com/ImageMagick/ImageMagick/commit/0c7d0b9671ae2616fca106d=
cada45536eb4df5dc
> +
> +Signed-off-by: Naman Jain <namanj1@kpit.com>
> +---
> + coders/sfw.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/coders/sfw.c b/coders/sfw.c
> +index 22ebcd9..46c67b4 100644
> +--- a/coders/sfw.c
> ++++ b/coders/sfw.c
> +@@ -317,9 +317,9 @@ static Image *ReadSFWImage(const ImageInfo
> *image_info,ExceptionInfo *exception)
> +   if ((unique_file =3D=3D -1) || (file =3D=3D (FILE *) NULL))
> +     {
> +       buffer=3D(unsigned char *) RelinquishMagickMemory(buffer);
> +-      read_info=3DDestroyImageInfo(read_info);
> +       (void) CopyMagickString(image->filename,read_info->filename,
> +         MagickPathExtent);
> ++      read_info=3DDestroyImageInfo(read_info);
> +
>  ThrowFileException(exception,FileOpenError,"UnableToCreateTemporaryFile"=
,
> +         image->filename);
> +       image=3DDestroyImageList(image);
> diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25796.patch
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25796.patch
> new file mode 100644
> index 0000000000..7bd577b4dd
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25796.patc=
h
> @@ -0,0 +1,46 @@
> +From: Dirk Lemstra <dirk@lemstra.org>
> +Date: Fri, 6 Feb 2026 21:10:47 +0100
> +Subject: Prevent memory leak in early exits (GHSA-g2pr-qxjg-7r2w)
> +
> +(cherry picked from commit 93ad259ce4f6d641eea0bee73f374af90f35efc3)
> +
> +CVE: CVE-2026-25796
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/93ad259ce4f6d641eea0bee=
73f374af90f35efc3
> ]
> +
> +origin:
> https://github.com/ImageMagick/ImageMagick/commit/93ad259ce4f6d641eea0bee=
73f374af90f35efc3
> +bug:
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-g2pr-=
qxjg-7r2w
> +
> +Signed-off-by: Naman Jain <namanj1@kpit.com>
> +---
> + coders/stegano.c | 11 +++++++++--
> + 1 file changed, 9 insertions(+), 2 deletions(-)
> +
> +diff --git a/coders/stegano.c b/coders/stegano.c
> +index 111640a..5f91bd9 100644
> +--- a/coders/stegano.c
> ++++ b/coders/stegano.c
> +@@ -150,15 +150,22 @@ static Image *ReadSTEGANOImage(const ImageInfo
> *image_info,
> +     return(DestroyImage(image));
> +   watermark->depth=3DMAGICKCORE_QUANTUM_DEPTH;
> +   if (AcquireImageColormap(image,MaxColormapSize,exception) =3D=3D
> MagickFalse)
> +-    ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed");
> ++    {
> ++      watermark=3DDestroyImage(watermark);
> ++      ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed")=
;
> ++    }
> +   if (image_info->ping !=3D MagickFalse)
> +     {
> ++      watermark=3DDestroyImage(watermark);
> +       (void) CloseBlob(image);
> +       return(GetFirstImageInList(image));
> +     }
> +   status=3DSetImageExtent(image,image->columns,image->rows,exception);
> +   if (status =3D=3D MagickFalse)
> +-    return(DestroyImageList(image));
> ++    {
> ++      watermark=3DDestroyImage(watermark);
> ++      return(DestroyImageList(image));
> ++    }
> +   for (y=3D0; y < (ssize_t) image->rows; y++)
> +   {
> +     q=3DQueueAuthenticPixels(image,0,y,image->columns,1,exception);
> diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_1.patch
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_1.patch
> new file mode 100644
> index 0000000000..295b686a91
> --- /dev/null
> +++
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_1.patch
> @@ -0,0 +1,344 @@
> +From: Dirk Lemstra <dirk@lemstra.org>
> +Date: Fri, 6 Feb 2026 21:28:50 +0100
> +Subject: Prevent code injection via PostScript header
> + (
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-rw6c-=
xp26-225v
> )
> +
> +(cherry picked from commit 26088a83d71e9daa203d54a56fe3c31f3f85463d)
> +
> +CVE: CVE-2026-25797
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/26088a83d71e9daa203d54a=
56fe3c31f3f85463d
> ]
> +
> +origin: backport,
> https://github.com/ImageMagick/ImageMagick/commit/26088a83d71e9daa203d54a=
56fe3c31f3f85463d
> +bug:
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-rw6c-=
xp26-225v
> +
> +Signed-off-by: Naman Jain <namanj1@kpit.com>
> +---
> + coders/ps.c  | 82
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> + coders/ps2.c | 82
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> + coders/ps3.c | 82
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> + 3 files changed, 243 insertions(+), 3 deletions(-)
> +
> +diff --git a/coders/ps.c b/coders/ps.c
> +index 8af2af7..3999cf9 100644
> +--- a/coders/ps.c
> ++++ b/coders/ps.c
> +@@ -1086,6 +1086,82 @@ static inline unsigned char *PopHexPixel(const
> char hex_digits[][3],
> +   return(pixels);
> + }
> +
> ++static inline void FilenameToTitle(const char *filename,char *title,
> ++  const size_t extent)
> ++{
> ++  int
> ++    depth =3D 0;
> ++
> ++  ssize_t
> ++    i,
> ++    offset =3D 0;
> ++
> ++  if (extent =3D=3D 0)
> ++    return;
> ++  for (i=3D0; (filename[i] !=3D '\0') && ((offset+1) < (ssize_t) extent=
);
> i++)
> ++  {
> ++    unsigned char
> ++      c =3D filename[i];
> ++
> ++    /*
> ++      Only allow printable ASCII.
> ++    */
> ++    if ((c < 32) || (c > 126))
> ++      {
> ++        title[offset++]=3D'_';
> ++        continue;
> ++      }
> ++    /*
> ++      Percent signs break DSC parsing.
> ++    */
> ++    if (c =3D=3D '%')
> ++      {
> ++        title[offset++]=3D'_';
> ++        continue;
> ++      }
> ++    /*
> ++      Parentheses must remain balanced.
> ++    */
> ++    if (c =3D=3D '(')
> ++      {
> ++        depth++;
> ++        title[offset++] =3D '(';
> ++        continue;
> ++      }
> ++    if (c =3D=3D ')')
> ++      {
> ++        if (depth <=3D 0)
> ++          title[offset++]=3D'_';
> ++        else
> ++          {
> ++            depth--;
> ++            title[offset++]=3D')';
> ++          }
> ++         continue;
> ++     }
> ++    /*
> ++      Everything else is allowed.
> ++    */
> ++    title[offset++]=3Dc;
> ++  }
> ++  /*
> ++    If parentheses remain unbalanced, close them.
> ++  */
> ++  while ((depth > 0) && ((offset+1) < (ssize_t) extent)) {
> ++    title[offset++]=3D')';
> ++    depth--;
> ++  }
> ++  title[offset]=3D'\0';
> ++  /*
> ++    Ensure non-empty result.
> ++  */
> ++  if (offset =3D=3D 0)
> ++    {
> ++      (void) CopyMagickString(title,"Untitled",extent-1);
> ++      title[extent-1]=3D'\0';
> ++    }
> ++}
> ++
> + static MagickBooleanType WritePSImage(const ImageInfo *image_info,Image
> *image,
> +   ExceptionInfo *exception)
> + {
> +@@ -1554,6 +1630,9 @@ static MagickBooleanType WritePSImage(const
> ImageInfo *image_info,Image *image,
> +       text_size=3D(size_t) (MultilineCensus(value)*pointsize+12);
> +     if (page =3D=3D 1)
> +       {
> ++        char
> ++          title[MagickPathExtent];
> ++
> +         /*
> +           Output Postscript header.
> +         */
> +@@ -1564,8 +1643,9 @@ static MagickBooleanType WritePSImage(const
> ImageInfo *image_info,Image *image,
> +             MagickPathExtent);
> +         (void) WriteBlobString(image,buffer);
> +         (void) WriteBlobString(image,"%%Creator: (ImageMagick)\n");
> ++        FilenameToTitle(image->filename,title,MagickPathExtent);
> +         (void) FormatLocaleString(buffer,MagickPathExtent,"%%%%Title:
> (%s)\n",
> +-          image->filename);
> ++          title);
> +         (void) WriteBlobString(image,buffer);
> +         timer=3DGetMagickTime();
> +         (void) FormatMagickTime(timer,sizeof(date),date);
> +diff --git a/coders/ps2.c b/coders/ps2.c
> +index f840782..10670a7 100644
> +--- a/coders/ps2.c
> ++++ b/coders/ps2.c
> +@@ -225,6 +225,82 @@ static MagickBooleanType Huffman2DEncodeImage(const
> ImageInfo *image_info,
> +   return(status);
> + }
> +
> ++static inline void FilenameToTitle(const char *filename,char *title,
> ++  const size_t extent)
> ++{
> ++  int
> ++    depth =3D 0;
> ++
> ++  ssize_t
> ++    i,
> ++    offset =3D 0;
> ++
> ++  if (extent =3D=3D 0)
> ++    return;
> ++  for (i=3D0; (filename[i] !=3D '\0') && ((offset+1) < (ssize_t) extent=
);
> i++)
> ++  {
> ++    unsigned char
> ++      c =3D filename[i];
> ++
> ++    /*
> ++      Only allow printable ASCII.
> ++    */
> ++    if ((c < 32) || (c > 126))
> ++      {
> ++        title[offset++]=3D'_';
> ++        continue;
> ++      }
> ++    /*
> ++      Percent signs break DSC parsing.
> ++    */
> ++    if (c =3D=3D '%')
> ++      {
> ++        title[offset++]=3D'_';
> ++        continue;
> ++      }
> ++    /*
> ++      Parentheses must remain balanced.
> ++    */
> ++    if (c =3D=3D '(')
> ++      {
> ++        depth++;
> ++        title[offset++] =3D '(';
> ++        continue;
> ++      }
> ++    if (c =3D=3D ')')
> ++      {
> ++        if (depth <=3D 0)
> ++          title[offset++]=3D'_';
> ++        else
> ++          {
> ++            depth--;
> ++            title[offset++]=3D')';
> ++          }
> ++         continue;
> ++     }
> ++    /*
> ++      Everything else is allowed.
> ++    */
> ++    title[offset++]=3Dc;
> ++  }
> ++  /*
> ++    If parentheses remain unbalanced, close them.
> ++  */
> ++  while ((depth > 0) && ((offset+1) < (ssize_t) extent)) {
> ++    title[offset++]=3D')';
> ++    depth--;
> ++  }
> ++  title[offset]=3D'\0';
> ++  /*
> ++    Ensure non-empty result.
> ++  */
> ++  if (offset =3D=3D 0)
> ++    {
> ++      (void) CopyMagickString(title,"Untitled",extent-1);
> ++      title[extent-1]=3D'\0';
> ++    }
> ++}
> ++
> + static MagickBooleanType WritePS2Image(const ImageInfo *image_info,Imag=
e
> *image,
> +   ExceptionInfo *exception)
> + {
> +@@ -547,6 +623,9 @@ static MagickBooleanType WritePS2Image(const
> ImageInfo *image_info,Image *image,
> +       text_size=3D(size_t) (MultilineCensus(value)*pointsize+12);
> +     if (page =3D=3D 1)
> +       {
> ++        char
> ++          title[MagickPathExtent];
> ++
> +         /*
> +           Output Postscript header.
> +         */
> +@@ -557,8 +636,9 @@ static MagickBooleanType WritePS2Image(const
> ImageInfo *image_info,Image *image,
> +             MagickPathExtent);
> +         (void) WriteBlobString(image,buffer);
> +         (void) WriteBlobString(image,"%%Creator: (ImageMagick)\n");
> ++        FilenameToTitle(image->filename,title,MagickPathExtent);
> +         (void) FormatLocaleString(buffer,MagickPathExtent,"%%%%Title:
> (%s)\n",
> +-          image->filename);
> ++          title);
> +         (void) WriteBlobString(image,buffer);
> +         timer=3DGetMagickTime();
> +         (void) FormatMagickTime(timer,sizeof(date),date);
> +diff --git a/coders/ps3.c b/coders/ps3.c
> +index d3e870c..b135b46 100644
> +--- a/coders/ps3.c
> ++++ b/coders/ps3.c
> +@@ -203,6 +203,82 @@ ModuleExport void UnregisterPS3Image(void)
> + %
> + */
> +
> ++static inline void FilenameToTitle(const char *filename,char *title,
> ++  const size_t extent)
> ++{
> ++  int
> ++    depth =3D 0;
> ++
> ++  ssize_t
> ++    i,
> ++    offset =3D 0;
> ++
> ++  if (extent =3D=3D 0)
> ++    return;
> ++  for (i=3D0; (filename[i] !=3D '\0') && ((offset+1) < (ssize_t) extent=
);
> i++)
> ++  {
> ++    unsigned char
> ++      c =3D filename[i];
> ++
> ++    /*
> ++      Only allow printable ASCII.
> ++    */
> ++    if ((c < 32) || (c > 126))
> ++      {
> ++        title[offset++]=3D'_';
> ++        continue;
> ++      }
> ++    /*
> ++      Percent signs break DSC parsing.
> ++    */
> ++    if (c =3D=3D '%')
> ++      {
> ++        title[offset++]=3D'_';
> ++        continue;
> ++      }
> ++    /*
> ++      Parentheses must remain balanced.
> ++    */
> ++    if (c =3D=3D '(')
> ++      {
> ++        depth++;
> ++        title[offset++] =3D '(';
> ++        continue;
> ++      }
> ++    if (c =3D=3D ')')
> ++      {
> ++        if (depth <=3D 0)
> ++          title[offset++]=3D'_';
> ++        else
> ++          {
> ++            depth--;
> ++            title[offset++]=3D')';
> ++          }
> ++         continue;
> ++     }
> ++    /*
> ++      Everything else is allowed.
> ++    */
> ++    title[offset++]=3Dc;
> ++  }
> ++  /*
> ++    If parentheses remain unbalanced, close them.
> ++  */
> ++  while ((depth > 0) && ((offset+1) < (ssize_t) extent)) {
> ++    title[offset++]=3D')';
> ++    depth--;
> ++  }
> ++  title[offset]=3D'\0';
> ++  /*
> ++    Ensure non-empty result.
> ++  */
> ++  if (offset =3D=3D 0)
> ++    {
> ++      (void) CopyMagickString(title,"Untitled",extent-1);
> ++      title[extent-1]=3D'\0';
> ++    }
> ++}
> ++
> + static MagickBooleanType Huffman2DEncodeImage(const ImageInfo
> *image_info,
> +   Image *image,Image *inject_image,ExceptionInfo *exception)
> + {
> +@@ -1007,6 +1083,9 @@ static MagickBooleanType WritePS3Image(const
> ImageInfo *image_info,Image *image,
> +     is_gray=3DIdentifyImageCoderGray(image,exception);
> +     if (page =3D=3D 1)
> +       {
> ++        char
> ++          title[MagickPathExtent];
> ++
> +         /*
> +           Postscript header on the first page.
> +         */
> +@@ -1019,8 +1098,9 @@ static MagickBooleanType WritePS3Image(const
> ImageInfo *image_info,Image *image,
> +         (void) FormatLocaleString(buffer,MagickPathExtent,
> +           "%%%%Creator: ImageMagick %s\n",MagickLibVersionText);
> +         (void) WriteBlobString(image,buffer);
> ++        FilenameToTitle(image->filename,title,MagickPathExtent);
> +         (void) FormatLocaleString(buffer,MagickPathExtent,"%%%%Title:
> %s\n",
> +-          image->filename);
> ++          title);
> +         (void) WriteBlobString(image,buffer);
> +         timer=3DGetMagickTime();
> +         (void) FormatMagickTime(timer,sizeof(date),date);
> diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_2.patch
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_2.patch
> new file mode 100644
> index 0000000000..a1872b7ee9
> --- /dev/null
> +++
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_2.patch
> @@ -0,0 +1,143 @@
> +From: Dirk Lemstra <dirk@lemstra.org>
> +Date: Fri, 20 Feb 2026 14:08:15 +0100
> +Subject: Properly escape the strings that are written as raw html
> + (GHSA-rw6c-xp26-225v)
> +
> +(cherry picked from commit 81129f79ad622ff4c1d729828a34ab0f49ec89f6)
> +
> +CVE: CVE-2026-25797
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/81129f79ad622ff4c1d7298=
28a34ab0f49ec89f6
> ]
> +
> +origin:
> https://github.com/ImageMagick/ImageMagick/commit/81129f79ad622ff4c1d7298=
28a34ab0f49ec89f6
> +bug:
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-rw6c-=
xp26-225v
> +
> +Signed-off-by: Naman Jain <namanj1@kpit.com>
> +---
> + coders/html.c | 65
> +++++++++++++++++++++++++++++++++++------------------------
> + 1 file changed, 39 insertions(+), 26 deletions(-)
> +
> +diff --git a/coders/html.c b/coders/html.c
> +index 739cb12..1e171cb 100644
> +--- a/coders/html.c
> ++++ b/coders/html.c
> +@@ -204,6 +204,21 @@ ModuleExport void UnregisterHTMLImage(void)
> + %
> + */
> +
> ++static void WriteHtmlEncodedString(Image *image,const char* value)
> ++{
> ++  char
> ++    *encoded_value;
> ++
> ++  encoded_value=3DAcquireString(value);
> ++  (void) SubstituteString(&encoded_value,"<","&lt;");
> ++  (void) SubstituteString(&encoded_value,">","&gt;");
> ++  (void) SubstituteString(&encoded_value,"&","&amp;");
> ++  (void) SubstituteString(&encoded_value,"\"","&quot;");
> ++  (void) SubstituteString(&encoded_value,"'","&apos;");
> ++  WriteBlobString(image,encoded_value);
> ++  encoded_value=3DDestroyString(encoded_value);
> ++}
> ++
> + static ssize_t WriteURLComponent(Image *image,const int c)
> + {
> +   char
> +@@ -318,29 +333,29 @@ static MagickBooleanType WriteHTMLImage(const
> ImageInfo *image_info,
> +         "\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\n");
> +       (void) WriteBlobString(image,"<html>\n");
> +       (void) WriteBlobString(image,"<head>\n");
> ++      (void) WriteBlobString(image,"<title>");
> +       value=3DGetImageProperty(image,"label",exception);
> +       if (value !=3D (const char *) NULL)
> +-        (void)
> FormatLocaleString(buffer,MagickPathExtent,"<title>%s</title>\n",
> +-          value);
> ++        WriteHtmlEncodedString(image,value);
> +       else
> +         {
> +           GetPathComponent(filename,BasePath,basename);
> +-          (void) FormatLocaleString(buffer,MagickPathExtent,
> +-            "<title>%s</title>\n",basename);
> ++          WriteHtmlEncodedString(image,basename);
> +         }
> +-      (void) WriteBlobString(image,buffer);
> ++      (void) WriteBlobString(image,"</title>\n");
> +       (void) WriteBlobString(image,"</head>\n");
> +       (void) WriteBlobString(image,"<body style=3D\"text-align:
> center;\">\n");
> +-      (void) FormatLocaleString(buffer,MagickPathExtent,"<h1>%s</h1>\n"=
,
> +-        image->filename);
> +-      (void) WriteBlobString(image,buffer);
> ++      (void) WriteBlobString(image,"<h1>");
> ++      WriteHtmlEncodedString(image,image->filename);
> ++      (void) WriteBlobString(image,"</h1>");
> +       (void) WriteBlobString(image,"<div>\n");
> +       (void) CopyMagickString(filename,image->filename,MagickPathExtent=
);
> +       AppendImageFormat("png",filename);
> +-      (void) FormatLocaleString(buffer,MagickPathExtent,"<img
> usemap=3D\"#%s\" "
> +-        "src=3D\"%s\" style=3D\"border: 0;\" alt=3D\"Image map\" />\n",=
mapname,
> +-        filename);
> +-      (void) WriteBlobString(image,buffer);
> ++      (void) WriteBlobString(image,"<img usemap=3D\"#");
> ++      WriteHtmlEncodedString(image,mapname);
> ++      (void) WriteBlobString(image,"\" src=3D\"");
> ++      WriteHtmlEncodedString(image,filename);
> ++      (void) WriteBlobString(image,"\" style=3D\"border: 0;\" alt=3D\"I=
mage
> map\" />\n");
> +       /*
> +         Determine the size and location of each image tile.
> +       */
> +@@ -350,18 +365,18 @@ static MagickBooleanType WriteHTMLImage(const
> ImageInfo *image_info,
> +       /*
> +         Write an image map.
> +       */
> +-      (void) FormatLocaleString(buffer,MagickPathExtent,
> +-        "<map id=3D\"%s\" name=3D\"%s\">\n",mapname,mapname);
> +-      (void) WriteBlobString(image,buffer);
> +-      (void) FormatLocaleString(buffer,MagickPathExtent,"  <area
> href=3D\"%s",
> +-        url);
> +-      (void) WriteBlobString(image,buffer);
> ++      (void) WriteBlobString(image,"<map id=3D\"");
> ++      WriteHtmlEncodedString(image,mapname);
> ++      (void) WriteBlobString(image,"\" name=3D\"");
> ++      WriteHtmlEncodedString(image,mapname);
> ++      (void) WriteBlobString(image,"\">\n<area href=3D\"");
> ++      WriteHtmlEncodedString(image,url);
> +       if (image->directory =3D=3D (char *) NULL)
> +         {
> ++          WriteHtmlEncodedString(image,image->filename);
> +           (void) FormatLocaleString(buffer,MagickPathExtent,
> +-            "%s\" shape=3D\"rect\" coords=3D\"0,0,%.20g,%.20g\" alt=3D\=
"\"
> />\n",
> +-            image->filename,(double) geometry.width-1,(double)
> geometry.height-
> +-            1);
> ++            "\" shape=3D\"rect\" coords=3D\"0,0,%.20g,%.20g\" alt=3D\"\=
" />\n",
> ++            (double) geometry.width-1,(double) geometry.height-1);
> +           (void) WriteBlobString(image,buffer);
> +         }
> +       else
> +@@ -378,9 +393,9 @@ static MagickBooleanType WriteHTMLImage(const
> ImageInfo *image_info,
> +               (void) WriteBlobString(image,buffer);
> +               if (*(p+1) !=3D '\0')
> +                 {
> +-                  (void) FormatLocaleString(buffer,MagickPathExtent,
> +-                    "  <area href=3D%s\"",url);
> +-                  (void) WriteBlobString(image,buffer);
> ++                  (void) WriteBlobString(image,"  <area href=3D\"");
> ++                  WriteHtmlEncodedString(image,url);
> ++                  (void) WriteBlobString(image,"\"");
> +                 }
> +               geometry.x+=3D(ssize_t) geometry.width;
> +               if ((geometry.x+4) >=3D (ssize_t) image->columns)
> +@@ -390,7 +405,6 @@ static MagickBooleanType WriteHTMLImage(const
> ImageInfo *image_info,
> +                 }
> +             }
> +       (void) WriteBlobString(image,"</map>\n");
> +-      (void) CopyMagickString(filename,image->filename,MagickPathExtent=
);
> +       (void) WriteBlobString(image,"</div>\n");
> +       (void) WriteBlobString(image,"</body>\n");
> +       (void) WriteBlobString(image,"</html>\n");
> +@@ -398,7 +412,6 @@ static MagickBooleanType WriteHTMLImage(const
> ImageInfo *image_info,
> +       /*
> +         Write the image as PNG.
> +       */
> +-      (void) CopyMagickString(image->filename,filename,MagickPathExtent=
);
> +       AppendImageFormat("png",image->filename);
> +       next=3DGetNextImageInList(image);
> +       image->next=3DNewImageList();
> diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25798.patch
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25798.patch
> new file mode 100644
> index 0000000000..18758b625b
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25798.patc=
h
> @@ -0,0 +1,109 @@
> +From: Cristy <urban-warrior@imagemagick.org>
> +From: Naman Jain <namanj1@kpit.com>
> +Date: Sun, 1 Feb 2026 14:56:14 -0500
> +Subject: [PATCH] CVE-2026-25798
> +
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-p863-=
5fgm-rgq4
> +
> +a NULL pointer dereference in ClonePixelCacheRepository allows a remote
> attacker to crash any application linked against ImageMagick by supplying=
 a
> crafted image file, resulting in denial of service.
> +
> +(cherry picked from commit 16dd3158ce197c6f65e7798a7a5cc4538bb0303e)
> +
> +CVE: CVE-2026-25798
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/16dd3158ce197c6f65e7798=
a7a5cc4538bb0303e
> ]
> +
> +bug:
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-p863-=
5fgm-rgq4
> +origin:
> https://github.com/ImageMagick/ImageMagick/commit/16dd3158ce197c6f65e7798=
a7a5cc4538bb0303e
> +
> +Signed-off-by: Naman Jain <namanj1@kpit.com>
> +---
> + MagickCore/cache.c | 37 +++++++++++++++++++++++++++++++++----
> + coders/sixel.c     |  4 ++--
> + 2 files changed, 35 insertions(+), 6 deletions(-)
> +
> +diff --git a/MagickCore/cache.c b/MagickCore/cache.c
> +index 8df6945..5a36189 100644
> +--- a/MagickCore/cache.c
> ++++ b/MagickCore/cache.c
> +@@ -3500,6 +3500,25 @@ static MagickBooleanType MaskPixelCacheNexus(Imag=
e
> *image,NexusInfo *nexus_info,
> + %
> + */
> +
> ++static inline MagickBooleanType CacheOverflowSanityCheckGetSize(
> ++  const MagickSizeType count,const size_t quantum,MagickSizeType *const
> extent)
> ++{
> ++  MagickSizeType
> ++    length;
> ++
> ++  if ((count =3D=3D 0) || (quantum =3D=3D 0))
> ++    return(MagickTrue);
> ++  length=3Dcount*quantum;
> ++  if (quantum !=3D (length/count))
> ++    {
> ++      errno=3DENOMEM;
> ++      return(MagickTrue);
> ++    }
> ++  if (extent !=3D NULL)
> ++    *extent=3Dlength;
> ++  return(MagickFalse);
> ++}
> ++
> + static MagickBooleanType OpenPixelCacheOnDisk(CacheInfo *cache_info,
> +   const MapMode mode)
> + {
> +@@ -3650,7 +3669,7 @@ static MagickBooleanType OpenPixelCache(Image
> *image,const MapMode mode,
> +     status;
> +
> +   MagickSizeType
> +-    length,
> ++    length =3D 0,
> +     number_pixels;
> +
> +   size_t
> +@@ -3723,12 +3742,22 @@ static MagickBooleanType OpenPixelCache(Image
> *image,const MapMode mode,
> +   packet_size=3DMagickMax(cache_info->number_channels,1)*sizeof(Quantum=
);
> +   if (image->metacontent_extent !=3D 0)
> +     packet_size+=3Dcache_info->metacontent_extent;
> +-  length=3Dnumber_pixels*packet_size;
> ++  if (CacheOverflowSanityCheckGetSize(number_pixels,packet_size,&length=
)
> !=3D MagickFalse)
> ++    {
> ++      cache_info->storage_class=3DUndefinedClass;
> ++      cache_info->length=3D0;
> ++
> ThrowBinaryException(ResourceLimitError,"PixelCacheAllocationFailed",
> ++      image->filename);
> ++    }
> +   columns=3D(size_t) (length/cache_info->rows/packet_size);
> +   if ((cache_info->columns !=3D columns) || ((ssize_t) cache_info->colu=
mns
> < 0) ||
> +       ((ssize_t) cache_info->rows < 0))
> +-    ThrowBinaryException(ResourceLimitError,"PixelCacheAllocationFailed=
",
> +-      image->filename);
> ++    {
> ++      cache_info->storage_class=3DUndefinedClass;
> ++      cache_info->length=3D0;
> ++
> ThrowBinaryException(ResourceLimitError,"PixelCacheAllocationFailed",
> ++        image->filename);
> ++    }
> +   cache_info->length=3Dlength;
> +   if (image->ping !=3D MagickFalse)
> +     {
> +diff --git a/coders/sixel.c b/coders/sixel.c
> +index 08ca474..11d857d 100644
> +--- a/coders/sixel.c
> ++++ b/coders/sixel.c
> +@@ -544,7 +544,7 @@ static MagickBooleanType sixel_decode(Image
> *image,unsigned char *p,
> +                       if (max_x < position_x)
> +                           max_x =3D position_x;
> +                       if (max_y < (position_y + i))
> +-                          max_y =3D position_y + i;
> ++                          max_y =3D (int) (position_y + i);
> +                     }
> +                   sixel_vertical_mask <<=3D 1;
> +                 }
> +@@ -577,7 +577,7 @@ static MagickBooleanType sixel_decode(Image
> *image,unsigned char *p,
> +                       if (max_x < (position_x+repeat_count-1))
> +                         max_x =3D position_x+repeat_count-1;
> +                       if (max_y < (position_y+i+n-1))
> +-                        max_y =3D position_y+i+n-1;
> ++                        max_y =3D (int) (position_y+i+n-1);
> +                       i+=3D(n-1);
> +                       sixel_vertical_mask <<=3D (n-1);
> +                     }
> diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25799.patch
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25799.patch
> new file mode 100644
> index 0000000000..8dc511d2a4
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25799.patc=
h
> @@ -0,0 +1,42 @@
> +From: Cristy <urban-warrior@imagemagick.org>
> +Date: Sat, 31 Jan 2026 12:56:17 -0500
> +Subject: [PATCH] CVE-2026-25798
> +
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-543g-=
8grm-9cw6
> +
> +a logic error in YUV sampling factor validation allows an invalid
> sampling factor to bypass checks and trigger a division-by-zero during
> image loading, resulting in a reliable denial-of-service.
> +
> +(cherry picked from commit 412f3c8bc1d3b6890aad72376cd992c9b5177037)
> +
> +CVE: CVE-2026-25799
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/412f3c8bc1d3b6890aad723=
76cd992c9b5177037
> ]
> +
> +origin:
> https://github.com/ImageMagick/ImageMagick/commit/412f3c8bc1d3b6890aad723=
76cd992c9b5177037
> +bug:
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-543g-=
8grm-9cw6
> +
> +Signed-off-by: Naman Jain <namanj1@kpit.com>
> +---
> + coders/yuv.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/coders/yuv.c b/coders/yuv.c
> +index a1d5bf1..1817c43 100644
> +--- a/coders/yuv.c
> ++++ b/coders/yuv.c
> +@@ -165,7 +165,7 @@ static Image *ReadYUVImage(const ImageInfo
> *image_info,ExceptionInfo *exception)
> +       vertical_factor=3Dhorizontal_factor;
> +       if ((flags & SigmaValue) !=3D 0)
> +         vertical_factor=3D(ssize_t) geometry_info.sigma;
> +-      if ((horizontal_factor !=3D 1) && (horizontal_factor !=3D 2) &&
> ++      if ((horizontal_factor !=3D 1) && (horizontal_factor !=3D 2) ||
> +           (vertical_factor !=3D 1) && (vertical_factor !=3D 2))
> +
>  ThrowReaderException(CorruptImageError,"UnexpectedSamplingFactor");
> +     }
> +@@ -670,7 +670,7 @@ static MagickBooleanType WriteYUVImage(const
> ImageInfo *image_info,Image *image,
> +       vertical_factor=3Dhorizontal_factor;
> +       if ((flags & SigmaValue) !=3D 0)
> +         vertical_factor=3D(ssize_t) geometry_info.sigma;
> +-      if ((horizontal_factor !=3D 1) && (horizontal_factor !=3D 2) &&
> ++      if ((horizontal_factor !=3D 1) && (horizontal_factor !=3D 2) ||
> +           (vertical_factor !=3D 1) && (vertical_factor !=3D 2))
> +
>  ThrowWriterException(CorruptImageError,"UnexpectedSamplingFactor");
> +     }
> diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25897.patch
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25897.patch
> new file mode 100644
> index 0000000000..f1db20a6ad
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25897.patc=
h
> @@ -0,0 +1,34 @@
> +From: Dirk Lemstra <dirk@lemstra.org>
> +Date: Fri, 6 Feb 2026 22:21:19 +0100
> +Subject: Added extra check to prevent out of bounds heap write on 32-bit
> + systems (GHSA-6j5f-24fw-pqp4)
> +
> +(cherry picked from commit 23fde73188ea32c15b607571775d4f92bdb75e60)
> +
> +CVE: CVE-2026-25897
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/23fde73188ea32c15b60757=
1775d4f92bdb75e60
> ]
> +
> +origin:
> https://github.com/ImageMagick/ImageMagick/commit/23fde73188ea32c15b60757=
1775d4f92bdb75e60
> +bug:
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-6j5f-=
24fw-pqp4
> +
> +Signed-off-by: Naman Jain <namanj1@kpit.com>
> +---
> + coders/sun.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/coders/sun.c b/coders/sun.c
> +index f1452c5..76d7607 100644
> +--- a/coders/sun.c
> ++++ b/coders/sun.c
> +@@ -470,6 +470,11 @@ static Image *ReadSUNImage(const ImageInfo
> *image_info,ExceptionInfo *exception)
> +         sun_data=3D(unsigned char *) RelinquishMagickMemory(sun_data);
> +         ThrowReaderException(ResourceLimitError,"ImproperImageHeader");
> +       }
> ++    if (image->rows > (MAGICK_SIZE_MAX - pixels_length))
> ++      {
> ++        sun_data=3D(unsigned char *) RelinquishMagickMemory(sun_data);
> ++        ThrowReaderException(ResourceLimitError,"ImproperImageHeader");
> ++      }
> +     sun_pixels=3D(unsigned char *)
> AcquireQuantumMemory(pixels_length+image->rows,
> +       sizeof(*sun_pixels));
> +     if (sun_pixels =3D=3D (unsigned char *) NULL)
> diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_1.patch
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_1.patch
> new file mode 100644
> index 0000000000..8e68732131
> --- /dev/null
> +++
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_1.patch
> @@ -0,0 +1,39 @@
> +From: Dirk Lemstra <dirk@lemstra.org>
> +Date: Fri, 6 Feb 2026 20:55:43 +0100
> +Subject: Fixed out of bound read with negative pixel index
> + (GHSA-vpxv-r9pg-7gpr)
> +
> +(cherry picked from commit c9c87dbaba56bf82aebd3392e11f0ffd93709b12)
> +
> +CVE: CVE-2026-25898
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/c9c87dbaba56bf82aebd339=
2e11f0ffd93709b12
> ]
> +
> +origin:
> https://github.com/ImageMagick/ImageMagick/commit/c9c87dbaba56bf82aebd339=
2e11f0ffd93709b12
> +bug:
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-vpxv-=
r9pg-7gpr
> +
> +Signed-off-by: Naman Jain <namanj1@kpit.com>
> +---
> + coders/uil.c | 7 +++++--
> + 1 file changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/coders/uil.c b/coders/uil.c
> +index 74c45c7..ffcab49 100644
> +--- a/coders/uil.c
> ++++ b/coders/uil.c
> +@@ -352,11 +352,14 @@ static MagickBooleanType WriteUILImage(const
> ImageInfo *image_info,Image *image,
> +     for (x=3D0; x < (ssize_t) image->columns; x++)
> +     {
> +       k=3D((ssize_t) GetPixelIndex(image,p) % MaxCixels);
> ++      if (k < 0)
> ++        k=3D0;
> +       symbol[0]=3DCixel[k];
> +       for (j=3D1; j < (int) characters_per_pixel; j++)
> +       {
> +-        k=3D(((int) GetPixelIndex(image,p)-k)/MaxCixels) %
> +-          MaxCixels;
> ++        k=3D(((int) GetPixelIndex(image,p)-k)/MaxCixels) % MaxCixels;
> ++        if (k < 0)
> ++          k=3D0;
> +         symbol[j]=3DCixel[k];
> +       }
> +       symbol[j]=3D'\0';
> diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_2.patch
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_2.patch
> new file mode 100644
> index 0000000000..563d5612b0
> --- /dev/null
> +++
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_2.patch
> @@ -0,0 +1,37 @@
> +From: Dirk Lemstra <dirk@lemstra.org>
> +Date: Sun, 8 Feb 2026 14:15:46 +0100
> +Subject: Fixed out of bound read with negative pixel index
> + (GHSA-vpxv-r9pg-7gpr)
> +
> +(cherry picked from commit 21525d8f27b86e8063fe359616086fd6b71eb05b)
> +
> +CVE: CVE-2026-25898
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/21525d8f27b86e8063fe359=
616086fd6b71eb05b
> ]
> +
> +origin:
> https://github.com/ImageMagick/ImageMagick/commit/21525d8f27b86e8063fe359=
616086fd6b71eb05b
> +bug:
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-vpxv-=
r9pg-7gpr
> +
> +Signed-off-by: Naman Jain <namanj1@kpit.com>
> +---
> + coders/xpm.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/coders/xpm.c b/coders/xpm.c
> +index 1dda89f..4a77b48 100644
> +--- a/coders/xpm.c
> ++++ b/coders/xpm.c
> +@@ -1131,10 +1131,14 @@ static MagickBooleanType WriteXPMImage(const
> ImageInfo *image_info,Image *image,
> +     for (x=3D0; x < (ssize_t) image->columns; x++)
> +     {
> +       k=3D((ssize_t) GetPixelIndex(image,p) % MaxCixels);
> ++      if (k < 0)
> ++        k=3D0;
> +       symbol[0]=3DCixel[k];
> +       for (j=3D1; j < (ssize_t) characters_per_pixel; j++)
> +       {
> +         k=3D(((int) GetPixelIndex(image,p)-k)/MaxCixels) % MaxCixels;
> ++        if (k < 0)
> ++          k=3D0;
> +         symbol[j]=3DCixel[k];
> +       }
> +       symbol[j]=3D'\0';
> diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25965.patch
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25965.patch
> new file mode 100644
> index 0000000000..d57b62e83a
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25965.patc=
h
> @@ -0,0 +1,322 @@
> +From: Dirk Lemstra <dirk@lemstra.org>
> +Date: Tue, 3 Feb 2026 21:09:59 +0100
> +Subject: Prevent path traversal of paths that are blocked in the securit=
y
> + policy (GHSA-8jvj-p28h-9gm7)
> +
> +(cherry picked from commit 4a9dc1075dcad3ab0579e1b37dbe854c882699a5)
> +
> +CVE: CVE-2026-25965
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/4a9dc1075dcad3ab0579e1b=
37dbe854c882699a5
> ]
> +
> +origin: backport,
> https://github.com/ImageMagick/ImageMagick/commit/4a9dc1075dcad3ab0579e1b=
37dbe854c882699a5
> +bug:
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-8jvj-=
p28h-9gm7
> +
> +Signed-off-by: Naman Jain <namanj1@kpit.com>
> +---
> + MagickCore/module.c          |  11 +++--
> + MagickCore/policy.c          |  39 ++++++++++-----
> + MagickCore/token.c           |   2 +
> + MagickCore/utility-private.h | 115
> +++++++++++++++++++++++++++++++++++++++++++
> + MagickCore/utility.c         |  28 +++++++----
> + 5 files changed, 169 insertions(+), 26 deletions(-)
> +
> +diff --git a/MagickCore/module.c b/MagickCore/module.c
> +index e36214d..5332a71 100644
> +--- a/MagickCore/module.c
> ++++ b/MagickCore/module.c
> +@@ -584,15 +584,16 @@ static MagickBooleanType GetMagickModulePath(const
> char *filename,
> +           (void) ConcatenateMagickString(path,DirectorySeparator,
> +             MagickPathExtent);
> +         (void) ConcatenateMagickString(path,filename,MagickPathExtent);
> +-#if defined(MAGICKCORE_HAVE_REALPATH)
> +         {
> +           char
> +-            resolved_path[PATH_MAX+1];
> ++            *real_path =3D realpath_utf8(path);
> +
> +-          if (realpath(path,resolved_path) !=3D (char *) NULL)
> +-            (void) CopyMagickString(path,resolved_path,MagickPathExtent=
);
> ++          if (real_path !=3D (char *) NULL)
> ++            {
> ++              (void) CopyMagickString(path,real_path,MagickPathExtent);
> ++              real_path=3DDestroyString(real_path);
> ++            }
> +         }
> +-#endif
> +         if (IsPathAccessible(path) !=3D MagickFalse)
> +           {
> +             module_path=3DDestroyString(module_path);
> +diff --git a/MagickCore/policy.c b/MagickCore/policy.c
> +index 8cfcee0..0e036c0 100644
> +--- a/MagickCore/policy.c
> ++++ b/MagickCore/policy.c
> +@@ -640,6 +640,9 @@ static MagickBooleanType
> IsPolicyCacheInstantiated(ExceptionInfo *exception)
> + MagickExport MagickBooleanType IsRightsAuthorized(const PolicyDomain
> domain,
> +   const PolicyRights rights,const char *pattern)
> + {
> ++  char
> ++    *real_pattern =3D (char *) NULL;
> ++
> +   const PolicyInfo
> +     *policy_info;
> +
> +@@ -647,7 +650,8 @@ MagickExport MagickBooleanType
> IsRightsAuthorized(const PolicyDomain domain,
> +     *exception;
> +
> +   MagickBooleanType
> +-    authorized;
> ++    authorized,
> ++    match;
> +
> +   ElementInfo
> +     *p;
> +@@ -671,22 +675,33 @@ MagickExport MagickBooleanType
> IsRightsAuthorized(const PolicyDomain domain,
> +       *policy;
> +
> +     policy=3D(const PolicyInfo *) p->value;
> +-    if ((policy->domain =3D=3D domain) &&
> +-        (GlobExpression(pattern,policy->pattern,MagickFalse) !=3D
> MagickFalse))
> ++    if (policy->domain =3D=3D domain)
> +       {
> +-        if ((rights & ReadPolicyRights) !=3D 0)
> +-          authorized=3D(policy->rights & ReadPolicyRights) !=3D 0 ?
> MagickTrue :
> +-            MagickFalse;
> +-        if ((rights & WritePolicyRights) !=3D 0)
> +-          authorized=3D(policy->rights & WritePolicyRights) !=3D 0 ?
> MagickTrue :
> +-            MagickFalse;
> +-        if ((rights & ExecutePolicyRights) !=3D 0)
> +-          authorized=3D(policy->rights & ExecutePolicyRights) !=3D 0 ?
> MagickTrue :
> +-            MagickFalse;
> ++        if ((policy->domain =3D=3D PathPolicyDomain) &&
> ++            (real_pattern =3D=3D (const char *) NULL))
> ++          real_pattern=3Drealpath_utf8(pattern);
> ++        if (real_pattern !=3D (char*) NULL)
> ++          match=3DGlobExpression(real_pattern,policy->pattern,MagickFal=
se);
> ++        else
> ++          match=3DGlobExpression(pattern,policy->pattern,MagickFalse);
> ++        if (match !=3D MagickFalse)
> ++          {
> ++            if ((rights & ReadPolicyRights) !=3D 0)
> ++              authorized=3D(policy->rights & ReadPolicyRights) !=3D 0 ?
> MagickTrue :
> ++                MagickFalse;
> ++            if ((rights & WritePolicyRights) !=3D 0)
> ++              authorized=3D(policy->rights & WritePolicyRights) !=3D 0 =
?
> ++                MagickTrue : MagickFalse;
> ++            if ((rights & ExecutePolicyRights) !=3D 0)
> ++              authorized=3D(policy->rights & ExecutePolicyRights) !=3D =
0 ?
> ++                MagickTrue : MagickFalse;
> ++          }
> +       }
> +     p=3Dp->next;
> +   }
> +   UnlockSemaphoreInfo(policy_semaphore);
> ++  if (real_pattern !=3D (char *) NULL)
> ++    real_pattern=3DDestroyString(real_pattern);
> +   return(authorized);
> + }
> +
> +diff --git a/MagickCore/token.c b/MagickCore/token.c
> +index 9763069..70085b4 100644
> +--- a/MagickCore/token.c
> ++++ b/MagickCore/token.c
> +@@ -518,6 +518,7 @@ MagickExport MagickBooleanType GlobExpression(
> +         target=3DDestroyString(target);
> +         break;
> +       }
> ++#if !defined(MAGICKCORE_WINDOWS_SUPPORT) || defined(__CYGWIN__)
> +       case '\\':
> +       {
> +         pattern+=3DGetUTFOctets(pattern);
> +@@ -525,6 +526,7 @@ MagickExport MagickBooleanType GlobExpression(
> +           break;
> +         magick_fallthrough;
> +       }
> ++#endif
> +       default:
> +       {
> +         if (case_insensitive !=3D MagickFalse)
> +diff --git a/MagickCore/utility-private.h b/MagickCore/utility-private.h
> +index b3d951c..c28d4c5 100644
> +--- a/MagickCore/utility-private.h
> ++++ b/MagickCore/utility-private.h
> +@@ -252,6 +252,121 @@ static inline FILE *popen_utf8(const char
> *command,const char *type)
> + #endif
> + }
> +
> ++static inline char *realpath_utf8(const char *path)
> ++{
> ++#if !defined(MAGICKCORE_WINDOWS_SUPPORT) || defined(__CYGWIN__)
> ++#if defined(MAGICKCORE_HAVE_REALPATH)
> ++  return(realpath(path,(char *) NULL));
> ++#else
> ++  return(AcquireString(path));
> ++#endif
> ++#else
> ++  char
> ++    *real_path;
> ++
> ++  DWORD
> ++    final_path_length,
> ++    full_path_length;
> ++
> ++  HANDLE
> ++    file_handle;
> ++
> ++  int
> ++    length,
> ++    utf8_length;
> ++
> ++  wchar_t
> ++    *clean_path,
> ++    *full_path,
> ++    *wide_path;
> ++
> ++  /*
> ++    Convert UTF-8 to UTF-16.
> ++  */
> ++  if (path =3D=3D (const char *) NULL)
> ++    return((char *) NULL);
> ++  length=3DMultiByteToWideChar(CP_UTF8,0,path,-1,NULL,0);
> ++  if (length <=3D 0)
> ++    return((char *) NULL);
> ++  wide_path=3D(wchar_t *) AcquireQuantumMemory(length,sizeof(wchar_t));
> ++  if (wide_path =3D=3D (wchar_t *) NULL)
> ++    return((char *) NULL);
> ++  MultiByteToWideChar(CP_UTF8,0,path,-1,wide_path,length);
> ++  /*
> ++    Normalize syntactically.
> ++  */
> ++  full_path_length=3DGetFullPathNameW(wide_path,0,NULL,NULL);
> ++  if (full_path_length =3D=3D 0)
> ++    {
> ++      wide_path=3D(wchar_t *) RelinquishMagickMemory(wide_path);
> ++      return((char *) NULL);
> ++    }
> ++  full_path=3D(wchar_t *)
> AcquireQuantumMemory(full_path_length,sizeof(wchar_t));
> ++  if (full_path =3D=3D (wchar_t *) NULL)
> ++    {
> ++      wide_path=3D(wchar_t *) RelinquishMagickMemory(wide_path);
> ++      return((char *) NULL);
> ++    }
> ++  GetFullPathNameW(wide_path,full_path_length,full_path,NULL);
> ++  wide_path=3D(wchar_t *) RelinquishMagickMemory(wide_path);
> ++  /*
> ++    Open the file/directory to resolve symlinks.
> ++  */
> ++  file_handle=3DCreateFileW(full_path,GENERIC_READ,FILE_SHARE_READ |
> ++    FILE_SHARE_WRITE | FILE_SHARE_DELETE,NULL,OPEN_EXISTING,
> ++    FILE_FLAG_BACKUP_SEMANTICS,NULL);
> ++  if (file_handle !=3D INVALID_HANDLE_VALUE)
> ++    {
> ++      /*
> ++        Resolve final canonical path.
> ++      */
> ++      final_path_length=3DGetFinalPathNameByHandleW(file_handle,NULL,0,
> ++        FILE_NAME_NORMALIZED);
> ++      if (final_path_length =3D=3D 0)
> ++        {
> ++          CloseHandle(file_handle);
> ++          full_path=3D(wchar_t *) RelinquishMagickMemory(full_path);
> ++          return((char *) NULL);
> ++        }
> ++      full_path=3D(wchar_t *) RelinquishMagickMemory(full_path);
> ++      full_path=3D(wchar_t *) AcquireQuantumMemory(final_path_length,
> ++        sizeof(wchar_t));
> ++      if (full_path =3D=3D (wchar_t *) NULL)
> ++        {
> ++          CloseHandle(file_handle);
> ++          return((char *) NULL);
> ++        }
> ++      GetFinalPathNameByHandleW(file_handle,full_path,final_path_length=
,
> ++        FILE_NAME_NORMALIZED);
> ++      CloseHandle(file_handle);
> ++    }
> ++  /*
> ++    Remove \\?\ prefix for POSIX-like behavior.
> ++  */
> ++  clean_path=3Dfull_path;
> ++  if (wcsncmp(full_path,L"\\\\?\\",4) =3D=3D 0)
> ++    clean_path=3Dfull_path+4;
> ++  /*
> ++    Convert UTF-16 to UTF-8.
> ++  */
> ++
> utf8_length=3DWideCharToMultiByte(CP_UTF8,0,clean_path,-1,NULL,0,NULL,NUL=
L);
> ++  if (utf8_length <=3D 0)
> ++    {
> ++      full_path=3D(wchar_t *) RelinquishMagickMemory(full_path);
> ++      return NULL;
> ++    }
> ++  real_path=3D(char *) AcquireQuantumMemory(utf8_length,sizeof(char));
> ++  if (real_path =3D=3D (char *) NULL)
> ++    {
> ++      full_path=3D(wchar_t *) RelinquishMagickMemory(full_path);
> ++      return NULL;
> ++    }
> ++
> WideCharToMultiByte(CP_UTF8,0,clean_path,-1,real_path,utf8_length,NULL,NU=
LL);
> ++  full_path=3D(wchar_t *) RelinquishMagickMemory(full_path);
> ++  return(real_path);
> ++#endif
> ++}
> ++
> + static inline int remove_utf8(const char *path)
> + {
> + #if !defined(MAGICKCORE_WINDOWS_SUPPORT) || defined(__CYGWIN__)
> +diff --git a/MagickCore/utility.c b/MagickCore/utility.c
> +index bbeef37..4fd6e9c 100644
> +--- a/MagickCore/utility.c
> ++++ b/MagickCore/utility.c
> +@@ -1042,16 +1042,23 @@ MagickPrivate MagickBooleanType
> GetExecutionPath(char *path,const size_t extent)
> + #if defined(MAGICKCORE_HAVE__NSGETEXECUTABLEPATH)
> +   {
> +     char
> +-      executable_path[PATH_MAX << 1],
> +-      execution_path[PATH_MAX+1];
> ++      executable_path[PATH_MAX << 1];
> +
> +     uint32_t
> +       length;
> +
> +     length=3Dsizeof(executable_path);
> +-    if ((_NSGetExecutablePath(executable_path,&length) =3D=3D 0) &&
> +-        (realpath(executable_path,execution_path) !=3D (char *) NULL))
> +-      (void) CopyMagickString(path,execution_path,extent);
> ++    if (_NSGetExecutablePath(executable_path,&length) =3D=3D 0)
> ++      {
> ++        char
> ++          *real_path =3D realpath_utf8(executable_path);
> ++
> ++        if (real_path !=3D (char *) NULL)
> ++          {
> ++            (void) CopyMagickString(path,real_path,extent);
> ++            real_path=3DDestroyString(real_path);
> ++          }
> ++      }
> +   }
> + #endif
> + #if defined(MAGICKCORE_HAVE_GETEXECNAME)
> +@@ -1097,10 +1104,13 @@ MagickPrivate MagickBooleanType
> GetExecutionPath(char *path,const size_t extent)
> +     if (count !=3D -1)
> +       {
> +         char
> +-          execution_path[PATH_MAX+1];
> ++          *real_path =3D realpath_utf8(program_name);
> +
> +-        if (realpath(program_name,execution_path) !=3D (char *) NULL)
> +-          (void) CopyMagickString(path,execution_path,extent);
> ++        if (real_path !=3D (char *) NULL)
> ++          {
> ++            (void) CopyMagickString(path,real_path,extent);
> ++            real_path=3DDestroyString(real_path);
> ++          }
> +       }
> +     if (program_name !=3D program_invocation_name)
> +       program_name=3D(char *) RelinquishMagickMemory(program_name);
> +@@ -1882,7 +1892,7 @@ MagickPrivate MagickBooleanType ShredFile(const
> char *path)
> +     {
> +       char
> +         *property;
> +-
> ++
> +       passes=3D0;
> +       property=3DGetEnvironmentValue("MAGICK_SHRED_PASSES");
> +       if (property !=3D (char *) NULL)
> diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25966.patch
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25966.patch
> new file mode 100644
> index 0000000000..324443e5f0
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25966.patc=
h
> @@ -0,0 +1,56 @@
> +From: Dirk Lemstra <dirk@lemstra.org>
> +Date: Tue, 3 Feb 2026 20:00:28 +0100
> +Subject: Block reading from fd: in our more secure policies by default
> + (GHSA-xwc6-v6g8-pw2h)
> +
> +(cherry picked from commit 8d4c67a90ae458fb36393a05c0069e9123ac174c)
> +
> +CVE: CVE-2026-25966
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/8d4c67a90ae458fb36393a0=
5c0069e9123ac174c
> ]
> +
> +origin: backport,
> https://github.com/ImageMagick/ImageMagick/commit/8d4c67a90ae458fb36393a0=
5c0069e9123ac174c
> +bug:
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-xwc6-=
v6g8-pw2h
> +
> +Signed-off-by: Naman Jain <namanj1@kpit.com>
> +---
> + config/policy-secure.xml  | 1 +
> + config/policy-websafe.xml | 1 +
> + www/security-policy.html  | 1 +
> + 3 files changed, 3 insertions(+)
> +
> +diff --git a/config/policy-secure.xml b/config/policy-secure.xml
> +index 0d312d2..4239822 100644
> +--- a/config/policy-secure.xml
> ++++ b/config/policy-secure.xml
> +@@ -88,6 +88,7 @@
> +   <policy domain=3D"filter" rights=3D"none" pattern=3D"*"/>
> +   <!-- Don't read/write from/to stdin/stdout. -->
> +   <policy domain=3D"path" rights=3D"none" pattern=3D"-"/>
> ++  <policy domain=3D"path" rights=3D"none" pattern=3D"fd:*"/>
> +   <!-- don't read sensitive paths. -->
> +   <policy domain=3D"path" rights=3D"none" pattern=3D"/etc/*"/>
> +   <!-- Indirect reads are not permitted. -->
> +diff --git a/config/policy-websafe.xml b/config/policy-websafe.xml
> +index 05327e3..544bf74 100644
> +--- a/config/policy-websafe.xml
> ++++ b/config/policy-websafe.xml
> +@@ -84,6 +84,7 @@
> +   <policy domain=3D"filter" rights=3D"none" pattern=3D"*"/>
> +   <!-- Don't read/write from/to stdin/stdout. -->
> +   <policy domain=3D"path" rights=3D"none" pattern=3D"-"/>
> ++  <policy domain=3D"path" rights=3D"none" pattern=3D"fd:*"/>
> +   <!-- don't read sensitive paths. -->
> +   <policy domain=3D"path" rights=3D"none" pattern=3D"/etc/*"/>
> +   <!-- Indirect reads are not permitted. -->
> +diff --git a/www/security-policy.html b/www/security-policy.html
> +index af8c206..b254962 100644
> +--- a/www/security-policy.html
> ++++ b/www/security-policy.html
> +@@ -250,6 +250,7 @@
> +   &lt;policy domain=3D"filter" rights=3D"none" pattern=3D"*"/>
> +   &lt;!-- Don't read/write from/to stdin/stdout. -->
> +   &lt;policy domain=3D"path" rights=3D"none" pattern=3D"-"/>
> ++  &lt;policy domain=3D"path" rights=3D"none" pattern=3D"fd:*"/>
> +   &lt;!-- don't read sensitive paths. -->
> +   &lt;policy domain=3D"path" rights=3D"none" pattern=3D"/etc/*"/>
> +   &lt;!-- Indirect reads are not permitted. -->
> diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25967.patch
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25967.patch
> new file mode 100644
> index 0000000000..d9b7efc9c1
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25967.patc=
h
> @@ -0,0 +1,38 @@
> +From: Cristy <urban-warrior@imagemagick.org>
> +Date: Sat, 31 Jan 2026 12:59:33 -0500
> +Subject: [PATCH] CVE-2026-25967
> +
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-72hf-=
fj62-w6j4
> +
> +a stack-based buffer overflow exists in the ImageMagick FTXT image
> reader. A crafted FTXT file can cause out-of-bounds writes on the stack,
> leading to a crash.
> +
> +(cherry picked from commit 9afe96cc325da1e4349fbd7418675af2f8708c10)
> +
> +CVE: CVE-2026-25967
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/9afe96cc325da1e4349fbd7=
418675af2f8708c10
> ]
> +
> +origin:
> https://github.com/ImageMagick/ImageMagick/commit/9afe96cc325da1e4349fbd7=
418675af2f8708c10
> +bug:
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-72hf-=
fj62-w6j4
> +
> +Signed-off-by: Naman Jain <namanj1@kpit.com>
> +---
> + coders/ftxt.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/coders/ftxt.c b/coders/ftxt.c
> +index d665bec..e9bb47f 100644
> +--- a/coders/ftxt.c
> ++++ b/coders/ftxt.c
> +@@ -197,11 +197,11 @@ static int ReadInt(Image * image,MagickBooleanType
> *eofInp,int *chPushed,
> +     if (p-buffer >=3D MaxTextExtent)
> +       {
> +         *eofInp=3DMagickTrue;
> +-        continue;
> ++        break;
> +       }
> +     chIn=3DReadChar(image,chPushed);
> +   }
> +-  if (p=3D=3Dbuffer)
> ++  if (p =3D=3D buffer)
> +     {
> +       *eofInp=3DMagickTrue;
> +       return(0);
> diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25968.patch
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25968.patch
> new file mode 100644
> index 0000000000..bad2ace65d
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25968.patc=
h
> @@ -0,0 +1,39 @@
> +From: Dirk Lemstra <dirk@lemstra.org>
> +Date: Tue, 3 Feb 2026 22:40:04 +0100
> +Subject: Patch to resolve possible out of bounds write in the msl decode=
r
> + (GHSA-3mwp-xqp2-q6ph).
> +
> +(cherry picked from commit 56f02958890b820cf2d0a6ecb04eb6f58ea75628)
> +
> +CVE: CVE-2026-25969
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/56f02958890b820cf2d0a6e=
cb04eb6f58ea75628
> ]
> +
> +origin:
> https://github.com/ImageMagick/ImageMagick/commit/56f02958890b820cf2d0a6e=
cb04eb6f58ea75628
> +bug:
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-3mwp-=
xqp2-q6ph
> +
> +Signed-off-by: Naman Jain <namanj1@kpit.com>
> +---
> + coders/msl.c | 9 +++++----
> + 1 file changed, 5 insertions(+), 4 deletions(-)
> +
> +diff --git a/coders/msl.c b/coders/msl.c
> +index 9facbf2..4af3a71 100644
> +--- a/coders/msl.c
> ++++ b/coders/msl.c
> +@@ -5827,11 +5827,12 @@ static void MSLStartElement(void *context,const
> xmlChar *tag,
> +                   Quantum  opac =3D OpaqueAlpha;
> +                   ssize_t len =3D (ssize_t) strlen( value );
> +
> +-                  if (value[len-1] =3D=3D '%') {
> +-                    char  tmp[100];
> ++                  if ((len > 0) && (value[len-1] =3D=3D '%')) {
> ++                    char *tmp =3D AcquireString(value);
> +                     (void) CopyMagickString(tmp,value,(size_t) len);
> +-                    opac =3D StringToLong( tmp );
> +-                    opac =3D (int)(QuantumRange * ((float)opac/100));
> ++                    opac =3D (Quantum) StringToLong( tmp );
> ++                    tmp=3DDestroyString(tmp);
> ++                    opac =3D (Quantum)(QuantumRange * ((float)opac/100)=
);
> +                   } else
> +                     opac =3D StringToLong( value );
> +                   (void) SetImageAlpha( msl_info->image[n], (Quantum)
> opac,
> diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25969.patch
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25969.patch
> new file mode 100644
> index 0000000000..4432a5c9d8
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25969.patc=
h
> @@ -0,0 +1,63 @@
> +From: Cristy <urban-warrior@imagemagick.org>
> +Date: Wed, 28 Jan 2026 20:33:56 -0500
> +Subject: [PATCH] CVE-2026-25969
> +
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-xgm3-=
v4r9-wfgm
> +
> +a memory leak exists in `coders/ashlar.c`. The `WriteASHLARImage`
> allocates a structure. However, when an exception is thrown, the allocate=
d
> memory is not properly released, resulting in a potential memory leak.
> +
> +(cherry picked from commit a253d1b124ebdcc2832daac6f9a35c362635b40e)
> +
> +CVE: CVE-2026-25969
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/a253d1b124ebdcc2832daac=
6f9a35c362635b40e
> ]
> +
> +[backport]
> +- do not change border parameters, keep old parameter in patch context
> +
> +origin: backport,
> https://github.com/ImageMagick/ImageMagick/commit/a253d1b124ebdcc2832daac=
6f9a35c362635b40e
> +bug:
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-xgm3-=
v4r9-wfgm
> +
> +Signed-off-by: Naman Jain <namanj1@kpit.com>
> +---
> + coders/ashlar.c | 7 +++++--
> + 1 file changed, 5 insertions(+), 2 deletions(-)
> +
> +diff --git a/coders/ashlar.c b/coders/ashlar.c
> +index a44976f..1984215 100644
> +--- a/coders/ashlar.c
> ++++ b/coders/ashlar.c
> +@@ -543,7 +543,8 @@ static Image *ASHLARImage(ImageInfo *image_info,Imag=
e
> *image,
> +       geometry.height=3D(size_t) geometry.height/7;
> +       geometry.x=3D(ssize_t) pow((double) geometry.width,0.25);
> +       geometry.y=3D(ssize_t) pow((double) geometry.height,0.25);
> +-      image_info->extract=3DAcquireString("");
> ++      if (image_info->extract =3D=3D (char *) NULL)
> ++        image_info->extract=3DAcquireString("");
> +       if (image_info->extract !=3D (char *) NULL)
> +         (void) FormatLocaleString(image_info->extract,MagickPathExtent,
> +           "%gx%g%+g%+g",(double) geometry.width,(double) geometry.heigh=
t,
> +@@ -707,7 +708,6 @@ static MagickBooleanType WriteASHLARImage(const
> ImageInfo *image_info,
> +   if (value !=3D (const char *) NULL)
> +     tiles_per_page=3D(size_t) MagickMax(StringToInteger(value),1);
> +   ashlar_images=3DNewImageList();
> +-  write_info=3DCloneImageInfo(image_info);
> +   for (i=3D0; i < (ssize_t) GetImageListLength(image); i+=3D(ssize_t)
> tiles_per_page)
> +   {
> +     char
> +@@ -726,7 +726,9 @@ static MagickBooleanType WriteASHLARImage(const
> ImageInfo *image_info,
> +           ashlar_images=3DDestroyImageList(ashlar_images);
> +         break;
> +       }
> ++    write_info=3DCloneImageInfo(image_info);
> +     ashlar_image=3DASHLARImage(write_info,clone_images,exception);
> ++    write_info=3DDestroyImageInfo(write_info);
> +     clone_images=3DDestroyImageList(clone_images);
> +     if (ashlar_image =3D=3D (Image *) NULL)
> +       {
> +@@ -741,6 +743,7 @@ static MagickBooleanType WriteASHLARImage(const
> ImageInfo *image_info,
> +   ashlar_images=3DGetFirstImageInList(ashlar_images);
> +   (void) CopyMagickString(ashlar_images->filename,image_info->filename,
> +     MagickPathExtent);
> ++  write_info=3DCloneImageInfo(image_info);
> +   *write_info->magick=3D'\0';
> +   (void) SetImageInfo(write_info,(unsigned int)
> +     GetImageListLength(ashlar_images),exception);
> diff --git
> a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970.patch
> b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970.patch
> new file mode 100644
> index 0000000000..0483050a2b
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970.patc=
h
> @@ -0,0 +1,139 @@
> +From: Cristy <urban-warrior@imagemagick.org>
> +Date: Sun, 1 Feb 2026 13:55:34 -0500
> +Subject:
> +
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-xg29-=
8ghv-v4xr
> +
> +(cherry picked from commit 729253dc16e1a1ec4cac891a12d597e3fa9336b3)
> +
> +CVE: CVE-2026-25970
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/729253dc16e1a1ec4cac891=
a12d597e3fa9336b3
> ]
> +
> +a signed integer overflow vulnerability in ImageMagick's SIXEL decoder
> allows an attacker to trigger memory corruption and denial of service whe=
n
> processing a maliciously crafted SIXEL image file. The vulnerability occu=
rs
> during buffer reallocation operations where pointer arithmetic using sign=
ed
> 32-bit integers overflows
> +
> +origin: backport,
> <https://github.com/ImageMagick/ImageMagick/commit/729253dc16e1a1ec4cac89=
1a12d597e3fa9336b3>

--000000000000eaf8e5064f8e89e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,<div dir=3D"auto">Please let us know if you will ne=
ed any further=C2=A0information for it.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Thanks and regards,</div><div dir=3D"auto">Naman jain</div>=
</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, 14 Apr, 2026, 9:34=E2=80=AFam Naman Jain, &lt=
;<a href=3D"mailto:nmjain23@gmail.com">nmjain23@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">Fix the following CVEs-<br>
CVE-2026-24481 CVE-2026-25638 CVE-2026-25794 CVE-2026-25795<br>
CVE-2026-25796 CVE-2026-25797 CVE-2026-25798 CVE-2026-25799<br>
CVE-2026-25897 CVE-2026-25898 CVE-2026-25965 CVE-2026-25966<br>
CVE-2026-25967 CVE-2026-25968 CVE-2026-25969 CVE-2026-25970<br>
CVE-2026-25982 CVE-2026-25985 CVE-2026-25986 CVE-2026-25987<br>
CVE-2026-25988 CVE-2026-26066 CVE-2026-26283 CVE-2026-26284<br>
CVE-2026-26983<br>
<br>
Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=3D=
"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
---<br>
=C2=A0.../imagemagick/CVE-2026-24481.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 30 ++<br>
=C2=A0.../imagemagick/CVE-2026-25638.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 29 ++<br>
=C2=A0.../imagemagick/CVE-2026-25794.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 60 +++<br>
=C2=A0.../imagemagick/CVE-2026-25795.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 32 ++<br>
=C2=A0.../imagemagick/CVE-2026-25796.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 46 +++<br>
=C2=A0.../imagemagick/CVE-2026-25797_1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3=
44 ++++++++++++++++++<br>
=C2=A0.../imagemagick/CVE-2026-25797_2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
43 ++++++++<br>
=C2=A0.../imagemagick/CVE-2026-25798.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 109 ++++++<br>
=C2=A0.../imagemagick/CVE-2026-25799.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 42 +++<br>
=C2=A0.../imagemagick/CVE-2026-25897.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 34 ++<br>
=C2=A0.../imagemagick/CVE-2026-25898_1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 39 ++<br>
=C2=A0.../imagemagick/CVE-2026-25898_2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 37 ++<br>
=C2=A0.../imagemagick/CVE-2026-25965.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 322 ++++++++++++++++<br>
=C2=A0.../imagemagick/CVE-2026-25966.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 56 +++<br>
=C2=A0.../imagemagick/CVE-2026-25967.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 38 ++<br>
=C2=A0.../imagemagick/CVE-2026-25968.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 39 ++<br>
=C2=A0.../imagemagick/CVE-2026-25969.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 63 ++++<br>
=C2=A0.../imagemagick/CVE-2026-25970.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 139 +++++++<br>
=C2=A0.../imagemagick/CVE-2026-25970_pre1.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
57 +++<br>
=C2=A0.../imagemagick/CVE-2026-25982.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 77 ++++<br>
=C2=A0.../imagemagick/CVE-2026-25985.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 67 ++++<br>
=C2=A0.../imagemagick/CVE-2026-25986.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 42 +++<br>
=C2=A0.../imagemagick/CVE-2026-25987.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 44 +++<br>
=C2=A0.../imagemagick/CVE-2026-25988.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 50 +++<br>
=C2=A0.../imagemagick/CVE-2026-26066.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 49 +++<br>
=C2=A0.../imagemagick/CVE-2026-26283.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 33 ++<br>
=C2=A0.../imagemagick/CVE-2026-26284.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 31 ++<br>
=C2=A0.../imagemagick/CVE-2026-26983.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 41 +++<br>
=C2=A0.../imagemagick/<a href=3D"http://imagemagick_7.1.1.bb" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">imagemagick_7.1.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 28 ++<br>
=C2=A029 files changed, 2121 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-24481.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25638.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25794.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25795.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25796.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25797_1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25797_2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25798.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25799.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25897.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25898_1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25898_2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25965.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25966.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25967.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25968.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25969.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25970.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25970_pre1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25982.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25985.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25986.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25987.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-25988.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-26066.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-26283.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-26284.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CV=
E-2026-26983.patch<br>
<br>
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481=
.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.pat=
ch<br>
new file mode 100644<br>
index 0000000000..abfa1f817c<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-24481.patch<=
br>
@@ -0,0 +1,30 @@<br>
+From: Dirk Lemstra &lt;<a href=3D"mailto:dirk@lemstra.org" target=3D"_blan=
k" rel=3D"noreferrer">dirk@lemstra.org</a>&gt;<br>
+Date: Fri, 23 Jan 2026 13:19:06 +0100<br>
+Subject: Initialize the pixels with empty values to prevent possible heap<=
br>
+ information disclosure (GHSA-96pc-27rx-pr36)<br>
+<br>
+(cherry picked from commit 51c9d33f4770cdcfa1a029199375d570af801c97)<br>
+<br>
+CVE: CVE-2026-24481<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick6/commit/38872ec2a70084813883ea152f18497911823c18" rel=3D"noreferrer =
noreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick6/c=
ommit/38872ec2a70084813883ea152f18497911823c18</a>]<br>
+<br>
+origin: <a href=3D"https://github.com/ImageMagick/ImageMagick/commit/51c9d=
33f4770cdcfa1a029199375d570af801c97" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/ImageMagick/ImageMagick/commit/51c9d33f4770c=
dcfa1a029199375d570af801c97</a><br>
+bug: <a href=3D"https://github.com/ImageMagick/ImageMagick/security/adviso=
ries/GHSA-96pc-27rx-pr36" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-96pc-27r=
x-pr36</a><br>
+<br>
+Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
+---<br>
+ coders/psd.c | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/coders/psd.c b/coders/psd.c<br>
+index 050abcd..7e2b3eb 100644<br>
+--- a/coders/psd.c<br>
++++ b/coders/psd.c<br>
+@@ -1331,6 +1331,7 @@ static MagickBooleanType ReadPSDChannelZip(Image *im=
age,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ThrowBinaryException(ResourceLimitError,&quot;M=
emoryAllocationFailed&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image-&gt;filename);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 memset(pixels,0,count*sizeof(*pixels));<br>
+=C2=A0 =C2=A0if (ReadBlob(image,compact_size,compact_pixels) !=3D (ssize_t=
) compact_size)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pixels=3D(unsigned char *) RelinquishMagickMemo=
ry(pixels);<br>
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25638=
.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25638.pat=
ch<br>
new file mode 100644<br>
index 0000000000..025ff90c40<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25638.patch<=
br>
@@ -0,0 +1,29 @@<br>
+From: Dirk Lemstra &lt;<a href=3D"mailto:dirk@lemstra.org" target=3D"_blan=
k" rel=3D"noreferrer">dirk@lemstra.org</a>&gt;<br>
+Date: Tue, 3 Feb 2026 22:06:12 +0100<br>
+Subject: Fixed memory leak when writing MSL files (GHSA-gxcx-qjqp-8vjw)<br=
>
+<br>
+(cherry picked from commit 1e88fca11c7b8517100d518bc99bd8c474f02f88)<br>
+<br>
+CVE: CVE-2026-25638<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/1e88fca11c7b8517100d518bc99bd8c474f02f88" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/com=
mit/1e88fca11c7b8517100d518bc99bd8c474f02f88</a>]<br>
+<br>
+origin: <a href=3D"https://github.com/ImageMagick/ImageMagick/commit/1e88f=
ca11c7b8517100d518bc99bd8c474f02f88" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/ImageMagick/ImageMagick/commit/1e88fca11c7b8=
517100d518bc99bd8c474f02f88</a><br>
+bug: <a href=3D"https://github.com/ImageMagick/ImageMagick/security/adviso=
ries/GHSA-gxcx-qjqp-8vjw" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-gxcx-qjq=
p-8vjw</a><br>
+<br>
+Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
+---<br>
+ coders/msl.c | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/coders/msl.c b/coders/msl.c<br>
+index 43c4b73..9facbf2 100644<br>
+--- a/coders/msl.c<br>
++++ b/coders/msl.c<br>
+@@ -7887,6 +7887,7 @@ static MagickBooleanType WriteMSLImage(const ImageIn=
fo *image_info,Image *image,<br>
+=C2=A0 =C2=A0 =C2=A0(void) LogMagickEvent(TraceEvent,GetMagickModule(),&qu=
ot;%s&quot;,image-&gt;filename);<br>
+=C2=A0 =C2=A0msl_image=3DCloneImage(image,0,0,MagickTrue,exception);<br>
+=C2=A0 =C2=A0status=3DProcessMSLScript(image_info,&amp;msl_image,exception=
);<br>
++=C2=A0 msl_image=3DDestroyImageList(msl_image);<br>
+=C2=A0 =C2=A0return(status);<br>
+ }<br>
+ #endif<br>
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25794=
.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25794.pat=
ch<br>
new file mode 100644<br>
index 0000000000..f67ab86ad1<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25794.patch<=
br>
@@ -0,0 +1,60 @@<br>
+From: Dirk Lemstra &lt;<a href=3D"mailto:dirk@lemstra.org" target=3D"_blan=
k" rel=3D"noreferrer">dirk@lemstra.org</a>&gt;<br>
+Date: Fri, 6 Feb 2026 21:03:53 +0100<br>
+Subject: Prevent out of bounds heap write in uhdr encoder<br>
+ (<a href=3D"https://github.com/ImageMagick/ImageMagick/security/advisorie=
s/GHSA-vhqj-f5cj-9x8h" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-vhqj-f5cj-9=
x8h</a>)<br>
+<br>
+(cherry picked from commit ffe589df5ff8ce1433daa4ccb0d2a9fadfbe30ed)<br>
+<br>
+Subject: [PATCH] CVE-2026-25794<br>
+CVE: CVE-2026-25794<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/ffe589df5ff8ce1433daa4ccb0d2a9fadfbe30ed" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/com=
mit/ffe589df5ff8ce1433daa4ccb0d2a9fadfbe30ed</a>]<br>
+<br>
+origin:=C2=A0 <a href=3D"https://github.com/ImageMagick/ImageMagick/commit=
/ffe589df5ff8ce1433daa4ccb0d2a9fadfbe30ed" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://github.com/ImageMagick/ImageMagick/commit/ffe589df5=
ff8ce1433daa4ccb0d2a9fadfbe30ed</a><br>
+bug: <a href=3D"https://github.com/ImageMagick/ImageMagick/security/adviso=
ries/GHSA-vhqj-f5cj-9x8h" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-vhqj-f5c=
j-9x8h</a><br>
+<br>
+Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
+---<br>
+ coders/uhdr.c | 24 ++++++++++++++++--------<br>
+ 1 file changed, 16 insertions(+), 8 deletions(-)<br>
+<br>
+diff --git a/coders/uhdr.c b/coders/uhdr.c<br>
+index 0a25676..a527465 100644<br>
+--- a/coders/uhdr.c<br>
++++ b/coders/uhdr.c<br>
+@@ -618,20 +618,28 @@ static MagickBooleanType WriteUHDRImage(const ImageI=
nfo *image_info,<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0/* Classify image as hdr/sdr intent basing on depth */=
<br>
+=C2=A0 =C2=A0 =C2=A0int<br>
+-=C2=A0 =C2=A0 =C2=A0 bpp =3D image-&gt;depth &gt;=3D hdrIntentMinDepth ? =
2 : 1;<br>
+-<br>
+-=C2=A0 =C2=A0 int<br>
+-=C2=A0 =C2=A0 =C2=A0 aligned_width =3D image-&gt;columns + (image-&gt;col=
umns &amp; 1);<br>
+-<br>
+-=C2=A0 =C2=A0 int<br>
+-=C2=A0 =C2=A0 =C2=A0 aligned_height =3D image-&gt;rows + (image-&gt;rows =
&amp; 1);<br>
++=C2=A0 =C2=A0 =C2=A0 bpp;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0ssize_t<br>
+-=C2=A0 =C2=A0 =C2=A0 picSize =3D aligned_width * aligned_height * bpp * 1=
.5 /* 2x2 sub-sampling */;<br>
++=C2=A0 =C2=A0 =C2=A0 aligned_height,<br>
++=C2=A0 =C2=A0 =C2=A0 aligned_width;<br>
++<br>
++=C2=A0 =C2=A0 size_t<br>
++=C2=A0 =C2=A0 =C2=A0 picSize;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0void<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*crBuffer =3D NULL, *cbBuffer =3D NULL, *yBuffe=
r =3D NULL;<br>
+ <br>
++=C2=A0 =C2=A0 if (((double) image-&gt;columns &gt; sqrt(MAGICK_SSIZE_MAX/=
3.0)) ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((double) image-&gt;rows &gt; sqrt(MAGICK_SSI=
ZE_MAX/3.0)))<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) ThrowMagickException(exception,GetMagi=
ckModule(),ImageError,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;WidthOrHeightExceedsLimit&quot;,=
&quot;%s&quot;,image-&gt;filename);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto next_image;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 bpp =3D image-&gt;depth &gt;=3D hdrIntentMinDepth ? 2 : 1;<=
br>
++=C2=A0 =C2=A0 aligned_width =3D image-&gt;columns + (image-&gt;columns &a=
mp; 1);<br>
++=C2=A0 =C2=A0 picSize =3D aligned_width * aligned_height * bpp * 1.5 /* 2=
x2 sub-sampling */;<br>
+=C2=A0 =C2=A0 =C2=A0if (IssRGBCompatibleColorspace(image-&gt;colorspace) &=
amp;&amp; !IsGrayColorspace(image-&gt;colorspace))<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (image-&gt;depth &gt;=3D hdrIntentMinDepth &=
amp;&amp; hdr_ct =3D=3D UHDR_CT_LINEAR)<br>
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25795=
.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25795.pat=
ch<br>
new file mode 100644<br>
index 0000000000..69a474dc11<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25795.patch<=
br>
@@ -0,0 +1,32 @@<br>
+From: Dirk Lemstra &lt;<a href=3D"mailto:dirk@lemstra.org" target=3D"_blan=
k" rel=3D"noreferrer">dirk@lemstra.org</a>&gt;<br>
+Date: Fri, 6 Feb 2026 21:16:10 +0100<br>
+Subject: Fixed NULL pointer dereference in ReadSFWImage (GHSA-p33r-fqw2-rq=
mm)<br>
+<br>
+(cherry picked from commit 0c7d0b9671ae2616fca106dcada45536eb4df5dc)<br>
+<br>
+CVE: CVE-2026-25796<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/0c7d0b9671ae2616fca106dcada45536eb4df5dc" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/com=
mit/0c7d0b9671ae2616fca106dcada45536eb4df5dc</a>]<br>
+<br>
+bug: <a href=3D"https://github.com/ImageMagick/ImageMagick/security/adviso=
ries/GHSA-p33r-fqw2-rqmm" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-p33r-fqw=
2-rqmm</a><br>
+origin: <a href=3D"https://github.com/ImageMagick/ImageMagick/commit/0c7d0=
b9671ae2616fca106dcada45536eb4df5dc" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/ImageMagick/ImageMagick/commit/0c7d0b9671ae2=
616fca106dcada45536eb4df5dc</a><br>
+<br>
+Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
+---<br>
+ coders/sfw.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/coders/sfw.c b/coders/sfw.c<br>
+index 22ebcd9..46c67b4 100644<br>
+--- a/coders/sfw.c<br>
++++ b/coders/sfw.c<br>
+@@ -317,9 +317,9 @@ static Image *ReadSFWImage(const ImageInfo *image_info=
,ExceptionInfo *exception)<br>
+=C2=A0 =C2=A0if ((unique_file =3D=3D -1) || (file =3D=3D (FILE *) NULL))<b=
r>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0buffer=3D(unsigned char *) RelinquishMagickMemo=
ry(buffer);<br>
+-=C2=A0 =C2=A0 =C2=A0 read_info=3DDestroyImageInfo(read_info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(void) CopyMagickString(image-&gt;filename,read=
_info-&gt;filename,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MagickPathExtent);<br>
++=C2=A0 =C2=A0 =C2=A0 read_info=3DDestroyImageInfo(read_info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ThrowFileException(exception,FileOpenError,&quo=
t;UnableToCreateTemporaryFile&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image-&gt;filename);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0image=3DDestroyImageList(image);<br>
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25796=
.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25796.pat=
ch<br>
new file mode 100644<br>
index 0000000000..7bd577b4dd<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25796.patch<=
br>
@@ -0,0 +1,46 @@<br>
+From: Dirk Lemstra &lt;<a href=3D"mailto:dirk@lemstra.org" target=3D"_blan=
k" rel=3D"noreferrer">dirk@lemstra.org</a>&gt;<br>
+Date: Fri, 6 Feb 2026 21:10:47 +0100<br>
+Subject: Prevent memory leak in early exits (GHSA-g2pr-qxjg-7r2w)<br>
+<br>
+(cherry picked from commit 93ad259ce4f6d641eea0bee73f374af90f35efc3)<br>
+<br>
+CVE: CVE-2026-25796<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/93ad259ce4f6d641eea0bee73f374af90f35efc3" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/com=
mit/93ad259ce4f6d641eea0bee73f374af90f35efc3</a>]<br>
+<br>
+origin: <a href=3D"https://github.com/ImageMagick/ImageMagick/commit/93ad2=
59ce4f6d641eea0bee73f374af90f35efc3" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/ImageMagick/ImageMagick/commit/93ad259ce4f6d=
641eea0bee73f374af90f35efc3</a><br>
+bug: <a href=3D"https://github.com/ImageMagick/ImageMagick/security/adviso=
ries/GHSA-g2pr-qxjg-7r2w" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-g2pr-qxj=
g-7r2w</a><br>
+<br>
+Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
+---<br>
+ coders/stegano.c | 11 +++++++++--<br>
+ 1 file changed, 9 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/coders/stegano.c b/coders/stegano.c<br>
+index 111640a..5f91bd9 100644<br>
+--- a/coders/stegano.c<br>
++++ b/coders/stegano.c<br>
+@@ -150,15 +150,22 @@ static Image *ReadSTEGANOImage(const ImageInfo *imag=
e_info,<br>
+=C2=A0 =C2=A0 =C2=A0return(DestroyImage(image));<br>
+=C2=A0 =C2=A0watermark-&gt;depth=3DMAGICKCORE_QUANTUM_DEPTH;<br>
+=C2=A0 =C2=A0if (AcquireImageColormap(image,MaxColormapSize,exception) =3D=
=3D MagickFalse)<br>
+-=C2=A0 =C2=A0 ThrowReaderException(ResourceLimitError,&quot;MemoryAllocat=
ionFailed&quot;);<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 watermark=3DDestroyImage(watermark);<br>
++=C2=A0 =C2=A0 =C2=A0 ThrowReaderException(ResourceLimitError,&quot;Memory=
AllocationFailed&quot;);<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0if (image_info-&gt;ping !=3D MagickFalse)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 watermark=3DDestroyImage(watermark);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(void) CloseBlob(image);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return(GetFirstImageInList(image));<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0status=3DSetImageExtent(image,image-&gt;columns,image-&gt;row=
s,exception);<br>
+=C2=A0 =C2=A0if (status =3D=3D MagickFalse)<br>
+-=C2=A0 =C2=A0 return(DestroyImageList(image));<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 watermark=3DDestroyImage(watermark);<br>
++=C2=A0 =C2=A0 =C2=A0 return(DestroyImageList(image));<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0for (y=3D0; y &lt; (ssize_t) image-&gt;rows; y++)<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0q=3DQueueAuthenticPixels(image,0,y,image-&gt;columns,1=
,exception);<br>
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797=
_1.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_1=
.patch<br>
new file mode 100644<br>
index 0000000000..295b686a91<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_1.patc=
h<br>
@@ -0,0 +1,344 @@<br>
+From: Dirk Lemstra &lt;<a href=3D"mailto:dirk@lemstra.org" target=3D"_blan=
k" rel=3D"noreferrer">dirk@lemstra.org</a>&gt;<br>
+Date: Fri, 6 Feb 2026 21:28:50 +0100<br>
+Subject: Prevent code injection via PostScript header<br>
+ (<a href=3D"https://github.com/ImageMagick/ImageMagick/security/advisorie=
s/GHSA-rw6c-xp26-225v" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-rw6c-xp26-2=
25v</a>)<br>
+<br>
+(cherry picked from commit 26088a83d71e9daa203d54a56fe3c31f3f85463d)<br>
+<br>
+CVE: CVE-2026-25797<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/26088a83d71e9daa203d54a56fe3c31f3f85463d" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/com=
mit/26088a83d71e9daa203d54a56fe3c31f3f85463d</a>]<br>
+<br>
+origin: backport, <a href=3D"https://github.com/ImageMagick/ImageMagick/co=
mmit/26088a83d71e9daa203d54a56fe3c31f3f85463d" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/commit/26088=
a83d71e9daa203d54a56fe3c31f3f85463d</a><br>
+bug: <a href=3D"https://github.com/ImageMagick/ImageMagick/security/adviso=
ries/GHSA-rw6c-xp26-225v" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-rw6c-xp2=
6-225v</a><br>
+<br>
+Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
+---<br>
+ coders/ps.c=C2=A0 | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++-<br>
+ coders/ps2.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++-<br>
+ coders/ps3.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++-<br>
+ 3 files changed, 243 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/coders/ps.c b/coders/ps.c<br>
+index 8af2af7..3999cf9 100644<br>
+--- a/coders/ps.c<br>
++++ b/coders/ps.c<br>
+@@ -1086,6 +1086,82 @@ static inline unsigned char *PopHexPixel(const char=
 hex_digits[][3],<br>
+=C2=A0 =C2=A0return(pixels);<br>
+ }<br>
+ <br>
++static inline void FilenameToTitle(const char *filename,char *title,<br>
++=C2=A0 const size_t extent)<br>
++{<br>
++=C2=A0 int<br>
++=C2=A0 =C2=A0 depth =3D 0;<br>
++<br>
++=C2=A0 ssize_t<br>
++=C2=A0 =C2=A0 i,<br>
++=C2=A0 =C2=A0 offset =3D 0;<br>
++<br>
++=C2=A0 if (extent =3D=3D 0)<br>
++=C2=A0 =C2=A0 return;<br>
++=C2=A0 for (i=3D0; (filename[i] !=3D &#39;\0&#39;) &amp;&amp; ((offset+1)=
 &lt; (ssize_t) extent); i++)<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 unsigned char<br>
++=C2=A0 =C2=A0 =C2=A0 c =3D filename[i];<br>
++<br>
++=C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 Only allow printable ASCII.<br>
++=C2=A0 =C2=A0 */<br>
++=C2=A0 =C2=A0 if ((c &lt; 32) || (c &gt; 126))<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 title[offset++]=3D&#39;_&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 Percent signs break DSC parsing.<br>
++=C2=A0 =C2=A0 */<br>
++=C2=A0 =C2=A0 if (c =3D=3D &#39;%&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 title[offset++]=3D&#39;_&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 Parentheses must remain balanced.<br>
++=C2=A0 =C2=A0 */<br>
++=C2=A0 =C2=A0 if (c =3D=3D &#39;(&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 depth++;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 title[offset++] =3D &#39;(&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 if (c =3D=3D &#39;)&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (depth &lt;=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 title[offset++]=3D&#39;_&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depth--;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 title[offset++]=3D&#39;)&#39;;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
++=C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 Everything else is allowed.<br>
++=C2=A0 =C2=A0 */<br>
++=C2=A0 =C2=A0 title[offset++]=3Dc;<br>
++=C2=A0 }<br>
++=C2=A0 /*<br>
++=C2=A0 =C2=A0 If parentheses remain unbalanced, close them.<br>
++=C2=A0 */<br>
++=C2=A0 while ((depth &gt; 0) &amp;&amp; ((offset+1) &lt; (ssize_t) extent=
)) {<br>
++=C2=A0 =C2=A0 title[offset++]=3D&#39;)&#39;;<br>
++=C2=A0 =C2=A0 depth--;<br>
++=C2=A0 }<br>
++=C2=A0 title[offset]=3D&#39;\0&#39;;<br>
++=C2=A0 /*<br>
++=C2=A0 =C2=A0 Ensure non-empty result.<br>
++=C2=A0 */<br>
++=C2=A0 if (offset =3D=3D 0)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 (void) CopyMagickString(title,&quot;Untitled&quot;,e=
xtent-1);<br>
++=C2=A0 =C2=A0 =C2=A0 title[extent-1]=3D&#39;\0&#39;;<br>
++=C2=A0 =C2=A0 }<br>
++}<br>
++<br>
+ static MagickBooleanType WritePSImage(const ImageInfo *image_info,Image *=
image,<br>
+=C2=A0 =C2=A0ExceptionInfo *exception)<br>
+ {<br>
+@@ -1554,6 +1630,9 @@ static MagickBooleanType WritePSImage(const ImageInf=
o *image_info,Image *image,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0text_size=3D(size_t) (MultilineCensus(value)*po=
intsize+12);<br>
+=C2=A0 =C2=A0 =C2=A0if (page =3D=3D 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 char<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 title[MagickPathExtent];<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Output Postscript header.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+@@ -1564,8 +1643,9 @@ static MagickBooleanType WritePSImage(const ImageInf=
o *image_info,Image *image,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MagickPathExtent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobString(image,buffer);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobString(image,&quot;%%Cre=
ator: (ImageMagick)\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 FilenameToTitle(image-&gt;filename,title,Magi=
ckPathExtent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) FormatLocaleString(buffer,MagickP=
athExtent,&quot;%%%%Title: (%s)\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image-&gt;filename);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 title);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobString(image,buffer);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer=3DGetMagickTime();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) FormatMagickTime(timer,sizeof(dat=
e),date);<br>
+diff --git a/coders/ps2.c b/coders/ps2.c<br>
+index f840782..10670a7 100644<br>
+--- a/coders/ps2.c<br>
++++ b/coders/ps2.c<br>
+@@ -225,6 +225,82 @@ static MagickBooleanType Huffman2DEncodeImage(const I=
mageInfo *image_info,<br>
+=C2=A0 =C2=A0return(status);<br>
+ }<br>
+ <br>
++static inline void FilenameToTitle(const char *filename,char *title,<br>
++=C2=A0 const size_t extent)<br>
++{<br>
++=C2=A0 int<br>
++=C2=A0 =C2=A0 depth =3D 0;<br>
++<br>
++=C2=A0 ssize_t<br>
++=C2=A0 =C2=A0 i,<br>
++=C2=A0 =C2=A0 offset =3D 0;<br>
++<br>
++=C2=A0 if (extent =3D=3D 0)<br>
++=C2=A0 =C2=A0 return;<br>
++=C2=A0 for (i=3D0; (filename[i] !=3D &#39;\0&#39;) &amp;&amp; ((offset+1)=
 &lt; (ssize_t) extent); i++)<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 unsigned char<br>
++=C2=A0 =C2=A0 =C2=A0 c =3D filename[i];<br>
++<br>
++=C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 Only allow printable ASCII.<br>
++=C2=A0 =C2=A0 */<br>
++=C2=A0 =C2=A0 if ((c &lt; 32) || (c &gt; 126))<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 title[offset++]=3D&#39;_&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 Percent signs break DSC parsing.<br>
++=C2=A0 =C2=A0 */<br>
++=C2=A0 =C2=A0 if (c =3D=3D &#39;%&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 title[offset++]=3D&#39;_&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 Parentheses must remain balanced.<br>
++=C2=A0 =C2=A0 */<br>
++=C2=A0 =C2=A0 if (c =3D=3D &#39;(&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 depth++;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 title[offset++] =3D &#39;(&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 if (c =3D=3D &#39;)&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (depth &lt;=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 title[offset++]=3D&#39;_&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depth--;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 title[offset++]=3D&#39;)&#39;;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
++=C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 Everything else is allowed.<br>
++=C2=A0 =C2=A0 */<br>
++=C2=A0 =C2=A0 title[offset++]=3Dc;<br>
++=C2=A0 }<br>
++=C2=A0 /*<br>
++=C2=A0 =C2=A0 If parentheses remain unbalanced, close them.<br>
++=C2=A0 */<br>
++=C2=A0 while ((depth &gt; 0) &amp;&amp; ((offset+1) &lt; (ssize_t) extent=
)) {<br>
++=C2=A0 =C2=A0 title[offset++]=3D&#39;)&#39;;<br>
++=C2=A0 =C2=A0 depth--;<br>
++=C2=A0 }<br>
++=C2=A0 title[offset]=3D&#39;\0&#39;;<br>
++=C2=A0 /*<br>
++=C2=A0 =C2=A0 Ensure non-empty result.<br>
++=C2=A0 */<br>
++=C2=A0 if (offset =3D=3D 0)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 (void) CopyMagickString(title,&quot;Untitled&quot;,e=
xtent-1);<br>
++=C2=A0 =C2=A0 =C2=A0 title[extent-1]=3D&#39;\0&#39;;<br>
++=C2=A0 =C2=A0 }<br>
++}<br>
++<br>
+ static MagickBooleanType WritePS2Image(const ImageInfo *image_info,Image =
*image,<br>
+=C2=A0 =C2=A0ExceptionInfo *exception)<br>
+ {<br>
+@@ -547,6 +623,9 @@ static MagickBooleanType WritePS2Image(const ImageInfo=
 *image_info,Image *image,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0text_size=3D(size_t) (MultilineCensus(value)*po=
intsize+12);<br>
+=C2=A0 =C2=A0 =C2=A0if (page =3D=3D 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 char<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 title[MagickPathExtent];<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Output Postscript header.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+@@ -557,8 +636,9 @@ static MagickBooleanType WritePS2Image(const ImageInfo=
 *image_info,Image *image,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MagickPathExtent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobString(image,buffer);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobString(image,&quot;%%Cre=
ator: (ImageMagick)\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 FilenameToTitle(image-&gt;filename,title,Magi=
ckPathExtent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) FormatLocaleString(buffer,MagickP=
athExtent,&quot;%%%%Title: (%s)\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image-&gt;filename);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 title);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobString(image,buffer);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer=3DGetMagickTime();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) FormatMagickTime(timer,sizeof(dat=
e),date);<br>
+diff --git a/coders/ps3.c b/coders/ps3.c<br>
+index d3e870c..b135b46 100644<br>
+--- a/coders/ps3.c<br>
++++ b/coders/ps3.c<br>
+@@ -203,6 +203,82 @@ ModuleExport void UnregisterPS3Image(void)<br>
+ %<br>
+ */<br>
+ <br>
++static inline void FilenameToTitle(const char *filename,char *title,<br>
++=C2=A0 const size_t extent)<br>
++{<br>
++=C2=A0 int<br>
++=C2=A0 =C2=A0 depth =3D 0;<br>
++<br>
++=C2=A0 ssize_t<br>
++=C2=A0 =C2=A0 i,<br>
++=C2=A0 =C2=A0 offset =3D 0;<br>
++<br>
++=C2=A0 if (extent =3D=3D 0)<br>
++=C2=A0 =C2=A0 return;<br>
++=C2=A0 for (i=3D0; (filename[i] !=3D &#39;\0&#39;) &amp;&amp; ((offset+1)=
 &lt; (ssize_t) extent); i++)<br>
++=C2=A0 {<br>
++=C2=A0 =C2=A0 unsigned char<br>
++=C2=A0 =C2=A0 =C2=A0 c =3D filename[i];<br>
++<br>
++=C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 Only allow printable ASCII.<br>
++=C2=A0 =C2=A0 */<br>
++=C2=A0 =C2=A0 if ((c &lt; 32) || (c &gt; 126))<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 title[offset++]=3D&#39;_&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 Percent signs break DSC parsing.<br>
++=C2=A0 =C2=A0 */<br>
++=C2=A0 =C2=A0 if (c =3D=3D &#39;%&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 title[offset++]=3D&#39;_&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 Parentheses must remain balanced.<br>
++=C2=A0 =C2=A0 */<br>
++=C2=A0 =C2=A0 if (c =3D=3D &#39;(&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 depth++;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 title[offset++] =3D &#39;(&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 if (c =3D=3D &#39;)&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (depth &lt;=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 title[offset++]=3D&#39;_&#39;;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depth--;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 title[offset++]=3D&#39;)&#39;;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
++=C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 Everything else is allowed.<br>
++=C2=A0 =C2=A0 */<br>
++=C2=A0 =C2=A0 title[offset++]=3Dc;<br>
++=C2=A0 }<br>
++=C2=A0 /*<br>
++=C2=A0 =C2=A0 If parentheses remain unbalanced, close them.<br>
++=C2=A0 */<br>
++=C2=A0 while ((depth &gt; 0) &amp;&amp; ((offset+1) &lt; (ssize_t) extent=
)) {<br>
++=C2=A0 =C2=A0 title[offset++]=3D&#39;)&#39;;<br>
++=C2=A0 =C2=A0 depth--;<br>
++=C2=A0 }<br>
++=C2=A0 title[offset]=3D&#39;\0&#39;;<br>
++=C2=A0 /*<br>
++=C2=A0 =C2=A0 Ensure non-empty result.<br>
++=C2=A0 */<br>
++=C2=A0 if (offset =3D=3D 0)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 (void) CopyMagickString(title,&quot;Untitled&quot;,e=
xtent-1);<br>
++=C2=A0 =C2=A0 =C2=A0 title[extent-1]=3D&#39;\0&#39;;<br>
++=C2=A0 =C2=A0 }<br>
++}<br>
++<br>
+ static MagickBooleanType Huffman2DEncodeImage(const ImageInfo *image_info=
,<br>
+=C2=A0 =C2=A0Image *image,Image *inject_image,ExceptionInfo *exception)<br=
>
+ {<br>
+@@ -1007,6 +1083,9 @@ static MagickBooleanType WritePS3Image(const ImageIn=
fo *image_info,Image *image,<br>
+=C2=A0 =C2=A0 =C2=A0is_gray=3DIdentifyImageCoderGray(image,exception);<br>
+=C2=A0 =C2=A0 =C2=A0if (page =3D=3D 1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 char<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 title[MagickPathExtent];<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Postscript header on the first pa=
ge.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+@@ -1019,8 +1098,9 @@ static MagickBooleanType WritePS3Image(const ImageIn=
fo *image_info,Image *image,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) FormatLocaleString(buffer,MagickP=
athExtent,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%%%%Creator: ImageMagick %s=
\n&quot;,MagickLibVersionText);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobString(image,buffer);<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 FilenameToTitle(image-&gt;filename,title,Magi=
ckPathExtent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) FormatLocaleString(buffer,MagickP=
athExtent,&quot;%%%%Title: %s\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image-&gt;filename);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 title);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobString(image,buffer);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer=3DGetMagickTime();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) FormatMagickTime(timer,sizeof(dat=
e),date);<br>
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797=
_2.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_2=
.patch<br>
new file mode 100644<br>
index 0000000000..a1872b7ee9<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25797_2.patc=
h<br>
@@ -0,0 +1,143 @@<br>
+From: Dirk Lemstra &lt;<a href=3D"mailto:dirk@lemstra.org" target=3D"_blan=
k" rel=3D"noreferrer">dirk@lemstra.org</a>&gt;<br>
+Date: Fri, 20 Feb 2026 14:08:15 +0100<br>
+Subject: Properly escape the strings that are written as raw html<br>
+ (GHSA-rw6c-xp26-225v)<br>
+<br>
+(cherry picked from commit 81129f79ad622ff4c1d729828a34ab0f49ec89f6)<br>
+<br>
+CVE: CVE-2026-25797<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/81129f79ad622ff4c1d729828a34ab0f49ec89f6" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/com=
mit/81129f79ad622ff4c1d729828a34ab0f49ec89f6</a>]<br>
+<br>
+origin:=C2=A0 <a href=3D"https://github.com/ImageMagick/ImageMagick/commit=
/81129f79ad622ff4c1d729828a34ab0f49ec89f6" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://github.com/ImageMagick/ImageMagick/commit/81129f79a=
d622ff4c1d729828a34ab0f49ec89f6</a><br>
+bug: <a href=3D"https://github.com/ImageMagick/ImageMagick/security/adviso=
ries/GHSA-rw6c-xp26-225v" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-rw6c-xp2=
6-225v</a><br>
+<br>
+Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
+---<br>
+ coders/html.c | 65 +++++++++++++++++++++++++++++++++++-------------------=
-----<br>
+ 1 file changed, 39 insertions(+), 26 deletions(-)<br>
+<br>
+diff --git a/coders/html.c b/coders/html.c<br>
+index 739cb12..1e171cb 100644<br>
+--- a/coders/html.c<br>
++++ b/coders/html.c<br>
+@@ -204,6 +204,21 @@ ModuleExport void UnregisterHTMLImage(void)<br>
+ %<br>
+ */<br>
+ <br>
++static void WriteHtmlEncodedString(Image *image,const char* value)<br>
++{<br>
++=C2=A0 char<br>
++=C2=A0 =C2=A0 *encoded_value;<br>
++<br>
++=C2=A0 encoded_value=3DAcquireString(value);<br>
++=C2=A0 (void) SubstituteString(&amp;encoded_value,&quot;&lt;&quot;,&quot;=
&amp;lt;&quot;);<br>
++=C2=A0 (void) SubstituteString(&amp;encoded_value,&quot;&gt;&quot;,&quot;=
&amp;gt;&quot;);<br>
++=C2=A0 (void) SubstituteString(&amp;encoded_value,&quot;&amp;&quot;,&quot=
;&amp;amp;&quot;);<br>
++=C2=A0 (void) SubstituteString(&amp;encoded_value,&quot;\&quot;&quot;,&qu=
ot;&amp;quot;&quot;);<br>
++=C2=A0 (void) SubstituteString(&amp;encoded_value,&quot;&#39;&quot;,&quot=
;&amp;apos;&quot;);<br>
++=C2=A0 WriteBlobString(image,encoded_value);<br>
++=C2=A0 encoded_value=3DDestroyString(encoded_value);<br>
++}<br>
++<br>
+ static ssize_t WriteURLComponent(Image *image,const int c)<br>
+ {<br>
+=C2=A0 =C2=A0char<br>
+@@ -318,29 +333,29 @@ static MagickBooleanType WriteHTMLImage(const ImageI=
nfo *image_info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;\&quot;<a href=3D"http://www.w3.or=
g/TR/xhtml1/DTD/xhtml1-strict.dtd%5C" rel=3D"noreferrer noreferrer" target=
=3D"_blank">http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\</a>&quot;&gt=
;\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobString(image,&quot;&lt;html&gt;=
\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobString(image,&quot;&lt;head&gt;=
\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 (void) WriteBlobString(image,&quot;&lt;title&gt;&quo=
t;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0value=3DGetImageProperty(image,&quot;label&quot=
;,exception);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (value !=3D (const char *) NULL)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) FormatLocaleString(buffer,MagickPathEx=
tent,&quot;&lt;title&gt;%s&lt;/title&gt;\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 WriteHtmlEncodedString(image,value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GetPathComponent(filename,BasePat=
h,basename);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) FormatLocaleString(buffer,Magic=
kPathExtent,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&lt;title&gt;%s&lt;/title=
&gt;\n&quot;,basename);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WriteHtmlEncodedString(image,basename)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 (void) WriteBlobString(image,buffer);<br>
++=C2=A0 =C2=A0 =C2=A0 (void) WriteBlobString(image,&quot;&lt;/title&gt;\n&=
quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobString(image,&quot;&lt;/head&gt=
;\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobString(image,&quot;&lt;body sty=
le=3D\&quot;text-align: center;\&quot;&gt;\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 (void) FormatLocaleString(buffer,MagickPathExtent,&q=
uot;&lt;h1&gt;%s&lt;/h1&gt;\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 image-&gt;filename);<br>
+-=C2=A0 =C2=A0 =C2=A0 (void) WriteBlobString(image,buffer);<br>
++=C2=A0 =C2=A0 =C2=A0 (void) WriteBlobString(image,&quot;&lt;h1&gt;&quot;)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 WriteHtmlEncodedString(image,image-&gt;filename);<br=
>
++=C2=A0 =C2=A0 =C2=A0 (void) WriteBlobString(image,&quot;&lt;/h1&gt;&quot;=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobString(image,&quot;&lt;div&gt;\=
n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(void) CopyMagickString(filename,image-&gt;file=
name,MagickPathExtent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0AppendImageFormat(&quot;png&quot;,filename);<br=
>
+-=C2=A0 =C2=A0 =C2=A0 (void) FormatLocaleString(buffer,MagickPathExtent,&q=
uot;&lt;img usemap=3D\&quot;#%s\&quot; &quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;src=3D\&quot;%s\&quot; style=3D\&quot;b=
order: 0;\&quot; alt=3D\&quot;Image map\&quot; /&gt;\n&quot;,mapname,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 filename);<br>
+-=C2=A0 =C2=A0 =C2=A0 (void) WriteBlobString(image,buffer);<br>
++=C2=A0 =C2=A0 =C2=A0 (void) WriteBlobString(image,&quot;&lt;img usemap=3D=
\&quot;#&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 WriteHtmlEncodedString(image,mapname);<br>
++=C2=A0 =C2=A0 =C2=A0 (void) WriteBlobString(image,&quot;\&quot; src=3D\&q=
uot;&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 WriteHtmlEncodedString(image,filename);<br>
++=C2=A0 =C2=A0 =C2=A0 (void) WriteBlobString(image,&quot;\&quot; style=3D\=
&quot;border: 0;\&quot; alt=3D\&quot;Image map\&quot; /&gt;\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Determine the size and location of each =
image tile.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+@@ -350,18 +365,18 @@ static MagickBooleanType WriteHTMLImage(const ImageI=
nfo *image_info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Write an image map.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+-=C2=A0 =C2=A0 =C2=A0 (void) FormatLocaleString(buffer,MagickPathExtent,<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&lt;map id=3D\&quot;%s\&quot; name=3D\&=
quot;%s\&quot;&gt;\n&quot;,mapname,mapname);<br>
+-=C2=A0 =C2=A0 =C2=A0 (void) WriteBlobString(image,buffer);<br>
+-=C2=A0 =C2=A0 =C2=A0 (void) FormatLocaleString(buffer,MagickPathExtent,&q=
uot;=C2=A0 &lt;area href=3D\&quot;%s&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 url);<br>
+-=C2=A0 =C2=A0 =C2=A0 (void) WriteBlobString(image,buffer);<br>
++=C2=A0 =C2=A0 =C2=A0 (void) WriteBlobString(image,&quot;&lt;map id=3D\&qu=
ot;&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 WriteHtmlEncodedString(image,mapname);<br>
++=C2=A0 =C2=A0 =C2=A0 (void) WriteBlobString(image,&quot;\&quot; name=3D\&=
quot;&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 WriteHtmlEncodedString(image,mapname);<br>
++=C2=A0 =C2=A0 =C2=A0 (void) WriteBlobString(image,&quot;\&quot;&gt;\n&lt;=
area href=3D\&quot;&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 WriteHtmlEncodedString(image,url);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (image-&gt;directory =3D=3D (char *) NULL)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WriteHtmlEncodedString(image,image-&gt=
;filename);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) FormatLocaleString(buffer,=
MagickPathExtent,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s\&quot; shape=3D\&quot;=
rect\&quot; coords=3D\&quot;0,0,%.20g,%.20g\&quot; alt=3D\&quot;\&quot; /&g=
t;\n&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image-&gt;filename,(double) geo=
metry.width-1,(double) geometry.height-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;\&quot; shape=3D\&quot;re=
ct\&quot; coords=3D\&quot;0,0,%.20g,%.20g\&quot; alt=3D\&quot;\&quot; /&gt;=
\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (double) geometry.width-1,(doub=
le) geometry.height-1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobString(image,buff=
er);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+@@ -378,9 +393,9 @@ static MagickBooleanType WriteHTMLImage(const ImageInf=
o *image_info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobStr=
ing(image,buffer);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*(p+1) !=3D &#3=
9;\0&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) For=
matLocaleString(buffer,MagickPathExtent,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &qu=
ot;=C2=A0 &lt;area href=3D%s\&quot;&quot;,url);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) Wri=
teBlobString(image,buffer);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) Wri=
teBlobString(image,&quot;=C2=A0 &lt;area href=3D\&quot;&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WriteHtmlE=
ncodedString(image,url);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) Wri=
teBlobString(image,&quot;\&quot;&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0geometry.x+=3D(ssiz=
e_t) geometry.width;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((geometry.x+4) =
&gt;=3D (ssize_t) image-&gt;columns)<br>
+@@ -390,7 +405,6 @@ static MagickBooleanType WriteHTMLImage(const ImageInf=
o *image_info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobString(image,&quot;&lt;/map&gt;=
\n&quot;);<br>
+-=C2=A0 =C2=A0 =C2=A0 (void) CopyMagickString(filename,image-&gt;filename,=
MagickPathExtent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobString(image,&quot;&lt;/div&gt;=
\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobString(image,&quot;&lt;/body&gt=
;\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(void) WriteBlobString(image,&quot;&lt;/html&gt=
;\n&quot;);<br>
+@@ -398,7 +412,6 @@ static MagickBooleanType WriteHTMLImage(const ImageInf=
o *image_info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Write the image as PNG.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+-=C2=A0 =C2=A0 =C2=A0 (void) CopyMagickString(image-&gt;filename,filename,=
MagickPathExtent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0AppendImageFormat(&quot;png&quot;,image-&gt;fil=
ename);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0next=3DGetNextImageInList(image);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0image-&gt;next=3DNewImageList();<br>
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25798=
.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25798.pat=
ch<br>
new file mode 100644<br>
index 0000000000..18758b625b<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25798.patch<=
br>
@@ -0,0 +1,109 @@<br>
+From: Cristy &lt;<a href=3D"mailto:urban-warrior@imagemagick.org" target=
=3D"_blank" rel=3D"noreferrer">urban-warrior@imagemagick.org</a>&gt;<br>
+From: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=3D"_blank"=
 rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
+Date: Sun, 1 Feb 2026 14:56:14 -0500<br>
+Subject: [PATCH] CVE-2026-25798<br>
+<a href=3D"https://github.com/ImageMagick/ImageMagick/security/advisories/=
GHSA-p863-5fgm-rgq4" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//github.com/ImageMagick/ImageMagick/security/advisories/GHSA-p863-5fgm-rgq=
4</a><br>
+<br>
+a NULL pointer dereference in ClonePixelCacheRepository allows a remote at=
tacker to crash any application linked against ImageMagick by supplying a c=
rafted image file, resulting in denial of service.<br>
+<br>
+(cherry picked from commit 16dd3158ce197c6f65e7798a7a5cc4538bb0303e)<br>
+<br>
+CVE: CVE-2026-25798<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/16dd3158ce197c6f65e7798a7a5cc4538bb0303e" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/com=
mit/16dd3158ce197c6f65e7798a7a5cc4538bb0303e</a>]<br>
+<br>
+bug: <a href=3D"https://github.com/ImageMagick/ImageMagick/security/adviso=
ries/GHSA-p863-5fgm-rgq4" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-p863-5fg=
m-rgq4</a><br>
+origin: <a href=3D"https://github.com/ImageMagick/ImageMagick/commit/16dd3=
158ce197c6f65e7798a7a5cc4538bb0303e" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/ImageMagick/ImageMagick/commit/16dd3158ce197=
c6f65e7798a7a5cc4538bb0303e</a><br>
+<br>
+Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
+---<br>
+ MagickCore/cache.c | 37 +++++++++++++++++++++++++++++++++----<br>
+ coders/sixel.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
+ 2 files changed, 35 insertions(+), 6 deletions(-)<br>
+<br>
+diff --git a/MagickCore/cache.c b/MagickCore/cache.c<br>
+index 8df6945..5a36189 100644<br>
+--- a/MagickCore/cache.c<br>
++++ b/MagickCore/cache.c<br>
+@@ -3500,6 +3500,25 @@ static MagickBooleanType MaskPixelCacheNexus(Image =
*image,NexusInfo *nexus_info,<br>
+ %<br>
+ */<br>
+ <br>
++static inline MagickBooleanType CacheOverflowSanityCheckGetSize(<br>
++=C2=A0 const MagickSizeType count,const size_t quantum,MagickSizeType *co=
nst extent)<br>
++{<br>
++=C2=A0 MagickSizeType<br>
++=C2=A0 =C2=A0 length;<br>
++<br>
++=C2=A0 if ((count =3D=3D 0) || (quantum =3D=3D 0))<br>
++=C2=A0 =C2=A0 return(MagickTrue);<br>
++=C2=A0 length=3Dcount*quantum;<br>
++=C2=A0 if (quantum !=3D (length/count))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 errno=3DENOMEM;<br>
++=C2=A0 =C2=A0 =C2=A0 return(MagickTrue);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 if (extent !=3D NULL)<br>
++=C2=A0 =C2=A0 *extent=3Dlength;<br>
++=C2=A0 return(MagickFalse);<br>
++}<br>
++<br>
+ static MagickBooleanType OpenPixelCacheOnDisk(CacheInfo *cache_info,<br>
+=C2=A0 =C2=A0const MapMode mode)<br>
+ {<br>
+@@ -3650,7 +3669,7 @@ static MagickBooleanType OpenPixelCache(Image *image=
,const MapMode mode,<br>
+=C2=A0 =C2=A0 =C2=A0status;<br>
+ <br>
+=C2=A0 =C2=A0MagickSizeType<br>
+-=C2=A0 =C2=A0 length,<br>
++=C2=A0 =C2=A0 length =3D 0,<br>
+=C2=A0 =C2=A0 =C2=A0number_pixels;<br>
+ <br>
+=C2=A0 =C2=A0size_t<br>
+@@ -3723,12 +3742,22 @@ static MagickBooleanType OpenPixelCache(Image *ima=
ge,const MapMode mode,<br>
+=C2=A0 =C2=A0packet_size=3DMagickMax(cache_info-&gt;number_channels,1)*siz=
eof(Quantum);<br>
+=C2=A0 =C2=A0if (image-&gt;metacontent_extent !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0packet_size+=3Dcache_info-&gt;metacontent_extent;<br>
+-=C2=A0 length=3Dnumber_pixels*packet_size;<br>
++=C2=A0 if (CacheOverflowSanityCheckGetSize(number_pixels,packet_size,&amp=
;length) !=3D MagickFalse)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 cache_info-&gt;storage_class=3DUndefinedClass;<br>
++=C2=A0 =C2=A0 =C2=A0 cache_info-&gt;length=3D0;<br>
++=C2=A0 =C2=A0 =C2=A0 ThrowBinaryException(ResourceLimitError,&quot;PixelC=
acheAllocationFailed&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 image-&gt;filename);<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0columns=3D(size_t) (length/cache_info-&gt;rows/packet_size);<=
br>
+=C2=A0 =C2=A0if ((cache_info-&gt;columns !=3D columns) || ((ssize_t) cache=
_info-&gt;columns &lt; 0) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0((ssize_t) cache_info-&gt;rows &lt; 0))<br>
+-=C2=A0 =C2=A0 ThrowBinaryException(ResourceLimitError,&quot;PixelCacheAll=
ocationFailed&quot;,<br>
+-=C2=A0 =C2=A0 =C2=A0 image-&gt;filename);<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 cache_info-&gt;storage_class=3DUndefinedClass;<br>
++=C2=A0 =C2=A0 =C2=A0 cache_info-&gt;length=3D0;<br>
++=C2=A0 =C2=A0 =C2=A0 ThrowBinaryException(ResourceLimitError,&quot;PixelC=
acheAllocationFailed&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 image-&gt;filename);<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0cache_info-&gt;length=3Dlength;<br>
+=C2=A0 =C2=A0if (image-&gt;ping !=3D MagickFalse)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+diff --git a/coders/sixel.c b/coders/sixel.c<br>
+index 08ca474..11d857d 100644<br>
+--- a/coders/sixel.c<br>
++++ b/coders/sixel.c<br>
+@@ -544,7 +544,7 @@ static MagickBooleanType sixel_decode(Image *image,uns=
igned char *p,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (max_x &lt; position_x)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0max_x =3D position_x;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (max_y &lt; (position_y + i))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 max_y =3D position_y + i;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 max_y =3D (int) (position_y + i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sixel=
_vertical_mask &lt;&lt;=3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -577,7 +577,7 @@ static MagickBooleanType sixel_decode(Image *image,uns=
igned char *p,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (max_x &lt; (position_x+repeat_count-1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0max_x =3D position_x+repeat_count-1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (max_y &lt; (position_y+i+n-1))<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 max_y =3D position_y+i+n-1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 max_y =3D (int) (position_y+i+n-1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0i+=3D(n-1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sixel_vertical_mask &lt;&lt;=3D (n-1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0}<br>
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25799=
.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25799.pat=
ch<br>
new file mode 100644<br>
index 0000000000..8dc511d2a4<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25799.patch<=
br>
@@ -0,0 +1,42 @@<br>
+From: Cristy &lt;<a href=3D"mailto:urban-warrior@imagemagick.org" target=
=3D"_blank" rel=3D"noreferrer">urban-warrior@imagemagick.org</a>&gt;<br>
+Date: Sat, 31 Jan 2026 12:56:17 -0500<br>
+Subject: [PATCH] CVE-2026-25798<br>
+<a href=3D"https://github.com/ImageMagick/ImageMagick/security/advisories/=
GHSA-543g-8grm-9cw6" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//github.com/ImageMagick/ImageMagick/security/advisories/GHSA-543g-8grm-9cw=
6</a><br>
+<br>
+a logic error in YUV sampling factor validation allows an invalid sampling=
 factor to bypass checks and trigger a division-by-zero during image loadin=
g, resulting in a reliable denial-of-service.<br>
+<br>
+(cherry picked from commit 412f3c8bc1d3b6890aad72376cd992c9b5177037)<br>
+<br>
+CVE: CVE-2026-25799<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/412f3c8bc1d3b6890aad72376cd992c9b5177037" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/com=
mit/412f3c8bc1d3b6890aad72376cd992c9b5177037</a>]<br>
+<br>
+origin: <a href=3D"https://github.com/ImageMagick/ImageMagick/commit/412f3=
c8bc1d3b6890aad72376cd992c9b5177037" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/ImageMagick/ImageMagick/commit/412f3c8bc1d3b=
6890aad72376cd992c9b5177037</a><br>
+bug: <a href=3D"https://github.com/ImageMagick/ImageMagick/security/adviso=
ries/GHSA-543g-8grm-9cw6" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-543g-8gr=
m-9cw6</a><br>
+<br>
+Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
+---<br>
+ coders/yuv.c | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/coders/yuv.c b/coders/yuv.c<br>
+index a1d5bf1..1817c43 100644<br>
+--- a/coders/yuv.c<br>
++++ b/coders/yuv.c<br>
+@@ -165,7 +165,7 @@ static Image *ReadYUVImage(const ImageInfo *image_info=
,ExceptionInfo *exception)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vertical_factor=3Dhorizontal_factor;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((flags &amp; SigmaValue) !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vertical_factor=3D(ssize_t) geometry_inf=
o.sigma;<br>
+-=C2=A0 =C2=A0 =C2=A0 if ((horizontal_factor !=3D 1) &amp;&amp; (horizonta=
l_factor !=3D 2) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 if ((horizontal_factor !=3D 1) &amp;&amp; (horizonta=
l_factor !=3D 2) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(vertical_factor !=3D 1) &amp;&am=
p; (vertical_factor !=3D 2))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ThrowReaderException(CorruptImageError,&=
quot;UnexpectedSamplingFactor&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+@@ -670,7 +670,7 @@ static MagickBooleanType WriteYUVImage(const ImageInfo=
 *image_info,Image *image,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vertical_factor=3Dhorizontal_factor;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((flags &amp; SigmaValue) !=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vertical_factor=3D(ssize_t) geometry_inf=
o.sigma;<br>
+-=C2=A0 =C2=A0 =C2=A0 if ((horizontal_factor !=3D 1) &amp;&amp; (horizonta=
l_factor !=3D 2) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 if ((horizontal_factor !=3D 1) &amp;&amp; (horizonta=
l_factor !=3D 2) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(vertical_factor !=3D 1) &amp;&am=
p; (vertical_factor !=3D 2))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ThrowWriterException(CorruptImageError,&=
quot;UnexpectedSamplingFactor&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25897=
.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25897.pat=
ch<br>
new file mode 100644<br>
index 0000000000..f1db20a6ad<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25897.patch<=
br>
@@ -0,0 +1,34 @@<br>
+From: Dirk Lemstra &lt;<a href=3D"mailto:dirk@lemstra.org" target=3D"_blan=
k" rel=3D"noreferrer">dirk@lemstra.org</a>&gt;<br>
+Date: Fri, 6 Feb 2026 22:21:19 +0100<br>
+Subject: Added extra check to prevent out of bounds heap write on 32-bit<b=
r>
+ systems (GHSA-6j5f-24fw-pqp4)<br>
+<br>
+(cherry picked from commit 23fde73188ea32c15b607571775d4f92bdb75e60)<br>
+<br>
+CVE: CVE-2026-25897<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/23fde73188ea32c15b607571775d4f92bdb75e60" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/com=
mit/23fde73188ea32c15b607571775d4f92bdb75e60</a>]<br>
+<br>
+origin: <a href=3D"https://github.com/ImageMagick/ImageMagick/commit/23fde=
73188ea32c15b607571775d4f92bdb75e60" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/ImageMagick/ImageMagick/commit/23fde73188ea3=
2c15b607571775d4f92bdb75e60</a><br>
+bug: <a href=3D"https://github.com/ImageMagick/ImageMagick/security/adviso=
ries/GHSA-6j5f-24fw-pqp4" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-6j5f-24f=
w-pqp4</a><br>
+<br>
+Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
+---<br>
+ coders/sun.c | 5 +++++<br>
+ 1 file changed, 5 insertions(+)<br>
+<br>
+diff --git a/coders/sun.c b/coders/sun.c<br>
+index f1452c5..76d7607 100644<br>
+--- a/coders/sun.c<br>
++++ b/coders/sun.c<br>
+@@ -470,6 +470,11 @@ static Image *ReadSUNImage(const ImageInfo *image_inf=
o,ExceptionInfo *exception)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sun_data=3D(unsigned char *) RelinquishM=
agickMemory(sun_data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ThrowReaderException(ResourceLimitError,=
&quot;ImproperImageHeader&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 if (image-&gt;rows &gt; (MAGICK_SIZE_MAX - pixels_length))<=
br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 sun_data=3D(unsigned char *) RelinquishMagick=
Memory(sun_data);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ThrowReaderException(ResourceLimitError,&quot=
;ImproperImageHeader&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0sun_pixels=3D(unsigned char *) AcquireQuantumMemory(pi=
xels_length+image-&gt;rows,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(*sun_pixels));<br>
+=C2=A0 =C2=A0 =C2=A0if (sun_pixels =3D=3D (unsigned char *) NULL)<br>
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898=
_1.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_1=
.patch<br>
new file mode 100644<br>
index 0000000000..8e68732131<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_1.patc=
h<br>
@@ -0,0 +1,39 @@<br>
+From: Dirk Lemstra &lt;<a href=3D"mailto:dirk@lemstra.org" target=3D"_blan=
k" rel=3D"noreferrer">dirk@lemstra.org</a>&gt;<br>
+Date: Fri, 6 Feb 2026 20:55:43 +0100<br>
+Subject: Fixed out of bound read with negative pixel index<br>
+ (GHSA-vpxv-r9pg-7gpr)<br>
+<br>
+(cherry picked from commit c9c87dbaba56bf82aebd3392e11f0ffd93709b12)<br>
+<br>
+CVE: CVE-2026-25898<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/c9c87dbaba56bf82aebd3392e11f0ffd93709b12" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/com=
mit/c9c87dbaba56bf82aebd3392e11f0ffd93709b12</a>]<br>
+<br>
+origin: <a href=3D"https://github.com/ImageMagick/ImageMagick/commit/c9c87=
dbaba56bf82aebd3392e11f0ffd93709b12" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/ImageMagick/ImageMagick/commit/c9c87dbaba56b=
f82aebd3392e11f0ffd93709b12</a><br>
+bug: <a href=3D"https://github.com/ImageMagick/ImageMagick/security/adviso=
ries/GHSA-vpxv-r9pg-7gpr" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-vpxv-r9p=
g-7gpr</a><br>
+<br>
+Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
+---<br>
+ coders/uil.c | 7 +++++--<br>
+ 1 file changed, 5 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/coders/uil.c b/coders/uil.c<br>
+index 74c45c7..ffcab49 100644<br>
+--- a/coders/uil.c<br>
++++ b/coders/uil.c<br>
+@@ -352,11 +352,14 @@ static MagickBooleanType WriteUILImage(const ImageIn=
fo *image_info,Image *image,<br>
+=C2=A0 =C2=A0 =C2=A0for (x=3D0; x &lt; (ssize_t) image-&gt;columns; x++)<b=
r>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0k=3D((ssize_t) GetPixelIndex(image,p) % MaxCixe=
ls);<br>
++=C2=A0 =C2=A0 =C2=A0 if (k &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 k=3D0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0symbol[0]=3DCixel[k];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (j=3D1; j &lt; (int) characters_per_pixel; =
j++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 k=3D(((int) GetPixelIndex(image,p)-k)/MaxCixe=
ls) %<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MaxCixels;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 k=3D(((int) GetPixelIndex(image,p)-k)/MaxCixe=
ls) % MaxCixels;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (k &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k=3D0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0symbol[j]=3DCixel[k];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0symbol[j]=3D&#39;\0&#39;;<br>
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898=
_2.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_2=
.patch<br>
new file mode 100644<br>
index 0000000000..563d5612b0<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25898_2.patc=
h<br>
@@ -0,0 +1,37 @@<br>
+From: Dirk Lemstra &lt;<a href=3D"mailto:dirk@lemstra.org" target=3D"_blan=
k" rel=3D"noreferrer">dirk@lemstra.org</a>&gt;<br>
+Date: Sun, 8 Feb 2026 14:15:46 +0100<br>
+Subject: Fixed out of bound read with negative pixel index<br>
+ (GHSA-vpxv-r9pg-7gpr)<br>
+<br>
+(cherry picked from commit 21525d8f27b86e8063fe359616086fd6b71eb05b)<br>
+<br>
+CVE: CVE-2026-25898<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/21525d8f27b86e8063fe359616086fd6b71eb05b" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/com=
mit/21525d8f27b86e8063fe359616086fd6b71eb05b</a>]<br>
+<br>
+origin:=C2=A0 <a href=3D"https://github.com/ImageMagick/ImageMagick/commit=
/21525d8f27b86e8063fe359616086fd6b71eb05b" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">https://github.com/ImageMagick/ImageMagick/commit/21525d8f2=
7b86e8063fe359616086fd6b71eb05b</a><br>
+bug: <a href=3D"https://github.com/ImageMagick/ImageMagick/security/adviso=
ries/GHSA-vpxv-r9pg-7gpr" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-vpxv-r9p=
g-7gpr</a><br>
+<br>
+Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
+---<br>
+ coders/xpm.c | 4 ++++<br>
+ 1 file changed, 4 insertions(+)<br>
+<br>
+diff --git a/coders/xpm.c b/coders/xpm.c<br>
+index 1dda89f..4a77b48 100644<br>
+--- a/coders/xpm.c<br>
++++ b/coders/xpm.c<br>
+@@ -1131,10 +1131,14 @@ static MagickBooleanType WriteXPMImage(const Image=
Info *image_info,Image *image,<br>
+=C2=A0 =C2=A0 =C2=A0for (x=3D0; x &lt; (ssize_t) image-&gt;columns; x++)<b=
r>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0k=3D((ssize_t) GetPixelIndex(image,p) % MaxCixe=
ls);<br>
++=C2=A0 =C2=A0 =C2=A0 if (k &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 k=3D0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0symbol[0]=3DCixel[k];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (j=3D1; j &lt; (ssize_t) characters_per_pix=
el; j++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0k=3D(((int) GetPixelIndex(image,p)-k)/Ma=
xCixels) % MaxCixels;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (k &lt; 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k=3D0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0symbol[j]=3DCixel[k];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0symbol[j]=3D&#39;\0&#39;;<br>
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25965=
.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25965.pat=
ch<br>
new file mode 100644<br>
index 0000000000..d57b62e83a<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25965.patch<=
br>
@@ -0,0 +1,322 @@<br>
+From: Dirk Lemstra &lt;<a href=3D"mailto:dirk@lemstra.org" target=3D"_blan=
k" rel=3D"noreferrer">dirk@lemstra.org</a>&gt;<br>
+Date: Tue, 3 Feb 2026 21:09:59 +0100<br>
+Subject: Prevent path traversal of paths that are blocked in the security<=
br>
+ policy (GHSA-8jvj-p28h-9gm7)<br>
+<br>
+(cherry picked from commit 4a9dc1075dcad3ab0579e1b37dbe854c882699a5)<br>
+<br>
+CVE: CVE-2026-25965<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/4a9dc1075dcad3ab0579e1b37dbe854c882699a5" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/com=
mit/4a9dc1075dcad3ab0579e1b37dbe854c882699a5</a>]<br>
+<br>
+origin: backport, <a href=3D"https://github.com/ImageMagick/ImageMagick/co=
mmit/4a9dc1075dcad3ab0579e1b37dbe854c882699a5" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/commit/4a9dc=
1075dcad3ab0579e1b37dbe854c882699a5</a><br>
+bug: <a href=3D"https://github.com/ImageMagick/ImageMagick/security/adviso=
ries/GHSA-8jvj-p28h-9gm7" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-8jvj-p28=
h-9gm7</a><br>
+<br>
+Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
+---<br>
+ MagickCore/module.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 +++--<br=
>
+ MagickCore/policy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 39 ++++++++=
++-----<br>
+ MagickCore/token.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
2 +<br>
+ MagickCore/utility-private.h | 115 ++++++++++++++++++++++++++++++++++++++=
+++++<br>
+ MagickCore/utility.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 28 +++++++-=
---<br>
+ 5 files changed, 169 insertions(+), 26 deletions(-)<br>
+<br>
+diff --git a/MagickCore/module.c b/MagickCore/module.c<br>
+index e36214d..5332a71 100644<br>
+--- a/MagickCore/module.c<br>
++++ b/MagickCore/module.c<br>
+@@ -584,15 +584,16 @@ static MagickBooleanType GetMagickModulePath(const c=
har *filename,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) ConcatenateMagickString(pa=
th,DirectorySeparator,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MagickPathExtent);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) ConcatenateMagickString(path,file=
name,MagickPathExtent);<br>
+-#if defined(MAGICKCORE_HAVE_REALPATH)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resolved_path[PATH_MAX+1];<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *real_path =3D realpath_utf8(pa=
th);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (realpath(path,resolved_path) !=3D =
(char *) NULL)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) CopyMagickString(path,re=
solved_path,MagickPathExtent);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (real_path !=3D (char *) NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) CopyMagickString(=
path,real_path,MagickPathExtent);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 real_path=3DDestroyStrin=
g(real_path);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IsPathAccessible(path) !=3D MagickFa=
lse)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0module_path=3DDestroyStrin=
g(module_path);<br>
+diff --git a/MagickCore/policy.c b/MagickCore/policy.c<br>
+index 8cfcee0..0e036c0 100644<br>
+--- a/MagickCore/policy.c<br>
++++ b/MagickCore/policy.c<br>
+@@ -640,6 +640,9 @@ static MagickBooleanType IsPolicyCacheInstantiated(Exc=
eptionInfo *exception)<br>
+ MagickExport MagickBooleanType IsRightsAuthorized(const PolicyDomain doma=
in,<br>
+=C2=A0 =C2=A0const PolicyRights rights,const char *pattern)<br>
+ {<br>
++=C2=A0 char<br>
++=C2=A0 =C2=A0 *real_pattern =3D (char *) NULL;<br>
++<br>
+=C2=A0 =C2=A0const PolicyInfo<br>
+=C2=A0 =C2=A0 =C2=A0*policy_info;<br>
+ <br>
+@@ -647,7 +650,8 @@ MagickExport MagickBooleanType IsRightsAuthorized(cons=
t PolicyDomain domain,<br>
+=C2=A0 =C2=A0 =C2=A0*exception;<br>
+ <br>
+=C2=A0 =C2=A0MagickBooleanType<br>
+-=C2=A0 =C2=A0 authorized;<br>
++=C2=A0 =C2=A0 authorized,<br>
++=C2=A0 =C2=A0 match;<br>
+ <br>
+=C2=A0 =C2=A0ElementInfo<br>
+=C2=A0 =C2=A0 =C2=A0*p;<br>
+@@ -671,22 +675,33 @@ MagickExport MagickBooleanType IsRightsAuthorized(co=
nst PolicyDomain domain,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*policy;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0policy=3D(const PolicyInfo *) p-&gt;value;<br>
+-=C2=A0 =C2=A0 if ((policy-&gt;domain =3D=3D domain) &amp;&amp;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (GlobExpression(pattern,policy-&gt;pattern,Ma=
gickFalse) !=3D MagickFalse))<br>
++=C2=A0 =C2=A0 if (policy-&gt;domain =3D=3D domain)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((rights &amp; ReadPolicyRights) !=3D 0)<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 authorized=3D(policy-&gt;rights &amp; =
ReadPolicyRights) !=3D 0 ? MagickTrue :<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MagickFalse;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((rights &amp; WritePolicyRights) !=3D 0)<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 authorized=3D(policy-&gt;rights &amp; =
WritePolicyRights) !=3D 0 ? MagickTrue :<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MagickFalse;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((rights &amp; ExecutePolicyRights) !=3D 0=
)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 authorized=3D(policy-&gt;rights &amp; =
ExecutePolicyRights) !=3D 0 ? MagickTrue :<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MagickFalse;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((policy-&gt;domain =3D=3D PathPolicyDomai=
n) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (real_pattern =3D=3D (const cha=
r *) NULL))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 real_pattern=3Drealpath_utf8(pattern);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (real_pattern !=3D (char*) NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match=3DGlobExpression(real_pattern,po=
licy-&gt;pattern,MagickFalse);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 match=3DGlobExpression(pattern,policy-=
&gt;pattern,MagickFalse);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (match !=3D MagickFalse)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((rights &amp; ReadPolicyRig=
hts) !=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 authorized=3D(policy-&gt=
;rights &amp; ReadPolicyRights) !=3D 0 ? MagickTrue :<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MagickFalse;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((rights &amp; WritePolicyRi=
ghts) !=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 authorized=3D(policy-&gt=
;rights &amp; WritePolicyRights) !=3D 0 ?<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MagickTrue : Magi=
ckFalse;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((rights &amp; ExecutePolicy=
Rights) !=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 authorized=3D(policy-&gt=
;rights &amp; ExecutePolicyRights) !=3D 0 ?<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MagickTrue : Magi=
ckFalse;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0p=3Dp-&gt;next;<br>
+=C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0UnlockSemaphoreInfo(policy_semaphore);<br>
++=C2=A0 if (real_pattern !=3D (char *) NULL)<br>
++=C2=A0 =C2=A0 real_pattern=3DDestroyString(real_pattern);<br>
+=C2=A0 =C2=A0return(authorized);<br>
+ }<br>
+ <br>
+diff --git a/MagickCore/token.c b/MagickCore/token.c<br>
+index 9763069..70085b4 100644<br>
+--- a/MagickCore/token.c<br>
++++ b/MagickCore/token.c<br>
+@@ -518,6 +518,7 @@ MagickExport MagickBooleanType GlobExpression(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=3DDestroyString(target);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++#if !defined(MAGICKCORE_WINDOWS_SUPPORT) || defined(__CYGWIN__)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;\\&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pattern+=3DGetUTFOctets(pattern);<br>
+@@ -525,6 +526,7 @@ MagickExport MagickBooleanType GlobExpression(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0magick_fallthrough;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (case_insensitive !=3D MagickFalse)<b=
r>
+diff --git a/MagickCore/utility-private.h b/MagickCore/utility-private.h<b=
r>
+index b3d951c..c28d4c5 100644<br>
+--- a/MagickCore/utility-private.h<br>
++++ b/MagickCore/utility-private.h<br>
+@@ -252,6 +252,121 @@ static inline FILE *popen_utf8(const char *command,c=
onst char *type)<br>
+ #endif<br>
+ }<br>
+ <br>
++static inline char *realpath_utf8(const char *path)<br>
++{<br>
++#if !defined(MAGICKCORE_WINDOWS_SUPPORT) || defined(__CYGWIN__)<br>
++#if defined(MAGICKCORE_HAVE_REALPATH)<br>
++=C2=A0 return(realpath(path,(char *) NULL));<br>
++#else<br>
++=C2=A0 return(AcquireString(path));<br>
++#endif<br>
++#else<br>
++=C2=A0 char<br>
++=C2=A0 =C2=A0 *real_path;<br>
++<br>
++=C2=A0 DWORD<br>
++=C2=A0 =C2=A0 final_path_length,<br>
++=C2=A0 =C2=A0 full_path_length;<br>
++<br>
++=C2=A0 HANDLE<br>
++=C2=A0 =C2=A0 file_handle;<br>
++<br>
++=C2=A0 int<br>
++=C2=A0 =C2=A0 length,<br>
++=C2=A0 =C2=A0 utf8_length;<br>
++<br>
++=C2=A0 wchar_t<br>
++=C2=A0 =C2=A0 *clean_path,<br>
++=C2=A0 =C2=A0 *full_path,<br>
++=C2=A0 =C2=A0 *wide_path;<br>
++<br>
++=C2=A0 /*<br>
++=C2=A0 =C2=A0 Convert UTF-8 to UTF-16.<br>
++=C2=A0 */<br>
++=C2=A0 if (path =3D=3D (const char *) NULL)<br>
++=C2=A0 =C2=A0 return((char *) NULL);<br>
++=C2=A0 length=3DMultiByteToWideChar(CP_UTF8,0,path,-1,NULL,0);<br>
++=C2=A0 if (length &lt;=3D 0)<br>
++=C2=A0 =C2=A0 return((char *) NULL);<br>
++=C2=A0 wide_path=3D(wchar_t *) AcquireQuantumMemory(length,sizeof(wchar_t=
));<br>
++=C2=A0 if (wide_path =3D=3D (wchar_t *) NULL)<br>
++=C2=A0 =C2=A0 return((char *) NULL);<br>
++=C2=A0 MultiByteToWideChar(CP_UTF8,0,path,-1,wide_path,length);<br>
++=C2=A0 /*<br>
++=C2=A0 =C2=A0 Normalize syntactically.<br>
++=C2=A0 */<br>
++=C2=A0 full_path_length=3DGetFullPathNameW(wide_path,0,NULL,NULL);<br>
++=C2=A0 if (full_path_length =3D=3D 0)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 wide_path=3D(wchar_t *) RelinquishMagickMemory(wide_=
path);<br>
++=C2=A0 =C2=A0 =C2=A0 return((char *) NULL);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 full_path=3D(wchar_t *) AcquireQuantumMemory(full_path_length,size=
of(wchar_t));<br>
++=C2=A0 if (full_path =3D=3D (wchar_t *) NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 wide_path=3D(wchar_t *) RelinquishMagickMemory(wide_=
path);<br>
++=C2=A0 =C2=A0 =C2=A0 return((char *) NULL);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 GetFullPathNameW(wide_path,full_path_length,full_path,NULL);<br>
++=C2=A0 wide_path=3D(wchar_t *) RelinquishMagickMemory(wide_path);<br>
++=C2=A0 /*<br>
++=C2=A0 =C2=A0 Open the file/directory to resolve symlinks.<br>
++=C2=A0 */<br>
++=C2=A0 file_handle=3DCreateFileW(full_path,GENERIC_READ,FILE_SHARE_READ |=
<br>
++=C2=A0 =C2=A0 FILE_SHARE_WRITE | FILE_SHARE_DELETE,NULL,OPEN_EXISTING,<br=
>
++=C2=A0 =C2=A0 FILE_FLAG_BACKUP_SEMANTICS,NULL);<br>
++=C2=A0 if (file_handle !=3D INVALID_HANDLE_VALUE)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 Resolve final canonical path.<br>
++=C2=A0 =C2=A0 =C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 final_path_length=3DGetFinalPathNameByHandleW(file_h=
andle,NULL,0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 FILE_NAME_NORMALIZED);<br>
++=C2=A0 =C2=A0 =C2=A0 if (final_path_length =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CloseHandle(file_handle);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 full_path=3D(wchar_t *) RelinquishMagi=
ckMemory(full_path);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return((char *) NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 full_path=3D(wchar_t *) RelinquishMagickMemory(full_=
path);<br>
++=C2=A0 =C2=A0 =C2=A0 full_path=3D(wchar_t *) AcquireQuantumMemory(final_p=
ath_length,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(wchar_t));<br>
++=C2=A0 =C2=A0 =C2=A0 if (full_path =3D=3D (wchar_t *) NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CloseHandle(file_handle);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return((char *) NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 GetFinalPathNameByHandleW(file_handle,full_path,fina=
l_path_length,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 FILE_NAME_NORMALIZED);<br>
++=C2=A0 =C2=A0 =C2=A0 CloseHandle(file_handle);<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 /*<br>
++=C2=A0 =C2=A0 Remove \\?\ prefix for POSIX-like behavior.<br>
++=C2=A0 */<br>
++=C2=A0 clean_path=3Dfull_path;<br>
++=C2=A0 if (wcsncmp(full_path,L&quot;\\\\?\\&quot;,4) =3D=3D 0)<br>
++=C2=A0 =C2=A0 clean_path=3Dfull_path+4;<br>
++=C2=A0 /*<br>
++=C2=A0 =C2=A0 Convert UTF-16 to UTF-8.<br>
++=C2=A0 */<br>
++=C2=A0 utf8_length=3DWideCharToMultiByte(CP_UTF8,0,clean_path,-1,NULL,0,N=
ULL,NULL);<br>
++=C2=A0 if (utf8_length &lt;=3D 0)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 full_path=3D(wchar_t *) RelinquishMagickMemory(full_=
path);<br>
++=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 real_path=3D(char *) AcquireQuantumMemory(utf8_length,sizeof(char)=
);<br>
++=C2=A0 if (real_path =3D=3D (char *) NULL)<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 full_path=3D(wchar_t *) RelinquishMagickMemory(full_=
path);<br>
++=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 WideCharToMultiByte(CP_UTF8,0,clean_path,-1,real_path,utf8_length,=
NULL,NULL);<br>
++=C2=A0 full_path=3D(wchar_t *) RelinquishMagickMemory(full_path);<br>
++=C2=A0 return(real_path);<br>
++#endif<br>
++}<br>
++<br>
+ static inline int remove_utf8(const char *path)<br>
+ {<br>
+ #if !defined(MAGICKCORE_WINDOWS_SUPPORT) || defined(__CYGWIN__)<br>
+diff --git a/MagickCore/utility.c b/MagickCore/utility.c<br>
+index bbeef37..4fd6e9c 100644<br>
+--- a/MagickCore/utility.c<br>
++++ b/MagickCore/utility.c<br>
+@@ -1042,16 +1042,23 @@ MagickPrivate MagickBooleanType GetExecutionPath(c=
har *path,const size_t extent)<br>
+ #if defined(MAGICKCORE_HAVE__NSGETEXECUTABLEPATH)<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0char<br>
+-=C2=A0 =C2=A0 =C2=A0 executable_path[PATH_MAX &lt;&lt; 1],<br>
+-=C2=A0 =C2=A0 =C2=A0 execution_path[PATH_MAX+1];<br>
++=C2=A0 =C2=A0 =C2=A0 executable_path[PATH_MAX &lt;&lt; 1];<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0uint32_t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0length;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0length=3Dsizeof(executable_path);<br>
+-=C2=A0 =C2=A0 if ((_NSGetExecutablePath(executable_path,&amp;length) =3D=
=3D 0) &amp;&amp;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (realpath(executable_path,execution_path) !=
=3D (char *) NULL))<br>
+-=C2=A0 =C2=A0 =C2=A0 (void) CopyMagickString(path,execution_path,extent);=
<br>
++=C2=A0 =C2=A0 if (_NSGetExecutablePath(executable_path,&amp;length) =3D=
=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 char<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *real_path =3D realpath_utf8(executabl=
e_path);<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (real_path !=3D (char *) NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) CopyMagickString(path,re=
al_path,extent);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 real_path=3DDestroyString(real_=
path);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0}<br>
+ #endif<br>
+ #if defined(MAGICKCORE_HAVE_GETEXECNAME)<br>
+@@ -1097,10 +1104,13 @@ MagickPrivate MagickBooleanType GetExecutionPath(c=
har *path,const size_t extent)<br>
+=C2=A0 =C2=A0 =C2=A0if (count !=3D -1)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 execution_path[PATH_MAX+1];<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *real_path =3D realpath_utf8(program_n=
ame);<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (realpath(program_name,execution_path) !=
=3D (char *) NULL)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) CopyMagickString(path,execution=
_path,extent);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (real_path !=3D (char *) NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) CopyMagickString(path,re=
al_path,extent);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 real_path=3DDestroyString(real_=
path);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0if (program_name !=3D program_invocation_name)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0program_name=3D(char *) RelinquishMagickMemory(=
program_name);<br>
+@@ -1882,7 +1892,7 @@ MagickPrivate MagickBooleanType ShredFile(const char=
 *path)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0char<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*property;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
++<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0passes=3D0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0property=3DGetEnvironmentValue(&quot;MAGICK_SHR=
ED_PASSES&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (property !=3D (char *) NULL)<br>
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25966=
.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25966.pat=
ch<br>
new file mode 100644<br>
index 0000000000..324443e5f0<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25966.patch<=
br>
@@ -0,0 +1,56 @@<br>
+From: Dirk Lemstra &lt;<a href=3D"mailto:dirk@lemstra.org" target=3D"_blan=
k" rel=3D"noreferrer">dirk@lemstra.org</a>&gt;<br>
+Date: Tue, 3 Feb 2026 20:00:28 +0100<br>
+Subject: Block reading from fd: in our more secure policies by default<br>
+ (GHSA-xwc6-v6g8-pw2h)<br>
+<br>
+(cherry picked from commit 8d4c67a90ae458fb36393a05c0069e9123ac174c)<br>
+<br>
+CVE: CVE-2026-25966<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/8d4c67a90ae458fb36393a05c0069e9123ac174c" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/com=
mit/8d4c67a90ae458fb36393a05c0069e9123ac174c</a>]<br>
+<br>
+origin: backport, <a href=3D"https://github.com/ImageMagick/ImageMagick/co=
mmit/8d4c67a90ae458fb36393a05c0069e9123ac174c" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/commit/8d4c6=
7a90ae458fb36393a05c0069e9123ac174c</a><br>
+bug: <a href=3D"https://github.com/ImageMagick/ImageMagick/security/adviso=
ries/GHSA-xwc6-v6g8-pw2h" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-xwc6-v6g=
8-pw2h</a><br>
+<br>
+Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
+---<br>
+ config/policy-secure.xml=C2=A0 | 1 +<br>
+ config/policy-websafe.xml | 1 +<br>
+ www/security-policy.html=C2=A0 | 1 +<br>
+ 3 files changed, 3 insertions(+)<br>
+<br>
+diff --git a/config/policy-secure.xml b/config/policy-secure.xml<br>
+index 0d312d2..4239822 100644<br>
+--- a/config/policy-secure.xml<br>
++++ b/config/policy-secure.xml<br>
+@@ -88,6 +88,7 @@<br>
+=C2=A0 =C2=A0&lt;policy domain=3D&quot;filter&quot; rights=3D&quot;none&qu=
ot; pattern=3D&quot;*&quot;/&gt;<br>
+=C2=A0 =C2=A0&lt;!-- Don&#39;t read/write from/to stdin/stdout. --&gt;<br>
+=C2=A0 =C2=A0&lt;policy domain=3D&quot;path&quot; rights=3D&quot;none&quot=
; pattern=3D&quot;-&quot;/&gt;<br>
++=C2=A0 &lt;policy domain=3D&quot;path&quot; rights=3D&quot;none&quot; pat=
tern=3D&quot;fd:*&quot;/&gt;<br>
+=C2=A0 =C2=A0&lt;!-- don&#39;t read sensitive paths. --&gt;<br>
+=C2=A0 =C2=A0&lt;policy domain=3D&quot;path&quot; rights=3D&quot;none&quot=
; pattern=3D&quot;/etc/*&quot;/&gt;<br>
+=C2=A0 =C2=A0&lt;!-- Indirect reads are not permitted. --&gt;<br>
+diff --git a/config/policy-websafe.xml b/config/policy-websafe.xml<br>
+index 05327e3..544bf74 100644<br>
+--- a/config/policy-websafe.xml<br>
++++ b/config/policy-websafe.xml<br>
+@@ -84,6 +84,7 @@<br>
+=C2=A0 =C2=A0&lt;policy domain=3D&quot;filter&quot; rights=3D&quot;none&qu=
ot; pattern=3D&quot;*&quot;/&gt;<br>
+=C2=A0 =C2=A0&lt;!-- Don&#39;t read/write from/to stdin/stdout. --&gt;<br>
+=C2=A0 =C2=A0&lt;policy domain=3D&quot;path&quot; rights=3D&quot;none&quot=
; pattern=3D&quot;-&quot;/&gt;<br>
++=C2=A0 &lt;policy domain=3D&quot;path&quot; rights=3D&quot;none&quot; pat=
tern=3D&quot;fd:*&quot;/&gt;<br>
+=C2=A0 =C2=A0&lt;!-- don&#39;t read sensitive paths. --&gt;<br>
+=C2=A0 =C2=A0&lt;policy domain=3D&quot;path&quot; rights=3D&quot;none&quot=
; pattern=3D&quot;/etc/*&quot;/&gt;<br>
+=C2=A0 =C2=A0&lt;!-- Indirect reads are not permitted. --&gt;<br>
+diff --git a/www/security-policy.html b/www/security-policy.html<br>
+index af8c206..b254962 100644<br>
+--- a/www/security-policy.html<br>
++++ b/www/security-policy.html<br>
+@@ -250,6 +250,7 @@<br>
+=C2=A0 =C2=A0&amp;lt;policy domain=3D&quot;filter&quot; rights=3D&quot;non=
e&quot; pattern=3D&quot;*&quot;/&gt;<br>
+=C2=A0 =C2=A0&amp;lt;!-- Don&#39;t read/write from/to stdin/stdout. --&gt;=
<br>
+=C2=A0 =C2=A0&amp;lt;policy domain=3D&quot;path&quot; rights=3D&quot;none&=
quot; pattern=3D&quot;-&quot;/&gt;<br>
++=C2=A0 &amp;lt;policy domain=3D&quot;path&quot; rights=3D&quot;none&quot;=
 pattern=3D&quot;fd:*&quot;/&gt;<br>
+=C2=A0 =C2=A0&amp;lt;!-- don&#39;t read sensitive paths. --&gt;<br>
+=C2=A0 =C2=A0&amp;lt;policy domain=3D&quot;path&quot; rights=3D&quot;none&=
quot; pattern=3D&quot;/etc/*&quot;/&gt;<br>
+=C2=A0 =C2=A0&amp;lt;!-- Indirect reads are not permitted. --&gt;<br>
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25967=
.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25967.pat=
ch<br>
new file mode 100644<br>
index 0000000000..d9b7efc9c1<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25967.patch<=
br>
@@ -0,0 +1,38 @@<br>
+From: Cristy &lt;<a href=3D"mailto:urban-warrior@imagemagick.org" target=
=3D"_blank" rel=3D"noreferrer">urban-warrior@imagemagick.org</a>&gt;<br>
+Date: Sat, 31 Jan 2026 12:59:33 -0500<br>
+Subject: [PATCH] CVE-2026-25967<br>
+ <a href=3D"https://github.com/ImageMagick/ImageMagick/security/advisories=
/GHSA-72hf-fj62-w6j4" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-72hf-fj62-w6=
j4</a><br>
+<br>
+a stack-based buffer overflow exists in the ImageMagick FTXT image reader.=
 A crafted FTXT file can cause out-of-bounds writes on the stack, leading t=
o a crash.<br>
+<br>
+(cherry picked from commit 9afe96cc325da1e4349fbd7418675af2f8708c10)<br>
+<br>
+CVE: CVE-2026-25967<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/9afe96cc325da1e4349fbd7418675af2f8708c10" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/com=
mit/9afe96cc325da1e4349fbd7418675af2f8708c10</a>]<br>
+<br>
+origin: <a href=3D"https://github.com/ImageMagick/ImageMagick/commit/9afe9=
6cc325da1e4349fbd7418675af2f8708c10" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/ImageMagick/ImageMagick/commit/9afe96cc325da=
1e4349fbd7418675af2f8708c10</a><br>
+bug: <a href=3D"https://github.com/ImageMagick/ImageMagick/security/adviso=
ries/GHSA-72hf-fj62-w6j4" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-72hf-fj6=
2-w6j4</a><br>
+<br>
+Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
+---<br>
+ coders/ftxt.c | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/coders/ftxt.c b/coders/ftxt.c<br>
+index d665bec..e9bb47f 100644<br>
+--- a/coders/ftxt.c<br>
++++ b/coders/ftxt.c<br>
+@@ -197,11 +197,11 @@ static int ReadInt(Image * image,MagickBooleanType *=
eofInp,int *chPushed,<br>
+=C2=A0 =C2=A0 =C2=A0if (p-buffer &gt;=3D MaxTextExtent)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*eofInp=3DMagickTrue;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0chIn=3DReadChar(image,chPushed);<br>
+=C2=A0 =C2=A0}<br>
+-=C2=A0 if (p=3D=3Dbuffer)<br>
++=C2=A0 if (p =3D=3D buffer)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*eofInp=3DMagickTrue;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return(0);<br>
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25968=
.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25968.pat=
ch<br>
new file mode 100644<br>
index 0000000000..bad2ace65d<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25968.patch<=
br>
@@ -0,0 +1,39 @@<br>
+From: Dirk Lemstra &lt;<a href=3D"mailto:dirk@lemstra.org" target=3D"_blan=
k" rel=3D"noreferrer">dirk@lemstra.org</a>&gt;<br>
+Date: Tue, 3 Feb 2026 22:40:04 +0100<br>
+Subject: Patch to resolve possible out of bounds write in the msl decoder<=
br>
+ (GHSA-3mwp-xqp2-q6ph).<br>
+<br>
+(cherry picked from commit 56f02958890b820cf2d0a6ecb04eb6f58ea75628)<br>
+<br>
+CVE: CVE-2026-25969<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/56f02958890b820cf2d0a6ecb04eb6f58ea75628" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/com=
mit/56f02958890b820cf2d0a6ecb04eb6f58ea75628</a>]<br>
+<br>
+origin: <a href=3D"https://github.com/ImageMagick/ImageMagick/commit/56f02=
958890b820cf2d0a6ecb04eb6f58ea75628" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/ImageMagick/ImageMagick/commit/56f02958890b8=
20cf2d0a6ecb04eb6f58ea75628</a><br>
+bug: <a href=3D"https://github.com/ImageMagick/ImageMagick/security/adviso=
ries/GHSA-3mwp-xqp2-q6ph" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-3mwp-xqp=
2-q6ph</a><br>
+<br>
+Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
+---<br>
+ coders/msl.c | 9 +++++----<br>
+ 1 file changed, 5 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/coders/msl.c b/coders/msl.c<br>
+index 9facbf2..4af3a71 100644<br>
+--- a/coders/msl.c<br>
++++ b/coders/msl.c<br>
+@@ -5827,11 +5827,12 @@ static void MSLStartElement(void *context,const xm=
lChar *tag,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Quant=
um=C2=A0 opac =3D OpaqueAlpha;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssize=
_t len =3D (ssize_t) strlen( value );<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value[=
len-1] =3D=3D &#39;%&#39;) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cha=
r=C2=A0 tmp[100];<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((len &=
gt; 0) &amp;&amp; (value[len-1] =3D=3D &#39;%&#39;)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cha=
r *tmp =3D AcquireString(value);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(void) CopyMagickString(tmp,value,(size_t) len);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opa=
c =3D StringToLong( tmp );<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opa=
c =3D (int)(QuantumRange * ((float)opac/100));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opa=
c =3D (Quantum) StringToLong( tmp );<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp=
=3DDestroyString(tmp);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 opa=
c =3D (Quantum)(QuantumRange * ((float)opac/100));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} els=
e<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0opac =3D StringToLong( value );<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void=
) SetImageAlpha( msl_info-&gt;image[n], (Quantum) opac,<br>
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25969=
.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25969.pat=
ch<br>
new file mode 100644<br>
index 0000000000..4432a5c9d8<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25969.patch<=
br>
@@ -0,0 +1,63 @@<br>
+From: Cristy &lt;<a href=3D"mailto:urban-warrior@imagemagick.org" target=
=3D"_blank" rel=3D"noreferrer">urban-warrior@imagemagick.org</a>&gt;<br>
+Date: Wed, 28 Jan 2026 20:33:56 -0500<br>
+Subject: [PATCH] CVE-2026-25969<br>
+<a href=3D"https://github.com/ImageMagick/ImageMagick/security/advisories/=
GHSA-xgm3-v4r9-wfgm" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//github.com/ImageMagick/ImageMagick/security/advisories/GHSA-xgm3-v4r9-wfg=
m</a><br>
+<br>
+a memory leak exists in `coders/ashlar.c`. The `WriteASHLARImage` allocate=
s a structure. However, when an exception is thrown, the allocated memory i=
s not properly released, resulting in a potential memory leak.<br>
+<br>
+(cherry picked from commit a253d1b124ebdcc2832daac6f9a35c362635b40e)<br>
+<br>
+CVE: CVE-2026-25969<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/a253d1b124ebdcc2832daac6f9a35c362635b40e" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/com=
mit/a253d1b124ebdcc2832daac6f9a35c362635b40e</a>]<br>
+<br>
+[backport]<br>
+- do not change border parameters, keep old parameter in patch context<br>
+<br>
+origin: backport, <a href=3D"https://github.com/ImageMagick/ImageMagick/co=
mmit/a253d1b124ebdcc2832daac6f9a35c362635b40e" rel=3D"noreferrer noreferrer=
" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/commit/a253d=
1b124ebdcc2832daac6f9a35c362635b40e</a><br>
+bug: <a href=3D"https://github.com/ImageMagick/ImageMagick/security/adviso=
ries/GHSA-xgm3-v4r9-wfgm" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttps://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-xgm3-v4r=
9-wfgm</a><br>
+<br>
+Signed-off-by: Naman Jain &lt;<a href=3D"mailto:namanj1@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">namanj1@kpit.com</a>&gt;<br>
+---<br>
+ coders/ashlar.c | 7 +++++--<br>
+ 1 file changed, 5 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/coders/ashlar.c b/coders/ashlar.c<br>
+index a44976f..1984215 100644<br>
+--- a/coders/ashlar.c<br>
++++ b/coders/ashlar.c<br>
+@@ -543,7 +543,8 @@ static Image *ASHLARImage(ImageInfo *image_info,Image =
*image,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0geometry.height=3D(size_t) geometry.height/7;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0geometry.x=3D(ssize_t) pow((double) geometry.wi=
dth,0.25);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0geometry.y=3D(ssize_t) pow((double) geometry.he=
ight,0.25);<br>
+-=C2=A0 =C2=A0 =C2=A0 image_info-&gt;extract=3DAcquireString(&quot;&quot;)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 if (image_info-&gt;extract =3D=3D (char *) NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_info-&gt;extract=3DAcquireString(&quot;=
&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (image_info-&gt;extract !=3D (char *) NULL)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void) FormatLocaleString(image_info-&gt=
;extract,MagickPathExtent,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%gx%g%+g%+g&quot;,(double) =
geometry.width,(double) geometry.height,<br>
+@@ -707,7 +708,6 @@ static MagickBooleanType WriteASHLARImage(const ImageI=
nfo *image_info,<br>
+=C2=A0 =C2=A0if (value !=3D (const char *) NULL)<br>
+=C2=A0 =C2=A0 =C2=A0tiles_per_page=3D(size_t) MagickMax(StringToInteger(va=
lue),1);<br>
+=C2=A0 =C2=A0ashlar_images=3DNewImageList();<br>
+-=C2=A0 write_info=3DCloneImageInfo(image_info);<br>
+=C2=A0 =C2=A0for (i=3D0; i &lt; (ssize_t) GetImageListLength(image); i+=3D=
(ssize_t) tiles_per_page)<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0char<br>
+@@ -726,7 +726,9 @@ static MagickBooleanType WriteASHLARImage(const ImageI=
nfo *image_info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ashlar_images=3DDestroyImageList(=
ashlar_images);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 write_info=3DCloneImageInfo(image_info);<br>
+=C2=A0 =C2=A0 =C2=A0ashlar_image=3DASHLARImage(write_info,clone_images,exc=
eption);<br>
++=C2=A0 =C2=A0 write_info=3DDestroyImageInfo(write_info);<br>
+=C2=A0 =C2=A0 =C2=A0clone_images=3DDestroyImageList(clone_images);<br>
+=C2=A0 =C2=A0 =C2=A0if (ashlar_image =3D=3D (Image *) NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+@@ -741,6 +743,7 @@ static MagickBooleanType WriteASHLARImage(const ImageI=
nfo *image_info,<br>
+=C2=A0 =C2=A0ashlar_images=3DGetFirstImageInList(ashlar_images);<br>
+=C2=A0 =C2=A0(void) CopyMagickString(ashlar_images-&gt;filename,image_info=
-&gt;filename,<br>
+=C2=A0 =C2=A0 =C2=A0MagickPathExtent);<br>
++=C2=A0 write_info=3DCloneImageInfo(image_info);<br>
+=C2=A0 =C2=A0*write_info-&gt;magick=3D&#39;\0&#39;;<br>
+=C2=A0 =C2=A0(void) SetImageInfo(write_info,(unsigned int)<br>
+=C2=A0 =C2=A0 =C2=A0GetImageListLength(ashlar_images),exception);<br>
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970=
.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970.pat=
ch<br>
new file mode 100644<br>
index 0000000000..0483050a2b<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25970.patch<=
br>
@@ -0,0 +1,139 @@<br>
+From: Cristy &lt;<a href=3D"mailto:urban-warrior@imagemagick.org" target=
=3D"_blank" rel=3D"noreferrer">urban-warrior@imagemagick.org</a>&gt;<br>
+Date: Sun, 1 Feb 2026 13:55:34 -0500<br>
+Subject: <br>
+ <a href=3D"https://github.com/ImageMagick/ImageMagick/security/advisories=
/GHSA-xg29-8ghv-v4xr" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-xg29-8ghv-v4=
xr</a><br>
+<br>
+(cherry picked from commit 729253dc16e1a1ec4cac891a12d597e3fa9336b3)<br>
+<br>
+CVE: CVE-2026-25970<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/729253dc16e1a1ec4cac891a12d597e3fa9336b3" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/com=
mit/729253dc16e1a1ec4cac891a12d597e3fa9336b3</a>]<br>
+<br>
+a signed integer overflow vulnerability in ImageMagick&#39;s SIXEL decoder=
 allows an attacker to trigger memory corruption and denial of service when=
 processing a maliciously crafted SIXEL image file. The vulnerability occur=
s during buffer reallocation operations where pointer arithmetic using sign=
ed 32-bit integers overflows<br>
+<br>
+origin: backport, <a href=3D"https://github.com/ImageMagick/ImageMagick/co=
mmit/729253dc16e1a1ec4cac891a12d597e3fa9336b3" rel=3D"noreferrer noreferrer=
" target=3D"_blank"></a></blockquote></div>

--000000000000eaf8e5064f8e89e8--

