Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89533C6FA86
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 13:21:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.6025.1663334495068432592
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 06:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YaMIUmCi;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6258341ae8=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28GCwk2M031319
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 06:21:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=VqwsM9SuXiS44U41hPN7UnKgDAn99F0ztrFJ+h5w3Rw=;
 b=YaMIUmCiHYWW2+H+w1lGlugn/BsCAo0tOq9etV3BpfLzIsLyHghZoG2nwJpBsKQouXJb
 YnuzjHGoRZ8H7dLbX0Gq4NkI+vdc/vDWlByCLNKK7x8SCeYxazxDOb5KiEWAl6+Fe7a4
 FvwKhqHmjSkFvnaf4CZsAn+Be1+9WExaJ1BjpOxzo/ofRLenlm0MmOQHxM4F8AqCtY2J
 WEryEBZBSeamiW2+h3GMMbWVHn1A13fDAcnQ3hLmamhrtLkCxyQa4v1lqXX5U80UZbYQ
 RD3E+4PN+dB2I3oZX/RU8GoucD2fYJHPue55FpAsBvDYL9WFIEfGO0lGC44NAsHpj07I SQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jm8ydrpgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 06:21:34 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28GDLYUm019875
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 06:21:34 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jm8ydrpg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 06:21:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGR4XoAU+ZHmNaF3VEF54rX9wQxOP4fftwslh2EQCauAX8zq1jKGP0ylTcBQzV+zieRQr51NoYeibGjDtS37p5Q7zGzNSdPVD4EjFpTVrmxxCbjDUFyg/wI0ZqhRRE9MTXYybsYLZ4T0W2uGsPojlg++cIEt9n6q+f47sU4gO66Lu2gwyVGp08GlzeGUNrvuR7d+QbWpsh9wA5XoZsoIyBTql5nUFh+ir0M/yqO8S+9H5jw311K/YMjnRtfuggBXdVP0sGPq4uRFC6kOtGElLOuCtPUq5zOPqSb2hNJ6id1I1ZiNdDaw6NOoUui1YeVDh0h/48bC4QQCqUqgzv+gFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqwsM9SuXiS44U41hPN7UnKgDAn99F0ztrFJ+h5w3Rw=;
 b=FNRzAp1ZGqqAWAeY6fhRjihG7Iq2pmIheIqkQbe0B973cnp3VI6uud6/0DbFCVBB0HKYCHpC2NTOCEGpzqLcz7j8SkRTSe849+jy7mrKvsaB9S11Dz7RZUphg4p/JLlWTmi0RU6uSgbGfvKbI2afomyGIYJa18GhJj7AeyD5uKvfCzj1BSowJMY7zmJiLWAs4F+np0nx9oOM8FPPwhtkuSAKJA8KPYMctXsA84JHeoPEtVDzok4h9N3of8UdUtHU5KpqUBkf45uFoDgDMwBODO/MnQkr9/DzZBw4+jZBxTo4kMyg8isOcVU7aGMIhdF8Qdd400uTBu+XksIkExCT6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by BL1PR11MB5977.namprd11.prod.outlook.com (2603:10b6:208:384::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 13:21:31 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::ac28:d65e:ef3e:3635]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::ac28:d65e:ef3e:3635%7]) with mapi id 15.20.5632.017; Fri, 16 Sep 2022
 13:21:31 +0000
From: "Qiu, Zheng" <Zheng.Qiu@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "ross.burton@arm.com"
	<ross.burton@arm.com>
Subject: RE: [meta-oe][PATCH v2] jq: add ptest
Thread-Topic: [meta-oe][PATCH v2] jq: add ptest
Thread-Index: AQHYyT8Pxgc/CNBRu0aZRMN0cCaAca3iC64g
Date: Fri, 16 Sep 2022 13:21:31 +0000
Message-ID: 
 <DM4PR11MB5536E27B703D91A5AB16DEBFE6489@DM4PR11MB5536.namprd11.prod.outlook.com>
References: <20220915200911.37577-1-zheng.qiu@windriver.com>
In-Reply-To: <20220915200911.37577-1-zheng.qiu@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5536:EE_|BL1PR11MB5977:EE_
x-ms-office365-filtering-correlation-id: 6da112e7-5ea3-4aa9-351b-08da97e65ed5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IMSNz0f75q7Jt0ftxoqnLbDWLKblsMz6TJRKqfvRYOUHdvvj+B5qcPnFAaqMBxCz3EpUmmcVYxBBtVdLBaeuHha/cK18P03w7TRyEJdfqqZjwdiW0uCEB4+tM+Ws5HQFlu9zeG+DCWQqAp5aUOMfBqJ1hdYa9/3BjByjVpuerECzYRj36G6MTiQLzyloskWq7t/aY7LKZBysOFx/zIywAxlAnsxRIPRdrwR8ns9zdy3aGJSsODwKum8goDUCP0Eak0kgAdUVb3IqwQ5jYxJKsyETFJKCFBzxeCc0WIXpaS1/+FGG5oH7yEgUuV0P2rFS/YOtJHbWeDD+MbsKPgIy3ha/XRvLkAfpM98IoW2Pg8C8ksT5N2D7XX9prF1wDIxyq2Dn6XRy0qxG8OYrIUrgL7A+uRIBLz/zJJwPgEyZ+SgYX1V96CBRYWQ80NZYg6L1Isv5z9foMMJmK2UNFB5B6ksjLl6kMx7G4RkWKsz+RCq4As3YvOexysrD2/kEtwgjwAdpVd3Pna15a5T36rKEyLyyB3y/tRr5OXKti0hAm+zpY+Mqy03waUBInmj3MB61Pq7bg9pw2nYA/mo7MzRi4FkzfCBwFYJYRfdw+QOCzMNrPBRxmc1OnLOZyJwwQ+zdlNkzCIIHcNtAg9+kCFbmxyja0qTwYMp7R/a0UDCIgPD9WqxgBbhOhY0JtM+FKyoTJz38ZrI18i3URETx9qISS45x71Fp2Z5P+nSEF3ad3jqv2dUGrDGl4nLlx1lps+O3Wmlm748u04ySrSLbhXspxA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(39850400004)(396003)(366004)(451199015)(316002)(8936002)(52536014)(6916009)(54906003)(86362001)(5660300002)(558084003)(66476007)(66556008)(66946007)(38070700005)(33656002)(4326008)(64756008)(76116006)(66446008)(8676002)(122000001)(2906002)(38100700002)(26005)(9686003)(6506007)(7696005)(41300700001)(186003)(83380400001)(71200400001)(55016003)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?2PGrLeGuk9uBJfHbxqDLRMTFTdHWvJTnna5ar/gSE37aoiqL4aGvjrFgxdec?=
 =?us-ascii?Q?iFGm//S56wk/Gr38onCPVdVh1r22EEqEvhDB4uZWvMXp9EqVgHSfosPLWNgn?=
 =?us-ascii?Q?uf9r3EoAmhONMD+8unuKWo4HOvjxJxiOFdD4sGJclQgE/7c7uLTgSeKdC5el?=
 =?us-ascii?Q?FPL1qQaAZsBGlFpXv0sysrorVy8Iy1iOkwUoViSibEeIjy3FAZvQndE/6nWr?=
 =?us-ascii?Q?534AenaRkZMY9U6hy1Mb8h4kJMl967O3uQY7cYUg0Nu0beQppcUjdlxo69we?=
 =?us-ascii?Q?7DRXrsOsGMRbPNF7mv32KO4krBiUR3ujKbcmSY1QZeRFTwu3W3bioZ2GY270?=
 =?us-ascii?Q?onHgD7SVdziWbbBLuNXZHf7ICjCezIA9yb9zu/0GtS5+iWXJNpCDkAFR2bPo?=
 =?us-ascii?Q?k20rmPzVVI5FHcTEKHHwyfmAJjyRoB7cvF2jplfzROD8Az/b3psTE9j4tCfb?=
 =?us-ascii?Q?ZenPKmj4e35yFtcmhihLGW+YYaT7YfxgYXmxbPCcDD9sNBU/RY2ATDp6EyZT?=
 =?us-ascii?Q?+rD5pzbWl9j0RbQlzQuk06zP8R4N0C44aFPzGsR/MLH1atg3dKLvtwMdiClF?=
 =?us-ascii?Q?WUTGAo5YgjUzk5LPDxz0DhhwBFiB8rkVR9+FENlvBVk50b1X0U4pgbzXcpGI?=
 =?us-ascii?Q?atwSykNH4gdUtmP/8r6nteoUjZIeQI8eu072ygTwmnThKWjJ1x2FhKRMdr/d?=
 =?us-ascii?Q?6bvE3rJL04RK6FGYw1N6Y1fo/PLxGPvXWLV+mO5TYKeH2VvXw83z/aWA8f8i?=
 =?us-ascii?Q?HG8Rjr195JsY610+vMeGRFWXao5jX1QTi77BhVle7SyNdp5KgFV0ZsZx3WdW?=
 =?us-ascii?Q?0gL3hm6k48U3jJ64HdaJb5kU0828Jnn4y7kmJW6peB9JZ7V9Aw2Cdjddk3Qx?=
 =?us-ascii?Q?mdVa74NHqsGOQrzDUY6avuxrlT9ZlyHX8t943kr2AwogaJIr/fuZT7icRDd0?=
 =?us-ascii?Q?7+lxl1+VksmPm0YI0I/GdpP8JWE8b26psElAKJU24DWVp39Q3ILRGtLgWT7G?=
 =?us-ascii?Q?mIve8gIa4id0VxE4NoJRlmZ6yqgPTfvdpPkAF6UeVAwnGxu/SsAwNDGBOlbH?=
 =?us-ascii?Q?Zx9Amm4c9zUqTp1+qcaq3C7/u71D3wJ4OwhMvEqM8IeEUG1Yks+dK+Ulscdv?=
 =?us-ascii?Q?n4DP0inzp+x3YuUMleNY5Oo6aATXQ9qmiqm7fS0FndCxam6chJBcxaZ+aCHN?=
 =?us-ascii?Q?95FomtcI+KTF4ef133zg1H2oosdbcvLSbFMzGGwZTSMVYZNkTlkA/HpdNGWn?=
 =?us-ascii?Q?nPEh3vh+4i6PSTP8cnv1Nmxx6quwN6idPfE8k5Qu2L1GKlIbijZ7YHdrv3aj?=
 =?us-ascii?Q?NcnHufxWcovJdT780odywj3UVlV4BbcaYt9vJ5rKt0nVxH8UVMLX+C9v3G3L?=
 =?us-ascii?Q?Y4FUW0mCAOC3gNGGEUgJA5OJ5CJYxCEnSE3vhqH98HsjM3agwoVfzcWxiStK?=
 =?us-ascii?Q?815Z+ZRPi6YdbZa66JyY4v4sow7+tRIrLoqj90fvoBtozqo/YljrRcrHD7So?=
 =?us-ascii?Q?akeUSsYBCdMsQmEN0icl9XBVbIpWn1UZg92Hp4XZV3UQ9Y3SDRsN/tpdR9I1?=
 =?us-ascii?Q?NSRa5gW6htEu8Priqfu2NP3/0ReAf05wZ70UmVBT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6da112e7-5ea3-4aa9-351b-08da97e65ed5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2022 13:21:31.5493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 jxBZP7PsSe8yPIxcEPTEWFdFErAR4428iyM7NbegUHOww6glWErgbi/SEuFkoshgIMpIwQ+3iyuKzmx1JgSRkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5977
X-Proofpoint-GUID: DsPAktRJngtZOawQVw5fs_aw8EyIsLeb
X-Proofpoint-ORIG-GUID: SWUGaWNJEbtId_oVhnMTTgUBLVo2l1Is
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_08,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 priorityscore=1501 mlxlogscore=532
 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Sep 2022 13:21:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98835

I've noticed I forgot something in this patch, please do not merge this. V3=
 is coming.

