Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f45.google.com (mail-pl0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1878878449
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 05:33:03 +0000 (UTC)
Received: by mail-pl0-f45.google.com with SMTP id 93-v6so898874plc.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 21:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=ZwzT+EzOuX/JAMJbjUuPW7Nsk3Js+bdLP30tzrHb1Lc=;
	b=UpyE2yTPzNRhtzzmYsuaz2p+E5cLnrxd2TWBXpeYG4KjRDlCCUoNvrWhZ6dmn+BDN6
	YvZz/pwBTy0Tuf8egYfNq5jPcRifrawyqCz5UsAy6eDcPc5kKYxG7xPDMcZXvieb3v7h
	2bmgNwLh3lcGvs4bHF0WLtGrcwL8j8i1NApyk16+W5WFuC2usk5OWRB0d957S3oN0/Qn
	7MIxn9n93cRnBdV7dA1ZhICtH1JpNIT1ym+eTWKg9gbb0FtSBo/oj5SmDfOFdB9Bk6M6
	4aukIhqZDQacYovb+l6t9VwNF1L0uUTB/mvM1Cge4vMuNqARMCZU1/foBW37ras/sf3v
	KboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ZwzT+EzOuX/JAMJbjUuPW7Nsk3Js+bdLP30tzrHb1Lc=;
	b=TW9JFdMS4cEzHHENGfo7qR5UmHs7imQFHB2DR4Zsry6h9Y3Z6uM+J55kgzlj38JuZR
	j1koUGYxD6gr8J4sUiwhg05uy1MNYXrmJo8tGYelzMw3cdN+/g10Z+NT44vgLdiikDfz
	eroLXTuPCTvCvCQJrTOmYGNj1O262UFeZC/hZXrGOG9jUJNCkLLuhbHEMpOm90HWD1UG
	wrelKMjEeAfFBUOxOM+N9btqt5rVIeq7jYAnhNJWQDJYS50KAxC5Mm9g2XX5eBsqEFLw
	Eu+5gNUsa9lA91X8r1gvc6VWk+arpHHgTLDm+yiItZe3aV2t8dcdwoenZULhvgh2lwbx
	Nacg==
X-Gm-Message-State: APf1xPCL0/0vOULafP0fgG8R0z0dzI2f6p+/+XD1Osk1qbBSrJkJrOxy
	3ixh/cJlOEwFp2N2L+zsW+z2JQ==
X-Google-Smtp-Source: AH8x2258nIEMFc3Vdtm1w0lnnrMgVBa9x2Sqtgn80WjNei9zmTHUfGb3mGSWhm1EyufeF9fPtHlw6Q==
X-Received: by 2002:a17:902:64d7:: with SMTP id
	y23-v6mr16660134pli.258.1519795984953; 
	Tue, 27 Feb 2018 21:33:04 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:b885:642e:b8e3:aa2c?
	([2601:202:4000:1184:b885:642e:b8e3:aa2c])
	by smtp.gmail.com with ESMTPSA id
	y84sm1341529pff.81.2018.02.27.21.33.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 21:33:04 -0800 (PST)
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>,
	openembedded-devel@lists.openembedded.org
References: <20180227172450.25507-1-sebastian.reichel@collabora.co.uk>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5b5750a8-7894-ae5b-5b2a-1800e9270cb5@gmail.com>
Date: Tue, 27 Feb 2018 21:33:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180227172450.25507-1-sebastian.reichel@collabora.co.uk>
Subject: Re: [meta-oe][PATCH] fvwm: add new recipe
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
X-List-Received-Date: Wed, 28 Feb 2018 05:33:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 02/27/2018 09:24 AM, Sebastian Reichel wrote:
> Add recipe for a minimal built of fvwm.
>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> ---
>  .../0001-Fix-compilation-for-disabled-gnome.patch  |  67 ++++++++++++
>  .../fvwm/fvwm/0002-Avoid-absolute-symlinks.patch   |  26 +++++
>  meta-oe/recipes-graphics/fvwm/fvwm_2.6.7.bb        | 112 +++++++++++++++++++++
>  3 files changed, 205 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch
>  create mode 100644 meta-oe/recipes-graphics/fvwm/fvwm/0002-Avoid-absolute-symlinks.patch
>  create mode 100644 meta-oe/recipes-graphics/fvwm/fvwm_2.6.7.bb
>
> diff --git a/meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch b/meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch
> new file mode 100644
> index 000000000000..97d6bc1b7ab6
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/fvwm/fvwm/0001-Fix-compilation-for-disabled-gnome.patch
> @@ -0,0 +1,67 @@
> +From 60c17eb49121bf2aa485acd30750b2fc6c8eb61f Mon Sep 17 00:00:00 2001
> +From: Jarmo Jaakkola <jarmo.jaakkola@vincit.fi>
> +Date: Mon, 19 Jun 2017 16:41:36 +0300
> +Subject: [PATCH] Fix compilation for Helix.
> +
> +Gnome support, including GNOME_INIT_HOOK, has been removed, but it was
> +still being called.
> +
> +COMPAT_OLD_KEYSYMDEF is a check for a legacy system, which our system
> +most definitely is not.  It is accomplished by trying to execute
> +a program, which does not work when cross compiling.
> +
> +The fvwm(1) man page is created from Docbook XML which is set for
> +a Windows code page that is not available when compiling.  Easiest is
> +to just not create the man page as those are not needed on the monitor.
> +
> +Signed-off-by: Jarmo Jaakkola <jarmo.jaakkola@vincit.fi>
> +Signed-off-by: Riku Hämäläinen <riku.hamalainen@ge.com>

Missing Upstream-Status and signed-off-by

> +---
> + configure.ac         | 20 ++++----------------
> + doc/fvwm/Makefile.am |  2 +-
> + 3 files changed, 7 insertions(+), 17 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 48ce264..fab7b44 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1413,23 +1413,7 @@ else
> +   problem_gdkimlib=": Failed on gdk-imlib, see config.log"
> + fi
> + 
> +-GNOME_INIT_HOOK
> +-
> +-# Unfortunately we have 2 gnome supports: WM hints and gnome libs.
> +-# The $with_gnomehints below refers to the first, not GNOME_INIT_HOOK.
> +-if test ! x"$enable_gnome_hints" = xno; then
> +-  with_gnomehints=yes
> +-  problem_gnomehints=""
> +-else
> +-  with_gnomehints=no
> +-  problem_gnomehints=": Explicitly disabled"
> +-fi
> +-
> + # Define some compatibility macros needed for config.h.
> +-mg_DEFINE_IF_NOT([#include <X11/keysym.h>],
> +-  [defined XK_Page_Up && defined XK_Page_Down],
> +-  [COMPAT_OLD_KEYSYMDEF], [$X_CFLAGS],
> +-  [Old AIX systems (3.2.5) don't define some common keysyms.])
> + AH_VERBATIM([_COMPAT_OLD_KEYSYMDEF],
> + [#ifdef COMPAT_OLD_KEYSYMDEF
> + #  define XK_Page_Up   XK_Prior
> +diff --git a/doc/fvwm/Makefile.am b/doc/fvwm/Makefile.am
> +index cddb102..ff00149 100755
> +--- a/doc/fvwm/Makefile.am
> ++++ b/doc/fvwm/Makefile.am
> +@@ -10,7 +10,7 @@ XSL_PROFILE = $(srcdir)/../docbook-xsl/profiling/profile.xsl
> + HTML_FILES = fvwm.man.html
> + XML_FILES = @DOC_SECTIONS_XML_PATH@
> + EXTRA_DIST = @DOC_SECTIONS_XML@ $(man_MANS) sections
> +-man_MANS = fvwm.1
> ++man_MANS =
> + 
> + if FVWM_BUILD_HTMLDOC
> + doc_DATA = $(HTML_FILES)
> +-- 
> +1.9.1
> +
> diff --git a/meta-oe/recipes-graphics/fvwm/fvwm/0002-Avoid-absolute-symlinks.patch b/meta-oe/recipes-graphics/fvwm/fvwm/0002-Avoid-absolute-symlinks.patch
> new file mode 100644
> index 000000000000..2a5a6a90b70c
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/fvwm/fvwm/0002-Avoid-absolute-symlinks.patch
> @@ -0,0 +1,26 @@
> +From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> +Date: Tue, 29 Auf 2017 16:08:42 +0200
> +Subject: [PATCH] Avoid absolute symlinks
> +
> +Avoid usage of absolute symlinks, which breaks yocto builds
> +with pyro branch.
Why is Pyro noted here?

Missing Upstream-Status:
> +
> +Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> +
> +diff --git a/default-config/Makefile.am b/default-config/Makefile.am
> +index 5e16d095a137..5404145a742c 100644
> +--- a/default-config/Makefile.am
> ++++ b/default-config/Makefile.am
> +@@ -17,9 +17,9 @@ EXTRA_DIST  = images \
> + 
> + install-data-hook:
> + 	cp -r $(srcdir)/images $(inst_location)
> +-	ln -sf $(inst_location)/FvwmScript-DateTime $(inst_location)/..
> +-	ln -sf $(inst_location)/FvwmScript-ConfirmQuit $(inst_location)/..
> +-	ln -sf $(inst_location)/FvwmScript-ConfirmCopyConfig $(inst_location)/..
> ++	ln -sf default-config/FvwmScript-DateTime $(inst_location)/..
> ++	ln -sf default-config/FvwmScript-ConfirmQuit $(inst_location)/..
> ++	ln -sf default-config/FvwmScript-ConfirmCopyConfig $(inst_location)/..
> + 
> + uninstall-hook:
> + 	rm -fr $(DESTDIR)/$(configdir)
> diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.7.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.7.bb
> new file mode 100644
> index 000000000000..822411aeff5e
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.7.bb

please take a look at https://www.openembedded.org/wiki/Styleguide

thanks,
Armin
> @@ -0,0 +1,112 @@
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=363fbcfb59124689af72c914560eaf6e"
> +
> +SRC_URI = "\
> +    git://github.com/fvwmorg/fvwm.git;protocol=https \
> +    file://0001-Fix-compilation-for-disabled-gnome.patch \
> +    file://0002-Avoid-absolute-symlinks.patch \
> +"
> +
> +# Modify these as desired
> +PV = "2.6.7+git${SRCPV}"
> +SRCREV = "597a4e296da4f21e71a17facab297e016a3a80a8"
> +
> +S = "${WORKDIR}/git"
> +
> +# NOTE: the following prog dependencies are unknown, ignoring: imlib-config fribidi-config fontconfig-config xft-config cpp gmsgfmt
> +# NOTE: the following library dependencies are unknown, ignoring: ifelse($2 dmalloc efence xpg4 fribidi intl
> +#       (this is based on recipes that have previously been built and packaged)
> +DEPENDS = "\
> +    bison-native \
> +    flex-native \
> +    freetype-native \
> +    gettext-native \
> +    libxslt-native \
> +\
> +    fontconfig \
> +    libice \
> +    libpng \
> +    librsvg \
> +    libsm \
> +    libxau \
> +    libxcb \
> +    libxcursor \
> +    libxdmcp \
> +    libxext \
> +    libxfixes \
> +    libxft \
> +    libxinerama \
> +    libxml2 \
> +    libxrender \
> +    libxt \
> +    virtual/libx11 \
> +    xrandr \
> +    zlib \
> +"
> +
> +RDEPENDS_${PN} = "\
> +    xuser-account \
> +"
> +
> +inherit pythonnative gettext pkgconfig perlnative autotools
> +
> +EXTRA_OECONF = "\
> +    --disable-bidi \
> +    --disable-fontconfigtest \
> +    --disable-freetypetest \
> +    --disable-htmldoc \
> +    --disable-imlibtest \
> +    --disable-mandoc \
> +    --disable-nls \
> +    --disable-perllib \
> +    --disable-rsvg \
> +    --disable-shape \
> +    --disable-sm \
> +    --disable-xfttest \
> +\
> +    --with-imlib-exec-prefix=/nonexistent \
> +    --with-imlib-prefix=/nonexistent \
> +\
> +    --without-ncurses-library \
> +    --without-readline-library \
> +    --without-rplay-library \
> +    --without-stroke-library \
> +    --without-termcap-library \
> +    --without-xpm-library \
> +\
> +    ac_cv_func_mkstemp=no \
> +    has_safety_mkstemp=yes \
> +"
> +
> +# show the exact commands in the log file
> +EXTRA_OEMAKE = "\
> +    V=1 \
> +"
> +
> +# the only needed packages (note: locale packages are automatically generated
> +# as well)
> +PACKAGES = "\
> +    fvwm \
> +    fvwm-dbg \
> +"
> +
> +# minimal set of binaries
> +FILES_${PN} = "\
> +    ${bindir}/fvwm \
> +    ${bindir}/fvwm-root \
> +    ${datadir}/fvwm/ConfigFvwmDefaults \
> +"
> +
> +# by default a lot of stuff is installed and it's not easy to control what to
> +# install, so install everything, but skip the check
> +INSANE_SKIP_${PN} = "\
> +    installed-vs-shipped \
> +"
> +
> +do_install_append() {
> +    install -d -m 0755 ${D}/${sysconfdir}/xdg/fvwm
> +	# You can install the config file here
> +
> +    install -d -m 0755 ${D}/${datadir}/fvwm
> +    touch ${D}/${datadir}/fvwm/ConfigFvwmDefaults
> +}


