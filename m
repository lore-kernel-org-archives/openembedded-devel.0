Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.144191.1598049731729746781
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 15:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: aehs29@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id m22so3534630ljj.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 15:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xAwSUM+6JLV9aOanvm7wAyIM995RJTRnhPKhjzcNGJs=;
        b=X68d0Bf2cRxcopu112GRpQ+yv2XZNhsvAnZms/hCu5RXdfD6f46PH2cQFzBMGeYxev
         /9uNcihMtzZD13p+ZEIEzI9KQPMB4AneAkZ5w/z7G5o07rmtS6n+2YigDeozFlbSops3
         0eEgeqbkBj3qJJSTkcBYOrAabhZPvLAOhVLtcbfXHY6eTFI0H6rQQgC1iZs5tjUkqqfP
         xXzz2iAnO6M075rgM9yjpM9R9SWkhRAt0lvWHtlf99H0iGVnRf6TVZ3/HfgaHSxvLIE2
         yoRAF3C0Vt47IwhPSisO5nZtEvl2wwVjqL2HcIoKNrZo9LhDuM2R7h8BqL49HmDTGJxq
         vFyg==
X-Gm-Message-State: AOAM532ahsGOF2xPz77MF/3zeCc8/ISjbr8gi3iwXSCl2e5XNdTTHI2D
	U074wjAPnDLj/Jd6SUZlOIESbf/2U91jAg==
X-Google-Smtp-Source: ABdhPJxLJwi+9Up+0HtRCt2vm64LLeFMWQQxpZtKjLFBVquUt7BqWNipzNxaVikqU3XGCIpUzWo0Pg==
X-Received: by 2002:a2e:b81a:: with SMTP id u26mr2637825ljo.241.1598049729272;
        Fri, 21 Aug 2020 15:42:09 -0700 (PDT)
Return-Path: <aehs29@gmail.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id t27sm635475ljd.101.2020.08.21.15.42.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 15:42:09 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id v4so3559680ljd.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 15:42:08 -0700 (PDT)
X-Received: by 2002:a2e:8648:: with SMTP id i8mr2644593ljj.288.1598049728516;
 Fri, 21 Aug 2020 15:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200821072620.6328-1-alejandro@enedino.org> <7adabc21-208c-e57e-0001-9a8b927c5d5e@gmail.com>
In-Reply-To: <7adabc21-208c-e57e-0001-9a8b927c5d5e@gmail.com>
From: "Alejandro Hernandez Samaniego" <alejandro@enedino.org>
Date: Fri, 21 Aug 2020 16:41:54 -0600
X-Gmail-Original-Message-ID: <CAHMutracSuH7X7E_T-hgxJS-=q3Hd4kk-Mk=vXwn-6WAxgJh8g@mail.gmail.com>
Message-ID: <CAHMutracSuH7X7E_T-hgxJS-=q3Hd4kk-Mk=vXwn-6WAxgJh8g@mail.gmail.com>
Subject: Re: [oe] [PATCH] emacs: Create a new recipe for emacs
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000066da2205ad6af227"

--00000000000066da2205ad6af227
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

On Fri, Aug 21, 2020, 2:25 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 8/21/20 12:26 AM, Alejandro Hernandez Samaniego wrote:
> > Emacs is for obvious reasons one of the most important
> > and powerful editors, being the first program released
> > by the GNU project and being maintained for many years.
> >
> > Its not the obvious choice when being used on a small
> > or resource constrained device, but, on this recipe
> > I was able to split it into three different packages
> > to fit different needs for those who decide to use it,
> > the emacs-minimal package would install a working emacs
> > requiring around 2 MB of storage space, the emacs-base
> > package includes some themes, syntax highlighting for
> > some of the most used programming languages, as well
> > as some extra functionality like a working shell,
> > requiring less than 5 MB, which should work for a wide
> > spectrum of workflows, and lasty, the emacs-full
> > package contains the a fully working emacs using around
> > 30 MB of space trading off size for functionality.
> >
> > This recipe also uses BBCLASSEXTEND=native to build some
> > tools that emacs itself requires to build for target,
> > but does not built a full native emacs since that is not
> > necessary.
> >
> > Simply installing emacs will use the emacs-base package
> > as default.
> >
> > Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
> > ---
> >   meta-oe/recipes-support/emacs/emacs_27.1.bb   | 260 ++++++++++++++++++
> >   .../emacs/files/usemake-docfile-native.patch  |  85 ++++++
> >   2 files changed, 345 insertions(+)
> >   create mode 100644 meta-oe/recipes-support/emacs/emacs_27.1.bb
> >   create mode 100644
> meta-oe/recipes-support/emacs/files/usemake-docfile-native.patch
> >
> > diff --git a/meta-oe/recipes-support/emacs/emacs_27.1.bb
> b/meta-oe/recipes-support/emacs/emacs_27.1.bb
> > new file mode 100644
> > index 000000000..67a395503
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/emacs/emacs_27.1.bb
> > @@ -0,0 +1,260 @@
> > +SUMMARY = "Emacs is the extensible, customizable, self-documenting
> real-time display editor"
> > +HOMEPAGE = "https://www.gnu.org/software/emacs/"
> > +
> > +LICENSE = "GPLv3"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
> > +
> > +SRC_URI = "https://ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz"
> > +
> > +SRC_URI_append_class-target = " file://usemake-docfile-native.patch"
> > +
> > +SRC_URI[sha256sum] =
> "4a4c128f915fc937d61edfc273c98106711b540c9be3cd5d2e2b9b5b2f172e41"
> > +
> > +PACKAGECONFIG[gnutls] = "--with-gnutls=yes,--with-gnutls=no,gnutls"
> > +PACKAGECONFIG[kerberos] = "--with-kerberos=yes,--with-kerberos=no,krb5"
> > +PACKAGECONFIG[libgmp] = "--with-libgmp=yes,--with-libgmp=no,gmp"
> > +
> > +PACKAGECONFIG = "gnutls kerberos libgmp"
>
> should this be ?= here perhaps ?
>

Yes it should

> +
> > +# We could use --without-all but its better to
> > +# split it into several packages (size of minimal doesnt change)
> > +EXTRA_OECONF = " --with-x=no --with-dumping=none"
> > +
> > +DEPENDS = "ncurses"
> > +DEPENDS_append_class-target = " emacs-native"
> > +
> > +inherit autotools mime-xdg
> > +
> > +
> > +# The following does NOT build a native emacs.
> > +# It only builds some parts of it that are
> > +# required to by the build for target emacs.
> > +BBCLASSEXTEND = "native"
>
> move this extend to end.
>

Will do, I'll send v2

>
> > +
> > +do_compile_class-native (){
> > +    cd ${B}/lib-src
> > +    oe_runmake make-docfile
> > +    oe_runmake make-fingerprint
> > +}
> > +do_install_class-native(){
> > +    install -d ${D}${bindir}
> > +    install -m 755 ${B}/lib-src/make-docfile ${D}/${bindir}/
> > +    install -m 755 ${B}/lib-src/make-fingerprint ${D}/${bindir}/
> > +}
> > +
> > +
> > +do_install_append(){
> > +    # Delete systemd stuff, extend using DISTRO_FEATURES?
> > +    rm -rf ${D}/${libdir}
> > +    # Extra stuff which isnt needed
> > +    rm -rf ${D}/${datadir}/metainfo
> > +    rm -rf ${D}/${datadir}/info
> > +    # Emacs copies files to ${D} while building, which were unpacked
> > +    # by a different user, we need to restore those
> > +    chown -R root:root ${D}${datadir}
> > +}
> > +
> > +
> > +# Use a similar strategy to how we build python:
> > +# Create three packages
> > +# minimal - A working lisp based text editor
> > +# base - What would probably work for most
> > +# full - A fully working emacs
> > +# The lists of files are long but are worth it
> > +# Installing "emacs" installs the base package
> > +PACKAGE_BEFORE_PN = "${PN}-minimal ${PN}-base ${PN}-full"
> > +RPROVIDES_${PN}-base = "${PN}"
> > +RDEPENDS_${PN}-base_class-target = "${PN}-minimal"
> > +RDEPENDS_${PN}-full_class-target = "${PN}"
> > +
> > +
> > +# A minimal version of emacs that works
> > +FILES_${PN}-minimal = " \
> > +    ${datadir}/${BPN}/${PV}/lisp/loadup.el \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/byte-run.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/backquote.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/subr.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/version.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/widget.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/custom.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/map-ynp.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/international/mule.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/international/mule-conf.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/env.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/format.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/bindings.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/window.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/files.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/macroexp.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/cus-face.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/faces.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/button.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/loaddefs.el \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/nadvice.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-preloaded.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/obarray.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/abbrev.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/simple.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/jka-cmpr-hook.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/epa-hook.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/international/mule-cmds.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/case-table.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/international/charprop.el \
> > +    ${datadir}/${BPN}/${PV}/lisp/international/characters.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/international/charscript.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/composite.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/chinese.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/cyrillic.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/indian.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/sinhala.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/english.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/ethiopic.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/european.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/czech.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/slovak.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/romanian.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/greek.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/hebrew.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/international/cp51932.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/international/eucjp-ms.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/japanese.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/korean.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/lao.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/tai-viet.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/thai.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/tibetan.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/vietnamese.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/misc-lang.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/utf-8-lang.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/georgian.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/khmer.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/burmese.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/language/cham.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/indent.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-generic.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/minibuffer.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/frame.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/startup.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/term/tty-colors.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/font-core.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/facemenu.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/syntax.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/font-lock.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/jit-lock.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/mouse.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/select.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/timer.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/isearch.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/rfn-eshadow.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/menu-bar.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/tab-bar.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/lisp.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/textmodes/page.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/register.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/textmodes/paragraphs.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/prog-mode.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/lisp-mode.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/elisp-mode.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/textmodes/text-mode.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/textmodes/fill.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/newcomment.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/replace.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/tabulated-list.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/buff-menu.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/float-sup.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/vc/vc-hooks.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/vc/ediff-hook.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/uniquify.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/electric.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/eldoc.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/cus-start.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/tooltip.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/simple.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/regexp-opt.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/term/xterm.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/bytecomp.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cconv.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/gv.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/byte-opt.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/image.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/ldefs-boot.el \
> > +    ${datadir}/${BPN}/${PV}/lisp/help.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/international/uni*.el \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/vc/warnings.elc \
> > +    ${datadir}/${BPN}/${PV}/etc/charsets/ \
> > +    ${bindir}/emacs* \
> > +    ${prefix}/libexec \
> > +"
> > +
> > +
> > +# What works for "most" is relative, but this can be easily extended if
> needed
> > +FILES_${PN}-base = " \
> > +    ${datadir}/${BPN}/${PV}/etc/srecode \
> > +    ${datadir}/${BPN}/${PV}/etc/e \
> > +    ${datadir}/${BPN}/${PV}/etc/forms \
> > +    ${datadir}/${BPN}/${PV}/lisp/cedet \
> > +    ${datadir}/${BPN}/${PV}/site-lisp/ \
> > +    ${datadir}/${BPN}/${PV}/lisp/subdirs.el \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-mode.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-defs.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-vars.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-engine.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-styles.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-fonts.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-cmds.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-align.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-menus.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-guess.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-lib.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-macs.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/pcase.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/inline.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-seq.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/easymenu.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/python* \
> > +    ${datadir}/${BPN}/${PV}/lisp/ansi-color.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/comint.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/ring.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/json.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/map.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/seq.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/subr-x.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/seq.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/net/tramp-sh.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/net/tramp.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/net/tramp-compat.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/auth-source.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/password-cache.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/eieio.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/eieio-core.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/format-spec.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/ls-lisp.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/calendar/parse-time.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/calendar/iso8601.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/calendar/time-date.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/shell.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/pcomplete.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/net/tramp-integration.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/files-x.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/net/trampver.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/net/tramp-loaddefs.el \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/*perl* \
> > +    ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/smie.elc \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/*asm* \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/cpp* \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/make* \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/sh-script* \
> > +    ${datadir}/${BPN}/${PV}/etc/themes/adwaita-theme.el \
> > +    ${datadir}/${BPN}/${PV}/etc/themes/wheatgrass-theme.el \
> > +    ${datadir}/${BPN}/${PV}/etc/themes/deeper-blue-theme.el \
> > +    ${datadir}/${BPN}/${PV}/etc/themes/light-blue-theme.el \
> > +    ${datadir}/${BPN}/${PV}/etc/themes/misterioso-theme.el \
> > +    ${datadir}/${BPN}/${PV}/etc/themes/tango-theme.el \
> > +    ${datadir}/${BPN}/${PV}/etc/themes/wombat-theme.el \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/prog* \
> > +    ${datadir}/${BPN}/${PV}/lisp/progmodes/executable* \
> > +"
> > +
> > +# Restore FILES for the full package to catch everything left
> > +FILES_${PN}-full = "${FILES_${PN}}"
> > +FILES_${PN}-full_append = " ${datadir}/icons"
> > diff --git
> a/meta-oe/recipes-support/emacs/files/usemake-docfile-native.patch
> b/meta-oe/recipes-support/emacs/files/usemake-docfile-native.patch
> > new file mode 100644
> > index 000000000..cc0b05c79
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/emacs/files/usemake-docfile-native.patch
> > @@ -0,0 +1,85 @@
> > +Upstream-Status: Inappropriate  [OE-Specific]
> > +
> > +When building emacs, it builds some tools for the HOST
> > +that are then used to build for target, such as
> > +make-fingerprint and make-docfile, this needs to be
> > +adapted to be used by bitbake, otherwise the compiled
> > +executables arent compatible with the HOST.
> > +
> > +Use the above mentioned tools provided by the native
> > +version of the recipe instead.
> > +
> > +Signed-off-by: Alejandro Enedino Hernandez Samaniego <
> alejandro@enedino.org>
> > +
> > +Index: emacs-27.1/src/Makefile.in
> > +===================================================================
> > +--- emacs-27.1.orig/src/Makefile.in
> > ++++ emacs-27.1/src/Makefile.in
> > +@@ -472,7 +472,7 @@ ifeq ($(CHECK_STRUCTS),true)
> > + pdumper.o: dmpstruct.h
> > + endif
> > + dmpstruct.h: $(srcdir)/dmpstruct.awk
> > +-dmpstruct.h: $(libsrc)/make-fingerprint$(EXEEXT) $(dmpstruct_headers)
> > ++dmpstruct.h:  $(dmpstruct_headers)
> > +     $(AM_V_GEN)POSIXLY_CORRECT=1 awk -f $(srcdir)/dmpstruct.awk \
> > +             $(dmpstruct_headers) > $@
> > +
> > +@@ -566,8 +566,7 @@ ${lispintdir}/characters.elc: ${charscri
> > + ## Strictly speaking, emacs does not depend directly on all of $lisp,
> > + ## since not all pieces are used on all platforms.  But DOC depends
> > + ## on all of $lisp, and emacs depends on DOC, so it is ok to use $lisp
> here.
> > +-emacs$(EXEEXT): temacs$(EXEEXT) \
> > +-                lisp.mk $(etc)/DOC $(lisp) \
> > ++emacs$(EXEEXT): lisp.mk $(etc)/DOC $(lisp) \
> > +                 $(lispsource)/international/charprop.el ${charsets}
> > + ifeq ($(DUMPING),unexec)
> > +     LC_ALL=C $(RUN_TEMACS) -batch $(BUILD_DETAILS) -l loadup
> --temacs=dump
> > +@@ -596,15 +595,15 @@ endif
> > + ## for the first time, this prevents any variation between
> configurations
> > + ## in the contents of the DOC file.
> > + ##
> > +-$(etc)/DOC: lisp.mk $(libsrc)/make-docfile$(EXEEXT) $(obj) $(lisp)
> > ++$(etc)/DOC: lisp.mk $(obj) $(lisp)
> > +     $(AM_V_GEN)$(MKDIR_P) $(etc)
> > +     $(AM_V_at)rm -f $(etc)/DOC
> > +-    $(AM_V_at)$(libsrc)/make-docfile -d $(srcdir) \
> > ++    make-docfile -d $(srcdir) \
> > +       $(SOME_MACHINE_OBJECTS) $(obj) > $(etc)/DOC
> > +-    $(AM_V_at)$(libsrc)/make-docfile -a $(etc)/DOC -d $(lispsource) \
> > ++    make-docfile -a $(etc)/DOC -d $(lispsource) \
> > +       $(shortlisp)
> > +
> > +-$(libsrc)/make-docfile$(EXEEXT) $(libsrc)/make-fingerprint$(EXEEXT): \
> > ++$(libsrc)/make-fingerprint$(EXEEXT): \
> > +   $(lib)/libgnu.a
> > +     $(MAKE) -C $(dir $@) $(notdir $@)
> > +
> > +@@ -622,8 +621,8 @@ am__v_GLOBALS_ = $(am__v_GLOBALS_@AM_DEF
> > + am__v_GLOBALS_0 = @echo "  GEN     " globals.h;
> > + am__v_GLOBALS_1 =
> > +
> > +-gl-stamp: $(libsrc)/make-docfile$(EXEEXT) $(GLOBAL_SOURCES)
> > +-    $(AM_V_GLOBALS)$(libsrc)/make-docfile -d $(srcdir) -g $(obj) >
> globals.tmp
> > ++gl-stamp: $(GLOBAL_SOURCES)
> > ++    make-docfile -d $(srcdir) -g $(obj) > globals.tmp
> > +     $(AM_V_at)$(top_srcdir)/build-aux/move-if-change globals.tmp
> globals.h
> > +     $(AM_V_at)echo timestamp > $@
> > +
> > +@@ -637,7 +636,7 @@ $(LIBEGNU_ARCHIVE): $(config_h)
> > +     $(MAKE) -C $(dir $@) all
> > +
> > + ifeq ($(HAVE_PDUMPER),yes)
> > +-  MAKE_PDUMPER_FINGERPRINT = $(libsrc)/make-fingerprint$(EXEEXT)
> > ++  MAKE_PDUMPER_FINGERPRINT = make-fingerprint
> > + else
> > +   MAKE_PDUMPER_FINGERPRINT =
> > + endif
> > +@@ -647,7 +646,7 @@ endif
> > + ## This goes on to affect various things, and the emacs binary fails
> > + ## to start if Vinstallation_directory has the wrong value.
> > + temacs$(EXEEXT): $(LIBXMENU) $(ALLOBJS) $(LIBEGNU_ARCHIVE) $(EMACSRES)
> \
> > +-  $(charsets) $(charscript) $(MAKE_PDUMPER_FINGERPRINT)
> > ++  $(charsets) $(charscript)
> > +     $(AM_V_CCLD)$(CC) -o $@.tmp \
> > +       $(ALL_CFLAGS) $(TEMACS_LDFLAGS) $(LDFLAGS) \
> > +       $(ALLOBJS) $(LIBEGNU_ARCHIVE) $(W32_RES_LINK) $(LIBES)
> >
> >
> > 
> >
>

--00000000000066da2205ad6af227
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Khem,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Aug 21, 2020, 2:25 PM Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><br>
<br>
On 8/21/20 12:26 AM, Alejandro Hernandez Samaniego wrote:<br>
&gt; Emacs is for obvious reasons one of the most important<br>
&gt; and powerful editors, being the first program released<br>
&gt; by the GNU project and being maintained for many years.<br>
&gt; <br>
&gt; Its not the obvious choice when being used on a small<br>
&gt; or resource constrained device, but, on this recipe<br>
&gt; I was able to split it into three different packages<br>
&gt; to fit different needs for those who decide to use it,<br>
&gt; the emacs-minimal package would install a working emacs<br>
&gt; requiring around 2 MB of storage space, the emacs-base<br>
&gt; package includes some themes, syntax highlighting for<br>
&gt; some of the most used programming languages, as well<br>
&gt; as some extra functionality like a working shell,<br>
&gt; requiring less than 5 MB, which should work for a wide<br>
&gt; spectrum of workflows, and lasty, the emacs-full<br>
&gt; package contains the a fully working emacs using around<br>
&gt; 30 MB of space trading off size for functionality.<br>
&gt; <br>
&gt; This recipe also uses BBCLASSEXTEND=3Dnative to build some<br>
&gt; tools that emacs itself requires to build for target,<br>
&gt; but does not built a full native emacs since that is not<br>
&gt; necessary.<br>
&gt; <br>
&gt; Simply installing emacs will use the emacs-base package<br>
&gt; as default.<br>
&gt; <br>
&gt; Signed-off-by: Alejandro Hernandez Samaniego &lt;<a href=3D"mailto:al=
ejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">alejandro@enedino=
.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-support/emacs/<a href=3D"http://emacs_27.=
1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">emacs_27.1.bb</a>=C2=
=A0 =C2=A0| 260 ++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0.../emacs/files/usemake-docfile-native.patch=C2=A0 |=C2=
=A0 85 ++++++<br>
&gt;=C2=A0 =C2=A02 files changed, 345 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-support/emacs/<a href=
=3D"http://emacs_27.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">=
emacs_27.1.bb</a><br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-support/emacs/files/us=
emake-docfile-native.patch<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-support/emacs/<a href=3D"http://emacs_27=
.1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">emacs_27.1.bb</a> b/=
meta-oe/recipes-support/emacs/<a href=3D"http://emacs_27.1.bb" rel=3D"noref=
errer noreferrer" target=3D"_blank">emacs_27.1.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 000000000..67a395503<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/emacs/<a href=3D"http://emacs_27.1.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">emacs_27.1.bb</a><br>
&gt; @@ -0,0 +1,260 @@<br>
&gt; +SUMMARY =3D &quot;Emacs is the extensible, customizable, self-docume=
nting real-time display editor&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://www.gnu.org/software/emacs/" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://www.gnu.org/software=
/emacs/</a>&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;GPLv3&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1ebbd3e34237af26da5d=
c08a4e440464&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://ftp.gnu.org/pub/gnu/emacs/emacs=
-$%7BPV%7D.tar.xz" rel=3D"noreferrer noreferrer" target=3D"_blank">https://=
ftp.gnu.org/pub/gnu/emacs/emacs-${PV}.tar.xz</a>&quot;<br>
&gt; +<br>
&gt; +SRC_URI_append_class-target =3D &quot; file://usemake-docfile-native=
.patch&quot;<br>
&gt; +<br>
&gt; +SRC_URI[sha256sum] =3D &quot;4a4c128f915fc937d61edfc273c98106711b540=
c9be3cd5d2e2b9b5b2f172e41&quot;<br>
&gt; +<br>
&gt; +PACKAGECONFIG[gnutls] =3D &quot;--with-gnutls=3Dyes,--with-gnutls=3D=
no,gnutls&quot;<br>
&gt; +PACKAGECONFIG[kerberos] =3D &quot;--with-kerberos=3Dyes,--with-kerbe=
ros=3Dno,krb5&quot;<br>
&gt; +PACKAGECONFIG[libgmp] =3D &quot;--with-libgmp=3Dyes,--with-libgmp=3D=
no,gmp&quot;<br>
&gt; +<br>
&gt; +PACKAGECONFIG =3D &quot;gnutls kerberos libgmp&quot;<br>
<br>
should this be ?=3D here perhaps ?<br></blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Yes it should</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
&gt; +<br>
&gt; +# We could use --without-all but its better to<br>
&gt; +# split it into several packages (size of minimal doesnt change)<br>
&gt; +EXTRA_OECONF =3D &quot; --with-x=3Dno --with-dumping=3Dnone&quot;<br=
>
&gt; +<br>
&gt; +DEPENDS =3D &quot;ncurses&quot;<br>
&gt; +DEPENDS_append_class-target =3D &quot; emacs-native&quot;<br>
&gt; +<br>
&gt; +inherit autotools mime-xdg<br>
&gt; +<br>
&gt; +<br>
&gt; +# The following does NOT build a native emacs.<br>
&gt; +# It only builds some parts of it that are<br>
&gt; +# required to by the build for target emacs.<br>
&gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
<br>
move this extend to end.<br></blockquote></div></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">Will do, I&#39;ll send v2</div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; +<br>
&gt; +do_compile_class-native (){<br>
&gt; +=C2=A0 =C2=A0 cd ${B}/lib-src<br>
&gt; +=C2=A0 =C2=A0 oe_runmake make-docfile<br>
&gt; +=C2=A0 =C2=A0 oe_runmake make-fingerprint<br>
&gt; +}<br>
&gt; +do_install_class-native(){<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; +=C2=A0 =C2=A0 install -m 755 ${B}/lib-src/make-docfile ${D}/${bindir=
}/<br>
&gt; +=C2=A0 =C2=A0 install -m 755 ${B}/lib-src/make-fingerprint ${D}/${bi=
ndir}/<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +do_install_append(){<br>
&gt; +=C2=A0 =C2=A0 # Delete systemd stuff, extend using DISTRO_FEATURES?<=
br>
&gt; +=C2=A0 =C2=A0 rm -rf ${D}/${libdir}<br>
&gt; +=C2=A0 =C2=A0 # Extra stuff which isnt needed<br>
&gt; +=C2=A0 =C2=A0 rm -rf ${D}/${datadir}/metainfo<br>
&gt; +=C2=A0 =C2=A0 rm -rf ${D}/${datadir}/info<br>
&gt; +=C2=A0 =C2=A0 # Emacs copies files to ${D} while building, which wer=
e unpacked<br>
&gt; +=C2=A0 =C2=A0 # by a different user, we need to restore those<br>
&gt; +=C2=A0 =C2=A0 chown -R root:root ${D}${datadir}<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +# Use a similar strategy to how we build python:<br>
&gt; +# Create three packages<br>
&gt; +# minimal - A working lisp based text editor<br>
&gt; +# base - What would probably work for most<br>
&gt; +# full - A fully working emacs<br>
&gt; +# The lists of files are long but are worth it<br>
&gt; +# Installing &quot;emacs&quot; installs the base package<br>
&gt; +PACKAGE_BEFORE_PN =3D &quot;${PN}-minimal ${PN}-base ${PN}-full&quot=
;<br>
&gt; +RPROVIDES_${PN}-base =3D &quot;${PN}&quot;<br>
&gt; +RDEPENDS_${PN}-base_class-target =3D &quot;${PN}-minimal&quot;<br>
&gt; +RDEPENDS_${PN}-full_class-target =3D &quot;${PN}&quot;<br>
&gt; +<br>
&gt; +<br>
&gt; +# A minimal version of emacs that works<br>
&gt; +FILES_${PN}-minimal =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/loadup.el \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/byte-run.elc \=
<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/backquote.elc =
\<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/subr.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/version.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/widget.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/custom.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/map-ynp.elc \<=
br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/international/mule.elc \<=
br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/international/mule-conf.e=
lc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/env.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/format.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/bindings.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/window.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/files.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/macroexp.elc \=
<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/cus-face.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/faces.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/button.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/loaddefs.el \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/nadvice.elc \<=
br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-preloaded.e=
lc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/obarray.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/abbrev.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/simple.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/jka-cmpr-hook.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/epa-hook.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/international/mule-cmds.e=
lc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/case-table.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/international/charprop.el=
 \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/international/characters.=
elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/international/charscript.=
elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/composite.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/chinese.elc \<br=
>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/cyrillic.elc \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/indian.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/sinhala.elc \<br=
>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/english.elc \<br=
>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/ethiopic.elc \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/european.elc \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/czech.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/slovak.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/romanian.elc \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/greek.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/hebrew.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/international/cp51932.elc=
 \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/international/eucjp-ms.el=
c \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/japanese.elc \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/korean.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/lao.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/tai-viet.elc \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/thai.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/tibetan.elc \<br=
>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/vietnamese.elc \=
<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/misc-lang.elc \<=
br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/utf-8-lang.elc \=
<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/georgian.elc \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/khmer.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/burmese.elc \<br=
>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/language/cham.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/indent.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-generic.elc=
 \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/minibuffer.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/frame.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/startup.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/term/tty-colors.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/font-core.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/facemenu.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/syntax.elc \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/font-lock.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/jit-lock.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/mouse.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/select.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/timer.elc \<br=
>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/isearch.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/rfn-eshadow.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/menu-bar.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/tab-bar.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/lisp.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/textmodes/page.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/register.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/textmodes/paragraphs.elc =
\<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/prog-mode.elc \=
<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/lisp-mode.elc =
\<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/elisp-mode.elc =
\<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/textmodes/text-mode.elc \=
<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/textmodes/fill.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/newcomment.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/replace.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/tabulated-list=
.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/buff-menu.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/float-sup.elc =
\<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/vc/vc-hooks.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/vc/ediff-hook.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/uniquify.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/electric.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/eldoc.elc \<br=
>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/cus-start.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/tooltip.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/simple.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/regexp-opt.elc=
 \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/term/xterm.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/bytecomp.elc \=
<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cconv.elc \<br=
>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/gv.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/byte-opt.elc \=
<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/image.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/ldefs-boot.el \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/help.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/international/uni*.el \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/vc/warnings.el=
c \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/etc/charsets/ \<br>
&gt; +=C2=A0 =C2=A0 ${bindir}/emacs* \<br>
&gt; +=C2=A0 =C2=A0 ${prefix}/libexec \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +<br>
&gt; +# What works for &quot;most&quot; is relative, but this can be easil=
y extended if needed<br>
&gt; +FILES_${PN}-base =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/etc/srecode \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/etc/e \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/etc/forms \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/cedet \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/site-lisp/ \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/subdirs.el \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-mode.elc \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-defs.elc \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-vars.elc \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-engine.elc \=
<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-styles.elc \=
<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-fonts.elc \<=
br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-cmds.elc \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-align.elc \<=
br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-menus.elc \<=
br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/cc-guess.elc \<=
br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-lib.elc \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-macs.elc \<=
br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/pcase.elc \<br=
>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/inline.elc \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/cl-seq.elc \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/easymenu.elc \=
<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/python* \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/ansi-color.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/comint.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/ring.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/json.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/map.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/seq.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/subr-x.elc \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/seq.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/net/tramp-sh.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/net/tramp.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/net/tramp-compat.elc \<br=
>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/auth-source.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/password-cache.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/eieio.elc \<br=
>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/eieio-core.elc=
 \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/format-spec.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/ls-lisp.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/calendar/parse-time.elc \=
<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/calendar/iso8601.elc \<br=
>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/calendar/time-date.elc \<=
br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/shell.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/pcomplete.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/net/tramp-integration.elc=
 \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/files-x.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/net/trampver.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/net/tramp-loaddefs.el \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/*perl* \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/emacs-lisp/smie.elc \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/*asm* \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/cpp* \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/make* \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/sh-script* \<br=
>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/etc/themes/adwaita-theme.el \<=
br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/etc/themes/wheatgrass-theme.el=
 \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/etc/themes/deeper-blue-theme.e=
l \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/etc/themes/light-blue-theme.el=
 \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/etc/themes/misterioso-theme.el=
 \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/etc/themes/tango-theme.el \<br=
>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/etc/themes/wombat-theme.el \<b=
r>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/prog* \<br>
&gt; +=C2=A0 =C2=A0 ${datadir}/${BPN}/${PV}/lisp/progmodes/executable* \<b=
r>
&gt; +&quot;<br>
&gt; +<br>
&gt; +# Restore FILES for the full package to catch everything left<br>
&gt; +FILES_${PN}-full =3D &quot;${FILES_${PN}}&quot;<br>
&gt; +FILES_${PN}-full_append =3D &quot; ${datadir}/icons&quot;<br>
&gt; diff --git a/meta-oe/recipes-support/emacs/files/usemake-docfile-nati=
ve.patch b/meta-oe/recipes-support/emacs/files/usemake-docfile-native.patch=
<br>
&gt; new file mode 100644<br>
&gt; index 000000000..cc0b05c79<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/emacs/files/usemake-docfile-native.patc=
h<br>
&gt; @@ -0,0 +1,85 @@<br>
&gt; +Upstream-Status: Inappropriate=C2=A0 [OE-Specific]<br>
&gt; +<br>
&gt; +When building emacs, it builds some tools for the HOST<br>
&gt; +that are then used to build for target, such as<br>
&gt; +make-fingerprint and make-docfile, this needs to be<br>
&gt; +adapted to be used by bitbake, otherwise the compiled<br>
&gt; +executables arent compatible with the HOST.<br>
&gt; +<br>
&gt; +Use the above mentioned tools provided by the native<br>
&gt; +version of the recipe instead.<br>
&gt; +<br>
&gt; +Signed-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"=
mailto:alejandro@enedino.org" target=3D"_blank" rel=3D"noreferrer">alejandr=
o@enedino.org</a>&gt;<br>
&gt; +<br>
&gt; +Index: emacs-27.1/src/Makefile.in<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- emacs-27.1.orig/src/Makefile.in<br>
&gt; ++++ emacs-27.1/src/Makefile.in<br>
&gt; +@@ -472,7 +472,7 @@ ifeq ($(CHECK_STRUCTS),true)<br>
&gt; + pdumper.o: dmpstruct.h<br>
&gt; + endif<br>
&gt; + dmpstruct.h: $(srcdir)/dmpstruct.awk<br>
&gt; +-dmpstruct.h: $(libsrc)/make-fingerprint$(EXEEXT) $(dmpstruct_header=
s)<br>
&gt; ++dmpstruct.h:=C2=A0 $(dmpstruct_headers)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(AM_V_GEN)POSIXLY_CORRECT=3D1 awk -f $(srcdir)/=
dmpstruct.awk \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(dmpstruct_headers)=
 &gt; $@<br>
&gt; +<br>
&gt; +@@ -566,8 +566,7 @@ ${lispintdir}/characters.elc: ${charscri<br>
&gt; + ## Strictly speaking, emacs does not depend directly on all of $lis=
p,<br>
&gt; + ## since not all pieces are used on all platforms.=C2=A0 But DOC de=
pends<br>
&gt; + ## on all of $lisp, and emacs depends on DOC, so it is ok to use $l=
isp here.<br>
&gt; +-emacs$(EXEEXT): temacs$(EXEEXT) \<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"=
http://lisp.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">lisp.mk</a>=
 $(etc)/DOC $(lisp) \<br>
&gt; ++emacs$(EXEEXT): <a href=3D"http://lisp.mk" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">lisp.mk</a> $(etc)/DOC $(lisp) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(lisp=
source)/international/charprop.el ${charsets}<br>
&gt; + ifeq ($(DUMPING),unexec)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LC_ALL=3DC $(RUN_TEMACS) -batch $(BUILD_DETAILS)=
 -l loadup --temacs=3Ddump<br>
&gt; +@@ -596,15 +595,15 @@ endif<br>
&gt; + ## for the first time, this prevents any variation between configur=
ations<br>
&gt; + ## in the contents of the DOC file.<br>
&gt; + ##<br>
&gt; +-$(etc)/DOC: <a href=3D"http://lisp.mk" rel=3D"noreferrer noreferrer=
" target=3D"_blank">lisp.mk</a> $(libsrc)/make-docfile$(EXEEXT) $(obj) $(li=
sp)<br>
&gt; ++$(etc)/DOC: <a href=3D"http://lisp.mk" rel=3D"noreferrer noreferrer=
" target=3D"_blank">lisp.mk</a> $(obj) $(lisp)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(AM_V_GEN)$(MKDIR_P) $(etc)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(AM_V_at)rm -f $(etc)/DOC<br>
&gt; +-=C2=A0 =C2=A0 $(AM_V_at)$(libsrc)/make-docfile -d $(srcdir) \<br>
&gt; ++=C2=A0 =C2=A0 make-docfile -d $(srcdir) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(SOME_MACHINE_OBJECTS) $(obj) &gt; $(etc=
)/DOC<br>
&gt; +-=C2=A0 =C2=A0 $(AM_V_at)$(libsrc)/make-docfile -a $(etc)/DOC -d $(l=
ispsource) \<br>
&gt; ++=C2=A0 =C2=A0 make-docfile -a $(etc)/DOC -d $(lispsource) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(shortlisp)<br>
&gt; +<br>
&gt; +-$(libsrc)/make-docfile$(EXEEXT) $(libsrc)/make-fingerprint$(EXEEXT)=
: \<br>
&gt; ++$(libsrc)/make-fingerprint$(EXEEXT): \<br>
&gt; +=C2=A0 =C2=A0$(lib)/libgnu.a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(MAKE) -C $(dir $@) $(notdir $@)<br>
&gt; +<br>
&gt; +@@ -622,8 +621,8 @@ am__v_GLOBALS_ =3D $(am__v_GLOBALS_@AM_DEF<br>
&gt; + am__v_GLOBALS_0 =3D @echo &quot;=C2=A0 GEN=C2=A0 =C2=A0 =C2=A0&quot=
; globals.h;<br>
&gt; + am__v_GLOBALS_1 =3D<br>
&gt; +<br>
&gt; +-gl-stamp: $(libsrc)/make-docfile$(EXEEXT) $(GLOBAL_SOURCES)<br>
&gt; +-=C2=A0 =C2=A0 $(AM_V_GLOBALS)$(libsrc)/make-docfile -d $(srcdir) -g=
 $(obj) &gt; globals.tmp<br>
&gt; ++gl-stamp: $(GLOBAL_SOURCES)<br>
&gt; ++=C2=A0 =C2=A0 make-docfile -d $(srcdir) -g $(obj) &gt; globals.tmp<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(AM_V_at)$(top_srcdir)/build-aux/move-if-change=
 globals.tmp globals.h<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(AM_V_at)echo timestamp &gt; $@<br>
&gt; +<br>
&gt; +@@ -637,7 +636,7 @@ $(LIBEGNU_ARCHIVE): $(config_h)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(MAKE) -C $(dir $@) all<br>
&gt; +<br>
&gt; + ifeq ($(HAVE_PDUMPER),yes)<br>
&gt; +-=C2=A0 MAKE_PDUMPER_FINGERPRINT =3D $(libsrc)/make-fingerprint$(EXE=
EXT)<br>
&gt; ++=C2=A0 MAKE_PDUMPER_FINGERPRINT =3D make-fingerprint<br>
&gt; + else<br>
&gt; +=C2=A0 =C2=A0MAKE_PDUMPER_FINGERPRINT =3D<br>
&gt; + endif<br>
&gt; +@@ -647,7 +646,7 @@ endif<br>
&gt; + ## This goes on to affect various things, and the emacs binary fail=
s<br>
&gt; + ## to start if Vinstallation_directory has the wrong value.<br>
&gt; + temacs$(EXEEXT): $(LIBXMENU) $(ALLOBJS) $(LIBEGNU_ARCHIVE) $(EMACSR=
ES) \<br>
&gt; +-=C2=A0 $(charsets) $(charscript) $(MAKE_PDUMPER_FINGERPRINT)<br>
&gt; ++=C2=A0 $(charsets) $(charscript)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(AM_V_CCLD)$(CC) -o $@.tmp \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(ALL_CFLAGS) $(TEMACS_LDFLAGS) $(LDFLAGS=
) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(ALLOBJS) $(LIBEGNU_ARCHIVE) $(W32_RES_L=
INK) $(LIBES)<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div></div></div>

--00000000000066da2205ad6af227--
