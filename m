Return-Path: <ticotimo@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 59E7D79A07
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 04:42:27 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id y195so4184581vsc.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 21:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BOMCY/CeH1IfbNv2Wb+5klXBbOQHv4TiZpyWo4d7524=;
	b=dZwJqox5/Ef6+7hLs/F8gYpTpyISn0Eb3zZy3eM0xUwn/ABhiT+yMVVlp/nfNb7wYo
	HVF834Xaa6bKGi7Anr0WZwDCWh5zHGaQHdljOis8lQfbGOZBsfI5ajN+79Prf5nG2jCb
	MwdwYhylcBmzLkkAj9SKWX1A+sNNBu7oS21AZOWN1ah8ol/lcjC4H+58WHTw6mMjjfzd
	pgtk8WcyMQ2dHiGBVQRhTRW7C8V4YNRaRNcINxwqpoKvbpAPD2zNb/hDgGDD2qGwQ3wX
	WxrxGTcllg6jQXWiTRMb8vO9srOI2i/G7CVqzkuAWilkUhb5+3LScoLbIziRW9S3qv0y
	XKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BOMCY/CeH1IfbNv2Wb+5klXBbOQHv4TiZpyWo4d7524=;
	b=md5BvcbtzDB3xCLIcBNYeyYZxo0wAXJTefGM3zaRg0ak8OvP2kAGQzvWCo9wGX+UCs
	utNSCN0JPp7fE/+aiha9Hvcklq8gpf3myNMQlG0zIKFJtDjabylr3JtHXoovGj0yt4kK
	8Lh4n3l3CqfoLj5t7Ow/8kBwEjB0IKsnO03im5vNgCdsjDqlMIt8oUt9Qqoe0NlxPorY
	GrLyVSGg7hdR6MDwkydcQ42lkIhR5lb5fWep5hH8umUEsAz5V+aopu7bHJGMSIbHlNKF
	MseMUPf/075/IOAIkBKEXwHRcDS8x4p2eTS8YbcC7Fu/4ZSzMfsJFVm33WaVfHuFKUcB
	f1Fw==
X-Gm-Message-State: ABuFfogDbEvL7XcDUJV954etvdrCPTJ2Sgqas5Tm0YLzy5+/pXU5JFn3
	0TPLR98/3JL3ExeSMFR7DsgucdjIfkl0xTcNswo=
X-Google-Smtp-Source: ACcGV634XDyEkSWy1aWumO00NLgQ+CZJYsxFrmFMrcAFj/snJniTdPrTSrvS4ZaSGB5aj4FzfussQc1t62h+6vMC348=
X-Received: by 2002:a67:7d86:: with SMTP id y128mr1632322vsc.22.1539751348116; 
	Tue, 16 Oct 2018 21:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20181015161229.68258-1-timothy.t.orling@linux.intel.com>
	<20181015161229.68258-2-timothy.t.orling@linux.intel.com>
	<CAMKF1spEiC8L5zunRFGXGPJf4v+UJG+gzoJrQJyiHh6T7mt4NA@mail.gmail.com>
In-Reply-To: <CAMKF1spEiC8L5zunRFGXGPJf4v+UJG+gzoJrQJyiHh6T7mt4NA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 16 Oct 2018 21:42:17 -0700
Message-ID: <CANx9H-B6G-5=b0hFbdPberGsKSiZRoKgzotW6Yk5zOXfVnmiiA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 17 Oct 2018 04:42:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 15, 2018 at 11:14 AM Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Oct 15, 2018 at 9:13 AM Tim Orling
> <timothy.t.orling@linux.intel.com> wrote:
> >
> > * Add UPSTREAM_CHECK_REGEX to ignore DEV releases
> > * Add RDEPENDS that were missing
> > * Enable ptest and add RDEPENDS for tests
> > * Add RRECOMMENDS for libnet-dns-sec-perl
> >
> > * Upstream release notes:
> > """
> > **** 1.18 Sep 21, 2018
> >
> >         Documentation revised to remove ambigous use of "answer" which
> >         has been used to refer to both the answer section of a packet
> >         and the entire reply packet received from a nameserver.
> >
> > Fix rt.cpan.org #127018
> >
> >         Net::DNS::ZoneFile->parse() fails if include directory specified.
> >
> > Fix rt.cpan.org #127012
> >
> >         DNS resolution broken when options ndots used in /etc/resolv.conf
> > """
> >
> > Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> > ---
> >  .../recipes-perl/libnet/libnet-dns-perl_1.17.bb    | 27 ----------
> >  .../recipes-perl/libnet/libnet-dns-perl_1.18.bb    | 58
> ++++++++++++++++++++++
> >  2 files changed, 58 insertions(+), 27 deletions(-)
> >  delete mode 100644 meta-perl/recipes-perl/libnet/
> libnet-dns-perl_1.17.bb
> >  create mode 100644 meta-perl/recipes-perl/libnet/
> libnet-dns-perl_1.18.bb
> >
> > diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
> b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
> > deleted file mode 100644
> > index 79583551f9..0000000000
> > --- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> > -DESCRIPTION = "This package contains the DNS.pm module with friends."
> > -HOMEPAGE = "http://www.net-dns.org/"
> > -SECTION = "libs"
> > -LICENSE = "MIT"
> > -
> > -LIC_FILES_CHKSUM =
> "file://README;beginline=252;endline=269;md5=27db37b42cd1a5173a53922d67072bcb"
> > -
> > -DEPENDS += "perl"
> > -
> > -SRC_URI = "
> http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz
> "
> > -
> > -SRC_URI[md5sum] = "28fcbcbf4483a9f23f75be4b9e3e45c8"
> > -SRC_URI[sha256sum] =
> "9a79fd8fea1a708726c18d193ae4437479206ccb20ffa7f0971371e172e2c2e0"
> > -
> > -S = "${WORKDIR}/Net-DNS-${PV}"
> > -
> > -EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR}
> EXPATINCPATH=${STAGING_INCDIR}"
> > -
> > -inherit cpan
> > -
> > -RDEPENDS_${PN} = "perl-module-integer"
> > -
> > -do_compile() {
> > -    export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name
> 'libc-*.so')"
> > -    cpan_do_compile
> > -}
> > -BBCLASSEXTEND = "native"
> > diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb
> b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb
> > new file mode 100644
> > index 0000000000..0b22fdf7f6
> > --- /dev/null
> > +++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb
> > @@ -0,0 +1,58 @@
> > +DESCRIPTION = "This package contains the DNS.pm module with friends."
> > +HOMEPAGE = "http://www.net-dns.org/"
> > +SECTION = "libs"
> > +LICENSE = "MIT"
> > +
> > +LIC_FILES_CHKSUM =
> "file://README;beginline=252;endline=269;md5=27db37b42cd1a5173a53922d67072bcb"
> > +
> > +DEPENDS += "perl"
> > +
> > +SRC_URI = "
> http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz
> "
> > +
> > +SRC_URI[md5sum] = "67af7e5c1c339f60c45c1054374bd8ee"
> > +SRC_URI[sha256sum] =
> "52ce1494fc9707fd5a60ed71db5cde727157b7f2363787d730d4d1bd9800a9d3"
> > +
> > +UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
> > +
> > +S = "${WORKDIR}/Net-DNS-${PV}"
> > +
> > +EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR}
> EXPATINCPATH=${STAGING_INCDIR}"
> > +
> > +inherit cpan ptest-perl
> > +
> > +RDEPENDS_${PN} = " \
> > +    libdigest-hmac-perl \
> > +    perl-module-base \
> > +    perl-module-constant \
> > +    perl-module-digest-md5 \
> > +    perl-module-digest-sha \
> > +    perl-module-file-spec \
> > +    perl-module-integer \
> > +    perl-module-io-file \
> > +    perl-module-io-select \
> > +    perl-module-io-socket \
> > +    perl-module-io-socket-ip \
> > +    perl-module-mime-base64 \
> > +    perl-module-scalar-util \
> > +    perl-module-test-more \
> > +    perl-module-time-local \
> > +"
> > +
> > +RRECOMMENDS_${PN} += " \
> > +    libnet-dns-sec-perl \
> > +"
> > +
> > +RDEPENDS_${PN}-ptest += " \
> > +    perl-module-encode \
> > +    perl-module-encode-byte \
> > +    perl-module-extutils-mm \
> > +    perl-module-extutils-mm-unix \
> > +    perl-module-overload \
> > +"
> > +
> > +do_compile() {
> > +    export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name
> 'libc-*.so')"
>
> this could be better controlled with TCLIBC bitbake variable. Secondly
> does it
> have to know exact version of libc ? the regexp seems to be doing
> that. Can we just use libc.so.6 for glibc and libc.so for musl.
>
>
Can we just do $(find $STAGING_BASELIBDIR}/ -name 'libc.so') ???
I inherited this export, but I would prefer to make it work with glibc and
musl, of course.


> > +    cpan_do_compile
> > +}
> > +
> > +BBCLASSEXTEND = "native"
> > --
> > 2.14.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

