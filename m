Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 328AB77DB3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 15:59:31 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id g76so17003721wrd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 08:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Nae0RM+6cKgwW0wN52+FCrCo/iIOL/Q60cb1jmlYb6U=;
	b=afkg0TgwQjqmFs/usVXNjmWDEkHBFeJch5DpW/v492zm5qtEvu4X3nWnVy7hNqqxJR
	OKY36NxiTLlxZpHDb3Z28WihzRkZa+HsbvwXuL+ntowj1HJM6XXtVSUDIjXV6R5Ew9Bz
	87eGOC01LFe9YGYQobkUa4+VqfiwVUjeL2ojiNXpeO+Tyv+ryb8ArI6WSlMK7qpCeKCr
	3eHGJ6mq149044TuhQJN7cydLwF1xcyyr88/ebuEaRQYATYDvj1kOpKGoQNP7iVOONOH
	hNzF2OdmqGByRqjG/sD7s+CMQZoOUAytC+xqZNohqEKuXmjd+eBVvnmj9VvQV4TpsExi
	BXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Nae0RM+6cKgwW0wN52+FCrCo/iIOL/Q60cb1jmlYb6U=;
	b=nzgksRlTmigg9E1Yv5Ry4O2z+YE1odBqWTvVnR+YyTFT2WSpXPuSaPZqxGV/VcaSbw
	JXsTNwUkUrUhYRzGW6D8/PKu9YN3vEqCDqsm8kwLGwSrATEzC8WoFc6QHd6Nox0rr8g0
	hQ9FN+2Qxz1TkZvDLknjSloMDx18yUDiaZWZB/hPlllOU2ZLxicNNl4+2k3bfagPbJzX
	qYtF7/z87QHbMaeWmsHzDi3VGT5NFtomELeRVrxUoViJ4tn6fCvZrtlyVY9GU/gLxO1k
	U/FJ2u2idauWa4spgPkLw/Uz2mjx+7kJAitQcxR9rjFGj6hA/cwbF4NcD9Wd5r+eCABm
	60iA==
X-Gm-Message-State: AODbwcBIIhDV8TEFutaB70VCZ2/AakyNfJ9lq4SQTxEP5WiYmhtlH/hT
	0pywPcSjA+AtiRBN63di4L3f6YarQQVv
X-Received: by 10.80.131.6 with SMTP id 6mr6328311edh.178.1497196772907; Sun,
	11 Jun 2017 08:59:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Sun, 11 Jun 2017 08:59:02 -0700 (PDT)
In-Reply-To: <1497193576-3774-2-git-send-email-trini@konsulko.com>
References: <1497193576-3774-1-git-send-email-trini@konsulko.com>
	<1497193576-3774-2-git-send-email-trini@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jun 2017 08:59:02 -0700
Message-ID: <CAMKF1soYoKjRue_y6w=yjZRP5ByOkLcrtZ=RwBTfopammubT1w@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] debsums: New recipe
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
X-List-Received-Date: Sun, 11 Jun 2017 15:59:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 11, 2017 at 8:06 AM, Tom Rini <trini@konsulko.com> wrote:
> A tool for verification of installed package files against MD5 checksums
> debsums can verify the integrity of installed package files against MD5
> checksums installed by the package, or generated from a .deb archive.
>

order of directives seems a bit displaced, may be running
meta-openembedded/contrib/oe-stylize.py
will be good.

> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  meta-oe/recipes-support/debsums/debsums_2.2.2.bb | 53 ++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 meta-oe/recipes-support/debsums/debsums_2.2.2.bb
>
> diff --git a/meta-oe/recipes-support/debsums/debsums_2.2.2.bb b/meta-oe/recipes-support/debsums/debsums_2.2.2.bb
> new file mode 100644
> index 000000000000..9713ae22784e
> --- /dev/null
> +++ b/meta-oe/recipes-support/debsums/debsums_2.2.2.bb
> @@ -0,0 +1,53 @@
> +SUMMARY = "Miscellaneous utilities specific to Debian"
> +DESCRIPTION = "A tool for verification of installed package files against \
> +MD5 checksums debsums can verify the integrity of installed package files \
> +against MD5 checksums installed by the package, or generated from a .deb \
> +archive."
> +
> +SECTION = "base"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://debian/copyright;md5=770d751553e6559e9eaefd2e11ccf7e9"
> +
> +SUMMARY_${PN}-cron = "Cron scripts to control automatic prelinking"
> +DESCRIPTION_${PN}-cron = "Cron scripts to control automatic checking."
> +FILES_${PN}-cron = "${sysconfdir}/cron.*"
> +
> +PACKAGES =+ "${PN}-cron"
> +
> +SRC_URI = "http://snapshot.debian.org/archive/debian/20170530T212108Z/pool/main/d/debsums/debsums_2.2.2.tar.xz"
> +# the package is taken from snapshots.debian.org; that source is static and goes stale
> +# so we check the latest upstream from a directory that does get updated
> +UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
> +
> +SRC_URI[md5sum] = "82b0710855a7e5212d4358163a269e79"
> +SRC_URI[sha256sum] = "aa61896f93a6bbfe0161c21dcd67529ae8e1ec8c3ccf244523c52c4ad8253d97"
> +
> +RDEPENDS_${PN} = "dpkg dpkg-perl libfile-fnmatch-perl perl \
> +                  perl-module-constant perl-module-digest-md5 \
> +                  perl-module-errno perl-module-fcntl \
> +                  perl-module-file-basename perl-module-file-copy \
> +                  perl-module-file-find perl-module-file-glob \
> +                  perl-module-file-path perl-module-file-spec \
> +                  perl-module-file-temp perl-module-getopt-long \
> +                  perl-module-posix"
> +
> +do_install() {
> +       install -d ${D}/${sysconfdir}/cron.daily ${D}/${sysconfdir}/cron.weekly
> +       install -d ${D}/${sysconfdir}/cron.monthly ${D}${sbindir} ${D}${bindir}
> +       install -d ${D}${mandir}/man1 ${D}${mandir}/man8
> +       install -m 0755 debsums ${D}${bindir}/
> +       install -m 0755 rdebsums ${D}${bindir}/
> +       install -m 0755 debsums_init ${D}${sbindir}
> +       install -m 0644 man/debsums.1 ${D}${mandir}/man1/
> +       install -m 0644 man/rdebsums.1 ${D}${mandir}/man1/
> +       install -m 0644 man/debsums_init.8 ${D}${mandir}/man8/
> +       install -m 0644 debian/cron.daily \
> +               ${D}/${sysconfdir}/cron.daily/debsums
> +       install -m 0644 debian/cron.weekly \
> +               ${D}/${sysconfdir}/cron.weekly/debsums
> +       install -m 0644 debian/cron.monthly \
> +               ${D}/${sysconfdir}/cron.monthly/debsums
> +
> +       # Must exist, defaults to empty.
> +       touch ${D}/${sysconfdir}/debsums-ignore
> +}
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

