Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8792FCAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 04:59:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.46708.1759121961225426122
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Sep 2025 21:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gaYtrAMy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23678fb0cf=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58T4WInW3875374
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 04:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=DZoiiNaEqOhBZlY7JdBBt3
	nFOy1ElUbFDb1IuMPANhQ=; b=gaYtrAMyJAQZh+IfibbywnSmIRFuC/ULQPnpZB
	aGxoa/CgdUZDYw6/VaDyeYyCUytbLA3m0TT3O8Es7BQYtoz6LA80G/iypFRrGR6R
	3vVqsAxc8cGS74lRsmqk8k5mUZYoEye4SI1E7jSqm3rCigq4NZNki0O1uj9J9jLu
	5wH+Rvmg4AO9sdiyYOJLWtiskZjeH9X/DICRij6G43k1uC6FOEzn97oBknAY0WxQ
	Hr9JcmTX4TNXGCIntyPmtcljqAwAHt3VhMcvnM0SaqXUosTsk64ojFN3/vo65J/H
	ZdhlWzEfdM4w1i85G3RTaQ0TpC5ETgaJa4ux9vd3PMamHK9g==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49e6w7hhch-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 04:59:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TrhPB6kDLwau456q8bfhvEhd0QwGmTI7SSuUP2FMXThJraDaKA3jJNFOYebnpasvmRZHVocin38hn50jneOllNBs6e4Q9/H1gmoy5605s0N+Jmffii3mOEZdEGiGBwNPyrImkr+lVBtrv9Ac7T2u6kHRNrHrOf4Ois8tuA+eah3dtRqlM9PaBXymIg7AdWHjGLuVFN8xBcn6Ud3uiJkzNbnaeSizMkZfJbQDKQqgMLgglf7wAmq4z5xQtXNrDfW0iXH5vkqcc86GQY4s1I2rnFuNaC+FXlTsEsI+qNchvHLVAWkRAne0O9RNxNqub98YHCCiJISxxWTdBYyTypEC3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZoiiNaEqOhBZlY7JdBBt3nFOy1ElUbFDb1IuMPANhQ=;
 b=eJpeyI9FilF05AnZcv/b5g+3bjy+hzj+xXSZBBhhRq1G51P5oVsulS9R2x0jrG7wEVNxEo8vFsLB+ZLNZWZktFBYHhVOposxStZT90anJLx4/o/VZkj0xrYNZ5a+2k6mYzS847xg2kO9aoTZYD7sFi8Yk0E64Akk24gjf87n3tTb2cGoCTwSEjo1Lvush3ohdeTcFX7B85QqGeT9ZCfjq8+xWjB7Ql4UwGlHGZZjALUhdeCx05BY9Skzcfqd6l2vbEx/HF2joPjk0xAmzfPzeRcG4eEeGMC+mFtYtg9gPFCH4oSP0knKMTUc7eiKHBkRyrRxas9oOmDfdIiTfAScCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 SA2PR11MB5162.namprd11.prod.outlook.com (2603:10b6:806:114::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 04:59:18 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 04:59:17 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
Subject: Re: [oe][meta-networking][scarthgap][PATCH 1/1] python3-twisted: Fix
 CVE-2024-41810
Thread-Topic: [oe][meta-networking][scarthgap][PATCH 1/1] python3-twisted: Fix
 CVE-2024-41810
Thread-Index: AQHcMP2eJYusDAnVJkS2sOOewqci5rSpmZdO
Date: Mon, 29 Sep 2025 04:59:17 +0000
Message-ID: 
 <DM8PR11MB5703E31F7BF9855D4FFB408B841BA@DM8PR11MB5703.namprd11.prod.outlook.com>
References: <1869A8013A783E4D.29244@lists.openembedded.org>
In-Reply-To: <1869A8013A783E4D.29244@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-09-29T04:57:27.109Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5703:EE_|SA2PR11MB5162:EE_
x-ms-office365-filtering-correlation-id: d2d4bb81-877d-4b3e-17ea-08ddff14f1e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|13003099007|8096899003|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?in5GoQZM1GFQCKl6Z5BR0FWVj5d4smJeUfBHh+sLJJR0o+highariTAyWRJ3?=
 =?us-ascii?Q?P59yvOi4vX7/qsp0rlRjc74RwcCHz5J8oZjGrMzHQ5PS7IcsWEqvB/1N1WmK?=
 =?us-ascii?Q?hferBIoupH1VRyS+bc1829BdUvWb5v/HZn0fl7SZH4M3OpTGD/B3RwMmGeFg?=
 =?us-ascii?Q?4sgkiyiKk/YK5aW28UrM4vOby73BKRRT0rpCTocc6cHchJLgCOgXSYRNj06n?=
 =?us-ascii?Q?MJ1Xz+PET56yxcEi0Qu0VGOCbx7Xo11NCixhnWjiwHWXJvH8/nAGArYclj/Y?=
 =?us-ascii?Q?2kLIVzs6i4e1AiYt9sSoABEkck63P0pKF8L9SY639cQS4tetI6UOb5+wNhx3?=
 =?us-ascii?Q?MyJ0BrP/QYjULKGGQZI+KgCzRB2mpNYgYkLQhuwW45CJ03Wa0D4f/Qxvdhv8?=
 =?us-ascii?Q?yurwOs+I3sGh24fIctpP3kbJuU6YINB3XxoyMP5gkDolqyyEeGeGjpHYRKyP?=
 =?us-ascii?Q?rCwXZBUzJSTfHxOGeZ4ux211NmcoyV2K9L5pUznyjxqmZ5cC75R4q7bpKWfL?=
 =?us-ascii?Q?kElCVbNrfMVGRitxLxgSoNsoXt2bWKRPM2tsPOUIu0ZdmzAH7yn81/1eLBY3?=
 =?us-ascii?Q?7dLoWOu7fd3YJ5lqxG5uQNvwaMXryV5zBJ6VMF9YFuOSbZqp+Lqu9SQPLTnN?=
 =?us-ascii?Q?xr2qYPWKEBZ9xmEX3Cu6ryBZQqAP9sNkJuFILlDCMPOc3h1b1WCPwji4YXGR?=
 =?us-ascii?Q?bjJwOLJAfzlKsAzu6wKEKE5PWhyo1YxcxG9o1SD8btD6LtOmA3SmTa+yF3Ci?=
 =?us-ascii?Q?jy67UV6d5nHPVZR53B6KkyDfpKRQjKQgADH2tPn72B9qReicTw4roYACYnr4?=
 =?us-ascii?Q?JIcTsU0TbbtyG3D1KPm8dXbOo3LtgFMTtOPn+q+8cQN716dN6uQwMkYJq9HY?=
 =?us-ascii?Q?+BBEDGN86WaUBanjRGtpbMY5N5SaKeDJmKUHD+VU1cvM22LlfRToHqedbWq+?=
 =?us-ascii?Q?leMTUufu83pweLx5iTO4wVGKGMaPx7mPffOgLkcq4942nQeNcwLUacRrA5NN?=
 =?us-ascii?Q?mBXrHpq1CIfsUD2VKa5M4v5dzwaJaMwvZ/kngUJJPAFthBVNNwD5F5zUOV2J?=
 =?us-ascii?Q?LSvF4WaY9VM8ZQSk5zdTws+1GaFhaiQJr5MMU7sKg8zdFoQMFhF2TU+TonHm?=
 =?us-ascii?Q?dHO9mQ1vaJJSqDRsJ6D5HLSk/tkJcPZdFabn7nQferMeOGqdxeVzyuD47kkQ?=
 =?us-ascii?Q?bRwChZUysxxApG8j/0O5mYeABCqJeog9/ax/RZVVfeKSC179g9wg3QBthPfN?=
 =?us-ascii?Q?fw28CQYfl88QyjUeF9czB8cR/yzO5NHPHNKC8hcMuEAPsEwv1RQZLeW8xkAd?=
 =?us-ascii?Q?6Sq6w9AxRgjuVArKJ6Ts6Fb/9E0WyfZC6qXpEcshKgvDYWHZeRXMtof9WnUy?=
 =?us-ascii?Q?Ksqw5r/kQv+/yY6klTYDopNRttW8aa6f19XZwK32g+1jI4wwTRBfyrcaLn5F?=
 =?us-ascii?Q?PGxJkQliVTBhSXcwECZd+LloOiRfboTqTc1tj7nL/evsZC+YbWECAg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5703.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(13003099007)(8096899003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Gbw91oVZFdbvL4Oon7C7tnsoRib/bhEaCqSz5koh4E/xD9Fb0ozJv4nbVYSs?=
 =?us-ascii?Q?+ApdV+0Prul/zUXq+79RHB/9rlKtHF6DgP3A/+KswG3qOx/nMLfRgR1VyGh9?=
 =?us-ascii?Q?g7mPs9HPNJXtkrH6qptMyldji7LTRKLWEOFvafQQqI1adiYM0QxNBZ92LP6r?=
 =?us-ascii?Q?41BZNNxo5n76rRHMp3dHpLFra9a179wwGzmtAAtrrZ9FseCE4yiw5Lq3kTRP?=
 =?us-ascii?Q?B7iQiyxpxKQCpTys2SLlGy6I93gZTZlVNIzFSyC4hOnqqeurfe7bE59OpI9X?=
 =?us-ascii?Q?5IpWUparcrmxXnhjGdpsvw8KNoaD8rTt57adAl/XFgKevt0QjWIXDUm072xe?=
 =?us-ascii?Q?Je7x5w5sAthqgix/+qpu0LNLWHYeTjFK4XVETgjU6qRyUX32iEI6CzcCXLxb?=
 =?us-ascii?Q?talAynYy8YaDTB8AUkulHETQhOdYN4Onxj7GpDorO3bf6gsWfHPQ0rIQWyXC?=
 =?us-ascii?Q?qOq8+FLNrRIdYamVVRJ6uCp+J0PVVfNp43T8vURkDsYFC2ptWJqiab8ldvwP?=
 =?us-ascii?Q?ErPNL+h5rPrWU1rnPlVvoZD6tH/KzzKFWerwFpSGo0ehYyCMEdfs+d/F/kq2?=
 =?us-ascii?Q?Zutl7ubkP+ourzPl3caQ5gm2X53oUvWHBAxTK5FJuyqd9YugUyL9dyeZCluX?=
 =?us-ascii?Q?QiWf7fFyHpU/Hf2qRlKkghP4Tco9nxdkCGsGGf+C2on8kIKIYpvwQgqcvVXd?=
 =?us-ascii?Q?2VM00DlNbhyqYE376gfBKbI9hgzpGIzL/JOMM3pS5wnfqxgHnXM7O8jnlsDZ?=
 =?us-ascii?Q?q3J1BryUw0pTKRy7fvSVmxNFXKH66/lhNIDyZlinMnt9IxUDNDvdpV9NtfM3?=
 =?us-ascii?Q?UkCGp8U4vk1oqDM11DUNSyrEmZH6CEiYYdSBjiSko/DUkkjYTa7XJK9aTDxG?=
 =?us-ascii?Q?AE1XMMTfkpCFSbEdr2TweuEPPIr/Bd8LnlpL8XTP7cTo5mgoTLcbIP6DsIJ6?=
 =?us-ascii?Q?eu8QCeGMHpyUgvROCv1bC16puaKbqcC5AY7gpT4PaH4w38dWsPCev5RisOyp?=
 =?us-ascii?Q?yUY1OZoatkSgeN3CPYdm7vJtcU93tvahx6YQOWFn/NOujzPwu9Iogff/rm/7?=
 =?us-ascii?Q?K4oXrb0+zCtIaBNrEx/4Y1WajD9ur8r8mVhPZ3sImT73vVirIJvwQ5su37om?=
 =?us-ascii?Q?K3G+Sy6n0MGXkdNH0MIhTAt3YlH0y6vb3cI5nJf2n7OlRf10gRkgG3cFLB/a?=
 =?us-ascii?Q?AEi+xQ+eWXGlHQEXdDX17KNiXJUn9sUPWwy0TVy3IanpehWtitNQGlIIuipC?=
 =?us-ascii?Q?s3TWKtrmfw/0fG0mANVoPfE6gyBnUCqugTsAooH1jtYMS/ipm85S6jp8ArsP?=
 =?us-ascii?Q?kZLx3mO4Nb1jLA6HteeaIBxca63G6byd+Gia6Bm9if7SqUCJ32C5/jXJTssF?=
 =?us-ascii?Q?fQhuWsESYiQysZDA8FaDGPjRVbUc9GiD6yOlMju2kxt2bssAK2udLFy5SFg2?=
 =?us-ascii?Q?htTiCBAJONeMQOnR5OyCFbZ9DWzNYqyH+EFMDgdc33QHzze36xWgiv6AeQvL?=
 =?us-ascii?Q?zQcEMyJ8ApIFQie0HlM8YLmEtOrzvEJJK0JJ05hX8r3qUEiQyIKmQNRW+njA?=
 =?us-ascii?Q?rwoggHPT6tOznwnOgXuwc4oqDe/UKndW3uBkQxz03T+PPlTwXwD3hdzupd0q?=
 =?us-ascii?Q?VQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR11MB5703E31F7BF9855D4FFB408B841BADM8PR11MB5703namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d4bb81-877d-4b3e-17ea-08ddff14f1e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 04:59:17.9015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uOL9uym/PQwkrEn750NZpXnq++g7T612nLkTpDiKU5+QPBFTeNqPho2MlT1Jk3Oc6AHVPKxPxXJhgdODk7mGhjt2Qy1LfZufSmpBXCSUvHGfQGZn/nQUcLNwBg4Yj2qj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5162
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA0NSBTYWx0ZWRfX/FN1wniC2FqH
 +3771dGEMM8m8ssPfvSNJEu9sNBbc14h528SLcC9jSLzanbXmJAJfpXC9Qcp5DOsRu5/6EVjtl+
 AwqL7cRF8MOYMKG8f/K0Qyjj24RJ+Rt3EwpitXpG22zKQV0/3phoNeCDPs/DhBElLOjOeBZJP7c
 b0UdDo/h+yuDk6U62S9+E2kbfPyd7jlhAr2LxYprzPqc8VJnjN/Gqvqi7bKsf8FObzyrRift8cG
 ktP3H8maInJbP62aE+A6mg2VxM1VBbIGzbmB3iAvWoXIh0ss851mSHqT0oRxGL4MqX9NQqanSGL
 5FZdS/W+FbMJr0mSJ/HO9H0vbj28SUaS+r3GZmYY81JT6c8DCCuZ41fNplgc5fqkIP1ItBVq/5n
 mWeOjgnuYHYNSKs53yXj8LXmtlFjXA==
X-Authority-Analysis: v=2.4 cv=Lc0xKzfi c=1 sm=1 tr=0 ts=68da1228 cx=c_pps
 a=BYzTVJwijQ+wlo0xVi9Hgw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=Xk6knvOzKn4ZROvoSXoA:9 a=CjuIK1q_8ugA:10 a=oeQk-IEF1njGy5xf:21
 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 3hpniOKNrWUA_qMlOG6WiL001DgseJ-i
X-Proofpoint-GUID: 3hpniOKNrWUA_qMlOG6WiL001DgseJ-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2509150000 definitions=main-2509290045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 04:59:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120010

--_000_DM8PR11MB5703E31F7BF9855D4FFB408B841BADM8PR11MB5703namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Kindly ignore this patch
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Polampalli, Archana via lists.openembedded.or=
g <archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: Monday, September 29, 2025 10:27
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe][meta-networking][scarthgap][PATCH 1/1] python3-twisted: Fix C=
VE-2024-41810

From: Soumya Sambu <soumya.sambu@windriver.com>

Twisted is an event-based framework for internet applications, supporting P=
ython 3.6+.
The `twisted.web.util.redirectTo` function contains an HTML injection vulne=
rability.
If application code allows an attacker to control the redirect URL this vul=
nerability
may result in Reflected Cross-Site Scripting (XSS) in the redirect response=
 HTML body.
This vulnerability is fixed in 24.7.0rc1.

Split fix for CVE-2024-41810 from CVE-2024-41671-0001.patch to improve CVE
traceability.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-41810

Upstream patch:
https://github.com/twisted/twisted/commit/046a164f89a0f08d3239ecebd750360f8=
914df33

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../{CVE-2024-41671-0002.patch =3D> CVE-2024-41671.patch}       | 0
 .../{CVE-2024-41671-0001.patch =3D> CVE-2024-41810.patch}       | 2 +-
 meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb | 4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/python3-twisted/{CVE-2024-41671=
-0002.patch =3D> CVE-2024-41671.patch} (100%)
 rename meta-python/recipes-devtools/python/python3-twisted/{CVE-2024-41671=
-0001.patch =3D> CVE-2024-41810.patch} (99%)

diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-4=
1671-0002.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2=
024-41671.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41=
671-0002.patch
rename to meta-python/recipes-devtools/python/python3-twisted/CVE-2024-4167=
1.patch
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-4=
1671-0001.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2=
024-41810.patch
similarity index 99%
rename from meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41=
671-0001.patch
rename to meta-python/recipes-devtools/python/python3-twisted/CVE-2024-4181=
0.patch
index 1f6bf6bbfc..023ebc3640 100644
--- a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-00=
01.patch
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41810.pa=
tch
@@ -5,7 +5,7 @@ Subject: [PATCH] Merge commit from fork

 Added HTML output encoding the "URL" parameter of the "redirectTo" functio=
n

-CVE: CVE-2024-41671
+CVE: CVE-2024-41810

 Upstream-Status: Backport [https://github.com/twisted/twisted/commit/046a1=
64f89a0f08d3239ecebd750360f8914df33]

diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb =
b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
index 272aecb8b0..deb7fd6321 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
@@ -7,8 +7,8 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc1c5d2c2493b848f83864bdedd67bbf=
5"

 SRC_URI +=3D " \
-    file://CVE-2024-41671-0001.patch \
-    file://CVE-2024-41671-0002.patch \
+    file://CVE-2024-41810.patch \
+    file://CVE-2024-41671.patch \
 "

 SRC_URI[sha256sum] =3D "6b38b6ece7296b5e122c9eb17da2eeab3d98a198f50ca9efd0=
0fb03e5b4fd4ae"
--
2.40.0


--_000_DM8PR11MB5703E31F7BF9855D4FFB408B841BADM8PR11MB5703namp_
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
Kindly ignore this patch</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Monday, September 29, 2025 10:27<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe][meta-networking][scarthgap][PATCH 1/1] python3-twisted=
: Fix CVE-2024-41810</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Soumya Sambu &lt;soumya.sambu@windriver.com&=
gt;<br>
<br>
Twisted is an event-based framework for internet applications, supporting P=
ython 3.6+.<br>
The `twisted.web.util.redirectTo` function contains an HTML injection vulne=
rability.<br>
If application code allows an attacker to control the redirect URL this vul=
nerability<br>
may result in Reflected Cross-Site Scripting (XSS) in the redirect response=
 HTML body.<br>
This vulnerability is fixed in 24.7.0rc1.<br>
<br>
Split fix for CVE-2024-41810 from CVE-2024-41671-0001.patch to improve CVE<=
br>
traceability.<br>
<br>
Reference:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-41810">https://nvd.nis=
t.gov/vuln/detail/CVE-2024-41810</a><br>
<br>
Upstream patch:<br>
<a href=3D"https://github.com/twisted/twisted/commit/046a164f89a0f08d3239ec=
ebd750360f8914df33">https://github.com/twisted/twisted/commit/046a164f89a0f=
08d3239ecebd750360f8914df33</a><br>
<br>
Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
---<br>
&nbsp;.../{CVE-2024-41671-0002.patch =3D&gt; CVE-2024-41671.patch}&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | 0<br>
&nbsp;.../{CVE-2024-41671-0001.patch =3D&gt; CVE-2024-41810.patch}&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-<br>
&nbsp;meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb | 4 ++-=
-<br>
&nbsp;3 files changed, 3 insertions(+), 3 deletions(-)<br>
&nbsp;rename meta-python/recipes-devtools/python/python3-twisted/{CVE-2024-=
41671-0002.patch =3D&gt; CVE-2024-41671.patch} (100%)<br>
&nbsp;rename meta-python/recipes-devtools/python/python3-twisted/{CVE-2024-=
41671-0001.patch =3D&gt; CVE-2024-41810.patch} (99%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-4=
1671-0002.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2=
024-41671.patch<br>
similarity index 100%<br>
rename from meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41=
671-0002.patch<br>
rename to meta-python/recipes-devtools/python/python3-twisted/CVE-2024-4167=
1.patch<br>
diff --git a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-4=
1671-0001.patch b/meta-python/recipes-devtools/python/python3-twisted/CVE-2=
024-41810.patch<br>
similarity index 99%<br>
rename from meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41=
671-0001.patch<br>
rename to meta-python/recipes-devtools/python/python3-twisted/CVE-2024-4181=
0.patch<br>
index 1f6bf6bbfc..023ebc3640 100644<br>
--- a/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41671-00=
01.patch<br>
+++ b/meta-python/recipes-devtools/python/python3-twisted/CVE-2024-41810.pa=
tch<br>
@@ -5,7 +5,7 @@ Subject: [PATCH] Merge commit from fork<br>
&nbsp;<br>
&nbsp;Added HTML output encoding the &quot;URL&quot; parameter of the &quot=
;redirectTo&quot; function<br>
&nbsp;<br>
-CVE: CVE-2024-41671<br>
+CVE: CVE-2024-41810<br>
&nbsp;<br>
&nbsp;Upstream-Status: Backport [<a href=3D"https://github.com/twisted/twis=
ted/commit/046a164f89a0f08d3239ecebd750360f8914df33">https://github.com/twi=
sted/twisted/commit/046a164f89a0f08d3239ecebd750360f8914df33</a>]<br>
&nbsp;<br>
diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb =
b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb<br>
index 272aecb8b0..deb7fd6321 100644<br>
--- a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb<br>
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb<br>
@@ -7,8 +7,8 @@ LICENSE =3D &quot;MIT&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE;md5=3Dc1c5d2c249=
3b848f83864bdedd67bbf5">file://LICENSE;md5=3Dc1c5d2c2493b848f83864bdedd67bb=
f5</a>&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI +=3D &quot; \<br>
-&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2024-41671-0001.patch">file://CVE=
-2024-41671-0001.patch</a> \<br>
-&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2024-41671-0002.patch">file://CVE=
-2024-41671-0002.patch</a> \<br>
+&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2024-41810.patch">file://CVE-2024=
-41810.patch</a> \<br>
+&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2024-41671.patch">file://CVE-2024=
-41671.patch</a> \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;6b38b6ece7296b5e122c9eb17da2eeab3d98a198=
f50ca9efd00fb03e5b4fd4ae&quot;<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM8PR11MB5703E31F7BF9855D4FFB408B841BADM8PR11MB5703namp_--

