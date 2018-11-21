Return-Path: <fabien.lahoudere@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id C7F076C278
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2018 09:46:00 +0000 (UTC)
Received: from laptop-1.home (unknown
	[IPv6:2a01:cb19:8ad6:900:42dd:dd1c:19ee:7c60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested) (Authenticated sender: aragua)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 29ED6272302;
	Wed, 21 Nov 2018 09:46:01 +0000 (GMT)
Message-ID: <fe3ea60453e5639708e490f2581822d1f9bec293.camel@collabora.com>
From: Fabien Lahoudere <fabien.lahoudere@collabora.com>
To: akuster808 <akuster808@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Nov 2018 10:45:58 +0100
In-Reply-To: <45f1378d-c17c-58ab-68bb-0b030e9cd8b1@gmail.com>
References: <1542730446-30253-1-git-send-email-fabien.lahoudere@collabora.com>
	<CA+chaQfN9Y+0TwfdcUc0mCzibX-U94SS9gR4NKGvF-FpCR5ekg@mail.gmail.com>
	<45f1378d-c17c-58ab-68bb-0b030e9cd8b1@gmail.com>
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] evince: Drop x11 requirement
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
X-List-Received-Date: Wed, 21 Nov 2018 09:46:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi

Le mardi 20 novembre 2018 à 10:01 -0700, akuster808 a écrit :
> 
> On 11/20/18 8:36 AM, Martin Jansa wrote:
> > This was already removed once in:
> > 
> > commit 33c822a7c11df08f35dda18a44aae730f93c6130
> > Author: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> > Date:   Wed Sep 6 18:53:07 2017 +0200
> > 
> >     evince: Remove X dependency
> > 
> >     gnome-desktop is the only X dependency for evince.
> >     In order to build evince for Wayland based system without X
> > support,
> >     gnome-desktop is added to DEPENDS only if x11 exists in
> > DISTRO_FEATURES.
> >     So x11 is dropped from REQUIRED_DISTRO_FEATURES.
> > 
> >     Signed-off-by: Fabien Lahoudere <
> > fabien.lahoudere@collabora.co.uk>
> >     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > 
> > and then returned here:
> > commit 62376d673aa86b5f8ffb26c8a74046ee87ef4f66
> > Author: Armin Kuster <akuster808@gmail.com>
> > Date:   Wed Mar 7 08:08:57 2018 -0800
> > 
> >     evince: only include when x11 in DISTRO_FEATURES
> > 
> >     Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > 
> > What's going on? But if everybody agrees on removing it, then you
> > should
> > remove the distro_features_check inherit as well.
> 
> Please run the yocto-check-layer.  Maybe another solution needs to
> submitted to get this to pass.
> 

I tested evince with two machines using wayland only and it builds and
runs correctly. X11 is not required to build this recipe and I think
that sanity-meta-gnome.bbclass leads to a wrong error message and is
redundant with 'REQUIRED_DISTRO_FEATURE ="x11"'.
Do you agree to drop this sanity check from meta-gnome?

Thanks

Fabien

> - armin
> > On Tue, Nov 20, 2018 at 5:24 PM Fabien Lahoudere <
> > fabien.lahoudere@collabora.com> wrote:
> > 
> > > evince works fine in a wayland only distribution.
> > > x11 requirement is not needed.
> > > 
> > > Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
> > > ---
> > >  meta-gnome/recipes-gnome/evince/evince_3.28.2.bb | 2 --
> > >  1 file changed, 2 deletions(-)
> > > 
> > > diff --git a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
> > > b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
> > > index 8bf8a04..01f581a 100644
> > > --- a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
> > > +++ b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
> > > @@ -6,8 +6,6 @@ DEPENDS = "gtk+3 libsecret
> > > ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-d
> > > 
> > >  inherit gnome pkgconfig gtk-icon-cache gsettings gobject-
> > > introspection
> > > distro_features_check systemd
> > > 
> > > -REQUIRED_DISTRO_FEATURES = "x11"
> > > -
> > >  SRC_URI =
> > > "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-
> > > ${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive
> > > \
> > >             file://0001-help-remove-YELP-macro.patch \
> > >             file://0001-Add-format-attribute-to-
> > > _synctex_malloc.patch \
> > > --
> > > 1.8.3.1
> > > 
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > 
> 
> 


