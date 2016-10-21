Return-Path: <andre.draszik@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id F2FF571BBD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 08:29:23 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id b75so4631793lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 01:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RTDqbc+JLTSQHtzq2tH7IOGP8laXf5YOljCE505VygA=;
	b=YctsqdvBVZRjVdMyvZjPlGp37OJzBuy3ma7lKhfFFPYb+v9qzKSQkwEKGrPbAs1zQ6
	Bt7VoluAYAAPqBLXyzQDRYFcGCdpMIet4T45Oin6MIDI88k4VW0WKQUpGmVMunUfk78f
	fZPPHWokbcIpGFOSg1emYElrvDOOPOPHRdjbBM+L2cHM/Jj6/m+qT641WYb1G5L3CtvU
	O2wLLZRfMsRxAsWBRqUMx2uPZ0/1PfPZ0FqRB6xg9t8NWO5UrCZtd4wfw8VkF+R3TviI
	QxTOPjgetNUoYv/ohvieTm0rlsVqROZUt6MWCNYWKTQYaV4qJcXjYVvBlxKvhgiIY66V
	Hbzg==
X-Gm-Message-State: AA6/9RlMbO6bWfQYRYcGIW7339xzGSft9gIvmWfeap23QOaOIwq4cJPUsshi/9XaDiXPhg==
X-Received: by 10.28.166.147 with SMTP id p141mr9009638wme.27.1477038563738;
	Fri, 21 Oct 2016 01:29:23 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	j202sm2880382wmd.0.2016.10.21.01.29.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 21 Oct 2016 01:29:23 -0700 (PDT)
Message-ID: <1477038562.642.0.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Oct 2016 09:29:22 +0100
In-Reply-To: <eb06c3eb-f54e-12fe-c2e7-d30c67ac925b@windriver.com>
References: <20161020211630.2707-1-git@andred.net>
	<eb06c3eb-f54e-12fe-c2e7-d30c67ac925b@windriver.com>
X-Mailer: Evolution 3.22.1-1 
Mime-Version: 1.0
Subject: Re: [meta-networking][PATCH] c-ares: update 1.11.0 -> 1.12.0
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
X-List-Received-Date: Fri, 21 Oct 2016 08:29:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-10-21 at 15:23 +0800, Kang Kai wrote:
> On 2016年10月21日 05:16, André Draszik wrote:
> > Highlight:
> > - fix CVE-2016-5180
> > 
> > Other changes, from https://c-ares.haxx.se/changelog.html
> > 
> > c-ares version 1.12.0 - Sep 29 2016
> > Changes:
> >      api: add ARES_OPT_NOROTATE optmask value
> > 
> > Bug fixes:
> >      CVE-2016-5180: ares_create_query single byte out of buffer write
> >      configure: acknowledge --disable-tests [1]
> >      man pages: fix typos detected by Lintian
> >      test: add missing #includes for dns-proto.cc
> >      test: avoid in6addr_* constants
> >      test: Build with MinGW on AppVeyor
> >      Makefile.m32: add support for extra flags
> >      Makefile.m32: add support for CROSSPREFIX
> >      configure: check if tests can get built before enabled
> >      ares_library_cleanup: reset ares_realloc too
> >      ahost.c: add cast to fix C++ compile
> >      test: Only pass unused args to GoogleTest
> >      build: commonize MSVC version detection
> >      msvc_ver.inc: support Visual Studio 2015 Update 1, 2, 3
> >      test: for AF_UNSPEC, return CNAME only for AAAA, but valid A record
> >      ares_getnameinfo: explicitly clear struct servent before use
> >      test: Update fuzzing function prototype
> >      init: fix nsort initialization
> >      test: add fuzzing check script to tests
> >      web: http => https
> >      read_tcp_data: remove superfluous NULL check
> >      LICENSE.md: add a stand-alone license file
> >      SECURITY.md: suggested "security process" for the project
> >      ares_init_options: only propagate init failures from options [2]
> >      headers: remove checks for and defines of variable sizes
> >      test: fix gMock to work with gcc >= 6.x [3]
> > 
> > Signed-off-by: André Draszik <git@andred.net>
> > ---
> >   .../recipes-support/c-ares/{c-ares_1.11.0.bb => c-
> > ares_1.12.0.bb}     | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >   rename meta-networking/recipes-support/c-ares/{c-ares_1.11.0.bb => c-
> > ares_1.12.0.bb} (76%)
> > 
> > diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
> > b/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
> > similarity index 76%
> > rename from meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
> > rename to meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
> > index c98be7d..8b63972 100644
> > --- a/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
> > +++ b/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://ares_init.c;beginline=1;endli
> > ne=3;md5=53f5ecf4c22c37c
> 
> A stand-alone license file is added. It is better to update 
> LIC_FILES_CHKSUM.

You're right. Thanks. Sent v2

Cheers,
Andre'

> 
> --Kai
> 
> >   SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz \
> >              file://0001-configure.ac-don-t-override-passed-cflags.patch 
> > \
> >   "
> > -SRC_URI[md5sum] = "d5c6d522cfc54bb6f215a0b7912d46be"
> > -SRC_URI[sha256sum] =
> > "b3612e6617d9682928a1d50c1040de4db6519f977f0b25d40cf1b632900b3efd"
> > +SRC_URI[md5sum] = "2ca44be1715cd2c5666a165d35788424"
> > +SRC_URI[sha256sum] =
> > "8692f9403cdcdf936130e045c84021665118ee9bfea905d1a76f04d4e6f365fb"
> >   
> >   inherit autotools pkgconfig
> 
> 

