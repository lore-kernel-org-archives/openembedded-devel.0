Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3544D6E9AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 16:09:42 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z10so1755824ead.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2014 08:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hnqNVgMlTJGrDlCKnyw7Hi5v5A9X2LJKqL8xshuGqLc=;
	b=Wgsd6K/bzaSY7gyoDNPID5lFXUarCgJAgMDHSJCOttKjav/+WcqSGeo6XK9DGCRoMW
	H6zrbLw7UxSln08vRZwwSiD+9eYOfffmNeu1vqwtW8to3bQoRdvbf66gWjC0yfI6mXZ9
	rUg8H4heruSflWn3Y7yf+U165lNIKgEnm77TyXpmOyRRT4uq+a7wXPu7z/3aV19T4zo/
	CHWmpKlWHcN62+giLK9sgc4g6RXi3CUsQNNhGINkMrU+l6kOFoebRZjtqwiJPZsnSXms
	7N+9rJVTI/7GSfFSR/RomJCKSrw5BI+kdzU29RqueaUViGBr5cIpaH1eh6WBsGHuPW/d
	dzXw==
X-Received: by 10.14.37.131 with SMTP id y3mr18000659eea.1.1391098180079;
	Thu, 30 Jan 2014 08:09:40 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k41sm24072210eey.0.2014.01.30.08.09.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jan 2014 08:09:38 -0800 (PST)
Date: Thu, 30 Jan 2014 17:09:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: krzysztof.m.sywula@intel.com
Message-ID: <20140130160945.GT3718@jama>
References: <1391094865-10288-1-git-send-email-krzysztof.m.sywula@intel.com>
MIME-Version: 1.0
In-Reply-To: <1391094865-10288-1-git-send-email-krzysztof.m.sywula@intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org,
	Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Subject: Re: [dylan][PATCH] cloud9: merging sources list with master
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
X-List-Received-Date: Thu, 30 Jan 2014 16:09:44 -0000
X-Groupsio-MsgNum: 47959
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BcZrms9gUsdgyR6a"
Content-Disposition: inline

--BcZrms9gUsdgyR6a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2014 at 03:14:25PM +0000, krzysztof.m.sywula@intel.com wrot=
e:
> From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>

For dylan branch please Cc Eric B=E9nard <eric@eukrea.com>

and this would be better as 2 cherry-picks from master:
5baa832786ad67a3c69a9a2e64ba1da53662e5d4
07453a3a916686668c03e3e7727b9cfd54bdb621

and make sure they are in "dora" before "dylan"

>=20
> Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> ---
>  meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/reci=
pes-devtools/cloud9/cloud9_0.6.bb
> index 3300fd2..44b2142 100644
> --- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
> +++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://c9.io"
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4784c3bcff601fd8f9515f52a11e7=
018"
> =20
> -PR =3D "r4"
> +PR =3D "r5"
> =20
>  # Nodejs-native for node-waf, nodejs4-native for the headers
>  DEPENDS =3D "libxml2 nodejs-native nodejs4-native"
> @@ -16,12 +16,12 @@ SRC_URI =3D "git://github.com/ajaxorg/cloud9.git;name=
=3Dcloud9ide \
>             git://github.com/ajaxorg/ace.wiki.git;destsuffix=3Dgit/suppor=
t/ace/doc/wiki;name=3Dacewiki \
>             git://github.com/ajaxorg/apf.git;destsuffix=3Dgit/support/apf=
;name=3Dapf \
>             git://github.com/ajaxorg/async.js.git;destsuffix=3Dgit/suppor=
t/asyncjs;name=3Dasyncjs \
> -           git://github.com/ajaxorg/connect.git;destsuffix=3Dgit/support=
/connect;name=3Dconnect \
> +           git://github.com/ajaxorg/connect.git;destsuffix=3Dgit/support=
/connect;name=3Dconnect;branch=3Dajaxorg \
>             git://github.com/jashkenas/coffee-script.git;destsuffix=3Dgit=
/support/connect/support/coffee-script;name=3Dcoffee-script \
>             git://github.com/visionmedia/expresso.git;destsuffix=3Dgit/su=
pport/connect/support/expresso;name=3Dexpresso \
>             git://github.com/visionmedia/node-jscoverage.git;destsuffix=
=3Dgit/support/connect/support/expresso/deps/jscoverage;name=3Djscoverage \
>             git://github.com/cloudhead/less.js.git;destsuffix=3Dgit/suppo=
rt/connect/support/less;name=3Dless \
> -           git://github.com/visionmedia/sass.js.git;destsuffix=3Dgit/sup=
port/connect/support/sass;name=3Dsass \
> +           git://github.com/matehat/sass.js.git;destsuffix=3Dgit/support=
/connect/support/sass;name=3Dsass \
>             git://github.com/ajaxorg/jsDAV.git;destsuffix=3Dgit/support/j=
sdav;name=3Djsdav \
>             git://github.com/fjakobs/async.js.git;destsuffix=3Dgit/suppor=
t/jsdav/support/async.js;name=3Dasync-js \
>             git://github.com/felixge/node-formidable.git;destsuffix=3Dgit=
/support/jsdav/support/formidable;name=3Dformidable \
> @@ -29,7 +29,7 @@ SRC_URI =3D "git://github.com/ajaxorg/cloud9.git;name=
=3Dcloud9ide \
>             git://github.com/Gozala/streamer.git;destsuffix=3Dgit/support=
/jsdav/support/jsftp/support/streamer;name=3Dstreamer \
>             git://github.com/ajaxorg/node-sftp.git;destsuffix=3Dgit/suppo=
rt/jsdav/support/node-sftp;name=3Dsftp \
>             git://github.com/ajaxorg/lib-v8debug.git;destsuffix=3Dgit/sup=
port/lib-v8debug;name=3Dlib-v8debug \
> -           git://github.com/ajaxorg/socket.io.git;destsuffix=3Dgit/suppo=
rt/socket.io;name=3Dsocketio \
> +           git://github.com/ajaxorg/socket.io.git;destsuffix=3Dgit/suppo=
rt/socket.io;name=3Dsocketio;branch=3Dcadorn-upstream \
>             git://github.com/LearnBoost/socket.io-client.git;destsuffix=
=3Dgit/support/socket.io-client;name=3Dsocketio-client \
>             git://github.com/ajaxorg/treehugger.git;destsuffix=3Dgit/supp=
ort/treehugger;name=3Dtreehugger \
>             git://github.com/ajaxorg/UglifyJS.git;destsuffix=3Dgit/suppor=
t/uglify-js;name=3Duglify-js \
> --=20
> 1.7.12.2
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BcZrms9gUsdgyR6a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLqeUkACgkQN1Ujt2V2gBzLDwCeIJZtzF+MYQNNH0Y7e92A0/jz
pUoAoIXWe7AnwShepEbKOVRAtmvjqia6
=0yV4
-----END PGP SIGNATURE-----

--BcZrms9gUsdgyR6a--
