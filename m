Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P6r1K-0005jn-2k
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 22:37:04 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9FKaIVV021903
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 15 Oct 2010 15:36:18 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id o9FKaHdm014209;
	Fri, 15 Oct 2010 15:36:17 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9FKaHZi019790;
	Fri, 15 Oct 2010 15:36:17 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Fri, 15 Oct 2010 15:36:17 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Chase Maupin <chasemaupin03@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Oct 2010 15:36:16 -0500
Thread-Topic: [PATCH 2/2] Fix class OVERRIDES order
Thread-Index: ActsqBqWL5b5H8iKSi69thsBZnbNYwAAC2nQ
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310FFAD2F@dlee06.ent.ti.com>
References: <1287174748-29216-1-git-send-email-Chase.Maupin@ti.com>
	<1287174748-29216-2-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1287174748-29216-2-git-send-email-Chase.Maupin@ti.com>
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
Subject: Re: [PATCH 2/2] Fix class OVERRIDES order
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
X-List-Received-Date: Fri, 15 Oct 2010 20:37:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Chase Maupin [mailto:chasemaupin03@gmail.com]
> Sent: Friday, October 15, 2010 3:32 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: [PATCH 2/2] Fix class OVERRIDES order
>=20
> * Changed the OVERRIDES settings in the classes to use the new
>   ordering.
>=20
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

I was a little unsure of these which is why I put them in a separate patch.=
  Should the virtclass overrides be high or low priority?  Please feel free=
 to correct me, but I wanted to make sure that we didn't override "local"

> ---
>  classes/native.bbclass    |    2 +-
>  classes/nativesdk.bbclass |    2 +-
>  classes/sdk.bbclass       |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/classes/native.bbclass b/classes/native.bbclass
> index dcedff2..2e52bfc 100644
> --- a/classes/native.bbclass
> +++ b/classes/native.bbclass
> @@ -94,7 +94,7 @@ DEPENDS_virtclass-native ?=3D "${ORIG_DEPENDS}"
>=20
>  def native_virtclass_add_override(d):
>      if "native" in (bb.data.getVar('BBCLASSEXTEND', d, True) or ""):
> -        bb.data.setVar("OVERRIDES", bb.data.getVar("OVERRIDES", d, False=
)
> + ":virtclass-native", d)
> +        bb.data.setVar("OVERRIDES", "virtclass-native:" +
> bb.data.getVar("OVERRIDES", d, False), d)
>=20
>  OVERRIDES .=3D "${@native_virtclass_add_override(d)}"
>=20
> diff --git a/classes/nativesdk.bbclass b/classes/nativesdk.bbclass
> index f3f9930..6f21534 100644
> --- a/classes/nativesdk.bbclass
> +++ b/classes/nativesdk.bbclass
> @@ -52,7 +52,7 @@ export PKG_CONFIG_SYSROOT_DIR =3D "${STAGING_DIR_HOST}"
>  ORIG_DEPENDS :=3D "${DEPENDS}"
>  DEPENDS_virtclass-nativesdk ?=3D "${ORIG_DEPENDS}"
>=20
> -OVERRIDES .=3D ":virtclass-nativesdk"
> +OVERRIDES =3D. "virtclass-nativesdk:"
>=20
>  python __anonymous () {
>      pn =3D bb.data.getVar("PN", d, True)
> diff --git a/classes/sdk.bbclass b/classes/sdk.bbclass
> index c8fa076..1ad8951 100644
> --- a/classes/sdk.bbclass
> +++ b/classes/sdk.bbclass
> @@ -67,4 +67,4 @@ FILES_${PN}-dbg +=3D "${prefix}/.debug \
>=20
>  export PKG_CONFIG_SYSROOT_DIR =3D "${STAGING_DIR_HOST}"
>=20
> -OVERRIDES .=3D ":virtclass-sdk"
> +OVERRIDES =3D. "virtclass-sdk:"
> --
> 1.7.0.4



