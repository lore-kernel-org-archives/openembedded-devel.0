Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalr@ti.com>) id 1QTJ7t-0000TW-Ry
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Jun 2011 21:36:46 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p55JXQYk012274
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Jun 2011 14:33:27 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id p55JXQkg029540
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Jun 2011 14:33:26 -0500 (CDT)
Received: from DNCE73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p55JXQlT021903
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Jun 2011 14:33:26 -0500 (CDT)
Received: from dnce02.ent.ti.com ([137.167.131.106]) by DNCE73.ent.ti.com
	([137.167.130.158]) with mapi; Sun, 5 Jun 2011 21:33:25 +0200
From: "Reizer, Eyal" <eyalr@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sun, 5 Jun 2011 21:33:24 +0200
Thread-Topic: [oe] [PATCH] ti-wifi-utils: install calibrator ini files to
	rootfs
Thread-Index: AcwjrHsnGuDA//2AR8iONeq4vSyO+QACvSyW
Message-ID: <rpvmu6ufrtrll1221ama53bi.1307302406927@email.android.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] ti-wifi-utils: install calibrator ini files to	rootfs
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
X-List-Received-Date: Sun, 05 Jun 2011 19:36:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ok, I will change it to /usr/share/ti-wifi-utils...

Best regards,
Eyal

Koen Kooi <koen@dominion.thruhere.net> wrote:


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05-06-11 17:32, Eyal Reizer wrote:
> In order to perform wifi calibration the calibrator needs to be
> provided as input with a reference NVS file that matches the wifi chip
> and the radio mudule that is being used.
>
> This patch install these ini files to the root file system so they can
> be used when performing the calibration.
>
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  recipes/ti/ti-wifi-utils_git.bb |   13 ++++++++++++-
>  1 files changed, 12 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/ti/ti-wifi-utils_git.bb b/recipes/ti/ti-wifi-utils_g=
it.bb
> index 8d10051..d5e548b 100644
> --- a/recipes/ti/ti-wifi-utils_git.bb
> +++ b/recipes/ti/ti-wifi-utils_git.bb
> @@ -3,7 +3,7 @@ LICENSE =3D "TI-BSD"
>
>  DEPENDS =3D "libnl"
>
> -PR =3D"r2"
> +PR =3D"r3"
>  PV =3D"0.0"
>  PR_append =3D "+gitr${SRCPV}"
>
> @@ -17,5 +17,16 @@ CFLAGS +=3D " -DCONFIG_LIBNL20"
>
>  do_install() {
>       install -d ${D}${bindir}
> +     install -d ${D}${bindir}/ti-wifi-utils/ini_files/127x
> +     install -d ${D}${bindir}/ti-wifi-utils/ini_files/128x

Ini files belong somewhere in /usr/share or maybe /etc, but not in /usr/bin=
.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN68dlMkyGM64RGpERAlxuAJ9c1xagnhFBj1zwfDMKan1zsQcKPgCfTpeP
eSyrjfcImfSInu3hdgkkoEk=3D
=3Dn6ml
-----END PGP SIGNATURE-----


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


