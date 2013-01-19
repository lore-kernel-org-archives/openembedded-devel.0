Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TwVWM-00027y-8X
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Jan 2013 11:19:30 +0100
Received: by mail-pb0-f41.google.com with SMTP id xa7so2484708pbc.14
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2013 02:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PKlqReW6rctKgUlf/5HasgVVShPEkluACFLUpS1+qQQ=;
	b=cXgiKr10knDZKY0+MVq3a/V6Yu09tv8BKG5TUKWA0YcPRA6SfffAMtiZyajwxwKSWt
	dnDAkF/A7WyQHtocmK2ZK6vS0jeKylX099qk7/+63rTeMD+6iNGwdEnVADhy4DUqDmcD
	zfRPPitI4GN88Fb8BKm6DIHjWKPeMRoNPzGhcjPi4coZF7XvzeLNkZEQn+apq9XFPe7Z
	QhULfQbQ/dtq4ZHh1NiNSQCJV2xsxDWIc542fPs4SgaO7zTMBRD2KyXDzgV1OQb8QLqI
	op2Cuw967rmAc5Eemb3XfMTBXlmfFMdu5jFQLwlLXQX7ElO9iSh/ZieBHbrUWE+pIQal
	NYUQ==
X-Received: by 10.68.130.226 with SMTP id oh2mr31937648pbb.157.1358589840686; 
	Sat, 19 Jan 2013 02:04:00 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id rv8sm4768452pbc.27.2013.01.19.02.03.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 02:03:59 -0800 (PST)
Date: Sat, 19 Jan 2013 11:03:56 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130119100356.GG29386@jama.palm1.palmone.com>
References: <1358461961-5703-1-git-send-email-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1358461961-5703-1-git-send-email-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] php: cleanup QA warnings
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
X-List-Received-Date: Sat, 19 Jan 2013 10:19:31 -0000
X-List-Received-Date: Sat, 19 Jan 2013 10:19:31 -0000
X-Groupsio-MsgNum: 42750
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0z5c7mBtSy1wdr4F"
Content-Disposition: inline

--0z5c7mBtSy1wdr4F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 17, 2013 at 11:32:41PM +0100, Marcin Juszkiewicz wrote:
> php-native had:
>=20
> WARNING: The recipe php-native is trying to install files into a shared a=
rea when those files already exist. Those files and their manifest location=
 are:
>   /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sys=
roots/x86_64-linux/usr/lib/php/.filemap
>   /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sys=
roots/x86_64-linux/usr/lib/php/.lock
>   /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sys=
roots/x86_64-linux/usr/lib/php/.depdblock
>   /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sys=
roots/x86_64-linux/usr/lib/php/.depdb
>   /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sys=
roots/x86_64-linux/usr/lib/php/.channels/pear.php.net.reg
>   /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sys=
roots/x86_64-linux/usr/lib/php/.channels/pecl.php.net.reg
>   /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sys=
roots/x86_64-linux/usr/lib/php/.channels/doc.php.net.reg
>   /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sys=
roots/x86_64-linux/usr/lib/php/.channels/__uri.reg
>   /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sys=
roots/x86_64-linux/usr/lib/php/.channels/.alias/pear.txt
>   /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sys=
roots/x86_64-linux/usr/lib/php/.channels/.alias/pecl.txt
>   /home/hrw/HDD/devel/canonical/aarch64/openembedded/build/tmp-eglibc/sys=
roots/x86_64-linux/usr/lib/php/.channels/.alias/phpdocs.txt
> Please verify which package should provide the above files.
>=20
> php had:
>=20
> WARNING: QA Issue: php: Files/directories were installed but not shipped
>   /.filemap
>   /.lock
>   /.depdblock
>   /.depdb
>   /var
>   /.registry
>   /.channels
>   /home
>   /var/run
>   /var/log
>   /var/volatile
>   /var/volatile/run
>   /var/volatile/log
>   /etc/php-fpm.conf.default
>   /.registry/.channel.pecl.php.net
>   /.registry/.channel.doc.php.net
>   /.registry/.channel.__uri
>   /.channels/pear.php.net.reg
>   /.channels/pecl.php.net.reg
>   /.channels/doc.php.net.reg
>   /.channels/__uri.reg
>   /.channels/.alias
>   /.channels/.alias/pear.txt
>   /.channels/.alias/pecl.txt
>   /.channels/.alias/phpdocs.txt
>   /home/hrw
>   /home/hrw/HDD
>   /home/hrw/HDD/devel
>   /home/hrw/HDD/devel/canonical
>   /home/hrw/HDD/devel/canonical/aarch64
>   /home/hrw/HDD/devel/canonical/aarch64/openembedded
>   /home/hrw/HDD/devel/canonical/aarch64/openembedded/build

It's much better, thanks.

I think this /home is still there:
php-5.3.19: php: Files/directories were installed but not shipped
  /home
  /home/jenkins
  /home/jenkins/oe
  /home/jenkins/oe/shr-core-branches
  /home/jenkins/oe/shr-core-branches/shr-core

Cheers,

>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  meta-oe/recipes-devtools/php/php.inc | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devto=
ols/php/php.inc
> index 5e5a087..928d3d2 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -7,7 +7,7 @@ DEPENDS =3D "zlib libxml2 virtual/libiconv php-native lem=
on-native mysql5 \
>             libc-client openssl sqlite3"
>  DEPENDS_virtclass-native =3D "zlib-native libxml2-native"
> =20
> -INC_PR =3D "r3"
> +INC_PR =3D "r4"
> =20
>  SRC_URI =3D "http://www.php.net/distributions/php-${PV}.tar.bz2"
> =20
> @@ -55,14 +55,22 @@ do_install  () {
>      oe_runmake 'INSTALL_ROOT=3D${D}' install
>  }
> =20
> +do_install_append_pn-php-native() {
> +    rm -rf ${D}/${libdir}/php/.registry
> +    rm -rf ${D}/${libdir}/php/.channels
> +    rm -rf ${D}/${libdir}/php/.[a-z]*
> +}
> +
>  # fixme
>  do_install_append_pn-php() {
>      install -d ${D}/${sysconfdir}/
>      mv ${D}/${STAGING_DIR_NATIVE}/${sysconfdir}/* ${D}/${sysconfdir}/
> -    rm -rf ${D}/${STAGING_DIR_NATIVE}
> +    rm -rf ${D}/${TMPDIR}
>      rm -rf ${D}/.registry
>      rm -rf ${D}/.channels
>      rm -rf ${D}/.[a-z]*
> +    rm -rf ${D}/var
> +    rm -f  ${D}/${sysconfdir}/php-fpm.conf.default
>      sed -i 's:${STAGING_DIR_NATIVE}::g' ${D}/${sysconfdir}/pear.conf
>      install -m 0644 ${WORKDIR}/php-fpm.conf ${D}/${sysconfdir}/php-fpm.c=
onf
>      install -d ${D}/${sysconfdir}/apache2/conf.d
> --=20
> 1.8.0
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0z5c7mBtSy1wdr4F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlD6b4wACgkQN1Ujt2V2gBySIwCgsbtXASUmN/VTITxkF9Bm25bd
Ws8AniF/j75cjfNJ+eQ2iyDrSGWMLpLx
=XJlh
-----END PGP SIGNATURE-----

--0z5c7mBtSy1wdr4F--
