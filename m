Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99644E6C5F1
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 02:55:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10824.1733194521975834761
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 18:55:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20671066c5=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B32TjGX014708
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Dec 2024 18:55:21 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7tj3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 02 Dec 2024 18:55:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXBQtZDoKYu1G0SnPs9nwH5AF6XTroRNfQs7Hmi26KjzDrlZeihsjRMzqVE85AaZnwss1iaBWXVkIp2SDvIDtBNHeu13w4ttES5qj8F3mhWKWsI2me9Yuk9druTc1yB9LwoQBRvM9JwISZxnUCgCoDq6xoyF7hTnsQMkfS30SA+9ldx1Gb7q5eoZ0p+Pn9BlYJfKF9TCEgPMtXdnl5ix6jl6AwdlCWXbKydRmXcJKaxd5K1mRxRNUCkLMRHI0ssChnfYuL40S1oao3pkeMEeUyoSPvegZPSL2/SIi1/dSR04+FfBp7cOs14LwGwZKPvu2slqOoJSSsLXXDmMD5DPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdoZiyvAhUm+a8ZCMekpibdQG+5ncr/yaK4SsMcbi7E=;
 b=gwHD9F+RDPlm+XVDzQObL26pI/KquXs7ZZSPjUyzlTyLhBBWlT/vUCof5oUzxGeyerVE0e5XfLXkdza+JRuYJ7FEjz0pyLyyij9/RDP4Xiu/7wUzT+DbR651hrmbpTwzjOI2DMhW81VNDMy0T5jZ31Fi81MN5z/lqbAK0/fpVzPWAIiW79IIonll693PJ/xxXdjrzbxLqB0ba9hWG/mCBoPm42rJKn/CE3VSqO5l8Tt64rDBzGyxW4qfxfwWGa305+HOtZQq3ZtG5hmFjIZnp3fGlUqsDA3KpZYpNhB9t1vKY9k93A6K8V/rDpwwHDqWl+ICUihu/KjtwfJIRH+eFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 02:55:12 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%7]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 02:55:12 +0000
Content-Type: multipart/mixed;
	boundary="_000_PH0PR11MB561162D4A0452F87BD1D1365ED362PH0PR11MB5611namp_"
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Christian Eggers <ceggers@arri.de>,
        "peter.kjellerstedt@axis.com"
	<peter.kjellerstedt@axis.com>,
        "Zhao, Yi" <Yi.Zhao@windriver.com>,
        "Zhao, Yi"
	<Yi.Zhao@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Marko, Peter"
	<Peter.Marko@siemens.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
Thread-Topic: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
Thread-Index: AQHbRHoPF0sAD7AnAk2VJ2a1+CWVuLLSbwEAgACHK4CAAAKsgIAAAQyAgADVZKA=
Date: Tue, 3 Dec 2024 02:55:11 +0000
Message-ID: 
 <PH0PR11MB561162D4A0452F87BD1D1365ED362@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20240922073618.1359707-1-yi.zhao@windriver.com>
 <2746495.vuYhMxLoTh@n9w6sw14>
 <PA4PR10MB5707F3BA475C5BF809C08D34FD352@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
 <2168139.9o76ZdvQCi@n9w6sw14>
In-Reply-To: <2168139.9o76ZdvQCi@n9w6sw14>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
 <PH0PR11MB561162D4A0452F87BD1D1365ED362@PH0PR11MB5611.namprd11.prod.outlook.com>
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|IA1PR11MB6266:EE_
x-ms-office365-filtering-correlation-id: 325af20f-e3bf-4099-f1ed-08dd1345e7db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?cG1i9WT3ruCgiSeqbndS2MdTSlXRYGiRakMfLWXuwQlaPUrEYJDdJAqaQmK/?=
 =?us-ascii?Q?KL094xBiPATmdiVaCtY4AGI0BERTsOsKuAYy/H4DtO5VNvB3hqL+Hko9GOAH?=
 =?us-ascii?Q?iysDMUq3IdkMhUe9zkh/YsrH+fQbAhmPNzNeg7w9lGbFq3OLtUWGV+PKbfKP?=
 =?us-ascii?Q?9nbsBrNdp9/xgezJOdJ3msIa0NGjKhjaaMvt3gO36S2MulAH7xEozl8Hh8I5?=
 =?us-ascii?Q?y7DvwSQygZlPSLqF9i2tHOUxQ+PiLoIGqInj+foY3afVSE8xBxhPZNT5bDEq?=
 =?us-ascii?Q?a6dg4mGsg1L7uBMLXpfxZ34q1+ZvJxM0oSCsmcKSAdAGowOkCZqi0HeBCXXO?=
 =?us-ascii?Q?1t4ZZcvlHbseOgBvnPqZVhFr+axe/z1tycXLtBwTjyttv5D/hZ/E9ny3DhuH?=
 =?us-ascii?Q?BxynFhpc1oBMBKylStgVa0ZgtCSmPUOSLI1/l23kgQB5JMpSMvWspoBpZSG1?=
 =?us-ascii?Q?XNWnPqrzXy5BOg18z3COhSLIC7Z5RY5iohVBHPG5fTjWvadZDshvwpA8P+4Y?=
 =?us-ascii?Q?A94PU51w3/Bsz+zbD33b1v8Nvi+dmY6wp6AxPbBP4pKgzqx5Js/WBbB2hHCp?=
 =?us-ascii?Q?F8AbbpMN3h79gpqYmfJfYT4QSfr7ORsCb2QRoIVMiz9UEd1BsooUok7pSotY?=
 =?us-ascii?Q?WZp0rAuubid2HMlUjNJ6gdYj2lBCa/iSF3nOlWWxUmvAElO3vyz6Zq0pdpxD?=
 =?us-ascii?Q?w1NszCv76Be887Sll/GRcutSHYq7ojbvXIoZrRDmtsAXiNaKa8PemlqiK7Sy?=
 =?us-ascii?Q?KfQZlvPBrsBzomVrOoYPM3xm26EdqaNPKcxBXPxMltk15Bgvv2a91iW5Ybl1?=
 =?us-ascii?Q?DlLSETp9YZ/6/09tm1eGx3HWaryG6UnvN3BUlFAGvKfmiJioUUFbPluYQQ98?=
 =?us-ascii?Q?dONrmOyfR38wibodo1H3jXX9DNgo/6AlKNctfySf1O4KGz+aGWY74jgN2nLV?=
 =?us-ascii?Q?QKneQilY4/K1HMHIKjidSeCMvYeWlw+uU4ovYpeT/OGHlC38pJwOcfV1g5nL?=
 =?us-ascii?Q?BLEqfhBwLM+S/F5FiNFOyTKu5LWKRcC5eldumD6c+QPfelHn94JVu6+N1D48?=
 =?us-ascii?Q?9lYctdVVrzrh8rJyruMdSTVX5gal/r5YuZLcoGnM4VsJaJMeQ+3vRtjJN0cI?=
 =?us-ascii?Q?3kPKeSgE1fEgrPtwoWfK5oPYo9uOnh9xS2SigU/bQUL5H0C9Xwpw2u27VEwL?=
 =?us-ascii?Q?rWMv88nbxRmis4utCkMoSf9aHEHURHWceUxzhktT6elOnT0atb3f7r7Z2aEm?=
 =?us-ascii?Q?MojPsbT9CvBKdxhBhAEXV0fIm85cGHjZmZYDjAJaYxXc36q2rBl+C+7nHoLN?=
 =?us-ascii?Q?2sjNF6P55NMjJluAO/ZfeH1uWp2MJWYe2UcEgaqgr1BreYMMMgohK7gj0b8V?=
 =?us-ascii?Q?b3UQiK0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1BXpsFsYwQQl32YBwFjkUBd+GkPoT7BZ3htd1SkGrmWAcGztrOpgg19rz4r/?=
 =?us-ascii?Q?be8eU1+SUQoriNZlwR3uYDmU/WyCk69XwFHhd8Zy7mq4tQSvm8wQO8tWmBVs?=
 =?us-ascii?Q?cox2PJfdkewJuJr78YisbVHEKI1qDJnn0wMsKrQhnrYdSJ9+/ldwupSUe+Fd?=
 =?us-ascii?Q?+k8TnJYsrwG8uI6dLrmBrIfPSpUEQPKQygyLo4y7p9CyYZspUnj9wOAK2RBh?=
 =?us-ascii?Q?+0x78sgpLeXX1ctW/RECtEyf0bEGAJHnD2FfuljQApM78ZdxKyEV1nQcntpr?=
 =?us-ascii?Q?sovCXr1Z66NHBvlHgNQndhZ5UdXI4y/RA7K3BiyB2GulvpeZNgm6Ux0rYX++?=
 =?us-ascii?Q?hnWa33GohjW64q79FAreD/FWPSA3x5kOpiyJfW1CqvjINhayXeXS/JK2ZCb+?=
 =?us-ascii?Q?9h/b0c+rT2xNa+tSU599B/RJTYL7gkvb+AgFwJNvteIloPnV8BsukQrHKA7T?=
 =?us-ascii?Q?4g1FWjc94Dr73gw5xxcCg2YFhoPNKrFSRDRwgRVUGm/Zezq5/kJz2NGwymsq?=
 =?us-ascii?Q?hDZczkBM5a0qyoWYFp3twN/MzIbuIdWsd+x+Lf2Sl5axLmvBLAFOFXCremBY?=
 =?us-ascii?Q?cFwg0wzc4PCenjAfE9/87G0HI1SVOBCiVODh/02w+M+2A9soslWWWY28RqBu?=
 =?us-ascii?Q?oj8KGWuxfDEZBVvmy+43BOEKMSMTwBKu8aC8/HEfDJHqqL4hMnUVXhZocybc?=
 =?us-ascii?Q?1U+Jk8EJ2S/Hoqjxu02u99JaeLvQkn/V3/51RC5vnmuIbwfm5zklkS2SHszd?=
 =?us-ascii?Q?varDwA3XLdwhGAkD019i9hKCwfUBeC9lfS3Br9vCxHmeIj6102dYmMNfuoEK?=
 =?us-ascii?Q?bUbXvgo4JL/EwUq/PutAbe1/2IMp18/kIErPRaDARAjRPwJn7C5ukNUKJjOf?=
 =?us-ascii?Q?KDYvQ9Foi2A/gZqPnCDMSxs1i53Z2kOmBzRi0Zi4kV5zpk54nKOXePV5u+AT?=
 =?us-ascii?Q?JvTDQhY+//l42jKUs3OVcmxZO1egPm1J0NgojIjHVEiMIetA0N8qNC9DuJTH?=
 =?us-ascii?Q?dYQjyBVGZNbbPRjTTCu8UhovfXd6oINmPpu3mICCMPfjf25i2tlDvoAfM2o4?=
 =?us-ascii?Q?1WD/X+hblebD5Y47j3EsyXOoP5oBeAi7HidwK55SSZNHhsNGYAcXWYH6m53H?=
 =?us-ascii?Q?Sh7wRj+EK0fa4iZ4FkXiVb9m1GzChZxrLQg/0ZaK9dMQun0j/InY8SJMOHIP?=
 =?us-ascii?Q?HovrYgHR/dmAqltDVlCzXwc/Qb0uc8Hsg70/eCRfnpNd2U2yEUQUEJOpb9kc?=
 =?us-ascii?Q?sMuUqs2t5sfp6E+kiipbytajfnyK6aucloG1PDeZOzxYVnmR8H2vs46SmYy9?=
 =?us-ascii?Q?J2CDRC2OmCQGbJiWCuPXAe9io1r01CSg4uZtTa8+Yld2IWZ5QTLH2gO6nCCO?=
 =?us-ascii?Q?fsq/mPiSIWjYMxUjAwcpqubiXw0d+KmhsnNUJTcPiyZdeVo7z+kExIW5stU5?=
 =?us-ascii?Q?wH1+/CcXOkZ6OQ4MPm+uduZLiUsV+MpZQ5jdTo8omYIzaDQSRc4OvyYDfHTD?=
 =?us-ascii?Q?TsDOqiNaTEPDu/w+3s473kHfsSblldE/K4aWWcbQ5LW6yxzitl5bZl8YItrQ?=
 =?us-ascii?Q?Xj3viQlCn002htolLsPfiaOw9DgfuR4OSE4T/ksU?=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 325af20f-e3bf-4099-f1ed-08dd1345e7db
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 02:55:12.0038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4uJ9uthnHZHb3bU6broM3y4blqrEWtd/+3e+2QY6OToMJW0GxkLbKQcMmMCRZvKfwhqE9I9nNmb+K5ioQud7Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6266
X-Proofpoint-GUID: t-rOx1eoIM-RV6G9rkB6qQ3TEMLYDjFZ
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=674e7319 cx=c_pps a=gIIqiywzzXYl0XjYY6oQCA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=MO2eYF9NAAAA:8 a=Q4-j1AaZAAAA:8 a=3-RhneuVAAAA:8 a=t7CeM3EgAAAA:8 a=a_U1oVfrAAAA:8 a=K-fr5HvEsizHaVB1W7IA:9 a=CjuIK1q_8ugA:10 a=sHUU3aQi3S7pi1rnEg8A:9 a=yPGI6Zi_0VQA:10 a=vPYZXhwolhIA:10 a=P0Bp-009Bj7CKDYx-y5u:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=VLVLkjT_5ZicWzSuYqSo:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: t-rOx1eoIM-RV6G9rkB6qQ3TEMLYDjFZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412030023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 02:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114177

--_000_PH0PR11MB561162D4A0452F87BD1D1365ED362PH0PR11MB5611namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The key problem is that the 'ldd' output does not match what the protobuf's=
 pc says. The automatic library dependency adding thus does not give us a c=
orrect result in protobuf's case. As the list is written by protobuf's main=
tainers, I think we'd better trust them more than the ldd output.

Let's look at a regular package's behavior. Say packageB (libB) rdepends on=
 packageA (libA).
And we want to develop an application linking to libB inside SDK. The gener=
ated application will just run fine on target. Because all actual runtime d=
ependencies of libB are on target.

Unfortunately, this is not the case for protobuf and aseil-cpp. Protobuf do=
es NOT have all the runtime dependency it needs. Why they are special? Part=
 of the reason is that they are both kind of development packages, I guess.

Regarding aseil-cpp, as I explained in previous email, its auto splitting i=
s not reasonable.

So I think what we really should do is:
1) split aseil-cpp based on .pc files (parsing its Requires field)
2) parse the protobuf.pc file to get the actual runtime dependencies and ad=
d them to RDEPEDNS automatically.

If anyone has concern for the above solution, please let me know. Thanks.

Before the above is done, we need to use RDEPENDS manually.=20

Regards,
Qi

-----Original Message-----
From: Christian Eggers <ceggers@arri.de>=20
Sent: Monday, December 2, 2024 9:52 PM
To: peter.kjellerstedt@axis.com; Zhao, Yi <Yi.Zhao@windriver.com>; Zhao, Yi=
 <Yi.Zhao@windriver.com>; openembedded-devel@lists.openembedded.org; Marko,=
 Peter <Peter.Marko@siemens.com>
Cc: openembedded-devel@lists.openembedded.org; Chen, Qi <Qi.Chen@windriver.=
com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS

Hi Peter,

On Monday, 2 December 2024, 14:48:43 CET, Marko, Peter wrote:
> Hello,
>=20
> > -----Original Message-----
> > From: Christian Eggers <ceggers@arri.de>
> > Sent: Monday, December 2, 2024 14:39
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;=20
> > peter.kjellerstedt@axis.com; Yi Zhao <yi.zhao@windriver.com>; Yi=20
> > Zhao <yi.zhao@eng.windriver.com>; openembedded-=20
> > devel@lists.openembedded.org
> > Cc: openembedded-devel@lists.openembedded.org; Qi.Chen@windriver.com
> > Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to=20
> > RDEPENDS
> >=20
> > Hi Qi,
> >=20
> > On Monday, 2 December 2024, 06:35:22 CET, Chen Qi via=20
> > lists.openembedded.org wrote:
> > > Before we rework the abseil-cpp and protobuf recipes, a possible=20
> > > improvement for this patch is that we list the needed libraries in=20
> > > RDEPENDS manually.
> >=20
> > my main concern was (as you already may have guessed) not having the=20
> > full set of absl libraries in my rootfs, as only some of them are=20
> > required.  But I cannot tell which is the best option to achieve=20
> > this.
>=20
> If you want full abseil-cpp in your rootfs, please use IMAGE_INSTALL for =
that.
> Packages should pull only their real dependencies, not something you need=
 for other reasons.
> You use-case seems to be to develop application with abseil-cpp library b=
ut not installing it explicitly.
> SDK images need to install (or depend on) additional packages compared to=
 release images.
sorry, but I meant it the other way around:

"I do not like having the full set of abseil-cpp libraries in my rootfs onl=
y because I use protobuf in my application".

Sorry for the confusion.

regards,
Christian


>=20
> Peter
>=20
> >=20
> > regards,
> > Christian
> >=20
> > >
> > > Regards,
> > > Qi
> > >
> > > On 12/2/24 13:21, Chen Qi via lists.openembedded.org wrote:
> > > > I'll explain in more details what the problem is and why this=20
> > > > patch is correct, given the current status of abseil-cpp recipe.
> > > >
> > > > In protobuf's abseil-cpp.cmake file, there's a hardcoded list of=20
> > > > absl targets used by protobuf:
> > > > https://github.com/protocolbuffers/protobuf/blob/main/cmake/abse
> > > > il-
> > cpp.cmake#L56
> > > >
> > > >
> > > > This value in turn is parsed and used to replace the=20
> > > > @_protobuf_PC_REQUIRES@ in protobuf.pc.cmake.
> > > >
> > > > Here's the generated probobuf.pc file's contents:
> > > > """
> > > > $ cat  ../build/protobuf.pc
> > > > prefix=3D/usr
> > > > exec_prefix=3D/usr
> > > > libdir=3D/usr/lib64
> > > > includedir=3D/usr/include
> > > >
> > > > Name: Protocol Buffers
> > > > Description: Google's Data Interchange Format
> > > > Version: 25.3.0
> > > > Requires: absl_absl_check absl_absl_log absl_algorithm absl_base=20
> > > > absl_bind_front absl_bits absl_btree absl_cleanup absl_cord=20
> > > > absl_core_headers absl_debugging absl_die_if_null=20
> > > > absl_dynamic_annotations absl_flags absl_flat_hash_map=20
> > > > absl_flat_hash_set absl_function_ref absl_hash absl_layout=20
> > > > absl_log_initialize absl_log_severity absl_memory=20
> > > > absl_node_hash_map absl_node_hash_set absl_optional absl_span=20
> > > > absl_status absl_statusor absl_strings absl_synchronization=20
> > > > absl_time absl_type_traits absl_utility absl_variant utf8_range
> > > > Libs: -L${libdir} -lprotobuf
> > > > Cflags: -I${includedir} -DPROTOBUF_USE_DLLS
> > > > Conflicts: protobuf-lite
> > > > """
> > > >
> > > > Let me use "absl_hash" and "absl_absl_log" in the above list as exa=
mples.
> > > >
> > > > """
> > > > $ find ../../../abseil-cpp/20240116.2/packa
> > > > ges-split/ -name "libabsl_hash.so.*"
> > > > ../../../abseil-cpp/20240116.2/packages-split/libabsl-
> > hash/usr/lib64/libabsl_hash.so.2401.0.0
> > > >
> > > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> > dbg/usr/lib64/.debug/libabsl_hash.so.2401.0.0
> > > >
> > > > $ find ../../../abseil-cpp/20240116.2/packa
> > > > ges-split/ -name "libabsl_absl_log.so.*"
> > > > $
> > > > """
> > > >
> > > > See? The current package splitting of abseil-cpp does not match=20
> > > > what protobuf assumes. And I thinks protobuf's assumption is=20
> > > > correct, because there's really a absl_absl_log.pc file generated b=
y abseil-cpp.
> > > >
> > > > And there's the contents and location of absl_absl_log.pc:
> > > > """
> > > > $ cat
> > > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> > dev/usr/lib64/pkgconfig/absl_absl_log.pc
> > > > prefix=3D/usr
> > > > exec_prefix=3D${prefix}
> > > > libdir=3D/usr/lib64
> > > > includedir=3D/usr/include
> > > >
> > > > Name: absl_absl_log
> > > > Description: Abseil absl_log library
> > > > URL: https://abseil.io/
> > > > Version: 20240116
> > > > Requires: absl_log_internal_log_impl =3D 20240116
> > > > Libs: -L${libdir}
> > > > Cflags: -I${includedir} -DNOMINMAX """
> > > >
> > > > And there's the contents for the absl_log_internal_log_impl:
> > > > """
> > > > $ cat ../../../abseil-cpp/20240116.2/packag
> > > > es-split/abseil-cpp-dev/usr/lib64/pkgconfig/absl_log_internal_lo
> > > > g_impl.pc
> > > > prefix=3D/usr
> > > > exec_prefix=3D${prefix}
> > > > libdir=3D/usr/lib64
> > > > includedir=3D/usr/include
> > > >
> > > > Name: absl_log_internal_log_impl
> > > > Description: Abseil log_internal_log_impl library
> > > > URL: https://abseil.io/
> > > > Version: 20240116
> > > > Requires: absl_log_internal_conditions =3D 20240116,=20
> > > > absl_log_internal_message =3D 20240116, absl_log_internal_strip =3D=
=20
> > > > 20240116, absl_absl_vlog_is_on =3D 20240116
> > > > Libs: -L${libdir}
> > > > Cflags: -I${includedir} -DNOMINMAX """
> > > >
> > > > We can then find the absl_log_internal_conditions library:
> > > > """
> > > > $ find ../../../abseil-cpp/20240116.2/packages-split/ -name=20
> > > > "*absl_log_internal_message*"
> > > > ../../../abseil-cpp/20240116.2/packages-split/libabsl-log-intern
> > > > al-
> > message/usr/lib64/libabsl_log_internal_message.so.2401.0.0
> > > >
> > > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> > dev/usr/lib64/libabsl_log_internal_message.so
> > > >
> > > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> > dev/usr/lib64/pkgconfig/absl_log_internal_message.pc
> > > >
> > > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> > dbg/usr/lib64/.debug/libabsl_log_internal_message.so.2401.0.0
> > > >
> > > > """
> > > >
> > > > What does all above mean? It means that abseil-cpp is not=20
> > > > splitted reasonably. This could be proven by the=20
> > > > absl_absl_log.pc file as described above.
> > > >
> > > > So, given the current situation of abseil-cpp, Yi's solution is=20
> > > > correct. Before abseil-cpp is re-splitted according to its pc=20
> > > > files, which then could possibly lead to automatic parsing of=20
> > > > the protobuf.pc file to add extra RDEPENDS automatically in=20
> > > > protobuf recipe, we need to have Yi's solution. And we need to=20
> > > > use RDEEPNDS instead of RRECOMMENDS (see the 'Requires' directive i=
n corresponding .pc files).
> > > >
> > > > Regards,
> > > > Qi
> > > >
> > > > On 10/1/24 20:42, Peter Marko via lists.openembedded.org wrote:
> > > >>> -----Original Message-----
> > > >>> From: openembedded-devel@lists.openembedded.org
> > <openembedded-
> > > >>> devel@lists.openembedded.org> On Behalf Of Peter Kjellerstedt=20
> > > >>> via lists.openembedded.org
> > > >>> Sent: Tuesday, October 1, 2024 14:00
> > > >>> To: Yi Zhao <yi.zhao@windriver.com>; Yi Zhao=20
> > > >>> <yi.zhao@eng.windriver.com>
> > > >>> Cc: openembedded-devel@lists.openembedded.org
> > > >>> Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add=20
> > > >>> abseil-cpp to RDEPENDS
> > > >>>
> > > >>>> -----Original Message-----
> > > >>>> From: Yi Zhao <yi.zhao@windriver.com>
> > > >>>> Sent: den 25 september 2024 04:17
> > > >>>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Yi Zhao
> > > >>> <yi.zhao@eng.windriver.com>
> > > >>>> Cc: openembedded-devel@lists.openembedded.org
> > > >>>> Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add=20
> > > >>>> abseil-cpp to
> > > >>> RDEPENDS
> > > >>>>
> > > >>>> On 9/24/24 03:02, Peter Kjellerstedt wrote:
> > > >>>>>> -----Original Message-----
> > > >>>>>> From: openembedded-devel@lists.openembedded.org
> > <openembedded-
> > > >>> devel@lists.openembedded.org> On Behalf Of Yi Zhao
> > > >>>>>> Sent: den 22 september 2024 09:36
> > > >>>>>> To: openembedded-devel@lists.openembedded.org
> > > >>>>>> Subject: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp=20
> > > >>>>>> to
> > > >>> RDEPENDS
> > > >>>>>> Since commit[1], the libraries of abseil-cpp have been=20
> > > >>>>>> splitted into separate packages. When protobuf is installed=20
> > > >>>>>> into the image, only 48 abseil libraries are installed as=20
> > > >>>>>> runtime dependencies. But the output of 'pkg-config --libs=20
> > > >>>>>> protobuf' lists 66 abseil-cpp libraries are required. Add=20
> > > >>>>>> abseil-cpp to RDEPENDS to ensure that all required=20
> > > >>>>>> abseil-cpp libraries are installed.
> > > >>>>>>
> > > >>>>>> [1] https://git.openembedded.org/meta-
> > > >>>
> > openembedded/commit/?id=3Ddd6421e65eb75c35a904f4b487ba022075035
> > > >>> ecc
> > > >>>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > > >>>>>> ---
> > > >>>>>>    meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb | 2 ++
> > > >>>>>>    1 file changed, 2 insertions(+)
> > > >>>>>>
> > > >>>>>> diff --git=20
> > > >>>>>> a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> > > >>> b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> > > >>>>>> index cc5204de4..354b3213a 100644
> > > >>>>>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> > > >>>>>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> > > >>>>>> @@ -106,6 +106,8 @@ FILES:${PN}-lite =3D=20
> > > >>>>>> "${libdir}/libprotobuf-
> > > >>> lite${SOLIBS}"
> > > >>>>>>    # CMake requires protoc binary to exist in sysroot, even=20
> > > >>>>>> if it has wrong
> > > >>> architecture.
> > > >>>>>>    SYSROOT_DIRS +=3D "${bindir}"
> > > >>>>>>
> > > >>>>>> +RDEPENDS:${PN} =3D "abseil-cpp"
> > > >>>>>> +RDEPENDS:${PN}-lite =3D "abseil-cpp"
> > > >>>>> This defeats the whole purpose of splitting up the abseil=20
> > > >>>>> libraries. What triggered this change? Was it an actual=20
> > > >>>>> runtime error, or were you only looking at the output from=20
> > > >>>>> pkg-config --libs protobuf?
> > > >>>>>
> > > >>>>> Since the .pc files are in the protobuf-dev package, which=20
> > > >>>>> depends on the abseil-cpp-dev package, all abseil libraries=20
> > > >>>>> should be available if you are actually building on target=20
> > > >>>>> or with an SDK.
> > > >>>> Our customer reported this issue. Here is his description:
> > > >>>> The abseil libraries will be included in the SDK, but not on=20
> > > >>>> the target.
> > > >>>> The application is building with SDK. The yocto build is=20
> > > >>>> adding protobuf to the image (no explicit abseil libraries=20
> > > >>>> are added). If an application then are built using the SDK it=20
> > > >>>> can not be executed on target as libraries are missing.
> > > >>> Can we at least change the dependency to a recommendation so=20
> > > >>> that it can be avoided via BAD_RECOMMENDATIONS? Because as it=20
> > > >>> is, it penalizes everyone that use protobuf for the case where=20
> > > >>> one provides an SDK with protobuf.
> > > >>>
> > > >>> My suggestion would be to change it to:
> > > >>>
> > > >>> # Recommend abseil-cpp so that all its libraries are installed=20
> > > >>> in case # protobuf is provided as part of an SDK. Everyone=20
> > > >>> else should add # BAD_RECOMMENDATIONS +=3D "abseil-cpp" to their =
configuration.
> > > >>> RRECOMMENDS:${PN} =3D "abseil-cpp"
> > > >>> RRECOMMENDS:${PN}-lite =3D "abseil-cpp"
> > > >>>
> > > >> I think that's also not the right way to do this.
> > > >> Adding unnecessary stuff to release images to satisfy SDK needs=20
> > > >> is wrong.
> > > >>
> > > >> I also wonder if the problem is not at the SDK level.
> > > >> If you build an sdk, there is explicitly installed package base=20
> > > >> and additional required dependencies of those packages.
> > > >> The dependencies may not be complete and fully usable, only=20
> > > >> their parts sufficient for the explicitly installed stuff is prese=
nt.
> > > >> Are the sdk users assuming that full abseil-cpp is installed=20
> > > >> and thus using also parts not needed for protobuf?
> > > >> The proper solution would be probably to include abseil-cpp=20
> > > >> explicitly in SDK used in that way.
> > > >>
> > > >> Peter
> > > >>
> > > >>>> //Yi
> > > >>>>
> > > >>>>>>    RDEPENDS:${PN}-compiler =3D "${PN}"
> > > >>>>>>    RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
> > > >>>>>>    RDEPENDS:${PN}-ptest =3D "bash
> > > >>> ${@bb.utils.contains('PACKAGECONFIG', 'python',=20
> > > >>> 'python3-protobuf', '', d)}"
> > > >>>>> //Peter
> > > >>> //Peter
> > > >>
> > > >>
> > > >>
> > > >
> > > >
> > > >
> > > >
> > >
> > >
> >=20
> >=20
> >=20
>=20
>=20





--_000_PH0PR11MB561162D4A0452F87BD1D1365ED362PH0PR11MB5611namp_
Content-Disposition: attachment; filename="winmail.dat"
Content-Transfer-Encoding: base64
Content-Type: application/ms-tnef; name="winmail.dat"

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
ACwAAABRAGkALgBDAGgAZQBuAEAAdwBpAG4AZAByAGkAdgBlAHIALgBjAG8AbQAAAB8A5V8BAAAA
NAAAAHMAaQBwADoAcQBpAC4AYwBoAGUAbgBAAHcAaQBuAGQAcgBpAHYAZQByAC4AYwBvAG0AAAAC
AS4MAQAAABAAAAAAu/oLgeR2RZ0DUz2A1d5fHwAaDAEAAAASAAAAQwBoAGUAbgAsACAAUQBpAAAA
AAAfAB8MAQAAACwAAABRAGkALgBDAGgAZQBuAEAAdwBpAG4AZAByAGkAdgBlAHIALgBjAG8AbQAA
AB8AHgwBAAAACgAAAFMATQBUAFAAAAAAAAIBGQwBAAAAYAAAAAAAAACBKx+kvqMQGZ1uAN0BD1QC
AAAAgEMAaABlAG4ALAAgAFEAaQAAAFMATQBUAFAAAABRAGkALgBDAGgAZQBuAEAAdwBpAG4AZABy
AGkAdgBlAHIALgBjAG8AbQAAAB8AAV0BAAAALAAAAFEAaQAuAEMAaABlAG4AQAB3AGkAbgBkAHIA
aQB2AGUAcgAuAGMAbwBtAAAAAgEtDAEAAAAQAAAAALv6C4HkdkWdA1M9gNXeXwsAQDoBAAAAHwAa
AAEAAAASAAAASQBQAE0ALgBOAG8AdABlAAAAAAADAPE/CQQAAAsAQDoBAAAAAwD9P+QEAAACAQsw
AQAAABAAAAB3KpQFE9s6TZYa5TavD5pSAwAXAAEAAABAADkAgNHKxC5F2wFAAAgwq9taxS5F2wEL
ACMAAAAAAAsAKQAAAAAAAwAAgAggBgAAAAAAwAAAAAAAAEYBAAAAMgAAAEUAeABjAGgAYQBuAGcA
ZQBBAHAAcABsAGkAYwBhAHQAaQBvAG4ARgBsAGEAZwBzAAAAAAAgAAAAHwAAgIYDAgAAAAAAwAAA
AAAAAEYBAAAAHgAAAGEAYwBjAGUAcAB0AGwAYQBuAGcAdQBhAGcAZQAAAAAAAQAAABoAAABlAG4A
LQBVAFMALAAgAHoAaAAtAEMATgAAAAAACwAAgAggBgAAAAAAwAAAAAAAAEYAAAAAFIUAAAAAAAAf
AACAE4/yQfSDFEGlhO7bWmsL/wEAAAAWAAAAQwBsAGkAZQBuAHQASQBuAGYAbwAAAAAAAQAAACoA
AABDAGwAaQBlAG4AdAA9AE0AUwBFAHgAYwBoAGEAbgBnAGUAUgBQAEMAAAAAAEgAAIAIIAYAAAAA
AMAAAAAAAABGAQAAACIAAABOAGUAdAB3AG8AcgBrAE0AZQBzAHMAYQBnAGUASQBkAAAAAAAP8loy
v+OZQPHtCN0TRefbAwA2AAAAAAAfADcAAQAAAIYAAABSAEUAOgAgAFsAbwBlAF0AIABbAG0AZQB0
AGEALQBvAGUAXQBbAFAAQQBUAEMASAAgADEALwAyAF0AIABwAHIAbwB0AG8AYgB1AGYAOgAgAGEA
ZABkACAAYQBiAHMAZQBpAGwALQBjAHAAcAAgAHQAbwAgAFIARABFAFAARQBOAEQAUwAAAAAAHwA9
AAEAAAAKAAAAUgBFADoAIAAAAAAAQAAHMCBbt8QuRdsBCwAAgAggBgAAAAAAwAAAAAAAAEYAAAAA
A4UAAAAAAAADAACACCAGAAAAAADAAAAAAAAARgAAAAABhQAAAAAAAB8AcAABAAAAfgAAAFsAbwBl
AF0AIABbAG0AZQB0AGEALQBvAGUAXQBbAFAAQQBUAEMASAAgADEALwAyAF0AIABwAHIAbwB0AG8A
YgB1AGYAOgAgAGEAZABkACAAYQBiAHMAZQBpAGwALQBjAHAAcAAgAHQAbwAgAFIARABFAFAARQBO
AEQAUwAAAAAAAgFxAAEAAAAvAAAAAQHbRHoPF0sAD7AnAk2VJ2a1+CWVuLLSbwEAgACHK4CAAAKs
gIAAAQyAgADVZKAAAgEAgBOP8kH0gxRBpYTu21prC/8BAAAAQAAAAEMAbwBuAHYAZQByAHMAYQB0
AGkAbwBuAFQAcgBlAGUAUABhAHIAZQBuAHQAUgBlAGMAbwByAGQASwBlAHkAAAABAAAALgAAAAAA
AAC2w2LzZJuDQbgbPF+XzeZnAQBetV6GgRfKRol7jqDGoqxOAAR5f6CHAAAAAAsAAIATj/JB9IMU
QaWE7ttaawv/AQAAABwAAABIAGEAcwBRAHUAbwB0AGUAZABUAGUAeAB0AAAAAQAAAAMAgBD/////
AwATEgAAAAAfAEIQAQAAADwAAAA8ADIAMQA2ADgAMQAzADkALgA5AG8ANwA2AFoAZAB2AFEAQwBp
AEAAbgA5AHcANgBzAHcAMQA0AD4AAAADAN4/n04AAB8ANRABAAAAogAAADwAUABIADAAUABSADEA
MQBNAEIANQA2ADEAMQA2ADIARAA0AEEAMAA0ADUAMgBGADgANwBCAEQAMQBEADEAMwA2ADUARQBE
ADMANgAyAEAAUABIADAAUABSADEAMQBNAEIANQA2ADEAMQAuAG4AYQBtAHAAcgBkADEAMQAuAHAA
cgBvAGQALgBvAHUAdABsAG8AbwBrAC4AYwBvAG0APgAAAAAAHwA5EAEAAAB8AQAAPAAyADAAMgA0
ADAAOQAyADIAMAA3ADMANgAxADgALgAxADMANQA5ADcAMAA3AC0AMQAtAHkAaQAuAHoAaABhAG8A
QAB3AGkAbgBkAHIAaQB2AGUAcgAuAGMAbwBtAD4AIAA8ADIANwA0ADYANAA5ADUALgB2AHUAWQBo
AE0AeABMAG8AVABoAEAAbgA5AHcANgBzAHcAMQA0AD4AIAA8AFAAQQA0AFAAUgAxADAATQBCADUA
NwAwADcARgAzAEIAQQA0ADcANQBDADUAQgBGADgAMAA5AEMAMAA4AEQAMwA0AEYARAAzADUAMgBA
AFAAQQA0AFAAUgAxADAATQBCADUANwAwADcALgBFAFUAUgBQAFIARAAxADAALgBQAFIATwBEAC4A
TwBVAFQATABPAE8ASwAuAEMATwBNAD4AIAA8ADIAMQA2ADgAMQAzADkALgA5AG8ANwA2AFoAZAB2
AFEAQwBpAEAAbgA5AHcANgBzAHcAMQA0AD4AAAALAACAE4/yQfSDFEGlhO7bWmsL/wEAAAAoAAAA
SQBzAFEAdQBvAHQAZQBkAFQAZQB4AHQAQwBoAGEAbgBnAGUAZAAAAAEAAAAfAPo/AQAAABIAAABD
AGgAZQBuACwAIABRAGkAAAAAAAIBAIATj/JB9IMUQaWE7ttaawv/AQAAAC4AAABIAGUAYQBkAGUA
cgBCAG8AZAB5AEYAcgBhAGcAbQBlAG4AdABMAGkAcwB0AAAAAAABAAAAwgAAAAEACgAAAAQAAAAI
AAAAFAAAAAAAAAAAAAAA/wQAAAAAAAAUAAAAAAAAAMQGAADTBgAAAAAAABQAAAAAAAAAEgcAACAH
AAAAAAAAFAAAAAAAAAAjCAAANAkAAAAAAAAUAAAAAAAAAJMJAADtDQAAAAAAABQAAAAAAAAAMA4A
AO8iAAAAAAAAFAAAAAAAAAA4IwAAVCUAAAAAAAAUAAAAAAAAACUmAAACJwAAAAAAABQAAAAAAAAA
OicAAP////8AAAAAAAADAC4AAAAAAB8A2T8BAAAAAAIAAFQAaABlACAAawBlAHkAIABwAHIAbwBi
AGwAZQBtACAAaQBzACAAdABoAGEAdAAgAHQAaABlACAAJwBsAGQAZAAnACAAbwB1AHQAcAB1AHQA
IABkAG8AZQBzACAAbgBvAHQAIABtAGEAdABjAGgAIAB3AGgAYQB0ACAAdABoAGUAIABwAHIAbwB0
AG8AYgB1AGYAJwBzACAAcABjACAAcwBhAHkAcwAuACAAVABoAGUAIABhAHUAdABvAG0AYQB0AGkA
YwAgAGwAaQBiAHIAYQByAHkAIABkAGUAcABlAG4AZABlAG4AYwB5ACAAYQBkAGQAaQBuAGcAIAB0
AGgAdQBzACAAZABvAGUAcwAgAG4AbwB0ACAAZwBpAHYAZQAgAHUAcwAgAGEAIABjAG8AcgByAGUA
YwB0ACAAcgBlAHMAdQBsAHQAIABpAG4AIABwAHIAbwB0AG8AYgB1AGYAJwBzACAAYwBhAHMAZQAu
ACAAQQBzACAAdABoAGUAIABsAGkAcwB0ACAAaQBzACAAdwByAGkAdAB0AGUAbgAgAGIAeQAgAHAA
cgBvAHQAbwBiAHUAZgAnAHMAIABtAGEAaQBuAHQAYQBpAG4AZQByAHMALAAgAEkAIAB0AGgAaQBu
AGsAIAB3AGUAJwBkACAAYgBlAHQAdABlAHIAIAB0AAAACwAAgAggBgAAAAAAwAAAAAAAAEYAAAAA
BoUAAAAAAAALAAIAAQAAAAMAJgAAAAAACwArAAAAAAALAAYMAAAAAAIBEDABAAAARgAAAAAAAAC2
w2LzZJuDQbgbPF+XzeZnBwDbsBhIfysvTqUQU8iXXMvwAAAAqZ3WAABetV6GgRfKRol7jqDGoqxO
AAGrvgVUAAAAAAIBEzABAAAAEAAAABdLAA+wJwJNlSdmtfgllbgCARQwAQAAAAwAAACABQAAMDdV
GlQAAAADAFszAQAAAAMAWjYAAAAAAwBoNg0AAAALAPo2AQAAAB8A+D8BAAAAEgAAAEMAaABlAG4A
LAAgAFEAaQAAAAAAHwAiQAEAAAAGAAAARQBYAAAAAAAfACNAAQAAAP4AAAAvAE8APQBFAFgAQwBI
AEEATgBHAEUATABBAEIAUwAvAE8AVQA9AEUAWABDAEgAQQBOAEcARQAgAEEARABNAEkATgBJAFMA
VABSAEEAVABJAFYARQAgAEcAUgBPAFUAUAAgACgARgBZAEQASQBCAE8ASABGADIAMwBTAFAARABM
AFQAKQAvAEMATgA9AFIARQBDAEkAUABJAEUATgBUAFMALwBDAE4APQA3ADMAOQA5ADIARQA2ADMA
QwBGADcANAA0AEIAQgA0ADkANgBEADQANQBCADQAOABFADkARQBEAEEAQQAzADkALQBDAEgARQBO
ACwAIABRAEkAMQAAAAAAHwAkQAEAAAAGAAAARQBYAAAAAAAfACVAAQAAAP4AAAAvAE8APQBFAFgA
QwBIAEEATgBHAEUATABBAEIAUwAvAE8AVQA9AEUAWABDAEgAQQBOAEcARQAgAEEARABNAEkATgBJ
AFMAVABSAEEAVABJAFYARQAgAEcAUgBPAFUAUAAgACgARgBZAEQASQBCAE8ASABGADIAMwBTAFAA
RABMAFQAKQAvAEMATgA9AFIARQBDAEkAUABJAEUATgBUAFMALwBDAE4APQA3ADMAOQA5ADIARQA2
ADMAQwBGADcANAA0AEIAQgA0ADkANgBEADQANQBCADQAOABFADkARQBEAEEAQQAzADkALQBDAEgA
RQBOACwAIABRAEkAMQAAAAAAHwAwQAEAAAASAAAAQwBoAGUAbgAsACAAUQBpAAAAAAAfADFAAQAA
ABIAAABDAGgAZQBuACwAIABRAGkAAAAAAB8AOEABAAAAEgAAAEMAaABlAG4ALAAgAFEAaQAAAAAA
HwA5QAEAAAASAAAAQwBoAGUAbgAsACAAUQBpAAAAAAADAFlAAAAAAAMAWkAAAAAAAwA3UAEAAAAD
AAlZAQAAAB8ACl0BAAAALAAAAFEAaQAuAEMAaABlAG4AQAB3AGkAbgBkAHIAaQB2AGUAcgAuAGMA
bwBtAAAAHwALXQEAAAAsAAAAUQBpAC4AQwBoAGUAbgBAAHcAaQBuAGQAcgBpAHYAZQByAC4AYwBv
AG0AAAACARVdAQAAABIAAAACcyjbja2hGEquTkZEYxQzvgEAAAIBFl0BAAAAEgAAAAJzKNuNraEY
Sq5ORkRjFDO+AQAAAwAAgFDjYwvMnNARvNsAgF/MzgQBAAAAJAAAAEkAbgBkAGUAeABpAG4AZwBF
AHIAcgBvAHIAQwBvAGQAZQAAABsAAAAfAACAUONjC8yc0BG82wCAX8zOBAEAAAAqAAAASQBuAGQA
ZQB4AGkAbgBnAEUAcgByAG8AcgBNAGUAcwBzAGEAZwBlAAAAAAABAAAAcAAAAEkAbgBkAGUAeABp
AG4AZwAgAFAAZQBuAGQAaQBuAGcAIAB3AGgAaQBsAGUAIABCAGkAZwBGAHUAbgBuAGUAbABQAE8A
SQBJAHMAVQBwAFQAbwBEAGEAdABlACAAaQBzACAAZgBhAGwAcwBlAC4AAAALAACAUONjC8yc0BG8
2wCAX8zOBAEAAAAmAAAASQBzAFAAZQByAG0AYQBuAGUAbgB0AEYAYQBpAGwAdQByAGUAAAAAAAAA
AAAfAACAH6TrM6h6LkK+e3nhqY5UswEAAAA4AAAAQwBvAG4AdgBlAHIAcwBhAHQAaQBvAG4ASQBu
AGQAZQB4AFQAcgBhAGMAawBpAG4AZwBFAHgAAAABAAAAuAEAAEkASQA9AFsAQwBJAEQAPQAwAGYA
MAAwADQAYgAxADcALQAyADcAYgAwAC0ANABkADAAMgAtADkANQAyADcALQA2ADYAYgA1AGYAOAAy
ADUAOQA1AGIAOAA7AEkARABYAEgARQBBAEQAPQAwADEARABCADQANAA3AEEAMABGADsASQBEAFgA
QwBPAFUATgBUAD0ANgBdADsAUwBCAE0ASQBEAD0AMgA2ADsAUwAxAD0APAAyADEANgA4ADEAMwA5
AC4AOQBvADcANgBaAGQAdgBRAEMAaQBAAG4AOQB3ADYAcwB3ADEANAA+ADsAUgBUAFAAPQBEAGkA
cgBlAGMAdABDAGgAaQBsAGQAOwBUAEYAUgA9AFQAaAByAGUAYQBkAEYAbwByAGsAaQBuAGcASQBz
AEQAaQBzAGEAYgBsAGUAZAA7AFYAZQByAHMAaQBvAG4APQBWAGUAcgBzAGkAbwBuACAAMQA1AC4A
MgAwACAAKABCAHUAaQBsAGQAIAA4ADIAMAA3AC4AMAApACwAIABTAHQAYQBnAGUAPQBIADEAOwBV
AFAAPQAxADAAOwBEAFAAPQAxAAAAAwAAgAggBgAAAAAAwAAAAAAAAEYAAAAAEIUAAAAAAAALAACA
CCAGAAAAAADAAAAAAAAARgAAAAAOhQAAAAAAAAMAAIAIIAYAAAAAAMAAAAAAAABGAAAAABiFAAAA
AAAACwAAgAggBgAAAAAAwAAAAAAAAEYAAAAAgoUAAAAAAAAfAACACCAGAAAAAADAAAAAAAAARgAA
AADYhQAAAQAAABIAAABJAFAATQAuAE4AbwB0AGUAAAAAAEAAAIAIIAYAAAAAAMAAAAAAAABGAAAA
AL+FAADAYIaGLUXbAQIBAIAIIAYAAAAAAMAAAAAAAABGAQAAADYAAABJAG4AVAByAGEAbgBzAGkA
dABNAGUAcwBzAGEAZwBlAEMAbwByAHIAZQBsAGEAdABvAHIAAAAAAAEAAAAQAAAAMGuU9/H/SEqk
JxcL2/WbcgMADTQAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAALgAAAGEAdQB0AGgAZQBuAHQA
aQBjAGEAdABpAG8AbgAtAHIAZQBzAHUAbAB0AHMAAAAAAAEAAAC+AAAAZABrAGkAbQA9AG4AbwBu
AGUAIAAoAG0AZQBzAHMAYQBnAGUAIABuAG8AdAAgAHMAaQBnAG4AZQBkACkAIABoAGUAYQBkAGUA
cgAuAGQAPQBuAG8AbgBlADsAZABtAGEAcgBjAD0AbgBvAG4AZQAgAGEAYwB0AGkAbwBuAD0AbgBv
AG4AZQAgAGgAZQBhAGQAZQByAC4AZgByAG8AbQA9AHcAaQBuAGQAcgBpAHYAZQByAC4AYwBvAG0A
OwAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAIAAAAHgALQBtAHMALQBoAGEAcwAtAGEAdAB0
AGEAYwBoAAAAAQAAAAIAAAAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAALgAAAHgALQBtAHMA
LQBwAHUAYgBsAGkAYwB0AHIAYQBmAGYAaQBjAHQAeQBwAGUAAAAAAAEAAAAMAAAARQBtAGEAaQBs
AAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAANgAAAHgALQBtAHMALQB0AHIAYQBmAGYAaQBjAHQA
eQBwAGUAZABpAGEAZwBuAG8AcwB0AGkAYwAAAAAAAQAAAEgAAABQAEgAMABQAFIAMQAxAE0AQgA1
ADYAMQAxADoARQBFAF8AfABJAEEAMQBQAFIAMQAxAE0AQgA2ADIANgA2ADoARQBFAF8AAAAfAACA
hgMCAAAAAADAAAAAAAAARgEAAABQAAAAeAAtAG0AcwAtAG8AZgBmAGkAYwBlADMANgA1AC0AZgBp
AGwAdABlAHIAaQBuAGcALQBjAG8AcgByAGUAbABhAHQAaQBvAG4ALQBpAGQAAAABAAAASgAAADMA
MgA1AGEAZgAyADAAZgAtAGUAMwBiAGYALQA0ADAAOQA5AC0AZgAxAGUAZAAtADAAOABkAGQAMQAz
ADQANQBlADcAZABiAAAAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAA4AAAAeAAtAG0AcwAtAGUA
eABjAGgAYQBuAGcAZQAtAHMAZQBuAGQAZQByAGEAZABjAGgAZQBjAGsAAAABAAAABAAAADEAAAAf
AACAhgMCAAAAAADAAAAAAAAARgEAAAA6AAAAeAAtAG0AcwAtAGUAeABjAGgAYQBuAGcAZQAtAGEA
bgB0AGkAcwBwAGEAbQAtAHIAZQBsAGEAeQAAAAAAAQAAAAQAAAAwAAAAHwAAgIYDAgAAAAAAwAAA
AAAAAEYBAAAAKgAAAHgALQBtAGkAYwByAG8AcwBvAGYAdAAtAGEAbgB0AGkAcwBwAGEAbQAAAAAA
AQAAAHIAAABCAEMATAA6ADAAOwBBAFIAQQA6ADEAMwAyADMAMAAwADQAMAB8ADEAOAAwADAANwA5
ADkAMAAyADQAfAAzADYANgAwADEANgB8ADMANwA2ADAAMQA0AHwAMwA4ADAANwAwADcAMAAwADAA
MQA4ADsAAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAEQAAAB4AC0AbQBpAGMAcgBvAHMAbwBm
AHQALQBhAG4AdABpAHMAcABhAG0ALQBtAGUAcwBzAGEAZwBlAC0AaQBuAGYAbwAAAAEAAADaCgAA
YwBHADEAaQA5AFcAVAAzAHIAdQBDAGcAaQBTAGUAcQBiAG4AZABTADIATQBkAFQAUwBsAFgAUgBZ
AEcAaQBSAGEAawBNAGYATABXAFgAdQB3AFEAbABhAFAAVQByAEUAWQBKAEQAZABKAEEAcQBhAFEA
bQBLAC8ASwBMADAAOQA0AHgAQgBpAFAAQQBUAG0AZABpAFYAYQBDAHQAWQA0AEEARwBJADAAQgBF
AFIAVABzAE8AcwBLAHUAQQBZAHkALwBIADQARAB0AE8ANQBWAE4AdgBCADMAaABxAEwAKwBIAGsA
bwA5AEcATwBBAEgAaQB5AHMARABNAFUAcQAzAEkAZABrAE0AaABVAGUAOQB6AGsAaAAvAFkAcwBy
AEgAKwBmAFEAYgBBAGgAbQBQAE4AegBOAGUAZwA3AHcAOQBsAEcAYgBGAHEAMwBPAEwAdABVAFcA
RwBWACsAUABLAGIAZgBLAFAAOQBuAGIAcwBCAHIATgBkAHAAOQAvAHgAZwBlAHoASgBPAGQASgAz
AG0AcwBJAGEAMABOAEcAagBLAGgAagBhAGEATQB2AHQAMwBnAE8AMwA2AFMAMgBNAHUAbABBAEgA
NwB4AEUAbwB6AGwAOABIAGgAOABJADUAeQA3AEQAdgB3AFMAUQB5AGcAWgBsAFAAUwBMAHEARgA5
AGkAMgB0AEgATwBVAHgAUQArAFAAaQBMAG8ASQBHAHEASQBuAGoAKwBmAG8AWQAzAGEAZgBWAFMA
RQA4AHgAQgB4AGgAUABaAE4AVAA1AGIARABFAHEAYQA2AGQAZwA0AG0ARwBzAGcAMQBMADcAdQBC
AE0ATABYAHAAZgB4AFoAMwA0AHEAMQArAFoAdgBKAHgATQAwAG8AUwBDAHMAbQBjAEsAUwBBAGQA
QQBHAG8AdwBPAGsAQwBaAHEAaQAwAEgAZQBCAEMAWABYAE8AMQB0ADQAWgBaAGMAdgBsAEgAYgBz
AGUATwBnAEIAdgBuAFAAcQBaAFYAaABGAHIAKwBhAHgAZQAvAHoAMQB0AHkAYwBYAEwAdABCAHcA
VABqAHkAdAB0AHYANQBEAC8AaABaAC8ARQA5AG4AeQAzAEQAaAB1AEgAQgB4AHkAbgBGAGgAcABj
ADEAbwBCAE0AQgBLAHkAbABTAHQAZwBWAGEAMABaAGcAdABDAFMAbQBQAFUATwBTAEwASQAxAC8A
bAAyADMAawBnAFEAQgA1AEoATQBwAFMATQB2AFcAcwBwAG8AQgBwAFoAUwBHADEAWABOAFcAbgBQ
AHEAcgB6AFgAeQA1AEIATwBnADEAOAB6ADMAQwBPAGgAUwBMAEkAQwA3AFoANQBSAFkANQBpAG8A
aABWAEIASABQAEcANQBmAFQAagBXAHYAYQBkAFoARABzAGgAdgB3AHAAQQA4AFAAKwA0AFkAQQA5
ADQAUABVADUAMQB3ADMALwBCAHMAegArAHoAYgBEADMAMwBiADEAdgA4AE4AdgBpACsAZABtAFkA
NgB3AHAANgBBAHgAUABiAEIAUAA0AHAASwBnAHoAcQB4ADUASgBzAC8AVwBCAGIAQgAyAGgASABD
AHAARgA4AEEAYgBiAHAATQBOADMAaAA3ADkAZwBwAHEAWQBtAGYASgBmAFkAVAA0AFEAUwBmAHIA
NwBPAFIAcwBDAGIAMgBRAFIAbwBJAFYATQBpAHoAOQBVAEUAZAAxAEIAcwBvAG8AVQBvAGsANwBw
AFMAbwB0AFkAVwBaAHAAMAByAEEAdQB1AGIAaQBkADIASABNAGwAVQBqAE4ASgA2AGcAZABZAGoA
MgBsAEIAQwBhAC8AaQBTAEYAMwBuAE8AbABXAFcAeABVAG0AdgBBAEUAbABPADMAdgB5AHoANgBa
AHEAMABwAGQAcAB4AEQAdwAxAE4AcwB6AEMAdgA3ADYAQgBlADgAOAA3AFMAbABsAC8ARwBSAGMA
dQB0AFMASABZAHEANwBvAGoAYgB2AFgASQBvAFoAcgBSAEQAbQB0AHMAQQBYAGkATgBhAEsAYQA4
AFAAZQBtAGwAcQBpAEsANwBTAHkASwBmAFEAWgBsAHYAUABCAHIAcwBCAHoAbwBtAFYAcgBPAG8A
WQBQAE0AMwB4AG0AMgA2AEUAZABxAGEATgBQAEsAYwB4AEIAWABQAHgATQBsAHQAawAxADUAQgBn
AHYAdgAyAGEAOQAxAGkAVwA1AFkAYgBsADEARABsAEwAUwBFAFQAcAA5AFkAWgAvADYALwAwADkA
dABtADEAZQBHAHgAMwBIAFcAYQByAHkARwA2AFUAbgB2AE4AMwBCAFUAbABGAEEARwB2AEsAZgBt
AGkASgBpAG8AVQBVAEYAYgBQAGwAdQBZAFEAUQA5ADgAZABPAE4AcgBtAE8AeQBmAFIAMwA4AHcA
aQBiAG8AZABvADEASAAzAGoAWABYADkARABOAGcAbwAvADYAQQBsAEsATgBjAHQAZgB5AFMAZgAx
AE8ANABLAEcAegArAGEARwBXAFkANwA0AGoAZwBOADIAbgBMAFYAUQBLAG4AZQBRAGkAbABZADQA
LwBLADEASABNAEgASQBLAGoAaQBkAFMAZQBDAE0AdgBZAGUAVwBsAHcAKwB1AFUANABvAHYAWQBw
AGUAVAAvAE8ARwBIAGwAQwAzADgAcABKAHcATwBjAGYAVgAxAGcANQBuAEwAQgBMAEUAcQBmAGgA
QgB3AEwATQArAFMALwBGADUARgBpAE4ARgBPAHkAVABLAHUANQBMAFcASwBSAGMAQwA1AGUAbABk
AHUAbQBEADYAYwArAFEAUABmAGUAbABIAG4AOQA0AEoAVgB1ADYAKwBOADEARAA0ADgAOQBsAFkA
YwB0AGQAVgBWAHIAegByAGgAOAByAEoAeQByAHUATQBkAFMAVABWAFgANQBnAGEAbAAvAHIANQBZ
AHUAWgBMAGMAbwBHAG4ATQA0AFYAcwBKAGEASgBNAGUAUQArADMAdgBSAHQAagBKAE4AMABjAEkA
MwBrAFAASwBlAFMAZwBFADEAZgBFAGcAcgBQAHQAdwBvAFcAZgBLADUAbwBQAFkAbwA5AHUATwBu
AGgAOQB4AFMAMgBTAGkAZwBVAC8AYgBRAFUATAA1AEgAMABDADkAWAB3AHAAdwAyAHUAMgA3AFYA
RQB3AEwAcgBXAE0AdgA4ADgAbgBiAHgAUgBtAGkAcwA0AHUAdABDAGsATQBvAFMAZgA5AGEASABF
AEgAVQBSAEgAVwBjAGUAVQB4AHoAaABrAHQAVAA2AGUAbABPAG4AVAAwAGEAdABiADMAZgA3AHIA
NwBaADIAYQBFAG0ATQBvAGoAUABzAGIAVAA5AEMAdgBCAEsAZAB4AGgAQgBoAEEARQBYAFYAMABm
AEkAbQA4ADUAYwBHAEgAagBaAG0AWgBZAEQAagBBAEoAYQBZAHgAWABjADMANgBxADIAcgBCAGwA
KwBDACsANwBuAEgAbwBMAE4AMgBzAGoATgBGADYAUAA1ADUATgBNAGoASgBsAHUAQQBPAC8AWgBm
AGUASAAxAHUAVwBwADIATQBKAFcAWQBlADIAVQBjAEUAZwBhAHEAZwByADEAQgByAGUAWQBNAE0A
TQBnAG8AaABLADcAZwBqADAAYgA4AFYAYgAzAFUAUQBpAEsAMAA9AAAAAAAfAACAhgMCAAAAAADA
AAAAAAAARgEAAAA4AAAAeAAtAGYAbwByAGUAZgByAG8AbgB0AC0AYQBuAHQAaQBzAHAAYQBtAC0A
cgBlAHAAbwByAHQAAAABAAAAgAEAAEMASQBQADoAMgA1ADUALgAyADUANQAuADIANQA1AC4AMgA1
ADUAOwBDAFQAUgBZADoAOwBMAEEATgBHADoAZQBuADsAUwBDAEwAOgAxADsAUwBSAFYAOgA7AEkA
UABWADoATgBMAEkAOwBTAEYAVgA6AE4AUwBQAE0AOwBIADoAUABIADAAUABSADEAMQBNAEIANQA2
ADEAMQAuAG4AYQBtAHAAcgBkADEAMQAuAHAAcgBvAGQALgBvAHUAdABsAG8AbwBrAC4AYwBvAG0A
OwBQAFQAUgA6ADsAQwBBAFQAOgBOAE8ATgBFADsAUwBGAFMAOgAoADEAMwAyADMAMAAwADQAMAAp
ACgAMQA4ADAAMAA3ADkAOQAwADIANAApACgAMwA2ADYAMAAxADYAKQAoADMANwA2ADAAMQA0ACkA
KAAzADgAMAA3ADAANwAwADAAMAAxADgAKQA7AEQASQBSADoATwBVAFQAOwBTAEYAUAA6ADEAMQAw
ADEAOwAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAFwAAAB4AC0AbQBzAC0AZQB4AGMAaABhAG4A
ZwBlAC0AYQBuAHQAaQBzAHAAYQBtAC0AbQBlAHMAcwBhAGcAZQBkAGEAdABhAC0AYwBoAHUAbgBr
AGMAbwB1AG4AdAAAAAEAAAAEAAAAMQAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAEoAAAB4AC0A
bQBzAC0AZQB4AGMAaABhAG4AZwBlAC0AYQBuAHQAaQBzAHAAYQBtAC0AbQBlAHMAcwBhAGcAZQBk
AGEAdABhAC0AMAAAAAAAAQAAAIIMAAAxAEIAWABwAHMARgBzAFkAdwBRAFEAbAAzADIAWQBCAHcA
RgBqAGsAVQBCAGQAKwBHAGsAUABvAFQANwBCAFoAMwBoAHQAZAAxAFMAawBHAHIAbQBXAEEAYwBH
AHoAdAByAE8AcABnAGcAMQA5AHIAegA0AHIALwBiAGUAOABlAFUAMQArAFMAVQBRAG8AcgBpAE4A
WgBsAHcAUgAzAHUAWQBEAG0AVQAvAFcAeQBDAGsANgA5AFgAdwBGAEgAaABkADgAWgB5ADcAbQBx
ADQAdABRAFMAdgBtADgAdwBRAE8AOAB0AFcAbQBCAFYAcwBjAG8AeAAyAFAASgBmAGQAawBlAHcA
SgB1AEoAcgA3ADgAWQBpAHMAYgBWAEgARQBLAEkAMQBxAEQASgBuAG4AMAB3AE0AcwBLAHIAUQBo
AG4AcgBZAGQAUwBKADkAKwAvAGwAZAB3AHUAcABTAFUAZQArAEYAZAArAGsAOABUAG4ASgBZAHMA
cgB3AEcAOAB1AEkANgBkAEwAcgBtAEIAcgBJAGYAUABTAHAAVQBFAFEAUABLAFEAeQBnAHkATABv
ADQAeQA3AHAAOQBDAHkAWQBaAHMAcABVAG4AagA5AHcATwBBAEsAMgBSAEIAaAArADAAeAA3ADgA
cwBnAHAATABlAFgAWAAxAGMAdABXAC8AUgBFAEMAdABFAHkAZgAwAGIARQBHAEEASgBIAG4ARAAy
AEYAZgB1AGwAagBRAEEAcABNADcAOABaAGQAeABLAHkARQBWADEAbgBRAGMAbgB0AHAAcgBzAG8A
dgBDAFgAcgAxAFoANgA2AE4ASABCAHYAbABIAGcATgBRAG4AZABoAFoANQBVAGQAWABJADQAeQAv
AFIAQQA3AEsAMwBCAGkAeQBCADIARwB1AGwAdgBwAGUAWgBOAGcAbQA2AFUAeAAwAHIAWQBYACsA
KwBoAG4AVwBhADMAMwBHAG8AaABqAFcANgA0AHEANwA5AEYAQQByAGUARAAvAEYAVwBQAFMAQQAz
AHgANQBrAE8AcABpAHkASgBmAFcAMQBDAHEAdgBqAEkATgBoAGEAeQBYAGUAWABTAC8ASgBLADIA
WgBDAGIAKwA5AGgALwBiADAAYwArAHIAVAAyAHgATgBhACsAdABTAFUANQA5ADkAQgAvAFIASgBU
AFkATAA3AGcAawB2AGIAKwBBAGcARgB3AEoATgB2AHQAZQBJAGwAbwBQAG4AVgA4AEIAcwB1AGsA
UQByAEgASwBBADcAVAA0AGcAMQBGAFcAagBjADkANABEAHIANwAzAGcAdwA1AHgAeABjAEMAZwAy
AFkARgBoAG8AUABOAEsAcgBGAFMAUgBEAFIAdwBnAFIAVgBVAEcAbQAvAFoAZQB6AHEANQAvAGsA
SgB6ADIATgBHAHcAeQBtAHMAcQBoAEQAWgBjAHoAawBCAE0ANQBhADAAcQB5AG8AVwBZAEYAcAAz
AHQAdwBOAC8ATQB6AEkAYgB1AEkAZABXAHMAZAArAHgAKwBMAGYAMgBTAGwANQBhAHgATABtAHYA
QgBMAEEARgBPAEYAWABDAHIAZQBtAEIAWQBjAEYAdwBnADAAdwB6AGMANABQAEMAZQBuAGoAQQBm
AEUAOQAvADgANwBHADAASABJADEAUwBWAE8AQgBDAGkAVgBPAEQAaAAvADAAMgB3ACsATQArADIA
QQA5AHMAbwBzAGwAVwBXAFcAWQAyADgAUgBxAEIAdQBvAGoAOABLAEcAVwB1AHgAZgBEAEUAWgBC
AFYAdgBtAHkAKwA0ADMAQgBPAEUASwBNAFMATQBUAHcAQgBLAHUAOABhAEMAOAAvAEgARQBmAEQA
SgBIAHEAcQBMADQAaABNAG4AVQBWAFgAaABaAG8AYwB5AGIAYwAxAFUAKwBKAGsAOABFAEoAMgBT
AC8ASABvAHEAagB4AHUAMAAyAHUAOQA5AEoAYQBlAEwAdgBRAGsAbgAvAFYAMwAvADUAMQBSAEMA
NQB2AG4AbQB1AEkAYgB3AGYAbQA1AHoAawBsAGsAUwAyAFMASABzAHoAZAB2AGEAcgBEAHcAQQAz
AFgATABkAHcAaABHAEEAawBEADAAMQA5AGkAOQBoAEsAQwB3AGYAVQBCAGUAQwA5AGwAZgBTADMA
QgByADkAdgBDAHgASABtAGUASQBqADYAMQAwADIAZABZAG0ATQBOAGYAdQBvAEUASwBiAFUAYgBY
AHYAZwBvADQASgBMAC8ARQB3AFUAcQAvAFAAdQB0AEEAYgBlADEALwAyAEkATQBwADEAOAAvAGsA
SQBFAHIAUABSAGEARABBAFIAQQBqAFIAUAB3AEoAbgA3AEMANQB1AGsATgBVAEsASgBqAE8AZgBL
AEQAWQB2AFEAOQBGAG8AaQAyAEEALwBnAFoAcQBQAG4AQwBEAE0AUwB4AHMAMQBpADUAMwBaADIA
awBPAG0AQgB6AFIAaQAwAFoAaQA0AGsAVgA1AHoAcABrADUANABuAEsATwBYAGUAUABWADUAdQAr
AEEAVABKAHYAVABEAFEAaABZACsALwAvAGwANAAyAGoASwBVAHMAMwBPAFYAYwBtAHgAWgBPADEA
ZQBnAFAAbQAxAEoAMABOAGcAbwBqAEkAagBIAFYARQBpAE0ASQBlAHQAQQAwAE4AOABxAE4AQwA5
AEQAdQBKAFQASABkAFkAUQBqAHkAQgBWAEcAWgBOAGIAYgBQAFIAagBUAFQAQwB1ADgAVQBoAG8A
dgBmAFgAZAA2AG8ASQBOAG0AUABwAHUAMwBtAEkAQwBDAE0AUABmAGoAZgAyADUAaQAyAHQAbABE
AHYAbwBBAGYATQAyAG8ANAAxAFcARAAvAFgAKwBoAGIAbABlAGIARAA1AFkANAA3AGoAMwBFAHMA
eQBYAE8AbwBQADUAbwBCAGUAQQBpADcASABpAGQAdwBLADUANQBTAFMAWgBOAEgAaABzAE4ARwBZ
AEEAYwBYAFcAWQBIADYAbQA1ADMASABTAGgANwB3AFIAagArAEUASwAwAGYAYQA0AGkAWgA0AEYA
awBYAGkAVgBiADkAbQAxAEcAegBDAGgAWgB4AHIATABRAGcALwAwAFoAYQBLADkAZABNAFEAdQBu
ADAAagAvAEkAbgBZADgAUwBKAE0ATwBIAEkAUABIAG8AdgByAFkAZwBIAFIALwBkAG0AQQBxAGwA
dABEAFYAbABDAHoAWAB3AGMALwBRAGIAMAB1AGMAOABIAHMAZwA3ADAALwBlAEMAUgBmAG4AcABO
AGQAMgBVADIAeQBFAFUAUQBVAEUASgBPAHAAYgA5AGsAYwBzAE0AdQBVAHEAcwAyAHQANQBzAGYA
cAA2AEUAKwBrAGkAaQBwAGIAeQB0AGEAagBmAG4AeQBLADYAYQB1AGMAbABvAEcAMQBQAEQAZQBa
AE8AegB4AFkAVgBuAG0AUgA4AEgAMgB2AHMANAA2AFMAbQBZAHkAOQBKADIAQwBEAFIAQwAyAE8A
bQBDAFEARwBiAEoAaQBXAEMAdQBQAFgAQQBlADkAaQBvADEAcgAwADEAQwBTAGcANAB1AFoAdABU
AGEAOAArAFkAbABkADIASQBXAFoANQBRAFQATABIADIAZwBPADYAbgBDAEMATwBmAHMAcQAvAG0A
UABpAFMASQBXAGoAWQBNAHgAVQBqAEEAdwBjAHAAcQB1AGIAaQBYAHcAMABkACsASwBtAGgAcwBu
AE4AVQBKAFQAYwBQAGkAeQBaAGQAZQBWAG8ANwB6ACsAawBFAHgASQBXADUAcwB0AFUANQB3AEgA
MQArAC8AQwBjAFgATwBrAFoANgBPAFEANABNAFAAbQArAHUAZAB1AFoATABpAFUAcwBWACsATQBw
AFoAUQA1AGoAZABUAG8AOABvAG0AWQBJAHoAYQBEAFEAUwBSAGMANABPAHYAeQBZAEQAZgBIAFQA
RABUAHMARABPAHEAaQBOAGEAVABFAFAARAB1AC8AdwArADMAcwA0ADcAMwBrAEgAZgBzAFMAYgBs
AGwAZABFAC8ASwA0AGEAVwBXAGMAYgBRADUATABXADYAeQB4AHoAaQB0AGwANQBiAFoAbAA4AFkA
SQB0AHIAUQBYAGoAMwB2AGkAUQBsAEMAbgAwADAAMgBoAHQAbwBsAEwAcwBQAGYAaQBhAE8AdwA5
AEQAZwBmAHUAUgA0AE8AUwBFADQAVAAvAGsAcwBVAAAAAABmfQ==

--_000_PH0PR11MB561162D4A0452F87BD1D1365ED362PH0PR11MB5611namp_--

