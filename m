Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C86CA1010
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 07:44:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.71721.1756799095183341087
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 00:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ftv5aue9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=134031fe91=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5827isvX1300360;
	Tue, 2 Sep 2025 07:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Z9FdEzmgsE/iWUV+IhrtO4ctyGQjbnJBBplFNjJs5AA=; b=Ftv5aue9jMWp
	Fbl6+i0IComI1P2f7lmwjo8PrrbxHKKtB7l82Y+/QA4gI5FiQJD/Ijzh5+2wJOaW
	KENyeSXxaOklxppG4CAuauerEUSNgfIkVL5LqAn/PPbr5j/3WHVxri4q+3wPc03s
	OCIVRcxPpDZ04nOvOvQO3ReqAxrOFGUSlIdpgzO+F5O958pmGOnM8Fc/BxoZbvF8
	aSD646iT8/68w91tVSw1MPVxJowZ/KYG2LhFiWFWWm8i0yw23o+VMG62Xh+fSlxd
	kmJ6yHV6UAds8dY0iZIIggl1azGKFAuErbSphsjJS1WH8TLANpJSNshUwP6y8JrD
	/sDkbDDYRw==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2073.outbound.protection.outlook.com [40.107.212.73])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48ur99tckw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 07:44:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wlc269RLKEGit5pJE6M1Z+7JQwR6qIJD7zwk9K7fXy3a7iMcgGN9LSk7wpw0zK8QQKIzRx30eqsrwTo+913Y7q0uk2yUFozLLlqM1DEMd1w25LHJvWzaapnUqL6tlbtuPywSmUWqCSCha9lVC1+e6Pxf26LpJGr/70DvShO4F7/Wqe65teN81kuWtdpXe9FBd3jDQKWT371KmX6mh86Qs0jHzckeXmtny1mx/cg1CjJt8BFs9LCvj1jWw/aYyMwUDmHaJZxwrNTP44lefqoZhtxjEovvrWEe4IMeTCurIJ+Bze3VoVv7YUv6vBeuJW6lKybu4HThJBzxnrteTDQYRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9FdEzmgsE/iWUV+IhrtO4ctyGQjbnJBBplFNjJs5AA=;
 b=th3fo4AKaDNBVn/BCMk9vXsV4nlRWH24DpnJO/3wfQQYgD54fZF2BNanVMyrrrjzas9PUN4uWO+JFfeGaLS4BJ0xyEy2cEG3rP3QmM/PjPvFyCfzdweYvtBovJagmPkWkFqgELMEPRVmxfKzcz1cdEsO+U4dC4UIRhsRmvSEcWAljcxOPfsuSwMdB31rfZybA1bCwsbn/Y24J+duntSK0ZzFuSkl0GJVQFuzzvxsClY99aZIsIy7KQonKd8Ti1kAydOGKCaEM3QIRVzjucrqyopCz1gnyrsFDfLamcu+kc9JKM94zPPrcDiULZP8o9lo27KvEC+UorFMrplVvCaPBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 07:44:52 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 07:44:52 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 6/7] gnuplot: fix CVE-2025-31180
Date: Tue,  2 Sep 2025 15:44:31 +0800
Message-ID: <20250902074432.1068537-6-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902074432.1068537-1-peng.zhang1.cn@windriver.com>
References: <20250902074432.1068537-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::9) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: 086a9166-eaa7-4035-a149-08dde9f49a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4V8xma+ZGLEiviXh+g1bn0g1/zNtRR0Y0Dm4KUhL0cY8KTGjFaYVlcnyMaUF?=
 =?us-ascii?Q?wV9QvddVa5PL5H2xt9zAdvDQD7eOM33pymtqILxjFsLIZx8FavrcBpyiYvBP?=
 =?us-ascii?Q?2aPHH4aJXDDUXuFZANKl9XvPbOnaXXfo+Yfe/b9w+n2BmlXKgTeJj++V4Kb8?=
 =?us-ascii?Q?Bih4o+EBsx4tZCHy7DnGMtP7eP8aRXRes+OYe2Hhi/AWr2eTbyBHOuXGf5nX?=
 =?us-ascii?Q?oMz65MAN25cXcm0xYiCKHqQYyeRkObLV4EZFQDpSKOlV97bME9foaMLFORqC?=
 =?us-ascii?Q?Eo4+7xhKKum2uLSK/XDfoLIIrlwqhoGEddkuit8fzmkTpwaeuR/wnCMlB2VX?=
 =?us-ascii?Q?0NbE08baS1Pmpg8v+BS0cmWv2qWeCX8w8Xvdr3j9jt0xbE8AzbsiuSErb80A?=
 =?us-ascii?Q?jvgz82XWi9dkzhdtha246TRTHumxAqYx1/1n2Qj9v+1JIgDKcOYtQhI2/ehF?=
 =?us-ascii?Q?R8jmBeCr1MI/nKSDJUsRWJ/rBJwujgvmwnLQv7WvIkNyzhX14tx35IYronJt?=
 =?us-ascii?Q?ZiiOsmJAeTiZyLCfRl5Iz0pPtCcZwMF9uyTX/vG4nxWB46LQb22ko0Apen5I?=
 =?us-ascii?Q?Pjh1THOqqNP3SH0dI+41chICeSXNsQNZpA7eV85kuQleLuLmre2JB/Y2lUuk?=
 =?us-ascii?Q?7R4x4k13mHlA0FrYmL6XJoc3CF/kT0adc5frkboE5FdhLxAmG9lfrcHdO226?=
 =?us-ascii?Q?Klqj1MM6WnTC4ySZ4NpZtE+oHVExZm0RQF65PpNKF/c8DBv6ZIh7+yyeshNg?=
 =?us-ascii?Q?Rj5fgmYwCPhpV4meWp/W7l7L4fequzfcnNNgjI0f8pXQg0QkNbHHI7jcjP28?=
 =?us-ascii?Q?r2ATiwxTHmewimbjT9Ev+2ZEW4Ynne75zMvgdVtNJ0Buu6VgClphGnnnxQNb?=
 =?us-ascii?Q?Nc6lwIO0K+5KmsBOyh020YFItRzlpcxqvKo7NfUoWGnDLMGo9sLftNhIWQzF?=
 =?us-ascii?Q?rwYVxQr5DiLrW3ruVz6ixCCdXaFHoeMGcAStTVmil3YgtTx+NoT56su6JLll?=
 =?us-ascii?Q?8j+HsuLCh8I4mx4Pc8wJHTuhJnc+PrxcWqUJGgYJrad45bNW6p56Go9bxHLO?=
 =?us-ascii?Q?ICTpEWVUhd+kMoRm43f5QumXQQrEhm8QxuzURKgsVld1z/Cn2JUfTTwLBIuv?=
 =?us-ascii?Q?MwzyKsQ8Etqa1hWZc6Mu3OwxA8KOf4pVKF74i8BGu1++a02i+DuM9k7bGRsC?=
 =?us-ascii?Q?mlTFvdO5IiMVkHUOu86UJT8gsQFTaO+Wzm7J2Ui1K1q9HIzXu0H1ICk1AXqc?=
 =?us-ascii?Q?ApO8e9OXCWvqacHK6MuIdmqsp1eRSjpC8e0Jj3QXt5pZnJuWLAoKDEAFxAN5?=
 =?us-ascii?Q?MYQ+MUbDdEibwQXzElm0OaZZrD7FNmS50DuvS0VvJasS9y8iAR3sjujiIX8k?=
 =?us-ascii?Q?JMcnXBpFzKI0y15j4nLhLC2hTxs3qF6O0mSDy7kQE/UAuGj15c+33jpEp50j?=
 =?us-ascii?Q?VoHAh/e3Ui/KVNr/OIiZdeLVQ1a+FUB0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uTyHtlTcq+Fob31t2I9ESxyrQQQKViSKZsQTzzFwROt6NKP5zbgVq0FFliCs?=
 =?us-ascii?Q?u3KdYCWQdRD+0tv/gBSTwDua71yzYx4iPlbt8AaZEJGkgWSUnUFQ+/69Pf2V?=
 =?us-ascii?Q?/AdXCvG0uq5IWp8xTYcFPinkhV+Q8pb+hUswRw0sOxG+08bXMj3qdbLKP9AN?=
 =?us-ascii?Q?hpXJgNxRRpZ5F+Gzv2jACsPYllm4UAEkZZjkD5fw/Kqw9wbRILsCAS3i24PU?=
 =?us-ascii?Q?QUOjO0PuSVr6jpL2bz0RTsOcBLbuxAvwjF/ZDAcn2FT0CMetbeatB3I1RxMy?=
 =?us-ascii?Q?9AwhpwikCMNfB8rSMaSqXKruNavo6FYdNZKI6VdPEyYDb/iwsgRJRD7iQ+fn?=
 =?us-ascii?Q?X6Ke3tt4VHzpzxSqxRqxLPqAeWitp1EbL23e6MyHw9Kd3J7KPqD4AknYHybI?=
 =?us-ascii?Q?rBZ1x5PwP+Lif+fpkmuQ2N5ReI/Cro/IJWwE6zmGBO9MDrv+AI0VE7LkIR+G?=
 =?us-ascii?Q?L64dcugLM0DzByCUzYrtAmvNrIgR0I1kmz8RFAcdvZfiJY4rRgD/Jr7A7SHG?=
 =?us-ascii?Q?BUmPkGvrcr6EI+8PwkcJ55YwBgqT6PT1h7caz5Eo3EIV2QpEMsvfhq1ebuiT?=
 =?us-ascii?Q?o4R0sfSrmRlUQSsxL4/LMHdZVE2qjraFfpvCBnmUdonrmbgz8g13ylUx9dOV?=
 =?us-ascii?Q?mrGnaaYdo/lP/5tMuZfB7crf8TZrHTkH78dlIuOVn884vi6PByWCgFpbAb5q?=
 =?us-ascii?Q?0F40xEFmWYFa8OOkMw5ueroz+LZV0UC6DOCDUaBNh6se85tbArgUufdr3shf?=
 =?us-ascii?Q?M0+nrp+BvkACvEWcxjegE78/IsmAWON78v5s9silCOmCCWHNGsPbhnggXstv?=
 =?us-ascii?Q?arPjqmrkjFV/DuBPRneBAQUQePMXvGe2KPc5sEmxDAHYUJh5BN/Sy8wgrOde?=
 =?us-ascii?Q?qrf6TysE4CFz6HoFqony5afXmJjjSq/DSWqD5PT1ZwvJyW1pa61I0Z+8leWm?=
 =?us-ascii?Q?w11xxqL3vkjv5m3I7qRm7HsYcVhePTja28NefYgm+oHKePPOZgEKLiZV+Ebl?=
 =?us-ascii?Q?PIN3+x/bEVtuW1ZwzqcddRzuB6wWCodR95kR9ZyV97zcr3iUkRxY+AiYJx4h?=
 =?us-ascii?Q?eyv9iAjTSlu/kGEZj13SRn2p+C0QGIZXwD3w55vuQ+Bo9Yu7fKpI5529hh0q?=
 =?us-ascii?Q?5SB0YKKqjapBvSELqh+JoSUAnimeLkrNDOUzCN6mI4j5oYwZj3tWXScAl73b?=
 =?us-ascii?Q?UIkF8jH55iHLNfiI7N0troFg6QzbXdC8LGzzAPgHholBzSQufZ3Gbe1S5XEL?=
 =?us-ascii?Q?CEtCdWxxRDkYMj0j+BidwpDVKn3yiTVJ4ft1s4WUd+dwZ/AFruFHmy0ZfyW4?=
 =?us-ascii?Q?puaqYkiQgTGXomZ5+tw059bAJCX0o+E5aJ9d37Sh2UGb80G1XjnSpszfVJGM?=
 =?us-ascii?Q?2oN6stXW/uUq44JwqpY7VuBmjX8DB6qD5gdpAeFb4RjpxOMFJmnS/UkqODf5?=
 =?us-ascii?Q?WqSpl5o4g1zGtiKvNntAiPw1awCkRReJnonVHowo6SNQoHUKbVnd7pFraYcu?=
 =?us-ascii?Q?4WyDiZLX4Wp/Zu+bmbptx/V9YHOUp+UMcOBbEk30sUlc/ylg1h60CR/3MYE+?=
 =?us-ascii?Q?T1wIefhSobFkAuS4QMZydGTBEB6yyFQhm8DpvyOkJYqeRNOBJCO0t3kMOWWE?=
 =?us-ascii?Q?sw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086a9166-eaa7-4035-a149-08dde9f49a30
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 07:44:52.6922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XPwD7fAeD51asjlqnc45Vjmif3z1v/qDTqwbWr/92yai2R1a9RLsSQEHWB5oOQgZqGBdgYVOcr6KnvZp1q+UEnbqayFdikCCiiSSbPbsBQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8562
X-Authority-Analysis: v=2.4 cv=FqYF/3rq c=1 sm=1 tr=0 ts=68b6a076 cx=c_pps
 a=N5D11zy+UcSgEGJfZcBmYA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=FP58Ms26AAAA:8
 a=t7CeM3EgAAAA:8 a=YRJNb4tU5TLenshja7AA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ROGcTM6e45lDSOChRILJUJrxBakGbjQd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDA3NiBTYWx0ZWRfX/K+A9Vz14HSC
 VhWa6cgQa8BY0kVk26uytkeYodu8v7S5fyUAiRA6XyWn43HkQ7DmjkIXJF2cXnCzStTcX3DD2Qv
 0dwti1V5PEhXmxw+WFwJU+UTVFmDtNwD1o7bMJUP8SEWQqTzIt5wB/glkQoLjLs5BalA1Bugj19
 3WMu6t6gW8RlSEO+Oh7Mv6RO3CjjMjcusNQQt7O1iPMPTktQChVkMnwWSKig5eVoQY4Ml99cJC7
 6AL0E/9epupNvoVi7x7BVf1uZO6u70gs74+t2Mxp8lOPz++g1Z5GhxSMXxSo8vnzlKBNOXEqd57
 pVw1fG62dQJkn1Nf40rxiacCDN5F6uzVApG1eQi4syoR+17Y5Suh2Ok8cj4Dcw=
X-Proofpoint-ORIG-GUID: ROGcTM6e45lDSOChRILJUJrxBakGbjQd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 07:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119174

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2025-31180:
A flaw was found in gnuplot. The CANVAS_text() function may lead to a
segmentation fault and cause a system crash.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2025-31180]

Upstream patches:
[https://sourceforge.net/p/gnuplot/gnuplot-main/ci/b2343fd02c4fff94957f0151b73daa0a1f7fec49/]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../gnuplot/gnuplot/CVE-2025-31180.patch      | 43 +++++++++++++++++++
 .../recipes-extended/gnuplot/gnuplot_5.4.3.bb |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31180.patch

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31180.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31180.patch
new file mode 100644
index 0000000000..e444a87128
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31180.patch
@@ -0,0 +1,43 @@
+From ec0fa6117d8e98918a030e31c2e8df32ab6e4542 Mon Sep 17 00:00:00 2001
+From: Ethan A Merritt <merritt@u.washington.edu>
+Date: Tue, 14 Jan 2025 21:54:14 -0800
+Subject: [PATCH] canvas:  handle nonlinear x2 or y2 axis with an incomplete
+ definition
+
+Actually "handle" means "ignore".
+But now it doesn't segfault trying to probe a non-existant link function.
+
+Bug 2755
+
+CVE: CVE-2025-31180
+Upstream-Status: Backport [https://sourceforge.net/p/gnuplot/gnuplot-main/ci/b2343fd02c4fff94957f0151b73daa0a1f7fec49/]
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ term/canvas.trm | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/term/canvas.trm b/term/canvas.trm
+index fee3e5dfa..e796cec0d 100644
+--- a/term/canvas.trm
++++ b/term/canvas.trm
+@@ -646,7 +646,7 @@ CANVAS_text()
+ 	} else
+ 	    fprintf(gpoutfile, "gnuplot.plot_axis_x2min = \"none\"\n");
+ 	if (axis_array[SECOND_X_AXIS].linked_to_primary
+-	&&  axis_array[FIRST_X_AXIS].link_udf->at) {
++	&&  axis_array[FIRST_X_AXIS].link_udf && axis_array[FIRST_X_AXIS].link_udf->at) {
+ 	    fprintf(gpoutfile, "gnuplot.x2_mapping = function(x) { return x; };");
+ 	    fprintf(gpoutfile, "  // replace returned value with %s\n",
+ 			axis_array[FIRST_X_AXIS].link_udf->definition);
+@@ -657,7 +657,7 @@ CANVAS_text()
+ 	} else
+ 	    fprintf(gpoutfile, "gnuplot.plot_axis_y2min = \"none\"\n");
+ 	if (axis_array[SECOND_Y_AXIS].linked_to_primary
+-	&&  axis_array[FIRST_Y_AXIS].link_udf->at) {
++	&&  axis_array[FIRST_Y_AXIS].link_udf && axis_array[FIRST_Y_AXIS].link_udf->at) {
+ 	    fprintf(gpoutfile, "gnuplot.y2_mapping = function(y) { return y; };");
+ 	    fprintf(gpoutfile, "  // replace returned value with %s\n",
+ 			axis_array[FIRST_Y_AXIS].link_udf->definition);
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
index c05ecd2b95..c2644eaa33 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
@@ -20,6 +20,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz;name=a
            file://CVE-2025-31177.patch \
            file://CVE-2025-31178.patch \
            file://CVE-2025-31179.patch \
+           file://CVE-2025-31180.patch \
            "
 SRC_URI:append:class-target = " \
     file://0002-do-not-build-demos.patch \
-- 
2.50.0


