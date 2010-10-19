Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P8HW5-0000A5-2F
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 21:06:40 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9JJ5ugj018946
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 14:05:56 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id o9JJ5tao011831
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 14:05:55 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9JJ5tfJ024111
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 14:05:55 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Tue, 19 Oct 2010 14:05:55 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Oct 2010 14:05:53 -0500
Thread-Topic: [oe] [PATCH] bitbake.conf: don't append MACHINE_OVERRIDES to
	OVERRIDES when it's empty
Thread-Index: ActtZ/yDjKBmRdp8S4m1nSNrqNhtQwCU2cFA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F0803110B3131@dlee06.ent.ti.com>
References: <AANLkTikrgw76+iAr8n3a3Kv+1joHN0ZAKTMcmOvNXrbU@mail.gmail.com>
	<1287257081-25608-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1287257081-25608-1-git-send-email-Martin.Jansa@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.152
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bitbake.conf: don't append MACHINE_OVERRIDES to	OVERRIDES when it's empty
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
X-List-Received-Date: Tue, 19 Oct 2010 19:06:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Saturday, October 16, 2010 2:25 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH] bitbake.conf: don't append MACHINE_OVERRIDES to
> OVERRIDES when it's empty
>=20
> * empty MACHINE_OVERRIDES adds :: to OVERRIDES (then in FILESPATH skips
>   every directory after this)
> * strip() is needed to remove space in case some distribution has ie
>   MACHINE_OVERRIDES ?=3D ""
>   and then
>   MACHINE_OVERRIDES +=3D ""
>   or
>   MACHINE_OVERRIDES ?=3D "${MACHINE_CLASS}", where MACHINE_CLASS is empty
> again

I saw this issue in my overlay of having a "::" in my OVERRIDES which cause=
d my parsing to fail in angstrom.inc.  Applying this fix from Martin resolv=
es the parsing issue.  My OVERRIDES appear to be in the correct order with =
this change:

# OVERRIDES=3D${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}libc-glibc:pn-${PN}:fai=
l-fast:build-${BUILD_OS}:${TARGET_ARCH}:${TARGET_OS}:${DISTRO}:${@[':'.join=
(d.getVar('MACHINE_OVERRIDES', True).split())+':',''][d.getVar('MACHINE_OVE=
RRIDES', True).strip() =3D=3D '']}${MACHINE}:local
OVERRIDES=3D"thumb-interwork:libc-glibc:pn-helloworld:fail-fast:build-linux=
:arm:linux-gnueabi:angstrom:armv7a:omap3:am37x-evm:local"

And my FILESPATH ordering is:

helloworld-1.0.0-r1/local
helloworld-1.0.0-r1/am37x-evm
helloworld-1.0.0-r1/omap3
helloworld-1.0.0-r1/armv7a
helloworld-1.0.0-r1/angstrom
helloworld-1.0.0-r1/linux-gnueabi
helloworld-1.0.0-r1/arm
helloworld-1.0.0-r1/build-linux
helloworld-1.0.0-r1/fail-fast
helloworld-1.0.0-r1/pn-helloworld
helloworld-1.0.0-r1/libc-glibc
helloworld-1.0.0-r1/thumb-interwork
helloworld-1.0.0-r1/
.
.
.

Acked-by: Chase Maupin <chase.maupin@ti.com>

> ---
>  conf/bitbake.conf |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 155c593..5c45e1e 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -676,8 +676,9 @@ BUILDCFG_NEEDEDVARS ?=3D "TARGET_ARCH TARGET_OS"
>  # Overrides are processed left to right, so the ones that are named late=
r
> take precedence.
>  # You generally want them to go from least to most specific.
>  MACHINE_OVERRIDES ?=3D ""
> -OVERRIDES =3D "pn-${PN}:fail-fast:build-
> ${BUILD_OS}:${TARGET_ARCH}:${TARGET_OS}:\
> -${DISTRO}:${@':'.join(d.getVar('MACHINE_OVERRIDES',
> True).split())}:${MACHINE}:local"
> +OVERRIDES =3D "pn-${PN}:fail-fast:build-
> ${BUILD_OS}:${TARGET_ARCH}:${TARGET_OS}:${DISTRO}:\
> +${@[':'.join(d.getVar('MACHINE_OVERRIDES',
> True).split())+':',''][d.getVar('MACHINE_OVERRIDES', True).strip() =3D=3D
> '']}\
> +${MACHINE}:local"
>=20
>  ##################################################################
>  # Include the rest of the config files.
> --
> 1.7.3.1
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


