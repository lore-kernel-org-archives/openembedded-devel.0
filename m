Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 121317F81A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 14:13:14 +0000 (UTC)
IronPort-SDR: 2r58a9eYX1UOZWjBqMdHODq8p0+j9yeZBZlrtokbj48lDSo9FG04tFZip7UwOPYobHjG9fm4rT
	RN4aKATV/Y6wuwtWD6WKSovm7fbNwEiMX0QOp2NoqvzXX/7fA9vxSxKh3z7Ze/k53LjOZIm9T2
	NdywS4cXLKFO9OaE9FOHEwN4H/1hDhSY7X59GWaIhyKFTkWkFRxgoyhUyqBY/+jjkY/B4QxYti
	vDDl3cBZBIheu5rMJk9Kt5+//1d+dYmd0nyjJYFewkbdpu5ORl5uwuiux5APlzPJRutUfijNRN
	F/Y=
X-IronPort-AV: E=Sophos;i="5.68,320,1569276000"; 
   d="scan'208";a="2546160"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>
Thread-Topic: [oe] [meta-networking][PATCH] samba: fix installation for
	minimal build
Thread-Index: AdWeGk99wKVaHw+1QnWbVW6MoGYt2w==
Date: Mon, 18 Nov 2019 14:13:13 +0000
Message-ID: <bbc3ae41b78c4a208c664e2ce6f683aa@XBOX03.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] samba: fix installation for minimal build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Nov 2019 14:13:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please cherry-pick this to Zeus.

//Peter

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-dev=
el-bounces@lists.openembedded.org> On Behalf Of Andreas Oberritter
> Sent: den 7 november 2019 21:37
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [meta-networking][PATCH] samba: fix installation for minima=
l build
>=20
> | chmod: cannot access '.../image/etc/sudoers.d': No such file or directo=
ry
> | sed: can't read .../image/usr/bin/samba-tool: No such file or directory
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  .../recipes-connectivity/samba/samba_4.10.8.bb   | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.8.bb b=
/meta-networking/recipes-connectivity/samba/samba_4.10.8.bb
> index d824eacf9e..4ab8b26c31 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.10.8.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.10.8.bb
> @@ -189,15 +189,17 @@ do_install_append() {
>          sed -i 's:\(#!/bin/\)bash:\1sh:' ${D}${bindir}/onnode
>      fi
>=20
> -    chmod 0750 ${D}${sysconfdir}/sudoers.d
> +    chmod 0750 ${D}${sysconfdir}/sudoers.d || true
>      rm -rf ${D}/run ${D}${localstatedir}/run ${D}${localstatedir}/log
>=20
> -    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba=
-gpupdate
> -    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba=
_upgradedns
> -    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba=
_spnupdate
> -    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba=
_kcc
> -    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindir}/samba=
_dnsupdate
> -    sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${bindir}/samba-=
tool
> +    for f in samba-gpupdate samba_upgradedns samba_spnupdate samba_kcc s=
amba_dnsupdate; do
> +        if [ -f "${D}${sbindir}/$f" ]; then
> +            sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${sbindi=
r}/$f
> +        fi
> +    done
> +    if [ -f "${D}${bindir}/samba-tool" ]; then
> +        sed -i -e 's,${PYTHON},/usr/bin/env python3/,g' ${D}${bindir}/sa=
mba-tool
> +    fi
>=20
>  }
>=20
> --
> 2.17.1


