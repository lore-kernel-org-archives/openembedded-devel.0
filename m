Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7500DC48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 10:11:42 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.21385.1709201494604612537
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Feb 2024 02:11:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Rbae4JLq;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41TABV1e020888;
	Thu, 29 Feb 2024 04:11:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709201491;
	bh=u2McGkaW23ObUWf8gq4CUGvirpHwffRmMcK71uqEHS4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Rbae4JLq+hWR6yKIG6dILB0V3d5NrIJ1G6S3ow4VUpJ677QiiLf//n5Yb1PVBbkyX
	 I2I3x96MShpl7ar0F4afRbsJTGOqHRVhVFOmDBTUWfRzt1mDL2ewyz9k8MsOb+sbdD
	 LtHMlXSedrAxcSWs9nJ+jpkXBOSqwGIEAxXOKGbs=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41TABUJ3121278
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Feb 2024 04:11:31 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 Feb 2024 04:11:30 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 Feb 2024 04:11:30 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41TABSSO019200;
	Thu, 29 Feb 2024 04:11:28 -0600
Message-ID: <d0c0ad13-3fa2-4b62-adcb-ea1b7244ec72@ti.com>
Date: Thu, 29 Feb 2024 15:41:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [oe] [meta-oe][kirkstone][PATCH] meta-oe:
 kernel-selftest: Add few more testcases
Content-Language: en-US
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        <akuster808@gmail.com>
CC: "Gupta, Gyan" <g-gupta@ti.com>, "Khasim, Syed Mohammed" <khasim@ti.com>,
        "Eatmon, Ryan" <reatmon@ti.com>, Denys <denis@denix.org>
References: <17B53693E4F27B39.26582@lists.openembedded.org>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <17B53693E4F27B39.26582@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 41TABV1e020888
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Feb 2024 10:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109058

Hi Akuster,

A gentle ping on this patch on kirkstone.
It's a backporting patch from master.

Regards,
Chirag


On 19/02/24 14:03, Chirag Shilwant via lists.openembedded.org wrote:
> - This commit will build and install following testcases under=20
> /usr/kernel-selftest of filesystem, * ptp * timers - Backporting the=20
> commit from master 02806ed4c16d7e6f80653baec71be071d4e8f9c0=20
> Signed-off-by: Chirag Shilwant <c-shilwant@=E2=80=8Ati.=E2=80=8Acom>
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> - This commit will build and install following testcases under /usr/ker=
nel-selftest of filesystem,
>      * ptp
>      * timers
>
> - Backporting the commit from master 02806ed4c16d7e6f80653baec71be071d4=
e8f9c0
>
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb =
b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> index 3d97ea096..ab76fe262 100644
> --- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> +++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
> @@ -44,6 +44,8 @@ S =3D "${WORKDIR}/${BP}"
>   TEST_LIST =3D "\
>       ${@bb.utils.filter('PACKAGECONFIG', 'bpf firmware vm', d)} \
>       rtc \
> +    ptp \
> +    timers \
>   "
>  =20
>   EXTRA_OEMAKE =3D '\
> --=20
> 2.34.1
>

