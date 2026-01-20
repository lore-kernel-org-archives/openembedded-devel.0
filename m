Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B866D2ECE9
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 14:54:07 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8057.1768920760358668503
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 06:52:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=lJHZjRAv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=2480a5fa71=andreas.schulz2@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K2gLb03198481
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 14:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=S-DKIM-20210427; bh=qLegMbhD3Z4bFDM5
	TMPyx9NX04dOE5rrB2Dgoe/ERCE=; b=lJHZjRAvCMGuOzWgwZzaGUSgnm1gavTW
	aS08iuO9P+bupSpJaVZYEDULwT6QdR0yrMdUAvZ06XEwrQ7dRVvQ/9sQFq5JNagW
	gnOhtaDQn3Vp8Jjl2k6s3OlX6V5EyhGNQOVKZ89TjNMB0oEpg2VFoo2uwY/6wbCo
	geNwJ3n4fJcWy9dqN1DPkXYfpwpRry0i7Qk0ShMt6q25AEwGDkbnnKW8xhTfUnCb
	mZv9xysv/I3glW08TjCi8rWTGhONpVvpZ5PJ8K50aWckN7XBSFEwXg+7HPKc9Yz/
	j7yhMIObzXmQtQsWxCDO0iYu9K8c9CS9URW2o/MfyYg8ZEdj6nx8Hg==
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013019.outbound.protection.outlook.com [52.101.83.19])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4bspw93ecw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 14:43:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYjYzh5MQmUynaq/0RBO1pD9D6WEBy+1NKGIfEwhy1jM/SnmjjrU30jdr4xezIlPHj+lcpYqilX/G7OAht39U3kQId+dUJu5q2hE07pzQIKsUviccRw6wMhxbF7uBx61jFhqGRb0qi5kemk6DdkN+i3U6RbGreIuRRpff+6M4QE7p76pIye1RmV64OhAP5VxvDB/jga//f6jkf1gGofcgch3q6EOz9cDP3u7P52Z+WrwAnHy2gDsDjIKY9mwW1uSj/1O/vEPiHYerS09ZXjpepJOGWh+g2iw2AYZU4zV9PoZVpRMUeN2FDrikYOfWKzNkQ63kgDvy7JMWsc8H1No6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLegMbhD3Z4bFDM5TMPyx9NX04dOE5rrB2Dgoe/ERCE=;
 b=ncAm2gOemr06IQ8u3xFYPgv5ZWe9KLVdYZcdOyP0VvLC0PhcPeUFrBMqgQXDVT94+vgyQ8/GbgKJB7fufW7BkknlyD/9+1uq+5FhG8froNq0lm14uJUbR18w/5rZCou8PJvMzQ47Dag7EjCukX1Ls4v+eaDc+n3FZ3Xt+J4wdsXa6Tku8tmRPZ+vxVt1AVt6HGlw5ohQaevno0dfZy5YCJqa1xLFXR8KZObPjvuedHJjfzjMaITbzVi+dlTvL0iQazjcd33lVsFLCEHW9qoEElu1IOUNkAsgHQRl2UvUHj7A8m4lsMEsD+4KPObUDt0UpkS0UPIj/xEK7tcQLkhJJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=karlstorz.com; dmarc=pass action=none
 header.from=karlstorz.com; dkim=pass header.d=karlstorz.com; arc=none
Received: from DU5PR01MB10487.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:51d::7) by DB9PR01MB9174.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:366::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Tue, 20 Jan
 2026 14:43:37 +0000
Received: from DU5PR01MB10487.eurprd01.prod.exchangelabs.com
 ([fe80::ae47:895c:bbc9:e50a]) by
 DU5PR01MB10487.eurprd01.prod.exchangelabs.com ([fe80::ae47:895c:bbc9:e50a%4])
 with mapi id 15.20.9520.006; Tue, 20 Jan 2026 14:43:37 +0000
From: "Schulz, Andreas - Enabler & Imaging Software"
	<Andreas.Schulz2@karlstorz.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH] tumbler: Split plugins into own packages
Thread-Topic: [meta-xfce][PATCH] tumbler: Split plugins into own packages
Thread-Index: AQHciguhBgB/E3Spkk6/SZfKRwZe/w==
Date: Tue, 20 Jan 2026 14:43:37 +0000
Message-ID: 
 <DU5PR01MB10487AFFDAB6A3314EF419D0CA889A@DU5PR01MB10487.eurprd01.prod.exchangelabs.com>
Accept-Language: de-CH, de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
received-spf: Fail (protection.outlook.com: domain of karlstorz.com does not
 designate 62.134.76.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=62.134.76.232; helo=autodiscover.karlstorz.com;
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
x-ms-traffictypediagnostic: DU5PR01MB10487:EE_|DB9PR01MB9174:EE_
x-ms-office365-filtering-correlation-id: bc4a6ed8-5e71-474e-c2a4-08de58324be5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?m9j7Me7PbCjawarYMksVcnpmxzmXOKXp0lNtamqjhtpM96eyji2DKg/VhwKg?=
 =?us-ascii?Q?kXDZRGm5MnejylOJGn+ZH56peqcYZI9crov/m1kYMP5cr+aKzpwCTFKi+okn?=
 =?us-ascii?Q?EeD/bcWROcRX900lw1jXykW8W/T+1xLR+/hIjo5CngeYMwN+qMsxclMUx3if?=
 =?us-ascii?Q?lDAECpKBlN8FiQp4hA8B4jcROdX4Gxk9HyF2If2FLKVZ/UY8blM16DM9Mi66?=
 =?us-ascii?Q?zF9ksi+Ar+cBtlCH8/cR6YRuCfD9PSARvNM8aXwCbfyodU9a3fr9U5jGGjR/?=
 =?us-ascii?Q?gybH8X57qIhy9vb3eCwgDUWokc51c+yb6D7c4/qmqh7r7TitBBN5d7o/wAlQ?=
 =?us-ascii?Q?Otgy97ffY7BVxgwnzRMjaV264c98DAYgNlhiKwprdjkgSR9zBjTMuca52Xfz?=
 =?us-ascii?Q?lUm/+KA2baQ6oY3xNOHuEKeSwxIf7YaMcfoG716xMS4oydPQ0E3Ap6k58saZ?=
 =?us-ascii?Q?9jkwWl5VH8GU9cE50T0Obyi8sfvufqMiNUdg0dlJsgdxP5J3P086TdcdCntj?=
 =?us-ascii?Q?CU8xtcrevXyU7bh2HmiNWfanASjdoCzOKGwG2Nwp0imNmfuVXBsHA/n0p/L0?=
 =?us-ascii?Q?F4VUGsaMSKLEnHOudAY2IcINFrgcYckKBjlcDvsXW4txLmB41Sp47OyHKwJu?=
 =?us-ascii?Q?MoYj+1DdvjJcJ58BVpus/POP6n31cz3UDHJuLurhakeLQEka9rAhnQWjfliX?=
 =?us-ascii?Q?KQg/W4iYbbGeOAdwReR+JTFdBvsnEccWI9ZHBB9cusA9/x/tjkUBzpmqn9di?=
 =?us-ascii?Q?lmrOg8PrPyMqirYvXR35zvGC12lFmNBAuoGbskehG1+RqIUdj1WV+W4fZHGH?=
 =?us-ascii?Q?UNDy6CYniRhg8NzmxTEhEaJhI7qZuviHgE1J7RXMa25NolveIovN1sjtZfQU?=
 =?us-ascii?Q?dma3nMEMy3xRXl5wsbxNJrOnFtRt7PR2iQuQ3TIUM5xQWkhEa2r8m7pht6es?=
 =?us-ascii?Q?U1QjVjzyX3++QHAcFgFddyMCnOUypzfIMO6ZHhETocMCmpmXYacincL1CIHs?=
 =?us-ascii?Q?z1qiX2I/6aFJ5KHuUZ5/U/v7wbcMHETEIFL4JT/lhSSMOzzhu+sdqgXef73V?=
 =?us-ascii?Q?2eAE4iaFqnFYuGpgUWfxAyrJXR862QmXKd38F36WjCsy2wOfE2tFxKE3Zr7g?=
 =?us-ascii?Q?0JYJsU78zmCQtjz0U67uC2cpJj07hq30r8HdoqoXPu9SJmmMWgHj2XUfCuC3?=
 =?us-ascii?Q?jRrSWIYPiPZ0jfJDkH2OxgOVi1OzZe9/GFOn9E8+BUymIKs1P4v6dUm+W98n?=
 =?us-ascii?Q?NgI8lT4gCWVOZjhlYQNxYuClRhPesN4vlkO9WzmrcX42S1W5D4XNnern9SkR?=
 =?us-ascii?Q?C2qmBz1eSBIx5fVGZRXl7zhzo7BeeXpeBfMKL4bxZdWt6E2pwPjqLziSy/mJ?=
 =?us-ascii?Q?Rg1P4YoxnpCkmFfpUANyF/cO88rIvKi24dRqpUIAdZcSNQ3G8XKtUFKXLKcA?=
 =?us-ascii?Q?0iVONbqJUVMPWjP4nhddX0qTSoTAu8T0Qx5k1jdUIzcPyKkvPVqeTskgVaIe?=
 =?us-ascii?Q?4KLG2J/itfnqjiV6JxsTxq4atpxPmGKvnX2cQ3fLmqDrRR2Iz1L2r/c3DBdz?=
 =?us-ascii?Q?mJU0rFEsXQoS5Q1O1TM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR01MB10487.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?uA/f7uA+E+5PF0nKcr41KEjMYm3gh2wEAl3Ff7pB0Cmlv/y4BuAJarcSJd2d?=
 =?us-ascii?Q?iCzH9/jDCfkY+NSnb/teZNZKSwN+naQuf/2fCua9KnbJPHpTM97KVXzaRyoj?=
 =?us-ascii?Q?sXuuR2Vm79lfiIfjxExiID5S3Ji+S8DATJb4VyuibbiqHSn8V3Ov0GRExboe?=
 =?us-ascii?Q?yTIip4VnmAYtliBbqbo+YIVGcY3VafH+NXaK05126pMlbHCViDUziRNW39O/?=
 =?us-ascii?Q?foKf+dBnxtOxlT2T0s6TaZQsiqZ7gKy/r9r9K+rMxgT73jW9QnxXqQ6BRUHB?=
 =?us-ascii?Q?mWlJvMoFw//kHBVRoZpMnno3ox8mwIw3v95VN8yk6U9JLpRaemP83+zbbYZ2?=
 =?us-ascii?Q?RMRJXYU6D82+/N2ZNxGSPkukfNWZPSCIqpFPI8sY6jUAi2tYPGjLyfxEmICC?=
 =?us-ascii?Q?7J4IIueZF3ZG7UT/PSSsUmHqJbuPvB19GSnprf8tJP2geUElcLlVYBDeqls0?=
 =?us-ascii?Q?hit5MGX8Z+lIPZhyJZU+0Um/luq6umZqLjb+di2GyEf0HyB6FDDr+xU8SD7l?=
 =?us-ascii?Q?WcGx89nEAwROX+8LJymQbyMRX0NUOwPytqynL5q1gsodzzQnt+83eNXTj55X?=
 =?us-ascii?Q?ZsgO74Q8q8U6k8yK7bBqHJORx+dG/C/dd9XtLeLNLPrL4U0dfPPH3dr0KM8X?=
 =?us-ascii?Q?eco7e0yh8oh8Q+xZyvllYd5ruRBsuyJ+tZ1zzQ2eWia1IAJOWQcKIIzD/06j?=
 =?us-ascii?Q?FOivLkFOyZRojKIPOpRlNxxY9aBA1ZI3ZVvbRPgNPTqLG3IUoQubhGEP9Yvf?=
 =?us-ascii?Q?Gj3B+yzW/I4DQRq173KSvEWf0OQAANgOrXHdslfieegD1DXVKq2aNT8uxN/H?=
 =?us-ascii?Q?s5t2iaucoFMDyN6zhprnad4sFn8u6zhs7hfI1uMzChVtPCwcapkQX2Xmngpj?=
 =?us-ascii?Q?KlC1lnoctjcIWJKOz+4KottR+1p/S+5vX5Dhb0Pp265xpLngs5pnzXRrVQuR?=
 =?us-ascii?Q?21EQWFct3x5CnaHKVndRAA7rgTpmiLMFTAunk8z7QTkDST7OuwW0gx+2qYRO?=
 =?us-ascii?Q?URX32HXSPqusPgHeg+xJssWKs0q72TYGJrKbam/aHU21dE5oErOZE4hbkZ35?=
 =?us-ascii?Q?4tp2FBALHV74W5Uo7wkgP9vlg0mmvGsbZUPOHApKp70Sc4TF/7/q1Uf9H8Yj?=
 =?us-ascii?Q?PN251f5Ep5mLfACpNx3TnTAC/NqD00dwD5HPekOscfoUvVZdgOKevzpCVnn4?=
 =?us-ascii?Q?IDUjV63bbg7hCq42FMs6GSgsNHYq+CKUrJ5ZxvXA87/dpTD3v/3vUbOcIYtZ?=
 =?us-ascii?Q?WuY/gCHzCWv83YGwCc3HOsAyEHF9QkXRTJzoBJu9nKtf4QluQXSLrr+zjECq?=
 =?us-ascii?Q?SIYMGyylbFIuEklQrGMC1wb1nxgCctN8XRZ8C0UiU0fDpC4kzfTlBn6Cx3Hz?=
 =?us-ascii?Q?OHN9XEFeUSSbpDsxQH9AqOM6J1tTF2PQR2ra5eOdvFFwHcsofveZPodLKkVt?=
 =?us-ascii?Q?tL/qVoe0c/ua093a9M6WFBWnTq3bmIpN6UyWoYKf4ijhMqsMLPXhZlJPk4Tc?=
 =?us-ascii?Q?13OrAp5VSeF+/S5XpnuiFY6HMhe+u+ygAkPobKVXp6ugScrCJQZ97h5dkqk6?=
 =?us-ascii?Q?CgLiCyTAY0iqZ2qAxIj62SLI+VtwF/oFif1Wjkn0gNKrNHshM4su8GfgoTD0?=
 =?us-ascii?Q?3nW0hgC3moAlLy//i0EGQCw3guzF7fj/5N2rRxChawFfYbpkdDBno7XyOCiy?=
 =?us-ascii?Q?XVuFGM7BseIOyiveJ2gegGeqyvJxDiwwSNoSAEU1Akegp0XCxQDTbTFYpgVv?=
 =?us-ascii?Q?YO/ycZwNo9PcFfvN+CnVQXQatg3ZJ1o=3D?=
X-Microsoft-Antispam-Mailbox-Delivery: 
 ucf:0;jmr:0;auth:0;dest:I;ENG:(910005)(944506478)(944626604)(920097)(425001)(930201)(20251009114)(140003);
X-Microsoft-Antispam-Message-Info: 
 MVHx9v/mRI02x/4wDfH0FDsZeQeYLfGTDhGbpW9wG1Xi57O56QJIkDO+P7tSS1DSH7bDG87ZOvuiN5Ajngix9oygZgaFe4YY7YREfVCAD1tkFPVvLhcxeV7ut1iTZaJPkJ7j1cong3u/UQECEc4PnN5oNmrewKQtZoWclKuzZ3RmSkeUpfbHSc0YLekwxWk/bsBlIxnIcwNYPG4sYNMMOGUMc617Wo3uWR4PE9bLLF3SYjv8PiMxAL/lURv90gtMC/ObB51PA+auEL2uJeYBj4y+O96fiNociFg/YHs1t1gzGficdxDJHpLhVrLWfiKyRKmZjxqiruj57FBgvN8ZAuv7ElmgJn/Ij6yGIQFARMJXA4X3WgRxaXacS0AOauKYE4ieKVtyb/2xrsUzHwQTvBM+y2lKscN7wqkafz1uh8M1FpnVLryDrBTG4KmoCfiAusmFYbR/S5IH7aVeT4s/gKTxLJw2Z5i4EHT5VVGFu4YSxGHOnDde8SxpExYbD4ve6zWTcwgoN2LjfMrsGOaVRKLdFPBme95YAZwp/zjV6N+YeQYTKDipbzSYshBIOuhyh/SrKwtv1Ej0ZxRSrbkQC8tTOBfWbh/dXhZzbqAmd6js6OHmOnAAdA3oSsf4I4UCMwH04gjajWFKrHMq/6zNPIzqKNSGWHw3SPhwRoN0//MB0EFYLpaXIFycC8mgRWInpKmlsDJdn6vjrtH32n3urQBc7Z9PraF+Khgo/OISz5389N8J9lqmbZ+nkC1gOCN07Wu+CLPCcasgsGSyvZnXvZWewQK6Bj7TSPFPS6lGJPfSgn6hvJFY5bGI/3kcjFle
MIME-Version: 1.0
X-OriginatorOrg: karlstorz.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TUT-EX01-PV.KSTG.corp
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4a6ed8-5e71-474e-c2a4-08de58324be5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 14:43:37.7883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4a0b6f21-e6e1-4ed6-9dcf-e60e7190f648
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HL1X6jnNCTI4LOeJsLHyT9UMLVGRSA0mmcdeemBSiD5xnMPJKOSYU1KROFlDvTdbSjG3UVaap+bsySCLt+1vgsGrfK8+SdUUPAH/uFH0Lno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB9174
X-Authority-Analysis: v=2.4 cv=W/w1lBWk c=1 sm=1 tr=0 ts=696f949c cx=c_pps
 a=yGpyVr8xkxB+PwK9r0fouA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0euYmpCUBxh-J07v7roA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: DQNo2VH3ckQsNR55aVeeHuttqgS_Z5pZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEyMiBTYWx0ZWRfX5E1JRXQtPFp0
 luM4UAS0Uw6Nch43CXgJN6vgu2SmKxiRWsWGfJ+LEl0paDzAyx7bb/0x5SX9OsKA+Ny8Sf9klmS
 Jg6GZKpMolkxpKHoe3bgWphnCqSt/qdhVmSpluFMGy+6+QX+asufWmWaBVLNVGmz9n0FcpqGQ6F
 7mqTXbx93dTV155hpD5u97uTj564iy6LfteFv2R5v5DUbmOr0USrDLAnANftpW0Vle1yBMFOIEq
 SDwzyXVw+t1Q0BiHywF0t12UqqmFOiIMFTidQpSU51RkiW/4WIVO1m/QNSe6SWKb2D2w7rbPOfB
 NotTy0tjRimLucC8be3JNAi7zVTt2swa0yswjPNdk++4qznAjU6IeM8fuixmaQPtJ5UWqXo3wNW
 tCUmHw3QSfz7IMkxCXgJtNjXGPcEsyAOIutlyrmJ876CfWsmIe5y6czj/R4GFnLNE/WLOKIzZar
 INcF8qZFbpoS/fdj+bA==
X-Proofpoint-GUID: DQNo2VH3ckQsNR55aVeeHuttqgS_Z5pZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 14:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123671

---
 .../recipes-xfce/tumbler/tumbler_4.20.1.bb    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb b/meta-xfce/r=
ecipes-xfce/tumbler/tumbler_4.20.1.bb
index c18d719c36..011a007c01 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_4.20.1.bb
@@ -12,7 +12,14 @@ SRC_URI[sha256sum] =3D "87b90df8f30144a292d70889e710c861=
9d8b8803f0e1db3280a4293367
 INSANE_SKIP:${PN} =3D "dev-so"
=20
 PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[cover-thumbnailer] =3D "--enable-cover-thumbnailer,--disable=
-cover-thumbnailer,curl gdk-pixbuf"
+PACKAGECONFIG[desktop-thumbnailer] =3D "--enable-desktop-thumbnailer,--dis=
able-desktop-thumbnailer,gdk-pixbuf"
+PACKAGECONFIG[font-thumbnailer] =3D "--enable-font-thumbnailer,--disable-f=
ont-thumbnailer,freetype gdk-pixbuf"
 PACKAGECONFIG[gstreamer-thumbnailer] =3D "--enable-gstreamer-thumbnailer,-=
-disable-gstreamer-thumbnailer,gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[jpeg-thumbnailer] =3D "--enable-jpeg-thumbnailer,--disable-j=
peg-thumbnailer,gdk-pixbuf"
+PACKAGECONFIG[odf-thumbnailer] =3D "--enable-odf-thumbnailer,--disable-odf=
-thumbnailer,gdk-pixbuf libxml2 libgsf"
+PACKAGECONFIG[pixbuf-thumbnailer] =3D "--enable-pixbuf-thumbnailer,--disab=
le-pixbuf-thumbnailer,gdk-pixbuf"
+PACKAGECONFIG[poppler-thumbnailer] =3D "--enable-poppler-thumbnailer,--dis=
able-poppler-thumbnailer,gdk-pixbuf poppler"
=20
 EXTRA_OECONF =3D "GDBUS_CODEGEN=3D${STAGING_BINDIR_NATIVE}/gdbus-codegen"
=20
@@ -22,6 +29,17 @@ do_install:append() {
     ln -sf tumbler-xdg-cache.so ${D}${libdir}/tumbler-1/plugins/cache/tumb=
ler-cache-plugin.so
 }
=20
+PACKAGE_BEFORE_PN +=3D "\
+    ${PN}-cover-thumbnailer \
+    ${PN}-desktop-thumbnailer \
+    ${PN}-font-thumbnailer \
+    ${PN}-gstreamer-thumbnailer \
+    ${PN}-jpeg-thumbnailer \
+    ${PN}-odf-thumbnailer \
+    ${PN}-pixbuf-thumbnailer \
+    ${PN}-poppler-thumbnailer \
+"
+
 FILES:${PN} +=3D "${datadir}/dbus-1/services \
                 ${libdir}/tumbler-1/tumblerd \
                 ${libdir}/tumbler-1/plugins/*.so \
@@ -29,6 +47,15 @@ FILES:${PN} +=3D "${datadir}/dbus-1/services \
                 ${systemd_user_unitdir}/tumblerd.service \
 "
=20
+FILES:${PN}-cover-thumbnailer +=3D "${libdir}/tumbler-1/plugins/tumbler-co=
ver-thumbnailer.so"
+FILES:${PN}-desktop-thumbnailer +=3D "${libdir}/tumbler-1/plugins/tumbler-=
desktop-thumbnailer.so"
+FILES:${PN}-font-thumbnailer +=3D "${libdir}/tumbler-1/plugins/tumbler-fon=
t-thumbnailer.so"
+FILES:${PN}-gstreamer-thumbnailer +=3D "${libdir}/tumbler-1/plugins/tumble=
r-gst-thumbnailer.so"
+FILES:${PN}-jpeg-thumbnailer +=3D "${libdir}/tumbler-1/plugins/tumbler-jpe=
g-thumbnailer.so"
+FILES:${PN}-odf-thumbnailer +=3D "${libdir}/tumbler-1/plugins/tumbler-odf-=
thumbnailer.so"
+FILES:${PN}-pixbuf-thumbnailer +=3D "${libdir}/tumbler-1/plugins/tumbler-p=
ixbuf-thumbnailer.so"
+FILES:${PN}-poppler-thumbnailer +=3D "${libdir}/tumbler-1/plugins/tumbler-=
poppler-thumbnailer.so"
+
 FILES:${PN}-dev +=3D "${libdir}/tumbler-1/plugins/*.la \
                     ${libdir}/tumbler-1/plugins/cache/*.la \
 "
--=20
2.52.0


