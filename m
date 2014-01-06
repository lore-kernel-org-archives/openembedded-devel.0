Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 43DF860D68
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2014 10:32:04 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id o10so7665460eaj.18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2014 02:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mE5ytiDxjY56ymr6ElIh/aIJHlpKADdBrnbeVENWmRU=;
	b=lsKwr2hED3L9895SR0vknFY3ub1eqV1Af21NXzRdryV4N09X0tsQHfNCaQ54XbOCoM
	sUXOPuLY91G+nLjqahc/RYv8/mMEqB/Xe6LGAP+AvvtxwUk1XZ0nkdqmO5LyLDDG2Nsw
	8vVW87ABXj8+WIlLk9/AN3kbAj/Wlnqq9zJpH3gY770wHSLUqwcy5a9PZiksDT3Hhax5
	G7D0oLXURyvFpDw2SVT16YQm9nKxfxpbqTJ+aQZWXn0oQLnKs6595InhmX1x3gLZGf2Z
	/qY0yC7GylX4R1nVU1ByOu2dNl2UflibtwbhroXSWbZPZfG1G4Ixg/Bhaa1pEh0Z+Kl8
	P/9w==
X-Received: by 10.15.36.135 with SMTP id i7mr14949957eev.93.1389004324811;
	Mon, 06 Jan 2014 02:32:04 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 4sm169688348eed.14.2014.01.06.02.32.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Jan 2014 02:32:03 -0800 (PST)
Date: Mon, 6 Jan 2014 11:32:11 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140106103211.GF3709@jama>
References: <1388489871-14502-1-git-send-email-Martin.Jansa@gmail.com>
	<CAP71Wjwq17ZZ9K_tWPBEq3A3rOPe4HmCfhOEKHfgy_0pVzmpUg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71Wjwq17ZZ9K_tWPBEq3A3rOPe4HmCfhOEKHfgy_0pVzmpUg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][PATCH] qtwebkit: Depend on gstreamer-1.0 instead of 0.10
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
X-List-Received-Date: Mon, 06 Jan 2014 10:32:06 -0000
X-Groupsio-MsgNum: 47604
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w/VI3ydZO+RcZ3Ux"
Content-Disposition: inline

--w/VI3ydZO+RcZ3Ux
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2014 at 11:22:27AM +0100, Nicolas Dechesne wrote:
> On Tue, Dec 31, 2013 at 12:37 PM, Martin Jansa <martin.jansa@gmail.com>wr=
ote:
>=20
> > * since this commit:
> >   commit e0debe138cb59c140ebbc69755d36028d2b89459
> >   Author: Allan Sandfeld Jensen <allan.jensen@digia.com>
> >   Date:   Thu Feb 28 13:42:27 2013 +0100
> >   Subject: Switch QtWebKit to GStreamer 1.0.
> >
> >   qtwebkit supports 1.0 and will use that by default when found
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  recipes-qt/qt5/qtwebkit.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
> > index c0e0648..9b334ae 100644
> > --- a/recipes-qt/qt5/qtwebkit.inc
> > +++ b/recipes-qt/qt5/qtwebkit.inc
> > @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
> > "file://Source/WebCore/rendering/RenderApplet.h;endline=3D22;md
> >
> >  file://Source/WebKit/gtk/webkit/webkit.h;endline=3D21;md5=3Db4fbe9f4a9=
44f1d071dba1d2c76b3351
> > \
> >
> >  file://Source/JavaScriptCore/parser/Parser.h;endline=3D23;md5=3Db57c8a=
2952a8d0e655988fa0ecb2bf7f"
> >
> > -DEPENDS +=3D "qtdeclarative qtlocation qtsensors ${ICU} ruby-native sq=
lite3
> > glib-2.0 gstreamer gst-plugins-base libxslt"
> > +DEPENDS +=3D "qtdeclarative qtlocation qtsensors ${ICU} ruby-native sq=
lite3
> > glib-2.0 gstreamer-1.0 gst-plugins-base-1.0 libxslt"
> >
> >  # qtwebkit gets terribly big when linking with all debug info, disable=
 by
> > default
> >  QTWEBKIT_DEBUG =3D "QMAKE_CFLAGS+=3D-g0 QMAKE_CXXFLAGS+=3D-g0"
> >
>=20
> hmm. that's a bit rough... GST1.0 for ARM SoC is (sadly) still not the
> norm.. I haven't checked upstream, but does it still support 0.10 or 1.0 =
or
> only 1.0? If both are supported could (should?) we use PACKAGECONFIG to
> offer both in our recipe?

PACKAGECONFIG is possible and even easier with this upstream change
(before it was always checking for 0.10 first and you would need to
patch .pri file first to make the dependency deterministic).

> right now i am using the dora branch and qt5.1.1 which hasn't been updated
> for a while, which is fine.

This is only for master which will soon became just qt5.2.0 where
gstreamer-1.0 is used by default and I believe more tested than
integration with gstreamer-0.10.

So it won't change anything for people using 5.1.1 from dora branch. If
someone really wants to use gst-0.10 with 5.2.0 I would accept patch for
PACKAGECONFIG.

gst-1.0* seems to be working fine for our ARM project and
we've removed all gst-0.10 from our images lately - that's why I've
noticed this qtwebkit dependency.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w/VI3ydZO+RcZ3Ux
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLKhisACgkQN1Ujt2V2gBxAaACeID4Q0zLo2a/AWyLFFodv34n+
UMkAnjNzFtRmzrHMdHtMjudPe3/PL6RO
=bTJa
-----END PGP SIGNATURE-----

--w/VI3ydZO+RcZ3Ux--
