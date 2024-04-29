Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3143C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:56:57 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.79])
 by mx.groups.io with SMTP id smtpd.web10.18965.1714391816141514818
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 04:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=I5CTCyVe;
 spf=pass (domain: siemens.com, ip: 40.107.241.79, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RD+udp54z0iQh6ra/iJl3QX4YyhlPZ+IuQYOBju04tC2Pv+ijKioEejFx1KxwhnaQ1ZLVFX0Joc0n5aZTcbxIcSvQUhre+eM2mNxtHxVx3RH8WgISuWYzl/krtkgpKBtmRSokVsgwSoRBIYcqGZJBb1oy2p3n0tVlAVhLPNWqfOtm2XfsrAzqFTnCLZZkwkNqGM4nrn4uU6s8w0VAE4ouIuO7B5R+M+6Req9OfOgxQgmwfpbrNWxPQhPL56K1/Nh+VG28dyuSQz2S4CY5F1aow/PJoBQwQD/DerFJgCHKhv3pnLsmMS9E7paP5wMPiAboZH8MTK/d4u6ddvwflc9mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQAZshubi1hGyNwm6Ci6f/ysi3cUoG5N9EWJr8v1Zaw=;
 b=NB7o8vWPDkJ6a5Uvu8u6CxgyJFqVqgxIy/haunlNGe/Q2Z8A07ZkXi+ZYLY3rP3xdifWc1PdTiynFuDBenWMxUEamLCxEXfk+9lM/WMOa3hk5Sg0Nx7AvrHyxL4Z4TvNXjQoKppqDVDK49PKO/GY3Wu+xYRh1hBR2ImM7AQt09/vZJG/DsGhlsyipaGwy7T34ZJIixcuZPQ2B67DdBeKunFhbFWoq/r5icNgYcT0MFsY7ueWqcjH+0TXI2ApqKHm5uYl6Rw0s8+aMYfDHK9J5SWKhRCru0nVSI7/Qqqw17rwdxGQu+ZcKSEqyIf6HXYAc68HLivPBqKJqSgrcu/Jiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQAZshubi1hGyNwm6Ci6f/ysi3cUoG5N9EWJr8v1Zaw=;
 b=I5CTCyVe3g5zseYjGeSL2GirO4UX2kGbP/bZ20U1BJcgs+W4+hc5q6KmE55kgXNOFiPWHuXBaiL9EyWhzSe7ZTFDANCMWa0B72BnJSQXp4EDbJ7Wt4ucT8yjpfFR4zOixWOkML0vAxeUqjGPk0J7nxiAbQI22BrgWkdegQFDvMAN6FtUFed5g0BcMjEF+kPZuyZIPx7e3e0aggqmh31vrxdDiY2SbolrUK0CEMAH/Kd75rQVcWuCrw7dvM0+NrsVq1S9PPTxSlky0K5r1yIvivLxyEMBI/gUYWbfVFbEJqexWlP5rapzyIN5SKqUYcQkEGQMSjfjJR6CmdeW/INf7A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB6693.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 11:56:52 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 11:56:52 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "ninette@thehoodiefirm.com" <ninette@thehoodiefirm.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "engineering@neighbourhood.ie" <engineering@neighbourhood.ie>
Subject: RE: [oe] [PATCH 1/1] mpd: Update status for CVE-2020-7465 and
 CVE-2020-7466
Thread-Topic: [oe] [PATCH 1/1] mpd: Update status for CVE-2020-7465 and
 CVE-2020-7466
Thread-Index: AQHamiV44J7Dq4bE6EGYjfgVgiMMl7F/I/tg
Date: Mon, 29 Apr 2024 11:56:52 +0000
Message-ID: 
 <AS1PR10MB5697CBD433A5B23B6FA7F0F3FD1B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240429110735.54205-1-ninette@thehoodiefirm.com>
 <20240429110735.54205-2-ninette@thehoodiefirm.com>
In-Reply-To: <20240429110735.54205-2-ninette@thehoodiefirm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=90de569e-3989-4df2-b310-f6a174dcfb45;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-29T11:55:32Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB6693:EE_
x-ms-office365-filtering-correlation-id: 0f07fe81-0bd5-48c5-1e3f-08dc684375c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Yu4MupTkYrBFars4On101/YhgWUe1k7Rr3N9oQvLX6y0k0p3G+tYm33QKKoJ?=
 =?us-ascii?Q?kGO3rAHasYPWdQx7/grdODhoTctGgVuf6maafxeRiF5y6/qJDKnekt6opvXp?=
 =?us-ascii?Q?FuhE4y6oJcLTAZMINoC/bHjD2jSXc8n54dYis6VTT+Z4e1chgPCQCMx1EjyW?=
 =?us-ascii?Q?s/CU+I41jlbT+6e23km3VahiIKKqy33jzaxJQ9Ksc1c1JD+5dK0P8Bg2FL7d?=
 =?us-ascii?Q?ixAMzeojKmAuXDZ6SE29xhGQO5udEGPT4f3tpeynBV+enfWIJCNPRWD7sns1?=
 =?us-ascii?Q?PAJI6jg3uD/xWonGNQfNWd3/OdxR86Hp+NKPNUNrDb0f4IvyDrc/4ss13t+q?=
 =?us-ascii?Q?h9b5Lxsbca4+AaY2NVF1Ueq/40oH6yPMp0ZzV8n8ybn3+lweh7keOL+m75LN?=
 =?us-ascii?Q?clTjwqxBU8PfHwICtRn3MT6RVxFzA3SBZreA8H8yHR8TnsGx4GItRuJQxQxq?=
 =?us-ascii?Q?/2upEDnXYDkC5mHK7b5Ptwj+kTn/1Htcar9e3XlLS7BpVemJK1Z07ztlSovl?=
 =?us-ascii?Q?H5vrKqppxmJAdOcBn4BSwYJQ8ZUasq1EmdJ8QpkL1wJ/9LQ6AtsZ20MrdkE5?=
 =?us-ascii?Q?YvxL19Sv3WARhGLTKUfhuz6zhMPIl/Q4QVwe2dnqLIlPw7t6iCweMyJ5vSah?=
 =?us-ascii?Q?FHFLRCdrKj/pzo8q9vfYOGGFo8QZHOaDzWOuq7cFWcMzVfrD63etS35mv1vP?=
 =?us-ascii?Q?8bJXQbOE7PcmXAcBRJKPhINxjaU3t/F9D0JfvYu5q05mgIuWgH9hAiQBzFgU?=
 =?us-ascii?Q?YnFE08NH+/HtChsrXZ8cuqngxlstpu2IMo03GfKZ2Ljxesc56/KIeCgD5eIW?=
 =?us-ascii?Q?8yotrRwTKpxAy0Qi16cvhaOawXU3grVdI8HdsKtdQvlvUZXGxj7msBf3KZnL?=
 =?us-ascii?Q?0v4u2tbVW/9zmw1kpBFgEgZY9zfzmI9RyiIGA0hwf3JZZG48oDGRU9bzWpkh?=
 =?us-ascii?Q?Iws2kBxHbxm5gu3GRajEnmpLAqlAJpVfzdMI7IcgEspTMJh0r6M2l/KqnVdZ?=
 =?us-ascii?Q?v+UxwYahmXdRPxreoH+Y2Lf39bbIPqXlGXgF2ZK8aLiknblrfDh9MTUYuqkD?=
 =?us-ascii?Q?R2+71dxzm0Q2hSW2n5uiFlSGD+EUx+VVD988dlD/vibSz3mDzMGO/I3X6yx6?=
 =?us-ascii?Q?Q9Tuss/LzkG6ZBRq1fX8pjhdJc0XW7WlrL8wEFVA9McNZZagzmbnVTlZjx9P?=
 =?us-ascii?Q?daHWNH+KdQmQ4QoqPYRCCs7FY138kZ3zuAT4wj7P2F4ZIlllKOWvFQm1Esg4?=
 =?us-ascii?Q?AQ2u5Ou94zQvXL2oLKgiYhbdJPUdWUg8cq8TU3D07w=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?3CF2MdoH34HGrkmRYmp48rt+lwd+T1cgj3vfXT94faKArhvBoNyZ3SVhatXa?=
 =?us-ascii?Q?FNbBi6QeSgz9OITZifJHf7cmAVqHOQaRZke6Xqye/9AhvABDRsRM3xdSAlQy?=
 =?us-ascii?Q?G8i2Xffm1LUMwcWKnneOLwuy8LL/AfIgVOKzG3EYUCDbsi+gTxIYbzk/ytSh?=
 =?us-ascii?Q?zeJJ+0WK2tN7AxgVEnBFgkb/ICx6iIdcQBnfGc0AvkOgvbRRbT52/vxrCgsx?=
 =?us-ascii?Q?Zd06SNqa40NddonFETmNeeL7mS1GsaAze9NFHVflrSs4RqT2BR/qDTONY/Ve?=
 =?us-ascii?Q?hZiDjzZoCPCYfbfYP9edfygZ48tyhp8EFGxjnInYfBAycUdSQ8YfaHwprfWX?=
 =?us-ascii?Q?ZiUYzvIIKapO2B5s+rIOXjltFC6pndI+0nrpXcFeBfEr/MPfbPZZ17aEtugD?=
 =?us-ascii?Q?iNk4YAWke7x3TxCInlJSCqmrOqSHng0mgwnOtPdoZTguFRpLw1cpolFDlZrC?=
 =?us-ascii?Q?THheMPynG2BaOrN4Oy5bgR9Rb5Q1t5bAd8iZzJaQ60tWx6ox9T39RbPRiBud?=
 =?us-ascii?Q?DEJXWACER8ryu/3tMUJvBKY0U2sDvOrugCDJ5OL1aJcsz9vrX82x5rffTB1s?=
 =?us-ascii?Q?TG7NaX2FZqUY1cMElEQSorR75j8Aq5RqKHndkAHnKsOI8J7ZlFY92GaPPV/U?=
 =?us-ascii?Q?WMXt1ymJtvrzmwoopa9sy4XkfIkf0rVHpScQybF/rYOp2pzhGhgpKXq3vZv+?=
 =?us-ascii?Q?aO+FtV2T3zzMX6M2ZofAz86XRXy4+jiqLAJbDm05uir1XODoxXiTU59yRVVM?=
 =?us-ascii?Q?MpH1l9Exx14zlAiXVcx0ktYYKbSpUtZ5/pETC8m941TwyXvy5sjyyFFYFR8b?=
 =?us-ascii?Q?wkTty0GDVeSKuZKsOixVE4qQ7zuLniw5XJxNT57JEOy9ETHME+xfJV0z4xYj?=
 =?us-ascii?Q?qdMGDhTX65bsH2IMA5fpEFe0w+ShdVUrO2bVFks1fXbf4vFsTUSuVvlc7jvK?=
 =?us-ascii?Q?6Z3BqWccoJsk1pdzb0f4WcFLFeaHvQMa3mdnuwRNnLuNZ98ZPFo2zKavJjph?=
 =?us-ascii?Q?H8waB3HpG9wP8dcZRN/BGnqA4hzv7oyop0MNCYFiL57zoV0AwGDf9JCxxyUd?=
 =?us-ascii?Q?Opo4x6M/7kNwHJ24hfpX/NrTcOSQIJkLUbFBFrOZkRIzN60QmBPgSFS2dkWi?=
 =?us-ascii?Q?4TzuHCaC2JfUVBZ0FHLn3lAHAMoUJk0rs7wFqrqlvY/sfMwvxvAOa18MpLgm?=
 =?us-ascii?Q?OADHaCQJTQRo7gP/5uZqDyMj+484Co1wabId79+5zwUOobq//54W9yUEZDTL?=
 =?us-ascii?Q?2SF+CNufA+uuiQxpdKCaD9f+KkLy1nw5HFuwIx26mgIY2HzrSjjeKrqdo0yN?=
 =?us-ascii?Q?SP2wSb6by/0idufCE1F1N6QycgcgK8DKNq+ZDTMthJdeR4fJoSaAJudPOIdD?=
 =?us-ascii?Q?++f/Eju3ALLWHMVB5ybOPwSi0Tr4TvZWevaQam02P11HlqRdPXDT3BXySdNg?=
 =?us-ascii?Q?uZGnE7yEJbXUkuBRxwePSzmDZwo9Ir2IHZsHibBCr7qGBK31g5qS2+9csZpG?=
 =?us-ascii?Q?rZ/6CkF/fUGWWwQsitCAHdZvjYrACtj1gYyR2MtSqOiP7pBUc+Xrpd53lkZx?=
 =?us-ascii?Q?/wxxeisB50b1fMOyLHDfb2XHlOwjVFn2X+2liQYx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f07fe81-0bd5-48c5-1e3f-08dc684375c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2024 11:56:52.7829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DOI3pqB0YDHQ28z99PGLuZyf0UzGFJBxPGw1slewvZeMnZ90Xd3fRqGJT/vADh+XbeQ8/HyCOh+4NIfxXZO0eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6693
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 11:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110182

"ignored:" should not be used, see https://git.openembedded.org/openembedde=
d-core/tree/meta/conf/cve-check-map.conf#n17
When CPE matches wrong component, then use "cpe-incorrect:".

Also add newline at end of file, please...

Peter

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Ninette Adhikari via lists.openembedded.org
Sent: Monday, April 29, 2024 13:08
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie; Ninette Adhikari <ninette@thehoodiefirm.c=
om>
Subject: [oe] [PATCH 1/1] mpd: Update status for CVE-2020-7465 and CVE-2020=
-7466

> The recipe used in the `meta-openembedded` is a different mpd package com=
pared to the one which has the CVE issue.
> Package used in `meta-embedded`: http://www.musicpd.org Package with CVE =
issue: https://sourceforge.net/projects/mpd/
> No action required.
>
> Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
> ---
>  meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb b/=
meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
> index a762fc832..90211bd29 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
> @@ -100,3 +100,6 @@ USERADD_PARAM:${PN} =3D " \
>      --home ${localstatedir}/lib/mpd \
>      --groups audio \
>      --user-group mpd"
> +
> +CVE_STATUS[CVE-2020-7465] =3D "ignored: The recipe used in the meta-open=
embedded is a different mpd package compared to the one which has the CVE i=
ssue."
> +CVE_STATUS[CVE-2020-7466] =3D "ignored: The recipe used in the meta-open=
embedded is a different mpd package compared to the one which has the CVE i=
ssue."
> \ No newline at end of file
> --
> 2.44.0


