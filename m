Return-Path: <raj.khem@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id D3CD16C639
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 17:46:06 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id x23so16650737oix.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 09:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dkWQB6wmmpIHaglxnIq+kqmXQ2NcwbqViOhuycEEUI0=;
	b=eZWwDqtr6cMJWzSaBtvaolDJgcWSrjZLaU33D47Vi72HgI/qaawrByvjt3K9BdysGx
	ASg2PqzjoEZKLZTGV2GK92vnZy8i46kBf8ORoglfSBdpRVFshF5nc5QI/tzUxavmNx8t
	Da+FqtcOAHaV0sptA60pxuJd/PzGvHe+3qHt+1ni0uJ0QPi4QOeqDie8fw3iK1lPMZbI
	7su2v5/iK3lSuKy7YNPL32I4hVmAsld9/NW4Yc20fWFPxxEdiy2uHDHmIr2WmhBlQRAy
	5VkyezN4Sy2GGEjp32dByissNKbKTQd6xbr4HT4t94JwzILY4TRDzCRqDXWymaH1gboq
	guVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dkWQB6wmmpIHaglxnIq+kqmXQ2NcwbqViOhuycEEUI0=;
	b=YRMUGbKBTM9UfhXuquOIjy0er2X7LOZrSfcOaqVE2uGvSnZDHUYpnndEGZunPf1fiC
	P6mUuK90zSgzjE3i/5h4Qp7MXbgmS1LdbQ1OfHyFLnLju1CsjxU6Jp4kLEHalgt4xt0A
	j7FtuUGChXcJ21Tw8gZH04lTK+vqUHgpwainNuBzbczm5VZYNcAsHF90a5tWEWKjy6JB
	n/wFMwLTCPhBKuz3E0EjodddvGtyln0N66uhWY8aojuwXs2tNt3YbO001kUEE1yi862l
	iPpsWFXwBHKon6bxYMoERkrTiIfMZjob0rwh1yTbndJIbwFN6bfmrgBwHSmTZelRY2Hs
	juNw==
X-Gm-Message-State: AA+aEWaMpkvX8q6lVzqhxOGP/MspsDo96w0joJDbTFIwRuM76BpXoyqs
	r5H5g3/miaxxySvi1bcAqyB992XybyJyEXuJDyU=
X-Google-Smtp-Source: AFSGD/X6fzE3kAEqEPsZR6ioEFQJ3OIMq1NBr2GFR84kCvknzCoX35gJ3oLzODT3vknRm7WR8PgGuSo8pNkfrKZLptk=
X-Received: by 2002:aca:e7c9:: with SMTP id e192mr3840040oih.155.1543254367697;
	Mon, 26 Nov 2018 09:46:07 -0800 (PST)
MIME-Version: 1.0
References: <20181120154041.9420-1-raphael.kubo.da.costa@intel.com>
In-Reply-To: <20181120154041.9420-1-raphael.kubo.da.costa@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Nov 2018 09:45:41 -0800
Message-ID: <CAMKF1soR+4fXBd1q0bLCndQjROO-zTnvcQSs80TmDP=KKZcMuQ@mail.gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][sumo][PATCH] nodejs: Enable system ICU support
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
X-List-Received-Date: Mon, 26 Nov 2018 17:46:08 -0000
Content-Type: text/plain; charset="UTF-8"

Armin

This is ok for rocko
On Tue, Nov 20, 2018 at 7:40 AM Raphael Kubo da Costa
<raphael.kubo.da.costa@intel.com> wrote:
>
> From: Khem Raj <raj.khem@gmail.com>
>
> Latest Chromium needs it during build
>
> (cherry picked from commit d7d0cc5227d0dc7d3ff91ded9da841d65c3f3632)
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
> ---
>  meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
> index 8930cd902..132ee0f2b 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.9.4.bb
> @@ -3,7 +3,9 @@ HOMEPAGE = "http://nodejs.org"
>  LICENSE = "MIT & BSD & Artistic-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=270f7477a1705f7cd3e29d3d4512915d"
>
> -DEPENDS = "openssl10 zlib"
> +DEPENDS = "openssl10 zlib icu"
> +
> +inherit pkgconfig
>
>  COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
>  COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
> @@ -44,7 +46,7 @@ do_configure () {
>      export LD="${CXX}"
>      GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
>      # $TARGET_ARCH settings don't match --dest-cpu settings
> -   ./configure --prefix=${prefix} --without-intl --without-snapshot --shared-openssl --shared-zlib \
> +   ./configure --prefix=${prefix} --with-intl=system-icu --without-snapshot --shared-openssl --shared-zlib \
>                 --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
>                 --dest-os=linux \
>                 ${ARCHFLAGS}
> --
> 2.19.1
>

