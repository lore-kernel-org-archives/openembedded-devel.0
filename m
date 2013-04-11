Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQE5f-0008NN-4L
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 11:46:54 +0200
Received: by mail-wi0-f171.google.com with SMTP id hn17so330951wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 02:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=hRkdd/+lynLqVl+7AxFzJZ8SPbz+S5LBCPv5ndq1pV8=;
	b=ObUt1/LjX6W9KZ9aX7JbVShevaSYCRwujnpFAkg3lJNF2qThMDIScJvfrb1rpz4S5Q
	9WZqgLdrc9oGTr1Od+vRq97L1qQ+QSMxf2dFw+tbPMsoCJa5x7CTjXEsDpYyfKSQ9SBc
	Eilorn+H6YTh7gZEc6clK/mXTch80M/PwLSkBweCkD1osSfathEbad453hj13VS+vbat
	j6AFCTxsRXYLB+nKwrjWOIizlS+H8N5T+OugGPL2lyMg9JZWQ+oGbrpZQw5eNd+i6JYz
	lLAXZ+wQmUagY7XVB8Rkjb1YfN78ePWJXGsbmIRukywXJvQcVdudt8+HjTl5LAU1d6Cy
	Seng==
X-Received: by 10.194.173.228 with SMTP id bn4mr9244752wjc.20.1365672564578;
	Thu, 11 Apr 2013 02:29:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id g4sm2130524wib.11.2013.04.11.02.29.23
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 02:29:24 -0700 (PDT)
Date: Thu, 11 Apr 2013 11:29:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130411092926.GB2477@jama>
References: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
	<1365610462-29689-5-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1365610462-29689-5-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][PATCH 5/8] nodejs4: reinstate installing all the files
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
X-List-Received-Date: Thu, 11 Apr 2013 09:47:11 -0000
X-Groupsio-MsgNum: 44055
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Content-Disposition: inline

--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2013 at 06:14:19PM +0200, Koen Kooi wrote:
> Cloud9 needs the headers to build the o3-xml binary, using 0.8.x headers =
makes it crash.
>=20
> This installs everything namespaced as 'node4' to avoid collisions.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs4_0.4.12.bb
> index 522b539..58ca135 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
> @@ -28,8 +28,20 @@ do_compile () {
>  }
> =20
>  do_install () {
> -  install -d ${D}${bindir}
> -  install -m 0755 build/default/node ${D}${bindir}/node4
> -}
> +  DESTDIR=3D${D} oe_runmake install
> +
> +  # fix namespace conflicts with other nodejs recipes
> +  mv ${D}${bindir}/node ${D}${bindir}/node4
> +  mv ${D}${bindir}/node-waf ${D}${bindir}/node4-waf
> +
> +  mv ${D}${includedir}/node ${D}${includedir}/node4
> =20
> +  mv ${D}${libdir}/node ${D}${libdir}/node4
> +  mv ${D}${libdir}/pkgconfig/nodejs.pc ${D}${libdir}/pkgconfig/nodejs4.pc
> +  sed -i -e s:include/node:include/node4: ${D}${libdir}/pkgconfig/nodejs=
4.pc
> +
> +  mv ${D}${datadir}/man/man1/node.1 ${D}${datadir}/man/man1/node4.1
> +}
> =20
> +FILES_${PN} +=3D "${libdir}/node4/wafadmin"
> +BBCLASSEXTEND =3D "native"

nodejs4-native fails here:
| mv: cannot stat
`/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/n=
odejs4-native/0.4.12-r0/image/home/jenkins/oe/shr-core-branches/shr-core/tm=
p-eglibc/sysroots/x86_64-linux/usr/bin/node':
No such file or directory
| ERROR: Function failed: do_install (see
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/no=
dejs4-native/0.4.12-r0/temp/log.do_install.6513
for further information)


> --=20
> 1.8.1.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFmgnYACgkQN1Ujt2V2gBzR3ACgsD54AbzAxwhwU1diLGYkyv5s
KLUAnA3WkrpYGrPrAMXG9YEhgoPvxYmd
=aFMM
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--
