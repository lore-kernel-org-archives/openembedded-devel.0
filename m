Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 274F460FEE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2013 10:27:17 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id r16so843226ead.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2013 03:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NMmRuYne7SYwarRnNCmrJm1444uVmTtahSIZLGe1UYg=;
	b=e0nnsdC/Hg6ob21HB4KW6RsE45VFtRBCOZKeap5mtoWtwAk/OE8f9S1NlMhJ4ioUFt
	M1jl1/LeJuPiEo9jZcj8zTOgB0YeUXs8FYRf4EZqR1uWomuU5FSBdKydnnGT+akvAH3x
	PUY4wOt96QRBmBQ386WCLnn7Yf8TEl79f//2n6g3iuAmr9GSWsS8kERXV40jHjhV/p4t
	zsIv5h2G96xGzGAaSraoOy0yPij3DBPzDTemi4skEfUOuUCkQm02ukyIm4LhavpcLoUE
	yjLKBWlMXM61M7boXMwTCvXBQrgJG62iINfImbL2tOMi/KMxnzndgDDQrj5mhVbNF63Q
	ikYg==
X-Received: by 10.15.94.142 with SMTP id bb14mr42197417eeb.112.1374748037018; 
	Thu, 25 Jul 2013 03:27:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm72627033eeh.11.2013.07.25.03.27.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 25 Jul 2013 03:27:16 -0700 (PDT)
Date: Thu, 25 Jul 2013 12:27:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130725102740.GC17913@jama>
References: <1374701507-26976-1-git-send-email-chgans@gna.org>
	<20130724215553.GB17913@jama> <51F06DC0.5080802@gna.org>
MIME-Version: 1.0
In-Reply-To: <51F06DC0.5080802@gna.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-qt5][dylan][PATCH] qtbase.inc: Fix qtbase-tools runtime depencency on perl
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
X-List-Received-Date: Thu, 25 Jul 2013 10:27:19 -0000
X-Groupsio-MsgNum: 45499
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Content-Disposition: inline

--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2013 at 12:13:52PM +1200, Christian Gagneraud wrote:
> On 25/07/13 09:55, Martin Jansa wrote:
> > On Thu, Jul 25, 2013 at 09:31:47AM +1200, Christian Gagneraud wrote:
> >> While building a custom rootfs using poky, meta-oe, meta-ti and meta-q=
t5 (all on Dylan branch), I got the following error:
> >> [...]
> >> | Computing transaction...error: Can't install qtbase-tools-5.0.2-r2.0=
@armv7a_vfp_neon: no package provides /usr/bin/perl
> >> [...]
> >>
> >> qtbase-tools seems to depends on perl (at runtime), but this wasn't sp=
ecified in any bb file, this patch fixes it.
> >
> > Have you tried which files require perl?
>=20
> I didn't, but now I did:
> christiaga@krys-red:~/projects/yocto/poky-ti-qt5$ file=20
> build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/5.0.2-r2.0/packa=
ge/usr/bin/qt5/*|grep=20
> -i perl
> build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/qtbase/5.0.2-r2.0/packa=
ge/usr/bin/qt5/syncqt:=20
> Perl script, ASCII text executable

Merged in dylan and master with small modifications, thanks.

>=20
> >
> >>
> >> Signed-off-by: Christian Gagneraud <chgans@gna.org>
> >> ---
> >>   recipes-qt/qt5/qtbase.inc | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
> >> index f521a30..a72a3d6 100644
> >> --- a/recipes-qt/qt5/qtbase.inc
> >> +++ b/recipes-qt/qt5/qtbase.inc
> >> @@ -23,6 +23,8 @@ SRC_URI +=3D " \
> >>
> >>   DEPENDS +=3D "qtbase-native freetype jpeg libpng zlib openssl glib-2=
=2E0 ${ICU} udev ${XCB_DEPENDS} ${GL_DEPENDS} ${TSLIB_DEPENDS} ${FONTCONFIG=
_DEPENDS}"
> >>
> >> +RDEPENDS_${PN}-tools +=3D "perl"
> >> +
> >>   # to provide xcb/xcb_icccm.h, xcb/xcb_image.h, xcb/xcb_keysyms.h and=
 dbus/dbus.h
> >>   # XCB_DEPENDS +=3D "xcb-util-wm xcb-util-image xcb-util-keysyms dbus"
> >>   # reenable when we switch to "-qt-xcb" and build of
> >> --
> >> 1.8.1.2
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHw/ZwACgkQN1Ujt2V2gBw6JACfa6nQPNITJLxO/nx8jlVF04eU
7YsAnRQukM0CZW3tpI9Jv5y/u8NhgLDT
=xe0G
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
