Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4D31275F18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2015 23:51:41 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so1552188wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2015 16:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=k5gnQsNMT1z0/9IJ2bujZGtTU6VYZ6sWPfhAQL4ElfI=;
	b=SU9bTvRbqbOcx+pbfv8NjgnyYxpqivO1TvZe7RdX1aQEGtY6j7t0DMxA3qX8v0xlzx
	wlWy6x+m4cMx8LBlOnhX3+6Ou2tmm0NERGuwt8qX7Hu1INCs7eXgeNbb4bpjiOn2hRL6
	rxcthLO0jMfWPctsk1JmaLgaYteZe+4pwNaP9N6Ill+rudz0/ZM1of7pj/uvLFYhDa+H
	/GoQHDGIzz5AKikODRiB1xO0T7HLST7kuDD0Kx1fsl1Y6l+wg84V0fbLeDY/1vnop9Jr
	NLvg9TG7H9vctOtbzDLpFPzD07iyQ1qYHTgSvd3xKHN24JXgLQ0xF9yqQt1AeTRZrFEs
	3+kw==
MIME-Version: 1.0
X-Received: by 10.194.2.161 with SMTP id 1mr12757160wjv.143.1437004301765;
	Wed, 15 Jul 2015 16:51:41 -0700 (PDT)
Received: by 10.28.157.22 with HTTP; Wed, 15 Jul 2015 16:51:41 -0700 (PDT)
In-Reply-To: <1437001219-5383-1-git-send-email-dominic.sacre@gmx.de>
References: <1437001219-5383-1-git-send-email-dominic.sacre@gmx.de>
Date: Thu, 16 Jul 2015 01:51:41 +0200
Message-ID: <CA+chaQc6B=m9HZz9mBEJPfhCK64VRq3C=7pvwy5iU-WvHx+66g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] fio: re-enable building for ARM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Jul 2015 23:51:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Can you please add PACKAGECONFIG for numa, which will be enabled by default
for !arm ?

That way it will stay disabled even if numactl gets available for arm,
instead of autodetecting it.

On Thu, Jul 16, 2015 at 1:00 AM, Dominic Sacr=C3=A9 <dominic.sacre@gmx.de> =
wrote:

> fio's use of libnuma/numactl is optional, and the availability of
> the library is detected during configure.
>
> This patch allows fio to build for ARM again, by conditionally
> removing the dependency on numactl (which does not support ARM).
>
> Signed-off-by: Dominic Sacr=C3=A9 <dominic.sacre@gmx.de>
> ---
>  meta-oe/recipes-benchmark/fio/fio_2.2.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> index 82f9cd4..fe41020 100644
> --- a/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> +++ b/meta-oe/recipes-benchmark/fio/fio_2.2.6.bb
> @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D393a5ca445f6965873eca0259a17f833"
>  DEPENDS =3D "libaio zlib numactl"
>
>  # ARM does not currently support NUMA
> -COMPATIBLE_HOST =3D "^((?!arm).*)$"
> +DEPENDS_remove_arm =3D "numactl"
>
>  # rev for v2.2.6
>  SRCREV =3D "f52c9691bc8c285f3445235c69acdfd6de7f9b82"
> --
> 2.4.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

