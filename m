Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 55D9477BBF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Aug 2017 21:08:25 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id s199so11288524vke.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Aug 2017 14:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U5easgNBxsA+s3McIF6TKFr+ogruS6Jdbo6ykNx5XY4=;
	b=M2/Uf7pykq2KzsNToT6GKJbvAlwNfq5WKXL/nvBQo6dWfWWqflat8SAgqRjqwSLugb
	bq4iDiNI2+sfQtdhIW8xwEg/f/5GQ4JR8StVGmCF9etrx4bcQOvDKT+Nwcv1uQkoYHqL
	tQjgUIM1GuezY1kxPj3ffdEcLkTzBekNh7SyR21enEPeyPS2LXjtIsQMdfH0+DKRgXmq
	M26bDcsq3egjbhhphEa7ZS4QXR6S8iFgGdE4AtOmFLU0meQGoxiip0rILyiqFDFVPBVy
	ydXXjW085RZ/A8NRCxAajk0WnkB364Dt9cn+HhV2my4ixt6SwTLS59esbDHxXWWMNF6h
	M2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U5easgNBxsA+s3McIF6TKFr+ogruS6Jdbo6ykNx5XY4=;
	b=VBB2OiEKJx8wiR4GHkOAf6Ifz+enGcIakxYcnWmqNxTLxZcQVEyyo9fTqTzKulXWoX
	E/ntrbrcCcNdPqEA5SQbkL+tzxcGq2rvFdDw4crB3vbmdGzeqNKO8WOsPEQpciaT5jQj
	Rh3ttfsNTIScBxQAdyyU1g3T2xt3q25gJF6xG0OS3vVPyvvbn80zQTuw9+83U4Il9R7y
	yFNjh6LgRcTdzqB7xKpBs9TRu+QVoV3O1eArHd1qQozoT2RBF54886GXFy8qekkQGMuz
	n4QS/O8Uz7MwSGginmxItsSFk6fDbRlD9NbweLQL4LhazstCaHyiOxhHHMRLGPY1C7qD
	PO4w==
X-Gm-Message-State: AHYfb5hi60Vokn4fxOHBxHkIu/u89qfDEwMTvR2xXs/fO7zrcJqSGZqj
	C82sM08zpDTTyH3Po39ml4QZfHgZ+w==
X-Received: by 10.31.52.138 with SMTP id b132mr3090455vka.26.1503868106852;
	Sun, 27 Aug 2017 14:08:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.52.11 with HTTP; Sun, 27 Aug 2017 14:08:25 -0700 (PDT)
In-Reply-To: <CA+chaQdBdq_kjGD8T6cprdeZ6Os-Cq9cPnszQC9nijoLhQy7Ug@mail.gmail.com>
References: <20170825170115.14446-1-timothy.t.orling@linux.intel.com>
	<CA+chaQdBdq_kjGD8T6cprdeZ6Os-Cq9cPnszQC9nijoLhQy7Ug@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 27 Aug 2017 14:08:25 -0700
Message-ID: <CANx9H-DUQRApRhTA48Jh7LvFo86CpoBOMD3opJUB_OTis48hBw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH v2] libmodule-build-perl: upgrade to v0.4224 and fix qa error
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
X-List-Received-Date: Sun, 27 Aug 2017 21:08:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 27, 2017 at 12:54 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Why does it inherit allarch now, it shouldn't as detected by
> sstate-diff-machines.sh
>
>
The meta-cpan recipe had inherit allarch, which made the qa error go away.
Clearly not the
correct solution. I'll try to find the right solution...


> ERROR: libmodule-build-perl different signature for task
> do_configure.sigdata between qemux86copy and qemuarm
> runtaskdeps changed:
> libmodule/libmodule-build-perl_0.4224.bb.do_prepare_recipe_sysroot
> with hash a6c9b9059c759fdee7e8d4be4547d06c
>  changed to
> libmodule/libmodule-build-perl_0.4224.bb.do_prepare_recipe_sysroot
> with hash 8852bf6b4dec3dad7df9b285f3df7f10
> Hash for dependent task
> libmodule/libmodule-build-perl_0.4224.bb.do_prepare_recipe_sysroot
> changed from a6c9b9059c759fdee7e8d4be4547d06c to
> 8852bf6b4dec3dad7df9b285f3df7f10
>
>
>
> On Fri, Aug 25, 2017 at 7:01 PM, Tim Orling <
> timothy.t.orling@linux.intel.com> wrote:
>
> > * Use COPYRIGHT excerpt from README for license check
> >   - Remains the same perl5 license
> >   - LICENSE contents is unhelpful "FULLTEXT"
> > * Correct copy-paste error in SUMMARY
> > * Fix rpm package_qa error by 'inherit allarch'
> > * Author is now LEONT instead of KWILLIAMS
> > * Update HOMEPAGE
> > * Add interpreter fix from meta-cpan for lib/Module/Build/Base.pm
> >
> > Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> >
> > ---
> > Changes in v2:
> > * Drop unused run-ptest, Module::Build's tests are designed to
> >   be run on a non-installed version of the module. Not useful
> >   in a ptest context.
> > ---
> >  .../libmodule/libmodule-build-perl_0.31.bb         | 27
> -----------------
> >  .../libmodule/libmodule-build-perl_0.4224.bb       | 34
> > ++++++++++++++++++++++
> >  2 files changed, 34 insertions(+), 27 deletions(-)
> >  delete mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-
> > perl_0.31.bb
> >  create mode 100644 meta-perl/recipes-perl/libmodule/libmodule-build-
> > perl_0.4224.bb
> >
> > diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-
> perl_0.31.bb
> > b/meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.31.bb
> > deleted file mode 100644
> > index c0fa06d08..000000000
> > --- a/meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.31.bb
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> > -SUMMARY = "Module::Build::Tiny - A tiny replacement for Module::Build"
> > -DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a
> \
> > -Makefile.PL file to drive distribution configuration, build, test and \
> > -installation. Traditionally, Build.PL uses Module::Build as the
> > underlying \
> > -build system. This module provides a simple, lightweight, drop-in
> > replacement. \
> > -Whereas Module::Build has over 6,700 lines of code; this module has less
> > than \
> > -120, yet supports the features needed by most distributions."
> > -SECTION = "libs"
> > -
> > -HOMEPAGE = "http://search.cpan.org/~kwilliams/Module-Build-0.31/"
> > -
> > -LICENSE = "Artistic-1.0 | GPL-1.0+"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=43339d8f9d3a956ee9eceb07717ee9
> 5e"
> > -
> > -SRC_URI = "${CPAN_MIRROR}/authors/id/K/KW/KWILLIAMS/Module-Build-${
> > PV}.tar.gz"
> > -SRC_URI[md5sum] = "3d4fdffe58f6236253767e5a71edf29b"
> > -SRC_URI[sha256sum] = "e2f723be8d6c70b4ddbca3b5e32e52
> > e6e98eae8f43e34d7ede87efcb1796bbb5"
> > -
> > -S = "${WORKDIR}/Module-Build-${PV}"
> > -
> > -inherit cpan_build
> > -
> > -do_install () {
> > -        cpan_build_do_install
> > -}
> > -
> > -BBCLASSEXTEND = "native"
> > diff --git a/meta-perl/recipes-perl/libmodule/libmodule-build-
> > perl_0.4224.bb b/meta-perl/recipes-perl/libmodule/libmodule-build-
> > perl_0.4224.bb
> > new file mode 100644
> > index 000000000..b09135c95
> > --- /dev/null
> > +++ b/meta-perl/recipes-perl/libmodule/libmodule-build-perl_0.4224.bb
> > @@ -0,0 +1,34 @@
> > +SUMMARY = "Module::Build - Build and install Perl modules"
> > +DESCRIPTION = "Many Perl distributions use a Build.PL file instead of a
> \
> > +Makefile.PL file to drive distribution configuration, build, test and \
> > +installation. Traditionally, Build.PL uses Module::Build as the
> > underlying \
> > +build system. This module provides a simple, lightweight, drop-in
> > replacement. \
> > +Whereas Module::Build has over 6,700 lines of code; this module has less
> > than \
> > +120, yet supports the features needed by most distributions."
> > +
> > +SECTION = "libs"
> > +
> > +HOMEPAGE = "https://metacpan.org/release/Module-Build"
> > +
> > +LICENSE = "Artistic-1.0 | GPL-1.0+"
> > +LIC_FILES_CHKSUM = "file://README;beginline=960;endline=965;md5=
> > 624c06db56a2af4d70cf9edc29fcae1b"
> > +
> > +SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-${PV}.
> > tar.gz"
> > +SRC_URI[md5sum] = "b74c2f6e84b60aad3a3defd30b6f0f4d"
> > +SRC_URI[sha256sum] = "a6ca15d78244a7b50fdbf27f85c85f
> > 4035aa799ce7dd018a0d98b358ef7bc782"
> > +
> > +S = "${WORKDIR}/Module-Build-${PV}"
> > +
> > +inherit cpan_build allarch
> > +
> > +# From:
> > +# https://github.com/rehsack/meta-cpan/blob/master/recipes-
> > devel/module-build-perl/module-build-perl_0.4216.bb
> > +#
> > +do_patch_module_build () {
> > +    cd ${S}
> > +    sed -i -e 's,my $interpreter = $self->{properties}{perl};,my
> > $interpreter = "${bindir}/perl";,g' lib/Module/Build/Base.pm
> > +}
> > +
> > +do_patch[postfuncs] += "do_patch_module_build"
> > +
> > +BBCLASSEXTEND = "native"
> > --
> > 2.13.5
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

