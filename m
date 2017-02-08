Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id BF9E671CB1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 20:21:38 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id n125so5628584vke.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2017 12:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=cs60UU1c82oUiRNy5DZLHhFi710lENU6UXkK+DOTWu4=;
	b=XOGUWu/QDE/LItzOpbO66WONoIuquzBo/yzXPqkh6XALo/tG+guNH31IHbO/IU2WBP
	AcfLLB69sBnZBmHPCKvYfu7iJxa+8doiBySissVyfTYaiAseb3BUH4iDs1VXcTMI9jXw
	yuoJ2F1bQ3sw/mdhuKFvX1hUpfmkqXkA637LX0o2Yehy/iskcv2XPoiT3eJvluBGLue9
	10uwrk51PqZI1Ah1/g1WKa6juSWS3NSK3hVj8DC1bpdq+a/Y3rfh+H8I+KBDchy9UPtw
	sjz7cX4LZo3wwEkOoxRXd5G4y9Jo6+hIdTVnSUJvzCCGYDNeU64Xgjk6YcyMfi/cmgxt
	50xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=cs60UU1c82oUiRNy5DZLHhFi710lENU6UXkK+DOTWu4=;
	b=L8bZkC0zLco/oaSKbBRayQuvTm7XZ9P23M5IggOntBQOeQcepqPIKdQ/ECWh7IzI76
	U6QWJkSkEpGquQ+O8ze8X4QV2kYk0OWH5W3db56e9gTA7ZtUkKqekoUrrGx2Q//omrTJ
	X9EpcFwxBYni8zjVvvRUZKwytizvZufJh7kuUZhvbRzyEY77VekjfDMGS38+M3pmX+mX
	E3INCTOvLkJGaO4aRUS7iPYOi7Sd50HSiIC3ksQVHkJMfkdRbxRdusioaiHSklNrS7yf
	gMhsEo6wcrs2t0BuIZ1f0H6WLwMjyRgajc4hsdx1/zn8BKnNjPw6gfi1ympgcpo8cWUn
	V5Kw==
X-Gm-Message-State: AMke39nXCX7mvv5yPupavVEYHwLWOshMBj5mSzKHj2XMmL6ybcDrhpIwlmvrQS3M8yQekb6eJc4olbqGC/dolQ==
X-Received: by 10.31.168.145 with SMTP id r139mr11064515vke.148.1486585298441; 
	Wed, 08 Feb 2017 12:21:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.05852f1b820c067f96dd93729e6fdb949d51579d.1486546542.git-series.patrick.ohly@intel.com>
	<c480e4bea612959118bcdbc09e129084fd1d5866.1486546542.git-series.patrick.ohly@intel.com>
In-Reply-To: <c480e4bea612959118bcdbc09e129084fd1d5866.1486546542.git-series.patrick.ohly@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 08 Feb 2017 20:21:27 +0000
Message-ID: <CAMKF1spq2eiKHXrz19ZzRWmwzWUKsSSHbunLfqRND98SjkHgVg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 1/4] lvm2: remove unbuildable 2.02.138
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
X-List-Received-Date: Wed, 08 Feb 2017 20:21:39 -0000
Content-Type: text/plain; charset=UTF-8

Can you check if this is the last gpl2 version


On Wed, Feb 8, 2017 at 1:39 AM Patrick Ohly <patrick.ohly@intel.com> wrote:

> The patches defined in lvm2.inc no longer apply cleanly to 2.02.138
> and as no-one has complained, the old version is probably obsolete
> and can be removed.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta-oe/recipes-support/lvm2/lvm2_2.02.138.bb | 4 ----
>  1 file changed, 4 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/lvm2/lvm2_2.02.138.bb
>
> diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.138.bb
> b/meta-oe/recipes-support/lvm2/lvm2_2.02.138.bb
> deleted file mode 100644
> index 13a866e..0000000
> --- a/meta-oe/recipes-support/lvm2/lvm2_2.02.138.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require lvm2.inc
> -
> -SRC_URI[md5sum] = "c660e02ad4586a1d297b6befbe85556d"
> -SRC_URI[sha256sum] =
> "93878a4ba4f70d9f2d0d919eb85bc51652a58776b5428ec8e7e32769d332f596"
> --
> git-series 0.9.1
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

