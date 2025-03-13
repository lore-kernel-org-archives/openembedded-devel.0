Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88DEC282EC
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 15:05:21 +0000 (UTC)
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com [205.220.173.93])
 by mx.groups.io with SMTP id smtpd.web11.17131.1741878320304899195
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 08:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@keysight.com header.s=ppfeb2020 header.b=N7h9ruv6;
 dkim=pass header.i=@keysight.com header.s=selector1 header.b=JMF2eERu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: keysight.com, ip: 205.220.173.93, mailfrom: john.ripple@keysight.com)
Received: from pps.filterd (m0187215.ppops.net [127.0.0.1])
	by mx0b-003cac01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CMeDMX021597
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 08:05:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=ppfeb2020; bh=bsdO7cmiRJ7ZLp0oU5h44B
	tIX1TlMjpffM0DmB9q+lM=; b=N7h9ruv6pFATTvg5GWEsN7RtABsKscqy1haJ9g
	VplBytwFUo/6X2rdDE7ZNz5W+wU3nRP5dJnpTapiUMnDZADSyjsb53g0Qg+Pa6xg
	iSc5SvHz4XM9zBwkl5zBzSkaaWpPeidB45/70/2+0NsN4a9zGiaBIKJOwgcMnXQv
	4ZywqKhWNcHNaCk7J698UF/VDnw+944rwt6obwV1QZCt75k+iQYskV1vupHTh81Q
	iJZv/uHSAVzYaycasE6KmbMS1ZCxsoMXaXwnkdqcCV1QTgcTBRYtzHHH9WfvugWm
	wkMz/mU4BzK6tsDRQNrBneSGYGlefHEVLRLOk6Nv1U2P/G1g==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40])
	by mx0b-003cac01.pphosted.com (PPS) with ESMTPS id 45au38w5ku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 08:05:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLq70Xan+NbWFHS7nSXItT/Sr4NEkzMB4wx5UVVmAUI/UGurf8ffuk89np/QXy0k9608TdI8pB4TzWLjAzrA3OURbVsHBy8wIgG19tElqZQWUc+H2tXaqtBdnZ3bn4xqg+9dTLXV4QhCzu0SE22kaRK4xHDVjXjaj/w5kGavS6i3f4A9CpWSs/onphjye7vnF1cJssCymKD8Lcs15Ap6qnIHpPmOlLa8VZ08loHGh/AmATizIzVl+QJ31nRL12x7dVM7DokgTXO4OYF1ua8lL1OXrY/CEYqAn8IIEqRTul7OdhEGbotRsgNVhXbdCsuOD4jBSke0c7ezab1nsjjhGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsdO7cmiRJ7ZLp0oU5h44BtIX1TlMjpffM0DmB9q+lM=;
 b=NF9PKP89Lh7TTfOT5d+8A6jGsX/awc2mltY5xsBXgOZ8z6BpZdnt3h+YWV8tsCHbwEmtX56Jel83C7VOxNUZf24H3DcQd79026BwS4TsvwVmC0kMZ1FAkhZyCYlz+Isioaou2A2lfsslI8jTYDIOUs8CjavK7P4+s1mGeFf5N9pwVFPJiB/bM3C9X//bWWDK9Y8dt8YVuxuvec6E6wnRaQZlBRhHAEnMr7yyEE/xWUceYpfe1hvfP162AzcMepeV5lXUlKN3JUfX7bEaQ/QbD4xHOi4wvydW/10unLpoNqb+L36VOwusyZFW02p/MYqbOsGq+m+D9VOyJKBtsEvGrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsdO7cmiRJ7ZLp0oU5h44BtIX1TlMjpffM0DmB9q+lM=;
 b=JMF2eERuAkkxnxT0vac1oGP+55Ufl4SyFxpZGDnYU5bQqYdAV0XWeAObTutVn8TNZajsIC6yaofzfp81KEPP8eNp3s8pXqaDg1aZTZC2XUHhP/rt09kTEPNCAONjBsDm6Qrmo0U6/6q9por6P4OhA1Qf6UDwDFsYQkhUVZTdqxU=
Received: from PH7PR17MB6130.namprd17.prod.outlook.com (2603:10b6:510:1f5::17)
 by CH3PR17MB6314.namprd17.prod.outlook.com (2603:10b6:610:14c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 15:05:17 +0000
Received: from PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e]) by PH7PR17MB6130.namprd17.prod.outlook.com
 ([fe80::54bb:3a4f:5f80:a51e%5]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 15:05:16 +0000
From: John Ripple <john.ripple@keysight.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] fitimage.bbclass: Add missing punctuation
Thread-Topic: [oe] [meta-oe] [PATCH] fitimage.bbclass: Add missing punctuation
Thread-Index: AQHblCkXW8yl5bmZz0S/WBJbVu8Zsw==
Date: Thu, 13 Mar 2025 15:05:16 +0000
Message-ID: 
 <PH7PR17MB6130B7FF3B69EC2A037137CC9CD32@PH7PR17MB6130.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR17MB6130:EE_|CH3PR17MB6314:EE_
x-ms-office365-filtering-correlation-id: 2c45aac4-e534-48e9-d78a-08dd6240766b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?u+SkBQ87tMp7FZXH1RU8U2KQtPR0Wpv8ZgG5oHOAC9zHNyqx8hPSpODGPU?=
 =?iso-8859-1?Q?FCEkilRrWFrsUAt6wBi97EWUX8LkhgKK7bCo0ylEFWc3juiq2XeGZm1zU6?=
 =?iso-8859-1?Q?7JsDVVVYjdKtJM+SNsnfxfTiwGKhdAyrC6giR7f+4+m8gjswLFQGAThQy6?=
 =?iso-8859-1?Q?AmX8c/SOAhzmqtQEU/bZRmrOPYiOyf7bg138socDmeqijC99Dj73TXCU+g?=
 =?iso-8859-1?Q?PiLH4qJCe0hCKyb3BDZ9LaFTG51PvPT/5NfE6JXJrcyDNsY/axF1ZO6fln?=
 =?iso-8859-1?Q?4sS6RWsab9KkHhY5tnXQYMSKCDclfqzPNG58LxXR2h6+ts1PNYDB4jKck1?=
 =?iso-8859-1?Q?Wg1nFePf1T5hRx7Ays4gM7QYHGH93UYkuOoUWWxOIME4DjokJ1bvzd/z9F?=
 =?iso-8859-1?Q?wMkdSFRW/4SDTi/VucOcsAm/5+p2ezLKGijVszSA//8NDll7oeTMAInaEo?=
 =?iso-8859-1?Q?h72U+bL7ru9Oy7oMVuX6EaWy1ljdVvM+ejN6OTsLgiVzRX/HjYrtx7sWcn?=
 =?iso-8859-1?Q?1+4wdRrbsb9iepr2GNdF945ZOCX2lQktkl8/sN+gtqtUiriDzIEYEYHhWn?=
 =?iso-8859-1?Q?R1qwvEgyt2KeVEPJj5iHNXmFn4HNPfK2ubypsx51XE0mLDImgu6MpNSC0q?=
 =?iso-8859-1?Q?zR5FY17hS0jOY5Tsc8Anbldr/Zb4c3cZBZmaw4zYpUzHzyMkg6N+pQEdaU?=
 =?iso-8859-1?Q?Nrwmbm3eTFIELnLr88BWEifkL82+SRGVh5P+noUw9VotdjTJM6r6byxLmE?=
 =?iso-8859-1?Q?HSWcc1uVDo/U0V5/sYH6SecSsY/g+W065L+S4asm1n6aOzni/QHaWE2WEk?=
 =?iso-8859-1?Q?045NSmVaQe4BZo84H4PST201r+BPKwgmVzGIjKBFTvY9gdvdP23CBJAUo/?=
 =?iso-8859-1?Q?zXIkbKT0a/79BMgEJr3vsAPdx2rhdgnehve0XT0zLXEleuk8bShi1rtZ+/?=
 =?iso-8859-1?Q?6O8Ki7sycCoe6MW8yHT2WTOLj8PO+qzEq1XEUo1v3QiCd8VnPMl2Jd9hgs?=
 =?iso-8859-1?Q?YtRp2Cm79NsnkkDvUP9eCMKZn+kldv8SKn/n050gNweLIxwd7p5kQO7Gqp?=
 =?iso-8859-1?Q?hZFWx7Oi6bzNmE/Vq0rlYx5OYAnt4iErbU4ZN5uTSJYh348X/mLsYo/OFZ?=
 =?iso-8859-1?Q?KR33UKaizXtJbxXw+tqSfNvpoP2Suo2c/9duzKhOjdBqQTiWfqPGZOLdK+?=
 =?iso-8859-1?Q?zHaeyGOs9O6rFe3UcRXf8H7lFS197JrTMoAoMXAbfA96UOAKZNMGJ+HWOx?=
 =?iso-8859-1?Q?0TdkmGmGR3wCz0lZsCKwPF9dkwU1uuAO1RXh3U+uhlClQLcj7tHbFXuW9m?=
 =?iso-8859-1?Q?KaripO6v7lfsr4cgSFWHEi5WtdP0PVbeFtDo8MHALWvsh4Zc2A1GDEPikD?=
 =?iso-8859-1?Q?4cuBrWV23qGYBnUzB5T9dtTg0Wi4AO+HzILcxXmcMLOcMFyUKgLo4CsXAt?=
 =?iso-8859-1?Q?n10fjXGIZCf4QvpWVtiCZZgNlHPZLNaNtaj/FDIAn0qtzbputC+g6EEaDK?=
 =?iso-8859-1?Q?awdqtBYOSzWjZgiaGKvx60?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR17MB6130.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?eVOWG3yIXpN72MwiQMVSqm8Nu56xJDMi/ZwY/LwfvGVTqiw5kycCuFuKhH?=
 =?iso-8859-1?Q?+xkjiIv6XTBcrUvv6eDTHBWqugjl+24fFcd3jXYXluSTahTMZyZtjcxMl2?=
 =?iso-8859-1?Q?rOE8JcFqQZ1YXYC1zTYZZllC6++z/yRxbkl7FX4Rx+jEDZ5xlaPAigwYuy?=
 =?iso-8859-1?Q?hhljyNVmPP8GdZW6n+dqBvToQ8Ym1eDKy3oRsz8wKIJMqarRWsl7K+H+lS?=
 =?iso-8859-1?Q?GMe76zw8oVZi//XbzRvHMReCWV4ppzSm/eWew6CSCzLnfwMZsH1852+4FZ?=
 =?iso-8859-1?Q?urGImSe8zxijz4vgPwJLPd3N6vpCx2NJP+RhZGXoyR3F4efuRimJTVHD8+?=
 =?iso-8859-1?Q?iEbGhpFk8eycSscLJ2pZhxMZDBYK+IRVcf+Z+WN1V6d97QVw5gQOBqNRxD?=
 =?iso-8859-1?Q?HPtLgRGyb3V73h/qlDvtNY6wZdp7IpT5zjp5E06/PB6TJyvFUje329X4Jm?=
 =?iso-8859-1?Q?aQ68w2R6C/+6cBoQpSZTehBkP79+QUmGF4OfvCwlxIUNZPyim+BiezYRHo?=
 =?iso-8859-1?Q?3OR8Ms5iSM/8tvJzGS/Q/vw0H7Hian/hLzFFe8gnV1qUuEjVJ/xNUuK7x/?=
 =?iso-8859-1?Q?JDO8h1P3UBvO56Vqi9HK/ZqRyAvTEbFiTf/hmVSMSBWuJEdjpilMD8zVc7?=
 =?iso-8859-1?Q?qZFwqauj/yVoVJCwidxce/eVZsnMmVnNQXIrb4uqLK6OTI3uGqOGm9Kw6Z?=
 =?iso-8859-1?Q?HOW2ppBkqqXNfdYwRytBgROMMDnfrSXL78y6ZLRKHpjQ/lWxRkXqXKnMQ/?=
 =?iso-8859-1?Q?wtqP3hLwYUEk+s4gcGRIUPJhKLdCPdYv+dQFAi+aFkd4h7xBEZOMav9XPP?=
 =?iso-8859-1?Q?awTjBH0uBe+LnBFC57mxyo7k61XOoZzK+Q49+sik2j4JvCjCB2/sfoIuqw?=
 =?iso-8859-1?Q?Om9VmaX+rHfczXazTG0pcMUcsgNFAk84ekXt0NwaHUHkL+y2d0ndkRt9Vp?=
 =?iso-8859-1?Q?ZlqzFHxBgc744zQRrONQVCMkG7V2mru/7oynSJ1dxIarhXCPI/o4cj71Jx?=
 =?iso-8859-1?Q?DGuTtNBjiAniP//DjBVmOdeFk9/gIuy/lG0MnFytAIpDPf/RjIMG0Aq5wX?=
 =?iso-8859-1?Q?eFjOUyO/LGJ3NFUc0FsZqc4zQ+TM1Er1+o/VdEREOXDsOIKsfWN2n3vpHP?=
 =?iso-8859-1?Q?mouj3ME/CeAnaszxBRZ61fpfg8cSpOIXExsi+B9mhXXek5JlXo8z9a/shc?=
 =?iso-8859-1?Q?A7N+7gSra7O+8HX3DS2RDrRxCkETPldcnOc0zW6NJeWcjV+ZEep2Rz6Y2w?=
 =?iso-8859-1?Q?JsvEMqRKcQqTcaCBh51Rtu24NE8o5s0xKbXOnRJlOMQwmy3y0jPbLavPbd?=
 =?iso-8859-1?Q?4/B9j29Gj1ejsedzXLrBKFQtrAYSatBE301mgi9H4D509dot+x/ErQ512u?=
 =?iso-8859-1?Q?Dmzi66og00a4CcHW1Iy6isLDSr4tBvvFFLWo/ed14RrdPE+lKR+a4Hmeid?=
 =?iso-8859-1?Q?WewgevwJYO2A960miYsqF+a/Dff/2GoTUtOx2eBioY5tJtduUuj8j9rECD?=
 =?iso-8859-1?Q?SQ8Cy1h5q99GZS3ueb69PiAqwuTpBqX7Kz5+oDBu9+f3Af//FILsAhj4si?=
 =?iso-8859-1?Q?L3Re3ZV3LBHu3dQ+4d1Ov5uC4a0wG/hYlWC0ntFaMi2tU9Nu3uZrYrhHEN?=
 =?iso-8859-1?Q?0md6POyvW0yuKxDI1xsedLAPrbAqOP80Ro?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	3eFoqx/D1f28rqJZ8welZh+1YUdmbJ2NJc3RoC9KEkpXTxZhlSOrW7TBItpW/fdnlvXP+XBcuWrTaax5x8CFxOn4wp/CJC2MofCH+0FL5+RIeIdY/Y7HL80n0OxMVRHA8zux1X4aCZ18vfOt9WgelWoi4PE6VM4bzgQdVjyEBkj5/daC06NIp7xhWk5x5D5ILRvnH5pCfCWzhiMrlzPqkS112dT7rTKGTby7IUNjvwS7PJkL/XaLnvA5RNEMpQukJgPHpOzF8+wJhLHCV+wamMhvw1i4z/nFhvtT9VFDSH86TbaLdwdoJ5HrmmvJ+LrZFKxKt1V9sgh2371m7GnpnnNyP3PTZXH9uYxqNWcm13vgJ6LmQdi1lvaA/kO7i8YaRBmd05kcIPXPssmqX4EfdKa+D1VWMaZYIEBb2100E9W+tGePEfmTF12xS7v1YNI8dCASABrVmSeo18y3mySt0K0q769dnuuw6XYyTwl9SRUBMh06KHuAgJSzC8X42sMnpfrdm93A4elqF7hywl5NDXXfth50witIWJKftSXbsR3T76093+xxwf8rT/JbklEh0x6QMv7h/ZwUelWJG/hbp6gd9MThDF+wSp73+/XDkIgZzuUNedCplBjEXO6vZ/FB
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR17MB6130.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c45aac4-e534-48e9-d78a-08dd6240766b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2025 15:05:16.0241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G4InvemZuun2m8csHj1cHcgnESAs7odnYAOmPwdQLzWpkZyBSNkFi4qL6UXyzp9xpso3PP8rOy+d5Ok1aBJjUnEOCzo/HDK46Bjqi4sUZuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR17MB6314
X-Proofpoint-GUID: eDgbISOwj2hfGa0uZGIwyz8jP82-hPB6
X-Proofpoint-ORIG-GUID: eDgbISOwj2hfGa0uZGIwyz8jP82-hPB6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_07,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 mlxscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503130117
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 15:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115975

The functions related to signing the fitimage had missing quotations and=0A=
newlines. Without this punctuation, the signing class would fail to=0A=
generate a signed fitimage.=0A=
=0A=
To test this change just create a fitImage using this class and set=0A=
FITIMAGE_SIGN to 1. The resulting fitImage its file should have one=0A=
property per line with quotes around the property values.=0A=
=0A=
Signed-off-by: John Ripple <john.ripple@keysight.com>=0A=
---=0A=
 meta-oe/classes/fitimage.bbclass | 8 ++++----=0A=
 1 file changed, 4 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/meta-oe/classes/fitimage.bbclass b/meta-oe/classes/fitimage.bb=
class=0A=
index fef8974187..03c01a1ed3 100644=0A=
--- a/meta-oe/classes/fitimage.bbclass=0A=
+++ b/meta-oe/classes/fitimage.bbclass=0A=
@@ -276,7 +276,7 @@ def fitimage_emit_subsection_signature(d, fd, sign_imag=
es_list):=0A=
     fd.write('\t\t\tsignature-1 {\n')=0A=
     fd.write(f'\t\t\t\talgo =3D "{hash_algo},{encrypt_algo}";\n')=0A=
     if conf_sign_keyname:=0A=
-        fd.write(f'\t\t\t\tkey-name-hint =3D {conf_sign_keyname}";\n')=0A=
+        fd.write(f'\t\t\t\tkey-name-hint =3D "{conf_sign_keyname}";\n')=0A=
     fd.write(f'\t\t\t\tsign-images =3D {sign_images};\n')=0A=
     fd.write(f'\t\t\t\tsigner-name =3D "{signer_name}";\n')=0A=
     fd.write(f'\t\t\t\tsigner-version =3D "{signer_version}";\n')=0A=
@@ -341,9 +341,9 @@ def fitimage_emit_section_config_fdto(d, fd, dtb, compa=
tible):=0A=
 =0A=
     fd.write(f'\t\t{dtb} {{\n')=0A=
     fd.write(f'\t\t\tdescription =3D "Device Tree Overlay";\n')=0A=
-    fd.write(f'\t\t\tfdt =3D "fdt-{dtb}";')=0A=
+    fd.write(f'\t\t\tfdt =3D "fdt-{dtb}";\n')=0A=
     if compatible:=0A=
-       fd.write(f'\t\t\tcompatible =3D "{compatible}";')=0A=
+       fd.write(f'\t\t\tcompatible =3D "{compatible}";\n')=0A=
 =0A=
     if sign =3D=3D "1":=0A=
         sign_images =3D ["fdt"]=0A=
@@ -493,7 +493,7 @@ do_configure[postfuncs] +=3D "write_manifest"=0A=
 do_fitimage () {=0A=
     if [ "${FITIMAGE_SIGN}" =3D "1" ]; then=0A=
         uboot-mkimage ${FITIMAGE_MKIMAGE_EXTRA_ARGS} \=0A=
-            -k ${FITIMAGE_SIGN_KEYDIR} -r \=0A=
+            -k "${FITIMAGE_SIGN_KEYDIR}" -r \=0A=
             -f "${B}/manifest.its" \=0A=
             "${B}/fitImage"=0A=
     else=0A=

