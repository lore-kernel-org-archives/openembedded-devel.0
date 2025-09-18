Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08B5CAC597
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 06:42:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7737.1758177746363621781
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 23:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oduhNj/M;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13560e645f=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I4fTSV2373659
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 23:42:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=ga1/t90OScbUlT42Kvr7oB
	Q4YqVdd5Gtt+yruoT6UMo=; b=oduhNj/M5jFgaMhU+Lp5Ty2RkUa3JnEc0ur69u
	qa+gWKsA0ZsATkPKg3WBWpftEYTiVcH8Mwm7V0RT3zjJ+9h9/38BWHyJk/c/o+KU
	P2XzehHbQ3b2YcnxnOq69SiIU4DuAE5qcktfXmiTbODDV2x2kgUuQMMT1VbFmqO4
	NRWMJNqXv/qgzKlU95prEwzEWCQXBB3BWAmG4eEkUzw/12jO6un2by5fRaRC6GXk
	K8I2Bje0yVIy0dOf/DwJtIlFzNWaPCkIbTRsCVmrPocgp6O9PGsP5lUayY0RVqwK
	LcfS8AG0sm7yE/TQzDUK5NjXPRLUIqXmIyVdAuMd62E8GHGQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013015.outbound.protection.outlook.com [40.107.201.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwr1ptx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 23:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMkhp2lvyfQAPwQvOBGn5RvYxdFabvouNGUDre42CnjOkkbtu++R7zZFegidwCDS/kJFgjojpVv26Hpkqxh5Y8XOB7oshvhRgQPZv6gCg7TeikYAnac77BjAYv1Pul3FSkVf3DbGl84lBKA3JjW6fUzRqG5t6qG65uwWsAyhL1/WdIOhimJY5X5yRZOf3edW1VvIJXYyJg6R6enijICP3BUYMMbg0vMyRbigqrSTwjhOi+aam9q+9wmjIb54TWX8K81ZqHXUAbyvPOHFMub06qGel9n6NQAre6pJF3NoCh3zrrN7lIweMYRvuD2dTaYNqJEDUrKakzfSd/cneTnMMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ga1/t90OScbUlT42Kvr7oBQ4YqVdd5Gtt+yruoT6UMo=;
 b=Ich8ZLwfygMwNGJAXI1ix9e6lLn/9ljh2C4xqoz+vMKyZaNmNequ+wE4VZWImCjK3XIK2wRl2elZ9YQgWjnqkivkvzVCYzd3FYZepPAzQz0c/0lndabVwBVCLi50ck+M2MzLtj7sxKdF6JAC0mAgFit+Psv3+LYcEU3F/MOpStBIOcvu8+JHERCdXE5UXtqUZXKkHf/4UDpK7i7YgkaUGNswQPGYV/DHMy3mVpSLdJhwD8SZor3XwHUfLzVSYk7L39C/FvE6DJpG1hqq099/RwxRmx829KDq1J+Sp1qL0/qzctFA/WJR2CeoRSSxy3RYwGR6QfIR0Z0qHF1Zz6x/fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA4PR11MB9420.namprd11.prod.outlook.com (2603:10b6:208:563::13)
 by IA1PR11MB7871.namprd11.prod.outlook.com (2603:10b6:208:3f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 06:42:21 +0000
Received: from IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e]) by IA4PR11MB9420.namprd11.prod.outlook.com
 ([fe80::2714:5169:aa4d:163e%4]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 06:42:21 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: "ankur.tyagi85@gmail.com" <ankur.tyagi85@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: FW: [oe] [meta-oe][walnascar][PATCH 1/2 v2] webkitgtk3: fix build
 failure with DEBUG_BUILD enabled
Thread-Topic: [oe] [meta-oe][walnascar][PATCH 1/2 v2] webkitgtk3: fix build
 failure with DEBUG_BUILD enabled
Thread-Index: AQHcKF79gHFAEvDH4UeohLzdVwSBXLSYer1w
Date: Thu, 18 Sep 2025 06:42:21 +0000
Message-ID: 
 <IA4PR11MB9420632298BD69C695B6F4FFB816A@IA4PR11MB9420.namprd11.prod.outlook.com>
References: <18664A07D9EABAFB.22219@lists.openembedded.org>
In-Reply-To: <18664A07D9EABAFB.22219@lists.openembedded.org>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=93d31a75-cbe2-4006-87bc-9c05ae958461;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-09-18T06:30:35Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9420:EE_|IA1PR11MB7871:EE_
x-ms-office365-filtering-correlation-id: ed11f2d9-75c3-4cf1-127e-08ddf67e850d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|4013099003|4053099003|7053199007|13003099007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?Zanj63hs66NmNRb3iJKjD3ZSs3aslX8PI/lXJl5NUzoQBjc92loOrF53sx3T?=
 =?us-ascii?Q?mI7fzoDVU7P7GF34GgIutyvTs5DcFYAKi8rVrbHrdKDp+joiBuypPwfNJEhb?=
 =?us-ascii?Q?1slqCaEpsWGQXB1lUmgkeY9peZVPlJ+jHSWlmo5HN5Atj1rzQw/2JBw67vAI?=
 =?us-ascii?Q?UghG7NN6QB+kpgfYqezO3td0Mw5z9hqwGwoKJvQECIbEuI/Bzrq7u/Ya+MJ4?=
 =?us-ascii?Q?44ofsGEFStGSmSwdXbKERKY5ZSTb3UBnQwCe6mqUGLBHyQfGDhd5MKklmETi?=
 =?us-ascii?Q?J0RmTZMk+zQsgLbGWtD7GuAAmaTymU6YOY5IIpNPlkf4tZFlsEjpCQG1qHsB?=
 =?us-ascii?Q?e3BH3ztUOsuErcUZ0rEJyVp7mds4XLQJ8LxpGZdGG/7pLshefxbUXsKme6aP?=
 =?us-ascii?Q?MZKqpq8nqKcH0KGt0RX+z4WBI58UOesGHH/2cSKGdWdl+GVRhXk9ivg632/G?=
 =?us-ascii?Q?euTPdlk9mtjHlVbRaza1cJR+W7Jv3Fdwz1KtpKSSOOtzSuFamVo9mMyniV7M?=
 =?us-ascii?Q?VRFqKYWeSiJdiCcTnTPei+icYeN+dZF4jGrIyGt3Gu8aUIRa+W22ONBeIqYd?=
 =?us-ascii?Q?fiStMYG/qIFEAVH62hnGINt6Gup2i1KVjz5FLOLwCgy9KrosiDm9wepRvIro?=
 =?us-ascii?Q?ZUqz1KinwrBc9DpQf9VqPKpS8BCb14JAoB8Ar4Xlp87lffktMXfZe70YmQdA?=
 =?us-ascii?Q?zOtK4sB+hr94ctnJUPQBTGI0XzljYf4j4vj9H7icXSvpAwRn3AORKH6XdrB2?=
 =?us-ascii?Q?sE/kG/1XL3THkpghbTTLW/WOVB0+1HZXcWbNhwKy5UlkQ5mG3TsXaEn/3YQH?=
 =?us-ascii?Q?dSD9bukkdwMJ0qx/U04TBTYu/yZ7LBvVRq7/c2hcRbJlu4YBfFunpjd6ozC2?=
 =?us-ascii?Q?ZOxYxJYDYuMoFzgNg4idC8r2WnUGsCjvFnXbBw2q999fIj337rtcMPNjfAZv?=
 =?us-ascii?Q?BVJuXGCdmMDN3ZpL+hu2T7D8SEQBJ9yQiBGQ76TCiINuXqsXhaXITYpQ2oMu?=
 =?us-ascii?Q?mBKIf8Xkp4wkgjl47VzHiWGWCzLA1YCEqJWOfTHCi2A6dIMp5CZS8bzWaCOt?=
 =?us-ascii?Q?zPaHzg42vEj+59km+ersu0BNsYMkGSB4IaiIrlxJsO6+FJ5Ab+Hl/lflVHRz?=
 =?us-ascii?Q?3ZBBo6uhomMwvv1jICll0ZXEuVHRTNM2rezWmlOD0Q8ScPVaLDztK1BRzDR1?=
 =?us-ascii?Q?o7w/19Be0IfA9el0IZfYQEvGI1lwt6TF+KfBaz1dDwx1i5Ebwg5OORJflNT4?=
 =?us-ascii?Q?jJu3rl2qbyrX4Zf+m8kfdlbIItZ0t4Ns00uB0Axd2WhHwuhprfQxOJhU/oLO?=
 =?us-ascii?Q?mras0rTg/P7e3IBI0INcl2rNoc9Zhehemko47OHM13GM6S3oMYW039UDT78U?=
 =?us-ascii?Q?nC0KvDj/f8keVjNHrBfVuQqWpVql10G5AlL2KsiJb/R7Ku2+97Wh4eph331J?=
 =?us-ascii?Q?V4++ktE54ZD4Greav9Z+jSNYULQh5kXC?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR11MB9420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(4013099003)(4053099003)(7053199007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6ClOh72p1uU7vjj+wEYs3419w5vHrMfEb/0Ga4plWEaouMalHwix57N8M+O2?=
 =?us-ascii?Q?FtWCk34+pnCONwv2wjJKcA+lkvjN0lfOqSdbpOQrbEV7rPFZlpJviVTkZVlr?=
 =?us-ascii?Q?YVGDiGfDcA5IDbU8sRo9VJwonUHVF9oqmMQUidUXSz8PI4CZ50MzRwXanSlY?=
 =?us-ascii?Q?dYtJTCgIrzSgLkOauBtmdcQWD3gbdEwXyn9ujp7Nb33q0/fzKYTY5/lLciTx?=
 =?us-ascii?Q?2frElLr8ohtiJ3gSHeGDtrazvgioIEGt2+fPOyNk/Mo5aAu9RorodXv9FVmm?=
 =?us-ascii?Q?qEjihs88U3KOPRpzG/fw3E5IXYkg1k6tI+YaPeN/QkKIfe6mNoa3verQ3+/c?=
 =?us-ascii?Q?/W1kbkdYhVXAd7EECyyBGHlaNC/8BGdKINnOl1flr/3NdYJYInmPtlhhKAeN?=
 =?us-ascii?Q?/NBfODk1Tb8U4EGLWIvOTLXqW/cBnk3BAKuz+fNIIs7jMBhIaER42MVWB9oM?=
 =?us-ascii?Q?x2hM6J3AApNxDFYOa3b+WlSLiu+qOoDDHduBW/eUVocu9+O1G25LXWISz6So?=
 =?us-ascii?Q?pu1XvtU/9R4EOjI/pyEwPW/ZpXvsvHywgiXDVohSBmoRYscem8yrkvA6dlaP?=
 =?us-ascii?Q?yksbO/xoF052r/Se+ZL84lPRMbO82YCQ39Tuvs8Y+Ce0tN8ZL8fL11jESb02?=
 =?us-ascii?Q?mTDXoeGFdm/6pAnz9HBoPDZPJ6lLEhcvX1QOwe30r5mVqHYVsl4pMfjmbAsV?=
 =?us-ascii?Q?t/INk56UCmbk9XnxMqfA4vmjgIvwGj6IQkn1eOByzYpjfAhrLJK8yQcgn+dm?=
 =?us-ascii?Q?jMcgYgevb00shjc6Ch4qnrAtyvGS8EUvS0GwgbeW+r6VdAUYo6E82XczHldp?=
 =?us-ascii?Q?f5dP8Sm1W9z9FIJk42q2tUAWnfsxIeZJa9nSu9BLZYwIqm2tLVqqU5IGzzDX?=
 =?us-ascii?Q?KYaNrq3y5l14f3Pd35mYfM3nhItrvKV63cbgEDFJSGZRBuCOLOB53S24VHFQ?=
 =?us-ascii?Q?DO9EVSoDuZ4ei6WBE8UsTcsJpgnSYjf/WtCSXSut0uXtMx3ShQ+CAyQjmBWZ?=
 =?us-ascii?Q?ka0PUiY2WOBimV3Fl01WPAYTyncUF35y2XZFAfa0BesxRkQK4H9h1/2djJ+1?=
 =?us-ascii?Q?4IxbVwtwYeFZWI5WBG2Scox82f1JCNAWGAFCFH9jqi0YzkNYnpkE4TMlIo3/?=
 =?us-ascii?Q?New7ls2PBB1FPkRVh2+oUCI9EuHfpFrSGb6i5hwf5hZOm/olVIgkLHDIEbYx?=
 =?us-ascii?Q?zY3QhDd/Z0VPgN0ywJ+Hk5M4A0TQkWnFjcGOmA9deMyw9qzGmvA2f3wkxc8n?=
 =?us-ascii?Q?JLKrIrlLysFicZwaXhSCxmthiH6ZJx9pAzDQgSHXrUSeawB1+7jM1JliNa+H?=
 =?us-ascii?Q?9xbZbvaoTOQlcPOUdrkMdRfvK0iwYMunxtvSXPOVY23jf8WjF4lYRJm6vdvh?=
 =?us-ascii?Q?Jj6f/FZHAU0BqM9pumOuEamJU2H0cQhEgXWrZx0BPep0gJ3t1YOsdHmxRaD8?=
 =?us-ascii?Q?lc/2CXCfMIvHn9wy9J/YPGBzcWpuzL1yA1jj8UeSc0XQg7wEAtyFZNYWSYiH?=
 =?us-ascii?Q?oUm+pFHs4Bg2+aFPxw1Z9fuF+oK7yxqMIEg/DTZty2yrXxJaXmyAAOVyy+sw?=
 =?us-ascii?Q?zdYc95mLiTSmGJsIC8PLLxUqYTbo11TtIT8f4EnKnIDkChwMG6/MkGRhGEpn?=
 =?us-ascii?Q?2A=3D=3D?=
Content-Type: multipart/mixed;
	boundary="_002_IA4PR11MB9420632298BD69C695B6F4FFB816AIA4PR11MB9420namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed11f2d9-75c3-4cf1-127e-08ddf67e850d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2025 06:42:21.4885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mDXlpwCOMKaZ2bb/bmz2mj1MofOLqyrtcGU2tHdomPU2VTEJmjSX7W2hCuiAhR0abhnvd/XbCFOcTWQzQmq1Am0LpH9bQO72X3PM8n9742I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7871
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Jay8rVKV c=1 sm=1 tr=0 ts=68cba9d1 cx=c_pps
 a=ar5COM9M0msGq9wDbiNjNQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=Q1sTgoEvAAAA:8 a=NEAV23lmAAAA:8 a=LXCGm8LIAAAA:8 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=kAPf-d53m_-4Tkv-vFEA:9
 a=CjuIK1q_8ugA:10 a=ydqZmb1IhNkih2HYdT8A:9 a=m-Z_27IZkzAA:10
 a=FkGh3qDytyf094M0uOEt:22 a=NxI9r9ql2kHpUT0AVVEO:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA1OSBTYWx0ZWRfX6Kz/EXd07D34
 YD6NWAAkcJk26nJHCQ8sDUR02kwEOuwKYAzMgi/w8e3AjQBn9UZteyCMe/ILi+uO4P9zihiOlma
 XDmjyRHdZCWveGcU3ZqdDK8SnpuKihJiKAk3gRNdzCgbkwb4UZPZPwYcbhy+buxis4NcC44daOc
 s4uiIF3EhJ9u+3at7Wo/kpUpMjavvu3yXlKkhDZIKt7dmw+DEDztPu8YbMjUoyU6TYaFrPqegaP
 F7mmuGolwjNdLQPz/TeWoyNe1fl/I3WLqo8woM4F7O3lZ2UDyYNF2L5AVV98QMdwHgGKtM8dFsF
 NJSjwFuAb7z5X48psThF8NCJjmd9JD3tsrvkYSC756usFaiAh9kfIarmyiDrPc=
X-Proofpoint-GUID: 48ee7xEMY0A0wdwohe1A1Nn2P9DyCr4d
X-Proofpoint-ORIG-GUID: UVeRJvyg4qS47PAE_wLkJq003mu5FByN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 06:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119528

--_002_IA4PR11MB9420632298BD69C695B6F4FFB816AIA4PR11MB9420namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is the v2 patch. Kindly use the two v2 patches sent afterward. Many th=
anks!

[PATCH 1/2 v2] webkitgtk3: fix build failure with DEBUG_BUILD enabled
[PATCH 2/2 v2] webkitgtk3: fix do_configure error on beaglebone-yocto

Best regards, =20
Jiaying
-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Song, Jiaying (CN) via lists.openembedded.org
Sent: Thursday, September 18, 2025 1:42 PM
To: skandigraun@gmail.com; ankur.tyagi85@gmail.com; openembedded-devel@list=
s.openembedded.org
Subject: [oe] [meta-oe][walnascar][PATCH 1/2 v2] webkitgtk3: fix build fail=
ure with DEBUG_BUILD enabled

From: Jiaying Song <jiaying.song.cn@windriver.com>

It fails to compile webkitgtk when debug build enabled:

| /path_to//tmp/work/core2-64-poky-linux/webkitgtk3/2.48.1/webkitgtk-2.48.1=
/Source/bmalloc/libpas/src/libpas/bmalloc_heap_config.h:82:36:
  error: inlining failed in call to 'always_inline' 'pas_page_base* bmalloc=
_heap_config_page_header(uintptr_t)':
  function not considered for inlining
|    82 | PAS_BASIC_HEAP_CONFIG_DECLARATIONS(bmalloc, BMALLOC);
|       |

Add a cmake variable WEBKIT_NO_INLINE_HINTS to disable gcc function attribu=
te `always_inline` when debug build is enabled.

And adjust indent as well.

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 ...uild-failure-with-DEBUG_BUILD-enable.patch | 129 ++++++++++++++++++  ..=
.o_configure-error-on-beaglebone-yoct.patch |  53 +++++++  ...able-to-contr=
ol-macro-__PAS_ALWAYS_I.patch |  74 ++++++++++
 .../webkitgtk/webkitgtk3_2.48.1.bb            |   4 +-
 4 files changed, 259 insertions(+), 1 deletion(-)  create mode 100644 meta=
-oe/recipes-support/webkitgtk/0001-webkitgtk3-fix-build-failure-with-DEBUG_=
BUILD-enable.patch
 create mode 100644 meta-oe/recipes-support/webkitgtk/0002-webkitgtk3-fix-d=
o_configure-error-on-beaglebone-yoct.patch
 create mode 100644 meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake=
-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch

diff --git a/meta-oe/recipes-support/webkitgtk/0001-webkitgtk3-fix-build-fa=
ilure-with-DEBUG_BUILD-enable.patch b/meta-oe/recipes-support/webkitgtk/000=
1-webkitgtk3-fix-build-failure-with-DEBUG_BUILD-enable.patch
new file mode 100644
index 0000000000..d5c22f9621
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/0001-webkitgtk3-fix-build-failur
+++ e-with-DEBUG_BUILD-enable.patch
@@ -0,0 +1,129 @@
+From 48c9ac56f9df4e3f31e4712dd5a305ec7afb9403 Mon Sep 17 00:00:00 2001
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+Date: Thu, 18 Sep 2025 11:17:56 +0800
+Subject: [meta-oe][walnascar][PATCH 1/2] webkitgtk3: fix build failure=20
+with DEBUG_BUILD enabled
+
+It fails to compile webkitgtk when debug build enabled:
+
+| /path_to//tmp/work/core2-64-poky-linux/webkitgtk3/2.48.1/webkitgtk-2.48.=
1/Source/bmalloc/libpas/src/libpas/bmalloc_heap_config.h:82:36:
+  error: inlining failed in call to 'always_inline' 'pas_page_base* bmallo=
c_heap_config_page_header(uintptr_t)':
+  function not considered for inlining
+|    82 | PAS_BASIC_HEAP_CONFIG_DECLARATIONS(bmalloc, BMALLOC);
+|       |
+
+Add a cmake variable WEBKIT_NO_INLINE_HINTS to disable gcc function attrib=
ute `always_inline` when debug build is enabled.
+
+And adjust indent as well.
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ ...able-to-control-macro-__PAS_ALWAYS_I.patch | 74 +++++++++++++++++++
+ .../webkitgtk/webkitgtk3_2.48.1.bb            |  4 +-
+ 2 files changed, 77 insertions(+), 1 deletion(-)  create mode 100644=20
+meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variable-
+to-control-macro-__PAS_ALWAYS_I.patch
+
+diff --git=20
+a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variabl
+e-to-control-macro-__PAS_ALWAYS_I.patch=20
+b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-variabl
+e-to-control-macro-__PAS_ALWAYS_I.patch
+new file mode 100644
+index 0000000000..b1139b857e
+--- /dev/null
++++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-var
++++ iable-to-control-macro-__PAS_ALWAYS_I.patch
+@@ -0,0 +1,74 @@
++From bbf661310448d430350eb2ad8c5869ace648dcf8 Mon Sep 17 00:00:00 2001
++From: Kai Kang <kai.kang@windriver.com>
++Date: Fri, 11 Aug 2023 14:20:48 +0800
++Subject: [PATCH] Add a variable to control macro =20
++__PAS_ALWAYS_INLINE_BUT_NOT_INLINE
++ https://bugs.webkit.org/show_bug.cgi?id=3D260065
++
++Reviewed by NOBODY (OOPS!).
++
++It fails to compile webkitgtk with option `-Og` of gcc/g++:
++
++| In file included from Source/bmalloc/libpas/src/libpas/pas_heap_page_pr=
ovider.h:30,
++|                  from Source/bmalloc/libpas/src/libpas/pas_bootstrap_he=
ap_page_provider.h:29,
++|                  from Source/bmalloc/libpas/src/libpas/pas_large_heap_p=
hysical_page_sharing_cache.h:29,
++|                  from Source/bmalloc/libpas/src/libpas/pas_basic_heap_p=
age_caches.h:29,
++|                  from Source/bmalloc/libpas/src/libpas/pas_heap_config_=
utils.h:32,
++|                  from Source/bmalloc/libpas/src/libpas/bmalloc_heap_con=
fig.h:34,
++|                  from Source/bmalloc/libpas/src/libpas/bmalloc_heap_inl=
ines.h:34,
++|                  from Source/bmalloc/bmalloc/bmalloc.h:39,
++|                  from Source/bmalloc/bmalloc/bmalloc.cpp:26:
++| In function 'pas_allocation_result pas_local_allocator_try_allocate(pas=
_local_allocator*, size_t, size_t, pas_heap_config, pas_allocator_counts*, =
pas_allocation_result_filter)',
++|     inlined from 'pas_allocation_result pas_try_allocate_common_impl_fa=
st(pas_heap_config, pas_allocator_counts*, pas_allocation_result_filter, pa=
s_local_allocator*, size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/lib=
pas/src/libpas/pas_try_allocate_common.h:85:46,
++|     inlined from 'pas_allocation_result bmalloc_try_allocate_with_align=
ment_impl_impl_fast(pas_local_allocator*, size_t, size_t)' at webkitgtk-2.4=
0.2/Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h:59:1,
++|     inlined from 'pas_allocation_result pas_try_allocate_intrinsic_impl=
_casual_case(__pas_heap*, size_t, size_t, pas_intrinsic_heap_support*, pas_=
heap_config, pas_try_allocate_common_fast, pas_try_allocate_common_slow, pa=
s_intrinsic_heap_designation_mode)' at webkitgtk-2.40.2/Source/bmalloc/libp=
as/src/libpas/pas_try_allocate_intrinsic.h:167:44,
++|     inlined from 'pas_allocation_result bmalloc_try_allocate_with_align=
ment_impl_casual_case(size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/l=
ibpas/src/libpas/bmalloc_heap_inlines.h:59:1:
++| webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/pas_allocation_result=
.h:76:1: error: inlining failed in call to 'always_inline' 'pas_allocation_=
result pas_allocation_result_identity(pas_allocation_result)': function not=
 considered for inlining
++|    76 | pas_allocation_result_identity(pas_allocation_result result)
++|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
++
++Add an variable `WEBKIT_NO_INLINE_HINTS` to control macro=20
++__PAS_ALWAYS_INLINE_BUT_NOT_INLINE whether includes function attribute=20
++`always_inline`. It could set the variable to make compilation pass=20
++when gcc option `-Og` is used.
++
++* Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h:
++* Source/cmake/WebKitCompilerFlags.cmake:
++
++Upstream-Status: Submitted=20
++[https://github.com/WebKit/WebKit/pull/16601]
++
++Signed-off-by: Kai Kang <kai.kang@windriver.com>
++Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
++---
++ Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h | 2 +-
++ Source/cmake/WebKitCompilerFlags.cmake              | 7 +++++++
++ 2 files changed, 8 insertions(+), 1 deletion(-)
++
++diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h=20
++b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
++index 5d5fb38c..a554f700 100644
++--- a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
+++++ b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
++@@ -44,7 +44,7 @@ __PAS_BEGIN_EXTERN_C;  #define __SUSPICIOUS__ =20
++#define __BROKEN__
++=20
++-#ifdef __OPTIMIZE__
+++#if defined(__OPTIMIZE__) && !defined(WEBKIT_NO_INLINE_HINTS)
++ #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE=20
++__attribute__((__always_inline__))
++ #else
++ #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
++diff --git a/Source/cmake/WebKitCompilerFlags.cmake=20
++b/Source/cmake/WebKitCompilerFlags.cmake
++index f5ec0a55..dfd741e7 100644
++--- a/Source/cmake/WebKitCompilerFlags.cmake
+++++ b/Source/cmake/WebKitCompilerFlags.cmake
++@@ -503,3 +503,10 @@ endif ()
++=20
++ # FIXME: Enable pre-compiled headers for all ports=20
++ <https://webkit.org/b/139438> set(CMAKE_DISABLE_PRECOMPILE_HEADERS=20
++ ON)
+++
+++# It fails to compile with `gcc -Og`
+++set(WEBKIT_NO_INLINE_HINTS OFF CACHE BOOL "Disable funtion attribute=20
+++always_inline for WebKit")
+++
+++if (WEBKIT_NO_INLINE_HINTS)
+++    add_definitions(-DWEBKIT_NO_INLINE_HINTS)
+++endif ()
+diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb=20
+b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
+index b03ed3cbb9..c3d2169102 100644
+--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
++++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
+@@ -21,6 +21,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/webkitgt=
k-${PV}.tar.xz \
+            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-sh=
ow.patch \
+            file://fix-typo-denormaldisabler.patch \
+            file://fix-ftbfs-riscv64.patch \
++          =20
++ file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patc
++ h \
+            "
+ SRC_URI[sha256sum] =3D "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a9=
3f71dbfa1eb258f"
+=20
+@@ -99,7 +100,8 @@ EXTRA_OECMAKE =3D " \
+ 	-DUSE_GTK4=3DOFF \
+ 	${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=
=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \
+ 	${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=
=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \
+-	-DENABLE_MINIBROWSER=3DON \
++	${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=3DON', '-DW=
EBKIT_NO_INLINE_HINTS=3DOFFF', d)} \
++        -DENABLE_MINIBROWSER=3DON \
+ 	-DCMAKE_EXPORT_COMPILE_COMMANDS=3DOFF \
+ 		"
+ # pass -g1 to massively reduce the size of the debug symbols (4.3GB to=20
+700M at time of writing)
+--
+2.34.1
+
diff --git a/meta-oe/recipes-support/webkitgtk/0002-webkitgtk3-fix-do_confi=
gure-error-on-beaglebone-yoct.patch b/meta-oe/recipes-support/webkitgtk/000=
2-webkitgtk3-fix-do_configure-error-on-beaglebone-yoct.patch
new file mode 100644
index 0000000000..9947601c16
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/0002-webkitgtk3-fix-do_configure
+++ -error-on-beaglebone-yoct.patch
@@ -0,0 +1,53 @@
+From d553c5a2a4827b5dd1a1ec971649231f4d2624ce Mon Sep 17 00:00:00 2001
+From: Jiaying Song <jiaying.song.cn@windriver.com>
+Date: Thu, 18 Sep 2025 11:19:09 +0800
+Subject: [meta-oe][walnascar][PATCH 2/2] webkitgtk3: fix do_configure=20
+error on beaglebone-yocto
+
+* According to latest comment [1] and the mentioned pull request [2],
+  build an ENABLE(WEBASSEMBLY) && !ENABLE(JIT) configuration is
+  supported, so original issue already fixed in current version, the
+  EXTRA_OECMAKE setting is not needed anymore.
+
+* This EXTRA_OECMAKE setting causes following configure error on
+  beaglebone-yocto, remove the setting to let the configure process
+  decide the configuration:
+  CMake Error at Source/cmake/WebKitFeatures.cmake:312 (message):
+  ENABLE_JIT conflicts with ENABLE_C_LOOP.You must disable one or the
+  other.
+
+[YOCTO #15254]
+
+[1] https://github.com/WebKit/WebKit/pull/17447
+[2] https://github.com/WebKit/WebKit/pull/17688
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ .../recipes-support/webkitgtk/webkitgtk3_2.48.1.bb   | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb=20
+b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
+index c3d2169102..61be8b2cbf 100644
+--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
++++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
+@@ -126,18 +126,6 @@ EXTRA_OECMAKE:append:armv4 =3D " -DENABLE_JIT=3DOFF "
+ EXTRA_OECMAKE:append:armv5 =3D " -DENABLE_JIT=3DOFF "
+ EXTRA_OECMAKE:append:armv6 =3D " -DENABLE_JIT=3DOFF "
+=20
+-# And for armv7* don't enable it for softfp, because after:
+-#=20
+https://github.com/WebKit/WebKit/commit/a2ec4ef1997d6fafa6ffc607bffb54e
+76168a918 -# https://bugs.webkit.org/show_bug.cgi?id=3D242172
+-# softfp armv7* fails because WEBASSEMBLY is left enabled by default=20
+and JIT gets -# explicitly disabled causing:
+-# http://errors.yoctoproject.org/Errors/Details/734587/
+-# PR was sent upstream, but the end result is the same both JIT and=20
+WEBASSEMBLY disabled -# https://github.com/WebKit/WebKit/pull/17447
+-EXTRA_OECMAKE:append:armv7a =3D " -DENABLE_JIT=3D${@bb.utils.contains('TU=
NE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
+-EXTRA_OECMAKE:append:armv7r =3D " -DENABLE_JIT=3D${@bb.utils.contains('TU=
NE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
+-EXTRA_OECMAKE:append:armv7ve =3D " -DENABLE_JIT=3D${@bb.utils.contains('T=
UNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
+-
+ # JIT does not work on RISCV
+ EXTRA_OECMAKE:append:riscv32 =3D " -DENABLE_JIT=3DOFF"
+=20
+--
+2.34.1
+
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-=
variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta-oe/recipes-support/we=
bkitgtk/webkitgtk3/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_=
I.patch
new file mode 100644
index 0000000000..b1139b857e
--- /dev/null
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3/0001-CMake-Add-a-vari
+++ able-to-control-macro-__PAS_ALWAYS_I.patch
@@ -0,0 +1,74 @@
+From bbf661310448d430350eb2ad8c5869ace648dcf8 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Fri, 11 Aug 2023 14:20:48 +0800
+Subject: [PATCH] Add a variable to control macro =20
+__PAS_ALWAYS_INLINE_BUT_NOT_INLINE
+ https://bugs.webkit.org/show_bug.cgi?id=3D260065
+
+Reviewed by NOBODY (OOPS!).
+
+It fails to compile webkitgtk with option `-Og` of gcc/g++:
+
+| In file included from Source/bmalloc/libpas/src/libpas/pas_heap_page_pro=
vider.h:30,
+|                  from Source/bmalloc/libpas/src/libpas/pas_bootstrap_hea=
p_page_provider.h:29,
+|                  from Source/bmalloc/libpas/src/libpas/pas_large_heap_ph=
ysical_page_sharing_cache.h:29,
+|                  from Source/bmalloc/libpas/src/libpas/pas_basic_heap_pa=
ge_caches.h:29,
+|                  from Source/bmalloc/libpas/src/libpas/pas_heap_config_u=
tils.h:32,
+|                  from Source/bmalloc/libpas/src/libpas/bmalloc_heap_conf=
ig.h:34,
+|                  from Source/bmalloc/libpas/src/libpas/bmalloc_heap_inli=
nes.h:34,
+|                  from Source/bmalloc/bmalloc/bmalloc.h:39,
+|                  from Source/bmalloc/bmalloc/bmalloc.cpp:26:
+| In function 'pas_allocation_result pas_local_allocator_try_allocate(pas_=
local_allocator*, size_t, size_t, pas_heap_config, pas_allocator_counts*, p=
as_allocation_result_filter)',
+|     inlined from 'pas_allocation_result pas_try_allocate_common_impl_fas=
t(pas_heap_config, pas_allocator_counts*, pas_allocation_result_filter, pas=
_local_allocator*, size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/libp=
as/src/libpas/pas_try_allocate_common.h:85:46,
+|     inlined from 'pas_allocation_result bmalloc_try_allocate_with_alignm=
ent_impl_impl_fast(pas_local_allocator*, size_t, size_t)' at webkitgtk-2.40=
.2/Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h:59:1,
+|     inlined from 'pas_allocation_result pas_try_allocate_intrinsic_impl_=
casual_case(__pas_heap*, size_t, size_t, pas_intrinsic_heap_support*, pas_h=
eap_config, pas_try_allocate_common_fast, pas_try_allocate_common_slow, pas=
_intrinsic_heap_designation_mode)' at webkitgtk-2.40.2/Source/bmalloc/libpa=
s/src/libpas/pas_try_allocate_intrinsic.h:167:44,
+|     inlined from 'pas_allocation_result bmalloc_try_allocate_with_alignm=
ent_impl_casual_case(size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/li=
bpas/src/libpas/bmalloc_heap_inlines.h:59:1:
+| webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/pas_allocation_result.=
h:76:1: error: inlining failed in call to 'always_inline' 'pas_allocation_r=
esult pas_allocation_result_identity(pas_allocation_result)': function not =
considered for inlining
+|    76 | pas_allocation_result_identity(pas_allocation_result result)
+|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Add an variable `WEBKIT_NO_INLINE_HINTS` to control macro=20
+__PAS_ALWAYS_INLINE_BUT_NOT_INLINE whether includes function attribute=20
+`always_inline`. It could set the variable to make compilation pass=20
+when gcc option `-Og` is used.
+
+* Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h:
+* Source/cmake/WebKitCompilerFlags.cmake:
+
+Upstream-Status: Submitted=20
+[https://github.com/WebKit/WebKit/pull/16601]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h | 2 +-
+ Source/cmake/WebKitCompilerFlags.cmake              | 7 +++++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h=20
+b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
+index 5d5fb38c..a554f700 100644
+--- a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
++++ b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
+@@ -44,7 +44,7 @@ __PAS_BEGIN_EXTERN_C;  #define __SUSPICIOUS__ =20
+#define __BROKEN__
+=20
+-#ifdef __OPTIMIZE__
++#if defined(__OPTIMIZE__) && !defined(WEBKIT_NO_INLINE_HINTS)
+ #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE=20
+__attribute__((__always_inline__))
+ #else
+ #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
+diff --git a/Source/cmake/WebKitCompilerFlags.cmake=20
+b/Source/cmake/WebKitCompilerFlags.cmake
+index f5ec0a55..dfd741e7 100644
+--- a/Source/cmake/WebKitCompilerFlags.cmake
++++ b/Source/cmake/WebKitCompilerFlags.cmake
+@@ -503,3 +503,10 @@ endif ()
+=20
+ # FIXME: Enable pre-compiled headers for all ports=20
+ <https://webkit.org/b/139438> set(CMAKE_DISABLE_PRECOMPILE_HEADERS ON)
++
++# It fails to compile with `gcc -Og`
++set(WEBKIT_NO_INLINE_HINTS OFF CACHE BOOL "Disable funtion attribute=20
++always_inline for WebKit")
++
++if (WEBKIT_NO_INLINE_HINTS)
++    add_definitions(-DWEBKIT_NO_INLINE_HINTS)
++endif ()
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb b/meta-=
oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
index b03ed3cbb9..9f44dfa924 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.48.1.bb
@@ -21,6 +21,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/webkitgtk=
-${PV}.tar.xz \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-sho=
w.patch \
            file://fix-typo-denormaldisabler.patch \
            file://fix-ftbfs-riscv64.patch \
+          =20
+ file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch=20
+ \
            "
 SRC_URI[sha256sum] =3D "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93=
f71dbfa1eb258f"
=20
@@ -99,7 +100,8 @@ EXTRA_OECMAKE =3D " \
 	-DUSE_GTK4=3DOFF \
 	${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=
=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \
 	${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=
=3DON', '-DENABLE_DOCUMENTATION=3DOFF', d)} \
-	-DENABLE_MINIBROWSER=3DON \
+	${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=3DON', '-DWE=
BKIT_NO_INLINE_HINTS=3DOFF', d)} \
+        -DENABLE_MINIBROWSER=3DON \
 	-DCMAKE_EXPORT_COMPILE_COMMANDS=3DOFF \
 		"
 # pass -g1 to massively reduce the size of the debug symbols (4.3GB to 700=
M at time of writing)
--
2.34.1


--_002_IA4PR11MB9420632298BD69C695B6F4FFB816AIA4PR11MB9420namp_
Content-Type: text/plain; name="ATT00001.txt"
Content-Description: ATT00001.txt
Content-Disposition: attachment; filename="ATT00001.txt"; size=440;
	creation-date="Thu, 18 Sep 2025 05:42:16 GMT";
	modification-date="Thu, 18 Sep 2025 06:42:20 GMT"
Content-ID: <CDC592F21C696149834F336323CB9AF9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

DQotPS09LT0tPS09LT0tPS09LT0tPS09LQ0KTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdl
cyBzZW50IHRvIHRoaXMgZ3JvdXAuDQpWaWV3L1JlcGx5IE9ubGluZSAoIzExOTUyMSk6IGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzEx
OTUyMQ0KTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQv
MTE1MzA1NDcyLzg1NzU2NzANCkdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1YiBbSmlheWluZy5Tb25nLkNOQHdp
bmRyaXZlci5jb21dDQotPS09LT0tPS09LT0tPS09LT0tPS09LQ0KDQo=

--_002_IA4PR11MB9420632298BD69C695B6F4FFB816AIA4PR11MB9420namp_--

