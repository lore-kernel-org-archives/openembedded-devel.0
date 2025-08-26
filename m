Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1340CA0EFA
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 02:29:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.55509.1756175355415167925
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Aug 2025 19:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=E7f4vShk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03334bb704=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57Q0o2iB1768620
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 19:29:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=qMllXffwgv/TK/O2esn/
	rGUELbSquvMVmuRwJIeTgus=; b=E7f4vShkBIDQ0MGe/MV0OGVmBuqDzf3r79aS
	NMXjzkqkwkmSq9CJX+nMVMWqG0XEt+7xjHxv1ZH8DtdCzpLt5M+aCdDGrK5K6fWh
	zha7ysT/cEwuQO0FzQC/fPdBTT9dQ5EuuIs/I5SpLv0+McxswzGl7tSqcUDbRQWa
	X38RFbwRtP/EB+qdXWKbFx5Lh6j6PLhzudWP8Cqb4MLpPDRH+6XQ2+yUdXCSHa6d
	Vc0KgibU2jvz6Z2P059NlfnYceAq2a4tPS4Qg5/XG7G5HaRZHN4R37NBSh9q97yt
	dYWHOKOWDZ3O4+4bP/YwZBJh6ch5ip7YbgTHCOMcvBaNmWkcnw==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2048.outbound.protection.outlook.com [40.107.100.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q8x22d47-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 19:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9bpEviLwFRRs7skjsEElSU3Vu/eWrC5dbIPEzUvIoOhxP1bEdHkN/B2zw09aKitIe9FhiUc03fV2r6U7fAg0wFHGl0QpWDOwQvX+zYOByMx2W8TDZRmfMjTUxMcDKB+ptLh/joObEyXfPBB50+uUTvkwUspC70fJnoqWZIwHzoJPM8oLago10vQ9MUsJ+MjSiCy/qL3h8LW1qQeZXH6vL4suV8xD8ID9CzZ8Lk8SWZYL3kkVXWQU3tcr5DPMuTfGX+1GQbv572bcSHC+vk/1bgB4lDtdQbnHLs7kBVvFmEELMhon2h+n58WoWS9WUY7SztkPox4vgApA8rzfiGTEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMllXffwgv/TK/O2esn/rGUELbSquvMVmuRwJIeTgus=;
 b=uah8XQR+aPyyVx0t+8pSLBhDWg7vlrMXhxttR+upz8IpdkdS9YPFRt3Ma/99fRUmcoID1Hs9fTdOaZCOfeqDhQyiBSh7xblU0F8BvyAsIwgzyt+bDRDqkjK7QzOVZTdymj1GZFepgZLr3UO9gqzvrrKgJow2reejTqTlHlgRO8fbdXhDwfwOvDHEvWekb4BRBHXTcqyV19Y0vHCV9TBySXk82c585RulOFkUCvMAlTlpMd6LWoOiEpbZUg+GwX6rcrrExtDage6SKOpALp3h/bHlN8thqX/ut3vgzNwBOYzxnTkhkX/32Y1OgTqyZi2i45vyrNsyVolEdhx49/KOQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 02:29:12 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%7]) with mapi id 15.20.9052.014; Tue, 26 Aug 2025
 02:29:12 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][kirkstone][PATCH 1/2] unixodbc: Fix install conflict when enable multilib.
Date: Tue, 26 Aug 2025 10:25:30 +0800
Message-Id: <20250826022531.982942-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Type: text/plain; charset=y
X-ClientProxiedBy: SL2P216CA0196.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::11) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|CH3PR11MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: df45b80e-acbd-4801-9d30-08dde447fa92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6iWBF+zinAQJ4rBMofi0M/G8snhGyFdMO1E+B8Zzxqc13vnGbUms/VI7G39X?=
 =?us-ascii?Q?ljw0IDe5hH+TXamf468Ot5AP9QGU0jmaBYuH8RnuRwyFqE+hhj5pR6vSu1VW?=
 =?us-ascii?Q?603FRSI+3NQ7W1uOdXaJHZ8ua5471cjdsD5F2iqBapCIph4mazZD8TGRGK13?=
 =?us-ascii?Q?ITekzV2cfrvn1b7b1vDoP0bzu4tfZ1odtoqr4JK7MVQmRFWl1LV7hi9Z2vs2?=
 =?us-ascii?Q?fI3uCLPRZPhlBaeqmViFs4yUA4iwdSuEl4CfIZYe+58rqJWKWf1h1s1vmLAR?=
 =?us-ascii?Q?rLiNklJmFfo2mmJIs2WcwXqbJ/BB+NvbXcV7Bx7JN5knXMHxhi7mliDHR5Et?=
 =?us-ascii?Q?yV1xdJlMrEzJ63T9ipPl8pJ0/APpBSh98v2OM0/BdWBfGUt1b+d36OBmbTfU?=
 =?us-ascii?Q?kr2qnekwqRKOOqU8M6tNdTRptjfugFTSALNo6bWeirq+MRH7ITiZZj3Auluc?=
 =?us-ascii?Q?Tk3x5Scuqmhst6YIsV4RMtmAAVjVf34lsp28BwnWlSpWp62b/IFqaTcr5c/n?=
 =?us-ascii?Q?us+PFj9fap7ddRPCNGsWWS8IY9ble48yB+nY4Pr/XJyFa2SNYxYSXKhxiOoQ?=
 =?us-ascii?Q?BHtthaGDqwMis8BUVXkXfFQ6gRgb/oDDTqwAWZgw4gpJI1/91Aa8tqpzWyg8?=
 =?us-ascii?Q?uhPW+Wd86QrhSG+aH2iRm1HQuM5YptlD/OKA1fQcUhGTOZOc63ERI2+ixQbQ?=
 =?us-ascii?Q?3RiybPh78ib/IwVOtL4Q0Y5OGI1J2PKAlRLKHcX4D6T3rg4fZIdYF6Gn+IQv?=
 =?us-ascii?Q?Rr8O6DiG1dZACEW+Q3ZYclx9VCBChiSTavBiXaUkYwMi+BrXohxnxBeCKGMk?=
 =?us-ascii?Q?qs6wuzur3mbmFcYHBrvR5ARh5Ty3yt68DrYCXpsO1xAQL72V/+0UQy8FEgHj?=
 =?us-ascii?Q?xNrTGPoLZ3LUylcKzNfpnuRC0JaU9Q7AEBKGfMZvpL9Rff1xzWyJxAaOSR4C?=
 =?us-ascii?Q?hBymOMZcfF69uhd1te6Sqe1MWQsVEMyu3VNGuj9nLn+M1BjpKUwUqWa/T6J6?=
 =?us-ascii?Q?IYQLHs0nkEhp5EYljauT1DfhyOBT49Z2ffnsSdB5cwG6myZ3ACsc8KTlvQmE?=
 =?us-ascii?Q?5CYQIwJxJqruf8Dyti+U3GMc0yWR+krbAF78MMHhhiKektmPfkDcmIUNvxdX?=
 =?us-ascii?Q?fzpYjM/EFPF0yhhRxXNGwAzHCCEnzF+3NkOSE0eEDGv9hbJs9Rx5ycWkuntR?=
 =?us-ascii?Q?lyhc9ovC4rL+EsuLV68HKZoQYY0B6g6UlmxeaIwh86olVYw11RwNMCPRpdFn?=
 =?us-ascii?Q?tUh4/mqaXv97qoDVRyTT/At2uOFaDDf8fw/l5YZnj2xv1Ba7DEFhD2FfFsON?=
 =?us-ascii?Q?7dMm6NmNRpmYmUyFlnnA6gICJe2BdRAPf3REfnicXAdrQxRprapTbf2cxTpk?=
 =?us-ascii?Q?neRSs3rmY3vkoa3wdfPu7eMFAEQmKx71FBGaprLHipIvQ9Ss0Cixc2tv6BuC?=
 =?us-ascii?Q?/Qe3XHN9dZ38HVCnRnpR8kCTQve0z371Qafvi4UtytKsgAF6p0m/0A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6PrFx6z8qd0ZRDic+nJSZNHVBQ/5XFbfX9Yluf04tVnmvCP3Pv/ZEVp03PI+?=
 =?us-ascii?Q?wvoThJ4USNfcM/GdtySsichCuxkzlokZq0JQlv5EsLEnRjYLZj1NjTX29aYG?=
 =?us-ascii?Q?NYtBw1yPDLeuR6FJ8nUxcftrbc6ftHPcQzphqMndoUIeeBaqM1xkDxyXGdso?=
 =?us-ascii?Q?cL3dWCMSHJ4/C9FULnkebcPIqPwbot0aldVWcNrBaaxEBqP+2jRzLrIpAhUi?=
 =?us-ascii?Q?5UanXjVyxEIOSpL7WAiykX0fMWcUQFYNc0/uR4EGuFOA3ApQyBxXkukWQ7mU?=
 =?us-ascii?Q?cnbAAjMEWBnZpuCi6WkNJ+aGtjIyFsF5Rzoz/RMkxOxGMGHxrDK1or53mImf?=
 =?us-ascii?Q?ARQsWp2crBhfJynGCfdTdctWy+s93mf+tsIx8RwjfHt2oombx8K8VU4cnUd8?=
 =?us-ascii?Q?8GkkbFMK3ceBrbA025/vJBrFpq1N8/K7aUUhYeuRlHmTS5IElsHUyfhmCbX0?=
 =?us-ascii?Q?H00hhElPDqpM+5gqW/ILELWgBuqcKwFT43CxWRp8+wRGaC2JpnXkQuGUkibP?=
 =?us-ascii?Q?xoXdECMq+4vPqAI0+kKSC/5kRqwgil62vxUwn67sba+IlN7R/dks7BRZYSAc?=
 =?us-ascii?Q?E8+TdFhYUwXTRIsxRwJieVldoUxbaZEQNhKlEhF4F4b2GGSAhe9B8jopbG29?=
 =?us-ascii?Q?XdqqNqlsV0EfDsXbcBspPhKbYAP47b2RuT9DgNpsdn/vSdQEMq39qHcXjD/I?=
 =?us-ascii?Q?7Q/5eVLkeuQERhtGArnBTgu0OT8f7tbim2dHcsrC4VzOa5fRTiYaYQ3nFSYv?=
 =?us-ascii?Q?rxIWRD7+I6u8zDaab3do4cLEkwXGN4G9tOfv/fe/8xjV4MDp9jbtG6YAo5ab?=
 =?us-ascii?Q?anKYwEbzWJF4jSwpoakzPIfm0f6MwKh6Krn+qPb+I6cLyzt5i+qbclq+oJYW?=
 =?us-ascii?Q?QDaxLyFcH8p16x8mdIcPwoIGW3xz+hXngi6GF/KkdpUfDX6PhUEwODcb4A+u?=
 =?us-ascii?Q?P5DwzyF4cqyoC1Fvh6zE3zVK7KNLw87Jxn91FojHsh6Rq2rxgesTfwORKa4Z?=
 =?us-ascii?Q?7RJG9xAL0fReLu3C1xqjrZFCdjtOZ8xRbGAaPqp/AG7K7HrbmnDgcj40VWQ0?=
 =?us-ascii?Q?HFI5vduxxkSvy3iToFcGu8jsg5GlqYRLzaCYp/BQsmK2ittkPS5oAlSxOdXR?=
 =?us-ascii?Q?g0aiKH195J6g9+1VQ2su9tKM+IcOVmyIlISAZkcP8sK6RQ1skkyoV4IEpQNw?=
 =?us-ascii?Q?pH2bQeqXn29FmJE9MYUHx6KWGehfdM/qNilzYtERa7vkIwsGjHuVHGLuyKtK?=
 =?us-ascii?Q?ykbtgNIWi+KkFwk8pg+ob8YMwYPdWWLUd6xHFL/mmxhQHYyMlqOqZdHrS7vw?=
 =?us-ascii?Q?Z2Evm7orFVaAeWJKA884gWqqCWmjbAorSfnv3aI2FSk+THuJVD6xwgU0G9PL?=
 =?us-ascii?Q?UF2muO7aP5lP5mQOW8oTl3aSw5pZHlevecVwcN+wQMD7RXmGb/dFZlIJumFp?=
 =?us-ascii?Q?Kg+Q+o06oKeOdqql4TrTprBd02BFd9CsFYSkWFzU0dCYE10+TB1TebW5eSi7?=
 =?us-ascii?Q?/ZDOqjlnYZ1lgt0kKJ5yyCNb64pupPTM4pdoxm1szQrvEBQKZ6QwOFdYIBK9?=
 =?us-ascii?Q?kNMITjMnAQnJ8aoqpzevRd1hVIoV6iMzk+d49iaQlxFKTnAIsYJ6Mf3sR+0u?=
 =?us-ascii?Q?Nw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df45b80e-acbd-4801-9d30-08dde447fa92
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 02:29:12.3167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDOWa6YAidSVYkM8sYBiVBvCoaMIBWgZhVTISQaxK/3uqEwdWHcFuKqe3fXYrPyxC6hoP7wAQasSsiczBr64rIs1+Z9cBx2L5pmS5rYreSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8441
X-Proofpoint-ORIG-GUID: rl-I-0ztnk1a7TZP6Z8QuMExzbNPZ67I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDAyMSBTYWx0ZWRfX+Fx/HbZynxXS
 8B+//QVHE7/9vYrjOCea9gyoiGqOobwgjbMQ8UWReMhB/5rvPsK8VYTnPEYagYoM6HY4r2Ch3Wk
 JHk8vrMKelPNKdlTlCvEtcWz2u7AYoVP12ctI4rOAfri87jMcvQQmRaFTa8Kkdx/1svi3yyB3gY
 10PF+KhincqFWHuEFrgaxleD4fZ1oeLzz2ol3YjHskEIurKfR3iogl2RAwmNmD7qZQKx2APCaGQ
 Rmqh6FMUMB3jkUIYCP+RbffYV2g1ovars3W1bLWB333Z+oEYpNm00QQ88JhGzmEum2XBX+E5+eY
 kfEUICTXLUKOY8tQgVMf6i2T04wHNyRVWXGHs15baoDc1ap9K8vxPLPzHz1dKs=
X-Authority-Analysis: v=2.4 cv=JfW8rVKV c=1 sm=1 tr=0 ts=68ad1bfb cx=c_pps
 a=IGreAyPUPBSHjVw7E5NCrg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=qf4gfuq51q0A:10 a=2OwXVqhp2XgA:10 a=omOdbC7AAAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=bgGO-R7KUPSdv2dy2M8A:9 a=3ZKOabzyN94A:10
 a=k40Crp0UdiQA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: rl-I-0ztnk1a7TZP6Z8QuMExzbNPZ67I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 57Q0o2iB1768620
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Aug 2025 02:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119103

From: Wang Mingyu <wangmy@fujitsu.com>

 Error: Transaction test error:
   file /usr/include/unixODBC/config.h conflicts between attempted instal=
ls of unixodbc-dev-2.3.11-r0.aarch64 and lib32-unixodbc-dev-2.3.11-r0.arm=
v7ahf_neon
 =C2=A0 file /usr/include/unixODBC/unixodbc_conf.h conflicts between atte=
mpted installs of unixodbc-dev-2.3.11-r0.aarch64 and lib32-unixodbc-dev-2=
.3.11-r0.armv7ahf_neon
 =C2=A0 file /usr/include/unixodbc.h conflicts between attempted installs=
 of unixodbc-dev-2.3.11-r0.aarch64 and lib32-unixodbc-dev-2.3.11-r0.armv7=
ahf_neon

 The differences of config.h are as follows:
 @@ -14,7 +14,7 @@
  /* #undef C_ALLOCA */

  /* Lib directory */
 -#define DEFLIB_PATH "/usr/lib64"
 +#define DEFLIB_PATH "/usr/lib"

  /* Using perdriver iconv */
  /* #undef ENABLE_DRIVER_ICONV */
 @@ -275,7 +275,7 @@
  #define INCLUDE_PREFIX "/usr/include"

  /* Lib directory */
 -#define LIB_PREFIX "/usr/lib64"
 +#define LIB_PREFIX "/usr/lib"

  /* Define to the sub-directory where libtool stores uninstalled librari=
es. */
  #define LT_OBJDIR ".libs/"
 @@ -311,7 +311,7 @@
  #define PACKAGE_VERSION "2.3.11"

  /* Platform is 64 bit */
 -#define PLATFORM64 /**/
 +/* #undef PLATFORM64 */

  /* Install prefix */
  #define PREFIX "/usr"
 @@ -323,10 +323,10 @@
  #define SHLIBEXT ".so"

  /* The size of `long', as computed by sizeof. */
 -#define SIZEOF_LONG 8
 +#define SIZEOF_LONG 4

  /* The size of `long int', as computed by sizeof. */
 -#define SIZEOF_LONG_INT 8
 +#define SIZEOF_LONG_INT 4

  /* If using the C implementation of alloca, define if you know the
     direction of stack growth for your system; otherwise it will be
 @@ -351,7 +351,7 @@
  #define SYSTEM_FILE_PATH "/etc"

  /* Lib path */
 -#define SYSTEM_LIB_PATH "/usr/lib64"
 +#define SYSTEM_LIB_PATH "/usr/lib"

  /* Define to 1 if you can safely include both <sys/time.h> and <time.h>=
. This
     macro is obsolete. */
 @@ -383,7 +383,7 @@
  /* #undef _ALL_SOURCE */

  /* Number of bits in a file offset, on hosts where this is settable. */
 -/* #undef _FILE_OFFSET_BITS */
 +#define _FILE_OFFSET_BITS 64

  /* Define to 1 to make fseeko visible on some hosts (e.g. glibc 2.2). *=
/
  /* #undef _LARGEFILE_SOURCE */

 The differences of unixodbc_conf.h are as follows:
 @@ -19,7 +19,7 @@
  /* #undef C_ALLOCA */

  /* Lib directory */
 -#define DEFLIB_PATH "/usr/lib64"
 +#define DEFLIB_PATH "/usr/lib"

  /* Using perdriver iconv */
  /* #undef ENABLE_DRIVER_ICONV */
 @@ -342,7 +342,7 @@
  #define INCLUDE_PREFIX "/usr/include"

  /* Lib directory */
 -#define LIB_PREFIX "/usr/lib64"
 +#define LIB_PREFIX "/usr/lib"

  /* Define if the OS needs help to load dependent libraries for dlopen()=
. */
  /* #undef LTDL_DLOPEN_DEPLIBS */
 @@ -396,7 +396,7 @@
  /* Define to the version of this package. */

  /* Platform is 64 bit */
 -#define PLATFORM64 /**/
 +/* #undef PLATFORM64 */

  /* Install prefix */
  #define PREFIX "/usr"
 @@ -408,7 +408,7 @@
  #define SHLIBEXT ".so"

  /* The size of `long', as computed by sizeof. */
 -#define SIZEOF_LONG 8
 +#define SIZEOF_LONG 4

  /* If using the C implementation of alloca, define if you know the
     direction of stack growth for your system; otherwise it will be
 @@ -431,7 +431,7 @@
  #define SYSTEM_FILE_PATH "/etc"

  /* Lib path */
 -#define SYSTEM_LIB_PATH "/usr/lib64"
 +#define SYSTEM_LIB_PATH "/usr/lib"

  /* Define to 1 if you can safely include both <sys/time.h> and <time.h>=
. */
  #define TIME_WITH_SYS_TIME 1

 The differences of unixodbc.h are as follows:
 @@ -14,4 +14,4 @@
  #define HAVE_UNISTD_H 1

  /* Define to the value of sizeof(long) */
 -#define SIZEOF_LONG_INT 8
 +#define SIZEOF_LONG_INT 4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

(master rev: b3d875df4d6023835e2272a630df3b90c48f5bb9)

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb b/meta-oe=
/recipes-support/unixodbc/unixodbc_2.3.9.bb
index 283546cf0e..66881a223e 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] =3D "52833eac3d681c8b0c9a5a65f2ebd74=
5b3a964f208fc748f977e44015a
=20
 UPSTREAM_CHECK_REGEX =3D "unixODBC-(?P<pver>\d+(\.\d+)+)\.tar"
=20
-inherit autotools-brokensep
+inherit autotools-brokensep multilib_header
=20
 S =3D "${WORKDIR}/unixODBC-${PV}"
=20
@@ -27,3 +27,7 @@ do_configure:prepend() {
     rm -rf m4/*
     rm -fr libltdl
 }
+
+do_install:append() {
+    oe_multilib_header unixodbc_conf.h
+}
--=20
2.34.1


