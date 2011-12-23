Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Re25Y-0008WA-6g
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Dec 2011 11:10:56 +0100
Received: by eeit10 with SMTP id t10so4876923eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Dec 2011 02:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GdKaB44+5zdWsvFt+83iJyKagWYtVZ+M7ehEeWSlca8=;
	b=OqL1V+N82WmZ5/oT6U0HgnB9N6lZESgGOL3lmlgFAki7vTJOFkhwHyPt6H8t9HpQwb
	NvJjRlDtEudCqwCUwVtncT1jL4kVP4ifb41/OFBGzwv7P6nsox8wYGxmbjdUPTViZ3CE
	+YSM5msCJdt5fmOY7JM0dM+TyQbQMCUN4RT5A=
Received: by 10.14.51.198 with SMTP id b46mr5717150eec.111.1324634629164;
	Fri, 23 Dec 2011 02:03:49 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s16sm46333324eef.2.2011.12.23.02.03.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Dec 2011 02:03:47 -0800 (PST)
Date: Fri, 23 Dec 2011 11:03:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111223100335.GO12791@jama.jama.net>
References: <1324447304-4874-1-git-send-email-b19537@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1324447304-4874-1-git-send-email-b19537@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH v2 meta-oe 1/7] xmlto: add version 0.0.25
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Dec 2011 10:10:56 -0000
X-Groupsio-MsgNum: 36261
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c2gYorpyS4gG0T74"
Content-Disposition: inline

--c2gYorpyS4gG0T74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 21, 2011 at 02:01:38PM +0800, b19537@freescale.com wrote:
> From: Zhenhua Luo <b19537@freescale.com>
>=20
>     xmlto converts an XML file (DocBook or XSL-FO) into a specified format
>     (PS, PDF, HTML, man, ASCII, XSL-FO, etc.)

Is there plan to provide native stylesheets too? Because after building
xmlto-native some packages are failing because they detect xmlto-native
available but don't check if all needed stylesheets are installed.

e.g. xtrans, libxdmcp:
| make[1]: Entering directory `/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-lin=
ux-gnueabi/xtrans/xtrans-1_1.2.6-r0/xtrans-1.2.6/doc'
| /OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/xmlto  xhtml-nochunks xtra=
ns.xml
| xmlto: /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/xtrans/xtra=
ns-1_1.2.6-r0/xtrans-1.2.6/doc/xtrans.xml does not validate (status 3)
| xmlto: Fix document syntax or use --skip-validation option
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/xtrans/xtrans-1_1.=
2.6-r0/xtrans-1.2.6/doc/xtrans.xml:3: warning: failed to load external enti=
ty "http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd"
|                       "http://www.oasis-open.org/docbook/xml/4.3/docbookx=
=2Edtd">
|                                                                          =
      ^
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/xtrans/xtrans-1_1.=
2.6-r0/xtrans-1.2.6/doc/xtrans.xml:26: parser error : Entity 'copy' not def=
ined
| Copyright &copy; 1993, 1994 NCR Corporation - Dayton, Ohio, USA
|                 ^
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/xtrans/xtrans-1_1.=
2.6-r0/xtrans-1.2.6/doc/xtrans.xml:59: parser error : Entity 'copy' not def=
ined
| Copyright &copy; 1993, 1994, 2002 The Open Group
|                 ^
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/xtrans/xtrans-1_1.=
2.6-r0/xtrans-1.2.6/doc/xtrans.xml:64: parser error : Entity 'ldquo' not de=
fined
| of this software and associated documentation files (the &ldquo;Software&=
rdquo;)
|                                                                 ^
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/xtrans/xtrans-1_1.=
2.6-r0/xtrans-1.2.6/doc/xtrans.xml:64: parser error : Entity 'rdquo' not de=
fined
| of this software and associated documentation files (the &ldquo;Software&=
rdquo;)
|                                                                          =
      ^
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/xtrans/xtrans-1_1.=
2.6-r0/xtrans-1.2.6/doc/xtrans.xml:77: parser error : Entity 'ldquo' not de=
fined
| THE SOFTWARE IS PROVIDED &ldquo;AS IS&rdquo;, WITHOUT WARRANTY OF ANY KIN=
D, EXPR
|                                 ^
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/xtrans/xtrans-1_1.=
2.6-r0/xtrans-1.2.6/doc/xtrans.xml:77: parser error : Entity 'rdquo' not de=
fined
| THE SOFTWARE IS PROVIDED &ldquo;AS IS&rdquo;, WITHOUT WARRANTY OF ANY KIN=
D, EXPR
|                                             ^
| warning: failed to load external entity "http://www.oasis-open.org/docboo=
k/xml/4.3/docbookx.dtd"
| validity error : Could not load the external subset "http://www.oasis-ope=
n.org/docbook/xml/4.3/docbookx.dtd"
| Document /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/xtrans/xt=
rans-1_1.2.6-r0/xtrans-1.2.6/doc/xtrans.xml does not validate
| make[1]: *** [xtrans.html] Error 13
| make[1]: Leaving directory `/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linu=
x-gnueabi/xtrans/xtrans-1_1.2.6-r0/xtrans-1.2.6/doc'
| make: *** [all-recursive] Error 1



and libxdmcp:

| make[2]: Entering directory `/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-lin=
ux-gnueabi/libxdmcp/libxdmcp-1_1.1.0-r0/libXdmcp-1.1.0/doc'
| /OE/shr-core/tmp/sysroots/x86_64-linux/usr/bin/xmlto  xhtml-nochunks xdmc=
p.xml
| xmlto: /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/libxdmcp/li=
bxdmcp-1_1.1.0-r0/libXdmcp-1.1.0/doc/xdmcp.xml does not validate (status 3)
| xmlto: Fix document syntax or use --skip-validation option
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/libxdmcp/libxdmcp-=
1_1.1.0-r0/libXdmcp-1.1.0/doc/xdmcp.xml:3: warning: failed to load external=
 entity "http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd"
|                    "http://www.oasis-open.org/docbook/xml/4.3/docbookx.dt=
d">
|                                                                          =
   ^
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/libxdmcp/libxdmcp-=
1_1.1.0-r0/libXdmcp-1.1.0/doc/xdmcp.xml:3774: parser error : Entity 'tau' n=
ot defined
| &tau; =3D private key shared by display and manager
|      ^
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/libxdmcp/libxdmcp-=
1_1.1.0-r0/libXdmcp-1.1.0/doc/xdmcp.xml:3779: parser error : Entity 'rho' n=
ot defined
| &rho; =3D 64 bit random number generated by display
|      ^
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/libxdmcp/libxdmcp-=
1_1.1.0-r0/libXdmcp-1.1.0/doc/xdmcp.xml:3784: parser error : Entity 'alpha'=
 not defined
| &alpha; =3D authentication data in XDMCP packets
|        ^
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/libxdmcp/libxdmcp-=
1_1.1.0-r0/libXdmcp-1.1.0/doc/xdmcp.xml:3789: parser error : Entity 'sigma'=
 not defined
| &sigma; =3D per-session private key, generated by manager
|        ^
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/libxdmcp/libxdmcp-=
1_1.1.0-r0/libXdmcp-1.1.0/doc/xdmcp.xml:3794: parser error : Entity 'beta' =
not defined
| &beta; =3D authorization data
|       ^
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/libxdmcp/libxdmcp-=
1_1.1.0-r0/libXdmcp-1.1.0/doc/xdmcp.xml:3827: parser error : Entity 'rho' n=
ot defined
| &rho; =3D {&alpha; Request } *&tau;
|      ^
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/libxdmcp/libxdmcp-=
1_1.1.0-r0/libXdmcp-1.1.0/doc/xdmcp.xml:3827: parser error : Entity 'alpha'=
 not defined
| &rho; =3D {&alpha; Request } *&tau;
|                 ^
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/libxdmcp/libxdmcp-=
1_1.1.0-r0/libXdmcp-1.1.0/doc/xdmcp.xml:3827: parser error : Entity 'tau' n=
ot defined
| &rho; =3D {&alpha; Request } *&tau;
|                                  ^
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/libxdmcp/libxdmcp-=
1_1.1.0-r0/libXdmcp-1.1.0/doc/xdmcp.xml:3831: parser error : Entity 'alpha'=
 not defined
| &alpha; Accept =3D { &rho; + 1}&tau;
|        ^
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/libxdmcp/libxdmcp-=
1_1.1.0-r0/libXdmcp-1.1.0/doc/xdmcp.xml:3831: parser error : Entity 'rho' n=
ot defined
| &alpha; Accept =3D { &rho; + 1}&tau;
|                         ^
| /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/libxdmcp/libxdmcp-=
1_1.1.0-r0/libXdmcp-1.1.0/doc/xdmcp.xml:3831: parser error : Entity 'tau' n=
ot defined
| &alpha; Accept =3D { &rho; + 1}&tau;
|                                   ^
| warning: failed to load external entity "http://www.oasis-open.org/docboo=
k/xml/4.3/docbookx.dtd"
| validity error : Could not load the external subset "http://www.oasis-ope=
n.org/docbook/xml/4.3/docbookx.dtd"
| Document /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/libxdmcp/=
libxdmcp-1_1.1.0-r0/libXdmcp-1.1.0/doc/xdmcp.xml does not validate
| make[2]: *** [xdmcp.html] Error 13
| make[2]: Leaving directory `/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linu=
x-gnueabi/libxdmcp/libxdmcp-1_1.1.0-r0/libXERROR: Function 'do_compile' fai=
led (see /OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/libxdmcp/li=
bxdmcp-1_1.1.0-r0/temp/log.do_compile.895 for further information)
| dmcp-1.1.0/doc'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linu=
x-gnueabi/libxdmcp/libxdmcp-1_1.1.0-r0/libXdmcp-1.1.0'
| make: *** [all] Error 2

Probably more, I haven't finished rebuild from scratch with it yet.
For now I plan to disable doc generation in those recipes where it's
failing, but if you plan to add all common stylesheets, then we can
try to fix doc generation instead and add xmlto-native + stylesheets
to DEPENDS instead.

Regards,

> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
>  meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb |   14 ++++++++++++++
>  1 files changed, 14 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
>=20
> diff --git a/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb b/meta-oe/reci=
pes-support/xmlto/xmlto_0.0.25.bb
> new file mode 100644
> index 0000000..806ea2e
> --- /dev/null
> +++ b/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION =3D "A shell-script tool for converting XML files to various=
 formats"=20
> +HOMEPAGE =3D "https://fedorahosted.org/xmlto/"=20
> +SECTION =3D "docs/xmlto"=20
> +LICENSE =3D "GPLv2"=20
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
> +
> +SRC_URI =3D "https://fedorahosted.org/releases/x/m/xmlto/xmlto-${PV}.tar=
=2Egz"=20
> +SRC_URI[md5sum] =3D "a88cd3f08789b4825d1ac89fa065170d"
> +SRC_URI[sha256sum] =3D "c52b56d929e8d20fc19cd3b7ec238f8d039730c56ee311cc=
352e843147e3e31a"
> +
> +inherit autotools =20
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 1.7.0.4
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--c2gYorpyS4gG0T74
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk70UfcACgkQN1Ujt2V2gBzILQCggx970k334qgV+/PhpRDq8C0q
WLAAn13Ai6FBy+MlNS+ms+C1cre1v/Py
=S/yO
-----END PGP SIGNATURE-----

--c2gYorpyS4gG0T74--
