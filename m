Received: from esa13.hc324-48.eu.iphmx.com (esa13.hc324-48.eu.iphmx.com [207.54.72.35])
 by mx.groups.io with SMTP id smtpd.web12.48605.1598859912366243087
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 00:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=V1tGuxUS;
 spf=pass (domain: bmw.de, ip: 207.54.72.35, mailfrom: prvs=505975d9f=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1598859912; x=1630395912;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IlgFQ+aVF194U53VuyvG0U9C+ObF0N+kHKLKjQxofYM=;
  b=V1tGuxUSGsIn7gqXHr3HIZtfG1LuTkNdWK1jdR5nMaCCOscskFzKGYF/
   JrdJ2qAaY677tUhvonZ3RN96IphpHXttSMFqzR18/NAB+eFrTvk2B+kGv
   cYLkaaUxdv2JzINGsYB6QkjB+snSHRta0ucqxSQD2TLWP5M18A6HLSSAR
   E=;
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa13.hc324-48.eu.iphmx.com with ESMTP/TLS; 31 Aug 2020 09:45:09 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw4.muc with ESMTP/TLS;
 31 Aug 2020 09:45:09 +0200
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp) ([160.48.96.46])
 by esabb3.muc with ESMTP/TLS; 31 Aug 2020 09:45:07 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by smucm10j.europe.bmw.corp
 (160.48.96.46) with Microsoft SMTP Server (TLS;
 Mon, 31 Aug 2020 09:45:06 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
 smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1497.006; Mon,
 31 Aug 2020 09:45:07 +0200
From: "Mikko Rapeli" <mikko.rapeli@bmw.de>
To: <Martin.Jansa@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] nss: fix postinst in do_rootfs for target
Thread-Topic: [oe] [meta-oe][PATCH] nss: fix postinst in do_rootfs for target
Thread-Index: AQHWfW2tHsCosb8QCU2mXdhL6cRvMqlRuOWA
Date: Mon, 31 Aug 2020 07:45:07 +0000
Message-ID: <20200831074505.GC2162@korppu>
References: <162F7E2FF7270601.30808@lists.openembedded.org>
 <20200828190134.2359034-1-Martin.Jansa@gmail.com>
In-Reply-To: <20200828190134.2359034-1-Martin.Jansa@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5B48BFBEC98ECD46BAE6056DCAFC29A1@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 28, 2020 at 09:01:34PM +0200, Martin Jansa wrote:
> Partially revert "nss: fix postinst script for nativesdk build"
>=20
> This reverts commit 31552510b15c1c97aa6cbe180c2bb53d139efbcc.
>=20
> When running in do_rootfs we need to run shlibsign provided
> by nss-native, otherwise it fails when /usr/bin/shlibsign
> doesn't exist on host builder:
>=20
> do_rootfs: Postinstall scriptlets of ['nss'] have failed. If the intenti=
on is to defer them to first boot,
> then please place them into pkg_postinst_ontarget_${PN} ().
> Deferring to first boot via 'exit 1' is no longer supported.

Thanks for this, it fixes all issues.

I didn't properly test my patch. Sorry!

-Mikko

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/nss/nss_3.54.bb | 26 ++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/meta-oe/recipes-support/nss/nss_3.54.bb b/meta-oe/recipes-s=
upport/nss/nss_3.54.bb
> index 882145c1ef..81b2538813 100644
> --- a/meta-oe/recipes-support/nss/nss_3.54.bb
> +++ b/meta-oe/recipes-support/nss/nss_3.54.bb
> @@ -240,19 +240,19 @@ do_install_append_class-target() {
>  
>  PACKAGE_WRITE_DEPS +=3D "nss-native"
>  pkg_postinst_${PN} () {
> -    if [ -n "$D" ]; then
> -        for I in $D${libdir}/lib*.chk; do
> -            DN=3D`dirname $I`
> -            BN=3D`basename $I .chk`
> -            FN=3D$DN/$BN.so
> -            ${bindir}/shlibsign -i $FN
> -            if [ $? -ne 0 ]; then
> -                exit 1
> -            fi
> -        done
> -    else
> -        ${bindir}/signlibs.sh
> -    fi
> +    for I in $D${libdir}/lib*.chk; do
> +        DN=3D`dirname $I`
> +        BN=3D`basename $I .chk`
> +        FN=3D$DN/$BN.so
> +        shlibsign -i $FN
> +        if [ $? -ne 0 ]; then
> +            echo "shlibsign -i $FN failed"
> +        fi
> +    done
> +}
> +
> +pkg_postinst_ontarget_${PN} () {
> +    ${bindir}/signlibs.sh
>  }
>  
>  PACKAGES =3D+ "${PN}-smime"
> --=20
> 2.25.1
>=20

>=20
