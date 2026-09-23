Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D435DC98302
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 05:10:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.552.1790140130310065528
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Sep 2026 22:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kxxtY2f2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=372678bdcb=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3ipHp1559108
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2026 22:08:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Q1IC0sh0nC6huZDwdY9rJ7
	szMEZOKgO9SY9iG1hN/B8=; b=kxxtY2f2Vaw25qmDiI69d/3KZ1M2v6bd149Ywo
	+wtnk3U0O2VOl+XPx+QI7RLKoMc66bT/YOwSvlMX11zQRtaNhOvavT531LaXLlzo
	rWUNnmSm9cElTbZsz9D8Yz8RclQ8HJ89597+unqu5Vf83Re41vkJVKKLew/MsYAK
	U2X9JDiHwGmItXqm5YNyFSqjBu3dH5bNpYVTxN5rchI/4VP+bbyEDmyCS3FSz4Sz
	VZiLXCpoNMFJgDMA7rPDWH7usf6cREEBESjiKt6xPRqljYPyCnhvYo4FwM5wQxeu
	PGXltwW3GMW9lyRI5DgAG53IbJid8/T+1AkygbhLpxvu1SgA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022087.outbound.protection.outlook.com [40.93.195.87])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gsswe5j6t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2026 22:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUflSeijGFf5CrALOVAFqs11S8Y6q/0q4GGA84VX7XJz0Z202w18ybECDQnyB7mXjknmrFfeSYTXBoDJlDw7YOrA0R/pWalDPhkX9Q6LMFIG24iE7eTNzato2VBQxJvh3+meDr35Ty1U2I7WvvAMyEFMHZ3Nn0bbyDjtKO3JIPS5+sClBS6fxCdvrY3TlykmP1nD/8L7jWqYgM+3k6G2EK/XuOJXk4oqp3w43DPi/t933vViMKyvne4T97UeNNQPWOnMoMb+YZpLnn7fvoPs7oQ07GyR2hBgYAJ9R65c8HXHhdbKaQoH11B7lC0KKnYqiQtzOIPMN4c9vedqdjmhnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1IC0sh0nC6huZDwdY9rJ7szMEZOKgO9SY9iG1hN/B8=;
 b=Savj/rWoQVEPVKGud9ZgwvGNqCMiA8/sCekFWyHgXGRz3X3Bbuu4ITxpHm/eB+wGra2o8ASf/JccjpmkeLIYcUruqT/Tv9mabVgMuu47NxxPBnbxuW6C5ReZMQRZNGGe6Q/CqzGgoBJKEq6diXslJyOdsTu2yJcAzMm1URQ9C8MOFt08wSgrx2sXAZ6uF/LEEQGYmGpVuvakd11YS70jwfAeNIwHleoqy4MtTdv1p8ECpAsGCrgxJLRhixL9IrKdedAagQS27VWAPLXzxqFdgqjzvqK9CqN1J3X/Gu5f2vzW6tsSMMEkzhQq3z6Ttx4/Xs+cc0ZG+ULuEJNMlmrEjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM3PR11MB8758.namprd11.prod.outlook.com (2603:10b6:0:47::15) by
 PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 05:08:46 +0000
Received: from DM3PR11MB8758.namprd11.prod.outlook.com
 ([fe80::a457:7d37:d8f:7340]) by DM3PR11MB8758.namprd11.prod.outlook.com
 ([fe80::a457:7d37:d8f:7340%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 05:08:46 +0000
From: "Barde, Himani Ramesh" <HimaniRamesh.Barde@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "Term Li, Changqing" <Changqing.Li@windriver.com>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: Re: [PATCH] systemd.bbclass: fix service enablement for cross-install scenarios
Thread-Topic: [PATCH] systemd.bbclass: fix service enablement for
 cross-install scenarios
Thread-Index: AQHdSxhwGQ831X0yWkisXR7F0+YH1rbbnPKs
Date: Wed, 23 Sep 2026 05:08:46 +0000
Message-ID: 
 <DM3PR11MB8758EE1ABFD4FC8C4ADE26408F822@DM3PR11MB8758.namprd11.prod.outlook.com>
References: <20260923045909.1561330-1-HimaniRamesh.Barde@windriver.com>
 <20260923045909.1561330-2-HimaniRamesh.Barde@windriver.com>
In-Reply-To: <20260923045909.1561330-2-HimaniRamesh.Barde@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-09-23T05:08:46.520Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PR11MB8758:EE_|PH7PR11MB6978:EE_
x-ms-office365-filtering-correlation-id: a6bdfaf0-29c0-4679-fe74-08df1930bedd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|6133799003|8096899003|11063799006|18002099003|4143699003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 HGN97thdocA9+WCi6s4RhqHwgvovcidrsZTF0iT9TsBLOjcgQBtsk64FQJAVNtboTN2WZDJXKp+ZiWT5c2jiUhOxSk4cLzuznAN8qlbjgiDlut/6AiHbsvOVQV1bVoCHmLhZv87KyCOeLmYJz6PyL+mMOEAVv+BQzgZ7WtMpBFr35ujp5vt7CwkwQDgiVmTQy8Aur0zJkR7vo091RFEMW5PkXdyjg/bdt2prCe4mUGAeVTNWaCI3Vv0JmxEKdez1er4IXrZ/gz2EAf13o3A3L+KED8pbmGcF1QEky5f4qdL5LMclkfHItki+wKbllq0jhPDHfNS+LxuWwWH017oRVFsuv/F9mYBBgFZz8jJBEMXrfaLkwrD+9/rMqiDqtzphg0+zc2J2ZSlaAj0UxSCZgLcgpSY3+/FqatQ/AtQTvpalGQoRe0+2kForBm5RMwe3cRynZ5OUV2fJKyfmiwIb255GCQhRSCr+C32cCzUVPTmY2APs2HGR8Lf00EVmCyX4HEMVqK7TvR//4m7XYeNyNcWr4M5RegtcrNaPLdxSRl8P3o8v5OofhPWcBwa+9CMDpCrJ4cbGoTQNLAbetnhhzPZWTapsZquOtwpa19t8Xiiu/gNMZxekqEhO0dJL4H97ctsjGtXG3vVQE2ueEW89KFS9XYHkTT7F/ROhMHlBxZIsaZ9cGVyaqVhTPnY0TVeY0jABlxi5WQTet/lfii9dzSv0zNZg54Vr/YR6Nv5WDgo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR11MB8758.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(6133799003)(8096899003)(11063799006)(18002099003)(4143699003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?QpJJvfA9tbLMcO62oRi5ckI2orq2R93rZP+2Nr8MQtDGizhJ0JzOo9Mb?=
 =?Windows-1252?Q?CkYdnO++8ggCIpAUpiFGFE035Kaa1evxMyXyyje5w6fmzafEBU5VuM4J?=
 =?Windows-1252?Q?pEZ7GLoh5GA8WVPe3CgrWJ/fdpyzE7qtLSWD+BwMqXV4m0LPs6ReNl89?=
 =?Windows-1252?Q?hocXQR97++k8bLn/7V+bwcw45i5yJMcQZNxhKwFbUr/Zd1KXb4/32R0c?=
 =?Windows-1252?Q?cRsLrRZ+tdNdawP6ez3xivyQIPfFQazM4lIJA0/10rc+pWY94DIUwm1U?=
 =?Windows-1252?Q?9qol4CX5JXtSH9p760BH/Fuo15/Jh+FNimmD8Kz6bhMFJoSvjhQF+JEK?=
 =?Windows-1252?Q?/5wWeZtPzMriGqcGq3dot4jSzMiQnUWqj5ZtZ6uiqQYgrkPPANGT/VIw?=
 =?Windows-1252?Q?/QB07QlfSmNEN/7AslcrB9UmRtke+nYUcae1yBqhdmIkSt7KxH2iEn5Q?=
 =?Windows-1252?Q?DUW6W1SJx5bE/8fQ1Fd1mepA1hHznL2Po0AoWUhrZwDr2KGSuBEacWUK?=
 =?Windows-1252?Q?nYYxt+K2lbdT/4QcmRpc7r3m4tlYTUW80U9hVmPAWLk222NNI8cRbrRg?=
 =?Windows-1252?Q?zglaZBcGFj6UhSrLOAyOQWeB6BbTC2Y6OPyvi4c7Ty7MRSlY7ONZEJRe?=
 =?Windows-1252?Q?lyE++9dvNiMTqQXSixb4SF6JbKCJxefxrwpfn6aAluLDd5xBJSLpNjQJ?=
 =?Windows-1252?Q?kkGHSGkQpGcW4iQVLpdJ5KyVuwM1JHXpSrwacvW0Un/nw1ou+i8qPg+W?=
 =?Windows-1252?Q?OPqy/awUQyC+hDc/f9Snnr2PwS3lAGMl6rdbEwNCeEeCsoDRsUrSgHq0?=
 =?Windows-1252?Q?tsq+SK32UbSPwcclSXw8iz+KE4dVOa03i3OL9GGN9nzwccvRdVnPxeBt?=
 =?Windows-1252?Q?hMljHdyrhk0k8EZ0yP2egZFtJjU+i6oPBD7s/jhdas+t121+5pAq9FnF?=
 =?Windows-1252?Q?Ak0FWtdYiJAp4LLwCEodUEoPypivxaEMiaMzkQ2FjRdZZH1dWivWD4Te?=
 =?Windows-1252?Q?RvjmUbpn3RWfRTeSgwuKWa89btNYVszl59cOy7roo9a9Oe0xc5rMHbkD?=
 =?Windows-1252?Q?o+vN2ILW8AfrXOapln0pEgTn99jqWXX8rYZkCHyPjTC/r6Fu3zkgiVsH?=
 =?Windows-1252?Q?buYeTGW9teT4nsxeWk8gs5gibWLL8nKJTS2q8C4/sVIdUOUU1Oa7oSla?=
 =?Windows-1252?Q?+IwIRczHF5K5u2w5E9CBfPTps1l1+4g6fUljnEEE+KCoiMm1OP7WsVy6?=
 =?Windows-1252?Q?/OL6q1KU7d2mSwImRFzh15bAlhMFQp+rryyXaRgIgiNzuKuU/zo2shtX?=
 =?Windows-1252?Q?WWY1rikHLrfxOHQ6U3n7F5/Rw8yVpQQE/vkaDgjTl68VrnmaQx9DaR5U?=
 =?Windows-1252?Q?QQ8ctVu9aQiD/4ldlVvz4Uu3m99y+/H7rw6ZRXLDkzQILAf3OjT6KKEV?=
 =?Windows-1252?Q?mCDy6uZfEHzeYeuxF9pllhn81LnptMg8P/gAvmIv6Rv2XNvx67RYUHEV?=
 =?Windows-1252?Q?QAt9jQkfOKM1ZnZcA8doiqy7vyCzpnqCBVDAqOVNBZh4/Kvx3ky8cfhh?=
 =?Windows-1252?Q?K9+MWdwB2oTPoURZoIM3cVBvr0DJb5v2HG2iS9frz8vFDZJKvZOq0ndx?=
 =?Windows-1252?Q?9QkI7/VTYZQy4eDThypwij3trHcV1HbE7/JkWnisQUTTJQO7IwjkcaiU?=
 =?Windows-1252?Q?m20NbFNs/MOeBYYzhLSDlQDQkpdS5TESb8Y9+F4CKaznrdHEnMWs75ip?=
 =?Windows-1252?Q?SnQDVknijniuLedPRRLqNeQMrd8ehMQYFtf6vShwng5BPPc6Qvvv9gsi?=
 =?Windows-1252?Q?oQaQslWsC0zRJl8i/5w5jAf5ni7s0HN03saW/qrD04AQvOezMhoScgyy?=
 =?Windows-1252?Q?ff5aYqmR1oPMvvoXeQhm4t66EgizUy/WoPQ=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	rY68VKgHMKkukiWRJwRxy3jjXCRjsBRIPp5jSmWUNrimYuv57JW6kZ9eAGr9tvNoMFPW95UEy+Hw1AOV8hCzwaroGUBsknh3wAY+YGN8JVm7NkdsgjKTRJfFxe+OzD2E5PfgzHCXGgvABezXFrAWvbYGtvn6ELsmtK1XI5Olt4gKBMcvTPiKBGMwNqiqkPfX0X1xc5+47skyvD4zeB6VEbURo6t++9BKQe7brwMHQ96a2LUKxfJK8qBZMUuKw+8yCHVvzLvI/UxtMKyLuLlrlopck/BKpTuxOdcwZyNv0pOM0LyRDhZoPIN5xJChEJ952eQjqPhIUzpELhJgpr+znA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PR11MB8758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bdfaf0-29c0-4679-fe74-08df1930bedd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 05:08:46.1108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fnAsPFhqlpRPCIQVQlc58iNSSFSZzPDeVrFvUPF3lgzYOLc9skPh5T7TEWTJw+L0AK7+o0WFiQ/F2FMGDm/HpQV4OJa6OKzzxfsk5Acyo/pf0bUjZ74S5uTY9wM1VLmh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6978
X-Proofpoint-GUID: z_QD9vGtRR47MSTZVCbweHN-iYfEczGv
X-Authority-Analysis: v=2.4 cv=WLrqzXsR c=1 sm=1 tr=0 ts=6ab35ee1 cx=c_pps
 a=7r/ioy5s1gfMry3CYkvllQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=spj_etgbkO9Dx5dJzeIA:9 a=pILNOxqGKmIA:10
 a=crFupLtN2iERuLO7QlEA:9 a=Ek44rEKa9iJ6pnti:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyMCBTYWx0ZWRfXyxuU9bq1lqQr
 DMg/u6q9iEGumsYplo0oiPP00eFjmz/JsD94+AE1s/OFDvx98K6+0mwGbux6+ZErM9op/DHn6Cz
 hODpp/9BLTuDk5UPQa1vOV2B7Vz+DRh9fIKB+qap0sws/TXKqkbwyUyzQcsiIo1QwqTeSXJSF+G
 uNOf9g23ZvZN488jKUCwsyDD9RxJzIJIY1kwWqCTJumF2q0v6Y/RjEsC3Gxs/bPasTNsxaulTW9
 j8yuPD7T2kEf4wObrXuOU9R5GSHaVi23/6FqKPNiZgjJXchcxsNAgVyHbRoVv4RzzD9RnaKkadQ
 RImm67sMInFILcALYRgt4YupIwdNZSZ9FkLx126Q5HlhsIsIOS5msdggrZbi7X3szWhzSVRhLUi
 96jEkhbWSM7UYMjpItcN3dCnW8/pDms67wEMlGu7LGgjvutJYXY2s8icui0J1ZFZTAp4+b/We1X
 cvJeJOLbu/shIV+DMng==
X-Proofpoint-ORIG-GUID: z_QD9vGtRR47MSTZVCbweHN-iYfEczGv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyMCBTYWx0ZWRfXwMKDJc+N/JmU
 7yGii7GNJMk2MY6c0P4bQTK54glqvr13X/4GCgHF2ydomB1ExQzAA/HmttiS+SGBNJ8hkzXCCif
 +7asC4m8DQvYiOi3OWEYG67/J8XYul7Rac4J4zzGN5tJ0d2pzFdn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230020
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM3PR11MB8758EE1ABFD4FC8C4ADE26408F822DM3PR11MB8758namp_"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 05:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130182

--_000_DM3PR11MB8758EE1ABFD4FC8C4ADE26408F822DM3PR11MB8758namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Please ignore/drop this patch for now. I need to rework it before it's read=
y for review =97 I'll send a v2 once it's sorted.
Apologies for the noise.

Thanks,
Himani


________________________________
From: Barde, Himani Ramesh <HimaniRamesh.Barde@windriver.com>
Sent: Wednesday, September 23, 2026 10:29 AM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Cc: Term Li, Changqing <Changqing.Li@windriver.com>; MacLeod, Randy <Randy.=
MacLeod@windriver.com>; Barde, Himani Ramesh <HimaniRamesh.Barde@windriver.=
com>
Subject: [PATCH] systemd.bbclass: fix service enablement for cross-install =
scenarios

When packages are installed outside of Yocto's normal image creation
(e.g., using multistrap, debootstrap, or dpkg directly on a host),
the postinst script fails to enable systemd services.

The issue is that the entire enable logic is gated behind
"if systemctl >/dev/null 2>/dev/null". In cross-install scenarios:
- If systemctl is absent on the host: the check fails, script is skipped
- If host systemctl is present: it cannot find target unit files

Fix this by separating the offline ($D set) and online ($D unset)
code paths into distinct branches. The previous code used a single
OPTS variable to switch between "--root=3D$D" (offline) and "" (online)
within one unified block. This variable is removed because the two
scenarios now have dedicated branches with different logic:

- Offline ($D set): Tries "systemctl --root=3D$D preset" first, which
  reads preset files from the target rootfs and creates symlinks
  without needing the host systemctl to understand the target's unit
  files. Falls back to "systemctl --root=3D$D enable" per service.

- Online ($D unset): Same as before - enable, daemon-reload, preset,
  restart. No behavioral change for on-target installs.

The OPTS variable is no longer needed because each branch now directly
uses the appropriate systemctl invocation for its context, making the
intent clearer and the offline path functional.

Fixes [YOCTO #14118]

Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
---
 meta/classes-recipe/systemd.bbclass | 32 +++++++++++++++++------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 0f7e3b5..2f655c4 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -29,26 +29,32 @@ python __anonymous() {
 }

 systemd_postinst() {
-if systemctl >/dev/null 2>/dev/null; then
-       OPTS=3D""
-
-       if [ -n "$D" ]; then
-               OPTS=3D"--root=3D$D"
+if [ -n "$D" ]; then
+       # Offline/cross-install: apply presets to the target rootfs.
+       # This handles multistrap, debootstrap, and similar tools that
+       # install packages outside of Yocto's normal image creation.
+       if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
+               if systemctl --root=3D$D preset ${SYSTEMD_SERVICE_ESCAPED} =
2>/dev/null; then
+                       :
+               elif systemctl >/dev/null 2>/dev/null; then
+                       for service in ${SYSTEMD_SERVICE_ESCAPED}; do
+                               systemctl --root=3D$D enable "$service" 2>/=
dev/null || true
+                       done
+               fi
         fi
-
+elif systemctl >/dev/null 2>/dev/null; then
+       # Online: running on the target system
         if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
                 for service in ${SYSTEMD_SERVICE_ESCAPED}; do
-                       systemctl ${OPTS} enable "$service"
+                       systemctl enable "$service"
                 done
         fi

-       if [ -z "$D" ]; then
-               systemctl daemon-reload
-               systemctl preset ${SYSTEMD_SERVICE_ESCAPED}
+       systemctl daemon-reload
+       systemctl preset ${SYSTEMD_SERVICE_ESCAPED}

-               if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
-                       systemctl --no-block restart ${SYSTEMD_SERVICE_ESCA=
PED}
-               fi
+       if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
+               systemctl --no-block restart ${SYSTEMD_SERVICE_ESCAPED}
         fi
 fi
 }
--
2.54.0


--_000_DM3PR11MB8758EE1ABFD4FC8C4ADE26408F822DM3PR11MB8758namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Please ignore/drop this patch for now. I need to rework it before it's read=
y for review =97 I'll send a v2 once it's sorted.</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Apologies for the noise.</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks,</div>
<div style=3D"text-align: left; text-indent: 0px; margin: 0px; font-family:=
 Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-s=
erif; font-size: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Himani</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Barde, Himani Ramesh =
&lt;HimaniRamesh.Barde@windriver.com&gt;<br>
<b>Sent:</b> Wednesday, September 23, 2026 10:29 AM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Cc:</b> Term Li, Changqing &lt;Changqing.Li@windriver.com&gt;; MacLeod, =
Randy &lt;Randy.MacLeod@windriver.com&gt;; Barde, Himani Ramesh &lt;HimaniR=
amesh.Barde@windriver.com&gt;<br>
<b>Subject:</b> [PATCH] systemd.bbclass: fix service enablement for cross-i=
nstall scenarios</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">When packages are installed outside of Yocto's nor=
mal image creation<br>
(e.g., using multistrap, debootstrap, or dpkg directly on a host),<br>
the postinst script fails to enable systemd services.<br>
<br>
The issue is that the entire enable logic is gated behind<br>
&quot;if systemctl &gt;/dev/null 2&gt;/dev/null&quot;. In cross-install sce=
narios:<br>
- If systemctl is absent on the host: the check fails, script is skipped<br=
>
- If host systemctl is present: it cannot find target unit files<br>
<br>
Fix this by separating the offline ($D set) and online ($D unset)<br>
code paths into distinct branches. The previous code used a single<br>
OPTS variable to switch between &quot;--root=3D$D&quot; (offline) and &quot=
;&quot; (online)<br>
within one unified block. This variable is removed because the two<br>
scenarios now have dedicated branches with different logic:<br>
<br>
- Offline ($D set): Tries &quot;systemctl --root=3D$D preset&quot; first, w=
hich<br>
&nbsp; reads preset files from the target rootfs and creates symlinks<br>
&nbsp; without needing the host systemctl to understand the target's unit<b=
r>
&nbsp; files. Falls back to &quot;systemctl --root=3D$D enable&quot; per se=
rvice.<br>
<br>
- Online ($D unset): Same as before - enable, daemon-reload, preset,<br>
&nbsp; restart. No behavioral change for on-target installs.<br>
<br>
The OPTS variable is no longer needed because each branch now directly<br>
uses the appropriate systemctl invocation for its context, making the<br>
intent clearer and the offline path functional.<br>
<br>
Fixes [YOCTO #14118]<br>
<br>
Signed-off-by: Himani Ramesh Barde &lt;HimaniRamesh.Barde@windriver.com&gt;=
<br>
---<br>
&nbsp;meta/classes-recipe/systemd.bbclass | 32 +++++++++++++++++-----------=
-<br>
&nbsp;1 file changed, 19 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass<br>
index 0f7e3b5..2f655c4 100644<br>
--- a/meta/classes-recipe/systemd.bbclass<br>
+++ b/meta/classes-recipe/systemd.bbclass<br>
@@ -29,26 +29,32 @@ python __anonymous() {<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;systemd_postinst() {<br>
-if systemctl &gt;/dev/null 2&gt;/dev/null; then<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTS=3D&quot;&quot;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -n &quot;$D&quot; ]; then<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; OPTS=3D&quot;--root=3D$D&quot;<br>
+if [ -n &quot;$D&quot; ]; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Offline/cross-install: apply preset=
s to the target rootfs.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # This handles multistrap, debootstra=
p, and similar tools that<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # install packages outside of Yocto's=
 normal image creation.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;${SYSTEMD_AUTO_ENABLE}&quo=
t; =3D &quot;enable&quot; ]; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if systemctl --root=3D$D preset ${SYSTEMD_SERVICE_ESCAPED} 2&gt;=
/dev/null; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; elif systemctl &gt;/dev/null 2&gt;/dev/null; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for service in $=
{SYSTEMD_SERVICE_ESCAPED}; do<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; systemctl --root=3D$D enable &quot;$service=
&quot; 2&gt;/dev/null || true<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fi<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
-<br>
+elif systemctl &gt;/dev/null 2&gt;/dev/null; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Online: running on the target syste=
m<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;${SYSTEMD_AUTO_=
ENABLE}&quot; =3D &quot;enable&quot; ]; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; for service in ${SYSTEMD_SERVICE_ESCAPED}; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; systemctl ${OPTS=
} enable &quot;$service&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; systemctl enable=
 &quot;$service&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -z &quot;$D&quot; ]; then<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; systemctl daemon-reload<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; systemctl preset ${SYSTEMD_SERVICE_ESCAPED}<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; systemctl daemon-reload<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; systemctl preset ${SYSTEMD_SERVICE_ES=
CAPED}<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if [ &quot;${SYSTEMD_AUTO_ENABLE}&quot; =3D &quot;enable&quot; ]=
; then<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; systemctl --no-b=
lock restart ${SYSTEMD_SERVICE_ESCAPED}<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fi<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;${SYSTEMD_AUTO_ENABLE}&quo=
t; =3D &quot;enable&quot; ]; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; systemctl --no-block restart ${SYSTEMD_SERVICE_ESCAPED}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;fi<br>
&nbsp;}<br>
-- <br>
2.54.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM3PR11MB8758EE1ABFD4FC8C4ADE26408F822DM3PR11MB8758namp_--

