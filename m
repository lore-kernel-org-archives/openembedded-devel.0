Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8EB78EC5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 16:44:43 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id d4-v6so18743633qtn.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 09:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=p/NvbMbeFWYqC8kwGVmIbDNjn+izXwxkv5qp/I+Gz/k=;
	b=gB1ExD3J7MY5KZDrg1j0YVBfv0F2zT/Higz/xHa4cl5fW9PjHsplGVYpjrYp1H0XaZ
	xCVz25Fs//wi5Yvkd5HB/QPss3p7Xw6v74XMFQ7/1MvRtQrAemm4LSGHWMrNPhXpveIw
	2RjhETce7/ivFPcgRpl8L+kcVbrcFAdnd5G3pAk/7a4EDsRsuoNNs+pG/xzklurMqhJw
	YCkMV2YjpPyQuYjoqxFeoZtddEyhvEMOtIuFHgu1y07k0yjpcc5XkxEg+XuoSTlQq1B6
	pKD97Xkf22UwHJSLCiggtVmsnLjuxqmcHWKCcg0DG/xwu+IzQQmzc9ZIYlSHw36wyVN/
	ITeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=p/NvbMbeFWYqC8kwGVmIbDNjn+izXwxkv5qp/I+Gz/k=;
	b=HZJZ14vjAqdeiqwVvEGR1pk1rbhLT2qG5OVfSNJ1hXqrhr+KYoSAz0RrrCSQ+QfuYD
	eLBd/cm/+ewAAUDFBezj2Kf3vO+byoNUGGh0hkbdey7L+/shWsmVZvY9ZeJzlWuIxarZ
	eV6lIrUsVZWvTK2/RXF+KG4NnxHzJATCxZJkWqfgLakNXuTJlw/XDOsUErlsVXKF52BU
	h8U2U15PHacWkmq6dth98TnLvSnbViOK8eZyS+nMmyYCz99in/B0uevdZnDfhspCQKlH
	/M0k6dmrU1RW+74wtehBOMzZ3tB7Nk5NVg7QrKJn+BrhZi8DrgYWeO5JZhmoobBiW2mw
	Vstw==
X-Gm-Message-State: APzg51ANECedPntwUjSVyFqqOpaZD0T/uldATNTZlc5zKFu+RhHvaaLa
	fKIDRSorcWV9wlYeTmLtKf6D5E6YECJvAO53P3A=
X-Google-Smtp-Source: ANB0VdZhgrMi+ajW9BNyZCveNvYcU11mddHdhO5rqT/9gPXPrFwFplc63EEqaPW2tE+HJXudv0fpTYHwOIIUmlREwjg=
X-Received: by 2002:ac8:4304:: with SMTP id
	z4-v6mr14519855qtm.295.1535388284837; 
	Mon, 27 Aug 2018 09:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20180827132729.23213-1-sno@netbsd.org>
In-Reply-To: <20180827132729.23213-1-sno@netbsd.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Aug 2018 09:44:18 -0700
Message-ID: <CAMKF1sqL5N-kM++o2qroPxWJWB3gDKofLBDvs35v54Q4fh5kjA@mail.gmail.com>
To: sno@netbsd.org
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH] libnet-ssleay-perl: Fix configure issue
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
X-List-Received-Date: Mon, 27 Aug 2018 16:44:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 27, 2018 at 6:27 AM Jens Rehsack <sno@netbsd.org> wrote:
>
> Fix libnet-ssleay-perl tries to execute found openssl binaries
> at the place of ${OPENSSL_PREFIX} and bailing out when either
> binaries are missing or can't be executed. From cross-compiling
> perspective, both is insane.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  .../no-exec-on-configure.patch                | 33 +++++++++++++++++++
>  .../libnet/libnet-ssleay-perl_1.85.bb         |  8 +++--
>  2 files changed, 39 insertions(+), 2 deletions(-)
>  create mode 100644 meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch
>
> diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch
> new file mode 100644
> index 000000000..6efa7d8f9
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl/no-exec-on-configure.patch
> @@ -0,0 +1,33 @@
> +--- a/inc/Module/Install/PRIVATE/Net/SSLeay.pm 2018-08-27 14:56:24.788544991 +0200
> ++++ b/inc/Module/Install/PRIVATE/Net/SSLeay.pm 2018-08-27 15:00:12.847266331 +0200
> +@@ -24,20 +24,7 @@
> +     $self->requires_external_cc;
> +
> +     my $prefix = $self->find_openssl_prefix;
> +-    my $exec   = $self->find_openssl_exec($prefix);
> +-
> +-    unless (-x $exec) {
> +-        print <<EOM;
> +-*** Could not find OpenSSL
> +-    If it's already installed, please set the OPENSSL_PREFIX environment
> +-    variable accordingly. If it isn't installed yet, get the latest version
> +-    from http://www.openssl.org/.
> +-EOM
> +-        exit 0; # according http://wiki.cpantesters.org/wiki/CPANAuthorNotes this is best-practice when "missing library"
> +-    }
> +-
> +-    $self->check_openssl_version($prefix, $exec);
> +-    my $opts = $self->ssleay_get_build_opts($prefix, $exec);
> ++    my $opts = $self->ssleay_get_build_opts($prefix);
> +
> +     $self->makemaker_args(
> +         CCCDLFLAGS => $opts->{cccdlflags},
> +@@ -58,7 +45,7 @@
> + }
> +
> + sub ssleay_get_build_opts {
> +-    my ($self, $prefix, $exec) = @_;
> ++    my ($self, $prefix) = @_;
> +
> +     my $opts = {
> +         lib_links  => [],
> diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
> index a0bb90e7d..6a116459e 100644
> --- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
> +++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
> @@ -23,6 +23,7 @@ RDEPENDS_${PN} += "\
>  "
>
>  SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MI/MIKEM/Net-SSLeay-${PV}.tar.gz \
> +           file://no-exec-on-configure.patch \
>             file://run-ptest \
>            "
>  SRC_URI[md5sum] = "d602bdce4e0531c6efc276e3e429ca69"
> @@ -32,9 +33,12 @@ S = "${WORKDIR}/Net-SSLeay-${PV}"
>
>  inherit cpan ptest
>
> -export OPENSSL_PREFIX="${STAGING_LIBDIR}"
> +#EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR} LIBS='-L${STAGING_LIBDIR} -lcrypto -lssl -L${STAGING_BASELIBDIR} -lz'"
>
> -EXTRA_CPANFLAGS = "INC=-I${STAGING_INCDIR} LIBS='-L${STAGING_LIBDIR} -lcrypto -lssl -L${STAGING_BASELIBDIR} -lz'"
> +do_configure() {
> +    export OPENSSL_PREFIX="${STAGING_DIR_TARGET}/usr"

perhaps use STAGING_EXECPREFIXDIR

> +    cpan_do_configure
> +}
>
>  do_install_ptest() {
>      cp -r ${B}/t ${D}${PTEST_PATH}
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

