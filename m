Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id B88B573211
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 15:25:02 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1471015503; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=zkioQl1CcbHWd7RhbHty1SWtXaBxy6cQDSusgry+ZYU=;
	b=Aeh4C31sBu5uZY/ieC59NY0JOA8eP/Y+0EKwISKk0SqN9cBfAazRc23o/hKHUfe6cWhH3g2A
	JGNtEMHpyWpGu2S2wL4NyDg3W+h54zl9xYIUso7c4NwsJ49S4fWSt0B0GF/N85YammrM0XCw
	8ahJGgnuBIe3Hkbnd7n4S88vq+k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=goT1pVazI1UXtYFQ1o7wFtIOu4quVYl62IXeQDf+2K7lL6twnM6jOvSrtFMIVVdqDYVFYc
	Glj8QxqbrYzdQDQNe2TMVX+q0fdI197sQ1AWfoHtoIwYjeNWOlAcJ/bsJqZpVlmLhUNVmouZ
	+YMOKc3jejPM8poOrRhGWsj4dpjYc=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mxa.mailgun.org with ESMTP id 57adea4e.7fa034364630-in8;
	Fri, 12 Aug 2016 15:25:02 -0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id b62so27514624iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 08:25:02 -0700 (PDT)
X-Gm-Message-State: AEkoousXE+QhN5Rgn7hC7o4hPSJkykPtcEPCAGWsdxZb3zWwgF9lrAmE2R3Dg2fGcs6VaSwKcFko1dXy6iXuPw==
X-Received: by 10.107.63.70 with SMTP id m67mr18094970ioa.157.1471015501736;
	Fri, 12 Aug 2016 08:25:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.213 with HTTP; Fri, 12 Aug 2016 08:25:01 -0700 (PDT)
In-Reply-To: <CA+chaQdgy+PsJQ7d=KCvuHP6K3=52DzNN-Jbtz4hPBqLAe6psA@mail.gmail.com>
References: <1471014662-28320-1-git-send-email-derek@asterius.io>
	<CA+chaQdgy+PsJQ7d=KCvuHP6K3=52DzNN-Jbtz4hPBqLAe6psA@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 12 Aug 2016 11:25:01 -0400
X-Gmail-Original-Message-ID: <CADNbA1rWmXn-DHDtSzU8WgT9HXUgKziETOSZrer0t+63_DPe-A@mail.gmail.com>
Message-ID: <CADNbA1rWmXn-DHDtSzU8WgT9HXUgKziETOSZrer0t+63_DPe-A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] gd: update to version 2.2.3
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
X-List-Received-Date: Fri, 12 Aug 2016 15:25:05 -0000
Content-Type: text/plain; charset=UTF-8

The vpx support was removed upstream and instead it optionally uses
libwebp.  I should probably explicitly disable libwebp support.  I'll send
a v2 once I test it out.

On Fri, Aug 12, 2016 at 11:14 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Does it autodetect libvpx now or was vpx removed in upstream version?
>
> On Fri, Aug 12, 2016 at 5:11 PM, Derek Straka <derek@asterius.io> wrote:
>
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >  .../gd/files/fix-gcc-unused-functions.patch        | 43
> > ++++++++++++++++++++++
> >  .../gd/{gd_2.1.1.bb => gd_2.2.3.bb}                | 11 +++---
> >  2 files changed, 48 insertions(+), 6 deletions(-)
> >  create mode 100644 meta-oe/recipes-support/gd/files/fix-gcc-unused-
> > functions.patch
> >  rename meta-oe/recipes-support/gd/{gd_2.1.1.bb => gd_2.2.3.bb} (82%)
> >
> > diff --git a/meta-oe/recipes-support/gd/files/fix-gcc-unused-
> functions.patch
> > b/meta-oe/recipes-support/gd/files/fix-gcc-unused-functions.patch
> > new file mode 100644
> > index 0000000..02cb5ad
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/gd/files/fix-gcc-unused-functions.patch
> > @@ -0,0 +1,43 @@
> > +gdft.c: remove functions that cause warnings about being unused
> > +
> > +Upstream-Status: Backport (Fixed in master branch)
> > +
> > +Signed-off-by: Derek Straka <derek@asterius.io>
> > +--- git/src/gdft.c.orig        2016-08-12 10:20:41.418440091 -0400
> > ++++ git/src/gdft.c     2016-08-12 10:22:34.226442987 -0400
> > +@@ -139,16 +139,6 @@
> > + }
> > + #else
> > +
> > +-#ifndef HAVE_LIBFONTCONFIG
> > +-static char * font_pattern(char **fontpath, char *fontpattern)
> > +-{
> > +-      (void)fontpath;
> > +-      (void)fontpattern;
> > +-
> > +-      return "libgd was not built with FontConfig support\n";
> > +-}
> > +-#endif /* HAVE_LIBFONTCONFIG */
> > +-
> > + #include "gdcache.h"
> > + /* 2.0.16 Christophe Thomas: starting with FreeType 2.1.6, this is
> > +   mandatory, and it has been supported for a long while. */
> > +@@ -446,16 +436,15 @@
> > +       return (strcmp (a->fontlist, b->fontlist) == 0 && a->flags ==
> > b->flags);
> > + }
> > +
> > ++#ifdef HAVE_LIBFONTCONFIG
> > + static int useFontConfig(int flag)
> > + {
> > +-#ifdef HAVE_LIBFONTCONFIG
> > +       if (fontConfigFlag) {
> > +               return (!(flag & gdFTEX_FONTPATHNAME));
> > +       }
> > +-#endif
> > +       return flag & gdFTEX_FONTCONFIG;
> > + }
> > +-
> > ++#endif
> > + static void *
> > + fontFetch (char **error, void *key)
> > + {
> > diff --git a/meta-oe/recipes-support/gd/gd_2.1.1.bb
> > b/meta-oe/recipes-support/gd/gd_2.2.3.bb
> > similarity index 82%
> > rename from meta-oe/recipes-support/gd/gd_2.1.1.bb
> > rename to meta-oe/recipes-support/gd/gd_2.2.3.bb
> > index 85c7e6a..74e265e 100644
> > --- a/meta-oe/recipes-support/gd/gd_2.1.1.bb
> > +++ b/meta-oe/recipes-support/gd/gd_2.2.3.bb
> > @@ -12,12 +12,12 @@ LICENSE = "GD"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=c97638cafd3581eb87abd373321376
> 69"
> >  DEPENDS = "freetype libpng jpeg zlib tiff"
> >
> > -SRC_URI = "https://bitbucket.org/libgd/gd-libgd/downloads/libgd-${PV}
> > .tar.bz2 \
> > -"
> > -SRC_URI[md5sum] = "d3f1a992ac9c550ebc6da89c147f89af"
> > -SRC_URI[sha256sum] = "895ea9c6fcab187b0a908ae3e9e6b0
> > 6423756f8a643d362349b0caab4014bd0d"
> > +SRC_URI = "git://github.com/libgd/libgd.git;branch=GD-2.2 \
> > +           file://fix-gcc-unused-functions.patch"
> >
> > -S = "${WORKDIR}/libgd-${PV}"
> > +SRCREV = "46ceef5970bf3a847ff61d1bdde7501d66c11d0c"
> > +
> > +S = "${WORKDIR}/git"
> >
> >  inherit autotools binconfig gettext pkgconfig
> >
> > @@ -27,7 +27,6 @@ EXTRA_OECONF += " --disable-rpath \
> >                    --without-fontconfig \
> >                    --without-xpm \
> >                    --without-x \
> > -                  --without-vpx \
> >                  "
> >
> >  EXTRA_OEMAKE = 'LDFLAGS="${LDFLAGS}"'
> > --
> > 1.9.1
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

