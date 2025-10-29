Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555F7CCF9F6
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 08:53:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web01.2678.1761727984674082020
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 01:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VmdCO3Q+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=33977d2df3=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4RHms507014
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 01:53:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=AVoSS2oLHEPx5XzHNMNcHNd1cV+0ewHl2UX48chL4jQ=; b=VmdCO3Q+/TBj
	9WMrB/KhmPDWbjIII2IEHz30BNPxT/b5l3XwlWFKpFzG0Gz2Zqm1hcTaGh7OtOpl
	UnOj21sVhU4ywyhl691BxUR308WXNMuEWI48iDzxDf76DNbz1r5sVzs1NGvl+zL7
	JjVHUu6dIL1fT9vRrVQnyMCrjn9ixndBY35z7KgCUYPGKI+B/eJVW3xf0pDaXmMH
	fxrZ+b/KEOR9B3A6DrMEjKOJ4nPzU3QYCQjXEJ8/NRwpFV6meNfYa0bJLaE9zuCo
	URTvsEq2RngpU0fC2FRffPuedSJmnNfbqD7CTmcbI45DBULj9YHNZia4oHJzL9dM
	Dns88Ir7aA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010065.outbound.protection.outlook.com [52.101.61.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a348a8mmc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 01:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkY5FtOfJK+TzugF2uMEE8CPmwx5CQUvBLIcnxNiaSAG+PCmWKdL1p41ogUuIdK3szpbay0FeIajUwLc8P0jqrslj8eT5/99Aokxl36szmMtSe3+uHU27r1BkBf/FjS6RC66bT+MRYIgdD/2iO+216ylPVYjDxuD3NmQnEoOp1AsyWhGUtC/oWf8UNS1fNo0tMcB4iLuyc00MHLBbEyPt4yRbVfL9NvmqqKh8NGuDP9+JL44XG+Qr7HtT/zpsX/8869Bd+GLaZ+KvBvsFwenSVjqLhDjSuDuKojG5uA35PJ5xzK5BiRVepv7YunwMMNhCgi5FNr38vVuVIELiBBkzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVoSS2oLHEPx5XzHNMNcHNd1cV+0ewHl2UX48chL4jQ=;
 b=myD+e8BYoeLbivTF873F/vtkqZADqEA16jSc3hLf7PRnfb5bty56GHr91jHnfcNH12PUHGRa8LdGDyh/mZUsdp5WUqp0+HGKMP9dcHvaRgzLTI1Wr9eNz/uYXgxMgrOMFJy/32QNFZZmINYPvI8W5TJXZ5m4pZt3fPuSrmxfz13FlfNhv92H34OYbi4ktQoXxLtZPWmcb4lfndyd06QZaUxStspJgvT6n7cxfn9SbgdOw9KAz4UdMDGF7/Le1QesQzawqyAOstbRkfCbb87q16wZg/ZW88VYB0Imf/y10JYqL5HoO1kf7g+QWKFWE0wGVFUQYvC2wWDoLi+tjtT79w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9420.namprd11.prod.outlook.com (2603:10b6:208:563::13)
 by CY5PR11MB6306.namprd11.prod.outlook.com (2603:10b6:930:22::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 08:53:01 +0000
Received: from IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e]) by IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 08:52:54 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][scarthgap][PATCH 1/2] webkitgtk3: update 2.44.1 ->
 2.44.3
Thread-Topic: [oe] [meta-oe][scarthgap][PATCH 1/2] webkitgtk3: update 2.44.1
 -> 2.44.3
Thread-Index: AQHcHj62CcW8wG8FC0WmwJIgrUpNzrTZJfvw
Date: Wed, 29 Oct 2025 08:52:54 +0000
Message-ID: 
 <IA4PR11MB942025F4F4ACFCD39771A76AB8FAA@IA4PR11MB9420.namprd11.prod.outlook.com>
References: <186254E5AFCF9A1C.28137@lists.openembedded.org>
In-Reply-To: <186254E5AFCF9A1C.28137@lists.openembedded.org>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=363dd9ae-1ca4-41bc-b388-efc22eedf401;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-10-29T08:51:37Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9420:EE_|CY5PR11MB6306:EE_
x-ms-office365-filtering-correlation-id: c8847c0c-e995-4232-a75d-08de16c88cd0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Rszm6ygKNfQ6/e2P9pSQvZAxunjZqeSPlXIcGl6C9jgj7Yf/C7wFUr4Orjrt?=
 =?us-ascii?Q?AYMkiv5UKyrBObShkkvo8AfYZxOgYG3xef73bsGvwjTPpOgD2qEU9XocFBo/?=
 =?us-ascii?Q?DO2FZzRb8Dcfou7QF5bpm5bN+mkjT8M2C3saI6zKD1Ir5hNlybIgpAJG0y4k?=
 =?us-ascii?Q?kYnun5Ue1cD96KosKyQ2JjYxYEHIKNdO2KJOthDSkFGAPBouHlsmkPii8dkA?=
 =?us-ascii?Q?XEgFSDJbMi9upAonYe/VABfZU8qg4YvOY+loTF4DaHFSL/xzM9X7y/t3iboJ?=
 =?us-ascii?Q?1o0fwnR3i4jXgLDlI+0TfIRvPrmrUCDRBdkqWIhcMG2qZ8tqX/UTmNPvV2wv?=
 =?us-ascii?Q?D1MlAutGqfnY1u8WL7s0HYU56JR4xXAyLRy5H2mqnDut1i3LY391kDQnXyP3?=
 =?us-ascii?Q?vFKGc4TeA0bvJpYtoE1jw2dWazOKJD6ie+sY3ORPpmjDFDPMQyazEyjBe0eG?=
 =?us-ascii?Q?U1bMNbMe2DCT2QOuiYQMh7Xz/iX9JsBQjtlUQvDoDfFOSlgPUJ3rey9U5oCj?=
 =?us-ascii?Q?NBfDZ65g6Cb6VFi5e/iOqzqXYXRzs/RDVOUmFYEjxe/cFkKv9H6wCiQtAB42?=
 =?us-ascii?Q?LG6AklZ32IhS8IU5KOgdo1goPpClwV111DZUciERPEoMRy3W7hWVxQh1ly2C?=
 =?us-ascii?Q?xcI6+jrSjy6mWMBlOBlT/ZHZ/JWnEAzacSBCjH6Bk7QumNKHRTQtID3FxBwF?=
 =?us-ascii?Q?VcqFH6WVcpQEP+fjJbv9MDHfksCTlFv4y4kT3rnpjSh/gwgJns4VBXd3R6+v?=
 =?us-ascii?Q?ZKyNJ4l/Tjxg8Ljc4UY6tDpKI8MBcEiTXSRFqhPYY390X+NlJao292vISo3u?=
 =?us-ascii?Q?iZNYEjpId7TFtvzcZ2GvLAZdPLPshzcU8NgzTUi4qYc0R/VvAa+tiDjya5+d?=
 =?us-ascii?Q?8jhBGc1Vpt7b8QRTnlgL3J/UGoNkYP9wxJDyDPYcGizvGjmWqN0T7JK3VEvA?=
 =?us-ascii?Q?ULwMz4guI78spZKhdl1JAJhBGXkJGghN9LUaLIyx0+iccFZIR9QUQUSjPiIQ?=
 =?us-ascii?Q?k4FOMf3qFjGuO5T23gtXt+Rnwt57YUtOrz6bmIqY/Yu5J2QjYIA6Jz8JHVag?=
 =?us-ascii?Q?gPjNmZ/6Fh+H/LxPk7NyrdHBJz4FTGMPMa1NBZhePsC8nxFpZl4foxfvZD+w?=
 =?us-ascii?Q?GMqi+14zC4bn1qdecplFePgirJZzDP/ZPRd7ufb4QMCRSLKp6IMZKsc8hn/k?=
 =?us-ascii?Q?N03iSQnipUblc3wwQdqbB48TgZA1DF2Zg6EgfJqaiX89IX9nKUd0DsCzTFOs?=
 =?us-ascii?Q?gZ+P7SjZLQKSQpxXPzumExKjLxrcP/BsAcb1jEdJ77w4HZzuSHG5lbP5s62G?=
 =?us-ascii?Q?cMktQinl9rW97Ikrp+9NAERKrXwh6/LH2ESV0Fj8/xnnzxnVYl2oAE4AYwvJ?=
 =?us-ascii?Q?EkCywWIfkXvUlHMj5cq/SeQkgOP7KbRU7+ZymwwXgvNIeIbEgOqs/jgdnC2t?=
 =?us-ascii?Q?faq0aTOd37zoI6VIEdY9fo5MX0LiMmrWaCVP4rOYuefH559zc4wLVw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?cTiETzt6h2fVUF3qH3Gd9OXqwq/DYJbRVSrv1S14zFjbWgIZMtraQNURJH33?=
 =?us-ascii?Q?VJl3HqX5bStU4uW8pLgmykk9FIgP8S1uW2EJtDldlV2f4zkadbJcKvO8Mqqj?=
 =?us-ascii?Q?WGhlrn9bwVmbBOanUNDSkopdeTMvvoi44lV8lZv6cHWH0W9Xg080reQt80Lx?=
 =?us-ascii?Q?PXwUUpuTNi0AV3Sg5SSXa3C8LOY4VvHVXLsJwv7b2jKlHXSWkERmSbEiywOP?=
 =?us-ascii?Q?FCyLfiCL7yUOs5Y7oZdt4jrrhEQJtjOWm+VelQxQ5zUiX3g92519/kP0lb9i?=
 =?us-ascii?Q?XwHHqzu/haZ+6remBKGYCWhGbL2x7mi0dqZGkWpPFhJWNAh/ebjm7aBPS5ko?=
 =?us-ascii?Q?uUxyFwjqM4V3NNpNCaWYRsvL3jjxV3vqpezO1IMH8wjniOQECg0Jp13KtL7n?=
 =?us-ascii?Q?a6EZn8+N6w0XgUiGhHLME9QbYHQt6DdpEaUFJlKOjCsMKy0R4a2AgNR7hB6u?=
 =?us-ascii?Q?C0GiDIeugQD1jgdxgfpYuK6NjYxD2kZviwEKGR/kJhZScY3T2hVNItfC9Izy?=
 =?us-ascii?Q?QtSQ//Ox0JW6aAjka73LSPopb7SzSXJl+B5qNpOMmrMo1OLTOPMvfTG1+hZ0?=
 =?us-ascii?Q?LSmD6sZ0xBy2x+dP65wbnKB+0OCPr9sJwly/ZnJ/ZHCb42znBsP7eaExCDH+?=
 =?us-ascii?Q?6FbsO5iWW3uBSfWDlFQocb83uJd0kZgL67mwWAtV2UA/In0vWnzFl046YxiM?=
 =?us-ascii?Q?bNPkC8hU5qtZVJKDQSJjYyvkHVir68NnnFEVQrlXUoJxhU3oOzoKym32+GSv?=
 =?us-ascii?Q?7s4ezpTeh1zxTk0FRd2TYBzuePgXenKvaU7APWDhTAQz1fq1I5oGa9xUkRMY?=
 =?us-ascii?Q?jalcPo8Nvf3Mw9Mq2xKTNmxCj1tq7swvop0+GsmW72PVYvYOpuyBI4dDA2Y5?=
 =?us-ascii?Q?5+iY58xp2c+g5ndeoIdDyQ11pShsqWw0YrhQZWqgnYPK3s9J5Vta3Rhy6BAO?=
 =?us-ascii?Q?xWvJTnGYn0K7sMoQ3X4OFW3u2ONZ+Ai3i6KEzhtADuB9tzxidsVn/pWcIcAR?=
 =?us-ascii?Q?LhczhX1mntqut2wCDbiC2xyhG2CAvQCKfqrkBMVym5Ux0Wab3GI1rH0WFu6q?=
 =?us-ascii?Q?A8eQoKuRqPE0AaYAaH0vpWBv5mpE8mGZg7d+EqfJ5lGLJEG9exozf6aq9RwM?=
 =?us-ascii?Q?3Nbh6uoNcyhSy1MZ7sHNbjEpVmfcreKw+CYytc/vvg7R2+TRnj3m5HKyGD7u?=
 =?us-ascii?Q?qkg9PEoq8hnRyAZm2zwamOu99QcLjoCGkSD77KbgNQXE2n16k2o9uLcv4c9j?=
 =?us-ascii?Q?mAMNLmSmO3qgfo3WA71BoPdhWWsniVkMHIcYIfu1K5rqk1Xfnsjdt25AWjKN?=
 =?us-ascii?Q?jHuDKIwiwS02xSsXHoLa66h+TeeqnGSWvkczYv+vci7izKLfH1bvqPZ0FK5t?=
 =?us-ascii?Q?NqKlBtEW/jP/gKIxTcFTJXkM7Og05cRMsrK22sUHagJKJW5UGMVFJmuVnpwF?=
 =?us-ascii?Q?m1PJjnQONQX1xTmerQWwNp/DzsumxzotUh/x0DA+0a3QZSJVUsbx+18xmfP3?=
 =?us-ascii?Q?aA3JpmlLj7Ky8sCG+O+FU1HcanMP2gpfv9kEkrUBe41Z+MRtLQx9K+Kt3985?=
 =?us-ascii?Q?ETBIV0cjrtyc6SIWUi53wTpraXbCAvj18b0m3Kw2LZWayfcdEntU8UBuxFrf?=
 =?us-ascii?Q?zQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8847c0c-e995-4232-a75d-08de16c88cd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 08:52:54.4737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Wu9dMT8oOX6LvU4PTXj+a6Hm3A3gcAIUfTvnKre1lyNmAeMap8JpRyBJQe2mzHvB12LrDlf4fYPf7tQKoXum5HvpLv/hj8IFMnf/aKIIXxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6306
X-Proofpoint-GUID: KJMGXIGFm49kudWr31mAKCoes_3aKMJo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2NSBTYWx0ZWRfX8dvAqmpkJ8Is
 iSKIF3847qdWb14y4ehhbkz9Zvp86XrBueO+F4J/+DyAOhg9kHl0s8GlMVtI4Mp71/7kzI1Dm97
 r6cCphQZYisKB5ZiUebX8An0VGl5z/N9rvrXQS5UfKKciDP9ZOVkj9uLW6O9z4kOvcEA0R4SlcR
 q4n88HsUoBtxMRQgK5Ldsunk6yfmwibK0bkDQyGDDGJLdPOpj2PBziY31tRPMpEGiGhdBVv2Bs9
 KzT9uHbuuODTzHH+6mabjOP/NVqNIMM5zWWYtomQjvMhZYXTYXisc2A3Rc4C/wB18KrC1piPap+
 +/beGbd6AcRctEAUX6wfx/x+VzCOJmaw7P1OwBviq73N931HNuFfm5jjgufmho6ruqcWuYe+PlU
 cyusEFKqU1w9teaplXmYUMx9Dh5ZXA==
X-Authority-Analysis: v=2.4 cv=aLj9aL9m c=1 sm=1 tr=0 ts=6901d5f0 cx=c_pps
 a=mfnpAPd2LV9TTO/yo6PAYA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=LXCGm8LIAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=SWqQnwTfyOhUR1d76moA:9 a=CjuIK1q_8ugA:10 a=K2vEmuv5VUIA:10
 a=fBI0yctglXEA:10 a=NxI9r9ql2kHpUT0AVVEO:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: KJMGXIGFm49kudWr31mAKCoes_3aKMJo
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121142

kindly ping for scarthgap branch

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Song, Jiaying (CN) via lists.openembedded.org
Sent: Friday, September 5, 2025 4:16 PM
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-oe][scarthgap][PATCH 1/2] webkitgtk3: update 2.44.1 -> =
2.44.3

From: Jiaying Song <jiaying.song.cn@windriver.com>

Changelog:
https://webkitgtk.org/2024/05/16/webkitgtk2.44.2-released.html
https://webkitgtk.org/2024/08/13/webkitgtk2.44.3-released.html

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../webkitgtk/{webkitgtk3_2.44.1.bb =3D> webkitgtk3_2.44.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)  rename meta-oe/recipes-supp=
ort/webkitgtk/{webkitgtk3_2.44.1.bb =3D> webkitgtk3_2.44.3.bb} (99%)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.1.bb b/meta-=
oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
similarity index 99%
rename from meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.1.bb
rename to meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
index fc96d5dc3b..7d70cbda78 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.1.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
@@ -16,7 +16,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/webkitgtk=
-${PV}.tar.xz \
            file://0001-LowLevelInterpreter.cpp-339-21-error-t6-was-not-dec=
l.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
            "
-SRC_URI[sha256sum] =3D "425b1459b0f04d0600c78d1abb5e7edfa3c060a420f8b231e9=
a6a2d5d29c5561"
+SRC_URI[sha256sum] =3D "dc82d042ecaca981a4852357c06e5235743319cf10a94cd36a=
d41b97883a0b54"
=20
 inherit cmake pkgconfig gobject-introspection perlnative features_check up=
stream-version-is-even gi-docgen
=20
--
2.34.1


