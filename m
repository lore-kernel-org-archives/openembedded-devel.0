Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0A52A6EEF5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Feb 2014 01:13:00 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id d49so1826951eek.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 17:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BJ3URCHKhTuZrXd+NkY5lXbvGKDWTUl4Okh+pi0/sQ0=;
	b=BIIbSVqwsKiTkkExXAiUu+Nel0f3mLH9+gvlbSJtkaL5phWmaqOR13QOuuHLd7lwLc
	fYWwt3kVQw5KNyE3/S8Qph/tthWx4DYqLVMMXjTuD/EXrM71F7c9W7geOSj1pxLVSOpR
	jpLRP6zZVyIfEx8OAXyfSPoqdUBdtAHVdY+LDzApRIJX/417suUUA+eOcjObSNCNfT+o
	NRP9D1Vjp0KXhvC22kbE4OmUxKmUWJx62dn+2+7VApQVtJ4QMLfxbdXFe9fj4dZOtj+d
	lT1hNJ72vCDSQ6FZkqopUhaWXgrZ8+MltAwfxDwvEljNUxq0JTBwBceqGK2vJFW9JZq/
	8WBg==
X-Received: by 10.15.35.66 with SMTP id f42mr516981eev.93.1393549981039;
	Thu, 27 Feb 2014 17:13:01 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f45sm4069125eeg.5.2014.02.27.17.12.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Feb 2014 17:12:59 -0800 (PST)
Date: Fri, 28 Feb 2014 02:13:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140228011301.GG26981@jama>
References: <1393446351-9280-1-git-send-email-obi@opendreambox.org>
	<20140226210522.GT26981@jama> <530FDF58.8040505@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <530FDF58.8040505@opendreambox.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][PATCH] qtwebkit: accept gstreamer 0.10 as an option
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
X-List-Received-Date: Fri, 28 Feb 2014 01:13:03 -0000
X-Groupsio-MsgNum: 48439
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lBUySHvE0PL2msxU"
Content-Disposition: inline

--lBUySHvE0PL2msxU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2014 at 01:59:04AM +0100, Andreas Oberritter wrote:
> On 26.02.2014 22:05, Martin Jansa wrote:
> > On Wed, Feb 26, 2014 at 09:25:51PM +0100, Andreas Oberritter wrote:
> >> There's no configuration knob, though. QtWebKit will prefer
> >> gstreamer 1.0 if available.
> >=20
> > Can you please add configuration knob first?
> >=20
> > The problem is that without the knob it will be undeterministic, with
> > gstreamer010 in PACKAGECONFIG you can run 2nd build with gstreamer10
> > already staged for some other component and the resulting qtwebkit will
> > be different than in 1st build.
>=20
> I'll see what I can do. I'm not a big fan of (Qt)WebKit's build system,
> so this might take a while.

You can use the same hack as I've used in qtmultimedia, it's not nice,
but works.

> FWIW, I noticed that qtlocation and qtsensors are optional build
> dependencies which need packageconfigs, too.

True, we're even disabling qtlocation in some our builds (because of
qt3d dependency), so having PACKAGECONFIG would be very appreciated.


> >> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> >> ---
> >>  recipes-qt/qt5/qtwebkit.inc | 6 +++++-
> >>  1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/recipes-qt/qt5/qtwebkit.inc b/recipes-qt/qt5/qtwebkit.inc
> >> index aea9dad..5e96f39 100644
> >> --- a/recipes-qt/qt5/qtwebkit.inc
> >> +++ b/recipes-qt/qt5/qtwebkit.inc
> >> @@ -5,7 +5,11 @@ LIC_FILES_CHKSUM =3D "file://Source/WebCore/rendering=
/RenderApplet.h;endline=3D22;md
> >>                      file://Source/WebKit/gtk/webkit/webkit.h;endline=
=3D21;md5=3Db4fbe9f4a944f1d071dba1d2c76b3351 \
> >>                      file://Source/JavaScriptCore/parser/Parser.h;endl=
ine=3D21;md5=3Dbd69f72183a7af673863f057576e21ee"
> >> =20
> >> -DEPENDS +=3D "qtdeclarative qtlocation qtsensors ${ICU} ruby-native s=
qlite3 glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base libxslt"
> >> +DEPENDS +=3D "qtdeclarative qtlocation qtsensors ${ICU} ruby-native s=
qlite3 glib-2.0 libxslt"
> >> +
> >> +PACKAGECONFIG ??=3D "gstreamer10"
> >> +PACKAGECONFIG[gstreamer010] =3D ",,gstreamer gst-plugins-base"
> >> +PACKAGECONFIG[gstreamer10] =3D ",,gstreamer1.0 gstreamer1.0-plugins-b=
ase"
> >> =20
> >>  # qtwebkit gets terribly big when linking with all debug info, disabl=
e by default
> >>  QTWEBKIT_DEBUG =3D "QMAKE_CFLAGS+=3D-g0 QMAKE_CXXFLAGS+=3D-g0"
> >> --=20
> >> 1.8.3.2
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lBUySHvE0PL2msxU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMP4p0ACgkQN1Ujt2V2gBwv3wCgjQ4gVcMwSTjWDh4HSK3067xH
FZUAn2q0nuhLl3TjCDPcUAyIzQHfacql
=+rHI
-----END PGP SIGNATURE-----

--lBUySHvE0PL2msxU--
