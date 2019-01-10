Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id EEE317BD8A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 06:45:50 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id h32so4000658ywk.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jan 2019 22:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bEqtw9a13lSnj3mALU/Y6GXdqVWk+1WS69tH5gKUbak=;
	b=Qinb3AKI1pWcddagbhk/npkHdAzUl1nI5y/5nzmy4hC9f69w78zW8xhtllHg5TIiEc
	B99GSFYNPZEyl9A2x+7uStHT8FczFHr+tEbWYrMl6VpKrfOs1dBrUQ3EyqxravczCJWP
	K54qGkDbJOwJn1Fvj+wOLyLKDSOi6wmxKTFVT5fQv6oGh6VlVEpV/DTU73L6WpVSes8E
	LS3zzLlMihPgkWjbIQBIRkD2ifvpjrHmjxDDsT+aV0nx5Ptx9wXqqjdZHObA14THiBLC
	vCr+SbrG1DBdSyHj1HaJ6uZ3kVqRFCilsHOXxVachJjooE7t8cTmPAnu8GYktJE8NElF
	p+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bEqtw9a13lSnj3mALU/Y6GXdqVWk+1WS69tH5gKUbak=;
	b=mAL4JqQsVNmUoDHnA6ym0MlIQOAv0SCXHEk0rRial4KPqZzbHRzEUwj3soFEOVpQqY
	dWXsaQg2mWk+gAV/nwyanY81TPF8PoWjmsebGyaMmS7lFNUmuceflXhPY7LrI8zkRSA3
	EA4QUJklja8F3or1j+FE7TDvMLxB+wMCR1HOLWssXDovSED4JJyR1eexbYLlCeBzacE/
	n1iiE8r56QUjQaF5mQQ8cAPjVA4pulm0K0OKm34Ah/WpV5e+Wwxc1mpMttNnvT89K5/W
	6u0JaPDUvfFMzG54xqce5Y3nc2/ZQJAyB0TAti3YaXxoF8VyOYj2IC8WZ4NoSKwxCNQn
	srDw==
X-Gm-Message-State: AJcUukdJtEAfPC4q97sFQ/7NlBFCUe63jNivvCDzmi4S04IEaoEnp1Jd
	vRFCnWvOHZ51ePTD5UQUkFPilvSApahgdakBB04=
X-Google-Smtp-Source: ALg8bN6iKtwY8NDSVLCEnwRmteKhcRp8esHI6ESoOhF2yDwH7k+oNTeYkjFqikJaEUjfmMORCIDs/hMVJBdR5nAsFh8=
X-Received: by 2002:a81:202:: with SMTP id 2mr8788461ywc.291.1547102751810;
	Wed, 09 Jan 2019 22:45:51 -0800 (PST)
MIME-Version: 1.0
References: <20190110053633.40604-1-yongxin.liu@windriver.com>
In-Reply-To: <20190110053633.40604-1-yongxin.liu@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 10 Jan 2019 07:45:39 +0100
Message-ID: <CALbNGRQoS517_VZR081ZYTJOj=hzxJeMuNw2tBo0WqOBcUbTgg@mail.gmail.com>
To: Yongxin Liu <yongxin.liu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2] pmdk: fix install error
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
X-List-Received-Date: Thu, 10 Jan 2019 06:45:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 10, 2019 at 6:40 AM Yongxin Liu <yongxin.liu@windriver.com> wrote:
>
> Install files to /usr instead of /usr/local by replacing
> PREFIX=${prefix} with prefix=${prefix}.
> Remove unnecessary files which are only for debugging.
> Set FILES to package /usr/etc/bash_completion.d/pmempool.
>
> Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> ---
>  meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> index 3da22a970..8c3ead2ef 100644
> --- a/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> +++ b/meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb
> @@ -34,25 +34,13 @@ EXTRA_OEMAKE = "HOST_SYS='${HOST_SYS}' EXTRA_CFLAGS='${SELECTED_OPTIMIZATION}'"
>  # Fix the missing fts libs when using musl
>  EXTRA_OEMAKE_append_libc-musl = " EXTRA_LIBS='-lfts'"
>
> -do_install() {
> -       oe_runmake PREFIX=${prefix} DESTDIR=${D} install
> -
> -       # Copy these into the standard directories
> -       install -d ${D}${bindir}/
> -       mv ${D}/usr/local/bin/pmempool ${D}${bindir}/
> -       mv ${D}/usr/local/bin/daxio ${D}${bindir}/
> -
> -       install -d ${D}${libdir}
> -       mv ${D}/usr/local/lib/*so* ${D}${libdir}/
> +FILES_${PN} = "/usr/etc"
^ This looks wrong: Seems config path is prefixed too
>
> -       install -d ${D}${libdir}/pkgconfig
> -       mv ${D}/usr/local/lib/pkgconfig/*.pc ${D}${libdir}/pkgconfig/
> -
> -       install -d ${D}${includedir}
> -       mv ${D}/usr/local/include/* ${D}${includedir}/
> +do_install() {
> +       oe_runmake prefix=${prefix} DESTDIR=${D} install
>
>         # Remove uneeded files
> -       rm -rf ${D}/usr/local/
> +       rm -rf ${D}/usr/lib64/pmdk_debug
>  }
>
>  # Include these by default otherwise the SDK is not very useful
> --
> 2.14.4
Andreas

