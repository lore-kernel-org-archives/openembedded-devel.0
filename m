Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id AFB687792D;
	Sat, 11 Mar 2017 20:50:23 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n11so4148046wma.0;
	Sat, 11 Mar 2017 12:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nrytEljoRJW52T1sg++jMBxiW7g342KKyD0JfB/K3yc=;
	b=dYfeL1jiy9DAcypvbEQM2mJCvYglI2xLeeEzcsReYh8wCPng8O/dUsfz18nCNoW7m7
	kyrXr7DjtqXx7MzcnIV/86m/ebLsZNOoEPvOrJC9pwu15jdJkzTUEpk5Gny0NIZL/DQx
	AsdTSZgfb/h9rohto52JFLgJ7AMScKtCCkGmZ7bI9gz+AoG3K2RG5da1hJgFyNfo0byi
	zvFmDKZOPxXbhAoZf3Kov/vVR/yVbcPC9KvNMWUGKFJYQ5oYGVeA4UY/gSX98zGamtfX
	PUydy2t2ekyDF/1X8i7mJFCH9ocrGd0x0z42/7SmePnKGULvQ0jlD4FmFd+dabM6/Luu
	RiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nrytEljoRJW52T1sg++jMBxiW7g342KKyD0JfB/K3yc=;
	b=jHnC7YyaxXbr7npYThWzSFmwDgqFSAeQi3Iy1c9OUBFl1De5pvhMB6vZgXsxpSA9yc
	u1AtEkb0AFlGqPsfTWtnEG7jha9h6XxMcxahoLriQSfsXzvu7NEXuXB0st/3UUujkNB3
	MerdOqJOje+OD9IxHItg3tpMn3TiRlBh0D6ZQNGAEhdMCGqZpzP/ZHO8Bep4gNaj3DgD
	v6tpDHGSV9smVz+Ncdefh8zcMLLk2unCnsvWyIjgHouk0nU3nbJBGr5IVt6O4Ape7s/X
	7q/OQ0tZixBUQmpqdFjKL6wyRI5H87BylK7+I97Ho4GhcppOT/GAtprMWOPtjm/VV494
	4yFw==
X-Gm-Message-State: AFeK/H0bZRRIOw6amhJIXHbqPJeeZCDktY+mzUeMnsvaqW6Fa1T2u4kGh5M5ixOxani5N6IQ7LwZUIUIl37Gug==
X-Received: by 10.28.19.207 with SMTP id 198mr3877641wmt.49.1489265424238;
	Sat, 11 Mar 2017 12:50:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Sat, 11 Mar 2017 12:50:23 -0800 (PST)
In-Reply-To: <20170310101608.758BB236CDD@git.openembedded.org>
References: <148914096789.20795.18204054413475576323@git.openembedded.org>
	<20170310101608.758BB236CDD@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 11 Mar 2017 21:50:23 +0100
Message-ID: <CA+chaQc6r4y6uHFSvAO1FRtijABFpYuxdSd2vuneArywWnGKcw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	David Vincent <freesilicon@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 13/29: openssl: Fix symlink creation
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
X-List-Received-Date: Sat, 11 Mar 2017 20:50:24 -0000
Content-Type: text/plain; charset=UTF-8

Why not use update-alternatives for this file?

That's what I'm using in openssl bbappend because we also use different
provider for this file and it worked well .. until this change.

On Fri, Mar 10, 2017 at 11:16 AM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch master-next
> in repository openembedded-core.
>
> commit 991620f3962a9917fa99abb5582f4b72ebd42a3d
> Author: David Vincent <freesilicon@gmail.com>
> AuthorDate: Mon Jan 23 14:59:16 2017 +0100
>
>     openssl: Fix symlink creation
>
>     Symlinking the openssl configuration file at install time results in
>     errors when overriding it using an external package which also provides
>     openssl-conf. This should be done as a postinstall task for such
>     packages.
>
>     Signed-off-by: David Vincent <freesilicon@gmail.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-connectivity/openssl/openssl.inc | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc
> b/meta/recipes-connectivity/openssl/openssl.inc
> index 0b7991d..9afa5bd 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -201,7 +201,6 @@ do_install () {
>            ${D}${sysconfdir}/ssl/
>         ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl/certs
>         ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl/private
> -       ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl/openssl.cnf
>  }
>
>  do_install_ptest () {
> @@ -245,4 +244,16 @@ do_install_append_class-native() {
>             OPENSSL_ENGINES=${libdir}/ssl/engines
>  }
>
> +pkg_postinst_openssl-conf () {
> +#!/bin/sh
> +if [ -e $D${libdir}/ssl/openssl.cnf ]; then
> +       rm -f $D${libdir}/ssl/openssl.cnf
> +fi
> +
> +# If openssl-conf is installed before openssl, we must ensure that the
> symlink
> +# destination exists
> +mkdir -p $D${libdir}/ssl/
> +ln -s ${sysconfdir}/ssl/openssl.cnf $D${libdir}/ssl/openssl.cnf
> +}
> +
>  BBCLASSEXTEND = "native nativesdk"
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

