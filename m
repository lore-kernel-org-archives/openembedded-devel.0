Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.20680.1602867124377567808
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Oct 2020 09:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=PO0bjmeT;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=3658; q=dns/txt; s=axis-central1;
  t=1602867124; x=1634403124;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=8gzv5s09GZXaUWecEyQh0uJnwAeLitpCaUOg7T2os2U=;
  b=PO0bjmeTLaU4i+o0deOS6ksToE5kv3MetqLXsfrpxpyAmSYm+26iYRnK
   QOXYgISJ+omwSC1QqJtsCGY9IUGxzA/foY6i+hC7B+SfTmd4waVNxdP47
   eGO+ZZ13S0oFJTBxnXXA0SQLatkhbZiYz8BdXfsgo43GbcIqzoXsPdaEb
   z5jd0Zbr+6+aHex3pmkP1fTYAjzVcuvdNxuwFf+aXfAny8OrvRbwU4Mav
   aWvJ3KVrdMgVZhmXNa9YfMXVk0ba/If9Z+ksj4IptlrHFODYpp1pndTfX
   ee4gYs5B9BmrQljk+nW4IyIlX63ltdGNiD7SFzmvfcUpuGATx3NlHiG42
   A==;
IronPort-SDR: C1vxUm8hz+q6pwpkfOQJkM1h0P7e/C0Vl04qdN+CaLqFJNf4yk98j/jtCoHORe3Qp69E7aIAxa
 IsVXng3v7qjgYY5npMf0Z4QIUPt2NOO5B2x20GmdNNcwhmJL0qtaxO702bfCwQpZWUg5L0wrI1
 D30vyj/6YSvzvh5co7twsmRGn4cIhOK0hEOcdHEi9x6VAHeiygtlIJqW6IWyney+uPDsOFH6VF
 0rk8YOyL5eAbAo82Xkq4QFIAEg/nk9vqU0wJaevjjJc0Lle35m9MtFHkdBOa2GUvZhnuGfsM1F
 c4w=
X-IronPort-AV: E=Sophos;i="5.77,383,1596492000"; 
   d="scan'208";a="14110002"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-networking][PATCH 1/2] samba,arptables,ncp: Use new license names in LIC_FILES_CHKSUM
Thread-Topic: [oe] [meta-networking][PATCH 1/2] samba,arptables,ncp: Use new
 license names in LIC_FILES_CHKSUM
Thread-Index: AQHWo2MvTgX5HEmCT0i/BHpQf/WJTqmab9mQ
Date: Fri, 16 Oct 2020 16:51:54 +0000
Message-ID: <743957163ca545a7a0b42d0da4b6149e@XBOX03.axis.com>
References: <20201016022206.489864-1-raj.khem@gmail.com>
In-Reply-To: <20201016022206.489864-1-raj.khem@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Khem Raj
> Sent: den 16 oktober 2020 04:22
> To: openembedded-devel@lists.openembedded.org
> Cc: Khem Raj <raj.khem@gmail.com>
> Subject: [oe] [meta-networking][PATCH 1/2] samba,arptables,ncp: Use new l=
icense names in LIC_FILES_CHKSUM
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-networking/recipes-connectivity/samba/samba_4.10.18.bb | 4 ++--
>  meta-networking/recipes-support/arptables/arptables_git.bb  | 2 +-
>  meta-networking/recipes-support/ncp/ncp_1.2.4.bb            | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb =
b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
> index b5085c913b..cfbb113c7f 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.10.18.bb
> @@ -3,8 +3,8 @@ SECTION =3D "console/network"
>=20
>  LICENSE =3D "GPL-3.0+ & LGPL-3.0+ & GPL-2.0+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504 \
> -                    file://${COREBASE}/meta/files/common-licenses/LGPL-3=
.0;md5=3Dbfccfe952269fff2b407dd11f2f3083b \
> -                    file://${COREBASE}/meta/files/common-licenses/GPL-2.=
0;md5=3D801f80980d171dd6425610833a22dbe6 "
> +                    file://${COREBASE}/meta/files/common-licenses/LGPL-3=
.0-only;md5=3Dbfccfe952269fff2b407dd11f2f3083b \
> +                    file://${COREBASE}/meta/files/common-licenses/GPL-2.=
0-only;md5=3D801f80980d171dd6425610833a22dbe6"

Based on LICENSE above, that should rather be LGPL-3.0-or-later and=20
GPL-2.0-or-later. The same also applies to libconfig-autoconf-perl,=20
libfile-slurper-perl, libunix-statgrab and libtest-warnings-perl=20
that you also sent patches for. That of course assumes those=20
license files are added first...

//Peter

>=20
>  SAMBA_MIRROR =3D "http://samba.org/samba/ftp"
>  MIRRORS +=3D "\
> diff --git a/meta-networking/recipes-support/arptables/arptables_git.bb b=
/meta-networking/recipes-support/arptables/arptables_git.bb
> index c02a19944d..5afec7663a 100644
> --- a/meta-networking/recipes-support/arptables/arptables_git.bb
> +++ b/meta-networking/recipes-support/arptables/arptables_git.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Administration tool for arp packet filtering"
>  SECTION =3D "net"
>  LICENSE =3D "GPL-2.0"
> -LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-=
2.0;md5=3D801f80980d171dd6425610833a22dbe6"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-=
2.0-only;md5=3D801f80980d171dd6425610833a22dbe6"
>  SRCREV =3D "efae8949e31f8b2eb6290f377a28384cecaf105a"
>  PV =3D "0.0.5+git${SRCPV}"
>=20
> diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-netw=
orking/recipes-support/ncp/ncp_1.2.4.bb
> index f42223b1f8..a2f0ccc069 100644
> --- a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
> +++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
> @@ -4,7 +4,7 @@ security or integrity checking, no throttling, no feature=
s, except \
>  one: you don't have to type the coordinates of your peer."
>  HOMEPAGE =3D "http://www.fefe.de/ncp"
>  LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-=
2.0;md5=3D801f80980d171dd6425610833a22dbe6"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/GPL-=
2.0-only;md5=3D801f80980d171dd6425610833a22dbe6"
>  DEPENDS =3D "libowfat"
>=20
>  SRC_URI =3D "https://dl.fefe.de/${BP}.tar.bz2"
> --
> 2.28.0

