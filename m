Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web09.10052.1617978309816705146
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Apr 2021 07:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: eL5DOjKLwk23DOCpReI1w6jzLNsR48zN2++qWBWxA7GVYQ7/wYJdJQ6DicA7ov2ntQTuwAismv
 MQymIQDdJ16A==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="190571514"
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="190571514"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2021 07:25:09 -0700
IronPort-SDR: Y1iky2eIVgMLcE0IYOOcAWkxb8wGvxF5pB7F0FxvmMW2FGTPltT66SgkQwX4c5AQp+wawtRpoc
 2A54k+KXR2/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,209,1613462400"; 
   d="scan'208";a="450259336"
Received: from kmsmsx601.gar.corp.intel.com ([172.21.219.141])
  by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2021 07:25:07 -0700
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 kmsmsx601.gar.corp.intel.com (172.21.219.141) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 9 Apr 2021 22:25:05 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2106.013;
 Fri, 9 Apr 2021 22:25:05 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: saloni <saloni.jain@kpit.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: "nisha.parrakat@kpit.com" <nisha.parrakat@kpit.com>
Subject: Re: [oe] [meta-oe][dunfell][PATCH v2] fuse: Whitelisted CVE-2019-14860
Thread-Topic: [oe] [meta-oe][dunfell][PATCH v2] fuse: Whitelisted
 CVE-2019-14860
Thread-Index: AQHXLSYy9w1KXeYF4UWjy2M5cwF976qsPXXA
Date: Fri, 9 Apr 2021 14:25:05 +0000
Message-ID: <9c3a6155cc9444e08aee48711cf45a73@intel.com>
References: <20210409095258.22644-1-Saloni.Jain@kpit.com>
In-Reply-To: <20210409095258.22644-1-Saloni.Jain@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of saloni
> Sent: Friday, April 9, 2021 05:53 PM
> To: openembedded-devel@lists.openembedded.org; raj.khem@gmail.com
> Cc: nisha.parrakat@kpit.com
> Subject: [oe] [meta-oe][dunfell][PATCH v2] fuse: Whitelisted CVE-2019-148=
60
>=20
> CVE-2019-14860 is a REDHAT specific issue and was addressed for REDHAT Fu=
se
> products on Red Hat Fuse 7.4.1 and Red Hat Fuse 7.5.0.
> REDHAT has also released the fix and updated their security advisories af=
ter
> significant releases.
> Hence, whitelisted the CVE-2019-14860.
>=20
> Link: https://access.redhat.com/security/cve/cve-2019-14860
> Link: https://access.redhat.com/errata/RHSA-2019:3244
> Link: https://access.redhat.com/errata/RHSA-2019:3892
>=20
> Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> ---
>  meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-
> filesystems/recipes-support/fuse/fuse_2.9.9.bb
> index 95e870691..97e399e42 100644
> --- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
> +++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
> @@ -19,6 +19,11 @@ SRC_URI =3D
> "https://github.com/libfuse/libfuse/releases/download/${BP}/${BP}.tar.
>  SRC_URI[md5sum] =3D "8000410aadc9231fd48495f7642f3312"
>  SRC_URI[sha256sum] =3D
> "d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7c1b4b5"
>=20
> +# CVE-2019-14860 is a REDHAT specific issue and was addressed for REDHAT
> Fuse products on Red Hat Fuse 7.4.1 and Red Hat Fuse 7.5.0.
> +# REDHAT has also released the fix and updated their security advisories=
 after
> significant releases.
> +CVE_PRODUCT =3D "fuse_project:fuse"
> +CVE_CHECK_WHITELIST +=3D "CVE-2019-14860"

This CVE is not listed for fuse_project:fuse so there should not be any nee=
d to whitelist it.

Thanks,

Anuj
