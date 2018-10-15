Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id D59F660402
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 18:14:28 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id q12-v6so12409692qkl.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 11:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nAcv9n5zgcj5cEU4S9X2mznvWVNE2Tz47MNm5TMvsBw=;
	b=tSr8sHYt5L6K4bOf0KYMb2fuRJdwHc74BGCtDl28xPAn0GU0ves8xT9cm2nYyi/oTG
	qUn5DwSHP/JZcbiiQiDCU1Pvo8v2suJ6GJoZpKQa3lPAAptWkuPe5RMiTGu5Xg2b320/
	yr0BU8TwLR+SGctHWFf+JIVydcQyT3kUvdivX4VujEYZOCMv/af6nhkEVj/MMebOMBjB
	aSFxdPvhPL5CCb47D6tlblAoAoC6W1bXWDdZGlQ6Mu8tfqlzpIl92KxgteMm2DqU4tYB
	uHSvgekOlvdfmrKhYg+NKeVxGdzOwbhlU5IHE7fzMHsVyuYdeksfAMKJJjGenONAupq0
	5i4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nAcv9n5zgcj5cEU4S9X2mznvWVNE2Tz47MNm5TMvsBw=;
	b=WN0/4osz3wpf1ehmU+5bhuRlpcSf4uegsnUGs2K5WvjAZVu1FNg9QEkVvC2KrKclta
	oPJqfeIXL54I90ooGY0rePoAUby4ZOyLfVYZ5yS/kLp9dkYFDf5hK+NSKXolgrRPJ0/N
	K30Ie2SNV7wBQtnTRH2Q55YuUBWDzJwtiKcLbVXCU/vhEEt1PH671U2e7sDQoctSyitw
	1QpRUFSR9UBg0gcSi1TLrfVlknX8kkQJfiegtFsbgTOeVjbB7ktBtd0btqu3KIKd0ibd
	IEZbwEOJ8KuJVSwBlBQ84/cFVL+rB+JA3mtMbwAxXd6YjZVh2/sci8VHcun/tTSMpSrq
	QPyg==
X-Gm-Message-State: ABuFfogK5CiW8weoAUcAm9qsM2vprkOx8TmoBTrt80MT1Kttaug53Id0
	QLb1K5vaONiuDlFW5GmJCD0uTf1GbZoU1iHLSgc=
X-Google-Smtp-Source: ACcGV61djiLA25ON+glK2oLR46j+ifZo8lnCsn8uhYo2AMVkmCRtemcynmO3ZwQZfw8w7EzGuMfp/5FPg1GOKmM9COc=
X-Received: by 2002:a37:9d55:: with SMTP id
	g82-v6mr17145937qke.315.1539627269564; 
	Mon, 15 Oct 2018 11:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20181015161229.68258-1-timothy.t.orling@linux.intel.com>
	<20181015161229.68258-2-timothy.t.orling@linux.intel.com>
In-Reply-To: <20181015161229.68258-2-timothy.t.orling@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Oct 2018 11:14:03 -0700
Message-ID: <CAMKF1spEiC8L5zunRFGXGPJf4v+UJG+gzoJrQJyiHh6T7mt4NA@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH 2/2] libnet-dns-perl: upgrade 1.17 -> 1.18; enable ptest
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
X-List-Received-Date: Mon, 15 Oct 2018 18:14:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 15, 2018 at 9:13 AM Tim Orling
<timothy.t.orling@linux.intel.com> wrote:
>
> * Add UPSTREAM_CHECK_REGEX to ignore DEV releases
> * Add RDEPENDS that were missing
> * Enable ptest and add RDEPENDS for tests
> * Add RRECOMMENDS for libnet-dns-sec-perl
>
> * Upstream release notes:
> """
> **** 1.18 Sep 21, 2018
>
>         Documentation revised to remove ambigous use of "answer" which
>         has been used to refer to both the answer section of a packet
>         and the entire reply packet received from a nameserver.
>
> Fix rt.cpan.org #127018
>
>         Net::DNS::ZoneFile->parse() fails if include directory specified.
>
> Fix rt.cpan.org #127012
>
>         DNS resolution broken when options ndots used in /etc/resolv.conf
> """
>
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  .../recipes-perl/libnet/libnet-dns-perl_1.17.bb    | 27 ----------
>  .../recipes-perl/libnet/libnet-dns-perl_1.18.bb    | 58 ++++++++++++++++++++++
>  2 files changed, 58 insertions(+), 27 deletions(-)
>  delete mode 100644 meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
>  create mode 100644 meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb
>
> diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
> deleted file mode 100644
> index 79583551f9..0000000000
> --- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -DESCRIPTION = "This package contains the DNS.pm module with friends."
> -HOMEPAGE = "http://www.net-dns.org/"
> -SECTION = "libs"
> -LICENSE = "MIT"
> -
> -LIC_FILES_CHKSUM = "file://README;beginline=252;endline=269;md5=27db37b42cd1a5173a53922d67072bcb"
> -
> -DEPENDS += "perl"
> -
> -SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "28fcbcbf4483a9f23f75be4b9e3e45c8"
> -SRC_URI[sha256sum] = "9a79fd8fea1a708726c18d193ae4437479206ccb20ffa7f0971371e172e2c2e0"
> -
> -S = "${WORKDIR}/Net-DNS-${PV}"
> -
> -EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
> -
> -inherit cpan
> -
> -RDEPENDS_${PN} = "perl-module-integer"
> -
> -do_compile() {
> -    export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"
> -    cpan_do_compile
> -}
> -BBCLASSEXTEND = "native"
> diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb
> new file mode 100644
> index 0000000000..0b22fdf7f6
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb
> @@ -0,0 +1,58 @@
> +DESCRIPTION = "This package contains the DNS.pm module with friends."
> +HOMEPAGE = "http://www.net-dns.org/"
> +SECTION = "libs"
> +LICENSE = "MIT"
> +
> +LIC_FILES_CHKSUM = "file://README;beginline=252;endline=269;md5=27db37b42cd1a5173a53922d67072bcb"
> +
> +DEPENDS += "perl"
> +
> +SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "67af7e5c1c339f60c45c1054374bd8ee"
> +SRC_URI[sha256sum] = "52ce1494fc9707fd5a60ed71db5cde727157b7f2363787d730d4d1bd9800a9d3"
> +
> +UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
> +
> +S = "${WORKDIR}/Net-DNS-${PV}"
> +
> +EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR} EXPATINCPATH=${STAGING_INCDIR}"
> +
> +inherit cpan ptest-perl
> +
> +RDEPENDS_${PN} = " \
> +    libdigest-hmac-perl \
> +    perl-module-base \
> +    perl-module-constant \
> +    perl-module-digest-md5 \
> +    perl-module-digest-sha \
> +    perl-module-file-spec \
> +    perl-module-integer \
> +    perl-module-io-file \
> +    perl-module-io-select \
> +    perl-module-io-socket \
> +    perl-module-io-socket-ip \
> +    perl-module-mime-base64 \
> +    perl-module-scalar-util \
> +    perl-module-test-more \
> +    perl-module-time-local \
> +"
> +
> +RRECOMMENDS_${PN} += " \
> +    libnet-dns-sec-perl \
> +"
> +
> +RDEPENDS_${PN}-ptest += " \
> +    perl-module-encode \
> +    perl-module-encode-byte \
> +    perl-module-extutils-mm \
> +    perl-module-extutils-mm-unix \
> +    perl-module-overload \
> +"
> +
> +do_compile() {
> +    export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"

this could be better controlled with TCLIBC bitbake variable. Secondly does it
have to know exact version of libc ? the regexp seems to be doing
that. Can we just use libc.so.6 for glibc and libc.so for musl.

> +    cpan_do_compile
> +}
> +
> +BBCLASSEXTEND = "native"
> --
> 2.14.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

