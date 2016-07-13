Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id 22DE473196
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 07:39:57 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id s66so58206350oif.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jul 2016 00:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6L0XKWSVF7DpBGChrVsfvtTWmUW0y814zEgNeTXVgS8=;
	b=lEdfLQekhbKtLNSJhYdU8+8r9H61EJU4GRv2kRAW25B9AsRqcTv39rVNYq0ehJ/hBe
	ffvJMBgTQTEtIf+ZN8OcyYkUY52Tzpdpl8Ku2PfpI6PX6563GlFCkGHcSeTgeRRBlh+F
	CjWuBTcMtj/ndMa9opH6nNscdSwV/2MuMqx5/Ywx0iiiZ4Zfi4ahGk3TCzzbj0dCVrRT
	8Ab0Dj45w2eFAiht7mK0BHUavpvRRvdUm5DFTgeqTvex4WfnTArxrxHWWV33dMOaNZ7b
	jnd/LIPMsw50F1ZdoU38rqrkq9ICYNFKqTVym5Bj40UlDgGOb1N8FSyAVl/YGej8+hym
	Gbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6L0XKWSVF7DpBGChrVsfvtTWmUW0y814zEgNeTXVgS8=;
	b=XKyP2uuHpEs0dws2LEeiE8RTexFe9JN7pOwgp9E0gBY1+HUsrrvMvwigU+8Sd5POQZ
	gykyt/lH9FT+d2V+uVPT1iIhSTdJ/9cCrJ/+yivzXr+XddXqcIjiHphMaX/M2L5g7TDL
	cI0PIdS+ZnsWXRGzOWspB37G/V4HY++y5rwydTggAvjlrEhFmD85AXfFK/9DkrRDocM2
	FzDgLG+08V9GauH2q2F9mSMhtOXM4AemIWaS3fqJxYQ9zZ1Y5qxiTOhyyEh6Ksthok5i
	zJ02vfdqIaOcS/qf6q+EZxDtFM9eJqwAN10FUpsXJ23fkywhNXRBn2LuKbmxsqb+nbWY
	WnLg==
X-Gm-Message-State: ALyK8tLmyHaaliRfQOFbEN9N+QbiQfD4Ly3d5yWkRFWFI9h7mEZm2Zv94piMObIW0E/7ZXI8tbFxqSmvbCyh32lh
X-Received: by 10.157.11.163 with SMTP id 32mr4111671oth.119.1468395598445;
	Wed, 13 Jul 2016 00:39:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.199.134 with HTTP; Wed, 13 Jul 2016 00:39:28 -0700 (PDT)
In-Reply-To: <20160712134134.GA4066@mentor.com>
References: <1468324237-13346-1-git-send-email-jussi.kukkonen@intel.com>
	<20160712134134.GA4066@mentor.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 13 Jul 2016 10:39:28 +0300
Message-ID: <CAHiDW_EwCjOOLwey-PUup-g-GT3gHuHrvySmDAg+XiHa4eonMg@mail.gmail.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] augeas: Move from oe-core
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
X-List-Received-Date: Wed, 13 Jul 2016 07:39:58 -0000
Content-Type: text/plain; charset=UTF-8

On 12 July 2016 at 16:41, Joe MacDonald <Joe_MacDonald@mentor.com> wrote:

> [[oe] [meta-networking][PATCH] augeas: Move from oe-core] On 16.07.12 (Tue
> 14:50) Jussi Kukkonen wrote:
>
> > augeas is being removed from oe-core as nothing there uses or tests
> > it. Move the recipe to meta-networking where the only meta-oe reverse
> > dependency (netcf) lives.
>
> I don't object to this and I always like having all of the things we
> need in one place, but I don't know if it makes sense to have this in
> meta-networking.  There's nothing (AFAICT) networking-specific about it
> and the meta-networking layer already has multiple other layer
> dependencies.  I'd suggest it probably has a better fit in meta-oe.
>

I have no preference: if no other opinions pop up I'll send a V2 with the
change you suggested.

Jussi


> That said, I'll be easily swayed to bring this into meta-networking if
> others feel differently.
>
> -J.
>
> >
> > Also upgrade to 1.5.0: no recipe changes needed.
> >
> > Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > ---
> >  meta-networking/recipes-support/augeas/augeas.inc  | 30
> ++++++++++++++++++++++
> >  ...need_charset_alias-when-building-for-musl.patch | 30
> ++++++++++++++++++++++
> >  .../augeas/add-missing-argz-conditional.patch      | 20 +++++++++++++++
> >  .../augeas/augeas/sepbuildfix.patch                | 22 ++++++++++++++++
> >  .../recipes-support/augeas/augeas_1.5.0.bb         |  4 +++
> >  5 files changed, 106 insertions(+)
> >  create mode 100644 meta-networking/recipes-support/augeas/augeas.inc
> >  create mode 100644
> meta-networking/recipes-support/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
> >  create mode 100644
> meta-networking/recipes-support/augeas/augeas/add-missing-argz-conditional.patch
> >  create mode 100644
> meta-networking/recipes-support/augeas/augeas/sepbuildfix.patch
> >  create mode 100644 meta-networking/recipes-support/augeas/
> augeas_1.5.0.bb
> >
> > diff --git a/meta-networking/recipes-support/augeas/augeas.inc
> b/meta-networking/recipes-support/augeas/augeas.inc
> > new file mode 100644
> > index 0000000..23d12ca
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/augeas/augeas.inc
> > @@ -0,0 +1,30 @@
> > +SUMMARY = "Augeas configuration API"
> > +HOMEPAGE = "http://augeas.net/"
> > +BUGTRACKER = "https://fedorahosted.org/augeas/report/1"
> > +
> > +LICENSE = "LGPLv2.1+"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
> > +
> > +SRC_URI = "http://download.augeas.net/${BP}.tar.gz \
> > +           file://add-missing-argz-conditional.patch \
> > +           file://sepbuildfix.patch \
> > +
>  file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
> > +          "
> > +
> > +DEPENDS = "readline libxml2"
> > +
> > +inherit autotools pkgconfig
> > +
> > +PACKAGES =+ "${PN}-lenses lib${BPN}"
> > +
> > +FILES_${PN}-lenses = "${datadir}/augeas/lenses"
> > +FILES_lib${BPN} = "${libdir}/lib*${SOLIBS}"
> > +
> > +RDEPENDS_lib${BPN} += "${PN}-lenses"
> > +RRECOMMENDS_lib${BPN} += "${PN}"
> > +
> > +LEAD_SONAME = "libaugeas.so"
> > +
> > +do_install_append() {
> > +     rm -fr ${D}${datadir}/vim
> > +}
> > diff --git
> a/meta-networking/recipes-support/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
> b/meta-networking/recipes-support/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
> > new file mode 100644
> > index 0000000..9a19876
> > --- /dev/null
> > +++
> b/meta-networking/recipes-support/augeas/augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch
> > @@ -0,0 +1,30 @@
> > +From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 13 Apr 2015 17:02:13 -0700
> > +Subject: [PATCH] Unset need_charset_alias when building for musl
> > +
> > +localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
> > +which actually shoudl be fixed in gnulib and then all downstream
> > +projects will get it eventually. For now we apply the fix to
> > +coreutils
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + lib/gnulib.mk | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +Index: augeas-1.2.0/gnulib/lib/Makefile.am
> > +===================================================================
> > +--- augeas-1.2.0.orig/gnulib/lib/Makefile.am
> > ++++ augeas-1.2.0/gnulib/lib/Makefile.am
> > +@@ -463,7 +463,7 @@ install-exec-localcharset: all-local
> > +       case '$(host_os)' in \
> > +         darwin[56]*) \
> > +           need_charset_alias=true ;; \
> > +-        darwin* | cygwin* | mingw* | pw32* | cegcc*) \
> > ++        darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
> > +           need_charset_alias=false ;; \
> > +         *) \
> > +           need_charset_alias=true ;; \
> > diff --git
> a/meta-networking/recipes-support/augeas/augeas/add-missing-argz-conditional.patch
> b/meta-networking/recipes-support/augeas/augeas/add-missing-argz-conditional.patch
> > new file mode 100644
> > index 0000000..abbdbaa
> > --- /dev/null
> > +++
> b/meta-networking/recipes-support/augeas/augeas/add-missing-argz-conditional.patch
> > @@ -0,0 +1,20 @@
> > +Add missing GL_GENERATE_ARGZ_H conditional
> > +
> > +- GL_GENERATE_ARGZ_H is used in gnulib/lib/Makefile.am
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> > +
> > +Index: augeas-1.0.0/configure.ac
> > +===================================================================
> > +--- augeas-1.0.0.orig/configure.ac
> > ++++ augeas-1.0.0/configure.ac
> > +@@ -55,6 +55,8 @@ AC_ARG_WITH([failmalloc],
> > +
> > + AM_CONDITIONAL([WITH_FAILMALLOC], [test x$with_failmalloc != xno])
> > +
> > ++AM_CONDITIONAL([GL_GENERATE_ARGZ_H], [test -n "$ARGZ_H"])
> > ++
> > + dnl --enable-debug=(yes|no)
> > + AC_ARG_ENABLE([debug],
> > +               [AC_HELP_STRING([--enable-debug=no/yes],
> > diff --git
> a/meta-networking/recipes-support/augeas/augeas/sepbuildfix.patch
> b/meta-networking/recipes-support/augeas/augeas/sepbuildfix.patch
> > new file mode 100644
> > index 0000000..b82a3ee
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/augeas/augeas/sepbuildfix.patch
> > @@ -0,0 +1,22 @@
> > +Ensure that builds in separate builddirs (${B} != ${S}) correctly
> install the
> > +lenses files.
> > +
> > +Upstream-Status: Pending
> > +
> > +RP 2013/4/17
> > +
> > +Index: augeas-1.0.0/Makefile.am
> > +===================================================================
> > +--- augeas-1.0.0.orig/Makefile.am    2012-11-02 15:20:11.000000000 +0000
> > ++++ augeas-1.0.0/Makefile.am 2013-04-17 10:36:24.033400125 +0000
> > +@@ -5,8 +5,8 @@
> > + lensdir=$(datadir)/augeas/lenses/dist
> > + lenstestdir=$(datadir)/augeas/lenses/dist/tests
> > +
> > +-dist_lens_DATA=$(wildcard lenses/*.aug)
> > +-dist_lenstest_DATA=$(wildcard lenses/tests/*.aug)
> > ++dist_lens_DATA=$(wildcard $(top_srcdir)/lenses/*.aug)
> > ++dist_lenstest_DATA=$(wildcard $(top_srcdir)lenses/tests/*.aug)
> > +
> > + EXTRA_DIST=augeas.spec build/aux/move-if-change Makefile.am HACKING
> > +
> > diff --git a/meta-networking/recipes-support/augeas/augeas_1.5.0.bb
> b/meta-networking/recipes-support/augeas/augeas_1.5.0.bb
> > new file mode 100644
> > index 0000000..c4f62e7
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/augeas/augeas_1.5.0.bb
> > @@ -0,0 +1,4 @@
> > +require augeas.inc
> > +
> > +SRC_URI[md5sum] = "01190e455c513124a2dae29a1182c113"
> > +SRC_URI[sha256sum] =
> "223bb6e6fe3e9e92277dafd5d34e623733eb969a72a382998d204feab253f73f"
> > --
> > 2.1.4
> >
> --
> -Joe MacDonald.
> :wq
>

