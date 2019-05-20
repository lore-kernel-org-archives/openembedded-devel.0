Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id D41977E092
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 16:48:36 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id o7so17114340qtp.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 09:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eONxNRMRFzCJfHIxYomRolPgnDhZ/39xpiDWpATiFU8=;
	b=j14GZuiJTZwVWOT6Z3xPEfIg2CHpllPrsWX0xDX/npGecDoB3LJ4KdmsV+b5zUA6Uk
	EG6GCxC/xG5/z9ZdcN2y4H/7X3qvFV/MhTJbljtN6yeelXqVdKP9+HttN97ph79lKXmZ
	vBQkxoYqDuUk4J1E9uNoniALWPM4hbMt4Gt/T0Jj4t3ZsD0ZDKsybSY9f5ai843VVJV7
	AQtEwI7MRbm/vHiFFPJ9DcoHdwKIthd14xJ7Cta2GVSuS2A6F0UfM1rNKC/X4DafwvGY
	OnFlxqDF6uGyo0yoLFSk0OwKKHoVWwCFW6MMw4QvQ02wrvGBEjJRf8IfEYUZvVdrsvus
	DaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eONxNRMRFzCJfHIxYomRolPgnDhZ/39xpiDWpATiFU8=;
	b=qp+7fCfuPf6jp/LbaMN1TB8SVkt9mINGDldmry00SOCyEH8YAoyGn1C30GEoePCTDE
	f4alv62Xj4fY5kK9hiH8+SqhqiIonY8nM8Sh1hUnkoCqCVWtcVlgrjFuJ7M3of1BosUX
	ykvtJMTKR77EQyZL0y+gaMcdFohdkWFNd9ZBMG1d1EusNbrbhSYrBX67GsNA4Rxnum26
	mSgr8ERpqr0C020cpsJJeNbWiH4E1WMnkztp4aHNK5TxhklIPyH2uj3mvszBL9AWzfoG
	oyWZeEquN7GwjIRfIVzAlKb33r8v0aPWSynXB0bWRPXHJpOMAHrOUIiCC92AkELF/sSP
	oxGg==
X-Gm-Message-State: APjAAAWW6H9gw9p21hr55FJ5uYp/SJSL656vDB3WozUpUoUCJgGCmznh
	ALe9vPuYFuFKIFAMl7+KclYX9PxHOCzTeBJ6g5U=
X-Google-Smtp-Source: APXvYqzeNPOC0CceRzaS614iCKVKK0le4Yy54v+nBpoG+QeknVfJfEG+T++GA/dMbIiWlbjyPSmBx6VDTdyjtIO4Y2c=
X-Received: by 2002:aed:3b0a:: with SMTP id p10mr42046619qte.194.1558370917544;
	Mon, 20 May 2019 09:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190517094336.26232-1-ankit.tarot@gmail.com>
	<20190517094336.26232-2-ankit.tarot@gmail.com>
In-Reply-To: <20190517094336.26232-2-ankit.tarot@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 May 2019 09:48:11 -0700
Message-ID: <CAMKF1sq-X3q0XW4ki+mfUfAR+zVFBJ9WeEdSF2M1pD4JyguWCg@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] safec: Initial recipe for safe C library
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
X-List-Received-Date: Mon, 20 May 2019 16:48:38 -0000
Content-Type: text/plain; charset="UTF-8"

This fails to build for mips target see

https://errors.yoctoproject.org/Errors/Details/241270/

On Fri, May 17, 2019 at 2:44 AM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> Add generic recipe for safe C library.
> This library implements the secure C11 Annex K functions on top of most libc
> implementations, which are missing from them.
>
> Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> ---
>  meta-oe/recipes-core/safec/safec_3.4.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta-oe/recipes-core/safec/safec_3.4.bb
>
> diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb b/meta-oe/recipes-core/safec/safec_3.4.bb
> new file mode 100644
> index 000000000..2048fd418
> --- /dev/null
> +++ b/meta-oe/recipes-core/safec/safec_3.4.bb
> @@ -0,0 +1,13 @@
> +SUMMARY  = "Safe C Library"
> +
> +LICENSE  = "safec"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6d0eb7dfc57806a006fcbc4e389cf164"
> +SECTION = "lib"
> +
> +inherit autotools pkgconfig
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
> +SRC_URI = "git://github.com/rurban/safeclib.git"
> +
> +RDEPENDS_${PN} = "perl"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

