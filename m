Return-Path: <matt.schuckmann@planar.com>
X-Greylist: delayed 967 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 16 Dec 2014 19:18:27 UTC
Received: from us-smtp-delivery-105.mimecast.com
	(us-smtp-delivery-105.mimecast.com [63.128.21.105])
	by mail.openembedded.org (Postfix) with ESMTP id 26F70725FD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 19:18:27 +0000 (UTC)
Received: from msxbvt03.planar.net (199.244.171.48 [199.244.171.48]) by
	us-mta-8.us.mimecast.lan; Tue, 16 Dec 2014 14:02:18 -0500
Received: from MSXBEBVT12.planar.net ([::1]) by msxbvt03.planar.net ([::1])
	with mapi; Tue, 16 Dec 2014 10:59:23 -0800
From: Matt Schuckmann <Matt.Schuckmann@planar.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Dec 2014 10:59:22 -0800
Thread-Topic: [oe] [meta-oe][PATCH] php: stop removing directories that do
	not	exist
Thread-Index: AdAZYmcrBmqovLFRRkiqruRC7c/G1A==
Message-ID: <4B07ADD556F70043925DA2E9C5D4346D2FDB5E6A3B@MSXBEBVT12.planar.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-MC-Unique: ZQQ8Q9PJSgmg8tRSeAY79g-3
Subject: [meta-oe][PATCH] php: stop removing directories that do not	exist
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
X-List-Received-Date: Tue, 16 Dec 2014 19:18:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

>=20
> The directory ${D}/${TMPDIR} does not exist. This patch removes code
> that was calling rm and rmdir on that location.
>=20
> Signed-off-by: Stephano Cetola <stephanoc <at> gmail.com>
> ---
>  meta-oe/recipes-devtools/php/php.inc |    6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-
devtools/php/php.inc
> index b1bf79c..011eea7 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
>  <at>  <at>  -74,7 +74,6  <at>  <at>  do_install_append_pn-php() {
>      if [ -d ${D}/${STAGING_DIR_NATIVE}/${sysconfdir} ];then
>           mv ${D}/${STAGING_DIR_NATIVE}/${sysconfdir}/*=20
${D}/${sysconfdir}/
>      fi
> -    rm -rf ${D}/${TMPDIR}
>      rm -rf ${D}/.registry
>      rm -rf ${D}/.channels
>      rm -rf ${D}/.[a-z]*
>  <at>  <at>  -89,11 +88,6  <at>  <at>  do_install_append_pn-php() {
>      sed -i 's:=3D/etc:=3D${sysconfdir}:g' ${B}/sapi/fpm/init.d.php-fpm
>      sed -i 's:=3D/var:=3D${localstatedir}:g' ${B}/sapi/fpm/init.d.php-fp=
m
>      install -m 0755 ${B}/sapi/fpm/init.d.php-fpm=20
${D}${sysconfdir}/init.d/php-fpm
> -    TMP=3D`dirname ${D}/${TMPDIR}`
> -    while test ${TMP} !=3D ${D}; do
> -        rmdir ${TMP}
> -        TMP=3D`dirname ${TMP}`;
> -    done
>  }
>=20
>  PACKAGES =3D "${PN}-dbg ${PN}-cli ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2=
=20
${PN}-pear ${PN}-dev
> ${PN}-staticdev ${PN}-doc ${PN}"

Stephano,

Did you ever come to a resolution on this?=20
I'm running into the problem building on Ubuntu 14.01 that the PHP recipe f=
ails because the rmdir ${TMP} line fails.=20
Reading the recipe it looks like the whole while loop section is unneeded a=
nd destined to fail because of the rm -rf ${D}/${TMPDIR} above.=20

At the very least the rmdir should be preceded by a test for the existence =
of the directory.=20

Thanks,
Matt S.=20


