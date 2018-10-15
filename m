Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6E5C660402
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 18:08:49 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id q12-v6so12397438qkl.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 11:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TITmgkBNVYPG/VlhW12Nw1JGuELIVw+XlS9C0hNaOXs=;
	b=X1NgWFKsD0yaY+7YQb3i53JRyZGitejTEbFiDH2IB95PtgLrVTbFI22LjM1aF3iiP6
	ddzbxpLxZp4STARoBWP3E2ZDjbJCRKC3/lhTNRenvRdn1fmEgwW7xLRGCxG7K5U0lGXB
	L1RA0jlPhx/eiTk2bnfPsYOsC0Z2LxMiWcd+nua4L8Pl1Y9qZNWq+1jGFh5DQCK5tZUe
	EIJPvcwNlXzS9S2bR6miMZzn6uC8Uv/uDvBssBRybCxEcIJlsuwzQVFNRH9Hw6T1zfA9
	tBxj3ZIe4pPZq4uX/Bb1bO5V+3hrTy9CdXi59Z9wSdPSoj9D+zmkd5ySlrQ8632iJi7u
	WrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TITmgkBNVYPG/VlhW12Nw1JGuELIVw+XlS9C0hNaOXs=;
	b=QKz89TU1B9d1lsfkjooNNeFhVIGwuhK9OokOIagc/QSqe6+k4FMWjqCfYHp2ddxAjn
	sk+fSJHCX+Spy45hHxevSChCHf8L1P60y5xR2DobQCT38UZQZ4rHTE830vUNwZgVdJuN
	L5CxiRHugpp2SlhxBc4WXXoxklBpE/SCZGM8fk4mqEtMIgR11zKaKe1ozNXIUraKcZrs
	vhzIOKMSA7ped06YniKq4ZuIZd1DxgGYtmwyppJ7jycxRe20yQ2QXuKPFWGjysFxw7mg
	ohTnEZf0BP4QCFWUMvLQRbPOrLB2mZ71/jvar3llBjIiukjZWXhNYqGU7bSWzHjENkLP
	+rbg==
X-Gm-Message-State: ABuFfogowUqNFZXZthvuDfoYucBqk/jPNxVztaJL63z7wjsBpEV1tJSg
	vlLrMiGeYZVM0VbmhtzMIMxgm4WUQ2i+jEMHHyHuFaok
X-Google-Smtp-Source: ACcGV62MDoOAQYuoHJkezEuXcGzSsPJBJsJooz9i9eZLfWU+ts1xtyGOfqH1yz1KAIxmzMyjJgX+IldQykUtaewnRS0=
X-Received: by 2002:a37:9d55:: with SMTP id
	g82-v6mr17124732qke.315.1539626930055; 
	Mon, 15 Oct 2018 11:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20181015161229.68258-1-timothy.t.orling@linux.intel.com>
In-Reply-To: <20181015161229.68258-1-timothy.t.orling@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Oct 2018 11:08:23 -0700
Message-ID: <CAMKF1sp8-FsrpQHXgadfHSs_OGAAdNZ63j83Rifmwq4A8q2cSQ@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH 1/2] libnet-dns-sec-perl: add recipe for 1.10
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
X-List-Received-Date: Mon, 15 Oct 2018 18:08:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 15, 2018 at 9:12 AM Tim Orling
<timothy.t.orling@linux.intel.com> wrote:
>
> Net::DNS::SEC is installed as an extension to an existing Net::DNS
> installation providing packages to support DNSSEC as specified in
> RFC4033, RFC4034, RFC4035 and related documents.
>
> It also provides support for SIG0 which is useful for dynamic updates.
>
> Implements cryptographic signature generation and verification functions
> using RSA, DSA, ECDSA, and Edwards curve algorithms.
>
> The extended features are made available by replacing Net::DNS by
> Net::DNS::SEC in the use declaration.
>
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  .../libnet/libnet-dns-sec-perl_1.10.bb             | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
>
> diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
> new file mode 100644
> index 0000000000..5c485ed68f
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION = "DNSSEC extensions to Net::DNS"
> +HOMEPAGE = "http://www.net-dns.org/"
> +SECTION = "libs"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://README;beginline=165;endline=192;md5=6ef523fa09e8c272675839e21de16bde"
> +
> +SRC_URI = "https://cpan.metacpan.org/authors/id/W/WI/WILLEM/Net-DNS-SEC-${PV}.tar.gz"
> +SRC_URI[md5sum] = "ffa55a9898192c9d4c623cb1357eba9b"
> +SRC_URI[sha256sum] = "37a47d4def72d7338f3cc7cd807ec19bd9e2ae638ae656fa536cf0314801989e"
> +
> +DEPENDS += "openssl"
> +
> +UPSTREAM_CHECK_REGEX = "Net\-DNS\-SEC\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
> +
> +S = "${WORKDIR}/Net-DNS-SEC-${PV}"
> +
> +EXTRA_CPANFLAGS = "INC='-I${STAGING_INCDIR}' LIBS='-L${STAGING_LIBDIR} -lssl -L${STAGING_DIR_TARGET}${base_libdir} -lcrypto'"

we could use STAGING_BASELIBDIR

> +
> +inherit cpan ptest-perl
> +
> +RDEPENDS_${PN} = " \
> +    libnet-dns-perl \
> +    libcrypto \
> +    perl-module-dynaloader \
> +    perl-module-file-find \
> +    perl-module-file-spec \
> +    perl-module-io-file \
> +    perl-module-mime-base64 \
> +    perl-module-test-more \
> +"
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

