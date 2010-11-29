Received: from david.siemens.de ([192.35.17.14])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fabrice.Aeschbacher@siemens.com>) id 1PN0qX-0003yH-6b
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 11:20:34 +0100
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.12.11.20060308/8.12.11) with ESMTP id
	oATAJAlW031041 for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 11:19:10 +0100
Received: from DEMCHP99ET2MSX.ww902.siemens.net
	(demchp99et2msx.ww902.siemens.net [139.25.131.241])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id oATAJAfU032269
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 11:19:10 +0100
Received: from DEMCHP99E35MSX.ww902.siemens.net ([169.254.2.7]) by
	DEMCHP99ET2MSX.ww902.siemens.net ([139.25.131.241]) with mapi;
	Mon, 29 Nov 2010 11:19:10 +0100
From: "Aeschbacher, Fabrice" <Fabrice.Aeschbacher@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Nov 2010 11:19:08 +0100
Thread-Topic: [PATCH] qte: fixed do_configure() for powercpc
Thread-Index: AcuNUJNAmoDsjXwnQjeXxbzVugx+cgCXjjKw
Message-ID: <09D9BE2AC4AA764DABAA8C91E48D819ED3B1D5D0@DEMCHP99E35MSX.ww902.siemens.net>
References: <09D9BE2AC4AA764DABAA8C91E48D819ED3B1D34C@DEMCHP99E35MSX.ww902.siemens.net>
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819ED3B1D34C@DEMCHP99E35MSX.ww902.siemens.net>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.35.17.14
X-SA-Exim-Mail-From: Fabrice.Aeschbacher@siemens.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=5.0 tests=AWL, BAYES_00,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qte: fixed do_configure() for powercpc
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
X-List-Received-Date: Mon, 29 Nov 2010 10:20:34 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Is this patch likely to be accepted and commited soon in branch release-201=
0.12, or should I overlay?

With kind regards,
  Fabrice Aeschbacher=20

> -----Urspr=FCngliche Nachricht-----
> Von: openembedded-devel-bounces@lists.openembedded.org=20
> [mailto:openembedded-devel-bounces@lists.openembedded.org] Im=20
> Auftrag von Aeschbacher, Fabrice
> Gesendet: Freitag, 26. November 2010 10:59
> An: openembedded-devel@lists.openembedded.org
> Betreff: [oe] [PATCH] qte: fixed do_configure() for powercpc
>=20
> * qte: fixes do_configure for powerpc
>=20
> Signed-off-by: Fabrice Aeschbacher <fabrice.aeschbacher@siemens.com>
> ---
>  recipes/qte/qte-common_2.3.10.inc |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/qte/qte-common_2.3.10.inc=20
> b/recipes/qte/qte-common_2.3.10.inc
> index 18811c7..2eed76d 100644
> --- a/recipes/qte/qte-common_2.3.10.inc
> +++ b/recipes/qte/qte-common_2.3.10.inc
> @@ -109,7 +109,7 @@ export SYSCONF_LFLAGS =3D "${LDFLAGS} -lts"
>  export SYSCONF_MOC =3D "${STAGING_BINDIR_NATIVE}/moc"
>  export SYSCONF_UIC =3D "${STAGING_BINDIR_NATIVE}/uic"
> =20
> -# generate uclibc and eabi configurations
> +# generate uclibc, eabi and powerpc configurations
>  do_configure() {
>         for f in ${S}/configs/linux-*-g++-shared; do
>                 sed -e 's,-linux-,-linux-uclibc-,g' < $f \
> @@ -119,6 +119,7 @@ do_configure() {
>                 sed -e 's,-linux-,-linux-uclibceabi-,g' < $f \
>                         > `dirname $f`/`basename $f | sed -e=20
> 's,linux-,linux-uclibceabi-,'`
>         done
> +       sed -e 's/arm/powerpc/' =20
> ${S}/configs/linux-arm-g++-shared >=20
> ${S}/configs/linux-powerpc-g++-shared
>         echo yes | ./configure ${EXTRA_OECONF} || die=20
> "Configuring qte failed. EXTRA_OECONF was ${EXTRA_OECONF}"
>  }
> =20
> --=20
> 1.5.6.5
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> =


