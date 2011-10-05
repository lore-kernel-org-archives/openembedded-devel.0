Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eyalr@ti.com>) id 1RBLVX-0005F0-DC
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Oct 2011 09:03:11 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p956vZ9J004398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 5 Oct 2011 01:57:35 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p956vZ8X012445;
	Wed, 5 Oct 2011 01:57:35 -0500 (CDT)
Received: from DNCE73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p956vWMo008103;
	Wed, 5 Oct 2011 01:57:35 -0500 (CDT)
Received: from dnce02.ent.ti.com ([137.167.131.106]) by DNCE73.ent.ti.com
	([137.167.130.158]) with mapi; Wed, 5 Oct 2011 08:57:29 +0200
From: "Reizer, Eyal" <eyalr@ti.com>
To: Eyal Reizer <eyalreizer@googlemail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 5 Oct 2011 08:57:27 +0200
Thread-Topic: [PATCHv2] iw: build version 0.9.22 from git sources
Thread-Index: Acx8TZL16GPgiGfPSeC9Ir0uA22qXAG3mmcA
Message-ID: <EC51CDB0807A51469E0C9CB8CF72D65F033369D094@dnce02.ent.ti.com>
References: <1317042454-30164-1-git-send-email-eyalr@ti.com>
In-Reply-To: <1317042454-30164-1-git-send-email-eyalr@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCHv2] iw: build version 0.9.22 from git sources
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
X-List-Received-Date: Wed, 05 Oct 2011 07:03:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Pinging on this patch.

Best Regards,
Eyal Reizer

> -----Original Message-----
> From: Eyal Reizer [mailto:eyalreizer@googlemail.com]
> Sent: Monday, September 26, 2011 4:08 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Reizer, Eyal
> Subject: [PATCHv2] iw: build version 0.9.22 from git sources
>=20
> Builds a new version which adds wowlan support from public git source
>=20
> Signed-off-by: Eyal Reizer <eyalr@ti.com>
> ---
>  recipes/iw/iw_git.bb |   29 +++++++++++++++++++++++++++++
>  1 files changed, 29 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/iw/iw_git.bb
>=20
> diff --git a/recipes/iw/iw_git.bb b/recipes/iw/iw_git.bb
> new file mode 100644
> index 0000000..e4d0cd5
> --- /dev/null
> +++ b/recipes/iw/iw_git.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION =3D "nl80211 based CLI configuration utility for wireless
> devices"
> +HOMEPAGE =3D "http://linuxwireless.org/en/users/Documentation/iw"
> +SECTION =3D "base"
> +PRIORITY =3D "optional"
> +LICENSE =3D "BSD"
> +
> +SRCREV =3D "0a236ef5f8e4ba7218aac7d0cdacf45673d5b35c"
> +PR =3D "r0"
> +PV =3D "0.9.22"
> +PR_append =3D "+gitr${SRCPV}"
> +
> +DEPENDS =3D "libnl pkgconfig"
> +
> +SRC_URI =3D " \
> +	git://git.sipsolutions.net/iw.git;protocol=3Dgit \
> +	"
> +CFLAGS +=3D "-DCONFIG_LIBNL20"
> +
> +S =3D "${WORKDIR}/git/"
> +
> +do_compile() {
> +	oe_runmake
> +}
> +
> +do_install() {
> +	oe_runmake DESTDIR=3D${D} install
> +}
> --
> 1.7.0.4



