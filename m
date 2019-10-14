Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
	[209.85.222.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1FBE57D278
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2019 10:14:43 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id y189so15385696qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2019 03:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/U/WvxuEYuSGTieVi6GIC+0Sa/iVCUg5sGnoFxSzk3E=;
	b=NI737Km0wMVnTtP8DSZJPFiJXx4ctRa3wqfbdy0sNohWcVZNZS5lz8qJAm70glpgk9
	/m/9ky1hsRZRIud/jQBOblIiOAf24n0j/FLCcqeAOPk7Pdz05T82j+C/6Qunzhd9GMvo
	o8EZJYMAEqdek7yG0vgTrObEleMbY71yFMPy0bBgc5ZB4mPc6N/VJYU8rRtM6FKcKfa9
	nemnBIapfbzuvNUEK13vYBS1FMlFGVdTGRkzujZi9XPnNnbhCDntiqmQw10AXTxdaQi3
	l8dqMXKbHzkM5xfLRTgvdHz+WIGUh7zUpA8r+3gx1GeYLI+9yElm+qduhFYTFp9sccKd
	vnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/U/WvxuEYuSGTieVi6GIC+0Sa/iVCUg5sGnoFxSzk3E=;
	b=cn6SLeq5hyQgLNkjqGZfJq/8QvTnGgbHRaSvKhAPugmNWrUgUvuEKgrfqPxguumK6J
	1l4YoDinK4LPtwSA0XZIGRS8oK4d3CGEzHcmh88oBNxwVic1LlVPOXafMuCaGeIDhyaj
	RZV7w8nLr+0NFTjBZEM3aJKJF2QG/mFKH34DUwRLCfMeYBU3kmwM99P2noFiQ/H25aVk
	b6R2AftPs1OsJo4lgBmvJ/HUSLRYtwnjxtc+PG7+EaksIueUST8pf5ykFY9sogYyoBQB
	c8Slfn66hJr+ZDgjrPXKcH/7bxmdjYWSvwBxUPsPCuC0RO9FawLss94SpNHYvy/5mkQR
	1ojg==
X-Gm-Message-State: APjAAAWvBi954R5o+0YO3/4m7yjvAd5Y3c9PBPUst2USZjXniOTT95qS
	KjLiDDU43t5wBuli6us/3laiLUYyPy/zFUq/EvM=
X-Google-Smtp-Source: APXvYqyxhglNtTwxdcPTqmieRPtHOqwu1MYGD3MlvPy8KXrUVtzlIqP1WqwxaupSRFUZVODexINMcNn2xjJQRsARnnw=
X-Received: by 2002:a05:620a:222:: with SMTP id
	u2mr1364085qkm.474.1571048083536; 
	Mon, 14 Oct 2019 03:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191014020047.27691-1-dan.callaghan@opengear.com>
In-Reply-To: <20191014020047.27691-1-dan.callaghan@opengear.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Oct 2019 03:14:32 -0700
Message-ID: <CAMKF1sq=q=Ssmp69ze-9W2keDZ_nKa=7+6s=5zAOnmPRbg_pYw@mail.gmail.com>
To: Dan Callaghan <dan.callaghan@opengear.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] strongswan: add a PACKAGECONFIG for libbfd stack traces
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
X-List-Received-Date: Mon, 14 Oct 2019 10:14:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2019 at 3:01 AM Dan Callaghan <dan.callaghan@opengear.com>
wrote:

> Strongswan installs a signal handler for SIGSEGV, SIGILL, and SIGBUS
> which attempts to print a stack trace of the crash. For producing line
> numbers in the stack trace, it can use libbfd from binutils, or
> libunwind, or else it falls back to a slower method using
> /usr/bin/addr2line.
>
> Currently the addr2line method is unlikely to actually work, since there
> is no RDEPENDS to pull that command into the image.
>
> This patch turns on the libbfd-based stack traces by default, which
> should be a reasonable choice since binutils is already required for
> building everything. The setting is nevertheless behind a PACKAGECONFIG
> in case libbfd is not wanted in the final image.


Package config is fine but let=E2=80=99s not enable it by default


> ---
>  meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/strongswan/
> strongswan_5.8.1.bb b/meta-networking/recipes-support/strongswan/
> strongswan_5.8.1.bb
> index 5408eed27..c8a8d1dc0 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.1.bb
> @@ -24,10 +24,11 @@ EXTRA_OECONF =3D " \
>
>  EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> '--with-systemdsystemunitdir=3D${systemd_unitdir}/system/',
> '--without-systemdsystemunitdir', d)}"
>
> -PACKAGECONFIG ??=3D "charon curl gmp openssl stroke sqlite3 \
> +PACKAGECONFIG ??=3D "bfd charon curl gmp openssl stroke sqlite3 \
>          ${@bb.utils.filter('DISTRO_FEATURES', 'ldap', d)} \
>  "
>  PACKAGECONFIG[aesni] =3D
> "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
> +PACKAGECONFIG[bfd] =3D
> "--enable-bfd-backtraces,--disable-bfd-backtraces,binutils"
>  PACKAGECONFIG[charon] =3D "--enable-charon,--disable-charon,"
>  PACKAGECONFIG[curl] =3D
> "--enable-curl,--disable-curl,curl,${PN}-plugin-curl"
>  PACKAGECONFIG[gmp] =3D "--enable-gmp,--disable-gmp,gmp,${PN}-plugin-gmp"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

