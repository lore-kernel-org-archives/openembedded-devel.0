Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 78C626C959
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 10:14:35 +0000 (UTC)
Received: by mail-ea0-f182.google.com with SMTP id a15so3197480eae.41
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 02:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=elmH9aMdGZz+Im1WOwRFWvMXGojmlk9ewMo/gr0b49M=;
	b=J2DnJkDtE7FKS/yQnRSo+LYgztgBofISTm+H2i6Di1eITE6ekQ5A9nC48tztSDay1i
	9+QmGTBKuwoiRWHjdFZRiVZqJqD+LDq+Db9d+1Lfb2jM9XvwWSXtNrhOOrUW8DIOVb4l
	Nl2dJ8Q0ccKEUpX/WMwDVbQD5MmRVbd1P6t8DqMSaF93s9wc24EQm+OZX4vnIGD8UmZG
	KCqMLMjnDuzduXDTBUsWkaCsdsMHwmE+sH3yBpGjpBrFFON8rAsPlpF/AdgjRDQCgnQv
	TuPdFuaPh4y9wicjZaoT1E7zbjp/pxVdUkbu76+lYz0KwoezDgVnXCN9IGSsqZWnDGMA
	OaeA==
X-Received: by 10.14.208.199 with SMTP id q47mr26870858eeo.77.1389608076092;
	Mon, 13 Jan 2014 02:14:36 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 4sm38331024eed.14.2014.01.13.02.14.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Jan 2014 02:14:35 -0800 (PST)
Date: Mon, 13 Jan 2014 11:14:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140113101453.GJ16995@jama>
References: <1389286106-30118-1-git-send-email-schnitzeltony@googlemail.com>
	<1389286106-30118-2-git-send-email-schnitzeltony@googlemail.com>
	<20140109232937.GM3709@jama>
MIME-Version: 1.0
In-Reply-To: <20140109232937.GM3709@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [PATCH][meta-qt5][jansa/qt5-5.2.0]] qtbase: fix typo in PATH_EXTERNAL_HOST_BINS-patch
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
X-List-Received-Date: Mon, 13 Jan 2014 10:14:36 -0000
X-Groupsio-MsgNum: 47695
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rnP2AJ7yb1j09OW/"
Content-Disposition: inline

--rnP2AJ7yb1j09OW/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2014 at 12:29:37AM +0100, Martin Jansa wrote:
> On Thu, Jan 09, 2014 at 05:48:26PM +0100, Andreas M=FCller wrote:
> > libraries based on cmake and depending on qt5qml failed to configure wi=
th:
> >=20
> > |   The imported target "Qt5::DBus" references the file
> > |
> > |      "/home/a.mueller/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bi=
n/qt5/qdbusxml2xml"
>=20
> Thanks, it's typo only in 5.2.0, there was extra bindir in paths and
> when I was fixing it I've noticed that OE_QMAKE_PATH_EXTERNAL_HOST_BINS
> wasint used for qdbus*.
>=20
> Last thing I want to fix in 5.2.0 before merge to master are wrong
> (mostly empty) PRIVATE_INCLUDE_DIRS variables in cmake - that's what
> prevents me to switch webos-ports to 5.2.0 now.
>=20
> A bit longer description is now included in
> https://github.com/meta-qt5/qtbase/blob/stable/oe-patches.txt

This is now fixed by last commit
https://github.com/meta-qt5/meta-qt5/tree/jansa/qt5-5.2.0

but I have found one new issue after this -
meta-webos-ports/recipes-qt/qt5/qt5-qpa-hwcomposer-plugin_git.bb
started to fail just after this header change, so I need to check if it
has some other bad side-effects.

and I would like to give Jacob a chance to debug
http://lists.openembedded.org/pipermail/openembedded-devel/2014-January/093=
688.html

> > Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> > ---
> >  .../0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determine-pa.patch   =
  | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST=
_BINS-to-determine-pa.patch b/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_=
EXTERNAL_HOST_BINS-to-determine-pa.patch
> > index e3f1b72..ea3364e 100644
> > --- a/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-t=
o-determine-pa.patch
> > +++ b/recipes-qt/qt5/qtbase/0014-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-t=
o-determine-pa.patch
> > @@ -54,7 +54,7 @@ index 1d94715..617efa8 100644
> >       set(imported_location \"${_qt5DBus_install_prefix}/$${CMAKE_BIN_D=
IR}qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
> >   !!ELSE
> >  -    set(imported_location \"$${CMAKE_BIN_DIR}qdbuscpp2xml$$CMAKE_BIN_=
SUFFIX\")
> > -+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbus=
xml2xml$$CMAKE_BIN_SUFFIX\")
> > ++    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbus=
cpp2xml$$CMAKE_BIN_SUFFIX\")
> >   !!ENDIF
> >       _qt5_DBus_check_file_exists(${imported_location})
> >  =20
> > --=20
> > 1.8.3.1
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rnP2AJ7yb1j09OW/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLTvJ0ACgkQN1Ujt2V2gBzenwCgiPLjxXJgGVCrr/S9u+fP2vIw
wSgAoJWgKm3eB0+2mqUfcfbDXb26z58B
=qAm5
-----END PGP SIGNATURE-----

--rnP2AJ7yb1j09OW/--
