Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1OrcyC-0003dZ-SJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 22:34:48 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o83KY132013676
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 3 Sep 2010 15:34:01 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id o83KY0Ln016588
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 3 Sep 2010 15:34:01 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o83KY0KX014493
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 3 Sep 2010 15:34:00 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Fri, 3 Sep 2010 15:34:00 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 3 Sep 2010 15:34:00 -0500
Thread-Topic: [oe] How to extend SRC_URI_append?
Thread-Index: ActLiYThyam3tpmERoOIatsI0vNDDAAHU/Xg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310BFA35B@dlee06.ent.ti.com>
References: <20100903111210.GA17702@game.jcrosoft.org>
	<AANLkTin7HBBUQk0STC=zAPgbceC+dfLFB=3eaYORr7Ws@mail.gmail.com>
	<20100903164708.GI17702@game.jcrosoft.org>
	<20100903165917.GJ17702@game.jcrosoft.org>
In-Reply-To: <20100903165917.GJ17702@game.jcrosoft.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.152
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: How to extend SRC_URI_append?
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
X-List-Received-Date: Fri, 03 Sep 2010 20:34:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Jean-Christophe PLAGNIOL-VILLARD
> Sent: Friday, September 03, 2010 11:59 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] How to extend SRC_URI_append?
>=20
> On 18:47 Fri 03 Sep     , Jean-Christophe PLAGNIOL-VILLARD wrote:
> > On 07:44 Fri 03 Sep     , Chris Larson wrote:
> > > The append syntax you're referring to uses OVERRIDES.  FOO_somevalue
> > > replaces FOO if somevalue is in OVERRIDES.  FOO_append_somevalue is
> added to
> > > FOO if somevalue is in OVERRIDES.  I don't think SOC_FAMILY is in
> overrides
> > > at this time.
> > how can I extend it?
> is this ok?
>=20
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 677c76a..ecdf245 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -677,9 +677,9 @@ BUILDCFG_NEEDEDVARS ?=3D "TARGET_ARCH TARGET_OS"
>  #
>  # This works for  functions as well, they are really just environment
> variables.
>  # Default OVERRIDES to make compilation fail fast in case of build syste=
m
> misconfiguration.
> -OVERRIDES =3D
> "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-
> ${BUILD_OS}:fail-fast:pn-${PN}"
> +OVERRIDES =3D
> "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:${SOC_FAMILY}:${T=
A
> RGET_ARCH}_${SOC_FAMILY}:build-${BUILD_OS}:fail-fast:pn-${PN}"
>  # Alternative OVERRIDES definition without "fail fast", usually only for
> native building and Scratchbox toolchains.
> -#OVERRIDES =3D
> "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-
> ${BUILD_OS}:pn-${PN}"
> +#OVERRIDES =3D
> "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:${SOC_FAMILY}:${T=
A
> RGET_ARCH}_${SOC_FAMILY}:build-${BUILD_OS}:pn-${PN}"
>=20
>  ##################################################################
>  # Include the rest of the config files.
>=20
> Best Regards,
> J.

Is there really a case for a ${TARGET_ARCH}_${SOC_FAMILY} override.  If the=
se devices have different architectures are they really part of the same fa=
mily?

As for adding this to bitbake.conf I guess I wouldn't object, but I don't k=
now that this is something everyone would want.  Instead you could put this=
 in your distro's conf file (like angstrom does) or in your local.conf file=
.

The distro/include/angstrom.inc file sets:

OVERRIDES .=3D ":${FEED_ARCH}:${SOC_FAMILY}"

I use SOC_FAMILY overrides in my work.

Just my two cents
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


