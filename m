Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1B4C83F22
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 00:56:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.37949.1752713794574483720
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jul 2025 17:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92939e2101=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56H0PA5x3793395
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 17:56:34 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdvdtj26-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 17:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ak076rqHOnOVC8lI3BweFo9PzhU8bSEcd53N/7QAZvlwDsu8u7iQTVI7xB5qkWI2WTo782/SWu6tGwC4q1MX0JsmpNM8aHC5Eln13bUD1dOLubRS8mQnO7Ag8dZufOrylPkTc+fhWSlZd3HJ/kDIaJwzM+kb+NuicW8AtWtHLcVlS84bUdNSC73v1101pMo0k3Q2cEYnIfu+Md6V4wrBRW5XtkNaQ524ZIVcOrR6XwxEcuTfpfx1sQ958kPztP15YVfhj2HQG6sQ2yUDdcBWb0KxwNjE8j3yMXZs+9/3mD9ojQ4Vam81sgWs5X8llMcqnB6q7VdcuK/Q8AIfKT0+8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aBk9kaSK0Wdo7WIYvlvzwjemFBQKAHfXnin47Rvn08=;
 b=A68q/McLguee9xscPTIiINBuGkz2Y1fcKkiWOuQ8oTlVn8pCh+xVpmTiOKX05XAhvT5DnjmDRWBNU//P1x+HUNsVAsnG+mdyBIbsuUAmQmy9a/2Xw4HI3/TBhPEdGncqB8/Egjba//TqnrEQtAzvpXVqtGn6mhE8Wzf7LkpGooXDRRUDr3ENZJldIkRnY0OBFipI6NavLnzuC6DeDKqQKja6ndw8q4NazArvsmyTLx35CtOCY0nlsiwv/oFEZxugtOTrXxQrejnAw6G2aiuKqxpmHce7Gn7/tQ20bD+ES3ALT9kyczKmnkil+KLCVnXOx0UVtNZcnVvq3ehVb0F60w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by SJ2PR11MB8298.namprd11.prod.outlook.com (2603:10b6:a03:545::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Thu, 17 Jul
 2025 00:56:31 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%3]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 00:56:31 +0000
From: "He, Guocai (CN)" <Guocai.He.CN@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][PATCH] softhsm: correct the SRC_URI
Thread-Topic: [oe][meta-oe][PATCH] softhsm: correct the SRC_URI
Thread-Index: AQHb8VrPOne5Ex9tpUam5ZKZna8Oz7Q1iDQ5
Date: Thu, 17 Jul 2025 00:56:31 +0000
Message-ID: 
 <CO6PR11MB558612A334B3CA1E9D265E72CD51A@CO6PR11MB5586.namprd11.prod.outlook.com>
References: <20250710052328.3399677-1-guocai.he.cn@windriver.com>
 <20250710052328.3399677-2-guocai.he.cn@windriver.com>
In-Reply-To: <20250710052328.3399677-2-guocai.he.cn@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-07-17T00:56:31.000Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5586:EE_|SJ2PR11MB8298:EE_
x-ms-office365-filtering-correlation-id: 18b49b20-f08c-4d02-fc2e-08ddc4ccc532
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|8096899003|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?MvCi7EkQd5NVV80T33TT0QMMzvCwTrpt2dy3AtfDhI9NWqVjOCrX31ruDHPH?=
 =?us-ascii?Q?ua/1zv12KRDM/jhgScV3h071p30TeLuxjh5LapFi08rmCQRRME9+5OSemoTj?=
 =?us-ascii?Q?dzN2Mg60NxppaUxN50cHbnUuUsR9GAlXJvRvzf5LAKiKdNwSnRef/zyv4zD6?=
 =?us-ascii?Q?MRe1aLd3TF55oQenk4sqpurhanIMPxn3WHEbsb/mEiy6woaGCkhBJAFj0PVd?=
 =?us-ascii?Q?6w6nPp3hpK/7P8yZ35raXasw78tbUHmRP5IEiO5Zt7JxbI6xYUKTq6dafpJe?=
 =?us-ascii?Q?09coWdXIJyyWuF7zRKdcBNUub13yd6sXztZVccSRxxJRLdYZfxQLBUevUfxj?=
 =?us-ascii?Q?0BrI5Y9XgKh1xrkvvJ8q8YhXLnfuSP2dVL/NgVYLAdt+UoZPCStEo1bqSvKi?=
 =?us-ascii?Q?roqIzZ67UA9PbhV6KIHZzBhaWV+Iz8FjYfD1ZLuiDZKfIm9c2MihO+IDPk6q?=
 =?us-ascii?Q?ohIhe1yqpe+XG+5sqW3c2A92OjBwc1xWxsRH84IPSBTcZvnIFShPE/+ld8zF?=
 =?us-ascii?Q?kfEzz6H/ZkHfK6v1HSejGlSAKpaiZoEGjsh7RthYkQeVUcVaZa6Jg4U857ri?=
 =?us-ascii?Q?+WQQN7u+fIwKiVNSvqSqQxX6Ggxv/Xsj8QGUzliMenZgEYqDN5HEIM9HsQpM?=
 =?us-ascii?Q?WbJVd3mggg5vCquKnEmvPb5iSBy75MiZt6xFG+Q5bWvc9swxZSDFvweKcrF4?=
 =?us-ascii?Q?ulkdV8EtwKtPc+pJuLeuX6lUlyzCeptavsEd17JehpZ7CFDmV1/GUgfU+Kq4?=
 =?us-ascii?Q?XBFQgE4T0uynjC6HsO+/yCea4R4QTMNnC0bZlQ78b0wa7QAxvso3g5Fht23Z?=
 =?us-ascii?Q?+CaM5G1V6Q25kJs7SJ5WyeInMiBvxef5OutwcvQudlZPlIruKqeLF50WYIDa?=
 =?us-ascii?Q?Cyeli521J1QQw4FxFmthtuYpBFC2tGaSv2YZy3NNvRyKHaYqFRdFnnTC9mW3?=
 =?us-ascii?Q?KOcnu0vaO3RhQLMLOpnXqhcc6vkkWYVZctP5HvF4z/2jg4oDsRnzbJVUIsmY?=
 =?us-ascii?Q?z6R3oSA5NlA/oOO/4CWWeZ7QFc2kJ5J9AHIptlMYi0Yp2PvPItWtwkunO0Mg?=
 =?us-ascii?Q?7JNkfG6VnoozgX8Sr2hM12zOu1TOtRF8NvpzQAPefcjrNbeeBGyGFqXK2ygW?=
 =?us-ascii?Q?Vr/EJ+VL/yYD4KaI8dWt6/M3J3A2nv4qVQDU0WBPsIaqido0NPdvxjhLfnHi?=
 =?us-ascii?Q?OCtvcpOrJJVdU5OCsrXZjcrZzhAlB3TVOrzRwb5eSOuHP2v6QuKM+08m2eGo?=
 =?us-ascii?Q?PtANjnNDnWSygiuoQuFPsNc0CfyKGo8FbnGEKAcQVnjljNY+3kHoUnNMl5CC?=
 =?us-ascii?Q?apG9iUyAP83IIBkTAu+Czt9CFoLdqbVEiFBBQD6fOgGcy0k4u7MoZJdR83em?=
 =?us-ascii?Q?Pu+wWgIyWylgmqs+P7FdLB/v3rK7NAt6FtQMgiNF3DriBAB9gflyEstjI33D?=
 =?us-ascii?Q?kYDdCl8YJms=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(8096899003)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qxX8DYVGt1Zllz7cZY0iTuU4efmIrgK4aJfhKCU0DcNpfYgIcMSw9qmTFiGf?=
 =?us-ascii?Q?Q45YVqL7kU4CQw9n6iQ4qV3WaXhxTsSuuaMmtIn2trFGl5Otk6b1jw4dHOZS?=
 =?us-ascii?Q?2MErYrPmYmfq7ABoN+wt56MIZ1bAvaXt+LUMo66HAKr8FmvyzxUcgRVVmjoq?=
 =?us-ascii?Q?7s8ffoX0YIoq6QsI9Yg9g/inYqsZ5ZUFlL3QkB3d9Cj2x35YqB7bXjr6Recp?=
 =?us-ascii?Q?occN15J/28cKtSYLHR/sTPgYcah2EuCT5LFU8FDWBJ/Qg3yQzNysmbkVEMPd?=
 =?us-ascii?Q?Q16wIvE6SIEHwKiLu5Zeybl1AgPqWp+NKwtZyrU8vqyHsFC1npuq3jGDUXgJ?=
 =?us-ascii?Q?aBDXbAv3PW5WL4PV3lvU+buGIY/aiAlMnBpZ1ZJfgsSGLTNehHJ+cJgR8MHs?=
 =?us-ascii?Q?kH6Q9y6pIGYHz07C6W0C0WvC2yfgnQ0N2hX/TEczNkHRB+I5Y3VFaz221KMo?=
 =?us-ascii?Q?qdREc5hZinOK6PONGc1ecmzlTqxK4tx0/ubSCEpu5sY4A2bTYMImPvV5dEfa?=
 =?us-ascii?Q?gqG5qug7XeuzyvbSonZDtIwmWhC2GM1m9g78rwJQP+tA8MrnIPyMHsEB7CdO?=
 =?us-ascii?Q?97lL5L7Br1hst7bNc9b3Zov4uqf7BF2gGFpnxDp3hdPaRruiE3P/JNURde08?=
 =?us-ascii?Q?W/QacTtL09ovHy1vem+XhibAyLD56tHt7LHU4SzlH0V9KndWem1Vo8czIJ3o?=
 =?us-ascii?Q?HtwHKvoSfv2z+LoFTWoYV8BAbiy8cf4rcUHQMuSdAFsT4QLq1Ix09S232prl?=
 =?us-ascii?Q?sriHUHVGcRyo9fU0OErWXPykIQ7uAC8vacsqvwpcM45kSgzAU3xTH/0Y2LnM?=
 =?us-ascii?Q?Bx+AkvrjvNvXTcZOz12zsOtt6xGSGXYyt2hNU/N1HVZZyMsm+UGXGuK3uPXl?=
 =?us-ascii?Q?OsVBWNlcgwzL6RnQpNvHvDK09JfSzStMKaMuD4d9QPApD6Ubrb96NkJI34aT?=
 =?us-ascii?Q?MHmFyHf9zlgpKY3JlkjZK/fR5Bm4iNpYk6vuC7FdIJp1VOFJ6PaQbafXgwGs?=
 =?us-ascii?Q?47UnARHVwJ0g4/OMIRFbOXkdjCYFr5vqRFWdUhHj/Z0RfRg7vbfFymB+3oTT?=
 =?us-ascii?Q?EQ1fBpirpTWQeeahzji0J8p5G2Sv5uvhf7ODz8mam9sOKWRfAcGpu7A/bz1e?=
 =?us-ascii?Q?f56W8IrruFMR+3hxxQPQ77i59lacO22mrgE/iyDWHXeaWYFQNjWb8T1RvMVf?=
 =?us-ascii?Q?HslNnApGwolEQgK4maUjdjFxjzdM3JJus63eJZvDWaUE974cCvPKRIXxnFha?=
 =?us-ascii?Q?FveYLKK1lOJCevVPv84XRaf6Zc9HQOx69ZZIB80mkOEk251tOUTQd4SG/GW6?=
 =?us-ascii?Q?aHFclYUbn8dmedZJdsiKQBIB214gIz44bBgyxi2qkM8FdL4OKeQ3xe0LFKdN?=
 =?us-ascii?Q?5Dphgmo8hxSUN0WT/7L0Ijv4yxNE32ZG4KCCA5CJENW9mPsW0wHl1CPBwnp9?=
 =?us-ascii?Q?gulT58b/CswxoEc7Z0PLSU6TrZWDTlDXpHJhovhAIvro4UihWUXECtwRmQqS?=
 =?us-ascii?Q?cWPVf0rz3eEB7VLCt8Lp+R7D8rFqj3L3jXimXOI397b5o+XRu1ToJNVr7Rhb?=
 =?us-ascii?Q?IhcjonJ1vGBr/dBvUYX7oQD1UVBmGiuU7pbc8guJ?=
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB558612A334B3CA1E9D265E72CD51ACO6PR11MB5586namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b49b20-f08c-4d02-fc2e-08ddc4ccc532
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 00:56:31.7205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JX/0MD4zOQEyeH4ib3PcMRCJ88X6iUH4my2+imwirnTDDJGsV5GCTaiTSG6Lk7tyx/QGSO88HKCn16g8iCzYAwMplsn2a33tH8AeRIs6IPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8298
X-Proofpoint-ORIG-GUID: 5hWrWMfbTuwka5TOSDqdWXcorES10B2-
X-Authority-Analysis: v=2.4 cv=JbC8rVKV c=1 sm=1 tr=0 ts=68784a42 cx=c_pps
 a=vbHG32UI4TNpVNWtFHfklA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=TUjdwidjAAAA:8 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=qDAKQ4oUvqWMKBxwk2cA:9 a=CjuIK1q_8ugA:10
 a=RMZmC9P98TRZ8CKP:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=XBCfRPmKWXHXM36ql9fg:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5hWrWMfbTuwka5TOSDqdWXcorES10B2-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNyBTYWx0ZWRfX+xhbH0mqhKZb
 HmKWxozm5LiIIHoSoK4rIfqsGqKFXXi0XnAdDWREWP6JH1v6p36QYBnpIFYAg7bAO0yX1boFfcv
 uP+5fH7E8LK6CQ9F9HlxDRnB6MVWZb+C79hooO90SdmIWkYmHFWejRJghCBqrwp7amA0PeO8g/j
 v8RSSAYKwQVYc4jAhs66GaLyBoh8RG7eeh7vU3FSLJ3vXM5ujphTxi0FkIQR95AOiDnNbI3QyjY
 djHYQu+vAc666w4zAKis+5zfYz31QFDtuhAhQYVI1j22DjEUULox0DK4WgyYIbS9mqSM2gIJyX3
 E4FfMg5sTeHeRdSrL24kwlfiV6eQB4Yty8pm6lKqia5dvNE2b5LGRkxNoneuScC11On2qdWMtar
 tiIY3+MD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_05,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 00:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118604

--_000_CO6PR11MB558612A334B3CA1E9D265E72CD51ACO6PR11MB5586namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry, skip this email.
Lack of branch information
Will send this patch again.
________________________________
From: He, Guocai (CN)
Sent: Thursday, July 10, 2025 1:23 PM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe][meta-oe][PATCH] softhsm: correct the SRC_URI

From: Guocai He <guocai.he.cn@windriver.com>

The old SRC_URI is not available.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
https://dist.opendnssec.org/ unable to connect. the tarballs
move to github.com
---
 meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-oe/re=
cipes-security/softhsm/softhsm_2.6.1.bb
index 930bca96ff..12c6947a21 100644
--- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
+++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Def3f77a3507c3d91=
e75b9f2bdaee4210"

 DEPENDS =3D "sqlite3"

-SRC_URI =3D "https://dist.opendnssec.org/source/softhsm-2.6.1.tar.gz \
+SRC_URI =3D "https://github.com/opendnssec/opendnssec/releases/download/2.=
1.14/softhsm-2.6.1.tar.gz \
            file://0001-avoid-unnecessary-check-for-sqlite3-binary.patch \
 "
 SRC_URI[sha256sum] =3D "61249473054bcd1811519ef9a989a880a7bdcc36d317c9c254=
57fc614df475f2"
--
2.34.1


--_000_CO6PR11MB558612A334B3CA1E9D265E72CD51ACO6PR11MB5586namp_
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
Sorry, skip this email.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Lack of branch information</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Will send this patch again.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> He, Guocai (CN)<br>
<b>Sent:</b> Thursday, July 10, 2025 1:23 PM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe][meta-oe][PATCH] softhsm: correct the SRC_URI</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Guocai He &lt;guocai.he.cn@windriver.com&gt;=
<br>
<br>
The old SRC_URI is not available.<br>
<br>
Signed-off-by: Guocai He &lt;guocai.he.cn@windriver.com&gt;<br>
---<br>
<a href=3D"https://dist.opendnssec.org/">https://dist.opendnssec.org/</a> u=
nable to connect. the tarballs
<br>
move to github.com<br>
---<br>
&nbsp;meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-oe/re=
cipes-security/softhsm/softhsm_2.6.1.bb<br>
index 930bca96ff..12c6947a21 100644<br>
--- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb<br>
+++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb<br>
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE;md5=3D=
ef3f77a3507c3d91e75b9f2bdaee4210">file://LICENSE;md5=3Def3f77a3507c3d91e75b=
9f2bdaee4210</a>&quot;<br>
&nbsp;<br>
&nbsp;DEPENDS =3D &quot;sqlite3&quot;<br>
&nbsp;<br>
-SRC_URI =3D &quot;<a href=3D""></a>https://dist.opendnssec.org/source/soft=
hsm-2.6.1.tar.gz \<br>
+SRC_URI =3D &quot;<a href=3D""></a>https://github.com/opendnssec/opendnsse=
c/releases/download/2.1.14/softhsm-2.6.1.tar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-avoid-unnecessary-check-for-sqlite3-binary.patch">
file://0001-avoid-unnecessary-check-for-sqlite3-binary.patch</a> \<br>
&nbsp;&quot;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;61249473054bcd1811519ef9a989a880a7bdcc36=
d317c9c25457fc614df475f2&quot;<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO6PR11MB558612A334B3CA1E9D265E72CD51ACO6PR11MB5586namp_--

