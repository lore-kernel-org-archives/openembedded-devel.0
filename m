Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id CFB6D799F9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 04:54:00 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id p25-v6so12049345pli.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 21:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DD2D9CZjZvuu4tcx3BNaLfhXIAaTyq4KXVqPdps3pCo=;
	b=nu6LkUyqaqYKrObESqTaN3lijGGOQd85+a1lD7/eOfANVDgozdoX31XBGa1DuG3oAD
	jXpC+FM9FBHq5CBXnG9S1Faxvj7bPftkjs3eZRktFz4GoxLt3nJZrE7m2i3DZz26UkqQ
	WZ2e/ZRx4AtWhctzb1jIZP+jsUK6Gf9LWKQDP3Zlx6FT+0Irj927BmQTCddEwHD9hE2W
	rqrL9XYIgjv60NLL8vELXlXN4SdDylmT0hElgt3iQpWCXvoSTBkcJnShV4sTmfbokP2u
	w8M4dl1ZE8+RKbd4RT+G5Com5FoMPNa5qlMZ174uSTbsVRvT9iNoFwYZHcthTBLlFFrE
	Imow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=DD2D9CZjZvuu4tcx3BNaLfhXIAaTyq4KXVqPdps3pCo=;
	b=Nng4uOXyylxjHzRbCazoyUIj+4icwbeCWUMWbs2qhmjEdlTQSnk1CBnLCbd51zuhrx
	XOcnByqgUDUg/JlvROiPWe1nd8QcvcmP8l/ZI1CpAFSn6U14TRmiL/NFIje+3LTvn4CX
	XvUFTlE+Um8huXeeeEzVq/kMt4ISN1kGuaGd/dmZP3sHasdHnDchuJHEHwIVpXhvE39k
	pKMxarZps3kjiBwHe0aqxtMUr9bfjc5w6X1tMYRbvphr52W1ACKJUNleM/Z84b5IeurX
	RzGi6hv0mU6wgbyuwBo1RXoq8OIz+2a7YPmr6rZqeqePCpnwUqyL2SlMyOBB1iVQleCW
	mb0Q==
X-Gm-Message-State: ABuFfogSc11JSVfGRhVUf9mow7Mwh/+v3FZEzTBZXZhGpDLQbCXcUVE/
	rrch5oBXPFH5VU6bOxYNfLhR0/6tSW4=
X-Google-Smtp-Source: ACcGV60YkeL8G2cW0FjlAQ4I+DGo/sWSIy9tbYx0jFMYQ2wSDngm1luH9uu7AS4hmsjBonHqOfLAeg==
X-Received: by 2002:a17:902:bd0a:: with SMTP id
	p10-v6mr23696597pls.245.1539752041166; 
	Tue, 16 Oct 2018 21:54:01 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:b1aa:fec:e9d1:f158])
	by smtp.gmail.com with ESMTPSA id
	n87-v6sm21616238pfb.62.2018.10.16.21.54.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 21:54:00 -0700 (PDT)
To: Tim Orling <ticotimo@gmail.com>
References: <20181015161229.68258-1-timothy.t.orling@linux.intel.com>
	<20181015161229.68258-2-timothy.t.orling@linux.intel.com>
	<CAMKF1spEiC8L5zunRFGXGPJf4v+UJG+gzoJrQJyiHh6T7mt4NA@mail.gmail.com>
	<CANx9H-B6G-5=b0hFbdPberGsKSiZRoKgzotW6Yk5zOXfVnmiiA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <6f493501-0daa-3811-86ee-910d1cb0f384@gmail.com>
Date: Tue, 16 Oct 2018 21:53:59 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:63.0)
	Gecko/20100101 Thunderbird/63.0
MIME-Version: 1.0
In-Reply-To: <CANx9H-B6G-5=b0hFbdPberGsKSiZRoKgzotW6Yk5zOXfVnmiiA@mail.gmail.com>
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
X-List-Received-Date: Wed, 17 Oct 2018 04:54:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 10/16/18 9:42 PM, Tim Orling wrote:
> 
> 
> On Mon, Oct 15, 2018 at 11:14 AM Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     On Mon, Oct 15, 2018 at 9:13 AM Tim Orling
>     <timothy.t.orling@linux.intel.com
>     <mailto:timothy.t.orling@linux.intel.com>> wrote:
>      >
>      > * Add UPSTREAM_CHECK_REGEX to ignore DEV releases
>      > * Add RDEPENDS that were missing
>      > * Enable ptest and add RDEPENDS for tests
>      > * Add RRECOMMENDS for libnet-dns-sec-perl
>      >
>      > * Upstream release notes:
>      > """
>      > **** 1.18 Sep 21, 2018
>      >
>      >         Documentation revised to remove ambigous use of "answer"
>     which
>      >         has been used to refer to both the answer section of a packet
>      >         and the entire reply packet received from a nameserver.
>      >
>      > Fix rt.cpan.org <http://rt.cpan.org> #127018
>      >
>      >         Net::DNS::ZoneFile->parse() fails if include directory
>     specified.
>      >
>      > Fix rt.cpan.org <http://rt.cpan.org> #127012
>      >
>      >         DNS resolution broken when options ndots used in
>     /etc/resolv.conf
>      > """
>      >
>      > Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com
>     <mailto:timothy.t.orling@linux.intel.com>>
>      > ---
>      >  .../recipes-perl/libnet/libnet-dns-perl_1.17.bb
>     <http://libnet-dns-perl_1.17.bb>    | 27 ----------
>      >  .../recipes-perl/libnet/libnet-dns-perl_1.18.bb
>     <http://libnet-dns-perl_1.18.bb>    | 58 ++++++++++++++++++++++
>      >  2 files changed, 58 insertions(+), 27 deletions(-)
>      >  delete mode 100644
>     meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
>     <http://libnet-dns-perl_1.17.bb>
>      >  create mode 100644
>     meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb
>     <http://libnet-dns-perl_1.18.bb>
>      >
>      > diff --git
>     a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
>     <http://libnet-dns-perl_1.17.bb>
>     b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
>     <http://libnet-dns-perl_1.17.bb>
>      > deleted file mode 100644
>      > index 79583551f9..0000000000
>      > --- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.17.bb
>     <http://libnet-dns-perl_1.17.bb>
>      > +++ /dev/null
>      > @@ -1,27 +0,0 @@
>      > -DESCRIPTION = "This package contains the DNS.pm module with
>     friends."
>      > -HOMEPAGE = "http://www.net-dns.org/"
>      > -SECTION = "libs"
>      > -LICENSE = "MIT"
>      > -
>      > -LIC_FILES_CHKSUM =
>     "file://README;beginline=252;endline=269;md5=27db37b42cd1a5173a53922d67072bcb"
>      > -
>      > -DEPENDS += "perl"
>      > -
>      > -SRC_URI =
>     "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz
>     <http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-$%7BPV%7D.tar.gz>"
>      > -
>      > -SRC_URI[md5sum] = "28fcbcbf4483a9f23f75be4b9e3e45c8"
>      > -SRC_URI[sha256sum] =
>     "9a79fd8fea1a708726c18d193ae4437479206ccb20ffa7f0971371e172e2c2e0"
>      > -
>      > -S = "${WORKDIR}/Net-DNS-${PV}"
>      > -
>      > -EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR}
>     EXPATINCPATH=${STAGING_INCDIR}"
>      > -
>      > -inherit cpan
>      > -
>      > -RDEPENDS_${PN} = "perl-module-integer"
>      > -
>      > -do_compile() {
>      > -    export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/
>     -name 'libc-*.so')"
>      > -    cpan_do_compile
>      > -}
>      > -BBCLASSEXTEND = "native"
>      > diff --git
>     a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb
>     <http://libnet-dns-perl_1.18.bb>
>     b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb
>     <http://libnet-dns-perl_1.18.bb>
>      > new file mode 100644
>      > index 0000000000..0b22fdf7f6
>      > --- /dev/null
>      > +++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.18.bb
>     <http://libnet-dns-perl_1.18.bb>
>      > @@ -0,0 +1,58 @@
>      > +DESCRIPTION = "This package contains the DNS.pm module with
>     friends."
>      > +HOMEPAGE = "http://www.net-dns.org/"
>      > +SECTION = "libs"
>      > +LICENSE = "MIT"
>      > +
>      > +LIC_FILES_CHKSUM =
>     "file://README;beginline=252;endline=269;md5=27db37b42cd1a5173a53922d67072bcb"
>      > +
>      > +DEPENDS += "perl"
>      > +
>      > +SRC_URI =
>     "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz
>     <http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-$%7BPV%7D.tar.gz>"
>      > +
>      > +SRC_URI[md5sum] = "67af7e5c1c339f60c45c1054374bd8ee"
>      > +SRC_URI[sha256sum] =
>     "52ce1494fc9707fd5a60ed71db5cde727157b7f2363787d730d4d1bd9800a9d3"
>      > +
>      > +UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
>      > +
>      > +S = "${WORKDIR}/Net-DNS-${PV}"
>      > +
>      > +EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR}
>     EXPATINCPATH=${STAGING_INCDIR}"
>      > +
>      > +inherit cpan ptest-perl
>      > +
>      > +RDEPENDS_${PN} = " \
>      > +    libdigest-hmac-perl \
>      > +    perl-module-base \
>      > +    perl-module-constant \
>      > +    perl-module-digest-md5 \
>      > +    perl-module-digest-sha \
>      > +    perl-module-file-spec \
>      > +    perl-module-integer \
>      > +    perl-module-io-file \
>      > +    perl-module-io-select \
>      > +    perl-module-io-socket \
>      > +    perl-module-io-socket-ip \
>      > +    perl-module-mime-base64 \
>      > +    perl-module-scalar-util \
>      > +    perl-module-test-more \
>      > +    perl-module-time-local \
>      > +"
>      > +
>      > +RRECOMMENDS_${PN} += " \
>      > +    libnet-dns-sec-perl \
>      > +"
>      > +
>      > +RDEPENDS_${PN}-ptest += " \
>      > +    perl-module-encode \
>      > +    perl-module-encode-byte \
>      > +    perl-module-extutils-mm \
>      > +    perl-module-extutils-mm-unix \
>      > +    perl-module-overload \
>      > +"
>      > +
>      > +do_compile() {
>      > +    export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/
>     -name 'libc-*.so')"
> 
>     this could be better controlled with TCLIBC bitbake variable.
>     Secondly does it
>     have to know exact version of libc ? the regexp seems to be doing
>     that. Can we just use libc.so.6 for glibc and libc.so for musl.
> 
> 
> Can we just do $(find $STAGING_BASELIBDIR}/ -name 'libc.so') ???
> I inherited this export, but I would prefer to make it work with glibc 
> and musl, of course.

defining it statically make metadata better for reproducible hence the 
suggestion. output of find here wont be caught in task checksums.

> 
>      > +    cpan_do_compile
>      > +}
>      > +
>      > +BBCLASSEXTEND = "native"
>      > --
>      > 2.14.4
>      >
>      > --
>      > _______________________________________________
>      > Openembedded-devel mailing list
>      > Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>      > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 

