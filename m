Return-Path: <ticotimo@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1E53171E4C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 06:13:52 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id o196so4948481vka.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 23:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7b71EIf0hZ2gu3Tq0BGNXWP9Y2wkmaaC06+aNp4bx3A=;
	b=dtPfwYdh6M0tj6C3l5O8nbr7a5GSWgSn7NKA1k05kdBhLocBeFmNr9zTmfKc8EPruo
	BSZGUqKDmOIbxDa7bnf4lxYfO/LiBrGjXicadD8fn/UmKSli4n2Hj9MhTYc9CLxE99rW
	UcNantt7LMSsrg7YSYJTZ2k/6GT4HrQ6IhySRvrmr5Tm8XWwlXzI8rfeGneA81MjZ6zH
	P53VoxVl55HJYiES/U4N+N6EW7AJL9cN0CV9o1bCc4EK2nsKZvKzqZYGA3Hs6yvYHS6i
	tw8lpDgRVhGBQfpeXVEawuDhNfM9BGCWfFxkpEJJJwHrrj7meBZmDqMTfuLYrgiw2LRq
	CBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7b71EIf0hZ2gu3Tq0BGNXWP9Y2wkmaaC06+aNp4bx3A=;
	b=rkyL36gdE1L6ndtE2reigBYSJgztDVjNfuw88d1gGdhWBbKDyciNRbk2E6wfzuioFa
	B7g9y5zWwexk3XpCuaJYjZyN2Ih5zpYyMOuwMwygBHY6Zhs8DfPJAAYl+ypvcvbfbxBg
	fqm4z45r8RUAS5I/lsuWVEnBHezKisg2Ve5PFoZc2qyEoNYqqERCFVNUfsLCRxQ1jcbJ
	qD+iq9kC05v8JD/rxcX8guC2RLTBcpfjCu6yEmXoFokc7hZrUUh4Iv/HTrwQQ/05FDcx
	C03NbjKAmkbgSvmBJa/fMkScYqD8LTOtLawJAQi7V3NPZ4e4xODDgYI0cyCuo/Z2Blfc
	9cEw==
X-Gm-Message-State: ABuFfojdRYhHwYOU+i6+Ee5SE98/aPHD+EhMuHFU8LBj6W65HKA2ko88
	OHjV+JlAEnennWkXx7lTuFwJZf3o0Nxr7WjRyEj74A==
X-Google-Smtp-Source: ACcGV606xvetmrgVENKrDruIT1M9AF3hYjb9pQLlEsvySY15zg5ja3xmSXWML99MqJExrGI3E5ptXYrQ9Y5eOLEnnaI=
X-Received: by 2002:a1f:9411:: with SMTP id w17mr1868126vkd.2.1539756832863;
	Tue, 16 Oct 2018 23:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20181017061141.72274-1-timothy.t.orling@linux.intel.com>
	<20181017061141.72274-2-timothy.t.orling@linux.intel.com>
In-Reply-To: <20181017061141.72274-2-timothy.t.orling@linux.intel.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 16 Oct 2018 23:13:41 -0700
Message-ID: <CANx9H-CNu8NwG4+m3dNCShcYOX7LBnXg4TOD9EKL04RXb4NGMw@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH v2 2/2] libnet-dns-perl: upgrade 1.17 -> 1.18; enable ptest
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
X-List-Received-Date: Wed, 17 Oct 2018 06:13:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 16, 2018 at 11:12 PM Tim Orling <
timothy.t.orling@linux.intel.com> wrote:

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
>
> ---
>
> Changes in v2:
>   Use TCLIBC to determine if we are using glibc or musl
>   and then set os.environ['LIBC'] to statically export path to libc.so
>

Tested on qemux86 and qemux86-musl


> ---
>  .../recipes-perl/libnet/libnet-dns-perl_1.17.bb    | 27 ---------
>  .../recipes-perl/libnet/libnet-dns-perl_1.18.bb    | 66
> ++++++++++++++++++++++
>  2 files changed, 66 insertions(+), 27 deletions(-)
>  delete mode 100644 meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
>  create mode 100644 meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb
>
> diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
> b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
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
> -LIC_FILES_CHKSUM =
> "file://README;beginline=252;endline=269;md5=27db37b42cd1a5173a53922d67072bcb"
> -
> -DEPENDS += "perl"
> -
> -SRC_URI = "
> http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz
> "
> -
> -SRC_URI[md5sum] = "28fcbcbf4483a9f23f75be4b9e3e45c8"
> -SRC_URI[sha256sum] =
> "9a79fd8fea1a708726c18d193ae4437479206ccb20ffa7f0971371e172e2c2e0"
> -
> -S = "${WORKDIR}/Net-DNS-${PV}"
> -
> -EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR}
> EXPATINCPATH=${STAGING_INCDIR}"
> -
> -inherit cpan
> -
> -RDEPENDS_${PN} = "perl-module-integer"
> -
> -do_compile() {
> -    export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name
> 'libc-*.so')"
> -    cpan_do_compile
> -}
> -BBCLASSEXTEND = "native"
> diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb
> b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb
> new file mode 100644
> index 0000000000..4e0c9c446b
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb
> @@ -0,0 +1,66 @@
> +DESCRIPTION = "This package contains the DNS.pm module with friends."
> +HOMEPAGE = "http://www.net-dns.org/"
> +SECTION = "libs"
> +LICENSE = "MIT"
> +
> +LIC_FILES_CHKSUM =
> "file://README;beginline=252;endline=269;md5=27db37b42cd1a5173a53922d67072bcb"
> +
> +DEPENDS += "perl"
> +
> +SRC_URI = "
> http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz
> "
> +
> +SRC_URI[md5sum] = "67af7e5c1c339f60c45c1054374bd8ee"
> +SRC_URI[sha256sum] =
> "52ce1494fc9707fd5a60ed71db5cde727157b7f2363787d730d4d1bd9800a9d3"
> +
> +UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
> +
> +S = "${WORKDIR}/Net-DNS-${PV}"
> +
> +EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR}
> EXPATINCPATH=${STAGING_INCDIR}"
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
> +python __anonymous () {
> +    # rather than use "find" to determine libc-*.so,
> +    # statically export the known paths for glibc and musl
> +    import os
> +    if d.getVar('TCLIBC') == "glibc":
> +        os.environ["LIBC"] = "${STAGING_BASELIBDIR}/libc.so.6"
> +    elif d.getVar('TCLIBC') == "musl":
> +        os.environ["LIBC"] = "${STAGING_LIBDIR}/libc.so"
> +    else:
> +       raise bb.parse.SkipRecipe("incompatible with %s C library" %
> +                                   d.getVar('TCLIBC'))
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
>

