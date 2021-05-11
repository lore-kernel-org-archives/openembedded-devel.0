Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.9888.1620720586751295803
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 01:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ihBuSYsn;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1620720587;
  x=1652256587;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=3BjqKC+zvmbXoRvtW3z/D218ZLi12QczB0pZfOe3VwI=;
  b=ihBuSYsnsNxum8ABBSrOxCWQr77qWAxxaQXgeMTM0nZy1En5mVpdV7Bc
   jf2vG7LkaFQCveEkP1A8UZeFrAWrbTdJv0/DhZldFqWJupHPEaDAgxV04
   n268He2oJ0eOYqCpGtiMRJYWFKPoEbKueGq8JW0sguwSMxi4+URx7/sJO
   FHFGfFumy2qmfHneFwjcd3DocSycIKc5PLvTxYKSa70z6ADfa4BkKER3R
   I1W6EP/mG7BkeLKF4ekBs98EibaFLK8zyxrNLiODkHqsrk1MJGb03scuQ
   fK7WSYVlyWNIsUURbaumS5ozjjyzvTLolbS3c9gvaSuR3aLQFrWTAZHQd
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Changqing Li <changqing.li@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH] nmap: change shebang to python3
Thread-Topic: [oe] [PATCH] nmap: change shebang to python3
Thread-Index: AQHXRjoVyt3SwngRo0G330KVRGd9Q6rd7Buw
Date: Tue, 11 May 2021 08:09:43 +0000
Message-ID: <6e1bad6721584e21b951b506a55d9427@XBOX03.axis.com>
References: <20210511074724.2790-1-changqing.li@windriver.com>
In-Reply-To: <20210511074724.2790-1-changqing.li@windriver.com>
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
> devel@lists.openembedded.org> On Behalf Of Changqing Li
> Sent: den 11 maj 2021 09:47
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH] nmap: change shebang to python3
>=20
> From: Changqing Li <changqing.li@windriver.com>
>=20
> upstream nmap is python2 compatiable now, but this recipe
> support python3.
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-oe/recipes-security/nmap/nmap_7.80.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-oe/recipes-security/nmap/nmap_7.80.bb b/meta-oe/recipes=
-
> security/nmap/nmap_7.80.bb
> index c76d2324e..ad5e7248e 100644
> --- a/meta-oe/recipes-security/nmap/nmap_7.80.bb
> +++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb
> @@ -53,6 +53,9 @@ do_install_append() {
>      if [ -f "${D}${bindir}/ndiff" ]; then
>         sed -i 's@^#!.*$@#!/usr/bin/env python3@g'   ${D}${bindir}/ndiff
>      fi
> +    if [ -f "${D}${bindir}/uninstall_ndiff" ]; then
> +       sed -i 's@^#!.*$@#!/usr/bin/env python3@g' ${D}${bindir}/uninstal=
l_ndiff
> +    fi

This can be simplified to:

      for cmd in ndiff uninstall_ndiff; do
        if [ -f "${D}${bindir}/$cmd" ]; then
           sed -i 's@^#!.*$@#!/usr/bin/env python3@g' ${D}${bindir}/$cmd
        fi
      done

>  }
>=20
>  FILES_${PN} +=3D "${PYTHON_SITEPACKAGES_DIR} ${datadir}/ncat"
> --
> 2.17.1

//Peter

