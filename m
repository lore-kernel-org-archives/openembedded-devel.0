Received: from mail-ye0-f182.google.com ([209.85.213.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFofm-0006yK-CY
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 17:37:57 +0100
Received: by mail-ye0-f182.google.com with SMTP id r9so204817yen.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 09:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Bs7AGty7xfsVIjFm/v4VWB5lUJS9kOO0in2498XMyAI=;
	b=y6r+W7FG8mYrINHa6b9JAE1VOQnTM4GpCIUvb5nHJxXc4rCcXzXa5l4MxTGGOmL2n1
	8FFgNbfGx55N1AvCavlXl906lpesM5rnLAFZOANDUiXL4mWuZVjVK7jLs0vgOuRVBpNq
	KxRaiYdToub3SLRvRGKboIQzqVUDPRZl7wu//lAUozjdGu2bDoJTr1cphi/IJXcRDOws
	Von7YQ7dcNtyTEQKHAGVyosixdFv2ZKg6s7UxFLAiqE9hGVM0i2OX7lnIguYIcJAjeqz
	zJisqPMIz3Z8F5o4tziB49RoqcEwQMi0s0HnRrufsb8ntYG67DHMVX2nspzJu4WOaDgi
	g/RQ==
X-Received: by 10.236.183.200 with SMTP id q48mr15935785yhm.21.1363191621166; 
	Wed, 13 Mar 2013 09:20:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d80sm36219139yhg.4.2013.03.13.09.20.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 09:20:20 -0700 (PDT)
Date: Wed, 13 Mar 2013 17:20:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130313162013.GM3260@jama>
References: <1363146643-30820-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1363146643-30820-1-git-send-email-b28495@freescale.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] tclap: initial add 1.2.1
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
X-List-Received-Date: Wed, 13 Mar 2013 16:38:03 -0000
X-Groupsio-MsgNum: 43523
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eWmFpGZayiNrn4FL"
Content-Disposition: inline

--eWmFpGZayiNrn4FL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2013 at 11:50:43AM +0800, b28495@freescale.com wrote:
> From: Ting Liu <b28495@freescale.com>
>=20
> TCLAP (Templatized C++ Command Line Parser Library ) is a small,
> flexible library that provides a simple interface for defining
> and accessing command line arguments. Templatized C++ Command
> Line Parser Library.
>=20
> Use the commit of tag tclap-1-2-1-release-final.
>=20

fails in do_install:

| /bin/mkdir -p /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work=
/armv5te-oe-linux-gnueabi/tclap/1.2.1-r0/image/usr/share/doc/tclap
| cp -R /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te=
-oe-linux-gnueabi/tclap/1.2.1-r0/git/docs/html /home/jenkins/oe/shr-core-br=
anches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/tclap/1.2.1-r0/ima=
ge/usr/share/doc/tclap
|  /bin/mkdir -p '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/wo=
rk/armv5te-oe-linux-gnueabi/tclap/1.2.1-r0/image/usr/share/doc/tclap'
| cp: cannot stat `/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/w=
ork/armv5te-oe-linux-gnueabi/tclap/1.2.1-r0/git/docs/html': No such file or=
 directory
| make[2]: *** [install-data-local] Error 1
| make[2]: *** Waiting for unfinished jobs....
|  /usr/bin/install -c -m 644 index.html manual.html style.css '/home/jenki=
ns/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/t=
clap/1.2.1-r0/image/usr/share/doc/tclap'
| make[2]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/tclap/1.2.1-r0/git/docs'
| make[1]: *** [install-am] Error 2
| make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/tclap/1.2.1-r0/git/docs'
| make: *** [install-recursive] Error 1
| ERROR: oe_runmake failed
| ERROR: Function failed: do_install (see /home/jenkins/oe/shr-core-branche=
s/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/tclap/1.2.1-r0/temp/log=
=2Edo_install.29945 for further information)
NOTE: recipe tclap-1.2.1-r0: task do_install: Failed

Whole log in:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30313_114357.log/

> Signed-off-by: Ting Liu <b28495@freescale.com>
> ---
>  meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
>=20
> diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb b/meta-oe/reci=
pes-devtools/tclap/tclap_1.2.1.bb
> new file mode 100644
> index 0000000..c2b03a4
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION =3D "Templatized C++ Command Line Parser"=20
> +HOMEPAGE =3D "http://tclap.sourceforge.net/"=20
> +SECTION =3D "tclap"=20
> +LICENSE =3D "MIT"=20
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8ab0ff134bcc584d0e6b5b9f8732=
453"
> +
> +SRCREV =3D "3627d9402e529770df9b0edf2aa8c0e0d6c6bb41"
> +SRC_URI =3D "git://tclap.git.sourceforge.net/gitroot/tclap/tclap"=20
> +
> +S =3D "${WORKDIR}/git"
> +inherit autotools
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 1.7.3.4
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eWmFpGZayiNrn4FL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFApz0ACgkQN1Ujt2V2gBxY8wCgkhhDif1cbjjURAid+hyaFBb0
nPAAmQEQV3wOD/CYFUTQQNB5PXD/rgfE
=1XXW
-----END PGP SIGNATURE-----

--eWmFpGZayiNrn4FL--
