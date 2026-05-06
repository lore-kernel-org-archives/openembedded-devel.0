Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BCECD3424
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 08:15:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13569.1778055344705012025
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2026 01:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ez20XKiL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9586df8bd6=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6465BQgG2657178
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 May 2026 08:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=UWWEnxBfePnB6yzps2rYZnU1oCzKE1q6miCBwzp9xJM=; b=
	ez20XKiLrPhypyrFbzMkxyfNDDBQM/afjwWNI4UrOGWl8OSTzggcRJPCQlAGdy+h
	cpesK4l3nVpYOuVqZKooB3jdoxlvbH02LVrPb4gXw54nzfEpsoaqxMWhIv+AxWuM
	TazLz8c+3ULUczBKNGPfCk25hktBpAxaT3q6XZ5y7NCRxQkbdeK8mZC80y/wlRRo
	lGasRkx4tSd3SQkQHZNMNPQtiC3EAl0FhJOmDbwn34FtnrICOzeNK6QD3NgaL5E4
	fAKz6TIRGRgcCAPT+GTHG1i/kto3+pnQnQhTkie+YlBAuRbbTiDC8mpulbbBf0/Y
	/M3M8FjHh7j+amsQpVMZyg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011035.outbound.protection.outlook.com [40.93.194.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dw8t5vp3a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 08:15:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8QFnJYIEw2XSGkP6fwc3e4W78/nLh/fcx2y4P1X5LH4GwzMYCewbVulyWZt733219ol6msb3HfSJALVuk3nujT7jv0YJTOSz8dGKvf+9oYsZfl5hmgXdnw1D4jKihyBHKqt6VcAiTaGfp/tupJawQgUqUgoLbFHMUS+7ZPzlWWuKC3CGbRWdciQ4l+mP3knGkVPju4/YV3uqeje8yyuoycCWaPGFsh/c4FEF/XV/bLNUWrnGQCaA0100dMtFoPBsnpzptU05M7G+Yk+wAR3qCsS7JkfKlRuk/ruXl6SPn0uJ8DcHRiuzxpNjlFf1xGQQEpelY+bwIdZXoNTSuXpig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWWEnxBfePnB6yzps2rYZnU1oCzKE1q6miCBwzp9xJM=;
 b=GtJnHRXaPjdTpC/apiFRb6QxzWvjeGGRCuGTyo1vBQrOqQeXLsgC3AyfIugf5MVWRaMGDq1WoTjOr+QvJzRLhAeGkyhB51yPOtBKfmcc9KLWdpo62f8FsR8kpoWfrRP0KLixSyTaEQoPg0MkoP9BmLE973iD2W0Ukgxv9CfLZr/qAwJz16tIWkWiR5xnVOBhyhWysUxGODdQdFiUAQ6rebnBrYo7+B9aaDnCFdpAQ9B2fTgiKd+X02uAWkPfs3ttF14uPovHLgwH2KvThvnmr/E736VKK5uR6EgmfLJC3ZyYGx/F5Q5m86BC+rszk1sPi2AC+8RWCmRHDY9+yVSIUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by DM4PR11MB7302.namprd11.prod.outlook.com (2603:10b6:8:109::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 08:15:39 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::4a0e:caa8:c2fa:8700]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::4a0e:caa8:c2fa:8700%3]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 08:15:39 +0000
From: "Chen, Libo (CN)" <Libo.Chen.CN@windriver.com>
To: "Chen, Libo (CN)" <Libo.Chen.CN@windriver.com>,
        "anuj.mittal@oss.qualcomm.com" <anuj.mittal@oss.qualcomm.com>,
        "Wang, Jinfeng
 (CN)" <Jinfeng.Wang.CN@windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][scarthgap][PATCH v2 08/11] hdf5: fix CVE-2025-2308
Thread-Topic: [oe] [meta-oe][scarthgap][PATCH v2 08/11] hdf5: fix
 CVE-2025-2308
Thread-Index: AQHcyLkjFb1kBXfg8UapYQUXdAXj3bXf0cyAgAMN+xCAHe9YsA==
Date: Wed, 6 May 2026 08:15:39 +0000
Message-ID: 
 <BN9PR11MB535498524BA565208A1B8454DE3F2@BN9PR11MB5354.namprd11.prod.outlook.com>
References: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
 <20260410070508.1104455-9-jinfeng.wang.cn@windriver.com>
 <CA+s=J=ztc7LcbsPH-QsFCSduqQX7Abqt=4Ve2S4s1ZSK4+DQkA@mail.gmail.com>
 <18A71324D22B34B7.1570320@lists.openembedded.org>
In-Reply-To: <18A71324D22B34B7.1570320@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=18e66673-d749-4eac-8c47-cc83d362aab6;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-04-17T07:05:46Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5354:EE_|DM4PR11MB7302:EE_
x-ms-office365-filtering-correlation-id: 21e963a9-a5c6-4582-d762-08deab47a8ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 
 MutE/WKERwPE/y3roAKR2fcz9GNdNzaqlqJjSqKLA7Gt9xl8Wff+3+ZSu/hUNfJ8DnEqH4/5uiGyvEinI7aa0mPfJH4OkbQOIQSe2KvescJOm4h1rMnS6MMkP6pGLpTgge8ZkrYXVJCexnQOqwFgXholDy5YJXxJW1bqOYjeMgFZ05M/NYSHUknFoDkyJbj7LSoN94Gp57YJ8RpbTqk5HXUx3RPiL7zccKChmDhRflyAPUOrWkGnz3C8iGn606RpNT2h1Y8pnLKdL4G4qqb//bG29UH6az0QXfpcrAO1xxvw0d7j6DT1spUibitkNJR5heEsWDw9Q7XAYVGYS2goyXYgOopF6ire50oaKjODEAflpCPQgESyv2nYs3hnSBtDeRoY1NKahzNGo3rNOo5JB1NWdny9LLDPwfd+RS5+LezQQaaT3xNj19rD/clIrZUmf59uMjS1DDTMML759O7vAw9ICItpCxbbQ+nUShp6CuZTvlBRh+a2jM41Xii0AR7bBQRC19+2XtgB2rVeb0qt5ktljrUgVGtjWTi4UlRzEv1LhpFozni1bpQhR9kLqDRhId7fgMqmwzcIV1jZBAAcGmmo7imDfgb0s0QXqVbh2QEkXMYlNz0V/qPUh9Kq1OA0VZsH5M4wpBz+4HZP1ldCVSxjtV7sRk9e33RLTt7uWQ97DSPrYsbS0MtzHIibtI2wpoZgvzQzXKPk5p2bc2iWjdwstbOzy58IU0OXsrb7r+ZN0lPy9Is0E4o7zH1rCxXI
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YisxN0lqdWhNS2RzZkdrNFh5OHJwZXBTRzN2K3lEVmovcTNCOHc0anNLN0pt?=
 =?utf-8?B?Y3prV09hYWlvWFJIMFZIaTZsZnpKS2J2ajNQUUJGOUExZ2hrZkZod2FBdlEv?=
 =?utf-8?B?akszbnpZbFgvQXQ3OU1TQUdXazZIeDJaNzM5UTNLMEdPamN4RnRCcXVLZGdm?=
 =?utf-8?B?WW1iZWQ4V1ZMSHdYY05aU0htUno5cDFvL1RYZHBQWTkxL25ETmJ6SlpBNXpB?=
 =?utf-8?B?UVFUdGJGdTV4QzhUeGJ0MjlEeCt4QmN5eTRNZWFQOVhyRm9EQTBIL2sxeXNv?=
 =?utf-8?B?UnQ1VG83bEdqY3diRE1iT0JFam5yeDRSNmpoUk8rM25uSTJXR1I3OUxOV3hX?=
 =?utf-8?B?SkMzN0ZvTThHdnd3ZlZzbGR0anlnaUxVeHBuZTBmUUo5ek55S1F1RVZ0Vi81?=
 =?utf-8?B?Ri8reWpYaU1Ec1EyWWdIZjFoalJXODh2cDFNTGNNRjU3N2tUMU5oZXhLWDk0?=
 =?utf-8?B?UmRFd0dDNUdLdndzS0xnd3BLM3VFanRvcUVpQjhWRlpVTU9xNjJBTW9vblpW?=
 =?utf-8?B?WHRucUkyenBiRjBqVVZkNDRIWUJheWY1ZE1HTjYzVFJBb3F0ZDMvQ1I5a08v?=
 =?utf-8?B?bmJUbFp2QUw5UHRudjBxQTVCZ3ZZYjd1dU9JVDA1QkhEREZ2MmhaS2pQbk5h?=
 =?utf-8?B?OWNPa2p4aC9QVjU1dy9Gb25nUVUvcGtRRUtIckNBeHN0RW5iQzhMNTR1dyta?=
 =?utf-8?B?SktLRFpmZ0h3ODMxK3paK21Jd29QWUhvL3ZWQ0xZOWluY3pmbHI4anBydEox?=
 =?utf-8?B?MWdZNGRqb3RFM3IvSjl5SzZIZXFxSTNWalhxTFloSVpMSU5XZUNHV1FtVmds?=
 =?utf-8?B?QzEvR21Sc01XZjJpSXd0WjVYYTdseU1RVGMya0JWNVpHNWtVaWlyU2RlTHRy?=
 =?utf-8?B?cnlNQlFqczQ3aWdJc2V6NzZzZkFORng4SFBXMHp2bTRLbHZIT2xZYmlFSEkr?=
 =?utf-8?B?RStSYmtRMVZqYTFHd01vWjhrU1VlMktPeDlaTE5XTmRhQlpXdk1mTlZyNml2?=
 =?utf-8?B?ZFRYaHpUcmxHQzYrQ0E3ZEIvR0lOa1FhaG1vbDR0cC91L3hNNlRabFE1Sm5P?=
 =?utf-8?B?ek1GWUR1c2ZHWU5zYlFNMnNVbjNXTFAzYm5ha0Erc0crelp4SldWcjgvVHlV?=
 =?utf-8?B?V0pBOWxTdkFFaWxLc0VPVGN0UmVVMXJOVmlVK2NreGxNMUJLSmNwdXNjWGxI?=
 =?utf-8?B?UW1DNEdndzhRSUsvcThadUovTXZDSWZ0QU13dzZxd3NYOVNFdEpmME1LMnBH?=
 =?utf-8?B?VVRheGJGbmI4Qnk3ZllwRjBtNXVWcm9RRjkrNjdXRFhCblErN3R4Ym1CcTBt?=
 =?utf-8?B?ajlRUnU0SEpVdDVoeXptUllKbTNGV2VJa0NSVHh2cG1PeExJcjhPSVdRVkRJ?=
 =?utf-8?B?VGZlTlI5ZnlRdk1QOGgzaElqbkg3UHltN2hoeG5RZWJNMU5sdDlyT0F2a3BH?=
 =?utf-8?B?eG50UmV1QUJjY2lTSmlOb2QrUFdsT0xIQnZid2pDQ2V3VzE5Qnk3ZEthZ01l?=
 =?utf-8?B?VitzVUNrcjhtSU5oc01Temc1ekdyL3FXQWl2ZlFrbXNVeUcvalRhaVIrR042?=
 =?utf-8?B?bTVHNDNZWDBqd0tJRnNXcjFWTDczUWJaTUZCb3pXd2lMRExUWS9lNGdQZlNo?=
 =?utf-8?B?VWJOblpEMEtZQnI2MjlXR3VWd0UydTNYTzVjdTNGNFJEOVlKS1p6TUt6SEFl?=
 =?utf-8?B?dmVFY09LeHVOZ0RacXQzMUpMNE1vbHg2UUdwbTdaclM0UllFaTdKR2N1RTlX?=
 =?utf-8?B?NVVSY2JjcDNSL21PU3FmNVczQkc5anZqaGpQdUhrVjFEOEl1dnN4NkFJTFhh?=
 =?utf-8?B?QkVCT05vT1ExZHU5NWw2Yyt2MHloYmMzRTQ3Z0xzUzcvY3NTV0htU3NzTU5J?=
 =?utf-8?B?RWZjOHBuSGlsU2VDQWFBRVlNUWhybEUxTHFsSUZpd1VDNlJaNTBIV2U5WXhT?=
 =?utf-8?B?MWRBQmpYc1JQT0xEODZIdUI2dWc0c29Ib01WWndZSXlUWmFqNzJ0MStNSXds?=
 =?utf-8?B?K0x4bzdMSCtKSXB1cUZkckZpTGp1ZWhMOG1BTGJwQmRyQkNBNit5Y0hONjlp?=
 =?utf-8?B?eEJkbjVldWlnU3ZJWmhIbzVzRCtyUVhLN0dPbCtZT0VMOGlSTkExUncyN3px?=
 =?utf-8?B?Y3U2bEVQVGtwalY5bE1TNXNVM215WDc2VkozN1Rpejcya3lpTlI5SCtjRlE0?=
 =?utf-8?B?cUdydHY5TkhZSCtBWUg0ZE9malJKMHR0R0JWc0ZjVEcycEVYZ2F1QUc1RDd2?=
 =?utf-8?B?UGJQc2R5TWw4V3RFeUFmUUxBNk9kU2xwK0t6RUlQa0c3eDVIcFNvdEZGWmNR?=
 =?utf-8?B?MWt2MWlZMGRIdzlyMkQ4QzJQT1FwYmZ3WlRoZnhNUEVrNFU3aHJyZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	qMNXbGECP8WRz+A/rEhA7QxXpD+Vv1Y+uPsI140UG/HFafIpW3lb/KdKPFNMcnP1ecz5KIFKIdCJde079JxlSpC82NB0qtl9oE+l/A8UDbROLNXdRyNd5MojjH/PTkfBpoMvDSo1jXr//qrjDIcz9w3TsOTnAjroxCOwRGD42cI0aQjDlwen01NW3xBp8uyyybqS02S78zLAnIYteyVMwxWG+7nZYMPi2WswInWz6umM/1+qAI4npVya0izuhIB+L5dvSAQdpTictdoiry0OqG6/Rrlp4TaEv7helz8Ye9cydcZLHlJm6nIPvuyv46dIRKvCeyQWCNo2dHvPE4x4TQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e963a9-a5c6-4582-d762-08deab47a8ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2026 08:15:39.7172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w6mNy3p76DJkz390cfUMFwywaCEyRizsHTLZ3AKxdevwSg4YWhh83UVnx71tpoMC917qvCCa7TgXL8Xg9rVzLyIIGmJ1+AOOZD/vwxvjO0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7302
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA3OSBTYWx0ZWRfX97XYR2y599Pm
 SWahGWB8jlMxKtivhHYJDG3i2pQwC73C/FC8n9AEw4dOrNC1jDNU+cvgt6lUdhObxag87s4/6Pm
 i6xjIrYpAWRBHOhpkiI2sXVn0pc76m0u/SNuHFIKzmGHe9JKCn9WgaqeSegmSxyTxurQZKpyk8J
 bLPQ5VqrBcueoOoHn7n0qWQqSBxQZz+sbcaiWZ3mnuqSwrdPMVk6R4vi8qVeGBx5iwz7//BrYm3
 mmD1yv0YnQV48ErsuFQ3P9oqe2QmlvdPl3w40AXguInHkDA08DCmnCXnvrvVQhqB/7g5Y9mR3d/
 sA2AcA3qpOozL4i58KnSvPrwEXFH5UYPIKyB0V+LAY3koRw+fIBaoItfbFklC0w72lshBudgNyj
 1uZUHcJgjsb9RY/4c5GATBG9IiGIejD76xoVdPSOIYPyn/cTxef2ZQQZuiQdpuJt1RdfCP1SKQC
 V8M7llHMDF4gnayU3nw==
X-Proofpoint-ORIG-GUID: vrG4EH5kNurDnNPgS-3rzZIeeTdx01bh
X-Proofpoint-GUID: lvpAE_vS-XUVkrZqikyfjjx-6qK3qA0m
X-Authority-Analysis: v=2.4 cv=BcLoFLt2 c=1 sm=1 tr=0 ts=69faf8af cx=c_pps
 a=ALJIVG5iHo/ZE5SKMfQyZg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=EUspDBNiAAAA:8 a=X5zMDo6LZWs-r0jIiMUA:9
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 08:15:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126797

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IG9wZW5lbWJlZGRlZC1kZXZl
bEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+PG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgQ2hlbiwgTGlibyAoQ04pDQo+dmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj5TZW50OiBGcmlkYXksIEFwcmlsIDE3LCAyMDI2IDM6MDcgUE0NCj5U
bzogYW51ai5taXR0YWxAb3NzLnF1YWxjb21tLmNvbTsgV2FuZywgSmluZmVuZyAoQ04pDQo+PEpp
bmZlbmcuV2FuZy5DTkB3aW5kcml2ZXIuY29tPg0KPkNjOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPlN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW9lXVtzY2FydGhn
YXBdW1BBVENIIHYyIDA4LzExXSBoZGY1OiBmaXggQ1ZFLTIwMjUtMjMwOA0KPg0KPg0KPg0KPj4t
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj5Gcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPj48b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBBbnVqIE1pdHRhbA0KPj52aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPj5TZW50OiBXZWRuZXNkYXksIEFwcmlsIDE1LCAyMDI2IDQ6MjcgUE0NCj4+VG86
IFdhbmcsIEppbmZlbmcgKENOKSA8SmluZmVuZy5XYW5nLkNOQHdpbmRyaXZlci5jb20+DQo+PkNj
OiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPj5TdWJqZWN0OiBS
ZTogW29lXSBbbWV0YS1vZV1bc2NhcnRoZ2FwXVtQQVRDSCB2MiAwOC8xMV0gaGRmNTogZml4DQo+
PkNWRS0yMDI1LTIzMDgNCj4+DQo+PkNBVVRJT046IFRoaXMgZW1haWwgY29tZXMgZnJvbSBhIG5v
biBXaW5kIFJpdmVyIGVtYWlsIGFjY291bnQhDQo+PkRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXINCj4+YW5kIGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4+DQo+Pk9uIEZyaSwgQXByIDEwLCAyMDI2IGF0IDM6MDXi
gK9QTSBXYW5nLCBKaW5mZW5nIChDTikgdmlhDQo+Pmxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj48
SmluZmVuZy5XYW5nLkNOPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+Pj4NCj4+PiBGcm9tOiBMaWJvIENoZW4gPGxpYm8uY2hlbi5jbkB3aW5kcml2ZXIuY29t
Pg0KPj4+DQo+Pj4gQWNjb3JkaW5nIHRvIFsxXSwgQSB2dWxuZXJhYmlsaXR5LCB3aGljaCB3YXMg
Y2xhc3NpZmllZCBhcyBjcml0aWNhbCwNCj4+PiB3YXMgZm91bmQgaW4gSERGNSAxLjE0LjYuIFRo
aXMgYWZmZWN0cyB0aGUgZnVuY3Rpb24NCj4+PiBINVpfX3NjYWxlb2Zmc2V0X2RlY29tcHJlc3Nf
b25lX2J5dGUgb2YgdGhlIGNvbXBvbmVudCBTY2FsZS1PZmZzZXQgRmlsdGVyLg0KPj4+IFRoZSBt
YW5pcHVsYXRpb24gbGVhZHMgdG8gaGVhcC1iYXNlZCBidWZmZXIgb3ZlcmZsb3cuIEFuIGF0dGFj
ayBoYXMNCj4+PiB0byBiZSBhcHByb2FjaGVkIGxvY2FsbHkuIFRoZSBleHBsb2l0IGhhcyBiZWVu
IGRpc2Nsb3NlZCB0byB0aGUNCj4+PiBwdWJsaWMgYW5kIG1heSBiZSB1c2VkLiBUaGUgdmVuZG9y
IHBsYW5zIHRvIGZpeCB0aGlzIGlzc3VlIGluIGFuIHVwY29taW5nDQo+cmVsZWFzZS4NCj4+Pg0K
Pj4+IEJhY2twb3J0IHBhdGNoIFsyXSBmcm9tIHVwc3RyZWFtIHRvIGZpeCBDVkUtMjAyNS0yMzA4
DQo+Pj4NCj4+PiBbMV0gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjUt
MjMwOA0KPj4+IFsyXQ0KPj4+DQo+Pmh0dHBzOi8vZ2l0aHViLmNvbS9IREZHcm91cC9oZGY1L2Nv
bW1pdC8yY2U3ZmRjNGNmMTQ3ZDI4MGFhNmQ0OTY4NjI5Nw0KPmYNCj4+PiBhYWNjMjUwZTQwDQo+
Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBMaWJvIENoZW4gPGxpYm8uY2hlbi5jbkB3aW5kcml2ZXIu
Y29tPg0KPj4+IFNpZ25lZC1vZmYtYnk6IEppbmZlbmcgV2FuZyA8amluZmVuZy53YW5nLmNuQHdp
bmRyaXZlci5jb20+DQo+Pj4gLS0tDQo+Pj4gIC4uLi9oZGY1L2ZpbGVzL0NWRS0yMDI1LTIzMDgu
cGF0Y2ggICAgICAgICAgICB8IDIxMjANCj4+KysrKysrKysrKysrKysrKysNCj4+PiAgbWV0YS1v
ZS9yZWNpcGVzLXN1cHBvcnQvaGRmNS9oZGY1XzEuMTQuNC0zLmJiIHwgICAgMSArDQo+Pj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMjEyMSBpbnNlcnRpb25zKCspDQo+Pj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NA0KPj4+IG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2hkZjUvZmlsZXMvQ1ZFLTIwMjUtMjMwOC5w
YXRjaA0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2hkZjUv
ZmlsZXMvQ1ZFLTIwMjUtMjMwOC5wYXRjaA0KPj4+IGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQv
aGRmNS9maWxlcy9DVkUtMjAyNS0yMzA4LnBhdGNoDQo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4+PiBpbmRleCAwMDAwMDAwMDAwLi4xM2IwNGJmOGExDQo+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+
ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2hkZjUvZmlsZXMvQ1ZFLTIwMjUtMjMwOC5w
YXRjaA0KPj4+IEBAIC0wLDAgKzEsMjEyMCBAQA0KPj4+ICtGcm9tIGNiY2U0YzJlY2Y2ZjU1NTc2
MDU4OTBlZWMxMjVlY2ZhYTQzNzExMzEgTW9uIFNlcCAxNyAwMDowMDowMA0KPj4+ICsyMDAxDQo+
Pj4gK0Zyb206IExpYm8gQ2hlbiA8bGliby5jaGVuLmNuQHdpbmRyaXZlci5jb20+DQo+Pj4gK0Rh
dGU6IEZyaSwgMzAgSmFuIDIwMjYgMTY6NDM6MDQgKzA4MDANCj4+PiArU3ViamVjdDogW1BBVENI
XSBGaXggQ1ZFLTIwMjUtMjMwOCAoIzU5NjApDQo+Pj4gKw0KPj4+ICtBIG1hbGZvcm1lZCBmaWxl
IGNhbiBjYXVzZSB0aGUgc2NhbGUtb2Zmc2V0IGZpbHRlciB0byBoYXZlIHRvbw0KPj4+ICtsaXR0
bGUgaW5wdXQgZGF0YQ0KPj5jYXVzaW5nIGEgaGVhcCBidWZmZXIgb3ZlcmZsb3cuIEFkZGl0aW9u
YWwgY2hlY2tzIG9uIHRoZSBtYXhpbXVtIGJ1ZmZlcg0KPj5sZW5ndGggYXJlIHJlcXVpcmVkIGR1
cmluZyB0aGUgZGVjb21wcmVzc2lvbi4NCj4+PiArDQo+Pj4gK1RoaXMgUFIgZml4ZXMgQ1ZFLTIw
MjUtMjMwOC4NCj4+PiArDQo+Pj4gK0NWRTogQ1ZFLTIwMjUtMjMwOA0KPj4+ICsNCj4+PiArVXBz
dHJlYW0tU3RhdHVzOiBCYWNrcG9ydA0KPj4+DQo+PitbaHR0cHM6Ly9naXRodWIuY29tL0hERkdy
b3VwL2hkZjUvY29tbWl0LzJjZTdmZGM0Y2YxNDdkMjgwYWE2ZDQ5Njg2Mg0KPjkNCj4+PiArN2Zh
YWNjMjUwZTQwXQ0KPj4+ICsNCj4+PiArU2lnbmVkLW9mZi1ieTogTGlibyBDaGVuIDxsaWJvLmNo
ZW4uY25Ad2luZHJpdmVyLmNvbT4NCj4+PiArLS0tDQo+Pj4gKyBzcmMvSDVac2NhbGVvZmZzZXQu
YyAgICAgIHwgIDE3NyArKy0tDQo+Pj4gKyBzcmMvSDVac2NhbGVvZmZzZXQuYy5vcmlnIHwgMTc4
MQ0KPj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4gKyAyIGZp
bGVzIGNoYW5nZWQsIDE4ODYgaW5zZXJ0aW9ucygrKSwgNzIgZGVsZXRpb25zKC0pICBjcmVhdGUg
bW9kZQ0KPj4+ICsxMDA2NDQgc3JjL0g1WnNjYWxlb2Zmc2V0LmMub3JpZw0KPj4NCj4+Q2FuIHlv
dSBwbGVhc2UgZml4IHRoaXMgcGF0Y2ggYW5kIHJlc2VuZD8NCj4+DQo+PlRoYW5rcywNCj4+DQo+
PkFudWoNCj5bTGlibz4gXSBTb3JyeSwgaXQncyBteSBtaXN0YWtlLiBJIHdpbGwgc2VuZCB0aGUg
Zml4ZWQgcGF0Y2ggc29vbi4NCg0KQW51aiwNCkkgc2VudCB2MyBwYXRjaCBvbiAxNyBBcHIgMjAy
Ni4gSGVyZSdzIHRoZSB3ZWIgbGluayBodHRwczovL2xvcmUua2VybmVsLm9yZy9vcGVuZW1iZWRk
ZWQtZGV2ZWwvMjAyNjA0MTcwODQ1NDYuMzQ4MjkwMi0xLWxpYm8uY2hlbi5jbkB3aW5kcml2ZXIu
Y29tLy4NClBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBhZGRpdGlvbmFsIGNvbW1lbnRz
Lg0KDQo=

