Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CA1C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 19:41:14 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.1333.1659123669215837565
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jul 2022 12:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=mV9JGFTb;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1659123670;
  x=1690659670;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=6M7X4v2SHOhijjbwb9Uq51v1y5Ns8aD+4Q1TMGdOH3I=;
  b=mV9JGFTbj5+XVqihwpjOwAO7hFGqtRcdbD+lIvDvhdvNeuEM9UohjDkY
   DfN1xKkdOiqpRilvOgjkJEPuaroblJP/FHkmH6v6zWuNB+mcMbHE0Bp96
   0zJH5TydZpsIfRkVpNS0YT3OcbeT/CFiMXg8PC9LYg6hQ8uiYqhGK960Q
   K6c/120DxYPbRMFWvVqMUD2u9FhK+obwJJ/er6ravU6f8FJM6n5hBpaUZ
   Eco8yB6GbVIrSwabDO3kYmdjJvxVpFmnktjm/382youpespDe8Kbe+dy5
   snTb0htz5xB0dwLGaS8KB6nRVstSDfW55/rvUE3ESFg2rPfDhgQLA5JNL
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mike Petersen <mike.petersen@ni.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-networking][PATCH v3] sshpass: add recipe
Thread-Topic: [oe] [meta-networking][PATCH v3] sshpass: add recipe
Thread-Index: AQHYo3Ez52mDkhnB10K9wt0qLLs6/q2VediAgABFAAA=
Date: Fri, 29 Jul 2022 19:41:06 +0000
Message-ID: <d30b35312e5344db9fd83fac41910dc3@axis.com>
References: <20220729173209.69103-1-mike.petersen@ni.com>
 <20220729173209.69103-2-mike.petersen@ni.com>
In-Reply-To: <20220729173209.69103-2-mike.petersen@ni.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Jul 2022 19:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98056

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> On Behalf Of Mike Petersen
> Sent: den 29 juli 2022 19:32
> To: openembedded-devel@lists.openembedded.org
> Cc: Mike Petersen <mike.petersen@ni.com>
> Subject: [oe] [meta-networking][PATCH v3] sshpass: add recipe
>=20
> Needed for automating ssh logins, used in auto-tests.
>=20
> Co-authored-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> Signed-off-by: Mike Petersen <mike.petersen@ni.com>
> ---
>  .../recipes-connectivity/sshpass/sshpass_1.09.bb      | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/sshpass/sshpass_=
1.09.bb
>=20
> diff --git a/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb=
 b/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
> new file mode 100644
> index 000000000..0bfed694b
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/sshpass/sshpass_1.09.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION =3D "Non-interactive ssh password auth"
> +HOMEPAGE =3D "http://sshpass.sourceforge.net/"
> +SECTION =3D "console/network"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/sshpass/sshpass-${PV}.tar.gz"

That can be written as:

SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"

> +
> +SRC_URI[sha256sum] =3D "71746e5e057ffe9b00b44ac40453bf47091930cba96bbea8=
dc48717dedc49fb7"
> +
> +inherit autotools
> --
> 2.37.1


