Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2647CCAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 09:19:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7126.1758791962577626050
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Sep 2025 02:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MkTxmBRV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1363c4b735=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58P5rLw52666129
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 02:19:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=kZFx9Me/+/KpLZ82pbajQ3
	jcwCbhe5wxp9TKaO1xS+8=; b=MkTxmBRVh8kyeOIVcgsys9IyF8SzBF06KsBf6H
	QsjH1zXJpwm5PCkL+LTPTP85taJyeZ+V87CKcQX8zUB9+MLJMNef0m1fmcp1FUtU
	PySjvbtO/tAMwJ2j89V9YOkvQct9uxfhPWsszA0rLgYMMYrXsSfbrKU3GhBxazWu
	bPFupRLe1Q3aYHroSiW5SsOxFAiEBvzPGjq/kZtcwkICBZZVIDNmtGuJySgyr6i8
	5Z69K3HHZfMI/pCZlnusJsGdYdZsZYFbkXPA4YHy9QgW9Bxiwo1TJaeUmOn6e9sl
	OdFNYwJWfFRMgsnAc5Lr8VmzPEmbwk4ZQQvFi20suCZseV6g==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012052.outbound.protection.outlook.com [40.107.200.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499usfntve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 02:19:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBux45eEejBl3vtLWxbefbfLJ3q+IbAcTDQqbBKuntyZdwbi4LHNijfeja3grzjT3VC3nk4jqbYdOFDH5hjHzW8xUKoxNNs9ZHXGFewjXHFXwfPbo/NEcwdNxwCwbULRi6IcJf1jVa0cVVT7LgLaapOdC2Nk3gABIveMxPFmJi02Z0/UVvtQIfpCruYLyhrw8b2fatkb/YL9Q7m3hRnbRtcC4ayL/RsscmPwFU3WgqxdUl0MrSrW83y1L5zCFsP5vSXU4Pp4xsGQRvHzLeGoBk/d9NSj41PJGIpU5nRCWUULaksYLyC5Tq7khxseE+E3HwgwQwluypoNrf0KBCdEYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZFx9Me/+/KpLZ82pbajQ3jcwCbhe5wxp9TKaO1xS+8=;
 b=i7WfebT2g6bMdfy0k1foznnL2l8+ybbS+E1n3Cb22DUgFZuQE58vGH+OBuc3B1cg+XHUrtwp1ng9Rp2MfBP41cB7oP1AS7/vUtGyrAHAGQOWHiRiJvBBQKre9FdzXAzUzkiVjj3Gz6jhfBKPL/30QPO7Fe/nf8I1TeKmUvSR3SKzO6tvQ1x6jy4wsuKw6qBmNgbOqq2hy8D5rdWrlz4+aa0lDQ1IlPLI6M73T4j0J0go5CTEzWOGMxnOPBh6serlFn60TW84k0Icv7OC9z/y7/oA6yfTYZymL9XPU61OgJQakzodjz5rvYGB4SpYMY2fW/5weS5TIba65Ouh8eIylA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 DS0PR11MB7928.namprd11.prod.outlook.com (2603:10b6:8:fe::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.21; Thu, 25 Sep 2025 09:19:19 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 09:19:19 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
Subject: Re: [oe] [PATCH 2/2] tcpreplay: fix CVE-2025-9157
Thread-Topic: [oe] [PATCH 2/2] tcpreplay: fix CVE-2025-9157
Thread-Index: AQHcLf1SG88gnvpjRUit8jZaZaVw8bSjnuv1
Date: Thu, 25 Sep 2025 09:19:19 +0000
Message-ID: 
 <DM8PR11MB57031FEECD179BE0BD9F60A9841FA@DM8PR11MB5703.namprd11.prod.outlook.com>
References: <20250925091730.3926288-1-archana.polampalli@windriver.com>
 <18687BE0BF4657AC.29753@lists.openembedded.org>
In-Reply-To: <18687BE0BF4657AC.29753@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-09-25T09:17:29.842Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5703:EE_|DS0PR11MB7928:EE_
x-ms-office365-filtering-correlation-id: 088c45a1-f2f9-4df3-2fdd-08ddfc149b40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|13003099007|7053199007|8096899003;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?MA7Ao7+7mo4r4e8A3v+6xXnu2O7hdVjst4RC7R8c38hQ8yNkmeSQakLY45X8?=
 =?us-ascii?Q?VlM01IOV0jIhs2kX/Iwx6mAPuCKsIHA5j4Cn7AuX0BIeItK2OrYFlCblUVTg?=
 =?us-ascii?Q?cyDAI6YWYe2yTan99pd5/iDZprc09pIt7e8GkL201e/BNQNl3clL5xbeHVWQ?=
 =?us-ascii?Q?CRCwPVhv7dkLq0Rf8bB5+xXYI9bobcAY3QAktOFoALnVd15wk2Ln7r7Tqo0I?=
 =?us-ascii?Q?NKTbqJIec2OSh7aTvnt8pgXNwcA21cplel6YmwP+72iX0Cd9dH3CXMSjpA7W?=
 =?us-ascii?Q?XGxT89SePV9M7R9YRFMdaAX46NWb8uJczKmvEQVro2NsQuETNUtlPZzH3Yzy?=
 =?us-ascii?Q?Ef7VprNiZ5Q6NmIMXSn1yzRKikKW1VZnjC+/J776r9cTLVnwqzazzy/8Dw2O?=
 =?us-ascii?Q?FlZNq+UHNVuYJN0T7jV/NDeTn5+XFI8HYkASX9K9UEfVUa7DrUClieoMcQYW?=
 =?us-ascii?Q?xYcI9kqaSGr0hq6AosGTGUC6o40q6V3+YDRa48sEoNGePPmAOSMrzfQGgdiv?=
 =?us-ascii?Q?eMtZvY031MwYLbGmPC7eE57OqVac7sV6LdYV/r9Huk8ufxju7vcuMybuYkhq?=
 =?us-ascii?Q?iBGYQMokeueMMalvVn+0KjGA3seiOx4yox57ahzdi6fNz49zy4OZE0EqrQB7?=
 =?us-ascii?Q?s2+PPVi3XdTSP8PbnuqcQmAAE3yaaZ2w03j8EYwn4xzuTyAwWjYJvLcqpRJ5?=
 =?us-ascii?Q?28gK1aelD0ftO/CWwyLw7unrZcweKKkM3evmfmyFIoOUu1qs7zXw90UkOWEY?=
 =?us-ascii?Q?h5HUc/BNKjMf8NEI8PJ5VFZNMP/p1vbH33fzfqNpT01Ln3cToc/B8NBrjPPE?=
 =?us-ascii?Q?nv8gjIkvR8/b1/U1TY2mnBm7kXNKHL/8dz/W6wjVWrbdxEvPMdT6tF/1Y75e?=
 =?us-ascii?Q?WlE9owxFCYCdIvi0zDDlUZLOdzLmcepGVmpg7hxU3JiNRQVSbX5GMRLxD8T7?=
 =?us-ascii?Q?M40vAhXIXsXixOWaOBImfRQiMDTsorx+lvlmmhUGHe6Qn9DBw1geeDkzbKnM?=
 =?us-ascii?Q?+9pEld8/UiamLlRlN3VHTJBgnTYvYF/QUKDlH0Uy1PRL2o/ruJjmXQrFdHIb?=
 =?us-ascii?Q?/yzdyFWRopBdeXt+LjnEfQ0TxavocHbxOvJuVKqzHMgHEHXAb4cX4zFJtD4y?=
 =?us-ascii?Q?dFdClNtQ8CB9XtFT/Rgoagkjf4cCG7wqtyPt65r1twDhJvG8dAU9tJq3uatW?=
 =?us-ascii?Q?rkQ6Mkc6rCmBF84hTSgQFCszNe96pgAhtuUjvn7H9r5z2PyZpChjvfRGY9mY?=
 =?us-ascii?Q?ZtnQXlT1maaTCpWutd5i7gMzhffT6Xh5M1h3ZoDrD6xFc2U06Tm8x8W+tl7o?=
 =?us-ascii?Q?r1mU+4Rgt1quQfPRaykfXGLDoVDNrNdxYQIdQraTqNDST6Uy5RZyysSEwnzt?=
 =?us-ascii?Q?dGHXoVanmfTKlRoGpVDW/rMx1ZBHr7ezNTfbRCrYJ3QI6t2H4GdjY2KMxJx+?=
 =?us-ascii?Q?uGP6uQnC8p7VIc7IQnRi5z7h++zHL+m309vuu1JBtBExGr5ehUf25g=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5703.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(13003099007)(7053199007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?JlFTmVHzxqynJl5epl16JZ4bfKz7Hav/7a+NL80ziRDXbBL6EO+RS1vHY/Lc?=
 =?us-ascii?Q?Um7Z35VVmBq5HUWH1Lj7/b+OpG49a53lGRBImXcOVZZ8XyplpeuW9ydQvT2R?=
 =?us-ascii?Q?4VmyEtFFGs21vthUH3bGcPFAyQ5pQ5Bmc2cjl/7fVes1z3YxBb/s/dJsS4jy?=
 =?us-ascii?Q?C4n7a7eo47fsVH8c3ssWMaraypEuUzCC0rfuixYU9tpVH5s/y+ClvBibpXif?=
 =?us-ascii?Q?Evnoi+KzIFeCu4CvPihSAhf+2apmFq0FxB0u+IAQ0ASlIS11TVoQsj/YonoD?=
 =?us-ascii?Q?ar6HCyDCw7hMXxqZIWjy2yCUCR/375ki+myTXodWIK11zl6oRSz9oNy5RegK?=
 =?us-ascii?Q?lLORNPfSj8OmhM5DEz9IU/ISdb7QnWXzzIXW5PZLxRYte/4K4yz6OQ4SYjRI?=
 =?us-ascii?Q?ZvqXX/o9HYYR4JpAGgNhaj/mQEWyXIfiaiglLUFhq1EjaVfW/Rnk0Sybh036?=
 =?us-ascii?Q?I/JZEpRJGmZl+wP4GvOgnrN5M3ZPrkwnn6jzQ0djlPIAiJqEF62lfokRnayF?=
 =?us-ascii?Q?dXOKiuOmfy+KUm3viF3dKokmnFE1GB5M6p1BSRlI6MZgsyQotdOPBPTop8YS?=
 =?us-ascii?Q?6HRF4uk0GKhh7IrU3Q1G/KxLmNX+sUMpuS8Pean3JaXMRRVtr7pMu2Zc+eau?=
 =?us-ascii?Q?1LBNsh9vwPFahJbUsH22iDoeUjs0brR7Hdy/JEqdB7QFzZsFE+fUza7MyhIn?=
 =?us-ascii?Q?oqCK0JYTuk8QM8fXWf9pHJhalZAdOrfR3DeZmiZchXaEmpuSh6i+0QB+3kuQ?=
 =?us-ascii?Q?BHxEFKunjbmtOsmJ/3l94OFG1LE6vgS5CoMRe4L9p/2trjfjiK5Ynk9MlnS/?=
 =?us-ascii?Q?iE8WBnnqToNxfXh7qrRM13bDUgRVlZ9CRuREvJlI4NLFldetc1nAeusZ/fuw?=
 =?us-ascii?Q?OJ5N5CxgJt3oy0HbN8+l20q7ipwrZ1UrPXR2qxHmQwZLdbfmV1+cWMKJND8k?=
 =?us-ascii?Q?CVP1W56YMUYgnVyZLlloEValM8dM7qWbYoATddu+Wf4LXv5qdtoW8UQDrXMF?=
 =?us-ascii?Q?Egoz4rsAoZXwvRE/fit0ByzlE2zgIIP8YEAaehLOiNJhueE3v/vm7RboX3Qe?=
 =?us-ascii?Q?ccNEmOfH2y+hJy8ufvTcK9H4SBuGF88A+oE/6cf5OCAW0AsDmP7dYjP1BgHz?=
 =?us-ascii?Q?KknFZx5SJTWcl63E30RbrJNcAPvtcmcMREZx9AZGtzZTtjfuUzl2OpiIkZ3+?=
 =?us-ascii?Q?N+oX9JFhlZaGaUPMfLZUfkH4ov1gXptE7dFf4vYOMOrVm8Gsqe9yBlL+BGIo?=
 =?us-ascii?Q?3Aq5H+o5AECKdMxbePsxeITs5nTHgjfoTVnuUrFqCXOM1SAbseOoRB7zr6dL?=
 =?us-ascii?Q?i/29egPZ33h6YtJVdcGNWXEH2DgbmC20tNQzxV6QMCLAh+8avXuSau8L2fOP?=
 =?us-ascii?Q?zsS5Az2BhVQYoUVN38in0IzRtgyL3J4qSx7pBQlaZVas1nsy/OpzJWZHTZRO?=
 =?us-ascii?Q?aGbsRJzG+e5QZSaHkTDEsfwzhvaOWH+ljWfld8CQ5PpfrIdQjjPexxQchQzI?=
 =?us-ascii?Q?M/CcfQioYSSK0R3+R02aTb3qOfWidBg2CZDlp5WkGth21nqVsKfekni6uzcu?=
 =?us-ascii?Q?+c7iz+/w0n9yyxyPuhvVFF//4XwFwd3iGBLYdyDsBUzsNb33HVpmwNRrWy4f?=
 =?us-ascii?Q?0g=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR11MB57031FEECD179BE0BD9F60A9841FADM8PR11MB5703namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 088c45a1-f2f9-4df3-2fdd-08ddfc149b40
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 09:19:19.0253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vWwe4pKMe9ZO5VCaak0pbP0N97ZqRKMcNBwVZiOAibAyw7pgCHpfzai6nr10zzcUAzeg/DSWAw0L0tslqJt3fDcDr2UbE7B6EUChw0ZocXfaAPx4kL9cQ7n/04QPO1o/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7928
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA4OCBTYWx0ZWRfXxes5FVNs8RhZ
 vZr8xagtf3/3eq1pu4vK8e9Tioy1Ba8sGUxAfaDUSA0FScnj5EBoasPqi2JxmShdBiEAe8pRG1L
 XL+hZpLiyVQXP0JhFqczLJy+Ju9+XB/gplDhoOXpo/N05oyekhL580yyrJHASc+PEbdUx2Bqm5C
 WPIs++bokgJXrT+gfg8I2+JAF1crHQAdUbw6s0z2Pmjx3A4egru6k1L0JZkYS6/s0ZEihpn+gBX
 GOj86cAwuW9B48wdGZDNwkvcGza+76NwBj12CdSduZdSWjCHzOYRWNo4ZHW03sobyC42DwxCVgP
 Vu/uSvUTQhgMEtQqDk2NXW4v6gOX4d8ezd/qpKFn1tBIJO1cMgP8UAZyJi9NzM=
X-Authority-Analysis: v=2.4 cv=DrxW+H/+ c=1 sm=1 tr=0 ts=68d5091a cx=c_pps
 a=57vGMAxBKyli4KBmgVngpg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=Q-fNiiVtAAAA:8
 a=5lh1b5jesQBshXnhjFEA:9 a=CjuIK1q_8ugA:10 a=yN6b62wq0Oht8EK4:21
 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: S6i7hlLqhPYq9HJOWbtKSpEWJu48KQDi
X-Proofpoint-GUID: S6i7hlLqhPYq9HJOWbtKSpEWJu48KQDi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Sep 2025 09:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119856

--_000_DM8PR11MB57031FEECD179BE0BD9F60A9841FADM8PR11MB5703namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Kindly ignore this patch
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Polampalli, Archana via lists.openembedded.or=
g <archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: Thursday, September 25, 2025 14:47
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe] [PATCH 2/2] tcpreplay: fix CVE-2025-9157

From: Archana Polampalli <archana.polampalli@windriver.com>

A vulnerability was determined in appneta tcpreplay up to 4.5.2-beta2.
The impacted element is the function untrunc_packet of the file src/tcpedit=
/edit_packet.c
of the component tcprewrite. Executing manipulation can lead to use after f=
ree.
It is possible to launch the attack on the local host. The exploit has been=
 publicly
disclosed and may be utilized. This patch is called 73008f261f1cdf7a1087dc8=
759115242696d35da.
Applying a patch is advised to resolve this issue.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../tcpreplay/tcpreplay/CVE-2025-9157.patch   | 44 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE=
-2025-9157.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9=
157.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-91=
57.patch
new file mode 100644
index 0000000000..e52ec0dffc
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9157.pat=
ch
@@ -0,0 +1,44 @@
+From 73008f261f1cdf7a1087dc8759115242696d35da Mon Sep 17 00:00:00 2001
+From: Fred Klassen <fred.klassen@broadcom.com>
+Date: Mon, 18 Aug 2025 18:35:16 -0700
+Subject: [PATCH] Bug #970 tcprewrite: --fixlen: do not use realloc
+
+No need to realloc if buffer is already proven to be big enough.
+
+CVE: CVE-2025-9157
+
+Upstream-Status: Backport [https://github.com/appneta/tcpreplay/commit/730=
08f261f1cdf7a1087dc8759115242696d35da]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/tcpedit/edit_packet.c | 1 -
+ src/tcprewrite.c          | 2 ++
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/tcpedit/edit_packet.c b/src/tcpedit/edit_packet.c
+index 1025ff9..f9ade8f 100644
+--- a/src/tcpedit/edit_packet.c
++++ b/src/tcpedit/edit_packet.c
+@@ -558,7 +558,6 @@ untrunc_packet(tcpedit_t *tcpedit,
+          * which seems like a corrupted pcap
+          */
+         if (pkthdr->len > pkthdr->caplen) {
+-            packet =3D safe_realloc(packet, pkthdr->len + PACKET_HEADROOM=
);
+             memset(packet + pkthdr->caplen, '\0', pkthdr->len - pkthdr->c=
aplen);
+             pkthdr->caplen =3D pkthdr->len;
+         } else if (pkthdr->len < pkthdr->caplen) {
+diff --git a/src/tcprewrite.c b/src/tcprewrite.c
+index c9aa52c..ee05a26 100644
+--- a/src/tcprewrite.c
++++ b/src/tcprewrite.c
+@@ -270,6 +270,8 @@ rewrite_packets(tcpedit_t *tcpedit_ctx, pcap_t *pin, p=
cap_dumper_t *pout)
+
+         if (pkthdr.caplen > MAX_SNAPLEN)
+             errx(-1, "Frame too big, caplen %d exceeds %d", pkthdr.caplen=
, MAX_SNAPLEN);
++        if (pkthdr.len > MAX_SNAPLEN)
++            errx(-1, "Frame too big, len %d exceeds %d", pkthdr.len, MAX_=
SNAPLEN);
+         /*
+          * copy over the packet so we can pad it out if necessary and
+          * because pcap_next() returns a const ptr
+--
+2.40.0
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b=
/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index 04f3ee1c2d..008b385851 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "https://github.com/appneta/${BPN}/releases/d=
ownload/v${PV}/${BP}.tar.
     file://CVE-2024-22654-0001.patch \
     file://CVE-2024-22654-0002.patch \
     file://CVE-2025-51006.patch \
+    file://CVE-2025-9157.patch \
 "

 SRC_URI[sha256sum] =3D "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb=
2785e37ad6d4bf"
--
2.40.0


--_000_DM8PR11MB57031FEECD179BE0BD9F60A9841FADM8PR11MB5703namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Kindly ignore this patch</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Thursday, September 25, 2025 14:47<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe] [PATCH 2/2] tcpreplay: fix CVE-2025-9157</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Archana Polampalli &lt;archana.polampalli@wi=
ndriver.com&gt;<br>
<br>
A vulnerability was determined in appneta tcpreplay up to 4.5.2-beta2.<br>
The impacted element is the function untrunc_packet of the file src/tcpedit=
/edit_packet.c<br>
of the component tcprewrite. Executing manipulation can lead to use after f=
ree.<br>
It is possible to launch the attack on the local host. The exploit has been=
 publicly<br>
disclosed and may be utilized. This patch is called 73008f261f1cdf7a1087dc8=
759115242696d35da.<br>
Applying a patch is advised to resolve this issue.<br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;.../tcpreplay/tcpreplay/CVE-2025-9157.patch&nbsp;&nbsp; | 44 ++++++++=
+++++++++++<br>
&nbsp;.../tcpreplay/tcpreplay_4.4.4.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;2 files changed, 45 insertions(+)<br>
&nbsp;create mode 100644 meta-networking/recipes-support/tcpreplay/tcprepla=
y/CVE-2025-9157.patch<br>
<br>
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9=
157.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-91=
57.patch<br>
new file mode 100644<br>
index 0000000000..e52ec0dffc<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9157.pat=
ch<br>
@@ -0,0 +1,44 @@<br>
+From 73008f261f1cdf7a1087dc8759115242696d35da Mon Sep 17 00:00:00 2001<br>
+From: Fred Klassen &lt;fred.klassen@broadcom.com&gt;<br>
+Date: Mon, 18 Aug 2025 18:35:16 -0700<br>
+Subject: [PATCH] Bug #970 tcprewrite: --fixlen: do not use realloc<br>
+<br>
+No need to realloc if buffer is already proven to be big enough.<br>
+<br>
+CVE: CVE-2025-9157<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/appneta/tcpreplay=
/commit/73008f261f1cdf7a1087dc8759115242696d35da">https://github.com/appnet=
a/tcpreplay/commit/73008f261f1cdf7a1087dc8759115242696d35da</a>]<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ src/tcpedit/edit_packet.c | 1 -<br>
+ src/tcprewrite.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | =
2 ++<br>
+ 2 files changed, 2 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/tcpedit/edit_packet.c b/src/tcpedit/edit_packet.c<br>
+index 1025ff9..f9ade8f 100644<br>
+--- a/src/tcpedit/edit_packet.c<br>
++++ b/src/tcpedit/edit_packet.c<br>
+@@ -558,7 +558,6 @@ untrunc_packet(tcpedit_t *tcpedit,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * which seems like =
a corrupted pcap<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pkthdr-&gt;len &gt; p=
kthdr-&gt;caplen) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; packet=
 =3D safe_realloc(packet, pkthdr-&gt;len + PACKET_HEADROOM);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; m=
emset(packet + pkthdr-&gt;caplen, '\0', pkthdr-&gt;len - pkthdr-&gt;caplen)=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p=
kthdr-&gt;caplen =3D pkthdr-&gt;len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (pkthdr-&gt;len=
 &lt; pkthdr-&gt;caplen) {<br>
+diff --git a/src/tcprewrite.c b/src/tcprewrite.c<br>
+index c9aa52c..ee05a26 100644<br>
+--- a/src/tcprewrite.c<br>
++++ b/src/tcprewrite.c<br>
+@@ -270,6 +270,8 @@ rewrite_packets(tcpedit_t *tcpedit_ctx, pcap_t *pin, p=
cap_dumper_t *pout)<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pkthdr.caplen &gt; MA=
X_SNAPLEN)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e=
rrx(-1, &quot;Frame too big, caplen %d exceeds %d&quot;, pkthdr.caplen, MAX=
_SNAPLEN);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pkthdr.len &gt; MAX_SNAPLE=
N)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; errx(-=
1, &quot;Frame too big, len %d exceeds %d&quot;, pkthdr.len, MAX_SNAPLEN);<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * copy over the pac=
ket so we can pad it out if necessary and<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * because pcap_next=
() returns a const ptr<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b=
/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb<br>
index 04f3ee1c2d..008b385851 100644<br>
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb<br>
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb<br>
@@ -16,6 +16,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://github.com/app=
neta/${BPN}/releases/download/v${PV}/${BP}.tar.<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2024-22654-0001.patch">file:=
//CVE-2024-22654-0001.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2024-22654-0002.patch">file:=
//CVE-2024-22654-0002.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2025-51006.patch">file://CVE=
-2025-51006.patch</a> \<br>
+&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2025-9157.patch">file://CVE-2025-=
9157.patch</a> \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;44f18fb6d3470ecaf77a51b901a119dae16da5be=
4d4140ffbb2785e37ad6d4bf&quot;<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM8PR11MB57031FEECD179BE0BD9F60A9841FADM8PR11MB5703namp_--

