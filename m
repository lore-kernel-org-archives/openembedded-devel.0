Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 73D5C6E7EF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 21:43:12 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c41so499462eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 13:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Bjs1tbDPkyY3j9yBCREEH3qEXgbyn0By8VG3mJMYZ80=;
	b=sEYNyZz098W3CIVZjsvtT5HI2Yfhh/JhINraJooB2z3rMJB4eWaBskZ69EkJAxut+G
	9PJCPTLpvwMPMm8TraukdktiFAO8DOAh+DsAqia1IJ0BYq6nL83g1A0nm1qQGppDEfs8
	nicwdd1pojCxA6QOF0lcDHI431t80JG9uLn/uGlvlEP9tzKpgdzqXjkb1W2oexGx6TiJ
	XRZvuPKfs/+bQm3dyTbCptpidLhDagKIBCK7t6XwfTFsg7KEkxuNGAyTdOF3Ybnnw0AP
	98Z6MFTdPraY0Y/DnMaRbV1fkz4F4Ttk2pMwtrPG2iaqPMrvuWxWiilbby5FTK1aw5B2
	Hmsw==
X-Received: by 10.15.26.8 with SMTP id m8mr4209893eeu.25.1390945392932;
	Tue, 28 Jan 2014 13:43:12 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id j42sm34882eep.21.2014.01.28.13.43.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jan 2014 13:43:12 -0800 (PST)
Date: Tue, 28 Jan 2014 22:43:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140128214318.GO3718@jama>
References: <1390944553-6780-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1390944553-6780-1-git-send-email-obi@opendreambox.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][RFC PATCH] libconnman-qt5: libconnman-qt, Qt5 edition
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
X-List-Received-Date: Tue, 28 Jan 2014 21:43:14 -0000
X-Groupsio-MsgNum: 47932
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mpb+VUhBqKoEsre9"
Content-Disposition: inline

--mpb+VUhBqKoEsre9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2014 at 10:29:13PM +0100, Andreas Oberritter wrote:
> * Please, don't apply! ;-)
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> Several questions arose regarding this recipe:
>=20
> 1.) Where to put it? It depends on both meta-openembedded and meta-qt5.

IIRC this would be the first requirement of meta-oe and I'm tempted to
say, put it in meta-qt5 but duplicate
recipes-qt/libconnman-qt/libconnman-qt.inc file as well :/

> 2.) Regarding OE_QMAKE_PATH_HEADERS: I stole this from maliit to fix a
>     compiler error, but the same assignment is also present in qt5.inc.
>     Shouldn't this rather be the default?

No, because not all qmake built components are using qt headers, see:
https://github.com/meta-qt5/meta-qt5/wiki/Building-with-OE#wiki-bad-include=
-paths-and-build-failing-to-find-qt5-headers

> 3.) libconnman-qt installs a qml plugin, resulting in:
>     | WARNING: QA Issue: libconnman-qt5: Files/directories were installed=
 but not shipped
>     | [...]
>     | ${STAGING_DIR_TARGET}/usr/lib/qt5/qml/MeeGo/Connman/libConnmanQtDec=
larative.so
>=20
>     How would I get rid of the STAGING_DIR_TARGET prefix? Is this an erro=
r in
>     qmake5.bblass? This doesn't happen with Qt4/X11 or Qt4/Embedded.

I've seen such (or similar) issues before in some recipes, but don't
really remember the details, can you please check if it does the same
with 5.1.1?

>  recipes-qt/libconnman-qt/libconnman-qt5_git.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 recipes-qt/libconnman-qt/libconnman-qt5_git.bb
>=20
> diff --git a/recipes-qt/libconnman-qt/libconnman-qt5_git.bb b/recipes-qt/=
libconnman-qt/libconnman-qt5_git.bb
> new file mode 100644
> index 0000000..bd91446
> --- /dev/null
> +++ b/recipes-qt/libconnman-qt/libconnman-qt5_git.bb
> @@ -0,0 +1,7 @@
> +inherit qmake5
> +
> +# Set path of qt5 headers as qmake5_base.bbclass sets this to just ${inc=
ludedir}
> +# but actually it is ${includedir}/qt5
> +OE_QMAKE_PATH_HEADERS =3D "${OE_QMAKE_PATH_QT_HEADERS}"
> +
> +require recipes-qt/libconnman-qt/libconnman-qt.inc
> --=20
> 1.8.3.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mpb+VUhBqKoEsre9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLoJHYACgkQN1Ujt2V2gBx6sQCfeccCxmSsu5upIJ9QSmm9/0ei
WIAAoKFlvGGN5Fw01i/89jAQxnWTqzh2
=Nxqk
-----END PGP SIGNATURE-----

--mpb+VUhBqKoEsre9--
