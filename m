Return-Path: <mbc@koumoul.net>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id E7B4C77083
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2015 20:32:41 +0000 (UTC)
Received: by ioii196 with SMTP id i196so151462532ioi.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Oct 2015 13:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=1gHwfXIufHQ/8fygOekKaXxxxA5ZgI49O1ByQ6V4aRw=;
	b=PjXhz6pWwZiGAIvwRHDBSwRMoKPXojkaFqwk/f+ye5LUcG+ntd25WnBRHWAVX7Jzic
	4pDlqvLnPqjB8XbhZXvIf1OeybqkFe2vsxXUTxjE/tqwJKTo+r8TEka9yo1/ZqXYIy3a
	GajaxlTlUXlDC7d8n5LHU8idyTBvc98BxNx7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=1gHwfXIufHQ/8fygOekKaXxxxA5ZgI49O1ByQ6V4aRw=;
	b=c/arOsajDb3dd68GjG5v3cwwp94CGURMCUwf1eOs9neeLrXS1BJjTjdu1TbC9DWlPc
	hUjS+FkfSRRcDmP5tpWu1dQqBZkJ7UOyfweeelb9OKNNY10QpeYcNP3lZXFLJe9/zMx9
	U5LlHxz2dFAtQNmaus+7dZ/ajCMM1pUKvOHVQ7V/qd02zA5nkCyGYERpZc6uQytCH8Dv
	f8FSybE//m/X+6aO/Uxgxc303ua1zQ9jQ76WkfOBwYo6qzX9KL5va3EEae6EpeF/V81b
	IUgwFpwMRRVWszyvvhwZBfGJkOy/nBGJ5yaqhgSH7aGjsQWNnxb8AnqsbDjjQaYlDi2F
	akeA==
X-Gm-Message-State: ALoCoQnoW47amJNldGwcfpzczwECpnRcmDKb9eYJvblQxT95UcU3WY0Yq6qeY0z3Ay91HFXXeAy/
MIME-Version: 1.0
X-Received: by 10.107.138.231 with SMTP id c100mr20693229ioj.87.1443904361709; 
	Sat, 03 Oct 2015 13:32:41 -0700 (PDT)
Sender: mbc@koumoul.net
Received: by 10.79.111.6 with HTTP; Sat, 3 Oct 2015 13:32:41 -0700 (PDT)
X-Originating-IP: [2.13.130.70]
In-Reply-To: <CA+chaQeWM15GkaVGGWsn_XYHVfBAV_f4DmzPkA7DZGnHvC7A-A@mail.gmail.com>
References: <1443890451-20749-1-git-send-email-manuel.bachmann@iot.bzh>
	<CA+chaQeWM15GkaVGGWsn_XYHVfBAV_f4DmzPkA7DZGnHvC7A-A@mail.gmail.com>
Date: Sat, 3 Oct 2015 22:32:41 +0200
X-Google-Sender-Auth: _jHfOsUXN8kxRUS_IkT8Y5Hy5fo
Message-ID: <CANTDXNecZ0BeQjMLPoQyK47zXeCKs=5RU_pb7mvOY_OQBdejzw@mail.gmail.com>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH][meta-multimedia] mkvtoolnix: fix Boost 1.58 build, update to 7.9.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Oct 2015 20:32:42 -0000
Content-Type: text/plain; charset=UTF-8

Thanks Martin, will do and send a v2.

Regards,

*Manuel Bachmann, Graphics Engineer www.iot.bzh <http://iot.bzh> *


2015-10-03 22:00 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:

> List all submodules in SRC_URI, we shouldn't bypass bitbake fetcher in
> do_configure.
>
> On Sat, Oct 3, 2015 at 6:40 PM, Manuel Bachmann <manuel.bachmann@iot.bzh>
> wrote:
>
> > mkvtoolnix does not compile with newest Boost 1.58, mostly
> > due to the following bugs :
> > https://github.com/mbunkus/mkvtoolnix/issues/1172
> > https://github.com/mbunkus/mkvtoolnix/issues/1176
> >
> > Update to the version immediately subsequent to their
> > fixes, and adapt configure steps accordingly.
> >
> > Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> > ---
> >  meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> > b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> > index dd613b3..223b4ed 100644
> > --- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> > +++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> > @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM =
> > "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >
> >  DEPENDS = "curl boost expat zlib libebml libmatroska libogg libvorbis
> > bzip2 lzo file ruby-native"
> >
> > -PV = "7.1.0+git${SRCPV}"
> > -SRCREV = "0c89ff941bfdd9f3378312f293a84f13cf3e2a96"
> > +PV = "7.9.0+git${SRCPV}"
> > +SRCREV = "1a8b23b1e82ed180a5aaeb43537f2426be252985"
> >  SRC_URI = "git://github.com/mbunkus/mkvtoolnix.git"
> >
> >  S = "${WORKDIR}/git"
> > @@ -28,7 +28,9 @@ EXTRA_OECONF = " --with-boost-libdir=${STAGING_LIBDIR}
> \
> >
> >  # remove some hardcoded searchpaths
> >  do_configure_prepend() {
> > -    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e
> > s:/usr/local/include:${STAGING_INCDIR}:g ${S}/ac/ebml.m4
> > +    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e
> > s:/usr/local/include:${STAGING_INCDIR}:g ${S}/ac/qt5.m4
> > +    git submodule init
> > +    git submodule update
> >  }
> >
> >  # Yeah, no makefile
> > --
> > 1.8.3.1
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

