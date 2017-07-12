Return-Path: <liu.ming50@gmail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 06C6677E9C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 02:07:37 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id j53so6001005uaa.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 19:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vlgsXGCQ/iV6gAwOoqZdbuJ6zVrEBMD1hME19dHClPk=;
	b=k83Xl2g+2bAtGA5xOal8ey0InZ+1gqxRMJSORqn40zNVfxZsP5Dp4rIGK1G3Lw/9aq
	XEHuCEFU8G05+hzR94snaRBmvaGgToUORv6ljDooHgBWs1+G25FH93PgsTsaMUCXVqiW
	ClzYWvbxD9j/2bu8gtcEjqTQSGMcqJ/6LsJyG7Uw9FSuqLgM6LnE9A+U7VbW9dVKgQkG
	72bd4i0wdPyvjKG6B7p9VYsiM3OOtj8hA+FdenGL5zolHHCmMQfWE51IC2eK/lJnEBia
	vzz2NzZlikdgmAljewo2xZ2S45IHV+ZLai0fYNKM6MzAwj99hX/yZ/jtgNFIQrho1LFr
	vcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vlgsXGCQ/iV6gAwOoqZdbuJ6zVrEBMD1hME19dHClPk=;
	b=GiBjFKUVbnwiVpfCSZqOOQTmfWAwBrHQgCEXOLKABMtshAXPf5ZkgvlXlRi/hua3Ma
	9Kbd/YNOmwcxOCHAm/Zf/x2BIqlf1gFPWmYkTS62Fqck3ttSGjYjryuD4IwYPbw4MV/W
	PPfcHfWLVyrmnprr9MUp+gir45quqVnNPKD3vE7dfi/I0VEQQbUceQgJ+Yw9WZxFEKQh
	ynRdHH+a/rTGOkN9LjFUX1nzSDkcyLyC4O6PBioMlewFifdrPYapL86jyDE/spWoR9NC
	RABkT0WrHiSclj/Sem9ES27HAoQIhFxxpho9OvoHlRytMGpWvih32wnUpWclwaEWWMg/
	ANmw==
X-Gm-Message-State: AIVw113+EmSRYZrCIX9W+nL6bDDN+W8KqGhNJvV+9WML1YJEwjZpBLb2
	BG3+wh7bj/+Itxwrl8KZZdvXAvLDGA==
X-Received: by 10.159.48.16 with SMTP id h16mr1929341uab.102.1499825258766;
	Tue, 11 Jul 2017 19:07:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.78.91 with HTTP; Tue, 11 Jul 2017 19:07:38 -0700 (PDT)
In-Reply-To: <18D3A338-C9CF-4313-A570-DB325E456160@linux.intel.com>
References: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
	<1499791478-2407-4-git-send-email-liu.ming50@gmail.com>
	<18D3A338-C9CF-4313-A570-DB325E456160@linux.intel.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Wed, 12 Jul 2017 04:07:38 +0200
Message-ID: <CALatG=4gZNNnL66_8zepakvwvy2J9snr2k3Y0hiYQNAoSFM_Ew@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe/meta-perl] [PATCH 3/8] libterm-readkey-perl: add recipe
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
X-List-Received-Date: Wed, 12 Jul 2017 02:07:38 -0000
Content-Type: text/plain; charset="UTF-8"

Hi, Tim:

po4a is providing some perl modules and also some normal binaries, and it's
named as "po4a" on debian/ubuntu distributions as well, that's why I did
not take po4a-perl as its name, shouldn't we let it have a identical name
as debian distributions have, to follow debian naming?

the best,
thank you

2017-07-12 0:34 GMT+02:00 Tim Orling <timothy.t.orling@linux.intel.com>:

> The original po4a recipe should have been named libpo4a-perl, to follow
> Debian naming. Notice that every other perl module you have in DEPENDS or
> RRECOMMENDS __are__ following Debian naming. Please help us keep the
> metadata consistent in the meta-perl layer. Thank you.
>
> See 4.2 in:
> https://www.debian.org/doc/packaging-manuals/perl-policy/
> ch-module_packages.html
>
>
> > On Jul 11, 2017, at 9:44 AM, liu.ming50@gmail.com wrote:
> >
> > From: Ming Liu <peter.x.liu@external.atlascopco.com>
> >
> > Term::ReadKey - A perl module for simple terminal control.
> >
> > It's being strongly recommended by po4a.
> >
> > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> > ---
> > .../libterm/libterm-readkey-perl_2.37.bb           | 36
> ++++++++++++++++++++++
> > 1 file changed, 36 insertions(+)
> > create mode 100644 meta-perl/recipes-perl/libterm/libterm-readkey-perl_
> 2.37.bb
> >
> > diff --git a/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
> b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
> > new file mode 100644
> > index 0000000..6b76682
> > --- /dev/null
> > +++ b/meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.37.bb
> > @@ -0,0 +1,36 @@
> > +SUMMARY = "Term::ReadKey - A perl module for simple terminal control."
> > +DESCRIPTION = "Term::ReadKey is a compiled perl module dedicated to
> providing simple \
> > +control over terminal driver modes (cbreak, raw, cooked, etc.,) support
> \
> > +for non-blocking reads, if the architecture allows, and some
> generalized \
> > +handy functions for working with terminals. One of the main goals is to
> \
> > +have the functions as portable as possible, so you can just plug in
> "use \
> > +Term::ReadKey" on any architecture and have a good likelihood of it \
> > +working."
> > +HOMEPAGE = "http://search.cpan.org/~jstowe/TermReadKey-${PV}"
> > +SECTION = "libraries"
> > +
> > +LICENSE = "Artistic-1.0 | GPLv1+"
> > +LIC_FILES_CHKSUM = "file://README;md5=c275db663c8489a5709ebb22b185add5"
> > +
> > +SRC_URI = "${CPAN_MIRROR}/authors/id/J/JS/JSTOWE/TermReadKey-${PV}.
> tar.gz"
> > +
> > +SRC_URI[md5sum] = "e8ea15c16333ac4f8d146d702e83cc0c"
> > +SRC_URI[sha256sum] = "4a9383cf2e0e0194668fe2bd546e89
> 4ffad41d556b41d2f2f577c8db682db241"
> > +
> > +S = "${WORKDIR}/TermReadKey-${PV}"
> > +
> > +# It needs depend on native to let dynamic loader use native modules
> > +# rather than target ones.
> > +DEPENDS = "libterm-readkey-perl-native"
> > +
> > +inherit cpan
> > +
> > +do_configure_append () {
> > +    # Hack the dynamic module loader so that it use native modules
> since it can't load
> > +    # the target ones.
> > +    if [ "${BUILD_SYS}" != "${HOST_SYS}" ]; then
> > +        sed -i -e "s#-I\$(INST_ARCHLIB)#-I${
> STAGING_BINDIR_NATIVE}/perl-native/perl/vendor_perl/${@get_perl_version(d)}#g"
> Makefile
> > +    fi
> > +}
> > +
> > +BBCLASSEXTEND = "native"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

