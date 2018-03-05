Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4433D7884B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Mar 2018 04:43:41 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id l191so21127957lfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2018 20:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XwGsB3nFSAYm6iS3SLZzkeH9iMrslUuHgUPEXtW2t+E=;
	b=FLATQzAenqSiPyM9KU/4omBXsOrENu7+b2QoUlTe4l2Wd9KmSYeV7hsobIbikBnmjv
	qWOFwC02W/HqQjf+qfEqyax7vyy15cljWysFJMIHroCccYuE8HpQmUAQn753+5YqFUgs
	mL+F8hZnp70DIWZoIEHyEgz9h3p7i/H5qzkqApCG2jl2RevNMYVNrdGkwjFpk+npRTjm
	CGmbMdkOPZX8DmEttWqSw6EyNAF5jGrX1wHc9z/P77p8QQ3C4/O2vd1VARoZ+cZ6uim/
	YS/NCslvj3DZvxm0zK1ZbEtDIu/LSlKJvwUffBYoCAGQOzxmXrvYijWlhorLNZ7T5m4B
	wS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XwGsB3nFSAYm6iS3SLZzkeH9iMrslUuHgUPEXtW2t+E=;
	b=qNlLkirpgWKDpWTa195EedMN2qvlQ/NhKVoPHQ1ydp0cYvGLMm+M2442UM61RFLVni
	87xGFXy3TnXfS+oEnQOSnVoi7fUW7/CuytdX8MCPhOzAWDqXmxmPPo0Kxwzx/uDCb53W
	Z7Px2ak8dNe1RXWnE+pDWn2qnF1nVibsDwXrZLOXSJKEENWfuU4RBqqwryQBve4hURpN
	XDXVC0JWhmzZqN9eAV1ET+oKRpgWn+ja3GczMQPlgI74ejzTGymryevwaVOOB4E4bajj
	3hJECPQtaI3z4W73HdMpl3gxRVw/xlrI8BSRqcYxav+A6cQlmc0IaK3ahriIC4U6PSTn
	dcRA==
X-Gm-Message-State: APf1xPAOgysDXxe+di5S1fS8YSC2te9Vizv3juVWSeqIpbIlYFG+zo8P
	RAqDBMCllFAMo9EiZ+nmbTByDX9hWEI0TPrPr2I=
X-Google-Smtp-Source: AG47ELvZdldD4nkE5/sgxAH5XLkiAK9lRIqhPE0p4sWyXMI2bdjLon0eWDRVctZ6C01Hjwbou/ZufTkpbGR/0uxppzM=
X-Received: by 10.46.17.220 with SMTP id 89mr8685308ljr.87.1520225022433; Sun,
	04 Mar 2018 20:43:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Sun, 4 Mar 2018 20:43:41 -0800 (PST)
In-Reply-To: <20180305030116.1901-2-raj.khem@gmail.com>
References: <20180305030116.1901-1-raj.khem@gmail.com>
	<20180305030116.1901-2-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 4 Mar 2018 23:43:41 -0500
Message-ID: <CADkTA4PoXBk8jpJk2Jngtw0VnKoVW-dLwHCOLyaownqz0ZufCg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH V2 2/2] ebtables: Fix duplicate definition errors due to netinet/ether.h
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
X-List-Received-Date: Mon, 05 Mar 2018 04:43:42 -0000
Content-Type: text/plain; charset="UTF-8"

FYI: I'm also about to spin a new linux-libc-headers that addresses this issue
as well.

There's a -stable patch that fixes the regression introduced in 4.15 headers, so
I've bumped to 4.15.7 to pick up that fix.  I also had to adjust the
musl libc-headers
patches for it slightly, but after those chances, this should build
without needing
any package specific patches.

I'm doing final testing (and will build ebtables directly to confirm),
and I expect to
get the series out Monday.

Bruce

On Sun, Mar 4, 2018 at 10:01 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Make the patch musl specific as it is regressing glibc 2.27
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> Changes since v1:
> - Drop the new patch since it was reverting existing patch partially
> - Apply the regressing patch conditionally to musl builds alone
>
>  meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> index d5e7341a0..e4adafd3c 100644
> --- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> +++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
> @@ -29,9 +29,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/ebtables/ebtables-v${PV}.tar.gz \
>             file://0007-extensions-Use-stdint-types.patch \
>             file://0008-ethernetdb.h-Remove-C-specific-compiler-hint-macro-_.patch \
>             file://0009-ebtables-Allow-RETURN-target-rules-in-user-defined-c.patch \
> -           file://0010-Adjust-header-include-sequence.patch \
>             "
>
> +SRC_URI_append_libc-musl = " file://0010-Adjust-header-include-sequence.patch"
> +
>  SRC_URI[md5sum] = "506742a3d44b9925955425a659c1a8d0"
>  SRC_URI[sha256sum] = "dc6f7b484f207dc712bfca81645f45120cb6aee3380e77a1771e9c34a9a4455d"
>
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

