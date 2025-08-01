Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C01FC87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 09:41:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.83910.1754041291980551556
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Aug 2025 02:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0308a0254b=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 57170D2Y3156639
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Aug 2025 09:41:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4888htrypx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 01 Aug 2025 09:41:30 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5719bgbV3416845
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Aug 2025 09:41:30 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4888htrypw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 09:41:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xck2X2VuSNgVE8i5qLtQoTOWxKMy2EyaWS8YN+BGDmwlbWcRtEvm3fgmliNVx3jUCjjm6kvGYEUr+8OStY6UmrTI2FXFlP2xlD2pocx3p7VAi5UTSkkzZX8BVg6b1Eu2HGzFu9nTdjdLqmd/HBeWxELXpyyExR6Dc/u346G7XtI7hAOVFxdWv6TI0AkvRXj4x4+i23qMRMpHxEw3w7+fYEEBizT8kZ0LfDorxjz1IB6neALMxa+D6vekExLiC8eSa9oSLxGzkXNI9UTxWCKAM/RH9uDWcTf0Tg7Chl4d+qDLNUJCESHi5P0vuP64n6JAsPR5qgkUs6RLjQtEYNrMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=erAqbgdLU5LXF7yxX7ipP8NyHkQKSQGmSFad6zzHHWs=;
 b=TsGhMv1PZEBnt5IOv8R9YzatdddJ4J/WRUz/kf9jgWF3paetUy+5YSJyxndtL0Qpb6z7NTwaylXKMNE6qeX4yrDO+O4KWB1M/ogIY/TsBeEWeCKxMU2sgvw3bCQgV8MVfliohFgeZawu1IvJMN14RsyYIfPrE6szYkGIRhj9hZ8hdZ/Km7+cNIdsnr72kZS01t7JCknbp1BrL/pTLw/g2ZcGI7aQhiTyhxpe6yNycVy0qRFRkaiz2oFR6LngxOybDk6LwrMirX7XpCkXlw93P74p3W71+0B0mskMz+yG3hFQ6oxzjSsspmCvxQE9DCcglQFImy/A5flXmwNhnFwpog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB8126.namprd11.prod.outlook.com (2603:10b6:a03:52e::13)
 by DS0PR11MB8081.namprd11.prod.outlook.com (2603:10b6:8:15c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Fri, 1 Aug
 2025 09:41:27 +0000
Received: from BY1PR11MB8126.namprd11.prod.outlook.com
 ([fe80::31a7:d56a:3ac7:8793]) by BY1PR11MB8126.namprd11.prod.outlook.com
 ([fe80::31a7:d56a:3ac7:8793%5]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 09:41:27 +0000
From: "Kumar, Praveen" <Praveen.Kumar@windriver.com>
To: Jeroen Hofstee <jhofstee@victronenergy.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][walnascar[PATCH 1/4] php: sort PACKAGECONFIG
 options
Thread-Topic: [oe][meta-oe][walnascar[PATCH 1/4] php: sort PACKAGECONFIG
 options
Thread-Index: AQHcAU3gXjENT4cVMUaXPnU9XZBWkLRLCBiAgAKDeb0=
Date: Fri, 1 Aug 2025 09:41:27 +0000
Message-ID: 
 <BY1PR11MB812683A8DF1837F7213EFCEDEE26A@BY1PR11MB8126.namprd11.prod.outlook.com>
References: <20250730123111.3858530-1-praveen.kumar@windriver.com>
 <ccd7c43f-835a-4115-bbd9-6fd5a632d88f@victronenergy.com>
In-Reply-To: <ccd7c43f-835a-4115-bbd9-6fd5a632d88f@victronenergy.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-08-01T09:43:46.231Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR11MB8126:EE_|DS0PR11MB8081:EE_
x-ms-office365-filtering-correlation-id: 517241e3-32d8-454b-72c1-08ddd0df9618
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|13003099007|38070700018|8096899003|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?qGQdFvOjARHx5qX8BccubKdYRhDytoNYDD7CbWmfbWjQzA9fAOtwYzQwxDWI?=
 =?us-ascii?Q?2VQOhLXl0KbZ+HQTIeB2cftdwCw4r97oEiggIf77k47gCKdP5jP+az3y2GrP?=
 =?us-ascii?Q?z6WCBx/xXT5aVVhPU8r3whRFRgYnSv5xCdukjfrYvbfS359sM3sYH0ewritJ?=
 =?us-ascii?Q?pzLQ7Ppsf5Q/GwDJdK+KtfRAnOWPQID2VL8elTmSSePmaAsFhly5XzYVkzH6?=
 =?us-ascii?Q?xkMAWTmtHD970FJjvn5WfjnTQLNjfHLx+6PopVXKJy7UIJ2xE0+gyNpv5nbc?=
 =?us-ascii?Q?WoXVYtgu1B/MCfuOeih31o9N5A2DbwIVQ7FnTBsOC8f7L1r4jItRI7bP3+d9?=
 =?us-ascii?Q?aZ53Us4geYukwowg2WU5D8wHCt6qQSaxMQAaAExL/c/ZKLjXRT8y5Zfo5RII?=
 =?us-ascii?Q?og27cO4zZhsTvS4awCSswBTjnmeh7WctSfvg0eqdftqwArPSj3zEFvQ+GwjN?=
 =?us-ascii?Q?/hRxEx0gHMfw3/4jkkMkd1E1P79mOVurDfYZRQ5WxKuS2bBneJFEN90CLrJ9?=
 =?us-ascii?Q?b2SSKay5pCr38i2OXZ2hmi+9VN+vvb89ZTHrnql+CA/yWScxkQDfs3D+2rdC?=
 =?us-ascii?Q?tBVMyQ6qgV3faN1BNkhIC+1ZGg/cO/5yeRQiClEX5rwjPCBv5XO+qqAToJhg?=
 =?us-ascii?Q?rd0BLrNotyKDUQcNQdiwUHKtVS4UQXrOkjZZ8+a2MOwbIk/ySfpttZ7lP7en?=
 =?us-ascii?Q?I0HYhIVnSTbv3Ft/dMkLcugLOZxNTq0EqrE4JJZrOCT58fYMsCqI1D6p2JpH?=
 =?us-ascii?Q?Uthr4t7lhrdONSxekuKeiOd/X+zQrRYLCPVn+IEwUemyftEPTeSwRFXj7qL2?=
 =?us-ascii?Q?hGbf1Nbn3WeXo3i35JRUwIZxFm5sTjvQ3Xn/qGaKk0WJ/hM8C37d9kZg/3XX?=
 =?us-ascii?Q?THyzWhT3YVP7Ms1qHA14I9o8mIrZELoJRElpNL5uVVhVoI1+L7x6/vYTAfaM?=
 =?us-ascii?Q?10XPXToGbw1uWZz9/4BanLQtY6KYNclBI8BO+FbrAIUj+f+3N6w4yA3vzZzM?=
 =?us-ascii?Q?CxnZaUtR3LsBB4zgKx9rebjKolag/fFy5LhYWSvx/UWcol0rVB5nEfIKFs9C?=
 =?us-ascii?Q?mm4LTBeuHl48/9Hvg34htg66YKHH/DNyVcSvKXXNsMk4Xh5FrT8M2/7UqgK+?=
 =?us-ascii?Q?R2IoG0qakqc5ucpSRfH9hPsZsBUuGsdSgNNigCUQ2K0u9dCHjNc7TPsVbGEw?=
 =?us-ascii?Q?triT/+rXnyIXXN9K9g037G63UvbXoZi7gNLIZtBg4wXzmChrGRqokYKFqXsW?=
 =?us-ascii?Q?XVvmnMHD0mP7zatTRf/+u1IqWGRf02xjLvlu27ExISllwhbn4cDgjzAe5Vpc?=
 =?us-ascii?Q?E2Otp4oBtBX37iy61+WYeVv0JKg+3WGcb2o4V0oUEntHh/Kz6RCZ49DyhLJJ?=
 =?us-ascii?Q?Rn0iGHvquU3zmfFkf96j8sDSwtHHDbKKTiLzzhMrxu9At02Xsnp96jxkRwgL?=
 =?us-ascii?Q?wvHHpndGo2VKDY1srroPj0MyK2DrtfD+rkCM7t56DHFF0uKaiNUZNg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB8126.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(13003099007)(38070700018)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?pHLYUR5HSVuv7HJ6yvjhRTwTbRgzh3KHb/TiRKKILtouWxqXUvo8RJm8ssqM?=
 =?us-ascii?Q?dmGkcnNL39Arvkal3CFcblwoA5Gzk7zRv48N3nOIS8X5hBm2fbSJN+MuBwZ8?=
 =?us-ascii?Q?JYM4GLa1AT7u7aAjSesolBCGeSiFHXhOyKPWi1Sf22L/asZyJODYyojG7oPm?=
 =?us-ascii?Q?JoY2GC6X/GGcbPVVElPviZ8XTQy2lcSeuXN/vflmf+QxNZmKSoGnrTtgR02n?=
 =?us-ascii?Q?rVaaLNdoRWF7mieutxiKtvHCbcArFJzzRWZAfp67II5mnOJgrDBmus747rQH?=
 =?us-ascii?Q?XUHKVHqQJdNm/1wBjqL0wcigjNKaQGilSkZ7avb3nvNDXPclIFVhfZry/Vck?=
 =?us-ascii?Q?mejZJNhCbnIyULbDjyxNGxL7RPVxttJ3UtPI4eOckJU6ZXAKROnuGdqtYbBH?=
 =?us-ascii?Q?xzswdfoQcksqEr8tTEC2FWb3+/94CTaK3AlX7zaY9BxUG86sNcQO6KsdzAXp?=
 =?us-ascii?Q?R9eiTIWo4roRmUC+Kq24j9x41aLyr0SQTJ/4N5PyEMeCDsJ2VylDW3MscSeZ?=
 =?us-ascii?Q?GL9iNvuDRNyqRhimr3Yu1cSAHpPGAleXj8xoDXv8MQm4lI8dAk17dwCt/LLQ?=
 =?us-ascii?Q?eRA4v9Yy66hKJ5nW/Uw2m4pI3GujVE1t6QtQuEyQPOhrFiWN3SGP5D44XGjq?=
 =?us-ascii?Q?Y5BzVbQWmcEG1nR8Me06MsQChoZBdh1I57NoMnL+EfKC0jeubhcQinMVOL1i?=
 =?us-ascii?Q?jnVWh+z/LYLAbFtjxHJCmSFrwXChtCPAfgZL02SETHm1/PIkHAur2YFxQxzg?=
 =?us-ascii?Q?MXSdvfH2f5s8C+dLvs0l7+Zouk7Vnlb0URU9cPD6+8X0F34ynp6DRQTijpX3?=
 =?us-ascii?Q?yVA4fxbl9TVtBjZ8i+MpwTNTkRPFptgdKLDL5pFI9J4iciwgNPCJQEIADd/w?=
 =?us-ascii?Q?kTddADGvRBB45HO5nDSK6uZep1TiXFVKk6q4veldrFLcOQV+zHyuUwBEqRWe?=
 =?us-ascii?Q?WoPXVvMCpwZ3D1lo9+cpuGYv2TTz+tFA7IxWU7pb77WIflo6Wei23ZJHwfUE?=
 =?us-ascii?Q?CUkf9FpGGQigOz/ZQDB3HqhYVXdqf06dHIwNLZ6psoxkI5I4e4oKW0tDbSlG?=
 =?us-ascii?Q?06q2ZBUBq3qL9XzGrfoHm2jQ7L+MFlMuOF5wFmCORw3xhWm5cTHveE7TlM3Z?=
 =?us-ascii?Q?PdGJ/lqFdFwPxwzXkpu6HfXm4hYyqw/a7+UNuSEdMlEqSoR4d0KEStTpMZ2l?=
 =?us-ascii?Q?whksrW8hvWqETDe5tc+fT5ZE2j4brXNHNFJ/GCsv4nIsC7fwoGX2UR2d+sX5?=
 =?us-ascii?Q?JIi6YVAPPb6lIceJRcEt84rrsAPnQ2zSLzh+r/F4jsvqnm+y8jlfxXAONMC8?=
 =?us-ascii?Q?TP4EhvZvnH8mvHIAUeD1cflD1sXRVotLGSbbGGcpgNEx+sKxAvfZ3TDX78hG?=
 =?us-ascii?Q?DIgL0/SVOe0iQZSyIm9gjHKRshy+0X7WzGR1200v63ByJV1AqUXhtuK3PppK?=
 =?us-ascii?Q?tiYJGJHQPmIodA7cOmE7NLHSZ2oLU5akUKqhYYLiRHOEglKJCvHbCpfPMxjq?=
 =?us-ascii?Q?90/zEUItbfMIkgtS78xHy5W+23g9JpZ53Y9xVXTJqdVNRZRYlPZ1W3FhCvtR?=
 =?us-ascii?Q?wTtHpimgN97ReYjIPqw0RswLPyS9J7kM9uqtYATHm6X6HC2LjYTHBcmN+Au+?=
 =?us-ascii?Q?RAbN41Gk/aSEZRKlsIf9/p4BcxJdxgtTJgXp5kmVYt78njxc5aUHXgzeZeaD?=
 =?us-ascii?Q?nU0+kw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BY1PR11MB812683A8DF1837F7213EFCEDEE26ABY1PR11MB8126namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB8126.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 517241e3-32d8-454b-72c1-08ddd0df9618
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2025 09:41:27.0784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3r3wESrjyNK85csngIGTJBOm9dhrze1Qfdmt8cNB8XL+WofnDpnHv9VcX2N3p0ZHTVBL1AQgNBRUsVT40p9eu3p4ik9uPUr8JLswTzW2yV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8081
X-Proofpoint-GUID: Eb7oPInnQtbEMy2riptr9w8uxIEIiX_7
X-Proofpoint-ORIG-GUID: le8v8I7YEYMbnajI9XJqw__vS3bn2vmt
X-Authority-Analysis: v=2.4 cv=ZtntK87G c=1 sm=1 tr=0 ts=688c8bca cx=c_pps
 a=b6iQ4nEtd725l5RCOKWvWQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=_EeEMxcBAAAA:8 a=6riKLmWeAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8
 a=wvPkM9v7g1_ikmSEda4A:9 a=CjuIK1q_8ugA:10 a=Xo9UvmsfrAWcVzcI:21
 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=ykqYCi_xeFNNVC5ly69F:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA2OSBTYWx0ZWRfXy3eIEPmE38ro
 CbfJT+QQCl7OIdulyfTPOLoV/rrkSmxQxCsHr0i++hZ4LYdfG1WHqHXUvei4I22UQLZFRXEcHmb
 +U6IcsJy2DeelKDWbwqbE7IJwVTLcZarzVwZN2Z5jDTbY3a/QZhFuUMB8yV1cPNOjxmwupwCjpX
 hjHawzDDVo4L/xR5NM+z2rVhqgYgrbyYF2qLAbhxEPI2eWyOeSaTk0MAiS57jWHFp577FXOMA6J
 Bz5tjNRGfLBUFuT4BMA81p02/Qs8hio/b/ashewhcR+V01U40xiCY/qg78canzlhlmYO89RxYiA
 VIrX55Z9VD/od/nryDw7Kd4kvBIVPZQLjnFo+rU9vdz8ieXLnWpe6wSxdK42meTOu8WU+M2uzjA
 0X0/u2Xg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507310086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Aug 2025 09:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118820

--_000_BY1PR11MB812683A8DF1837F7213EFCEDEE26ABY1PR11MB8126namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Jeroen,

Thanks for the feedback.

I understand this is a cleanup, but we are actively maintaining this branch=
, having the PACKAGECONFIG options sorted makes it easier to manage. It hel=
ps reduce unnecessary diff when we compare the same with the master branch =
or apply future updates.

Keeping this patch would help us avoid conflicts later and make upgrades ea=
sier. Will it be fine to keep this patch for easier upgradation and mainten=
ance?

Please suggest your views on this, can we keep this patch for better alignm=
ent of future upgradation or do I need to resend the v2 of this upgrade wit=
hout this patch.

Thanks,
Praveen
________________________________
From: Jeroen Hofstee <jhofstee@victronenergy.com>
Sent: Thursday, July 31, 2025 12:38 AM
To: Kumar, Praveen <Praveen.Kumar@windriver.com>; openembedded-devel@lists.=
openembedded.org <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][walnascar[PATCH 1/4] php: sort PACKAGECONFIG opt=
ions

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Hi Praveen,

On 7/30/25 14:31, Praveen Kumar wrote:
> [You don't often get email from praveen.kumar@windriver.com. Learn why th=
is is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Jeroen Hofstee <jhofstee@victronenergy.com>
>
> This backports commit bb896f6b6f92 ("php: sort PACKAGECONFIG options"),
> which was missing in 8.4.5 and helps in reducing unnecessary diffs in
> future upgrades.

This isn't missing anything. Cleanups like this are not
supposed to be backported.

With kind regards,

Jeroen


--_000_BY1PR11MB812683A8DF1837F7213EFCEDEE26ABY1PR11MB8126namp_
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
Hi Jeroen,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks for the feedback.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
I understand this is a cleanup, but we are actively maintaining this branch=
, having the PACKAGECONFIG options sorted makes it easier to manage. It hel=
ps reduce unnecessary diff when we compare the same with the master branch =
or apply future updates.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Keeping this patch would help us avoid conflicts later and make upgrades ea=
sier. Will it be fine to keep this patch for easier upgradation and mainten=
ance?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Please suggest your views on this, can we keep this patch for better alignm=
ent of future upgradation or do I need to resend the v2 of this upgrade wit=
hout this patch.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Praveen</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jeroen Hofstee &lt;jh=
ofstee@victronenergy.com&gt;<br>
<b>Sent:</b> Thursday, July 31, 2025 12:38 AM<br>
<b>To:</b> Kumar, Praveen &lt;Praveen.Kumar@windriver.com&gt;; openembedded=
-devel@lists.openembedded.org &lt;openembedded-devel@lists.openembedded.org=
&gt;<br>
<b>Subject:</b> Re: [oe][meta-oe][walnascar[PATCH 1/4] php: sort PACKAGECON=
FIG options</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Hi Praveen,<br>
<br>
On 7/30/25 14:31, Praveen Kumar wrote:<br>
&gt; [You don't often get email from praveen.kumar@windriver.com. Learn why=
 this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
&gt;<br>
&gt; From: Jeroen Hofstee &lt;jhofstee@victronenergy.com&gt;<br>
&gt;<br>
&gt; This backports commit bb896f6b6f92 (&quot;php: sort PACKAGECONFIG opti=
ons&quot;),<br>
&gt; which was missing in 8.4.5 and helps in reducing unnecessary diffs in<=
br>
&gt; future upgrades.<br>
<br>
This isn't missing anything. Cleanups like this are not<br>
supposed to be backported.<br>
<br>
With kind regards,<br>
<br>
Jeroen<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BY1PR11MB812683A8DF1837F7213EFCEDEE26ABY1PR11MB8126namp_--

