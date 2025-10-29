Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544C2CCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 08:53:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web01.2679.1761727985074416892
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 01:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZVtPpiLm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=33977d2df3=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4RHmt507014
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 01:53:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=xeVNCmXkQLhLcLtFYoUWxurZffh9eWOMjvUaowJsPC8=; b=ZVtPpiLm39Kk
	AOkM5Lak+d+CMNoOO52pkaAwHMi1wOk1YxYR8q3F2C/i4PldExTnYtKbhYx9YaPG
	3MtUGCNVNL56wyYHWGV86JpKOQHJwojMip/XFGVY1PtSj6018+L5wV3ZQ/RCkb8u
	65zeBrtBbx5WgzgKXzlVoKmdb9YFmduzbo6ioBfhf5Ahj3TJO5OHXHamnTwzUWU3
	bPtxeCRYmmOugWNWq777jdTpZcUTpqTDq9yjVE3aWcb+A3DtQOY67sX/SzT75km3
	a2bdfbKrj9ZYVqrxiPAZvLu0C2AfcS7PxVsefaEHyiZSWFKs9LsrF816GHOgMRu7
	Lqewb3xOBA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010065.outbound.protection.outlook.com [52.101.61.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a348a8mmc-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 01:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4+MkfzgfVs98uIs2WxGXxF4BpQOxkJyspU0BX0CK1420pwUCs6n1iu4fZbm3+1eONFkYb3FrInPNobj7JLSTIS+wSvC8FdaGsROEfXLMtdf4LHw1C0xGEDtt008F0FQoBLaPcFMS3xJgmQuePBKw8y5JN9oNOf+RHN2u1uhtzb2wyfa6ZTcY0WuQlV403JjPY0r2chxL0EruEKYJmWcquHnhpUW8NDwhVBeA1NC23wWOBCRJFzSBgzQRI45nh1+zAUYCbXeaSxR8IIGNvn5O4fNWRmzCBdzorI1QaGIrLB0N00eWdUWuvKzyZumTvOB926bZ+9L2kOXv7cosg/RBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xeVNCmXkQLhLcLtFYoUWxurZffh9eWOMjvUaowJsPC8=;
 b=WARPDB+5nSdNLBkcRZ1ykdX7YT7nnJiPK3nCrggG3XWXF1fTr1JwThHJyhwbcwBV5l62d5yF5UtdyU7rmoTuRBIbcFZv6s7l9P0QcI/78swU5aztFwfReb6JEYHCtuPHkR58uhV2LJmPvYQMWLIu1sjIyUlmwuXQi9Ad0f/tEqwAApIYO2kNNkOyZLcT1N/YSbFfAa8XJBl5J8F9aD407rPB5qHwPtTS/GLKPz5lj/8Nn3PR02xBEaGRr6dw7ja3JaDenCeHjLnAzdq61oD4Mt7evjzsOqxuirX2MGEapv1nE5sU6JlS9jthA4I9OQL8V8o9/qc7q//iW+GQ2Qnpzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9420.namprd11.prod.outlook.com (2603:10b6:208:563::13)
 by CY5PR11MB6306.namprd11.prod.outlook.com (2603:10b6:930:22::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 08:53:02 +0000
Received: from IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e]) by IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 08:53:01 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][scarthgap][PATCH 2/2] webkitgtk3: fix do_configure
 error on beaglebone-yocto
Thread-Topic: [oe] [meta-oe][scarthgap][PATCH 2/2] webkitgtk3: fix
 do_configure error on beaglebone-yocto
Thread-Index: AQHcHj7o2raY6yoM00aBtU0o3wrQeLTZJdFg
Date: Wed, 29 Oct 2025 08:52:57 +0000
Message-ID: 
 <IA4PR11MB942004C4E0F8FFDF5716DB1CB8FAA@IA4PR11MB9420.namprd11.prod.outlook.com>
References: <20250905081538.3082838-1-jiaying.song.cn@windriver.com>
 <186254E5DF4989E6.5335@lists.openembedded.org>
In-Reply-To: <186254E5DF4989E6.5335@lists.openembedded.org>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=e2cf6164-5d93-43c3-8d46-35ae15334109;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-10-29T08:51:02Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9420:EE_|CY5PR11MB6306:EE_
x-ms-office365-filtering-correlation-id: 89137e83-90f3-4fdd-ea38-08de16c89144
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|13003099007|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?mTc8DbXEpPznGr0IwQC+551SJCtcxZTFMQKrLvqd9qIxDzJsZDHhZJkgXBV/?=
 =?us-ascii?Q?YjYUih4h8lXHFepVHIU3NiqVCBMvFez5GHUjZcfFuccpNnEpjcFo4/j4J06o?=
 =?us-ascii?Q?aYkxhqUDykwY9CDnJSmPo5X1wQKxeAsWwhO9se+7uxmTHeG6n/8qE3HGK5TN?=
 =?us-ascii?Q?yw0/5y5TEHauNyKDr7OnSvG18PYMlErVJNoDO9MMXJX4cB2H6km7nP78xZfY?=
 =?us-ascii?Q?tPDuLw00cnb66P0QijFW4aa2R9ftAYTWmPwVgjorTBleuR2ftD6CEAgKvhld?=
 =?us-ascii?Q?DcVBlWoopxnD/74iiJSx/M+jKqpPSZjOXV/b9pSNoKF/B9AhDHO7Cc+D5Gpn?=
 =?us-ascii?Q?+Qw+geQN4UgMAn0gArvGpTz5HhF7krcd8xRjjHyuHSCkvCMwdqhFduxvgNZv?=
 =?us-ascii?Q?nmoulbQ1CUdIVzWW/pMZMJQoSSThxSi2JcOM2NR4PI5rVJUUwad3L8+8kFcH?=
 =?us-ascii?Q?8C9Ok2kWK1HFvFCwUoA/m4kf6BkUxtg+oN35yvx8dyC2aikHFspbU7MxGviW?=
 =?us-ascii?Q?Ydr50gL6TVu1r34jF0aIPY4HsKXajCZW6MFGgd4iLZnrd47ck1tEkrw4bhkf?=
 =?us-ascii?Q?XxsDhSCqro8IU4fMzEHNhqAACD//OwmpkR0cTnw8hOsVyy7ppK6D1d/QF34Q?=
 =?us-ascii?Q?AqXD8/pAxJlwJBhAX3fwb07hAdHhJL5b45coIS1FM478eiBMUQuderKE8jKP?=
 =?us-ascii?Q?v4pQiHbs53SR/H6cnxhmajsvrPYx6zLeocIqTs2+o0IYT3G3gMZtsryLZhZT?=
 =?us-ascii?Q?sHrfretUBW29UIswNK2v1dHbrYK8qnGnBfYAxLhOByFEWME015mGOoI21qSj?=
 =?us-ascii?Q?KvIScLMHzitfMSSG1Y+B4tICWDS6k1HGphGSMbRtd4bq7xdlov96NJ/G+ODM?=
 =?us-ascii?Q?PVX4M+HKuM1QCOEZ7cH+qN8jfL8T2HpzMwd6JkFqYccFcDDNL0FOXyP/82kF?=
 =?us-ascii?Q?duECN/eI4lg5i1YVuA8LBy8WIdU6IHaIIOA1C7/V5riXystteGHipIka+HBE?=
 =?us-ascii?Q?peISmBwxmue4gyUhbnkz3ogsgNIqNtOjhfVsnlmoVAWuQpcudmfsr+3aUVo5?=
 =?us-ascii?Q?RgO8ub9Fs8vO0llJCEW3/rKWm+DK5h5b8GSFEgrR+gbBQWv/xB1mF1VPFB+q?=
 =?us-ascii?Q?SGA29BHG0Eb9lEHymlvhVO+4nR4prj6Tb9/PY+NyrsQqRPLP88I90Ol8oVOt?=
 =?us-ascii?Q?nlwgK6UurHzewHG+/RPM2070qPTXB/qvelGwlUOhJoIr7GKYBGiuNyfMc+uq?=
 =?us-ascii?Q?sOzU2cxKwu+b4QfrKp0ci6lEEJ2+LpxiFSmPYqrTiKeQoQmFmtswwa4AVRAC?=
 =?us-ascii?Q?2/UeeYkAFsgcT9y/auY355Msq+2ieOmn5aqSOIWzfdWoJ1279sOvTlQEIxo2?=
 =?us-ascii?Q?i90mByTwCFI3O41Sq7IJTBh7glmib4Fhdc9nvPQphWi+cSrdaODyW+NbCuHW?=
 =?us-ascii?Q?enVt4bOlVjcHmvL4yf/cU+UpMTE1XimYRm9UXI2Cgnw5rAlSuRKZ7A=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?MeUCQNHevLb64oGMwqh/Aq7oDWQVoBtxJJPc9OjKg8/HVsIC8JqvqgBhR4Sz?=
 =?us-ascii?Q?kLsC5/4XYIajtTGZQQ9BFuKZvgnMDrQhaXWEt1bH/8cwxL269ae+75Su5E2N?=
 =?us-ascii?Q?v4bojLLedFL+piX6POuP00PQJ85zIBLZ9qmqJii8zxGc1E139IjqlJj8aIpJ?=
 =?us-ascii?Q?mbKxGpvVcI42/rYC5WjKcb34vLNxt3kWOosEAVWDIecWsvRS6wNg1jS9pTX9?=
 =?us-ascii?Q?1r9nvJbo320ETL7CgyqF6pupC/klM1WM8nTpB9A+GV8lzG4zSZQ6uodkU1DX?=
 =?us-ascii?Q?Xs87TG5b88MsLjR0Lwj3O58wmxARvEiu28UVhvDjKQsagX5ofx/FMKeGbwy3?=
 =?us-ascii?Q?W0Me/HD8T6Vy1ubo7k4knVo/EE7O1foF1LkRTj0o3k4twREoAn1hH4Tn6mGP?=
 =?us-ascii?Q?h2mC3vd42LpSmGZW7OhHrcm1aLvqbmH3l45JuA0qE9ZmGzEwzHNSpZ392Peq?=
 =?us-ascii?Q?ZHRbELNS+KlfwwLI/8R8XFZXW/gMppRUmiRh9ekOdKR7zHaHd9LbPZ/5uGOH?=
 =?us-ascii?Q?j7EMZo8HbNrP7Ue5sexCXjzeogVPV3EYsZ6FJkF5m2R+4M4rNdZT9ciB32ZX?=
 =?us-ascii?Q?YV9e2EjEv7Tu4TeKCj18rNrPlBdq+P2B3KDWWWeHutp+BAi9IwHj8HYCvv4n?=
 =?us-ascii?Q?xtAM/m7hlOdHgPeQDjXYf8Ny76lWbBeu+nshVQ7aoWv793EpC2xOg1kkjDVA?=
 =?us-ascii?Q?r8xuiCKAFPdWSlw8VVIylWXCLPZB7RNdF9no2Cv0OOHS06PAwgD66xmaVVsn?=
 =?us-ascii?Q?oc3uG5iZBJEeM9UMuzon+5mT9rnaxkYJowkzrXuZBZd+lJ0u78TbaU9qPUy3?=
 =?us-ascii?Q?Rjg89Y6nBhdGSXYMav+CDg7WtZkGk+Euyhp/76dXA1J6EZSeU/JHxluhR1jR?=
 =?us-ascii?Q?WavDHWPE/PO1JLVZmurwYfEgn/F5cpiFcruoflf4DX4bpwozS1qFfrvLnq/P?=
 =?us-ascii?Q?+8EL7XLHhohDWmarL3QinkOzSkHaQuYZZ52EEEgPRKF9S1ajNQdy5v3PcmlU?=
 =?us-ascii?Q?ZU4Beu7icHfYdGF5YuATTR72SpLNyNdRU5ofbxXUjEA+DTXRDcxEDHGrERvO?=
 =?us-ascii?Q?H88paJPU+oMtwViKDRdLRWCPsTv/SBh5zbRvVutydqDOnlHIhutsLazGfayt?=
 =?us-ascii?Q?yo6JUv56ina+KPs8li5pz2DPz7MD5Pq4/UdBI+IiFmsJcmHjkn7LPOUtB7at?=
 =?us-ascii?Q?ItQFtqd2NJBJxOxsh9U+aKtSAGwzf3DZeqiIFc+UlkIToL7i2HGpy+JmsOvF?=
 =?us-ascii?Q?A6wL27cne2QJq6Av3BBQAANqYwINkA5HxhVrGFTX049lmrubyNjBlTKJogc6?=
 =?us-ascii?Q?UkVN20awO+caIbeE+jDGoawi5Bd16vEKneue67akTRpqUaFlzHuRsInNGNyr?=
 =?us-ascii?Q?8SOcTfr3eJQghwWarqRfg1uyCxDNaxm9WI+jPKxNvZXBY7j2N6mH0XksOdtH?=
 =?us-ascii?Q?7+yMDwWFtfkjDPWoPD2uojLmlWWXyIEK8aY8bpULntPDP/SeAZuF5GCdrKFW?=
 =?us-ascii?Q?5EX2EXpsnquNtkmLrEgoJwe5lHTM6qpb3OAw6WumgXEb2fOPfbQMd533wSHH?=
 =?us-ascii?Q?Pjn9djRK6A9VKJkQkahLTuOUufp9W/3U49RD0h59ja/djWEsrtrEpaL0LzLm?=
 =?us-ascii?Q?0w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89137e83-90f3-4fdd-ea38-08de16c89144
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 08:52:57.3518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3/lqJWUZkxsOEu7Pspz6fZcQM52jG/c/Aa9DhG0XXL75wOpAnGc5ElL5dRpREdwLngX2USOFltH6xveJzWleIZdRgiCCVpNlAw99Utdme0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6306
X-Proofpoint-GUID: cIaKeBIC913my9X9gGBBXXSgPCfuBAWV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2NSBTYWx0ZWRfX0SHWJgWhaqMj
 pUb6F4p9MGE8+eFHwwDF/Tfv4OmvSqQmbbv8bqsB3vpy6Jt5PfmJFo9DC6f5yV/tIpdTbOYTaFk
 imP7ziV64vIiOTLZOZ8ii7dFdOT3vaApwe1An8EfM0wRHoXEKjK2L6zY3rguQRRNPrZvVwsD1CX
 sKsJw0Z/VGACakDUuX4zh7JVnaP99h322VPsFI1p3kqHZnXexi/c0dd5aD8yR2ujRRCjVmIZHiO
 jpsx1cL6l8FLC6dV1yCx9GWr5MEOiBs8HEm3RBhs///WxUk6Kt9X79ipodheLE8upP/0pPccmoD
 I4CWZ4gxpyY1EB9PzYXzdOxVanXHJ2SzGpmOMB5xjXvjdFr3RJjhsb/cPYMcpwCiE6DA5bNwYqU
 IhnQt9fnmsMTvJyu8ZEE1sFjnTqk7g==
X-Authority-Analysis: v=2.4 cv=aLj9aL9m c=1 sm=1 tr=0 ts=6901d5f0 cx=c_pps
 a=mfnpAPd2LV9TTO/yo6PAYA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=Q1sTgoEvAAAA:8
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=LxHwoYbL2FXGP2J_mhgA:9
 a=CjuIK1q_8ugA:10 a=FkGh3qDytyf094M0uOEt:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: cIaKeBIC913my9X9gGBBXXSgPCfuBAWV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 08:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121143

kindly ping for scarthgap branch

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Song, Jiaying (CN) via lists.openembedded.org
Sent: Friday, September 5, 2025 4:16 PM
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-oe][scarthgap][PATCH 2/2] webkitgtk3: fix do_configure =
error on beaglebone-yocto

From: Jiaying Song <jiaying.song.cn@windriver.com>

* According to latest comment [1] and the mentioned pull request [2],
  build an ENABLE(WEBASSEMBLY) && !ENABLE(JIT) configuration is
  supported, so original issue already fixed in current version, the
  EXTRA_OECMAKE setting is not needed anymore.

* This EXTRA_OECMAKE setting causes following configure error on
  beaglebone-yocto, remove the setting to let the configure process
  decide the configuration:
  CMake Error at Source/cmake/WebKitFeatures.cmake:312 (message):
  ENABLE_JIT conflicts with ENABLE_C_LOOP.  You must disable one or the oth=
er.

[YOCTO #15254]

[1] https://github.com/WebKit/WebKit/pull/17447
[2] https://github.com/WebKit/WebKit/pull/17688

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../recipes-support/webkitgtk/webkitgtk3_2.44.3.bb   | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb b/meta-=
oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
index 7d70cbda78..440cae62dd 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
@@ -115,18 +115,6 @@ EXTRA_OECMAKE:append:armv4 =3D " -DENABLE_JIT=3DOFF "
 EXTRA_OECMAKE:append:armv5 =3D " -DENABLE_JIT=3DOFF "
 EXTRA_OECMAKE:append:armv6 =3D " -DENABLE_JIT=3DOFF "
=20
-# And for armv7* don't enable it for softfp, because after:
-# https://github.com/WebKit/WebKit/commit/a2ec4ef1997d6fafa6ffc607bffb54e7=
6168a918
-# https://bugs.webkit.org/show_bug.cgi?id=3D242172
-# softfp armv7* fails because WEBASSEMBLY is left enabled by default and J=
IT gets -# explicitly disabled causing:
-# http://errors.yoctoproject.org/Errors/Details/734587/
-# PR was sent upstream, but the end result is the same both JIT and WEBASS=
EMBLY disabled -# https://github.com/WebKit/WebKit/pull/17447
-EXTRA_OECMAKE:append:armv7a =3D " -DENABLE_JIT=3D${@bb.utils.contains('TUN=
E_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
-EXTRA_OECMAKE:append:armv7r =3D " -DENABLE_JIT=3D${@bb.utils.contains('TUN=
E_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
-EXTRA_OECMAKE:append:armv7ve =3D " -DENABLE_JIT=3D${@bb.utils.contains('TU=
NE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
-
 EXTRA_OECMAKE:append:mipsarch =3D " -DUSE_LD_GOLD=3DOFF "
 EXTRA_OECMAKE:append:powerpc =3D " -DUSE_LD_GOLD=3DOFF "
=20
--
2.34.1


