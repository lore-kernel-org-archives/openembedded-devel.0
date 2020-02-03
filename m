Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id E2B1760B29
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2020 05:13:33 +0000 (UTC)
X-Originating-IP: 173.197.191.182
Received: from xps13.localdomain (rrcs-173-197-191-182.west.biz.rr.com
	[173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D7890FF806;
	Mon,  3 Feb 2020 05:13:32 +0000 (UTC)
Message-ID: <7c6f9f3a624756a9d18ef9da14d83412d8bfec70.camel@redrectangle.org>
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 02 Feb 2020 21:13:29 -0800
In-Reply-To: <CAO5Uq5S5R92jtdgWoFDJ_2P1egc=VXAs=MzPy3xoEi4d3jS_7w@mail.gmail.com>
References: <20200131212057.1856967-1-robert.joslyn@redrectangle.org>
	<20200131212057.1856967-2-robert.joslyn@redrectangle.org>
	<CAO5Uq5S5R92jtdgWoFDJ_2P1egc=VXAs=MzPy3xoEi4d3jS_7w@mail.gmail.com>
User-Agent: Evolution 3.32.5 
MIME-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/3] iwd: Add PACKAGECONFIG options
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
X-List-Received-Date: Mon, 03 Feb 2020 05:13:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-02-01 at 15:25 +0000, Alex Kiernan wrote:
> On Fri, Jan 31, 2020 at 9:45 PM Robert Joslyn
> <robert.joslyn@redrectangle.org> wrote:
> > Make it easier to disable optional client, monitor, and man page
> > components and their dependencies. A user may want to disable the
> > client
> > to avoid the use of GPLv3 readline.
> > 
> > Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> > ---
> >  meta-oe/recipes-connectivity/iwd/iwd_1.4.bb | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb b/meta-
> > oe/recipes-connectivity/iwd/iwd_1.4.bb
> > index 49fc45a74..a023c0d28 100644
> > --- a/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
> > +++ b/meta-oe/recipes-connectivity/iwd/iwd_1.4.bb
> > @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "
> > file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
> > 
> >  inherit autotools pkgconfig systemd python3native
> > 
> > -DEPENDS = "ell readline python3-docutils-native"
> > +DEPENDS = "ell"
> > 
> >  SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git \
> >             file://0001-Makefile.am-Avoid-redirection-of-input-and-
> > output-fi.patch \
> > @@ -12,7 +12,15 @@ SRC_URI =
> > "git://git.kernel.org/pub/scm/network/wireless/iwd.git \
> >  SRCREV = "860fa4697f349da7791ecf22ca76f9ac0e5de261"
> >  S = "${WORKDIR}/git"
> > 
> > -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd',
> > d)}"
> > +PACKAGECONFIG ??= " \
> > +    client \
> > +    monitor \
> > +    manual-pages \
> > +    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> > +"
> > +PACKAGECONFIG[client] = "--enable-client,--disable-client,readline"
> > +PACKAGECONFIG[monitor] = "--enable-monitor,--disable-monitor"
> > +PACKAGECONFIG[manual-pages] = "--enable-manual-pages,--disable-
> > manual-pages,python3-docutils-native"
> 
> If you make this PACKAGECONFIG[manpages], inherit manpages and drop it
> from the default PACKAGECONFIG you'll automatically get documentation
> driven by the api-documentation distro feature. Though at that
> possibly it should be a separate commit.
> 
> Maybe just /manual-pages/manpages/ as that's a common name?

That's a good idea. I wasn't familiar with that class, but I'll add that
in the v2.

Thanks,
Robert

> >  PACKAGECONFIG[wired] = "--enable-wired,--disable-wired"
> >  PACKAGECONFIG[ofono] = "--enable-ofono,--disable-ofono"
> >  PACKAGECONFIG[systemd] = "--with-systemd-
> > unitdir=${systemd_system_unitdir},--disable-systemd-service,systemd"
> > @@ -26,6 +34,8 @@ do_configure_prepend () {
> >  do_install_append() {
> >      mkdir --parents ${D}${docdir}/${BPN}
> >      install -m644 ${S}/doc/*.txt ${D}${docdir}/${BPN}
> > +    # If client and monitor are disabled, bindir is empty, causing a
> > QA error
> > +    rmdir --ignore-fail-on-non-empty ${D}/${bindir}
> >  }
> > 
> >  FILES_${PN} += "${datadir}/dbus-1 ${nonarch_libdir}/modules-load.d
> > ${systemd_unitdir}/network/"
> > --
> > 2.24.1
> > 
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 



