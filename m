Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id A38BE72A78
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Sep 2015 16:28:23 +0000 (UTC)
Received: by ioii196 with SMTP id i196so99536252ioi.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Sep 2015 09:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=efsIhRCLdvVQ8EoqLtn1iJpXzXLeCvEcYsATSxj10/g=;
	b=BhY18hd4qVD57q8L0G9f7Q8ejIBQcs749ReuyKB/4Nju3HvNpFLuwr+WGt9B7+7uCE
	aHGJ3eC7wJ2HAiaymNiOfbqmOwHsM82qeUOuxQ9adHoxISeWRPhsoaxS4MfU1jMPoLPI
	P1oWAFKoDSxAYJJceG1xF+P8WqMUTv12nP0BKLpVhAuB8SxQjJbJTxBOhAtcPWDS3lOQ
	O3CIlF9lQBpU8oTlzc0ZAV371MMCv/RG0xhWZ5h7ITRvwtAGGssWSmLy+Hw+DkOXxJCH
	euGYehRZ/GkS4gr1/xJgEQJyHxyfufbFKJd19X0YPTt/qWn6Hup0eAnm4iUg1qvS5T2J
	nEDQ==
X-Received: by 10.107.40.201 with SMTP id o192mr11273104ioo.83.1442766504082; 
	Sun, 20 Sep 2015 09:28:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Sun, 20 Sep 2015 09:28:04 -0700 (PDT)
In-Reply-To: <CAMKF1sr7v_fvQWPCER9b4paztM2smVUs95Z_B8zUPa68Kp+0GA@mail.gmail.com>
References: <1442761673-22041-1-git-send-email-schnitzeltony@googlemail.com>
	<1442761673-22041-2-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1sr7v_fvQWPCER9b4paztM2smVUs95Z_B8zUPa68Kp+0GA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Sun, 20 Sep 2015 09:28:04 -0700
X-Google-Sender-Auth: vkx5CPc80aYbuinhUu9--JL5xz4
Message-ID: <CABcZAN=kLRqeaCuS-vKR3t1xCDp8fGTU_P1MFLyDoCppMbEQXg@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] plymouth: building documatation sometimes fails to download so disable it
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
X-List-Received-Date: Sun, 20 Sep 2015 16:28:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2015 at 8:14 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Sep 20, 2015 at 8:07 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
> > | I/O error : Attempt to load network entity
> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
> > | warning: failed to load external entity "
> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl"
> > | cannot parse
> http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
> > | Makefile:622: recipe for target 'plymouth.1' failed
> >
>
> this is ok
>
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> > ---
> >  meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> > index b8c82ed..1fb4443 100644
> > --- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> > +++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
> > @@ -19,7 +19,7 @@ SRC_URI =3D "
> http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.ta
> >  SRC_URI[md5sum] =3D "ff420994deb7ea203df678df92e7ab7d"
> >  SRC_URI[sha256sum] =3D
> "2f0ce82042cf9c7eadd2517a1f74c8a85fa8699781d9f294a06eade29fbed57f"
> >
> > -EXTRA_OECONF +=3D " --enable-shared --disable-static --disable-gtk \
> > +EXTRA_OECONF +=3D " --enable-shared --disable-static --disable-gtk
> --disable-documentation\
>

At some point we really need to add packageconfigs for all the
documentation generation options and then add distro feature(s) to control
the default state of them. Not saying we need to do that now, but
eventually.. I think someone had started working on getting docbook native
bits working recently..
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

