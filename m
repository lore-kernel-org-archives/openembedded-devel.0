Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B78CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 07:45:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.71872.1756799097380007369
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 00:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gG5mo1+m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=134031fe91=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5827aPOK1353899
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Sep 2025 00:44:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=0b3M82Ozf/tT5Qz50Velc+5XTbLP9HLRpEDH9p8JG3M=; b=gG5mo1+mCzm8
	cMLX0v4wW1ltZSj5iBh6lZ3Cmft5AfO2Q5sI5YgOu3rDzoH9la1j/QK48aj5NKge
	Gdct15eeqSL+fXXwFaVlMKtPTb0tRcDv0C/6kv8oe0wE3zNKSIyi5o66x7UGGG/U
	A4DzTnqkbgyQnZWlxyVww3jRuIdMOu/j4b/2pqtvPFHyQ4X8YWFjrO+OuqIszAhB
	g4eXH65pVEQaNnDkr2OJYE9dhEAbMTaxC0Yrb1yajhrRuvrjYFLcJlTWvcUEsqOm
	UGwjg51D8xNYLDpEwXJVCQVQ36vHwRIqxjS1vQzidwlBkLzZmM1bAQZcvlZt7qTb
	aYw7go7Z/g==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48v0tfj4k8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 00:44:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6kxO1fhuNHlG528Y3jsa3HoNBvREJ1zP3qDhcqTV8aOew3L1a610/PjFTL3UxRYbefrglm1jxdzbcHl6s/8YTqQmnJ3BkXovaNP/EW/2HZbIKEIx8sACheRhhi0AnSGE11Xv2wxh7ejJjQFouDIy1ltjzbk405RlKqFHDxGF5SfywK7v00N3NGEGCR9o8tb8yUJWPRqVill1+SfRkYze4ODyZ4larxyxOaOiVf8K/sG63rsh3sK8MBQfYS6trs2/bYzkKFbqy4heOMuoyZKDpSDQodMsecCsU1hb1DEECq/xa04aUEPALF9KlvCRlqmkSoD+UnSDzYcImj5RGbaPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0b3M82Ozf/tT5Qz50Velc+5XTbLP9HLRpEDH9p8JG3M=;
 b=JJGdKkQylErgxRtuTJqb0UcwUmLlLPcGEmX0iOxzA1bFo+IPWhVBnLbQLkK4LKUyZiIdfZnNdMdGoOaqC0bCIHp0tSamdKy41jfvgm1D8ppNRcFh3ywpgompwf/Zox4An8FXexbGYmeOIu2yfQGXfHx5bORAzX9QUuQUfTxNzZImrtjlRue6EocjlgqE3KsFE3zwDasAAOtnDBx6c+6QTJ5wPfBWJDOBp1eeXGjx6hlZBrdOFQO75Z72hwTRDibvVnHRIqYfvZWDGNeNLvLnElEUBDh1u07Buuh6+32M0eq/HbzD7PT5RdNmLCTN+9MuJxETXZArSSGHCr6LMpyiSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 07:44:54 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 07:44:53 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 7/7] gnuplot: fix CVE-2025-31181
Date: Tue,  2 Sep 2025 15:44:32 +0800
Message-ID: <20250902074432.1068537-7-peng.zhang1.cn@windriver.com>
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
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW3PR11MB4748:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d4492ed-d0e9-4a78-c45b-08dde9f49af1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YpPyH0T03+lE4qsSlNWO9J36yti8Apw0kZdh0277kXnAB8RHCKH0TSxmM72M?=
 =?us-ascii?Q?ZvfezrBmJX8XQsrprPmXRrpeRx8UBRHDi9HdMxptcgnmw22NpyinVij6NtXs?=
 =?us-ascii?Q?7ojDKJHriTWFCEiaOf0LGJT5Dh16ur6Xj3Y7rhgYLp82BlikY8FifdZGgXBU?=
 =?us-ascii?Q?3N1jpNRYV5Vn8FUKfDuA5T+QF/0k3OCDORhkdn2iB+EkYzOuYn1mNA96/u6J?=
 =?us-ascii?Q?y6dKpC+hgbORmTZvec8hkmu9JJV8A0eglF+VVpwjS66Pw+TlB9JFVWGHExUO?=
 =?us-ascii?Q?WMwHSu8npzvumlpJ0JJQQcFTe79Dr79OX/lCk1rcKELWr45u87G/9Je1oiKA?=
 =?us-ascii?Q?J70ankj15gx6kkboyZPAOuc/x5MfTL+tuRyQkRwBgZ7tmhdEfpe3Da9aiQwH?=
 =?us-ascii?Q?/DJnZKkSTxRotqIPZI/WdCZeipyZqWGdl4be514AkxZvllSmuvppdoGpwCy8?=
 =?us-ascii?Q?MEAjxnto+Xg0LjON1N5Qbr4X63tdBoFvjtwWvrWSpgSUtEtITJMDby1ZCaTI?=
 =?us-ascii?Q?Mxo7sAvlOrUiNV324RBvH6fclmI8HxDjL75CYl+0BgsRm8B/9e6VhH9aAE7v?=
 =?us-ascii?Q?V3LafiXom/vLZQMfo3Z0DEJDfDXgkn+nN1WLwzSHYYhekAsfFc5JtwLyiFwW?=
 =?us-ascii?Q?OBJ5nUWHKIOmQRCqzVhbjU0Okya/QzQLeVpM35Fr3SDJIT6F4lTbKcetTw7d?=
 =?us-ascii?Q?SvjAtk3jJLRxPXezKoYxlEXAKmrad6B7PSdEM+3P1hp0PXBClNnVDz5VA0Kf?=
 =?us-ascii?Q?3nBl7uhKkgrZ2cGvqK2009uRxfnLT8xzUu3wmahNX3fK6HY4VaToJq1yAI8a?=
 =?us-ascii?Q?5dfiLa5iPqS22bS61cAq19AF//p3y7s7x9j+c1/r8Wx2gRxoE6Rd8fDQiN1A?=
 =?us-ascii?Q?8HC4KvUG6u9rk1w4noI0V00jVXgHgI7B71oGYjB5mapSHNsCzOwYv/+oiX1U?=
 =?us-ascii?Q?FyouUZJn+tr4ICMHwhNs8GK9ImVRF/ZE6+Mk6qNjqNNNGmzihdSnF21etYAw?=
 =?us-ascii?Q?2+cFzkHIS9y9S6qxo+A95kA9UDCDIDpG0c0TcbtfSVN9Bi+l/sMvhl1T8pOq?=
 =?us-ascii?Q?B/H46UdCXJbqwpKy1lEMR8hnFHJoVErJHPffBanePGQj8PmL3d7DOr5gSw1k?=
 =?us-ascii?Q?ezQcpGlh3njkEOun9LFn/5/tfYiesspeD1N7KstmU1sIimRggi4w5vqHnbDI?=
 =?us-ascii?Q?33O4cWIZUXDhDKzWzuuqfumw4bmShrgpF/XGcWVo4uY+YbOx1cGUZcMxDYUz?=
 =?us-ascii?Q?hL667qWCqezWAuE3YMqOy3CrfxwIkncKPV9zCq8wh1PB4fdnFiVGdEarbZ1e?=
 =?us-ascii?Q?De98xSS6/8wBxIl3vemY5elgkvd6kvUjvwb63VGd78O+hEOq6pvP9tjUDdXR?=
 =?us-ascii?Q?f8CZNtvVjb5Qm438U/CkNKcsYRWatb7OREqcxBD4w9z9U7y+7yGQI9zv6aP+?=
 =?us-ascii?Q?OwfTrLu2yZvTM4Ocor5oIjdabLW7lzVU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WcemhGXiQf/Yw3ph4WhH3NIg/s0ATwa8/uiSJNmCvLKMf8Reoacx7PZIckSG?=
 =?us-ascii?Q?ZFg279m9J7pKm035tVy0op+jxaNk2l6jofMMohdEFW/GNZo1AkchmLMklLsT?=
 =?us-ascii?Q?AFOgkvsOQkjM67B4/74K1ds+lpEDSGsGc86aSsvCRUjtXXILdCoofAL5M7Cz?=
 =?us-ascii?Q?fdQ2EteFB0kiv9RXxDZBg8NPtZiZDYNaGYGpRiA4UOb0nz8NRnAPgw2e0Mf9?=
 =?us-ascii?Q?zT4g9aH6jfJKdjofS5O6lpiTVFkQlAeItcf5LBuXkYplO26f9OwRS/buAcVz?=
 =?us-ascii?Q?1uGPb8+S+6MlXQkyMQXhv8v7Pq04b1AvWosAfuKu1O9Jev95lUQlaeHT7Hw7?=
 =?us-ascii?Q?ZwKwmkWxvErokFor1+eCfmeQAiWdAwYe7wIa1UUwadMjkO5sDBJl6AGWLdV3?=
 =?us-ascii?Q?PYZ3Yeymyn1HWTG/52gP7sLt85zdi9INpEQiyh3LWZZKTsfn03O4gdv5gRan?=
 =?us-ascii?Q?akj0QUscQfDHhUUbRyopumDsvB4XcMlzc+/zzBHMEmfzc/KjpDwd7UFYCJFQ?=
 =?us-ascii?Q?AML5FSrqsu0nw3w2FEaYnEoGS7mHDGHnj3fEu6KptlYYIdMOPsmZ9sdjxPB5?=
 =?us-ascii?Q?5kWCIBjIzyzzne7+R3FohusUgxYAPLZW1EL3oyCr9qqPXE4dTeVzPOLhcxz4?=
 =?us-ascii?Q?vBfYgHyF7NXbhHXkDEwUUs6ocZbiK55xTHq0Rcov5Y6yHjcm+g5zb5w76t8h?=
 =?us-ascii?Q?Y8ojNiEkVo47ttIzd/w1U2liaxWldp2qTWkBndNMEGUWRJbUZ1gFkSO4dvY7?=
 =?us-ascii?Q?L2G4MQDRWHZxBTLzA/fGdY62/XIrQt8YlLpe69Ur7INng/d1Or9UCODg8cY7?=
 =?us-ascii?Q?jaa0ybW6cfdblYHlC2tpuVHQtB691IgOBMFiHbMhbK9Yi02ixBFRjGIrWWWz?=
 =?us-ascii?Q?v7kIP587h31elUSrXQAqPE4ngYTvY/w97yTJyPAe17jFJg3EY8tBSFeiylZU?=
 =?us-ascii?Q?zcnbXdVx9+I07EA9ttfG5FsDSRtB9FskXK2LpgoG+TjZYLYxEBtXllkdssqa?=
 =?us-ascii?Q?StHpSAQsYZzwiyBf3shXc1ZFexvHEu0pSrGf9VKhivW45mHqc4SrcjY0S9yF?=
 =?us-ascii?Q?XKtbGe6psFfYZA4Hm/6S4GjLx0znogcVpeq/mSupfkjv8S+LwD9Qr4g7LbWR?=
 =?us-ascii?Q?J47cBVDKpI2JybGsJACsIHvFLdereBCV2TgnF7c1tX6egmUdI2SaCYLysf8P?=
 =?us-ascii?Q?ML11AxgG6fDLBEoix1ctxv+8jXHYONaHqk84zVvqQ8ZoOyheVIBQseCqVt91?=
 =?us-ascii?Q?NDgcqeFdsMO+7P1C/T1wy/BRgyKm8KPlZT3SzQhztDSYqu3zd/T7+/ZidKEe?=
 =?us-ascii?Q?wAqrsb+QQsnUJuLByxN7yx9JHjw82JwbKGPpHMjAJWAjxYuO6/+SyPyjp+I9?=
 =?us-ascii?Q?YxYtwx7hRA+9WB3dPKDAPRgXVeHJ3ylp3Q/ybfmGWwAomQQWJ64X6mDiCv6b?=
 =?us-ascii?Q?MOqHTyb7dYoCI1lV4JyjEKmmFGs94h9KBPu3a6ScrC53PLhDfK0UXKLGFyy6?=
 =?us-ascii?Q?l/PTN2auc+aIrWCUHXuO29DVbB32+0Z/YXaLnOG4aBgWzCyGHLA+PcsnllWN?=
 =?us-ascii?Q?ODZIe/4btaXUXjeFg9BzT0xYgz9zpQ4InorqZMfNTYrdy41qyBdbIUWR6UIt?=
 =?us-ascii?Q?Eg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4492ed-d0e9-4a78-c45b-08dde9f49af1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 07:44:53.9588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/Tmp7/HKIjHokZaw1k4R+aTpL8dq/wH1Puq0rrdc1lDM11PqaynP7ogHXZkPnqCWyCQICvY2LaoIwcPmOFHZXlEQDdXQTqBgG3X4x9qXjE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4748
X-Proofpoint-GUID: 9m_6upJwZF1AqBHOIFozXIRw2VYYLa1i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDA3NiBTYWx0ZWRfX4UkiYvHlrXMT
 oqD3epgzFKO+ccHt9QiFVlT05gG8pYSNpDqu3pFDQCL9qxg+uEBmekcV/Tp0/xq224l699L4P2o
 bRuwAwIjcq7GnigOMc10C3KRQwdHhBBVAEzNwExUl1Pl+mUTSFMejM3XrPfKyFTm9tthRZKwGKc
 ucLsG5/3CCk8sPYavnJWV7fI3YWWxk82SFXqxCXQJNTJrPmzMtlCh1rqEKXbGmZ/h0sgf6ZKjTw
 G91ntvW48m72Ymu4VpzvPsPhE3Ynqj/iA5+SZKOS9bjhKVp+FU0r0nwcWSLLmYVkdBDIQ1QJ62A
 xtfsKl+u/w/puvhjnr4AN3dKaHhAKSFYxKQuJcu7Jsv7nZKAlJrT5dz/6RriZc=
X-Authority-Analysis: v=2.4 cv=XJ0wSRhE c=1 sm=1 tr=0 ts=68b6a078 cx=c_pps
 a=BZcKXadMzMgoE806unv5Vw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=FP58Ms26AAAA:8
 a=t7CeM3EgAAAA:8 a=xWUQyWjik60KuX6Ug6QA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 9m_6upJwZF1AqBHOIFozXIRw2VYYLa1i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 07:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119175

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2025-31181:
A flaw was found in gnuplot. The X11_graphics() function may lead to a
segmentation fault and cause a system crash.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2025-31181]

Upstream patches:
[https://sourceforge.net/p/gnuplot/gnuplot-main/ci/af96c2c1b20383684b1ec2084dab7936f7053031/]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../gnuplot/gnuplot/CVE-2025-31181.patch      | 43 +++++++++++++++++++
 .../recipes-extended/gnuplot/gnuplot_5.4.3.bb |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31181.patch

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31181.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31181.patch
new file mode 100644
index 0000000000..2de4617ff1
--- /dev/null
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot/CVE-2025-31181.patch
@@ -0,0 +1,43 @@
+From 2d9e68278aece7e971815d9c3ec297c5e9bc51bd Mon Sep 17 00:00:00 2001
+From: Ethan A Merritt <merritt@u.washington.edu>
+Date: Tue, 14 Jan 2025 20:56:37 -0800
+Subject: [PATCH] x11: protect against double fclose() if two errors in a row
+
+Bug 2753
+
+CVE: CVE-2025-31181
+Upstream-Status: Backport [https://sourceforge.net/p/gnuplot/gnuplot-main/ci/af96c2c1b20383684b1ec2084dab7936f7053031/]
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ term/x11.trm | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/term/x11.trm b/term/x11.trm
+index 458fcf5f9..1b51a80c8 100644
+--- a/term/x11.trm
++++ b/term/x11.trm
+@@ -856,8 +856,9 @@ X11_atexit()
+ 	/* dont wait(), since they might be -persist */
+ 	X11_ipc = NULL;
+ #ifdef PIPE_IPC
+-	close(ipc_back_fd);
+-	ipc_back_fd = -1;
++	if (ipc_back_fd >= 0)
++	    close(ipc_back_fd);
++	ipc_back_fd = IPC_BACK_CLOSED;
+ #endif
+     }
+ }
+@@ -1412,7 +1413,8 @@ X11_graphics()
+ #ifdef PIPE_IPC
+     /* if we know the outboard driver has stopped, restart it */
+     if (ipc_back_fd == IPC_BACK_CLOSED) {
+-	fclose(X11_ipc);
++	if (X11_ipc > 0)
++	    fclose(X11_ipc);
+ 	X11_ipc = NULL;
+ 	X11_init();
+     }
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
index c2644eaa33..b945cc318d 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.4.3.bb
@@ -21,6 +21,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz;name=a
            file://CVE-2025-31178.patch \
            file://CVE-2025-31179.patch \
            file://CVE-2025-31180.patch \
+           file://CVE-2025-31181.patch \
            "
 SRC_URI:append:class-target = " \
     file://0002-do-not-build-demos.patch \
-- 
2.50.0


