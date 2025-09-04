Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A7ACA1002
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 10:12:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.35665.1756980777399901263
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 03:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CPIe7xoH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1342fb162b=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5848t2a12469879
	for <openembedded-devel@lists.openembedded.org>; Thu, 4 Sep 2025 10:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=V/4UgPsJXJdj2aHBejO02d
	QKCoDovWI9t8TWnigZjao=; b=CPIe7xoH9vrqvN0ccQaKH80WMUcgM1FzLGLAiE
	HsCVCAwOnSojVI70wN/iJdpNyLdMi7PzPhOUwjYzUR8gtnGxVj2iUv/v6FxGtnVZ
	RiXXaqS7TnwDN4V3p0mBmMjr4dIXX1OmG1RzknIKMtmx/jxydyhv63Q+RjwE079W
	OPY+/6N6naZUr4XoMwdmFsZC4tr704BCTH5flUmnNUOgxMW1EPqaqayKCfDR26SQ
	39IrZa+5O3vQ29+HgbYSXSxFVefRldad1JQwE3gCtmOeumJxEH4SM7m1YrDGyOmO
	2dM+H0tWJJdhyppBBanbji3URlXhMC59yNKezTpuH7eDEC+w==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y7p7g1wj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 10:12:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJgseSybTZuRNnvwcK6I0cSCbreUkmgqofd7yUOSCZ65zw4Hjmgt3ohvpnFuNum0RsxBO8mGNXjhouFSfdcnoROD0KRxtfVPK9JAk2VkHHsU74W5blAa/IXuMKlESqUMJV+5XiUIy+yJDgyY8wCGfcv3YJo46o3bKlAhZJ0vCrP0Nu5POkI9r9o9xfZrATyOb5jHUjnW3zojHRwD1Xp9rlsnIsfbpMQ0hDyB8Y15Fmw4FM7HIchFXM+UM1aq7kzz58LB0kvCt8UNI26brKJXXDMfrTX7NcFeeau6wT/raMjm7fYYyAxyum+/Bh2WRPpKv8bz0l4UtxExG6McGJ0mQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/4UgPsJXJdj2aHBejO02dQKCoDovWI9t8TWnigZjao=;
 b=wn+T0nuSoT6kqVOIDC7P8oJHuRexbsvOuU8NsY0G/nX6ln09xy2JdNzIglppqoUhvJtWptazODkNgKMG1A98KdOMNmmIXIDsFk5aouZgTi72fzFDFvDiJr5Yt8QnWub5Gvd8ZVpfaacD8NXHZn1yzk4D4spKuyJn+tFfDjZC5YubD6mDiwGsPz12NREQYWrDcC6yvIYkjVLo29i0CEZ9JX2tYVAhPlnkkSO4b2PL8JFptDoMA8Wmarcm1ujixPEFAvyMinZ6cKy1aCHBjjBGGUcb3SzT9MtDeUzsQI9yp1MflaqCvdtVx6WeREzEP3yNfF8U1E8Md6VN8QQiTBhkLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8705.namprd11.prod.outlook.com (2603:10b6:610:1cc::22)
 by PH0PR11MB5830.namprd11.prod.outlook.com (2603:10b6:510:129::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 10:12:53 +0000
Received: from CH3PR11MB8705.namprd11.prod.outlook.com
 ([fe80::9a8f:c7c4:2450:841b]) by CH3PR11MB8705.namprd11.prod.outlook.com
 ([fe80::9a8f:c7c4:2450:841b%6]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 10:12:53 +0000
From: "Chellam, Divya" <Divya.Chellam@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Chellam, Divya"
	<Divya.Chellam@windriver.com>
Subject: Re: [oe][meta-oe][walnascar][PATCH 1/1] jq: upgrade 1.8.0 -> 1.8.1
Thread-Topic: [oe][meta-oe][walnascar][PATCH 1/1] jq: upgrade 1.8.0 -> 1.8.1
Thread-Index: AQHcG/PkIxUyO0HS8kizW3/G5CCs2bSCzzZ5
Date: Thu, 4 Sep 2025 10:12:52 +0000
Message-ID: 
 <CH3PR11MB870558F01A71C4C2B2CC67C6F400A@CH3PR11MB8705.namprd11.prod.outlook.com>
References: <18617031FACF7C4D.5475@lists.openembedded.org>
In-Reply-To: <18617031FACF7C4D.5475@lists.openembedded.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-09-04T10:09:26.978Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8705:EE_|PH0PR11MB5830:EE_
x-ms-office365-filtering-correlation-id: 4bfc8cdc-07f5-44be-3d36-08ddeb9b9c2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|13003099007|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?OO11629M8BfKubzLj1hOvzaZRCUKw2/mkQBgp6nF1BSNezoVgru+4tNGpFGa?=
 =?us-ascii?Q?smn/4jh49i+udiU88T2O9PEVINRrLIwixlOTJYUWOV9pvaKxAcpVP1E+7fZj?=
 =?us-ascii?Q?VOGOhGdESfhSw8u7UpIM7L6e/joWMqbVYTVU4Nv5326SqVgnMVUfaf02ps9w?=
 =?us-ascii?Q?J1Ds6yVQgutg71gwu7s9Zdcsd5/4yx2iXE73PGe7K7HW5Sw6Bbh5kCUL5DBC?=
 =?us-ascii?Q?fiuCKYLJ4VSL8XbOvDPTbpsNKzP6Uuvwa1r8Lyy9Nc/k+Ka526yL8pmq7dGL?=
 =?us-ascii?Q?W98DL2ST8umKqQWDroAcO5Ch+sEyyeAvgmmqkctYS9ldbdBKb1hqVIIHZ1Od?=
 =?us-ascii?Q?UOrjIkBrI1eVD9uHwSv5HvzMgrL68cinFbRflZI6tXlr102YXKCYdgNT5qGV?=
 =?us-ascii?Q?8/Jju1pWtAfO8TllvcbenePR28k92UpkZS4o7qTmLB41/vQKtFzLwRw52FY0?=
 =?us-ascii?Q?x5NA86rKQ+EO72jGht3suOnaeUdnMQQpU2NcuL7CSi+3o4ufgY7h+j99mTkm?=
 =?us-ascii?Q?9GMqWXLZvlICqUTCuvvQY1DVw2xFIURIoJDqOVPAD55T5YtTYFFSqQD3GBeB?=
 =?us-ascii?Q?FqdbBp08LXxhYh+RsSrdgUOT+gnRe+Fu29pKPxZJ/i5/4OKgc/lb+LhSg9vh?=
 =?us-ascii?Q?4PZKQzCf4DN1qJDJxyaTcts35+CViHniSGLSxDjfId1lQQWOoMsjjy80MwQB?=
 =?us-ascii?Q?2TFgiGV8P4ouSz4ECPWnU0dMzJa/5VwWksZHnJQTfLENDozsdeF0sLy+mhdv?=
 =?us-ascii?Q?rVnL4hVV82mfaijXpFODcHvKXDfWc6v2r51aTSaQp4EktQ0zGnNAJxvkxk1j?=
 =?us-ascii?Q?CGUfTjGPbo3Nf2W3eVX8+fKRyEwfumrnpy6ouIq3c96WB2rV03RZTACZCfGi?=
 =?us-ascii?Q?qvCSZb6nZ+N7LFZjxi3Rv3wiVzXb6TbubqCiU9quiqQUPosUaIkLzGHGQc/g?=
 =?us-ascii?Q?J9xDVYBOdQpYCEXMJCtnABrUhVniazSsp/tgmdGp6j8Z9zuOlCcIuNx5k9yz?=
 =?us-ascii?Q?3auz4VKzOV/nzVPpDQuXIK+Om/52ppYeDExKTKOlbdgkmOSUzFoNVlRr0NVY?=
 =?us-ascii?Q?Wp3XuqnKaTpXq+GOhiEzEGgVlV+D+U2+PDqzrv6tnqmbCHXVyTh9rJsP2Hzd?=
 =?us-ascii?Q?WR2TdnF2p92Tm8tISdtvKsQxdzQFGv1vxeQVxLObHGAK0MJwFQc2PdCSNEND?=
 =?us-ascii?Q?MN8XUhMqCUgaY+scUllQ6G4+3DzvLBci8oItefmCMOHpfmyQif1SQ0M1WSj5?=
 =?us-ascii?Q?WJCN0JXbV09963lB4TODlNdukZywW78QFv/iwmrKLRmW2NISm+sE/HwMgFu8?=
 =?us-ascii?Q?DHGEyaqmOYMae/3uGn1rXa6XUYRZuCe2amep5rQe5a+GtxJRbuv44Ze8pZMH?=
 =?us-ascii?Q?OTcqSeTamjwDr8WeRdXOVPxg2f8BvMbgkEo/uXmyRdzStA87/OOAaqsXXmPr?=
 =?us-ascii?Q?S/Rv+QFqZlo=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8705.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(13003099007)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?wM+vrzRwqh0DybQrYHj5uf0ZpM1ZOwgScpA1xQekiiy5smG/Zv2Vy9QwEaTt?=
 =?us-ascii?Q?lGTuum+zm3wM+jg/kVLC2eiqeLELTUqVzA5ZoAocNPX0WmjGbloyqr8PRF+3?=
 =?us-ascii?Q?rGSQEORoyFVNsTbuGlwMbRDjEabr4itwUsfo3wCBrT7fHrDeFA0u4vXd1jGn?=
 =?us-ascii?Q?8Y6FpeuEJ4j+d5aammcN39DzQmmKl0sBgn/uiLI1XnaivYG4yxBDtCSFZeqJ?=
 =?us-ascii?Q?keOGGQ9OxFk8FB4ybTOUErJL9tvOCU7IJIarhLIOOZh1PaIj/UabNJyxb/9F?=
 =?us-ascii?Q?MOKSNT32a2+wh99nDU3dQO/ZUMOiaprrWC/GuB+7AQMxyo/1nEs3i9ZUpKLF?=
 =?us-ascii?Q?dNLdFI9hnjfD5FmA/qj8ldVj0hSiEDOUjlfybmt+3QYM8o84gpNfq7nNXDAf?=
 =?us-ascii?Q?y+nkK107mNIkJmXMQOeSRM9SvYtGsWMfQwpI3O6Nk6INNnYEtUtf7EzVaVM/?=
 =?us-ascii?Q?Ubm1IW8tMSNkz+kx/VTgCKRS3TS+w6JtjJe4Pua2y0QC3trD4hzkbvVD2TQ4?=
 =?us-ascii?Q?O6784qMEcoZtVe6mptnGcQpxOH06kjHbDb2lN6g05LA0aS0r08hlgK7bXgys?=
 =?us-ascii?Q?/UQUXROH+0oknL3fE9oWGeTlC8plRDl5pKcq/sZKIQ99E8zWvo4kmbi7SN4c?=
 =?us-ascii?Q?yFe3e4fTvHI8rR/wGAJSBie6UuRWYhCroTeFR+5WN8KH1/2HNcp8yoZ63DAR?=
 =?us-ascii?Q?yRTgQufzRLF8+sXngfHb3BZq/g0WwKD9klR0oQkNuz1rG6nZrf0M6c5mu6NH?=
 =?us-ascii?Q?OeFl2C2hcc9QHnkLrPUf3+VeKeVE8nEWoSGY9pfpR58F9Tn7z1CpOe7qQft4?=
 =?us-ascii?Q?dvXdeIGs+SXScR2jbd+m9scg7Lh4bytjEVT/yRzTzXo9fx0mDLuVD8TjV9cn?=
 =?us-ascii?Q?/0qxACYKIUYbH+nNtL8MimTPLTEPGJ0NMIp005h3gzjYHgWZ4smnubI8ZUwG?=
 =?us-ascii?Q?6BYfxI2mgKv9aoYIcxVvcAoKmsqsDi72liGPj0KG6JE5P3xWzljw554eFLsa?=
 =?us-ascii?Q?LvChQBXVAIjiKUGzD+qaVqgKr3TDs4vdlq1uLmiTDC04JOmqCqF9kf1QRLMf?=
 =?us-ascii?Q?8K4bI6jjc3Wh/OCseyROVIXxFDU6/3SFg7XOdSkLUNC+yWD/jYb2Mpf3tPxf?=
 =?us-ascii?Q?IfYcHW1Wsx3D46jct92wQJf4R0iKaGgMY55XwghWaYk3dvYkrEh+AejYJVKb?=
 =?us-ascii?Q?Edcg1bpwrlWZuMlk5MedUL6iKonmdFOadPWU1n4RALbGoKZZCPoPi/ZpwLuJ?=
 =?us-ascii?Q?doz1963r4chks3Iu3SmoUsIWysuGym7KhGA6SveBJ3TDm3T7OTqwyF/QEkzi?=
 =?us-ascii?Q?y/10CI8dTpdL1HfvmR4D4DU41k7aSa9kvCLrXHnGeSS88aEmbdj09hbejBrJ?=
 =?us-ascii?Q?iKKO3UO2RpfbX8WP0UXYe2iYoGgQm0QGuMWeTrcFxMJ2bH1n1VqwLuX0rwXj?=
 =?us-ascii?Q?gkbB7Rbuy36i3PBFMdutKcuKrYPth3uKmHcnOB5oBFOCxzj67RxQukX7D2/S?=
 =?us-ascii?Q?5LTv86c/MFiuuMcBknPiF0q+5J7BDDKdQI68fvdLOCdpccqsknjyoT6mdO1N?=
 =?us-ascii?Q?QUHMw39nMYbOomuVhwyesbdWdMK7pYqJ+aiPgrSR?=
Content-Type: multipart/alternative;
	boundary="_000_CH3PR11MB870558F01A71C4C2B2CC67C6F400ACH3PR11MB8705namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bfc8cdc-07f5-44be-3d36-08ddeb9b9c2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 10:12:52.8751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S1icwuesuaGOlbzL/9GAKupWl27mDH4fdU2nfj4pi7j/qgRarsuw5wxmEgd7m4d8sIwehvNtuG8ViXwxaO15jBln/kWl7hMtJgU2FPBlGlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5830
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDEwMCBTYWx0ZWRfX5Ep1/gteCw5W
 29mAmDznokRwsM4A1n0T1I9DN2eY3jnbf99ZlHAP62uQXCxa4cc8QGVsMLJ5jS0hMYll5hT9OZE
 4wFcFCQOFs0tWQvg9WXsbi4OdalajEmwkbtI/THF8aOrOzBCmn8VTk5hr/gGvbPc9L7zUu0taIr
 kazI/jbKY/fTSi5PnoXR45rNTGtq/ggO3amoablZaNJ4o+NQ8PTDR43YLpv8rL6GmxYVyEYX8Ny
 GOdkFCtJGRJ0JXMmqrLW39t/GyuxMkh0ZjWQMgpJPSmkUCsFgp0AOs/SamT+qyAmUVdhaN0AFne
 TSptcmSJm7+FuAXygvOvj3AWRJvBKW4s+XUnNCSYfwb3o97O7RgkVrnUPRK1sI=
X-Proofpoint-GUID: tp1gPgmGtfMAYknD9NWWMGOWXNg3yVm9
X-Proofpoint-ORIG-GUID: tp1gPgmGtfMAYknD9NWWMGOWXNg3yVm9
X-Authority-Analysis: v=2.4 cv=faOty1QF c=1 sm=1 tr=0 ts=68b96628 cx=c_pps
 a=Uxc0GFoxdPZgc4BcwYY9pA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=hJg87lDkAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=omOdbC7AAAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=w8i9LaHft9cVXBad5M8A:9 a=CjuIK1q_8ugA:10
 a=Hv9WOBXOQAmwYqU2:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=aQNO0PxwaYDquvvsCUJe:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 10:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119278

--_000_CH3PR11MB870558F01A71C4C2B2CC67C6F400ACH3PR11MB8705namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I mistakenly sent the upgradation patch (jg: upgrade 1.8.0 -> 1.8.1) before=
 the ptest error fix (jg: Add tzdata to ptest rdeps). The correct order sho=
uld be the ptest fix first, followed by the upgradation.

Please consider this revised order.

Sorry for the confusion.
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of dchellam via lists.openembedded.org <Divya.Ch=
ellam=3Dwindriver.com@lists.openembedded.org>
Sent: 02 September 2025 15:54
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe][meta-oe][walnascar][PATCH 1/1] jq: upgrade 1.8.0 -> 1.8.1

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Add LICENSE notice of NetBSD's strptime() to COPYING

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 meta-oe/recipes-devtools/jq/{jq_1.8.0.bb =3D> jq_1.8.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/jq/{jq_1.8.0.bb =3D> jq_1.8.1.bb} (90%)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.0.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb
similarity index 90%
rename from meta-oe/recipes-devtools/jq/jq_1.8.0.bb
rename to meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index af35324b5f..8d92f65877 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.0.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -5,14 +5,14 @@ DESCRIPTION =3D "jq is like sed for JSON data, you can us=
e it to slice and \
 HOMEPAGE =3D "https://jqlang.github.io/jq/"
 BUGTRACKER =3D "https://github.com/jqlang/jq/issues"
 SECTION =3D "utils"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D08ffb5ac7e7e6bfc66968b89f01f512=
a"
+LICENSE =3D "MIT & BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcf7fcb0a1def4a7ad62c028f7d0dca4=
7"

 GITHUB_BASE_URI =3D "https://github.com/jqlang/${BPN}/releases/"
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz =
\
     file://run-ptest \
     "
-SRC_URI[sha256sum] =3D "91811577f91d9a6195ff50c2bffec9b72c8429dc05ec3ea022=
fd95c06d2b319c"
+SRC_URI[sha256sum] =3D "2be64e7129cecb11d5906290eba10af694fb9e3e7f9fc208a3=
11dc33ca837eb0"

 inherit autotools github-releases ptest

--
2.40.0


--_000_CH3PR11MB870558F01A71C4C2B2CC67C6F400ACH3PR11MB8705namp_
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
I mistakenly sent the upgradation patch (jg: upgrade 1.8.0 -&gt; 1.8.1) bef=
ore the ptest error fix (jg: Add tzdata to ptest rdeps). The correct order =
should be the ptest fix first, followed by the upgradation.<br>
<br>
Please consider this revised order.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
Sorry for the confusion.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of dchellam via lists.openembedded.org &lt;Divya.Chellam=3Dwindriver.=
com@lists.openembedded.org&gt;<br>
<b>Sent:</b> 02 September 2025 15:54<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe][meta-oe][walnascar][PATCH 1/1] jq: upgrade 1.8.0 -&gt;=
 1.8.1</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Wang Mingyu &lt;wangmy@fujitsu.com&gt;<br>
<br>
License-Update: Add LICENSE notice of NetBSD's strptime() to COPYING<br>
<br>
Signed-off-by: Wang Mingyu &lt;wangmy@fujitsu.com&gt;<br>
Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
Signed-off-by: Divya Chellam &lt;divya.chellam@windriver.com&gt;<br>
---<br>
&nbsp;meta-oe/recipes-devtools/jq/{jq_1.8.0.bb =3D&gt; jq_1.8.1.bb} | 6 +++=
---<br>
&nbsp;1 file changed, 3 insertions(+), 3 deletions(-)<br>
&nbsp;rename meta-oe/recipes-devtools/jq/{jq_1.8.0.bb =3D&gt; jq_1.8.1.bb} =
(90%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.0.bb b/meta-oe/recipes-devt=
ools/jq/jq_1.8.1.bb<br>
similarity index 90%<br>
rename from meta-oe/recipes-devtools/jq/jq_1.8.0.bb<br>
rename to meta-oe/recipes-devtools/jq/jq_1.8.1.bb<br>
index af35324b5f..8d92f65877 100644<br>
--- a/meta-oe/recipes-devtools/jq/jq_1.8.0.bb<br>
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb<br>
@@ -5,14 +5,14 @@ DESCRIPTION =3D &quot;jq is like sed for JSON data, you c=
an use it to slice and \<br>
&nbsp;HOMEPAGE =3D &quot;<a href=3D"https://jqlang.github.io/jq/">https://j=
qlang.github.io/jq/</a>&quot;<br>
&nbsp;BUGTRACKER =3D &quot;<a href=3D"https://github.com/jqlang/jq/issues">=
https://github.com/jqlang/jq/issues</a>&quot;<br>
&nbsp;SECTION =3D &quot;utils&quot;<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://COPYING;md5=3D08ffb5ac7e7e6bf=
c66968b89f01f512a">file://COPYING;md5=3D08ffb5ac7e7e6bfc66968b89f01f512a</a=
>&quot;<br>
+LICENSE =3D &quot;MIT &amp; BSD-2-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://COPYING;md5=3Dcf7fcb0a1def4a7=
ad62c028f7d0dca47">file://COPYING;md5=3Dcf7fcb0a1def4a7ad62c028f7d0dca47</a=
>&quot;<br>
&nbsp;<br>
&nbsp;GITHUB_BASE_URI =3D &quot;<a href=3D"https://github.com/jqlang/${BPN}=
/releases/">https://github.com/jqlang/${BPN}/releases/</a>&quot;<br>
&nbsp;SRC_URI =3D &quot;${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${P=
V}.tar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://run-ptest">file://run-ptest</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
-SRC_URI[sha256sum] =3D &quot;91811577f91d9a6195ff50c2bffec9b72c8429dc05ec3=
ea022fd95c06d2b319c&quot;<br>
+SRC_URI[sha256sum] =3D &quot;2be64e7129cecb11d5906290eba10af694fb9e3e7f9fc=
208a311dc33ca837eb0&quot;<br>
&nbsp;<br>
&nbsp;inherit autotools github-releases ptest<br>
&nbsp;<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CH3PR11MB870558F01A71C4C2B2CC67C6F400ACH3PR11MB8705namp_--

