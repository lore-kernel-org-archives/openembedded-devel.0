Received: from [72.14.220.154] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <philipp.zabel@gmail.com>) id 1JNSHw-0003se-IG
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2008 13:25:04 +0100
Received: by fg-out-1718.google.com with SMTP id 22so3308881fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Feb 2008 04:25:15 -0800 (PST)
Received: by 10.82.116.15 with SMTP id o15mr22939385buc.3.1202473514683;
	Fri, 08 Feb 2008 04:25:14 -0800 (PST)
Received: by 10.82.118.18 with HTTP; Fri, 8 Feb 2008 04:25:14 -0800 (PST)
Message-ID: <74d0deb30802080425s7c69bf95y4725bb48bc9088f6@mail.gmail.com>
Date: Fri, 8 Feb 2008 13:25:14 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1JNHzO-0001Y7-HO@linuxtogo.org>
MIME-Version: 1.0
References: <E1JNHzO-0001Y7-HO@linuxtogo.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev mkbold-mkitalic-native: initial commit. partly closes 1362 (incorporate stuff from openzaurus-ja project)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2008 12:25:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I think this should not live in xorg-app but in its own directory.
xorg-app is meant to
contain the X.org applications from
http://xorg.freedesktop.org/archive/individual/app.

regards
Philipp

On Feb 8, 2008 2:25 AM, Laibsch commit
<openembedded-commits@lists.openembedded.org> wrote:
> mkbold-mkitalic-native: initial commit.  partly closes 1362 (incorporate stuff from openzaurus-ja project)
>
> Author: Laibsch@openembedded.org
> Branch: org.openembedded.dev
> Revision: 452a82218384d46f3ac39581fe8409623ec425a1
> ViewMTN: http://monotone.openembedded.org/revision/info/452a82218384d46f3ac39581fe8409623ec425a1
> Files:
> 1
> packages/xorg-app/mkbold-mkitalic-native
> packages/xorg-app/mkbold-mkitalic-native/makebifonts
> packages/xorg-app/mkbold-mkitalic-native_0.11.bb
> MAINTAINERS
> Diffs:
>
> #
> # mt diff -rc16a7c07dd072a99d1ed6c919f9148f89d806120 -r452a82218384d46f3ac39581fe8409623ec425a1
> #
> #
> #
> # add_dir "packages/xorg-app/mkbold-mkitalic-native"
> #
> # add_file "packages/xorg-app/mkbold-mkitalic-native/makebifonts"
> #  content [7a8ebd352640695cd996b481d7454b0ea18e8ba3]
> #
> # add_file "packages/xorg-app/mkbold-mkitalic-native_0.11.bb"
> #  content [b1aea18de213f27a02dd941931cb2b273cdc0922]
> #
> # patch "MAINTAINERS"
> #  from [2d658538b876a6f91e54cd29e826ef15185add02]
> #    to [155ffaa8b1c7c3d0b95f6e30e55feaa7f3530a0f]
> #
> ============================================================
> --- packages/xorg-app/mkbold-mkitalic-native/makebifonts        7a8ebd352640695cd996b481d7454b0ea18e8ba3
> +++ packages/xorg-app/mkbold-mkitalic-native/makebifonts        7a8ebd352640695cd996b481d7454b0ea18e8ba3
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +cat $1.bdf | bdftopcf | gzip -c -3 > $2/$3.pcf.gz
> +cat $1.bdf | mkbold | bdftopcf | gzip -c -3 > $2/$3_b.pcf.gz
> +cat $1.bdf | mkitalic | bdftopcf | gzip -c -3 > $2/$3_i.pcf.gz
> +cat $1.bdf | mkbolditalic | bdftopcf | gzip -c -3 > $2/$3_bi.pcf.gz
> ============================================================
> --- packages/xorg-app/mkbold-mkitalic-native_0.11.bb    b1aea18de213f27a02dd941931cb2b273cdc0922
> +++ packages/xorg-app/mkbold-mkitalic-native_0.11.bb    b1aea18de213f27a02dd941931cb2b273cdc0922
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "mkbold-mkitalic : make bold and italic fonts from normal fonts"
> +HOMEPAGE = "http://hp.vector.co.jp/authors/VA013651/freeSoftware/mkbold-mkitalic.html"
> +PRIORITY = "optional"
> +LICENSE = "MIT/X"
> +PR = "r2"
> +
> +SRC_URI = "http://hp.vector.co.jp/authors/VA013651/lib/mkbold-mkitalic-${PV}.tar.bz2 \
> +           file://makebifonts"
> +
> +S = "${WORKDIR}/mkbold-mkitalic-${PV}"
> +
> +inherit native
> +
> +do_stage() {
> +       install -d ${STAGING_DIR}/${BUILD_ARCH}-${BUILD_OS}/bin
> +       install -m 755 mkbold ${STAGING_DIR}/${BUILD_ARCH}-${BUILD_OS}/bin/
> +       install -m 755 mkitalic ${STAGING_DIR}/${BUILD_ARCH}-${BUILD_OS}/bin/
> +       install -m 755 mkbolditalic ${STAGING_DIR}/${BUILD_ARCH}-${BUILD_OS}/bin/
> +       install -m 755 ${WORKDIR}/makebifonts ${STAGING_DIR}/${BUILD_ARCH}-${BUILD_OS}/bin/
> +}
> +
> ============================================================
> --- MAINTAINERS 2d658538b876a6f91e54cd29e826ef15185add02
> +++ MAINTAINERS 155ffaa8b1c7c3d0b95f6e30e55feaa7f3530a0f
> @@ -229,6 +229,10 @@ Recipes:    icecc.bbclass, ppc toolchain
>  Interest:   Cross-machine development
>  Recipes:    icecc.bbclass, ppc toolchain, asterisk,perl,php
>
> +Person:     Takashi Nemoto
> +Mail:       tnemoto@sourceforge.jp
> +Recipes:    mkbold-mkitalic
> +
>  Person:     Tim Sander
>  Mail:       oe@iss.tu-darmstadt.de
>  Receipes:   fxload
>
>
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>


