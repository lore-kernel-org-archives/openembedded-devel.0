Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBDCC388F3
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:36 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.515.1649378734347949890
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Apr 2022 17:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 269B440D48;
	Fri,  8 Apr 2022 00:45:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U5b8Uy7rMb1J; Fri,  8 Apr 2022 00:45:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F391240D40;
	Fri,  8 Apr 2022 00:45:29 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3B0D71748D3; Thu,  7 Apr 2022 20:45:29 -0400 (EDT)
Date: Thu, 7 Apr 2022 20:45:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Samuli Piippo <samuli.piippo@gmail.com>
Cc: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] wxwidgets: Fix checking for
 PACKAGECONFIG and DISTRO_FEATURES
Message-ID: <20220408004529.GP23554@denix.org>
References: <20220402032642.107153-1-liezhi.yang@windriver.com>
 <CABXoSoWMamXg3MaxzvJmRovNAQDJqXa2ZZ9dBC=CFg5EJgvNGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CABXoSoWMamXg3MaxzvJmRovNAQDJqXa2ZZ9dBC=CFg5EJgvNGQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96467

On Thu, Apr 07, 2022 at 09:55:41AM +0300, Samuli Piippo wrote:
> This commit breaks builds when DISTRO_FEATURES has opengl, but not x11.

Same here! Moreover, it does not simply breaks the build, it breaks *parsing* 
even when not building wxwidgets! Please fix ASAP or revert.


> ERROR: //meta-openembedded/meta-oe/recipes-extended/wxwidgets/
> wxwidgets_3.1.5.bb: wxwidgets: PACKAGECONFIG[no_gui] Conflict package
> config 'opengl' set in PACKAGECONFIG.
> 
> On Sat, 2 Apr 2022 at 06:26, Robert Yang <liezhi.yang@windriver.com> wrote:
> 
> > The PACKAGECONFIG depends on DISTRO_FEATURES, not DISTRO_FEATURES depends
> > on
> > PACKAGECONFIG. And the REQUIRED_DISTRO_FEATURES is not needed since it can
> > work
> > with gtk or x11.
> >
> > Fixed when x11 is not in DISTRO_FEATURES:
> > $ bitbake wxwidgets
> > ERROR: Nothing PROVIDES 'wxwidgets'
> > wxwidgets was skipped: missing required distro feature 'x11' (not in
> > DISTRO_FEATURES)
> >
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ---
> >  meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> > b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> > index f9349b02a..b10742eac 100644
> > --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> > +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
> > @@ -10,10 +10,7 @@ LICENSE = "WXwindows"
> >  LIC_FILES_CHKSUM =
> > "file://docs/licence.txt;md5=981f50a934828620b08f44d75db557c6"
> >
> >  inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt', 'cmake_qt5', 'cmake',
> > d)}
> > -inherit features_check lib_package binconfig pkgconfig
> > -
> > -# All toolkit-configs except 'no_gui' require x11 explicitly (see
> > toolkit.cmake)
> > -REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG',
> > 'no_gui', '', 'x11', d)}"
> > +inherit lib_package binconfig pkgconfig
> >
> >  DEPENDS += " \
> >      jpeg \
> > @@ -46,7 +43,11 @@ EXTRA_OECMAKE:append:libc-musl = " \
> >      -DHAVE_LOCALE_T=OFF \
> >  "
> >
> > -PACKAGECONFIG ?= "gtk ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
> > +# All toolkit-configs except 'no_gui' require x11 explicitly (see
> > toolkit.cmake)
> > +PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk',
> > 'no_gui', d)} \
> > +    ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)} \
> > +"
> > +
> >  PACKAGECONFIG:remove:class-native = "opengl"
> >
> >  # Note on toolkit-PACKAGECONFIGs: select exactly one of 'no_gui' / 'gtk'
> > / 'qt'
> > --
> > 2.31.1

