Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1493.1591739738162779635
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 14:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3CC3340C21;
	Tue,  9 Jun 2020 21:55:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27S6crMqRsVB; Tue,  9 Jun 2020 21:55:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 152BF40A35;
	Tue,  9 Jun 2020 21:55:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BA45E17320C; Tue,  9 Jun 2020 17:55:34 -0400 (EDT)
Date: Tue, 9 Jun 2020 17:55:34 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ross Burton <ross@burtonini.com>
Cc: Arthur She <arthur.she@linaro.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] igt-gpu-tools: add new package
Message-ID: <20200609215534.GW17660@denix.org>
References: <20200609142957.187352-1-arthur.she@linaro.org>
 <CAAnfSTsaMMCGGnGGYHf6dQ3Kdjtzf-NnPy7VoXDjffC-BFPHGw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAnfSTsaMMCGGnGGYHf6dQ3Kdjtzf-NnPy7VoXDjffC-BFPHGw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 09, 2020 at 04:19:31PM +0100, Ross Burton wrote:
> Also I guess you should mention that this is basically copied from
> meta-intel, and talk about how to handle duplicate recipes.
> 
> Ross
> 
> On Tue, 9 Jun 2020 at 15:30, Arthur She <arthur.she@linaro.org> wrote:
> >
> > igt-gpu-tools is a collection of tools for development and testing of the DRM
> > drivers. (https://gitlab.freedesktop.org/drm/igt-gpu-tools)
> >
> > Signed-off-by: Arthur She <arthur.she@linaro.org>
> > ---
> >  .../igt-gpu-tools/igt-gpu-tools_git.bb        | 46 +++++++++++++++++++
> >  1 file changed, 46 insertions(+)
> >  create mode 100644 meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> >
> > diff --git a/meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb b/meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > new file mode 100644
> > index 000000000..761df1cbb
> > --- /dev/null
> > +++ b/meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > @@ -0,0 +1,46 @@
> > +SUMMARY = "IGT GPU Tools"
> > +DESCRIPTION = "IGT GPU Tools is a collection of tools for development and testing of the DRM drivers"
> > +
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=67bfee4df38fa6ecbe3a675c552d4c08"
> > +
> > +LICENSE_append = " & ISC"

Huh?


> > +inherit meson gtk-doc
> > +
> > +SRCREV = "${AUTOREV}"
> > +
> > +SRC_URI = "git://gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod openssl xmlrpc-c gsl elfutils alsa-lib json-c bison-native"
> > +RDEPENDS_${PN} += "bash python3-mako python3-six git net-snmp"
> > +
> > +PACKAGE_BEFORE_PN = "${PN}-benchmarks"
> > +
> > +EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dchamelium=enabled"
> > +COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64).*-linux"
> > +COMPATIBLE_HOST_libc-musl_class-target = "null"
> > +
> > +gputools_sysroot_preprocess() {
> > +       rm -f ${SYSROOT_DESTDIR}${libdir}/pkgconfig/intel-gen4asm.pc
> > +}
> > +SYSROOT_PREPROCESS_FUNCS += "gputools_sysroot_preprocess"
> > +
> > +do_install_append() {
> > +    install -d ${D}/usr/share/${BPN}/scripts
> > +    install ${S}/scripts/run-tests.sh ${D}/usr/share/${BPN}/scripts
> > +    install -d ${D}/usr/share/${BPN}/runner
> > +    install -D ${B}/runner/igt_runner ${D}/usr/share/${BPN}/runner
> > +    install -D ${B}/runner/igt_resume ${D}/usr/share/${BPN}/runner
> > +}
> > +
> > +FILES_${PN} += "\
> > +        ${libexecdir}/${BPN}/*\
> > +        ${libdir}/intel_aubdump.so \
> > +        ${datadir}/${BPN}/1080p-right.png \
> > +        ${datadir}/${BPN}/1080p-left.png \
> > +        ${datadir}/${BPN}/pass.png \
> > +        ${datadir}/${BPN}/test-list.txt \
> > +        ${libexecdir}/${BPN}/benchmarks \
> > +        "
> > --
> > 2.25.1
> >
> > 

> 

