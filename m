Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P6l1k-0006OZ-Vc
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 16:12:59 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9FECO5K006136
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 15 Oct 2010 09:12:24 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id o9FECOHP017379;
	Fri, 15 Oct 2010 09:12:24 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9FECOZU006969;
	Fri, 15 Oct 2010 09:12:24 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Fri, 15 Oct 2010 09:12:24 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Oct 2010 09:12:22 -0500
Thread-Topic: [oe] [PATCH] Reverse the order of OVERRIDES
Thread-Index: ActsGk9PJqDg53wzTaeGCppF9oK5fwAWBf5w
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310FFAB98@dlee06.ent.ti.com>
References: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1287113787-21268-1-git-send-email-kergoth@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.40
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] Reverse the order of OVERRIDES
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
X-List-Received-Date: Fri, 15 Oct 2010 14:13:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> diff --git a/conf/machine/kixrp435.conf b/conf/machine/kixrp435.conf
> index 8259127..b4a2fa6 100644
> --- a/conf/machine/kixrp435.conf
> +++ b/conf/machine/kixrp435.conf
> @@ -7,7 +7,7 @@ TARGET_ARCH =3D "arm"
>  # Note: armv4 armv4t armv5te will be added by tune-xscale.inc
> automatically.
>  PACKAGE_EXTRA_ARCHS =3D "armv5e ixp4xxle"
>=20
> -OVERRIDES =3D
> "local:${MACHINE}:nslu2:ixp4xx:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:buil=
d
> -${BUILD_OS}:fail-fast:pn-${PN}"
> +MACHINE_OVERRIDES +=3D "nslu2 ixp4xx"

Should this be "ixp4xx nslu2"?  At least in order to keep the original beha=
vior?

>=20
>  PREFERRED_PROVIDER_virtual/kernel =3D "linux"
>  PREFERRED_VERSION_linux =3D "2.6.30"
> diff --git a/conf/machine/nslu2be.conf b/conf/machine/nslu2be.conf
> index 9bc92f1..88e6ed2 100644
> --- a/conf/machine/nslu2be.conf
> +++ b/conf/machine/nslu2be.conf
> @@ -7,7 +7,7 @@ TARGET_ARCH =3D "armeb"
>  # Note: armv4b armv4tb armv5teb will be added by tune-xscale.inc
> automatically.
>  PACKAGE_EXTRA_ARCHS =3D "armv5eb ixp4xxbe"
>=20
> -OVERRIDES =3D
> "local:${MACHINE}:nslu2:ixp4xx:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:buil=
d
> -${BUILD_OS}:fail-fast:pn-${PN}"
> +MACHINE_OVERRIDES +=3D "nslu2 ixp4xx"

Should this be "ixp4xx nslu2"?  At least in order to keep the original beha=
vior?

>=20
>  ROOT_FLASH_SIZE ?=3D "6"
>=20
> diff --git a/conf/machine/nslu2le.conf b/conf/machine/nslu2le.conf
> index 62e47cb..edd0d94 100644
> --- a/conf/machine/nslu2le.conf
> +++ b/conf/machine/nslu2le.conf
> @@ -7,7 +7,7 @@ TARGET_ARCH =3D "arm"
>  # Note: armv4 armv4t armv5te will be added by tune-xscale.inc
> automatically.
>  PACKAGE_EXTRA_ARCHS =3D "armv5e ixp4xxle"
>=20
> -OVERRIDES =3D
> "local:${MACHINE}:nslu2:ixp4xx:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:buil=
d
> -${BUILD_OS}:fail-fast:pn-${PN}"
> +MACHINE_OVERRIDES +=3D "nslu2 ixp4xx"

Should this be "ixp4xx nslu2"?  At least in order to keep the original beha=
vior?

>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


