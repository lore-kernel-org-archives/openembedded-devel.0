Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD75AD58CC7
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 03:10:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9537.1774235448295125366
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 20:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UNHmujYs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7542bbac29=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N2o1Ju1056890
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 03:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=34+KSFhTLCO/GvNSDq9U5iVqaiDzZsCJeQ9QIVjKh9I=; b=UNHmujYsKpLy
	c1Ui/C7h7FeINv3MrwBY1cRs3TQK0F+G0XASgTuvW2/0BzNmsg9Yw6+h4hIjP/cj
	vdydVf0B0Dli4HP45YLzTPXdbFfINtKD7HZ2ITr2vmAPCqkz0De5u0EpMB5Ka+Bj
	VdEU2hABA7MzMWh/IayqiQ4U2+jC0QuP2r2VlZM7g0Ai+Ixv6vEU/sI/KgNv147W
	Mk3BpgcJENHzhZYvzsBiy/RAt1qiIzz7IWgKILQdmMImjQTnwS4rKvwBrvmU0kUd
	+1PMe+JPnTBl4tOmbSzi/54/Hfiw98JjFk7KLFYWt08Oo1SDWyknEpIRExmpOOqh
	VJEUkZpmZg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011060.outbound.protection.outlook.com [52.101.62.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1ja6scut-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 03:10:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0XZamOUV0ZOv1zN7/OpekZr3gCeGTLyoKPngi0gNAS8PODvXVEmgE55z1gHu40qss7j4DVU47fqcA/T9xXn2BCLUQuWFs3IDzf1GIta8CD3xR0ZwcYhBdkc9WM652HIDczgR01enBBRpdZNLvg0N9sypaElQ+R9zMf5TYNHQOx3ALoxLFmGdskF4PoyTN5Mfm0qERATdgrQ3ac7xZYhdtz+w6aZC+opOQyvqPcH/tJRligwAY5odUur+dmu9em5/BNt89VOpE3J/rIt2vCMwyRK/gi13hYn6vDBIxkENOwK4l3KqDO7vZixvwyw7lC29XAAWXzf6h5cnMLhxas4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34+KSFhTLCO/GvNSDq9U5iVqaiDzZsCJeQ9QIVjKh9I=;
 b=iQH9HgUM2F9wUp93BCk9GxNRORrkpo7rKmol+XjHhNApxBK/DeKYaPTCXf1P5+30FJPdch8RO69Lhw2OXJZp1wFbLlLxIo6FktkndK3M2N9WKeQIV8EPs8ZD+YhG2qcn1/CMc84L7DyLZKcHAx2xbRCdvtiw9NdJdJf+it+n92Q3qgIKCnzlcgjnm/zZ8ZAn4I7SipVEu8ii1LV832I+lMUkYbirF6bo4dvVQTFsipY8WPABBUT0jZbuqcTJZ20K2dCV1Gm20EgOnMgv4nbhiLVAj/SOhG7p9qDtI4Y9qlkKaxwR0imLjWo8WShvgdnJUkR6SNmk9ohosxWoKeWuCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by MN6PR11MB8244.namprd11.prod.outlook.com (2603:10b6:208:470::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 03:10:44 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6%4]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 03:10:44 +0000
From: "He, Guocai (CN)" <Guocai.He.CN@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] postgresql: upgrade 14.20 ->
 14.21
Thread-Topic: [oe] [meta-oe][kirkstone][PATCH] postgresql: upgrade 14.20 ->
 14.21
Thread-Index: AQHcuC29JdQCQ7nXo0i5bTMa2R6hcLW7cx71
Date: Mon, 23 Mar 2026 03:10:44 +0000
Message-ID: 
 <CO6PR11MB55867EAF1B2FEA6D74E27BCFCD4BA@CO6PR11MB5586.namprd11.prod.outlook.com>
References: <20260320055212.1821470-1-guocai.he.cn@windriver.com>
In-Reply-To: <20260320055212.1821470-1-guocai.he.cn@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-03-23T03:10:43.892Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5586:EE_|MN6PR11MB8244:EE_
x-ms-office365-filtering-correlation-id: 2eb677ee-0f64-4036-fdba-08de8889c5f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|13003099007|18002099003|22082099003|56012099003|7053199007;
x-microsoft-antispam-message-info: 
 ObRkxUbz334/bMc9cy7LGJSHZyWpBRVgrc8WonwLWQy/tyayXa5DTVwJxmImYdJFciN2+Ukt8IalK7R8+vOwHsjCd3Hr2yoYUOm7R/mobz+0p4mMS50cxkTzPCcr+zDgXBZs4S5oNGki+zf1o9O2SiqmXSGhm2qUf1IAxTMR9SsTtJv5eMbuU/Zraely/2CoaAZr1Q9nA6Tv3sXxlMd+omCDinqxz/EBiMTpGh+QQhs63eF7FeuM6Qe8/mP/R4+xCoaT92wdq3XfOV2FYTHW7qBkxLyFiB/KDCFvGYjDl2ey7STRieppTXUp15mAVcJZKq3aBjvjtiDlpgdRDmVVejvlS60Boka0kEHAuRTrnW0uiGrkAWj24GDAI+EjI/aseg8MHPXdqjDAu/ym2QyYWYFPGcRqNWUU/hTvmzMyoQlGyTuTDk5FxNzWu91oM3FIm3l7lb2G6s1SYUnPUGy2na8fGor1YusJ8MwuC/yQrEmwtBi7QbUNMtq2fspyneWe8fSOYzZYi1DuHzBeg3sHDxX+YF5ORdRXjtsJiunyPbj7tLCIIqTLpNnVnVo+GPn7iKns4fGK/iKyQAIHVtr8zHMXJuVmLG4tlQxMj0iRlfQ8F1NEQHVBZAr/JQC42bW0IJCXDQ+NbtH4qx8vMiP+cWqWIxLQX6dT6/eDWo7pZpmgTYAOZ9G5d81ZJlCC5aXA0y9vIlePlG3J0zsKP5/fBi0ue9ACl71Ojw2B1l5GLW3wAShXENVarDN4XbWnF9d6
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(13003099007)(18002099003)(22082099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?EEzHySd28vBRzEmrf7Lguh+/mFxnoGM81WMBv2ttMzsgMA61fRrygs0EBPwK?=
 =?us-ascii?Q?USZY+E9LlsPNKLPpY9oVNcws51vyFVYtSfNJqOHLnEAaDd9kgymQMNCtP0Gy?=
 =?us-ascii?Q?VpPDlvu2RWij4c5QWFAk1Sst3yrKgLD1j1v6GS1pgIGBjfMu12dJABtfLp4u?=
 =?us-ascii?Q?VojWN1QSsZ8RZwdCBNxJWFRF0LkxpTqUtheDIiAd055brywWkBKhc9gDi/dW?=
 =?us-ascii?Q?adVXf9olH/eVUmQ+2WYbBFuvrRVQ8ICDVdBaYNTeyfn1zUzbIwV+H6jEFTeO?=
 =?us-ascii?Q?qCv3fPWHm0idD3qhBr7cMvN/ocRo89o9qWOmKL4OdS5QjtVBPWb1baHvbj4r?=
 =?us-ascii?Q?wyiDekV95OBrVz0g446YRsqxb4nxJGVRSyarrKebkJdh3I8qrS7cUJCmhqzA?=
 =?us-ascii?Q?8WY4C21b6qsX1gSGqZEggsnQlMyUlTblnlgnAYp2gvpYlDQAvwd3iWhfkhUt?=
 =?us-ascii?Q?eoZdDWY69Awio4opRAh9XkXk6KV0MCzdUstu0ARE3BPjJPuod0LaMrDL0Qz8?=
 =?us-ascii?Q?O7a4MaOA6nX1cWoi7Ov3U/5Y687Ryj0nac+WWCcmVPFcb/V4y5DH6UXDv9vl?=
 =?us-ascii?Q?24NNcs/CXcH6e97CFWnYhXvHmFw0YX1NSziqf7pejtpBiYb0AXHhbeVDvZDq?=
 =?us-ascii?Q?kIYJAO68uFmfLVhJjHspYBVNA0oW61w2TubTM5IVfAclsdbJ6gCqFYpFmx/D?=
 =?us-ascii?Q?9xBetxoCu+vzqKKisC+gjDxSW6kws58Kt5S+8p385VhP4yo4mUKK3nkK/MSC?=
 =?us-ascii?Q?FmV58yQ/YvkfJoFnpm5XJPhG4ulgA846WTeUkjmXD9WijvKHiLW4oVCeAZoG?=
 =?us-ascii?Q?f/MwddOBzpyef6KBIU1QkuYnxClJPj0wHRZ/vok31JSqlGTTwIV5N1NKPmdb?=
 =?us-ascii?Q?GPSlcULPcclE9dq7uouE6eFSE1RIGvp/tVkbMpPpCadfxsVUp28j3R6/Zo6I?=
 =?us-ascii?Q?2kAe/SyMJ4S5T/oCU70WcTI3l+I2oG2sG/us4V2LDxD/ktW7sB3+T9jxrpbx?=
 =?us-ascii?Q?EANQMugp1E4eqV/cyDoVNSwj2aXZDRFrRhkl3lxI26jBDDn5/ryNWlAIxBFP?=
 =?us-ascii?Q?vBisd/88nbAGjE6B0KtRB1eUcKO/mSX4XcoTzWtOOzKFC0/JotLqG2GaezrS?=
 =?us-ascii?Q?Pe3KKKRAvmQ/I2fyl24/vY1lBL9vnD+qV8ogV5JzWWA6FmgMAzrbV9i/tCC+?=
 =?us-ascii?Q?Jv0+KAotGjMncUjilWIoMvXw2wI3EY1F8Y0OZP6mTRwx5y6pQYd89gQKjpJ8?=
 =?us-ascii?Q?wOoeSS8VPdPjzETix4Rs2YIB9tjuU+L5dzGsRorGApnEutRokC2frGfVaQIX?=
 =?us-ascii?Q?DNLJgEpMB5Y2yAh1TAr1EWtqVO1skKjZMNk7iLGwDph3ST23cxNtn9uIcG2n?=
 =?us-ascii?Q?EOTEt27N10yWJJI7RIZeUfO9oNn+c5D720Mv5NtKPhubs3TH8maS02gXSwq/?=
 =?us-ascii?Q?JIqxMWPVFs/A7v3TddfFDcVsqm+h+1XGoTeeBQEihCuMCuBMMZcMikdCi5OF?=
 =?us-ascii?Q?bFOEnQvIwJeUJf3mmlfQb4XpFa42dmdYltXgbCEd4WA2jdWx0SU5yjph1A23?=
 =?us-ascii?Q?4FvVOX1FpA3Dz2FcNc+YsWQ1W5Trj/Q1NmHU6RNBz8p5CteHHa1RK1d1vsHQ?=
 =?us-ascii?Q?ZFR92LJY68KTUIHDFbb2h23NmEMAGld5epaDd7BMQ53oz7AFtc1sy+g1qeIq?=
 =?us-ascii?Q?jZyGBs6lxdyj+qXptkGZpeCp5X/t+hw/mbPyHaEmj/GPriqkeLIkeefzUsTo?=
 =?us-ascii?Q?1NRiqpx62w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	DOT1wcsSVqYurb6E8tHN3cRK/odtYCc3ETajHUb/7WN1EBXW6n3HrvljaIGzm2UQ4S9NUItij/G2g4zJloSuxIBSFgRTtjNEhbCBptD2e5ihXEVycw07EOOsmqd6T8WNVl2VeMVITl2ing3YgiHRuNND8aq+vxUg1ZvoBOIL1M2JQddQMUF7YWoExPpZw4J+5vnhFNUsTeyUSBYs0p1/Z5kRB1dEhKxHXZQDqv/R6P3lVnQpH2isVZ1VXBBEROrrSif4BUjazMJjC0ViTty+Iq0mfoKcyewgPllo1FVz89sPLaC8YUWIlX65EY3iOdWo/9OSbIhDCqouqPzo+3U5DA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb677ee-0f64-4036-fdba-08de8889c5f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 03:10:44.5888
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cdsms6bEzde1TbvDy+9u3dHBrn6+agFGfbOw8nJEyeJ+20/f5KvaUzzs3iFzFwZnlapFCTwY6Py1TGPchD7xUAUFZGoaEnN1ydpGSnR85qQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8244
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDAyMSBTYWx0ZWRfX3PtL0UaCUQpa
 rS/XdRBtDjTNRLruW9EwlKpPLXKTLHe+uq3GNSwQjOtmPFIl8UXfSJy8SbHqZPg7aUJ9+ZkFSmn
 BC1zwkmIxDbOYf14ys/9TjtZ1p+tRXE1iuGcOtyxS7ItWD4qcWtAQnCt9jAtybWIh8cfHLxCECg
 GdF+7rCEe4aoyaJxcMhBUWWdkIqTFp9TiZTKXZ0y390OC9ysYfkDt6mO2GL0rkhkRmoFFY4jQsy
 iYSGozbIhzmXYx6s0PBs61oD7PIc5R2Ybll18yaoqsrdzKrbdckLaU1wNm7fzMLV1EHOitu/Uor
 Z1E18et1agfoJ+f3ZRfS3cI10wG7cQWOQPMErzuRrQcN9jJmMeUDLYTn/h7GhNi4Qx3BMrlKa6l
 EKZVkhtoq7uPQEeyieooAz+cNk5sIx96jNAgzm0tG34raGYUB07XvYekIIyGa3XAL7bgHsJD3to
 PF04DW+En0pGvO7DClA==
X-Authority-Analysis: v=2.4 cv=Q5vfIo2a c=1 sm=1 tr=0 ts=69c0af37 cx=c_pps
 a=VmiGRewH7mEIsprpaxNw0Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=epTmVMiNAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=VdJxyN7lVYxgHUX6UD8A:9 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: TWFZjRMDUAzwAkfiU3CCxFzVZ6neuY6e
X-Proofpoint-GUID: TWFZjRMDUAzwAkfiU3CCxFzVZ6neuY6e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_01,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 03:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125491

I am sorry, Please skip this upgrade email.
The upgrading request had been send several days before by others.

________________________________________
From: He, Guocai (CN)
Sent: Friday, March 20, 2026 1:52 PM
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-oe][kirkstone][PATCH] postgresql: upgrade 14.20 -> 14.2=
1

From: Guocai He <guocai.he.cn@windriver.com>

Beside other bugfixes, it contains fixes for CVE-2026-2003, CVE-2026-2004,
CVE-2026-2005 and CVE-2026-2006.

License-Update: Update copyright year to 2026

Release notes: https://www.postgresql.org/docs/release/14.21/

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 ...0001-configure.ac-bypass-autoconf-2.69-version-check.patch | 2 +-
 .../postgresql/{postgresql_14.20.bb =3D> postgresql_14.21.bb}   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.20.bb =3D> postgresql=
_14.21.bb} (71%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-=
autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/00=
01-configure.ac-bypass-autoconf-2.69-version-check.patch
index 76363cd26d..9da1ace8a8 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autocon=
f-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autocon=
f-2.69-version-check.patch
@@ -18,7 +18,7 @@ index bbbb204..0919d2b 100644
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros

- AC_INIT([PostgreSQL], [14.20], [pgsql-bugs@lists.postgresql.org], [], [ht=
tps://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.21], [pgsql-bugs@lists.postgresql.org], [], [ht=
tps://www.postgresql.org/])

 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf vers=
ion 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.20.bb b/meta-oe/r=
ecipes-dbs/postgresql/postgresql_14.21.bb
similarity index 71%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.20.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.21.bb
index 04d8723f15..ba7a7bb03b 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.20.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.21.bb
@@ -1,6 +1,6 @@
 require postgresql.inc

-LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D08b6032a749e67f6e3de84ea8e466=
933"
+LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D55760ee57ce4e51e4b57f0801ff03=
2dd"

 SRC_URI +=3D "\
    file://not-check-libperl.patch \
@@ -11,7 +11,7 @@ SRC_URI +=3D "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "

-SRC_URI[sha256sum] =3D "7527f10f1640761bc280ad97d105d286d0cf72e54d36d78cf6=
8e5e5f752b646b"
+SRC_URI[sha256sum] =3D "5b30f19347efff32b6e09ed2cdff0b04e9aee913ec9bb7414d=
e2b7c17b17f1f9"

 CVE_CHECK_IGNORE +=3D "\
    CVE-2017-8806 \
--
2.34.1


