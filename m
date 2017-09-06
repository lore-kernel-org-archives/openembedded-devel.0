Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id BBC5F72F96
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 10:22:58 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id v203so10305643vkv.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 03:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qoh7yGFgzemcBiUBohyNL/DBQPnorYHhaO8ybxmQNKY=;
	b=nY+7+OSIAn1efsaO0dscCc2KqUfOb6aHyoV/inXxo3SAihQ9Rt6GO5RToBGtJgNozg
	kozZmQVVk478NVGEHYw1CiqHmTQdqlI1iO76hmShzDKoOKUozyEfjazENve1tLAVmVp9
	+IM6hbpVu9IUzYM5ku4eN9jQeqfBtkDCsYUAGMDpm/0uhKmroQbqHptAHj3o1Eb4T6lc
	FsyorFw2GwzLuMSXtIfMsLBBLqHjlePDzPV4hgI4Y0MQpN3p1uq70RnVI6hpvTqTwey6
	HSBUuARKozhySOrfnndZZlVs0/4T5SrE+DvG/UfpsxPN+G57mielt8RT+/ve7eRVaEsl
	UsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qoh7yGFgzemcBiUBohyNL/DBQPnorYHhaO8ybxmQNKY=;
	b=Eh/D3EPOB5D3C5YzoHAhdF/PUXKx9YQgB6fb1wR2zbIiL4vMeor6o+DpQnHAYgLkzC
	uaIfFPnGxEzejergCGhQLntRpsMdXJVfes6O2YhXYDjOZS3e5QroBDWdVqp21pcYbqb5
	eEzYhEeFkkUeJv2CL0qwSaBNZGI6M6FniqRAIwRpJWIH3ydQiKO+F/pvftuE4S9X7Hq/
	82WVNdbhj9diI5NFMTEu96ihWzm3PL6mmjLuaWFQ5dsytG+TbCD+FgOoEwSvkSQ6kCJI
	5BY/ouapgZed1AHBdHf2mpmFtLUP6+pWtQ2kMdOIfgk+Tojq8oVEB22mDW8vl5jgQv+t
	bQhQ==
X-Gm-Message-State: AHPjjUgP+Zo2Kbu1qjhGn8V4Iumwae8oPhgE2KoRxoQ6/+r0AOxXy7h9
	ar6/xGpvfeoJF/RDXUvvQmASLlTyZw==
X-Google-Smtp-Source: ADKCNb6Mt1IRgthz05VPJitvdAuQha5wN1HoyWGrA+dogHll6d/UIHxvjU7TmqjcO2eRs7JIzkGJMZrCg805VIJ3czE=
X-Received: by 10.31.224.134 with SMTP id x128mr1047375vkg.1.1504693379793;
	Wed, 06 Sep 2017 03:22:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Wed, 6 Sep 2017 03:22:59 -0700 (PDT)
In-Reply-To: <1504668347-20700-1-git-send-email-ankit.tarot@gmail.com>
References: <1504668347-20700-1-git-send-email-ankit.tarot@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 6 Sep 2017 12:22:59 +0200
Message-ID: <CA+chaQearBerif8gfANPs3PpXpSXHvfyAKFidm6iva0d-B_0nw@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] ell: upgrade SRCREV and move recipes to core
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
X-List-Received-Date: Wed, 06 Sep 2017 10:22:58 -0000
Content-Type: text/plain; charset="UTF-8"

Why did you add ell.inc? We're usually moving in the other direction
folding .inc into .bb and maintaining only one version of given component.

Also the tag in the subject should be [meta-oe] not [oe]

On Wed, Sep 6, 2017 at 5:25 AM, Ankit Navik <ankit.tarot@gmail.com> wrote:

>  7b7c15c build: Include check for xxd binary when in maintainer-mode
>
> Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> ---
>  meta-oe/recipes-connectivity/ell/ell_git.bb | 17 -----------------
>  meta-oe/recipes-core/ell/ell.inc            | 13 +++++++++++++
>  meta-oe/recipes-core/ell/ell_git.bb         |  5 +++++
>  3 files changed, 18 insertions(+), 17 deletions(-)
>  delete mode 100644 meta-oe/recipes-connectivity/ell/ell_git.bb
>  create mode 100644 meta-oe/recipes-core/ell/ell.inc
>  create mode 100644 meta-oe/recipes-core/ell/ell_git.bb
>
> diff --git a/meta-oe/recipes-connectivity/ell/ell_git.bb
> b/meta-oe/recipes-connectivity/ell/ell_git.bb
> deleted file mode 100644
> index d259f52..0000000
> --- a/meta-oe/recipes-connectivity/ell/ell_git.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY  = "Embedded Linux Library"
> -DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
> -LICENSE  = "LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
> -SECTION = "libs"
> -
> -inherit autotools pkgconfig
> -
> -S = "${WORKDIR}/git"
> -SRCREV = "399099946abaeb2f3718a0667cc11436a7c0be14"
> -SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
> -
> -do_configure_prepend () {
> -    mkdir ${S}/build-aux
> -}
> -
> -DEPENDS = "dbus"
> diff --git a/meta-oe/recipes-core/ell/ell.inc b/meta-oe/recipes-core/ell/
> ell.inc
> new file mode 100644
> index 0000000..7bed240
> --- /dev/null
> +++ b/meta-oe/recipes-core/ell/ell.inc
> @@ -0,0 +1,13 @@
> +SUMMARY  = "Embedded Linux Library"
> +DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
> +LICENSE  = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
> +SECTION = "libs"
> +
> +inherit autotools pkgconfig
> +
> +do_configure_prepend () {
> +    mkdir ${S}/build-aux
> +}
> +
> +DEPENDS = "dbus"
> diff --git a/meta-oe/recipes-core/ell/ell_git.bb
> b/meta-oe/recipes-core/ell/ell_git.bb
> new file mode 100644
> index 0000000..0589809
> --- /dev/null
> +++ b/meta-oe/recipes-core/ell/ell_git.bb
> @@ -0,0 +1,5 @@
> +require ell.inc
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "7b7c15c2e5caff88fc45e7a8b874a47196a0eddd"
> +SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

